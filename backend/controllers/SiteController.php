<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Applicant;
use common\models\Employment;
use common\models\Event;
use common\models\Office;
use common\models\Staff;
use common\service\CacheService;
use common\models\login\User;
use Yii;
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
                        'actions' => ['logout', 'index','chart','message','flush','summary'],
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

            // Cari event yang aktif
            $activeEvent = Event::find()
                ->where(['is_active' => 1])
                ->one();

            $applicantCount = 0;
            if ($activeEvent) {
                // Hitung jumlah pendaftar untuk event yang aktif
                $applicantCount = Applicant::find()
                    ->where(['event_id' => $activeEvent->id])
                    ->count();
            }

            return $this->render('index', [
                'office'=>$office,
                'staff'=>$staff,
                'authItemName'=>$authItemName,
                'applicantCount' => $applicantCount,
                'activeEvent' => $activeEvent,
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
