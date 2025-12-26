<?php

namespace backend\controllers;

use Yii;
use common\models\Applicant;
use common\models\ApplicantSearch;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * ApplicantController implements the CRUD actions for Applicant model.
 */
class ApplicantController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Applicant models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-applicant')) {
            $searchModel = new ApplicantSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            $finalStatusList = Applicant::getArrayFinalStatus();
            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'finalStatusList' => $finalStatusList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single Applicant model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-applicant')){
            $model = $this->findModel($id);
            $finalStatusList    = Applicant::getArrayFinalStatus();
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'finalStatusList' => $finalStatusList
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new Applicant model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-applicant')){
            $model = new Applicant;

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashSaveSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } 
                else {
                    return $this->render('create', [
                        'model' => $model,
                    ]);
                }
            }
            catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Updates an existing Applicant model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-applicant')){
            try {
                $model = $this->findModel($id);

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashUpdateSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('update', [
                        'model' => $model,
                    ]);
                }
            }
            catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing Applicant model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-applicant')){
            $this->findModel($id)->delete();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        }
        else{
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Applicant model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Applicant the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Applicant::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionFinalize($id=null)
    {
        if(Yii::$app->user->can('create-applicant')){

            if(!empty($id)){
                $transaction = \Yii::$app->db->beginTransaction();
                try {

                    $model                  = Applicant::find()->where(['id'=>$id])->one();
                    $finalStatus            = $model->final_status;

                    if($finalStatus==Applicant::FINAL_STATUS_NO){
                        $finalStatus=Applicant::FINAL_STATUS_YES;
                        $model->date_final = date('Y-m-d H:i:s');
                    }else{
                        $finalStatus=Applicant::FINAL_STATUS_NO;
                        $model->date_final = null;
                    }

                    $model->final_status    = $finalStatus;

                    $model->save();
                    $transaction->commit();
                    Yii::$app->getSession()->setFlash('success', ['message' => Yii::t('app', 'Data '.'['.$model->record_number.'] '. $model->title.' '.strip_tags($model->getOneFinalStatus($model->final_status)).' Finalisasi')]);
                }
                catch (\Exception $e) {
                    $transaction->rollBack();
                    throw $e;
                }
            }
            return $this->redirect(['view', 'id'=>$model->id]);

        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
