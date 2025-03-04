<?php

use yii\helpers\Html;
use yii\helpers\Url;
use kartik\widgets\ActiveForm;
use budyaga\cropper\Widget;

/**
 * @var yii\web\View $this
 * @var common\models\Staff $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="author-form">

    <?php $form = ActiveForm::begin(['type' => ActiveForm::TYPE_HORIZONTAL]);

    echo $form->field($model, 'asset_name')->widget(Widget::class, [
        'uploadUrl' => Url::toRoute('/staff/avatar'),
        'width'=> '200',
        'height'=> '200' ,
        //'maxSize'=> 4097152,
        'cropAreaWidth'=> '100%',
        'cropAreaHeight'=> '600px',
    ]);

    echo Html::submitButton(
        $model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    );
        

    ActiveForm::end(); ?>

</div>
