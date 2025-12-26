<?php

use common\models\Applicant;
use common\models\User;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var common\models\Applicant $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicants'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button pull-right','style'=>'color:#333333;padding:0 5px']);

$finalIcon      = ($model->final_status== Applicant::FINAL_STATUS_NO) ? '<i class="fa fa-check"></i> Finalisasi':'<i class="fa fa-remove"></i> Batalkan';
$finalText      = ($model->final_status== Applicant::FINAL_STATUS_NO) ? 'Final':'Batal';
$finalButton    = ($model->final_status== Applicant::FINAL_STATUS_NO) ? 'btn btn-sm btn-success pull-right':'btn btn-sm btn-danger pull-right';

$finalCancelButton = Html::a($finalIcon,
    Yii::$app->urlManager->createUrl(['applicant/finalize', 'id' => $model->id]),
    [
        'title' => Yii::t('yii', $finalText),
        'class'=> $finalButton,
    ]);
?>
<div class="applicant-view">



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
                'attribute'=>'final_status',
                'format'=>'html',
                'value'=>(!empty($model->final_status)) ? $model->getOneFinalStatus($model->final_status).$finalCancelButton:'-',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'final_status', 'prompt' => '', 'disabled'=>false],
                'items' => $finalStatusList,
                'widgetOptions'=>[
                    'class'=> Select2::className(),
                    'data'=>$finalStatusList,
                ],
                'valueColOptions'=>['style'=>'width:30%']
            ],
            'id',
            'office_id',
            'event_id',
            'user_id',
            'email:email',
            'record_number',
            'family_card_number',
            'identity_number',
            'birth_certificate_number',
            'title',
            'nick_name',
            'gender_status',
            'birth_place',
            [
                'attribute' => 'date_birth',
                'format' => [
                    'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                        ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                        : 'd-m-Y H:i:s A'
                ],
                'type' => DetailView::INPUT_WIDGET,
                'widgetOptions' => [
                    'class' => DateControl::classname(),
                    'type' => DateControl::FORMAT_DATETIME
                ]
            ],
            'religion_id',
            'citizenship_status',
            'address_street',
            'address_village',
            'address_sub_district',
            'address_city',
            'address_province',
            'phone_number',
            'hobby:ntext',
            'blood_type',
            'height',
            'weight',
            'head_circle',
            'number_of_sibling',
            'number_of_dependent',
            'number_of_step_sibling',
            'birth_order',
            'child_status',
            'native_language',
            'illness:ntext',
            'disability:ntext',
            'file_name',
            [
                'attribute' => 'date_final',
                'format' => [
                    'datetime', (isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime']))
                        ? Yii::$app->modules['datecontrol']['displaySettings']['datetime']
                        : 'd-m-Y H:i:s A'
                ],
                'type' => DetailView::INPUT_WIDGET,
                'widgetOptions' => [
                    'class' => DateControl::classname(),
                    'type' => DateControl::FORMAT_DATETIME
                ]
            ],

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
