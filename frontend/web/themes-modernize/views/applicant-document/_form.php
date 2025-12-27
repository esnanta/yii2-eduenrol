<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\select2\Select2;
use kartik\file\FileInput;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantDocument $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-document-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL, 'options' => ['enctype' => 'multipart/form-data']]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            'document_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $documentList,
                    'options' => ['placeholder' => 'Choose Document Type'],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],

            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],

            'file' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => FileInput::class,
                'options' => [
                    'pluginOptions' => [
                        'showPreview' => true,
                        'showCaption' => true,
                        'showRemove' => true,
                        'showUpload' => false,
                        'allowedFileExtensions' => ['pdf'],
                        'initialPreview' => [
                            !$model->isNewRecord && !empty($model->file_name) ? Html::a($model->file_name, ['/uploads/applicant-documents/' . $model->file_name], ['target' => '_blank']) : null,
                        ],
                        'initialPreviewAsData' => false,
                        'initialCaption' => $model->file_name,
                    ]
                ]
            ],
        ]
    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
