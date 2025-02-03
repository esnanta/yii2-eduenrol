<?php

namespace frontend\controllers;

use common\models\Applicant;
use common\models\Course;
use common\service\DataListService;
use Yii;
use common\models\ApplicantGrade;
use common\models\ApplicantGradeSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * ApplicantGradeController implements the CRUD actions for ApplicantGrade model.
 */
class ApplicantGradeController extends Controller
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
     * Lists all ApplicantGrade models.
     * @return mixed
     */
    public function actionIndex($sem,$title=null)
    {
        if (Yii::$app->user->can('index-applicant')) {
            $applicant = $this->findModelByUser(Yii::$app->user->identity->id);
            $applicantGradeList = ApplicantGrade::findAll([
                'applicant_id' => $applicant->id,
                'semester_id' => $sem,
            ]);

            $courseList = DataListService::getCourse();
            $semesterList = DataListService::getSemester();

            if (empty($applicantGradeList)):
                $courseListNotArray = Course::find()->orderBy(['sequence' => SORT_ASC])->all();
                foreach ($courseListNotArray as $course):
                    $newGrade = new ApplicantGrade();
                    $newGrade->applicant_id = $applicant->id;
                    $newGrade->course_id = $course->id;
                    $newGrade->title = $course->title;
                    $newGrade->semester_id = $sem;
                    $newGrade->grade = 0;
                    $newGrade->save();
                endforeach;
            endif;

            $searchModel = new ApplicantGradeSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
            $dataProvider->query->andWhere('applicant_id = '.$applicant->id);
            $dataProvider->query->andWhere('semester_id = '.$sem);
            $dataProvider->pagination->pageSize = 10;
            $dataProvider->setSort([
                'defaultOrder' => [
                    'course_id' => SORT_ASC,
                ]
            ]);


            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'courseList' => $courseList,
                'semesterList' => $semesterList
            ]);

        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single ApplicantGrade model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-applicant')){
            $model = $this->findModel($id);
            $courseList = DataListService::getCourse();
            $semesterList = DataListService::getSemester();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'courseList'=>$courseList,
                    'semesterList' => $semesterList
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

    /**
     * Finds the ApplicantGrade model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ApplicantGrade the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ApplicantGrade::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
