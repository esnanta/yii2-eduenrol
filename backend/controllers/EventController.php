<?php

namespace backend\controllers;

use common\helper\MessageHelper;
use common\models\Event;
use common\models\EventSearch;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * EventController implements the CRUD actions for Event model.
 */
class EventController extends Controller
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
    
    public function actions() {

        return [
            'browse-images' => [
                'class' => 'backend\editor\BrowseAction',
                'quality' => 100,
                'maxWidth' => 900,
                'maxHeight' => 900,
                'useHash' => true,
                'url' => '@web/uploads/event/',
                'path' => '@backend/web/uploads/event/',
            ],
            'upload-images' => [
                'class' => 'backend\editor\UploadAction',
                'quality' => 100,
                'maxWidth' => 900,
                'maxHeight' => 900,
                'useHash' => true,
                'url' => '@web/uploads/event/',
                'path' => '@backend/web/uploads/event/',
            ],
        ];
    }
    
    /**
     * Lists all Event models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-event')){
            $searchModel = new EventSearch;
            $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

            $isOpenRegistrationList     = Event::getArrayIsOpenRegistration();
            $isUsingComingSoonList      = Event::getArrayIsUsingComingsoon();
            $isActiveList               = Event::getArrayIsActive();
            
            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
                'isOpenRegistrationList' => $isOpenRegistrationList,
                'isUsingComingSoonList' => $isUsingComingSoonList,
                'isActiveList' => $isActiveList
            ]);           
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }        
    }

    /**
     * Displays a single Event model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-event')){
            $model = $this->findModel($id);

            $isOpenRegistrationList     = Event::getArrayIsOpenRegistration();
            $isUsingComingSoonList      = Event::getArrayIsUsingComingsoon();
            $isActiveList               = Event::getArrayIsActive();
            
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('view', [
                    'model' => $model,
                    'isOpenRegistrationList' => $isOpenRegistrationList,
                    'isUsingComingSoonList' => $isUsingComingSoonList,
                    'isActiveList' => $isActiveList
                ]);
            }           
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }          
            
    }

    /**
     * Creates a new Event model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-event')){
            $model = new Event;
            $isOpenRegistrationList     = Event::getArrayIsOpenRegistration();
            $isUsingComingSoonList      = Event::getArrayIsUsingComingsoon();
            $isActiveList               = Event::getArrayIsActive();

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                    'isOpenRegistrationList' => $isOpenRegistrationList,
                    'isUsingComingSoonList' => $isUsingComingSoonList,
                    'isActiveList' => $isActiveList
                ]);
            }          
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }         

    }

    /**
     * Updates an existing Event model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-event')){
            $model = $this->findModel($id);

            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }            
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }         
            
    }

    /**
     * Deletes an existing Event model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-event')){
            $this->findModel($id)->delete();

            return $this->redirect(['index']);            
        }
        else{
            MessageHelper::getFlashAccessDenied();
            throw new ForbiddenHttpException;
        }         

    }

    /**
     * Finds the Event model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Event the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Event::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
