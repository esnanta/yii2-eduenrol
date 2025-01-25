<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Semester $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Semester',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Semesters'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Semester        </span>
    </div>
    <div class="card-body text-default">
        <div class="semester-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>