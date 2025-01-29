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
 * @var dektrium\user\models\User $model
 * @var dektrium\user\Module $module
 */

$this->title = Yii::t('user', 'Sign up');
//$this->params['breadcrumbs'][] = $this->title;
?>
<!-- Signup -->
<div class="container d-flex justify-content-center align-items-center min-vh-50">
    <div class="card shadow" style="max-width: 400px; width: 100%;">
        <div class="card-header bg-info text-white text-center">
            <?= Yii::t('app', 'Create Account') ?>
        </div>
        <div class="card-body">
            <?php $form = ActiveForm::begin([
                'id' => 'registration-form',
                'options' => ['class' => 'needs-validation'],
                'enableAjaxValidation' => true,
                'enableClientValidation' => false,
            ]); ?>

            <?= $form->field($model, 'email', [
                'inputOptions' => [
                    'class' => 'form-control form-control-lg',
                    'autofocus' => true,
                ],
            ])->label(Yii::t('user', 'Email')) ?>

            <?= $form->field($model, 'username')->hiddenInput()->label(false); ?>

            <?php if (!$module->enableGeneratingPassword): ?>
                <?= $form->field($model, 'password', [
                    'inputOptions' => [
                        'class' => 'form-control form-control-lg',
                    ],
                ])->passwordInput()
                    ->label(Yii::t('user', 'Password')) ?>
            <?php endif ?>
            <div class="form-check mb-3">
                <?= Html::checkbox('reveal-password', false, [
                    'id' => 'reveal-password',
                    'class' => 'form-check-input',
                ]) ?>
                <label class="form-check-label" for="reveal-password">
                    <?= Yii::t('user', 'Show Password') ?>
                </label>
            </div>
            <?= Html::submitButton(Yii::t('user', 'Sign up'), [
                'class' => 'btn btn-primary w-100',
            ]) ?>

            <?php ActiveForm::end(); ?>
        </div>
        <div class="card-footer text-center">
            <p class="mb-0">
                <?= Yii::t('app', "Already have an account? ") .
                Html::a(Yii::t('app', 'Sign in'), ['/user/security/login']) ?>
            </p>
        </div>
    </div>
</div>
<!-- End Signup -->

<?php
$this->registerJs(
    "jQuery('#reveal-password').change(function(){
            jQuery('#register-form-password').attr('type', this.checked ? 'text' : 'password');
        });"
);
?>