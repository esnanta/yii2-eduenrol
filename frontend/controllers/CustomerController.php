<?php

namespace frontend\controllers;

use common\helper\MessageHelper;
use common\models\Area;
use common\models\Cities;
use common\models\Customer;
use common\models\CustomerSearch;
use common\models\Districts;
use common\models\Provinces;
use common\models\Subdistricts;
use common\service\CacheService;
use Yii;
use yii\db\StaleObjectException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * CustomerController implements the CRUD actions for Customer model.
 */
class CustomerController extends Controller
{

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Customer models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-customer')) {
            $searchModel = new CustomerSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            $cacheCloud = new CacheService();
            $officeId   = $cacheCloud->getOfficeId();

            $areaList = ArrayHelper::map(Area::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'areaList' => $areaList,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Customer model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-customer')) {
            $model = $this->findModel($id);
            $officeId = $model->office_id;

            $areaList = ArrayHelper::map(Area::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $provinceList = ArrayHelper::map(Provinces::find()
                ->asArray()->all(), 'prov_id', 'prov_name');

            $cityList = ArrayHelper::map(Cities::find()
                ->where(['prov_id' => $model->province_id])
                ->asArray()->all(), 'city_id', 'city_name');

            $districtList = ArrayHelper::map(Districts::find()
                ->where(['city_id' => $model->city_id])
                ->asArray()->all(), 'dis_id', 'dis_name');

            $subdistrictList = ArrayHelper::map(Subdistricts::find()
                ->where(['dis_id' => $model->district_id])
                ->asArray()->all(), 'subdis_id', 'subdis_name');

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'areaList' => $areaList,
                    'provinceList' => $provinceList,
                    'cityList' => $cityList,
                    'districtList' => $districtList,
                    'subdistrictList' => $subdistrictList
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Customer model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-customer')) {
            $cacheCloud = new CacheService();
            $officeId = $cacheCloud->getOfficeId();

            $model = new Customer;
            $model->office_id = $officeId;

            $areaList = ArrayHelper::map(Area::find()
                ->where(['office_id' => $officeId])
                ->asArray()->all(), 'id', 'title');

            $provinceList = ArrayHelper::map(Provinces::find()
                ->asArray()->all(), 'prov_id', 'prov_name');

            $cityList = ArrayHelper::map(Cities::find()
                ->asArray()->all(), 'city_id', 'city_name');

            $districtList = ArrayHelper::map(Districts::find()
                ->asArray()->all(), 'dis_id', 'dis_name');

            $subdistrictList = ArrayHelper::map(Subdistricts::find()
                ->asArray()->all(), 'dis_id', 'dis_name');

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
                        'model' => $model,
                        'areaList' => $areaList,
                        'provinceList' => $provinceList,
                        'cityList' => $cityList,
                        'districtList' => $districtList,
                        'subdistrictList' => $subdistrictList
                    ]);
                }
            } catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Customer model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-customer')) {
            try {
                $model = $this->findModel($id);

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                    ]);
                }
            } catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Customer model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-customer')) {
            $this->findModel($id)->delete();

            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Customer model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Customer the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Customer::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionGetCities()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $parents = $_POST['depdrop_parents'];
            $id = $parents[0];
            if ($id!='') {
                $list  = Cities::find()->where(['prov_id'=>$id])->asArray()->all();

                if ($id != null && count($list) > 0) {
                    foreach ($list as $i => $model) {
                        $out[] = ['id' => $model['city_id'], 'name' => $model['city_name']];
                    }
                    // Shows how you can preselect a value
                    return ['output' => $out, 'selected' => null];
                }
            }
        }
        return ['output'=>'', 'selected'=>''];
    }

    public function actionGetDistricts()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $parents = $_POST['depdrop_parents'];
            $id = $parents[0];
            if ($id!='') {
                $list  = Districts::find()->where(['city_id'=>$id])->asArray()->all();

                if ($id != null && count($list) > 0) {
                    foreach ($list as $i => $model) {
                        $out[] = ['id' => $model['dis_id'], 'name' => $model['dis_name']];
                    }
                    // Shows how you can preselect a value
                    return ['output' => $out, 'selected' => null];
                }
            }
        }
        return ['output'=>'', 'selected'=>''];
    }

    public function actionGetSubdistricts()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $out = [];
        if (isset($_POST['depdrop_parents'])) {
            $parents = $_POST['depdrop_parents'];
            $id = $parents[0];
            if ($id!='') {
                $list  = Subdistricts::find()->where(['dis_id'=>$id])->asArray()->all();

                if ($id != null && count($list) > 0) {
                    foreach ($list as $i => $model) {
                        $out[] = ['id' => $model['subdis_id'], 'name' => $model['subdis_name']];
                    }
                    // Shows how you can preselect a value
                    return ['output' => $out, 'selected' => null];
                }
            }

        }
        return ['output'=>'', 'selected'=>''];
    }
}
