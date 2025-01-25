<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Income $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Income',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Incomes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Income            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="income-update">
            <?= $this->render('_form', [
                'model' => $model,
            ]) ?>
        </div>
    </div>
</div>



