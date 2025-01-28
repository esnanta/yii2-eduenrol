<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantDocument $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Applicant Document',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicant Documents'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            ApplicantDocument        </span>
    </div>
    <div class="card-body text-default">
        <div class="applicant-document-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>