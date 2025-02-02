<?php

namespace frontend\controllers;

use common\models\ApplicantAlmamater;
use common\models\ApplicantFamily;
use common\models\EducationalStage;
use common\models\Event;
use common\models\Semester;
use common\service\DataListService;
use Yii;
use common\models\Applicant;
use yii\db\StaleObjectException;
use yii\helpers\FileHelper;
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
    public static $pathTmpCrop= '/uploads/tmp';

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

    public function actions()
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . self::$pathTmpCrop;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }

        return [
            'avatar' => [
                'class' => 'budyaga\cropper\actions\UploadAction',
                'url' => Yii::$app->urlManager->baseUrl.self::$pathTmpCrop,
                'path' => str_replace('frontend', 'backend', Yii::getAlias('@webroot')).self::$pathTmpCrop,
                //'name' => Yii::$app->security->generateRandomString(),
                'width'=> '400',
                'height'=> '400' ,
                'maxSize'=> 4097152,
            ]
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

    public function actionUpdate($id,$title=null)
    {
        if(Yii::$app->user->can('update-applicant')){

            $model          = $this->findModelByUser(Yii::$app->user->identity->id);
            $oldFile        = $model->getImageFile();

            if ($model->load(Yii::$app->request->post())) {
                // process uploaded image file instance
                $image = $model->uploadImage();

                if ($model->save()) {
                    // upload only if valid uploaded file instance found
                    if ($image !== false) { // delete old and overwrite
                        file_exists($oldFile) ? unlink($oldFile) : '' ;
                        $path = $model->getImageFile();
                        $image->saveAs($path);
                    }
                    return $this->redirect(['view','id'=>$model->id, 'title'=>$model->title]);
                }
                else {
                    // error in saving model
                }
            }
            else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
        else{
            Yii::$app->getSession()->setFlash('error', ['message' => Yii::t('app', Helper::getAccessDenied())]);
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

    /**
     * Displays a single Applicant model.
     * @param integer $id
     * @return mixed
     */
    public function actionSummary($title=null) {
        if(Yii::$app->user->can('view-applicant')){
            $model  = $this->findModelByUser(Yii::$app->user->identity->id);
            $event  = Event::find()->where(['is_active'=>Event::IS_ACTIVE_ENABLED])->one();

            if(empty($model)){
                $applicant = new Applicant;
                $applicant->user_id = Yii::$app->user->identity->id;
                $applicant->save();
                $model = $this->findModelByUser(Yii::$app->user->identity->id);
            }

            $applicant              = $this->findModelByUser(Yii::$app->user->identity->id);
            $applicantAlmamaterSD   = ApplicantAlmamater::find()->where(['applicant_id'=>$applicant->id,'educational_stage_id'=> EducationalStage::ELEMENTARY_SCHOOL])->one();
            $applicantAlmamaterSMP  = ApplicantAlmamater::find()->where(['applicant_id'=>$applicant->id,'educational_stage_id'=> EducationalStage::JUNIOR_HIGH_SCHOOL])->one();
            $applicantFather        = ApplicantFamily::find()->where(['applicant_id'=>$applicant->id,'family_type'=>ApplicantFamily::FAMILY_TYPE_FATHER])->one();
            $applicantMother        = ApplicantFamily::find()->where(['applicant_id'=>$applicant->id,'family_type'=>ApplicantFamily::FAMILY_TYPE_MOTHER])->one();
            $applicantGuardian      = ApplicantFamily::find()->where(['applicant_id'=>$applicant->id,'family_type'=>ApplicantFamily::FAMILY_TYPE_GUARDIAN])->one();

            $semesters              = DataListService::getSemester();
            $courses                = DataListService::getCourse();
            $documents              = DataListService::getDocument();


            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['summary', 'title'=>$model->title]);
            } else {
                return $this->render('summary', [
                    'applicant'                 => $model,
                    'event'                     => $event,
                    'applicantAlmamaterSD'      => $applicantAlmamaterSD,
                    'applicantAlmamaterSMP'    => $applicantAlmamaterSMP,
                    'applicantFather'           => $applicantFather,
                    'applicantMother'           => $applicantMother,
                    'applicantGuardian'         => $applicantGuardian,
                    'semesters'                 => $semesters,
                    'courses'                   => $courses,
                    'documents'                 => $documents,
                ]);
            }
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionPrintDocument($title=null){

        $logoLeft               = ThemeDetail::getByToken(Yii::$app->params['ContentToken_LogoReport1']);
        $logoRight              = ThemeDetail::getByToken(Yii::$app->params['ContentToken_LogoReport2']);

        $applicant              = $this->findModelByUser(Yii::$app->user->identity->id);

        $applicantAlmamaterSD   = ApplicantAlmamater::find()->where([
            'applicant_id'=>$applicant->id,'educational_stage_id'=> EducationalStage::SD_SEDERAJAT])->one();
        $applicantAlmamaterSMP  = ApplicantAlmamater::find()->where([
            'applicant_id'=>$applicant->id,'educational_stage_id'=> EducationalStage::SMP_SEDERAJAT])->one();

        $applicantFather        = ApplicantFamily::find()->where(['applicant_id'=>$applicant->id,'family_type'=>ApplicantFamily::FAMILY_TYPE_FATHER])->one();
        $applicantMother        = ApplicantFamily::find()->where(['applicant_id'=>$applicant->id,'family_type'=>ApplicantFamily::FAMILY_TYPE_MOTHER])->one();
        $applicantGuardian      = ApplicantFamily::find()->where(['applicant_id'=>$applicant->id,'family_type'=>ApplicantFamily::FAMILY_TYPE_GUARDIAN])->one();
        $applicantDocuments     = ApplicantDocument::find()->where(['applicant_id'=>$applicant->id])->all();

        $courses                = Course::find()->orderBy(['id'=>SORT_ASC])->all();
        $semesters              = Semester::find()->orderBy(['id'=>SORT_ASC])->all();

        $userList               = ArrayHelper::map(User::find()->asArray()->where(['id'=>$applicant->user_id])->all(), 'id', 'email');
        $religionList           = ArrayHelper::map(Religion::find()->asArray()->all(), 'id','title');
        $applicantList          = ArrayHelper::map(Applicant::find()->asArray()->where(['user_id'=>$applicant->user_id])->all(), 'id', 'title');

        $residenceList          = ArrayHelper::map(Residence::find()->asArray()->all(), 'id','title');
        $transportationList     = ArrayHelper::map(Transportation::find()->asArray()->all(), 'id','title');
        $educationalStageList   = ArrayHelper::map(EducationalStage::find()->asArray()->all(), 'id','title');
        $occupationList         = ArrayHelper::map(Occupation::find()->asArray()->all(), 'id','title');
        $incomeList             = ArrayHelper::map(Income::find()->asArray()->all(), 'id','title');

        $ganderList             = Applicant::getArrayGenderStatus();
        $bloodTypeList          = Applicant::getArrayBloodType();
        $childStatusList        = Applicant::getArrayChildStatus();
        $citizenshipList        = Applicant::getArrayCitizenshipStatus();
        $tuitionPayerList       = ApplicantAlmamater::getArrayTuitionPayer();
        $schoolStatusList       = ApplicantAlmamater::getArraySchoolStatus();
        $familyTypeList         = ApplicantFamily::getArrayModule();

        return $this->render('print_document', [

            'logoLeft'              => $logoLeft,
            'logoRight'             => $logoRight,

            'applicant'             => $applicant,
            'applicantAlmamaterSD'  => $applicantAlmamaterSD,
            'applicantAlmamaterSMP' => $applicantAlmamaterSMP,
            'applicantFather'       => $applicantFather,
            'applicantMother'       => $applicantMother,
            'applicantGuardian'     => $applicantGuardian,
            'applicantDocuments'    => $applicantDocuments,

            'courses'               => $courses,
            'semesters'             => $semesters,

            'userList'              => $userList,
            'religionList'          => $religionList,
            'citizenshipList'       => $citizenshipList,
            'ganderList'            => $ganderList,
            'bloodTypeList'         => $bloodTypeList,
            'childStatusList'       => $childStatusList,

            'applicantList'         => $applicantList,

            'residenceList'         => $residenceList,
            'transportationList'    => $transportationList,
            'tuitionPayerList'      => $tuitionPayerList,
            'educationalStageList'  => $educationalStageList,
            'schoolStatusList'      => $schoolStatusList,
            'familyTypeList'        => $familyTypeList,
            'occupationList'        => $occupationList,
            'incomeList'            => $incomeList,

            'editMode'              => false
        ]);

    }


    public function actionPrintCard($title=null){

        //CACHE CONTENT
        $logoLeft           = '-';
        $logoRight          = '-';
        $keteranganKartu    = '-';


        $applicant              = $this->findModelByUser(Yii::$app->user->identity->id);
        $applicantAlmamaterSD   = ApplicantAlmamater::find()->where([
            'applicant_id'=>$applicant->id,'educational_stage_id'=> EducationalStage::ELEMENTARY_SCHOOL])->one();
        $applicantAlmamaterSMP   = ApplicantAlmamater::find()->where([
            'applicant_id'=>$applicant->id,'educational_stage_id'=> EducationalStage::JUNIOR_HIGH_SCHOOL])->one();

        $courses                = DataListService::getCourse();
        $semesters              = DataListService::getSemester();

        return $this->render('print_card', [

            'logoLeft'              => $logoLeft,
            'logoRight'             => $logoRight,
            'keteranganKartu'       => $keteranganKartu,
            'applicant'             => $applicant,
            'applicantAlmamaterSD'  => $applicantAlmamaterSD,
            'applicantAlmamaterSMP' => $applicantAlmamaterSMP,
            'courses'               => $courses,
            'semesters'             => $semesters

        ]);

    }
}
