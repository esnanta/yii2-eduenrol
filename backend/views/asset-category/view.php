<?php

use common\helper\LabelHelper;
use common\models\User;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\AssetCategory $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Asset Categories'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = LabelHelper::getCreateButton();

?>
<div class="archive-category-view">

    <?= DetailView::widget([
        'model' => $model,
        'condensed' => false,
        'hover' => true,
        'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
        'panel' => [
            'heading' => $this->title.$create,
            'type' => LabelHelper::getDetailViewType(),
        ],
        'attributes' => [
            'title',
            'sequence',
            'description:ntext',
            [
                'group' => true,
                'rowOptions' => ['class' => 'default']
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
                        'value' => ($model->created_by != null) ? \common\models\User::getName($model->created_by) : '',
                        'type' => DetailView::INPUT_HIDDEN,
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                    [
                        'attribute' => 'updated_by',
                        'value' => ($model->updated_by != null) ? \common\models\User::getName($model->updated_by) : '',
                        'type' => DetailView::INPUT_HIDDEN,
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'created_by',
                        'value'=>($model->created_by!=null) ? User::getName($model->created_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'updated_by',
                        'value'=>($model->updated_by!=null) ? User::getName($model->updated_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => Yii::$app->user->can('update-assetcategory'),
    ]) ?>

</div>
