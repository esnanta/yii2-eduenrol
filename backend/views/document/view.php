<?php

use common\models\User;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\Document $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Documents'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button pull-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="document-view">

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
            'title',
            'quantity',
            'sequence',
            'description:ntext',
            [
                'group'=>true,
                'rowOptions'=>['class'=>'default']
            ],
            [
                'columns' => [
                    [
                        'attribute' => 'created_at',
                        'format' => 'date',
                        'type' => DetailView::INPUT_HIDDEN,
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                    [
                        'attribute' => 'updated_at',
                        'format' => 'date',
                        'type' => DetailView::INPUT_HIDDEN,
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute' => 'created_by',
                        'value' => ($model->created_by != null) ? User::getName($model->created_by) : '',
                        'type' => DetailView::INPUT_HIDDEN,
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                    [
                        'attribute' => 'updated_by',
                        'value' => ($model->updated_by != null) ? User::getName($model->updated_by) : '',
                        'type' => DetailView::INPUT_HIDDEN,
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                ],
            ],
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => true,
    ]) ?>

</div>
