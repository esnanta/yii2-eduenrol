<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Residence $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Residence',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Residences'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Residence        </span>
    </div>
    <div class="card-body text-default">
        <div class="residence-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>