<?php

namespace backend\controllers;

use common\models\Applicant;
use common\models\Document;
use common\models\Event;
use Yii;
use common\models\ApplicantDocument;
use common\models\ApplicantDocumentSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;

/**
 * ApplicantDocumentController implements the CRUD actions for ApplicantDocument model.
 */
class ApplicantDocumentController extends Controller
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
     * Lists all ApplicantDocument models.
     * @return mixed
     */
    public function actionIndex()
    {
        if (Yii::$app->user->can('index-applicantdocument')) {
            $searchModel = new ApplicantDocumentSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $event = Event::find()->where(['is_active' => Event::IS_ACTIVE_ENABLED])->one();

            $applicantList = ArrayHelper::map(Applicant::find()
                ->where(['event_id'=>$event->id])
                ->asArray()->all(), 'id', 'title');

            $documentList = ArrayHelper::map(Document::find()
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'applicantList' => $applicantList,
                'documentList' => $documentList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Displays a single ApplicantDocument model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('view-applicantdocument')) {
            $model = $this->findModel($id);

            $applicantList = ArrayHelper::map(Applicant::find()
                ->where(['user_id' => Yii::$app->user->identity->id])
                ->asArray()->all(), 'id', 'title');

            $eventList = ArrayHelper::map(Event::find()
                ->where(['is_active' => Event::IS_ACTIVE_ENABLED])
                ->asArray()->all(), 'id', 'title');

            $documentList = ArrayHelper::map(Document::find()
                ->asArray()->all(), 'id', 'title');

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                MessageHelper::getFlashUpdateSuccess();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $this->findModel($id),
                    'applicantList' => $applicantList,
                    'eventList' => $eventList,
                    'documentList' => $documentList,
                ]);
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Creates a new ApplicantDocument model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('create-applicantdocument')) {
            $model = new ApplicantDocument;

            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    MessageHelper::getFlashSaveSuccess();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    return $this->render('create', [
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
     * Updates an existing ApplicantDocument model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('update-applicantdocument')) {
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
            } catch (StaleObjectException $e) {
                throw new StaleObjectException('The object being updated is outdated.');
            }
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Deletes an existing ApplicantDocument model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     */
    public function actionDelete($id)
    {
        if (Yii::$app->user->can('delete-applicantdocument')) {
            $this->findModel($id)->delete();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    /**
     * Finds the ApplicantDocument model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ApplicantDocument the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ApplicantDocument::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
