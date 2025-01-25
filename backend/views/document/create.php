<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Document $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Document',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Documents'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Document        </span>
    </div>
    <div class="card-body text-default">
        <div class="document-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>