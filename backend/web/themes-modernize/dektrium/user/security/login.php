<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use dektrium\user\widgets\Connect;
use dektrium\user\models\LoginForm;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\LoginForm $model
 * @var dektrium\user\Module $module
 */

$this->title = Yii::t('app', 'Sign in');
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

    <div class="container d-flex justify-content-center align-items-center min-vh-50">
        <div class="card shadow" style="max-width: 400px; width: 100%;">
            <div class="card-header bg-danger text-white text-center">
                <?= Yii::t('app', 'Administrator') ?>
            </div>
            <div class="card-body">
                <?php $form = ActiveForm::begin([
                    'id' => 'login-form',
                    'options' => ['class' => 'needs-validation'],
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => false,
                    'validateOnBlur' => false,
                    'validateOnType' => false,
                    'validateOnChange' => false,
                ]) ?>

                <?php if ($module->debug) : ?>
                    <?= $form->field($model, 'login', [
                        'inputOptions' => [
                            'autofocus' => 'autofocus',
                            'class' => 'form-control form-control-lg',
                            'tabindex' => '1',
                        ],
                    ])->dropDownList(LoginForm::loginList(), ['class' => 'form-select form-select-lg']); ?>
                <?php else : ?>
                    <?= $form->field($model, 'login', [
                        'inputOptions' => [
                            'autofocus' => 'autofocus',
                            'class' => 'form-control form-control-lg',
                            'tabindex' => '1',
                        ],
                    ]); ?>
                <?php endif ?>

                <?php if ($module->debug) : ?>
                    <div class="alert alert-warning">
                        <?= Yii::t('user', 'Password is not necessary because the module is in DEBUG mode.'); ?>
                    </div>
                <?php else : ?>
                    <?= $form->field($model, 'password', [
                        'inputOptions' => [
                            'class' => 'form-control form-control-lg',
                            'tabindex' => '2',
                        ],
                    ])->passwordInput()
                        ->label(
                            Yii::t('user', 'Password') .
                            ($module->enablePasswordRecovery ? ' (' .
                                Html::a(Yii::t('user', 'Forgot password?'), ['/user/recovery/request'], ['tabindex' => '5'])
                                . ')' : '')
                        ) ?>
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

                <?= Html::submitButton(Yii::t('user', 'Sign in'), [
                    'class' => 'btn btn-danger w-100',
                    'tabindex' => '4',
                ]) ?>

                <?php ActiveForm::end(); ?>
            </div>
            <div class="card-footer text-center">
                <?php if ($module->enableConfirmation) : ?>
                    <p class="mb-2">
                        <?= Html::a(Yii::t('user', 'Didn\'t receive confirmation message?'), ['/user/registration/resend']) ?>
                    </p>
                <?php endif ?>
                <?php if ($module->enableRegistration) : ?>
                    <p class="mb-0">
                        <?= Html::a(Yii::t('user', 'Don\'t have an account? Sign up!'), ['/user/registration/register']) ?>
                    </p>
                <?php endif ?>
                <div class="mt-3">
                    <?= Connect::widget([
                        'baseAuthUrl' => ['/user/security/auth'],
                    ]) ?>
                </div>
            </div>
        </div>
    </div>


<?php
$this->registerJs(
    "jQuery('#reveal-password').change(function(){
            jQuery('#login-form-password').attr('type', this.checked ? 'text' : 'password');
        });"
);
?>