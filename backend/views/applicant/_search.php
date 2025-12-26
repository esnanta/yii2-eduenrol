<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'event_id') ?>

    <?= $form->field($model, 'user_id') ?>

    <?= $form->field($model, 'email') ?>

    <?= $form->field($model, 'record_number') ?>

    <?php // echo $form->field($model, 'family_card_number') ?>

    <?php // echo $form->field($model, 'identity_number') ?>

    <?php // echo $form->field($model, 'birth_certificate_number') ?>

    <?php // echo $form->field($model, 'title') ?>

    <?php // echo $form->field($model, 'nick_name') ?>

    <?php // echo $form->field($model, 'gender_status') ?>

    <?php // echo $form->field($model, 'birth_place') ?>

    <?php // echo $form->field($model, 'date_birth') ?>

    <?php // echo $form->field($model, 'religion_id') ?>

    <?php // echo $form->field($model, 'citizenship_status') ?>

    <?php // echo $form->field($model, 'address_street') ?>

    <?php // echo $form->field($model, 'address_village') ?>

    <?php // echo $form->field($model, 'address_sub_district') ?>

    <?php // echo $form->field($model, 'address_city') ?>

    <?php // echo $form->field($model, 'address_province') ?>

    <?php // echo $form->field($model, 'phone_number') ?>

    <?php // echo $form->field($model, 'hobby') ?>

    <?php // echo $form->field($model, 'blood_type') ?>

    <?php // echo $form->field($model, 'height') ?>

    <?php // echo $form->field($model, 'weight') ?>

    <?php // echo $form->field($model, 'head_circle') ?>

    <?php // echo $form->field($model, 'number_of_sibling') ?>

    <?php // echo $form->field($model, 'number_of_dependent') ?>

    <?php // echo $form->field($model, 'number_of_step_sibling') ?>

    <?php // echo $form->field($model, 'birth_order') ?>

    <?php // echo $form->field($model, 'child_status') ?>

    <?php // echo $form->field($model, 'native_language') ?>

    <?php // echo $form->field($model, 'illness') ?>

    <?php // echo $form->field($model, 'disability') ?>

    <?php // echo $form->field($model, 'file_name') ?>

    <?php // echo $form->field($model, 'final_status') ?>

    <?php // echo $form->field($model, 'date_final') ?>

    <?php // echo $form->field($model, 'approval_status') ?>

    <?php // echo $form->field($model, 'date_approval') ?>

    <?php // echo $form->field($model, 'approved_by') ?>

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
