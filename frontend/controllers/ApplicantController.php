<?php

namespace frontend\controllers;

use common\service\DataListService;
use Yii;
use common\models\Applicant;
use yii\web\Controller;
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
     * Displays a single Applicant model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($title=null)
    {
        if(Yii::$app->user->can('update-applicant')){
            $model = $this->findModelByUser(Yii::$app->user->identity->id);

            if(empty($model)){

                $applicant = new Applicant;
                $applicant->user_id = Yii::$app->user->identity->id;
                $applicant->save();

                $model = $this->findModelByUser(Yii::$app->user->identity->id);
            }

            $model->date_birth      = (empty($model->date_birth)) ? time() : $model->date_birth;

            $religionList           = DataListService::getReligion();
            $citizenshipList        = Applicant::getArrayCitizenshipStatus();
            $ganderList             = Applicant::getArrayGenderStatus();
            $bloodTypeList          = Applicant::getArrayBloodType();
            $childStatusList        = Applicant::getArrayChildStatus();

            $editMode           = ($model->final_status == Applicant::FINAL_STATUS_YES) ? false : true;

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['applicant/view', 'title'=>$model->title]);
            } else {
                return $this->render('view', [
                    'model'             => $model,
                    'religionList'      => $religionList,
                    'citizenshipList'   => $citizenshipList,
                    'ganderList'        => $ganderList,
                    'bloodTypeList'     => $bloodTypeList,
                    'childStatusList'   => $childStatusList,
                    'editMode'          => $editMode
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
