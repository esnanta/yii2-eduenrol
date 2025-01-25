<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Employment;
use common\models\Item;
use common\models\ItemBrand;
use common\models\ItemUnit;
use common\models\Office;
use common\models\Staff;
use common\models\Theme;
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
                        'actions' => ['login', 'error','create-owner','create-reguler'],
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

            return $this->render('index', [
                'office'=>$office,
                'staff'=>$staff,
                'authItemName'=>$authItemName,
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
        
        $canCreateReguler = false;
        if ($authItemName == Yii::$app->params['userRoleAdmin'] ||
            $authItemName == Yii::$app->params['userRoleOwner']) {
            $canCreateReguler = true;
        }

        if ($canCreateReguler==true) {
            $model          = new User;
            $userTypeList[] = [Yii::$app->params['userRoleReguler'] => 'Staff'];

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
    
    public function actionTestCreateDummy()
    {
        
/**
 * DAFTAR MENU
 * 01 Fuel Sales        OK
 * 02 Item Brand        OK
 * 03 Item Category     OK
 * 04 Item              OK
 * 05 Item Unit         OK
 * 06 Purchase          OK
 * 07 Purchase Receive  OK
 * 08 Supplier          OK
 * 09 Warehouse         OK
 * 10 Work Shift        OK
 */
        
        $faker = \Faker\Factory::create();
        
        
        $transaction    = Yii::$app->db->beginTransaction();
        try {
            $officeId   = 1;
            $userId     = 1;

            $itemUnit = new ItemUnit;
            $itemUnit->office_id = $officeId;
            $itemUnit->title = 'Kg '.$itemUnit->office->title;
            $itemUnit->description = 'Kilogram';
            $itemUnit->save();
            
            $itemBrand = new ItemBrand;
            $itemBrand->office_id = $officeId;
            $itemBrand->title = 'Pertamina - '.$itemBrand->office->title;
            $itemBrand->description = 'Indonesia';
            $itemBrand->save();
            
            $itemBrand = new ItemBrand;
            $itemBrand->office_id = $officeId;
            $itemBrand->title = 'Petronas - '.$itemBrand->office->title;
            $itemBrand->description = 'Malaysia';
            $itemBrand->save();
            
            
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        } catch (\Throwable $e) {
            $transaction->rollBack();
            throw $e;
        }

        for ($i=0; $i<1; $i++) {
            $office = new Office();
            $office->title = 'Office - '.$i;
            $office->phone_number = '0192837465';
            $office->address = 'Jl. Office iterator '.$i;
            $office->save();
            
            $workShift = new \common\models\WorkShift;
            $workShift->office_id = $office->id;
            $workShift->
            
            $supplier = new \common\models\Supplier;
            $supplier->office_id = $office->id;
            $supplier->title = 'Supplier - '.$i;
            $supplier->phone_number = '0192837465';
            $supplier->address = 'Jl. Supplier iterator '.$i;
            $supplier->save();
        }
    }
    
    public function testCreateTransaction()
    {
        $cacheCloud = new CacheService();
        $officeId   = $cacheCloud->getOfficeId();
        $staffId    = $cacheCloud->getStaffId();
        for ($i=0; $i<50; $i++) {
            $dateIssued = date('Y-m-d', strtotime('+'.mt_rand(0, 30).' days'));

            $model = new FuelSales();
            $model->date_issued = $dateIssued;
            $model->office_id=$officeId;
            $model->work_shift_id=rand(1, 2);
            $model->staff_id=$staffId;
            $model->warehouse_id=1;
            $model->fuel_id=rand(1, 2);
            $model->start_liter = rand(100000, 150000);
            $model->final_liter = rand(150001, 200000);
            $model->save();
        }
    }
}
