<?php

use common\models\Applicant;
use kartik\widgets\ActiveForm;
use kartik\widgets\FileInput;

/**
 * @var yii\web\View $this
 * @var Applicant $model
 * @var yii\widgets\ActiveForm $form
 */
?>

<div class="applicant-form">

    <?php $form = ActiveForm::begin([
        'type' => ActiveForm::TYPE_HORIZONTAL,
        'options'=>['enctype'=>'multipart/form-data']
    ]);

    // your fileinput widget for single file upload
    echo $form->field($model, 'image')->widget(FileInput::class, [
        'options'=>['accept'=>'image/*'],
        'pluginOptions'=>['allowedFileExtensions'=>['jpg','gif','png','jpeg']
        ]]);

    // render a delete image button
    //    if (!$model->isNewRecord) {
    //        echo Html::a('Delete', ['/product-image/delete'], ['class'=>'btn btn-danger']);
    //    }
    //
    //    echo Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'),
    //        ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']
    //    );
    ActiveForm::end(); ?>

</div>
