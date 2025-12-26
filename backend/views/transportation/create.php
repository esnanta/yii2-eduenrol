<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Transportation $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Transportation',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Transportations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Transportation        </span>
    </div>
    <div class="card-body text-default">
        <div class="transportation-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>