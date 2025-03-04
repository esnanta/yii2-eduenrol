<?php

use kartik\datecontrol\DateControl;
use kartik\detail\DetailView;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var \common\models\ApplicantFamily $model
 */

?>

<div class="applicant-family-view">
    <?= DetailView::widget([
        'model' => $model,
        'condensed' => false,
        'hover' => true,
        'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
        'panel' => [
            'heading' => $this->title,
            'type' => DetailView::TYPE_DEFAULT,
        ],
        'buttons1' => '{update}',
        'attributes' => [


            [
                'group'=>true,
                'label' => '<i class="fa fa-info-circle"></i> Mohon diisi sesuai dengan dokumen yang sah/berlaku.<br>'
                    . '<i class="fa fa-info-circle"></i> Mohon diperhatikan penggunaan huruf besar dan kecil sesuai Ejaan Bahasa Indonesia.',
                'rowOptions'=>['class'=>'default']
            ],

            [
                'group'=>true,
                'label'=>'',
                'rowOptions'=>['class'=>'default']
            ],


            [
                'group'=>true,
                'label'=>'1: Biodata '.$model->getOneModule($model->family_type),
                'rowOptions'=>['class'=>'default']
            ],
            [
                'columns' => [
                    [
                        'attribute' => 'title',
                        'label' => Yii::t('app', 'Full Name'),
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'identity_number',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],


            [
                'columns' => [
                    [
                        'attribute' => 'birth_place',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'date_birth',
                        'format'=>'date',
                        'type'=>DetailView::INPUT_WIDGET,
                        'widgetOptions'=>[
                            'class'=>DateControl::classname(),
                            'type'=>DateControl::FORMAT_DATE,
                        ],
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],

            [
                'columns' => [
                    [
                        'attribute'=>'religion_id',
                        'value'=>(!empty($model->religion_id)) ? $model->religion->title:'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'religion_id', 'prompt' => '', 'disabled'=>false],
                        'items' => $religionList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$religionList,
                        ],
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'citizenship_status',
                        'format'=>'html',
                        'value' => (!empty($model->citizenship_status)) ?
                            $model->getOneCitizenshipStatus($model->citizenship_status) : '-',
                        'type' => DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'citizenship_id', 'prompt' => '', 'disabled' => false],
                        'items' => $citizenshipList,
                        'widgetOptions' => [
                            'class' => Select2::className(),
                            'data' => $citizenshipList,
                        ],
                        'valueColOptions' => ['style' => 'width:30%']
                    ],
                ],
            ],

            [
                'columns' => [
                    [
                        'attribute'=>'educational_stage_id',
                        'value'=>(!empty($model->educational_stage_id)) ? $model->educationalStage->title:'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'educational_stage_id', 'prompt' => '', 'disabled'=>false],
                        'items' => $educationalStageList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$educationalStageList,
                        ],
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'occupation_id',
                        'value'=>(!empty($model->occupation_id)) ? $model->occupation->title:'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'occupation_id', 'prompt' => '', 'disabled'=>false],
                        'items' => $occupationList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$occupationList,
                        ],
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],

            [
                'columns' => [
                    [
                        'attribute'=>'income_id',
                        'value'=>(!empty($model->income_id)) ? $model->income->title:'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'income_id', 'prompt' => '', 'disabled'=>false],
                        'items' => $incomeList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$incomeList,
                        ],
                        //'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
                    ],
                ],
            ],
            [
                'group'=>true,
                'label'=>'2: Alamat',
                'rowOptions'=>['class'=>'default']
            ],
            [
                'columns' => [
                    [
                        'attribute' => 'address_street',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'address_village',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute' => 'address_sub_district',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'address_city',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute' => 'address_province',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
                    ],
                    [
                        'attribute' => 'phone_number',
                        'type'=>DetailView::INPUT_TEXT,
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => $editMode,
    ]) ?>

</div>
