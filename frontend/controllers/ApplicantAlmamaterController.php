<?php

namespace frontend\controllers;

use common\models\Applicant;
use common\service\DataListService;
use Yii;
use common\models\ApplicantAlmamater;
use common\models\ApplicantAlmamaterSearch;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * ApplicantAlmamaterController implements the CRUD actions for ApplicantAlmamater model.
 */
class ApplicantAlmamaterController extends Controller
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
     * Lists all ApplicantAlmamater models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-applicantalmamater')){
                            $searchModel = new ApplicantAlmamaterSearch;
                    $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

                    return $this->render('index', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
                    ]);
                    }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single ApplicantAlmamater model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-applicantalmamater')){
            $model = $this->findModel($id);

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', ['model' => $model]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new ApplicantAlmamater model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-applicantalmamater')){
            $model = new ApplicantAlmamater;

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
     * Updates an existing ApplicantAlmamater model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-applicantalmamater')){
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
     * Deletes an existing ApplicantAlmamater model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-applicantalmamater')){
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
     * Finds the ApplicantAlmamater model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ApplicantAlmamater the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ApplicantAlmamater::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * Displays a single Applicant model.
     * @param integer $id
     * @return mixed
     */
    public function actionProfile($edu,$title=null)
    {
        if(Yii::$app->user->can('update-applicant')){

            $applicant  = $this->findModelByUser(Yii::$app->user->identity->id);
            $model      = ApplicantAlmamater::find()->where([
                'applicant_id'=>$applicant->id,
                'educational_stage_id'=>$edu])->one();

            if(empty($model)){

                $applicantAlmamater = new ApplicantAlmamater;
                $applicantAlmamater->applicant_id = $applicant->id;
                $applicantAlmamater->educational_stage_id = $edu;
                $applicantAlmamater->save();

                $model = ApplicantAlmamater::find()->where([
                    'applicant_id'=>$applicant->id,
                    'educational_stage_id'=>$edu])->one();
            }

            $editMode               = !(($applicant->final_status == Applicant::FINAL_STATUS_YES));

            $educationalStageList   = DataListService::getEducationalStage();
            $residenceList          = DataListService::getResidence();
            $transportationList     = DataListService::getTransportation();
            $schoolStatusList       = ApplicantAlmamater::getArraySchoolStatus();
            $tuitionPayerList       = ApplicantAlmamater::getArrayTuitionPayer();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['applicant-almamater/almamater', 'edu'=>$edu, 'title'=>$model->title]);
            } else {
                return $this->render('almamater', [
                    'model'                 => $model,
                    'educationalStageList'  => $educationalStageList,
                    'residenceList'         => $residenceList,
                    'transportationList'    => $transportationList,
                    'schoolStatusList'      => $schoolStatusList,
                    'tuitionPayerList'      => $tuitionPayerList,
                    'editMode'              => $editMode
                ]);
            }
        }
        else{
            Yii::$app->getSession()->setFlash('error', ['message' => Yii::t('app', Helper::getAccessDenied())]);
            throw new ForbiddenHttpException;
        }
    }

}
