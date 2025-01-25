<?php

use kartik\detail\DetailView;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Office $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Offices'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button pull-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="office-view">

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
            [
                'columns' => [
                    [
                        'attribute'=>'title',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'unique_id',
                        'valueColOptions'=>['style'=>'width:30%'],
                        'options' => ['prompt' => '', 'disabled' => true],
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'phone_number',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'fax_number',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'email',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'web',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'address',
                        'type'=>DetailView::INPUT_TEXTAREA,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'description',
                        'type'=>DetailView::INPUT_TEXTAREA,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],

                ],
            ],
            
            [
                'group'=>true,
                'rowOptions'=>['class'=>'default']
            ],
            
            [
                'columns' => [
                    [
                        'attribute'=>'created_at',
                        'format'=>'date',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'updated_at',
                        'format'=>'date',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'created_by',
                        'value'=>($model->created_by!=null) ? common\models\User::getName($model->created_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'updated_by',
                        'value'=>($model->updated_by!=null) ? common\models\User::getName($model->updated_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
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
