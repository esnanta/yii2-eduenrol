<?php

namespace backend\controllers;

use Yii;
use common\models\Transportation;
use common\models\TransportationSearch;
use yii\web\Controller;
use yii\db\StaleObjectException;
use yii\web\NotFoundHttpException;
use yii\web\ForbiddenHttpException;
use yii\filters\VerbFilter;

use common\helper\MessageHelper;
/**
 * TransportationController implements the CRUD actions for Transportation model.
 */
class TransportationController extends Controller
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
     * Lists all Transportation models.
     * @return mixed
     */
    public function actionIndex()
    {
        if(Yii::$app->user->can('index-transportation')){
                            $searchModel = new TransportationSearch;
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
     * Displays a single Transportation model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        if(Yii::$app->user->can('view-transportation')){
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
     * Creates a new Transportation model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if(Yii::$app->user->can('create-transportation')){
            $model = new Transportation;

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
     * Updates an existing Transportation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        if(Yii::$app->user->can('update-transportation')){
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
     * Deletes an existing Transportation model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws ForbiddenHttpException
     */
    public function actionDelete($id)
    {
        if(Yii::$app->user->can('delete-transportation')){
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
     * Finds the Transportation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Transportation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Transportation::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
