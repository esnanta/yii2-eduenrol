<?php

use kartik\detail\DetailView;
use kartik\select2\Select2;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Customer $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Customers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button pull-right','style'=>'color:#333333;padding:0 5px']);

?>
<div class="customer-view">

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
                'attribute'=>'area_id',
                'value'=>($model->area_id!=null) ? $model->area->title:'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'area_id', 'prompt' => '', 'disabled'=> false],
                'items' => $areaList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data'=>$areaList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            'reg_number',
            'title',
            'phone_number',
            'address:ntext',
            [
                'attribute'=>'province_id',
                'value'=>($model->province_id!=null) ? $model->province->prov_name:'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'province_id', 'prompt' => '', 'disabled'=> false],
                'items' => $provinceList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data'=>$provinceList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'city_id',
                'value'=>($model->city_id!=null) ? $model->city->city_name:'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'city_id', 'prompt' => '', 'disabled'=> false],
                'items' => $cityList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data'=>$cityList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'district_id',
                'value'=>($model->district_id!=null) ? $model->district->dis_name:'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'district_id', 'prompt' => '', 'disabled'=> false],
                'items' => $districtList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data'=>$districtList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'subdistrict_id',
                'value'=>($model->subdistrict_id!=null) ? $model->subdistrict->subdis_name:'',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'subdistrict_id', 'prompt' => '', 'disabled'=> false],
                'items' => $subdistrictList,
                'widgetOptions'=>[
                    'class'=> Select2::class,
                    'data'=>$subdistrictList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'description',
                'format'=>'html',
                'type'=>DetailView::INPUT_TEXTAREA,
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
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'updated_at',
                        'format'=>'date',
                        'type'=>DetailView::INPUT_HIDDEN,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'created_by',
                        'value'=>($model->created_by!=null) ? \common\models\User::getName($model->created_by):'',
                        'type'=>DetailView::INPUT_HIDDEN,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'updated_by',
                        'value'=>($model->updated_by!=null) ? \common\models\User::getName($model->updated_by):'',
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
