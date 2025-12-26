<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Applicant $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Applicant',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicants'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Applicant        </span>
    </div>
    <div class="card-body text-default">
        <div class="applicant-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>