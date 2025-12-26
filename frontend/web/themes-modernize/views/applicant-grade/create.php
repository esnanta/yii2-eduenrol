<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantGrade $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Applicant Grade',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicant Grades'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            ApplicantGrade        </span>
    </div>
    <div class="card-body text-default">
        <div class="applicant-grade-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>