<?php

use kartik\datecontrol\DateControl;
use kartik\detail\DetailView;
use kartik\select2\Select2;

/**
 * @var yii\web\View $this
 * @var \common\models\ApplicantFamily $model
 */
$this->title = $model->applicant->record_number.' : '.strip_tags($model->getOneModule($model->family_type));
$this->params['breadcrumbs'][] = $this->title;
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
                'label'=>'1: '.Yii::t('app', 'Bio Data'),
                'rowOptions'=>['class'=>'default']
            ],
            [
                'attribute' => 'title',
                'label' => Yii::t('app', 'Full Name'),
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute' => 'identity_number',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute' => 'birth_place',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute'=>'date_birth',
                'type'=>DetailView::INPUT_WIDGET,
                'widgetOptions'=>[
                    'class'=>DateControl::classname(),
                    'type'=>DateControl::FORMAT_DATE,
                ],
            ],
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
            ],
            [
                'attribute'=>'citizenship_status',
                'format' => 'html',
                'value'=>(!empty($model->citizenship_status)) ? $model->getOneCitizenshipStatus($model->citizenship_status):'-',
                'type'=>DetailView::INPUT_SELECT2,
                'options' => ['id' => 'citizenship_status', 'prompt' => '', 'disabled'=>false],
                'items' => $citizenshipList,
                'widgetOptions'=>[
                    'class'=> Select2::className(),
                    'data'=>$citizenshipList,
                ],
            ],
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
            ],
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
            ],
            [
                'group'=>true,
                'label'=> '2: ' .Yii::t('app', 'Address'),
                'rowOptions'=>['class'=>'default']
            ],
            [
                'attribute' => 'address_street',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute' => 'address_village',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute' => 'address_sub_district',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute' => 'address_city',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'attribute' => 'address_province',
                'type'=>DetailView::INPUT_TEXT,
            ],
            [
                'group'=>true,
                'label'=> '3: '. Yii::t('app', 'Description'),
                'rowOptions'=>['class'=>'default']
            ],
            [
                'attribute' => 'phone_number',
                'type' => DetailView::INPUT_TEXT,
            ],
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => $editMode,
    ]) ?>

</div>
