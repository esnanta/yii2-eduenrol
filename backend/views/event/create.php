<?php

/**
 * @var yii\web\View $this
 * @var \common\models\Event $model
 */

$this->title = 'Create Event';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="panel panel-info">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Event            </div>            
        </div>
    </div>
    <div class="panel-body">

        <div class="event-create">

            <?= $this->render('_form', [
                'model' => $model,
            ]) 
            ?>

        </div>
        
    </div>
</div>