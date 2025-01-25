<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Transportation $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Transportation',
]) . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Transportations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Transportation            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="transportation-update">
            <?= $this->render('_form', [
                'model' => $model,
            ]) ?>
        </div>
    </div>
</div>



