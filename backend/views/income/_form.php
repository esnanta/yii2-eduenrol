<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Income $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="income-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'sequence' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Urutan...']],

            'created_at' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_at...']],

            'updated_at' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_at...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Description...','rows' => 6]],

            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
