<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model common\models\ApplicantSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="applicant-search">

    <?php $form = ActiveForm::begin([
        'action' => ['report', 'export' => 1],
        'method' => 'get',
    ]); ?>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'date_start')->widget(DatePicker::classname(), [
                'options' => ['placeholder' => 'Tanggal Mulai ...'],
                'pluginOptions' => [
                    'autoclose' => true,
                    'format' => 'yyyy-mm-dd'
                ]
            ])->label('Tanggal Mulai'); ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'date_end')->widget(DatePicker::classname(), [
                'options' => ['placeholder' => 'Tanggal Akhir ...'],
                'pluginOptions' => [
                    'autoclose' => true,
                    'format' => 'yyyy-mm-dd'
                ]
            ])->label('Tanggal Akhir'); ?>
        </div>
    </div>

    <br>

    <div class="form-group">
        <?= Html::submitButton('Export to Excel', ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Reset', ['report'], ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
