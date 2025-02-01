<?php

use bajadev\ckeditor\CKEditor;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;
use kartik\widgets\ActiveForm;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var \common\models\Event $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="event-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); 
    echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            
            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 200]],
            
            'date_start' => [
                'type' => Form::INPUT_WIDGET, 
                'widgetClass'=> DateControl::className(),
                'format'=>'date',
            ],

            'date_end' => [
                'type' => Form::INPUT_WIDGET, 
                'widgetClass'=> DateControl::className(),
                'format'=>'date',
            ],             
            
            'location' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Location...','rows' => 6]],

        ]

    ]);   
    
    echo $form->field($model, 'content')->widget(CKEditor::className(), [
        'editorOptions' => [
            'preset' => 'full', // basic, standard, full
            'inline' => false,
            'filebrowserBrowseUrl' => 'browse-images',
            'filebrowserUploadUrl' => 'upload-images',
            'extraPlugins' => 'imageuploader,youtube',
        ],
    ]);     
    
    echo Form::widget([
        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Description...','rows' => 6]],
        ]
    ]);      
    
    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
