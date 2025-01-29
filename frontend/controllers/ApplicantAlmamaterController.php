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
     * Displays a single Applicant model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($edu,$title=null)
    {
        if(Yii::$app->user->can('update-applicantalmamater')){

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
                return $this->redirect(['applicant-almamater/view', 'edu'=>$edu, 'title'=>$model->title]);
            } else {
                return $this->render('view', [
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
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the Applicant model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return array|\yii\db\ActiveRecord the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModelByUser($id)
    {
        if (($model = Applicant::find()->where(['user_id'=>$id])->one()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
