<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantAlmamater $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Applicant Almamater',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicant Almamaters'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            ApplicantAlmamater        </span>
    </div>
    <div class="card-body text-default">
        <div class="applicant-almamater-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>