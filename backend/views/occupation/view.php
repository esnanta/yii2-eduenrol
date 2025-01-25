<?php

use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Occupation $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Occupations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button pull-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="occupation-view">

    <?= DetailView::widget([
        'model' => $model,
        'condensed' => false,
        'hover' => true,
        'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
        'panel' => [
            'heading' => $this->title.$create,
            'type' => DetailView::TYPE_DEFAULT,
        ],
        'attributes' => [
            'id',
            'title',
            'sequence',
            'description:ntext',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
            'verlock',
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => true,
    ]) ?>

</div>
