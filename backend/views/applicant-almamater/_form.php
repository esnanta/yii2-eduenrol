<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantAlmamater $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-almamater-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'applicant_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Applicant ID...']],

            'event_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Event ID...']],

            'educational_stage_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Educational Stage ID...']],

            'school_status' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter School Status...']],

            'study_time_length' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Study Time Length...']],

            'tuition_payer' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Tuition Payer...']],

            'residence_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Residence ID...']],

            'distance' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Distance...']],

            'transportation_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Transportation ID...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'deleted_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter deleted_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'date_graduation' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'created_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'updated_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'deleted_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'address_street' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Address Street...','rows' => 6]],

            'address_village' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Address Village...','rows' => 6]],

            'address_sub_district' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Address Sub District...','rows' => 6]],

            'address_city' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Address City...','rows' => 6]],

            'address_province' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Address Province...','rows' => 6]],

            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Description...','rows' => 6]],

            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],

            'phone_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter No Telp...', 'maxlength' => 100]],

            'national_school_principal_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter National School Principal Number...', 'maxlength' => 20]],

            'national_registration_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter National Registration Number...', 'maxlength' => 20]],

            'school_registration_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter School Registration Number...', 'maxlength' => 20]],

            'certificate_serial_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Certificate Serial Number...', 'maxlength' => 15]],

            'examination_serial_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Examination Serial Number...', 'maxlength' => 15]],

            'examination_card_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Examination Card Number...', 'maxlength' => 15]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
