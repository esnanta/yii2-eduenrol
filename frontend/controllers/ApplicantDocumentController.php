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

            $applicant = Applicant::find()->where(['user_id' => Yii::$app->user->identity->id])->one();

            if ($applicant) {
                $dataProvider->query->andWhere(['applicant_id' => $applicant->id]);
            } else {
                $dataProvider->query->andWhere('0=1');
            }

            $documentList = ArrayHelper::map(Document::find()
                ->asArray()->all(), 'id', 'title');

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'documentList' => $documentList
            ]);
        } else {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }
    }

    public function actionView($id)
    {
        if (!Yii::$app->user->can('view-applicantdocument')) {
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }

        $model = $this->findModel($id);

        // Optional: pastikan user hanya melihat dokumennya sendiri
        $applicant = Applicant::find()
            ->where(['user_id' => Yii::$app->user->identity->id])
            ->one();

        if (!$applicant || $model->applicant_id !== $applicant->id) {
            throw new ForbiddenHttpException('Anda tidak berhak mengakses dokumen ini.');
        }

        $applicantList = ArrayHelper::map(
            Applicant::find()
                ->where(['user_id' => Yii::$app->user->identity->id])
                ->asArray()
                ->all(),
            'id',
            'title'
        );

        $eventList = ArrayHelper::map(
            Event::find()
                ->where(['is_active' => Event::IS_ACTIVE_ENABLED])
                ->asArray()
                ->all(),
            'id',
            'title'
        );

        $documentList = ArrayHelper::map(
            Document::find()->asArray()->all(),
            'id',
            'title'
        );

        return $this->render('view', [
            'model' => $model,
            'applicantList' => $applicantList,
            'eventList' => $eventList,
            'documentList' => $documentList,
        ]);
    }


    public function actionViewFile($id)
    {
        if (!Yii::$app->user->can('view-applicantdocument')) {
            throw new ForbiddenHttpException;
        }

        $model = $this->findModel($id);

        // Validasi ownership (sama seperti actionView)
        $applicant = Applicant::find()
            ->where(['user_id' => Yii::$app->user->identity->id])
            ->one();

        if (!$applicant || $model->applicant_id !== $applicant->id) {
            throw new ForbiddenHttpException('Anda tidak berhak mengakses file ini.');
        }

        if (!$model->file_name) {
            throw new NotFoundHttpException('File tidak tersedia.');
        }

        $filePath = Yii::getAlias('@backendWeb/uploads/applicant-documents/')
            . $model->file_name;

        if (!is_file($filePath)) {
            throw new NotFoundHttpException('File tidak ditemukan di server.');
        }

        return Yii::$app->response->sendFile(
            $filePath,
            $model->file_name,
            [
                'inline' => true, // penting untuk iframe PDF
            ]
        );
    }

    public function actionCreate()
    {
        if(Yii::$app->user->can('create-applicantdocument')){
            $model = new ApplicantDocument(['scenario' => 'create']);
            $applicant  = Applicant::find()->where(['user_id' => Yii::$app->user->identity->id])->one();
            $event = Event::find()->where(['is_active' => Event::IS_ACTIVE_ENABLED])->one();

            $documentList = ArrayHelper::map(Document::find()->asArray()->all(), 'id', 'title');

            $model->applicant_id = $applicant->id;
            $model->office_id = $applicant->office_id;
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
                        // Delete old file
                        $oldFilePath = $model->getUploadPath() . '/' . $oldFileName;
                        if (is_file($oldFilePath)) {
                            unlink($oldFilePath);
                        }
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
            $this->findModel($id)->delete();
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

    private function uploadFile(ApplicantDocument &$model)
    {
        if ($model->file) {
            $path = $model->getUploadPath();
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
}
