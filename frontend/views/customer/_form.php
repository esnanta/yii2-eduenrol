<?php

use kartik\depdrop\DepDrop;
use kartik\select2\Select2;
use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
use kartik\datecontrol\DateControl;
use yii\helpers\Url;

/**
 * @var yii\web\View $this
 * @var common\models\Customer $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="customer-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]); echo Form::widget([

        'model' => $model,
        'form' => $form,
        'columns' => 1,
        'attributes' => [
            'area_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $areaList,
                    'options' => ['placeholder' => '', 'disabled' => false],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
            'title' => ['type' => Form::INPUT_TEXT,
                'options' => ['placeholder' => '', 'maxlength' => 50]],
            'phone_number' => ['type' => Form::INPUT_TEXT,
                'options' => ['placeholder' => '', 'maxlength' => 20]],
            'address' => ['type' => Form::INPUT_TEXTAREA,
                'options' => ['placeholder' => '','rows' => 2]],
            'province_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => Select2::class,
                'options' => [
                    'data' => $provinceList,
                    'options' => ['placeholder' => '', 'disabled' => false],
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ],
            'city_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => DepDrop::class,
                'options' => [
                    'pluginOptions' => [
                        'depends'=>['customer-province_id'],
                        'placeholder'=>'Select...',
                        'url'=>Url::to(['/customer/get-cities']),
                    ],
                ],
                'pluginOptions' => [
                        'allowClear' => true,
                ],
            ],
            'district_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => DepDrop::class,
                'options' => [
                    'pluginOptions' => [
                        'depends'=>['customer-city_id'],
                        'placeholder'=>'Select...',
                        'url'=>Url::to(['/customer/get-districts']),
                    ],
                ],
                'pluginOptions' => [
                    'allowClear' => true,
                ],
            ],
            'subdistrict_id' => [
                'type' => Form::INPUT_WIDGET,
                'widgetClass' => DepDrop::class,
                'options' => [
                    'pluginOptions' => [
                        'depends'=>['customer-district_id'],
                        'placeholder'=>'Select...',
                        'url'=>Url::to(['/customer/get-subdistricts']),
                    ],
                ],
                'pluginOptions' => [
                    'allowClear' => true,
                ],
            ],
            'description' => ['type' => Form::INPUT_TEXTAREA,
                'options' => ['placeholder' => '','rows' => 2]],
        ]

    ]);

    echo Html::submitButton(
        $model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
    ActiveForm::end(); ?>

</div>
