<?php

use bajadev\ckeditor\CKEditor;
use common\models\User;
use kartik\datecontrol\DateControl;
use kartik\detail\DetailView;
use kartik\select2\Select2;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var \common\models\Event $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$create = Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'], ['class' => 'pull-right detail-button','style'=>'padding:0 5px']);
?>
<div class="event-view">

    <?= DetailView::widget([
        'model' => $model,
        'condensed' => false,
        'hover' => true,
        'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
        'panel' => [
            'heading' => $this->title.$create,
            'type' => DetailView::TYPE_DEFAULT,
        ],
        'attributes' => [
            [
                'attribute'=>'title',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute'=>'date_start',
                'format'=> DateControl::FORMAT_DATE,
                'type'=>DetailView::INPUT_WIDGET,
                'widgetOptions'=>[
                    'class'=>DateControl::classname(),
                    'type'=>DateControl::FORMAT_DATE,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'date_end',
                'format'=> DateControl::FORMAT_DATE,
                'type'=>DetailView::INPUT_WIDGET,
                'widgetOptions'=>[
                    'class'=>DateControl::classname(),
                    'type'=>DateControl::FORMAT_DATE,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            'location:ntext',
            [
                'attribute'=>'is_active',
                'format'=>'html',
                'value'=>($model->is_active!=null) ? $model->getOneIsActive($model->is_active):'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'is_active', 'prompt' => '', 'disabled'=>false],
                'items' => $isActiveList,
                'widgetOptions'=>[
                    'class'=> Select2::className(),
                    'data'=>$isActiveList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'is_open_registration',
                'format'=>'html',
                'value'=>($model->is_open_registration!=null) ? $model->getOneIsOpenRegistration($model->is_open_registration):'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'is_open_registration', 'prompt' => '', 'disabled'=>false],
                'items' => $isOpenRegistrationList,
                'widgetOptions'=>[
                    'class'=> Select2::className(),
                    'data'=>$isOpenRegistrationList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'is_using_comingsoon',
                'format'=>'html',
                'value'=>($model->is_using_comingsoon!=null) ? $model->getOneIsUsingComingsoon($model->is_using_comingsoon):'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'is_using_comingsoon', 'prompt' => '', 'disabled'=>false],
                'items' => $isUsingComingSoonList,
                'widgetOptions'=>[
                    'class'=> Select2::className(),
                    'data'=>$isUsingComingSoonList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            'days_for_comingsoon',
            
            [
                'group'=>true,
                'rowOptions'=>['class'=>'default']
            ], 
            
            [
                'attribute'=>'content', 
                'format'=>'html',
                'value'=>$model->content,
                'type'=>DetailView::INPUT_WIDGET, 
                'widgetOptions'=>[
                    'class'=> CKEditor::className(),
                    'editorOptions' => [
                        'preset' => 'full', // basic, standard, full
                        'inline' => false,
                        'filebrowserBrowseUrl' => 'browse-images',
                        'filebrowserUploadUrl' => 'upload-images',
                        'extraPlugins' => 'imageuploader,youtube',
                    ],                      
                ],              
            ],             

            [
                'attribute'=>'description', 
                'format'=>'html',
                'type'=>DetailView::INPUT_TEXTAREA,                    
            ], 
            
            [
                'group'=>true,
                'rowOptions'=>['class'=>'default']
            ],                            
            [
                'columns' => [
                    [
                        'attribute'=>'created_at', 
                        'format'=>'date',
                        'type'=>DetailView::INPUT_HIDDEN,      
                        'valueColOptions'=>['style'=>'width:30%']
                    ],  
                    [
                        'attribute'=>'updated_at', 
                        'format'=>'date',
                        'type'=>DetailView::INPUT_HIDDEN, 
                        'valueColOptions'=>['style'=>'width:30%']
                    ],                                
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'created_by',
                        'value'=>($model->created_by!=null) ? User::getName($model->created_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'updated_by',
                        'value'=>($model->updated_by!=null) ? User::getName($model->updated_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],                                
                ],
            ],
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => Yii::$app->user->can('update-event'),
    ]) ?>

</div>
