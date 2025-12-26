<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantAlmamaterSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-almamater-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'applicant_id') ?>

    <?= $form->field($model, 'event_id') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'national_school_principal_number') ?>

    <?php // echo $form->field($model, 'national_registration_number') ?>

    <?php // echo $form->field($model, 'school_registration_number') ?>

    <?php // echo $form->field($model, 'educational_stage_id') ?>

    <?php // echo $form->field($model, 'school_status') ?>

    <?php // echo $form->field($model, 'phone_number') ?>

    <?php // echo $form->field($model, 'date_graduation') ?>

    <?php // echo $form->field($model, 'study_time_length') ?>

    <?php // echo $form->field($model, 'tuition_payer') ?>

    <?php // echo $form->field($model, 'certificate_serial_number') ?>

    <?php // echo $form->field($model, 'examination_serial_number') ?>

    <?php // echo $form->field($model, 'examination_card_number') ?>

    <?php // echo $form->field($model, 'address_street') ?>

    <?php // echo $form->field($model, 'address_village') ?>

    <?php // echo $form->field($model, 'address_sub_district') ?>

    <?php // echo $form->field($model, 'address_city') ?>

    <?php // echo $form->field($model, 'address_province') ?>

    <?php // echo $form->field($model, 'residence_id') ?>

    <?php // echo $form->field($model, 'distance') ?>

    <?php // echo $form->field($model, 'transportation_id') ?>

    <?php // echo $form->field($model, 'description') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'deleted_at') ?>

    <?php // echo $form->field($model, 'deleted_by') ?>

    <?php // echo $form->field($model, 'verlock') ?>

    <?php // echo $form->field($model, 'uuid') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
