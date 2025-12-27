<?php

namespace frontend\controllers;

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
use yii\web\UploadedFile;
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

    public function actionIndex()
    {
        if(Yii::$app->user->can('index-applicantdocument')){
            $searchModel = new ApplicantDocumentSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionView($id)
    {
        if(Yii::$app->user->can('view-applicantdocument')){

            $applicantList = ArrayHelper::map(Applicant::find()
                ->where(['user_id' => Yii::$app->user->identity->id])
                ->asArray()->all(), 'id', 'title');

            $eventList = ArrayHelper::map(Event::find()
                ->where(['is_active' => Event::IS_ACTIVE_ENABLED])
                ->asArray()->all(), 'id', 'title');

            $documentList = ArrayHelper::map(Document::find()
                ->asArray()->all(), 'id', 'title');

            return $this->render('view', [
                'model' => $this->findModel($id),
                'applicantList' => $applicantList,
                'eventList' => $eventList,
                'documentList' => $documentList,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionCreate()
    {
        if(Yii::$app->user->can('create-applicantdocument')){
            $model = new ApplicantDocument(['scenario' => 'create']);
            $applicant  = Applicant::find()->where(['user_id' => Yii::$app->user->identity->id])->one();
            $event = Event::find()->where(['is_active' => Event::IS_ACTIVE_ENABLED])->one();

            $documentList = ArrayHelper::map(Document::find()->asArray()->all(), 'id', 'title');

            $model->applicant_id = $applicant->id;
            $model->event_id = $event->id;

            if ($model->load(Yii::$app->request->post())) {
                $model->file = UploadedFile::getInstance($model, 'file');
                if ($model->validate()) {
                    $this->uploadFile($model);
                    if ($model->save(false)) {
                        MessageHelper::getFlashSaveSuccess();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                }
            }

            return $this->render('create', [
                'model' => $model,
                'documentList' => $documentList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-applicantdocument')){
            $model = $this->findModel($id);
            $model->scenario = 'update';
            $documentList = ArrayHelper::map(Document::find()->asArray()->all(), 'id', 'title');
            $oldFileName = $model->file_name;

            if ($model->load(Yii::$app->request->post())) {
                $model->file = UploadedFile::getInstance($model, 'file');
                if ($model->validate()) {
                    if ($model->file) {
                        $this->deleteFile($oldFileName);
                        $this->uploadFile($model);
                    } else {
                        $model->file_name = $oldFileName;
                    }

                    if ($model->save(false)) {
                        MessageHelper::getFlashUpdateSuccess();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                }
            }

            return $this->render('update', [
                'model' => $model,
                'documentList' => $documentList,
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-applicantdocument')){
            $model = $this->findModel($id);
            $this->deleteFile($model->file_name);
            $model->delete();
            MessageHelper::getFlashDeleteSuccess();
            return $this->redirect(['index']);
        } else {
            MessageHelper::getFlashLoginInfo();
            throw new ForbiddenHttpException;
        }
    }

    protected function findModel($id)
    {
        if (($model = ApplicantDocument::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    private function getUploadPath()
    {
        return Yii::getAlias('@frontend/web/uploads/applicant-documents');
    }

    private function uploadFile(ApplicantDocument &$model)
    {
        if ($model->file) {
            $path = $this->getUploadPath();
            if (!is_dir($path)) {
                mkdir($path, 0777, true);
            }
            $fileName = $model->applicant_id . '_' . time() . '.' . $model->file->extension;
            $filePath = $path . '/' . $fileName;
            if ($model->file->saveAs($filePath)) {
                $model->file_name = $fileName;
            }
        }
    }

    private function deleteFile($fileName)
    {
        if ($fileName) {
            $filePath = $this->getUploadPath() . '/' . $fileName;
            if (is_file($filePath)) {
                unlink($filePath);
            }
        }
    }
}
