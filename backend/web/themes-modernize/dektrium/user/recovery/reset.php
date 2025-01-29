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
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\RecoveryForm $model
 */

$this->title = Yii::t('user', 'Reset your password');
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container d-flex justify-content-center align-items-center min-vh-50">
    <div class="card shadow" style="max-width: 400px; width: 100%;">
        <div class="card-header bg-info text-white text-center">
            <h3 class="h5 mb-0"><?= Html::encode($this->title) ?></h3>
        </div>
        <div class="card-body">
            <?php $form = ActiveForm::begin([
                'id' => 'password-recovery-form',
                'enableAjaxValidation' => true,
                'enableClientValidation' => false,
            ]); ?>

            <?= $form->field($model, 'password', [
                'inputOptions' => [
                    'class' => 'form-control form-control-lg',
                ],
            ])->passwordInput()->label(Yii::t('user', 'New Password')) ?>

            <?= Html::submitButton(Yii::t('user', 'Finish'), [
                'class' => 'btn btn-success w-100',
            ]) ?>

            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
