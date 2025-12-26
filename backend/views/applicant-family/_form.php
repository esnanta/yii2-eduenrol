<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantFamily $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-family-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'applicant_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Applicant ID...']],

            'event_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Event ID...']],

            'family_type' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Family Type...']],

            'religion_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Religion ID...']],

            'educational_stage_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Educational Stage ID...']],

            'occupation_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Occupation ID...']],

            'income_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Income ID...']],

            'citizenship_status' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Citizenship Status...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'deleted_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter deleted_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'date_birth' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'created_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'updated_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'deleted_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Description...','rows' => 6]],

            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],

            'birth_place' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Birth Place...', 'maxlength' => 100]],

            'identity_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter No. Identitas...', 'maxlength' => 50]],

            'phone_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter No Telp...', 'maxlength' => 50]],

            'address_street' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Street...', 'maxlength' => 50]],

            'address_village' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Village...', 'maxlength' => 50]],

            'address_sub_district' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Sub District...', 'maxlength' => 50]],

            'address_city' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address City...', 'maxlength' => 50]],

            'address_province' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Province...', 'maxlength' => 50]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
