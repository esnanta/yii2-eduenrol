<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\ResendForm $model
 */

$this->title = Yii::t('user', 'Request new confirmation message');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container d-flex justify-content-center align-items-center min-vh-50">
    <div class="card shadow" style="max-width: 400px; width: 100%;">
        <div class="card-header bg-info text-white text-center">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">
            <?php $form = ActiveForm::begin([
                'id' => 'resend-form',
                'enableAjaxValidation' => true,
                'enableClientValidation' => false,
            ]); ?>

            <?= $form->field($model, 'email', [
                'inputOptions' => [
                    'class' => 'form-control form-control-lg',
                    'autofocus' => true,
                ],
            ])->label(Yii::t('user', 'Email')) ?>

            <?= Html::submitButton(Yii::t('user', 'Continue'), [
                'class' => 'btn btn-primary w-100',
            ]) ?>

            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
