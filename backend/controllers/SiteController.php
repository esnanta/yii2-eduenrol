<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Applicant;
use common\models\Employment;
use common\models\Event;
use common\models\Office;
use common\models\Staff;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use common\service\CacheService;
use common\models\login\User;
use Yii;
use yii\db\Query;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'rules' => [
                    [
                        'actions' => ['login', 'error','create-owner','create-reguler','update-auth'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index','chart','message',
                            'flush','summary','report'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                    'flush' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     * @throws \Exception
     */
    public function actionIndex()
    {
        
        $cacheCloud     = new CacheService();
        $authItemName   = $cacheCloud->getAuthItemName();

        if ($authItemName == Yii::$app->params['userRoleRegular']) :
            $this->redirect(str_replace('admin/site', '', 'site/index'));
        endif;
        
        if (!Yii::$app->user->isGuest) {
            $cacheCloud     = new CacheService;
            $officeId       = $cacheCloud->getOfficeId();
            $staffId        = $cacheCloud->getStaffId();
            $authItemName   = $cacheCloud->getAuthItemName();

            $office         = Office::find()->where(['id' => $officeId])->one();
            $staff          = Staff::find()->where(['id' => $staffId])->one();

            $activeEvent = Event::find()
                ->where(['is_active' => Event::IS_ACTIVE_ENABLED])
                ->one();

            $applicantCount = 0;
            $finalizedCount = 0;
            $notFinalizedCount = 0;
            $approvalRejectCount = 0;
            $finalizedMaleCount = 0;
            $finalizedFemaleCount = 0;
            $dailyApplicantLabels = [];
            $dailyApplicantData = [];
            $dailyFinalizedData = [];
            if ($activeEvent) {
                $stats = (new Query())
                    ->select([
                        'applicantCount' => 'COUNT(*)',
                        'finalizedCount' => 'SUM(CASE WHEN final_status = ' . Applicant::FINAL_STATUS_YES . ' THEN 1 ELSE 0 END)',
                        'notFinalizedCount' => 'SUM(CASE WHEN final_status = ' . Applicant::FINAL_STATUS_NO . ' THEN 1 ELSE 0 END)',
                        'approvalRejectCount' => 'SUM(CASE WHEN approval_status = ' . Applicant::APPROVAL_STATUS_REJECT . ' THEN 1 ELSE 0 END)',
                        'finalizedMaleCount' => 'SUM(CASE WHEN final_status = ' . Applicant::FINAL_STATUS_YES . ' AND gender_status = ' . Applicant::GENDER_STATUS_MALE . ' THEN 1 ELSE 0 END)',
                        'finalizedFemaleCount' => 'SUM(CASE WHEN final_status = ' . Applicant::FINAL_STATUS_YES . ' AND gender_status = ' . Applicant::GENDER_STATUS_FEMALE . ' THEN 1 ELSE 0 END)',
                    ])
                    ->from(Applicant::tableName())
                    ->where(['event_id' => $activeEvent->id])
                    ->one();

                $applicantCount = (int)($stats['applicantCount'] ?? 0);
                $finalizedCount = (int)($stats['finalizedCount'] ?? 0);
                $notFinalizedCount = (int)($stats['notFinalizedCount'] ?? 0);
                $approvalRejectCount = (int)($stats['approvalRejectCount'] ?? 0);
                $finalizedMaleCount = (int)($stats['finalizedMaleCount'] ?? 0);
                $finalizedFemaleCount = (int)($stats['finalizedFemaleCount'] ?? 0);

                // Ambil data pendaftar harian untuk chart
                if (!empty($activeEvent->date_start) && !empty($activeEvent->date_end)) {
                    $eventStartDateStr = $activeEvent->date_start;
                    $eventEndDateStr = $activeEvent->date_end;

                    $startDate = new \DateTime($eventStartDateStr);
                    $endDate = new \DateTime($eventEndDateStr);
                    $interval = new \DateInterval('P1D');
                    $dateRange = new \DatePeriod($startDate, $interval, (clone $endDate)->modify('+1 day'));

                    $dailyCounts = (new Query())
                        ->select(['date' => 'DATE(created_at)', 'count' => 'COUNT(*)'])
                        ->from(Applicant::tableName())
                        ->where(['event_id' => $activeEvent->id])
                        ->andWhere(['between', 'DATE(created_at)', $eventStartDateStr, $eventEndDateStr])
                        ->groupBy(['date'])
                        ->indexBy('date')
                        ->all();

                    $dailyFinalizedCounts = (new Query())
                        ->select(['date' => 'DATE(date_final)', 'count' => 'COUNT(*)'])
                        ->from(Applicant::tableName())
                        ->where(['event_id' => $activeEvent->id])
                        ->andWhere(['final_status' => Applicant::FINAL_STATUS_YES])
                        ->andWhere(['not', ['date_final' => null]])
                        ->andWhere(['between', 'DATE(date_final)', $eventStartDateStr, $eventEndDateStr])
                        ->groupBy(['date'])
                        ->indexBy('date')
                        ->all();

                    foreach ($dateRange as $date) {
                        $formattedDate = $date->format('Y-m-d');
                        $dailyApplicantLabels[] = $date->format('d M');
                        $dailyApplicantData[] = (int)($dailyCounts[$formattedDate]['count'] ?? 0);
                        $dailyFinalizedData[] = (int)($dailyFinalizedCounts[$formattedDate]['count'] ?? 0);
                    }
                }
            }

            return $this->render('index', [
                'office' => $office,
                'staff' => $staff,
                'authItemName' => $authItemName,
                'applicantCount' => $applicantCount,
                'activeEvent' => $activeEvent,
                'finalizedCount' => $finalizedCount,
                'notFinalizedCount' => $notFinalizedCount,
                'approvalRejectCount' => $approvalRejectCount,
                'finalizedMaleCount' => $finalizedMaleCount,
                'finalizedFemaleCount' => $finalizedFemaleCount,
                'dailyApplicantLabels' => $dailyApplicantLabels,
                'dailyApplicantData' => $dailyApplicantData,
                'dailyFinalizedData' => $dailyFinalizedData,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionFlush()
    {
        if (Yii::$app->user->identity->isAdmin) {
            $cacheCloud = new CacheService();
            $cacheCloud->Flush();
            $this->redirect('index');
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionReport(){
        
        // 1. Find the active event
        $activeEvent = Event::find()
            ->where(['is_active' => Event::IS_ACTIVE_ENABLED])
            ->one();

        if (!$activeEvent) {
            Yii::$app->session->setFlash('error', 'Tidak ada event pendaftaran yang sedang aktif.');
            return $this->redirect(['index']);
        }

        // 2. Fetch applicants for the active event
        $applicants = Applicant::find()
            ->where(['event_id' => $activeEvent->id])
            ->with('religion') // Eager load religion to prevent N+1 query problem
            ->orderBy(['id' => SORT_ASC])
            ->all();

        // 3. Create a new Spreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setTitle('Data Pendaftar');

        // 4. Set headers
        $headers = [
            'A1' => 'No.',
            'B1' => 'Nomor Pendaftaran',
            'C1' => 'Nama Lengkap',
            'D1' => 'Jenis Kelamin',
            'E1' => 'Tempat Lahir',
            'F1' => 'Tanggal Lahir',
            'G1' => 'Agama',
            'H1' => 'Alamat',
            'I1' => 'No. Telepon',
            'J1' => 'Email',
            'K1' => 'Status Finalisasi',
            'L1' => 'Status Persetujuan',
            'M1' => 'Tanggal Daftar',
        ];

        foreach ($headers as $cell => $header) {
            $sheet->setCellValue($cell, $header);
            $sheet->getStyle($cell)->getFont()->setBold(true);
        }

        // 5. Populate data rows
        $genderStatusArray = Applicant::getArrayGenderStatus();
        $finalStatusArray = Applicant::getArrayFinalStatus();
        $approvalStatusArray = Applicant::getArrayApprovalStatus();
        $row = 2;
        foreach ($applicants as $index => $applicant) {
            $sheet->setCellValue('A' . $row, $index + 1);
            $sheet->setCellValue('B' . $row, $applicant->record_number);
            $sheet->setCellValue('C' . $row, $applicant->title);
            $sheet->setCellValue('D' . $row, $genderStatusArray[$applicant->gender_status] ?? 'N/A');
            $sheet->setCellValue('E' . $row, $applicant->birth_place);
            $sheet->setCellValue('F' . $row, Yii::$app->formatter->asDate($applicant->date_birth));
            $sheet->setCellValue('G' . $row, $applicant->religion ? $applicant->religion->title : 'N/A');
            $sheet->setCellValue('H' . $row, $applicant->address_street);
            $sheet->setCellValue('I' . $row, $applicant->phone_number);
            $sheet->setCellValue('J' . $row, $applicant->email);
            $sheet->setCellValue('K' . $row, $finalStatusArray[$applicant->final_status] ?? 'N/A');
            $sheet->setCellValue('L' . $row, $approvalStatusArray[$applicant->approval_status] ?? 'N/A');
            $sheet->setCellValue('M' . $row, Yii::$app->formatter->asDatetime($applicant->created_at));
            $row++;
        }

        // Auto-size columns for better readability
        foreach (range('A', 'M') as $columnID) {
            $sheet->getColumnDimension($columnID)->setAutoSize(true);
        }

        // 6. Set response headers and output the file to the browser
        $filename = 'Laporan Pendaftar - ' . preg_replace('/[^A-Za-z0-9\-\s]/', '', $activeEvent->title) . ' - ' . date('Y-m-d') . '.xlsx';
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $filename . '"');
        header('Cache-Control: max-age=0');

        $writer = new Xlsx($spreadsheet);
        try {
            $writer->save('php://output');
            exit();
        } catch (\PhpOffice\PhpSpreadsheet\Writer\Exception $e) {
            Yii::$app->session->setFlash('error', 'Gagal membuat file excel: ' . $e->getMessage());
            return $this->redirect(['index']);
        }
    }

    public function actionCreateOwner()
    {
        if (Yii::$app->user->identity->isAdmin) {
            $model          = new User;
            $userTypeList[] = [Yii::$app->params['userRoleOwner'] => 'Owner'];

            $transaction    = Yii::$app->db->beginTransaction();
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    Yii::$app->db->createCommand()->insert('tx_auth_assignment', [
                        'item_name'         => $model->user_type,
                        'user_id'           => $model->id,
                        'created_at'        => time(),
                    ])->execute();

                    $office = new Office;
                    $office->user_id        = $model->id;
                    $office->title          = $model->office_title;
                    $office->email          = $model->email;
                    $office->save();

                    $employment = new Employment;
                    $employment->office_id  = $office->id; //OFFICE
                    $employment->title      = 'Manager';
                    $employment->sequence   = '1';
                    $employment->save();

                    $staff = new Staff;
                    $staff->office_id       = $office->id; //OFFICE
                    $staff->user_id         = $model->id; //USER
                    $staff->employment_id   = $employment->id; //EMPLOYMENT
                    $staff->title           = $model->staff_title;
                    $staff->save();

                    $themTypeList   = Theme::getArrayThemeType();
                    foreach ($themTypeList as $i => $themeType) {
                        $theme = new Theme();
                        $theme->office_id = $office->id;
                        $theme->theme_type = $i;
                        $theme->title = $themeType;
                        $theme->description = $themeType;
                        $theme->save();
                    }

                    $transaction->commit();

                    return $this->redirect(['/user/admin/index']);
                } else {
                    return $this->render('create_user_owner', [
                        'model' => $model,
                        'userTypeList'=>$userTypeList
                    ]);
                }
            } catch (\Exception $e) {
                $transaction->rollBack();
                throw $e;
            } catch (\Throwable $e) {
                $transaction->rollBack();
                throw $e;
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
    
    
    public function actionCreateReguler()
    {
        
        $cacheCloud     = new CacheService;
        $officeId   = $cacheCloud->getOfficeId();
        $authItemName   = $cacheCloud->getAuthItemName();
        
        $canCreateRegular = false;
        if ($authItemName == Yii::$app->params['userRoleAdmin'] ||
            $authItemName == Yii::$app->params['userRoleOwner']) {
            $canCreateRegular = true;
        }

        if ($canCreateRegular==true) {
            $model          = new User;
            $userTypeList[] = [Yii::$app->params['userRoleRegular'] => 'Staff'];

            $employmentList = ArrayHelper::map(Employment::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');
            
            $transaction    = Yii::$app->db->beginTransaction();
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    Yii::$app->db->createCommand()->insert('tx_auth_assignment', [
                        'item_name'         => $model->user_type,
                        'user_id'           => $model->id,
                        'created_at'        => time(),
                    ])->execute();

                    $staff = new Staff;
                    $staff->office_id       = $officeId; //OFFICE
                    $staff->user_id         = $model->id; //USER
                    $staff->employment_id   = $model->employment_id; //EMPLOYMENT
                    $staff->title           = $model->staff_title;
                    $staff->save();

                    $transaction->commit();

                    return $this->redirect(['/staff/index']);
                } else {
                    return $this->render('create_user_reguler', [
                        'model' => $model,
                        'employmentList' => $employmentList,
                        'userTypeList' => $userTypeList,
                    ]);
                }
            } catch (\Exception $e) {
                $transaction->rollBack();
                throw $e;
            } catch (\Throwable $e) {
                $transaction->rollBack();
                throw $e;
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionUpdateAuth()
    {
        $userList = User::find()->all();
        $no = 0;
        foreach ($userList as $user) {
            if ($user->id != 1) {

                Yii::$app->db->createCommand()->insert('tx_auth_assignment', [
                    'item_name'         => Yii::$app->params['userRoleRegular'],
                    'user_id'           => $user->id,
                    'created_at'        => time(),
                ])->execute();

                $no++;
            }
        }
        Yii::$app->session->setFlash(
            'info',
            ['message' => Yii::t(
                'app',
                'Update ' . $no . ' records.'
            )]
        );
        $this->redirect(['/site/index']);
    }
}
