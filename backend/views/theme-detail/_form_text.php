<?php

use yii\helpers\Html;
use bajadev\ckeditor\CKEditor;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\widgets\FileInput;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\ThemeDetail $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="theme-detail-form">

    <?php $form = ActiveForm::begin([
        'type' => ActiveForm::TYPE_HORIZONTAL,
        'options'=>['enctype'=>'multipart/form-data'] 
    ]); 
    
//DELETE?    
//    echo Form::widget([
//
//        'model' => $model,
//        'form' => $form,
//        'columns' => 1,
//        'attributes' => [
//
//            'theme_id' => [
//                'type' => Form::INPUT_WIDGET, 
//                'widgetClass'=> Select2::class,
//                'options' => [
//                    'data' => $dataList,
//                    'options' => ['placeholder' => 'Choose Theme', 'disabled'=>false],
//                ],                            
//                'pluginOptions' => [
//                    'allowClear' => true
//                ],                            
//            ],   
//            
//            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],
//            'token' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Token...', 'maxlength' => 5]],
//        ]
//
//    ]);

    if($editor==true){
        echo $form->field($model, 'content')->widget(CKEditor::class, [
            'editorOptions' => [
                'preset' => 'full', // basic, standard, full
                'inline' => false,
                'filebrowserBrowseUrl' => 'browse-images',
                'filebrowserUploadUrl' => 'upload-images',
                'extraPlugins' => 'imageuploader',
            ],
        ]);   
    }
    else{
        echo Form::widget([

            'model' => $model,
            'form' => $form,
            'columns' => 1,
            'attributes' => [                
                'content' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Content...', 'maxlength' => 500]],
            ]
    
        ]);
    }

//    echo Form::widget([
//
//        'model' => $model,
//        'form' => $form,
//        'columns' => 1,
//        'attributes' => [
//            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Description...','rows' => 6]],           
//        ]
//
//    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
