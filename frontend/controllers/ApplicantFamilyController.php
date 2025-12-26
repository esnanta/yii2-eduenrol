<?php

namespace frontend\controllers;

use common\models\Applicant;
use common\service\DataListService;
use Yii;
use common\models\ApplicantFamily;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * ApplicantFamilyController implements the CRUD actions for ApplicantFamily model.
 */
class ApplicantFamilyController extends Controller
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

    /**
     * Displays a single Applicant model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($type,$title=null)
    {
        if(Yii::$app->user->can('update-applicant')){
            $applicant      = $this->findModelByUser(Yii::$app->user->identity->id);
            $familyTypeId   = ApplicantFamily::FAMILY_TYPE_FATHER;

            if($type==ApplicantFamily::FAMILY_TYPE_MOTHER){
                $familyTypeId   = ApplicantFamily::FAMILY_TYPE_MOTHER;
            }
            elseif($type==ApplicantFamily::FAMILY_TYPE_GUARDIAN){
                $familyTypeId   = ApplicantFamily::FAMILY_TYPE_GUARDIAN;
            }

            $editMode   = ($applicant->final_status == Applicant::FINAL_STATUS_YES) ? false : true;

            $checkApplicantFamily = ApplicantFamily::find()
                ->where(['applicant_id'=>$applicant->id, 'family_type'=>$familyTypeId])
                ->one();

            if(empty($checkApplicantFamily)){
                ////////////////////////////////////////////////////////////////
                $newFamily                  = new ApplicantFamily();
                $newFamily->applicant_id    = $applicant->id;
                $newFamily->family_type     = $familyTypeId;
                $newFamily->save();
            }

            $model      = ApplicantFamily::find()->where([
                'applicant_id'=>$applicant->id,
                'family_type'=>$familyTypeId,
            ])->one();

            $familyTypeList         = ApplicantFamily::getArrayModule();
            $religionList           = DataListService::getReligion();
            $educationalStageList   = DataListService::getEducationalStage();
            $occupationList         = DataListService::getOccupation();
            $incomeList             = DataListService::getIncome();
            $citizenshipList        = ApplicantFamily::getArrayCitizenshipStatus();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['applicant-family/view', 'type' => $type, 'title'=>$applicant->title]);
            }
            else {
                return $this->render('view', [
                    'model'                 => $model,
                    'familyTypeList'        => $familyTypeList,
                    'religionList'          => $religionList,
                    'educationalStageList'  => $educationalStageList,
                    'occupationList'        => $occupationList,
                    'incomeList'            => $incomeList,
                    'citizenshipList'       => $citizenshipList,
                    'editMode'              => $editMode
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }
}
