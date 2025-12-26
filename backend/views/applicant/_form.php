<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Applicant $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [

            'event_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Event ID...']],

            'user_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter User ID...']],

            'gender_status' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Gender Status...']],

            'religion_id' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Religion ID...']],

            'citizenship_status' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Citizenship Status...']],

            'blood_type' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Blood Type...']],

            'height' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Height...']],

            'weight' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Weight...']],

            'head_circle' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Head Circle...']],

            'number_of_sibling' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Number Of Sibling...']],

            'number_of_dependent' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Number Of Dependent...']],

            'number_of_step_sibling' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Number Of Step Sibling...']],

            'birth_order' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Birth Order...']],

            'child_status' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Child Status...']],

            'final_status' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Final Status...']],

            'approval_status' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Approval Status...']],

            'date_approval' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Date Approval...']],

            'approved_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Approved By...']],

            'created_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter created_by...']],

            'updated_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter updated_by...']],

            'deleted_by' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter deleted_by...']],

            'verlock' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Verlock...']],

            'date_birth' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'date_final' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'created_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'updated_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'deleted_at' => ['type' => Form::INPUT_WIDGET, 'widgetClass' => DateControl::classname(),'options' => ['type' => DateControl::FORMAT_DATE]],

            'hobby' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Hobby...','rows' => 6]],

            'illness' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Illness...','rows' => 6]],

            'disability' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Disability...','rows' => 6]],

            'description' => ['type' => Form::INPUT_TEXTAREA, 'options' => ['placeholder' => 'Enter Description...','rows' => 6]],

            'email' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Email...', 'maxlength' => 100]],

            'title' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Title...', 'maxlength' => 100]],

            'nick_name' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Nick Name...', 'maxlength' => 100]],

            'native_language' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Native Language...', 'maxlength' => 100]],

            'file_name' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter File Name...', 'maxlength' => 100]],

            'record_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Record Number...', 'maxlength' => 15]],

            'family_card_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Family Card Number...', 'maxlength' => 50]],

            'identity_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter No. Identitas...', 'maxlength' => 50]],

            'birth_certificate_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Birth Certificate Number...', 'maxlength' => 50]],

            'birth_place' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Birth Place...', 'maxlength' => 50]],

            'address_street' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Street...', 'maxlength' => 50]],

            'address_village' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Village...', 'maxlength' => 50]],

            'address_sub_district' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Sub District...', 'maxlength' => 50]],

            'address_city' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address City...', 'maxlength' => 50]],

            'address_province' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Address Province...', 'maxlength' => 50]],

            'phone_number' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter No Telp...', 'maxlength' => 50]],

            'uuid' => ['type' => Form::INPUT_TEXT, 'options' => ['placeholder' => 'Enter Uuid...', 'maxlength' => 36]],

        ]

    ]);

    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
