<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Applicant $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Applicant',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicants'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Applicant            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="applicant-update">
            <?= $this->render('_form', [
                'model' => $model,
            ]) ?>
        </div>
    </div>
</div>



