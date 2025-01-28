<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Course $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Course',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Courses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right"> Course</span>
    </div>
    <div class="card-body text-default">
        <div class="course-create">
            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>
        </div>
    </div>
</div>