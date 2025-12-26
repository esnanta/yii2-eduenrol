<?php

use kartik\datecontrol\DateControl;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var \common\models\ApplicantAlmamater $model
 * @var \common\models\ApplicantAlmamater $schoolStatusList
 * @var \common\models\ApplicantAlmamater $tuitionPayerList
 * @var \common\models\EducationalStage $educationalStageList
 * @var \common\models\Residence $residenceList
 * @var \common\models\Transportation $transportationList
 */

$this->title = 'Almamater : '.$model->educationalStage->title;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="applicant-almamater-view">

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
                'label'=> '1 : '.$model->educationalStage->title,
                'rowOptions'=>['class'=>'default']
            ],
            [
                'attribute'=>'title',
                'label'=>Yii::t('app', 'School Name'),
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'national_school_principal_number',
                'label'=>Yii::t('app', 'National School Principal Number'),
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'educational_stage_id',
                'format'=>'html',
                'value'=>(empty($model->educational_stage_id)) ? '-' : $model->educationalStage->title,
                'type'=>DetailView::INPUT_DROPDOWN_LIST,
                'options' => ['id' => 'educational_stage_id', 'prompt' => '', 'disabled'=>false],
                'items' => $educationalStageList,
                'widgetOptions'=>[
                    'data'=>$educationalStageList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'school_status',
                'format'=>'html',
                'value'=> (empty($model->school_status)) ? '-' : $model->getOneSchoolStatus($model->school_status),
                'type'=>DetailView::INPUT_DROPDOWN_LIST,
                'options' => ['id' => 'school_status', 'prompt' => '', 'disabled'=>false],
                'items' => $schoolStatusList,
                'widgetOptions'=>[
                    'data'=>$schoolStatusList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],

            [
                'group'=>true,
                'label'=> '2 : '.Yii::t('app', 'Student'),
                'rowOptions'=>['class'=>'default']
            ],

            [
                'attribute'=>'national_registration_number',
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'school_registration_number',
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'tuition_payer',
                'format'=>'html',
                'value'=> (empty($model->tuition_payer)) ? '-' : $model->getOneTuitionPayer($model->tuition_payer),
                'type'=>DetailView::INPUT_DROPDOWN_LIST,
                'options' => ['id' => 'tuition_payer', 'prompt' => '', 'disabled'=>false],
                'items' => $tuitionPayerList,
                'widgetOptions'=>[
                    'data'=>$tuitionPayerList,
                ],
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'study_time_length',
                //'valueColOptions'=>['style'=>'width:30%']
            ],

            [
                'attribute' => 'date_graduation',
                'type' => DetailView::INPUT_HIDDEN,
                'widgetOptions' => [
                    'class' => DateControl::classname(),
                    'type' => DateControl::FORMAT_DATE,
                ],
                //'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
            ],
            
//            [
//                'group'=>true,
//                'label'=> '3 : '.Yii::t('app', 'Graduation'),
//                'rowOptions'=>['class'=>'default']
//            ],
//
//            [
//                'attribute'=>'certificate_serial_number',
//                'options' => ['disabled'=>true],
//                //'valueColOptions'=>['style'=>'width:30%']
//            ],
//            [
//                'attribute'=>'examination_serial_number',
//                'options' => ['disabled'=>true],
//                //'valueColOptions'=>['style'=>'width:30%']
//            ],
//
//            [
//                'attribute'=>'examination_card_number',
//                'options' => ['disabled'=>true],
//                //'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
//            ],

            [
                'group'=>true,
                'label'=>'3 : '.Yii::t('app', 'School Address'),
                'rowOptions'=>['class'=>'default']
            ],
            [
                'attribute'=>'address_street',
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'address_village',
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'address_sub_district',
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'address_city',
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'attribute'=>'address_province',
                //'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
            ],
            [
                'group'=>true,
                'label'=> '5 : '.Yii::t('app', 'Home To School'),
                'rowOptions'=>['class'=>'default']
            ],
            [
                'attribute'=>'residence_id',
                'format'=>'html',
                'value'=>(empty($model->residence_id)) ? '-' : $model->residence->title,
                'type'=>DetailView::INPUT_DROPDOWN_LIST,
                'options' => ['id' => 'residence_id', 'prompt' => '', 'disabled'=>false],
                'items' => $residenceList,
                'widgetOptions'=>[
                    'data'=>$residenceList,
                ],
            ],
            [
                'attribute'=>'transportation_id',
                'format'=>'html',
                'value'=>(empty($model->transportation_id)) ? '-' : $model->transportation->title,
                'type'=>DetailView::INPUT_DROPDOWN_LIST,
                'options' => ['id' => 'transportation_id', 'prompt' => '', 'disabled'=>false],
                'items' => $transportationList,
                'widgetOptions'=>[
                    'data'=>$transportationList,
                ],
            ],
            [
                'attribute'=>'distance',
                //'valueColOptions'=>['style'=>'width:30%']
            ],
            [
                'group'=>true,
                'label'=> '6 : '.Yii::t('app', 'Description'),
                'rowOptions'=>['class'=>'default']
            ],   

            [
                'attribute' => 'description',
                'format'=>'html',
                'type'=>DetailView::INPUT_TEXTAREA, 
                //'valueColOptions'=>['style'=>'width:30%']
            ],               
 
        ],
        'deleteOptions' => [
            'url' => ['delete', 'id' => $model->id],
        ],
        'enableEditMode' => $editMode,
    ]) ?>

</div>
