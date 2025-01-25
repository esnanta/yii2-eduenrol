<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantDocumentSearch $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-document-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'applicant_id') ?>

    <?= $form->field($model, 'event_id') ?>

    <?= $form->field($model, 'document_id') ?>

    <?= $form->field($model, 'title') ?>

    <?php // echo $form->field($model, 'quantity') ?>

    <?php // echo $form->field($model, 'file_name') ?>

    <?php // echo $form->field($model, 'document_status') ?>

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
