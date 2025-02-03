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
                'label'=>'1 : '.$model->educationalStage->title,
                'rowOptions'=>['class'=>'default']
            ],

            [
                'columns' => [
                    [
                        'attribute'=>'title',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'national_school_principal_number',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],

            [
                'columns' => [
                    [
                        'attribute' => 'educational_stage_id',
                        'format' => 'html',
                        'value' => (empty($model->educational_stage_id)) ? '-' : $model->educationalStage->title,
                        'type' => DetailView::INPUT_DROPDOWN_LIST,
                        'items' => $educationalStageList,
                        'widgetOptions' => [
                            'data' => $educationalStageList,
                            'options' => ['disabled' => true], // Move 'disabled' here
                        ],
                        'valueColOptions' => ['style' => 'width:30%']
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
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],


            [
                'group'=>true,
                'label'=>'2 : Siswa',
                'rowOptions'=>['class'=>'default']
            ],

            [
                'columns' => [
                    [
                        'attribute'=>'national_registration_number',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'school_registration_number',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
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
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'study_time_length',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],

            [
                'attribute'=>'date_graduation',
                'format'=>'date',
                'type'=>DetailView::INPUT_HIDDEN,
                'widgetOptions'=>[
                    'class'=>DateControl::classname(),
                    'type'=>DateControl::FORMAT_DATE,
                ],
                'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
            ],

//            [
//                'group'=>true,
//                'label'=>'3. Kelulusan',
//                'rowOptions'=>['class'=>'default']
//            ],
//
//            [
//                'columns' => [
//                    [
//                        'attribute'=>'certificate_serial_number',
//                        'options' => ['disabled'=>true],
//                        'valueColOptions'=>['style'=>'width:30%']
//                    ],
//                    [
//                        'attribute'=>'examination_serial_number',
//                        'options' => ['disabled'=>true],
//                        'valueColOptions'=>['style'=>'width:30%']
//                    ],
//                ],
//            ],
//
//            [
//                'columns' => [
//                    [
//                        'attribute'=>'examination_card_number',
//                        'options' => ['disabled'=>true],
//                        'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
//                    ],
//                ],
//            ],

            [
                'group'=>true,
                'label'=>'3 : Alamat Sekolah',
                'rowOptions'=>['class'=>'default']
            ],


            [
                'columns' => [
                    [
                        'attribute'=>'address_street',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'address_village',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],
            [
                'columns' => [
                    [
                        'attribute'=>'address_sub_district',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'address_city',
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],

            [
                'columns' => [
                    [
                        'attribute'=>'address_province',
                        'valueColOptions'=>['class'=>'pull-left','style'=>'width:38%']
                    ],
                ],
            ],

            [
                'group'=>true,
                'label'=>'5 : Rumah Ke Sekolah',
                'rowOptions'=>['class'=>'default']
            ],


            [
                'columns' => [
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
                        'valueColOptions'=>['style'=>'width:30%']
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
                        'valueColOptions'=>['style'=>'width:30%']
                    ],
                ],
            ],

            [
                'columns' => [
                    [
                        'attribute'=>'distance',
                        'valueColOptions'=>['style'=>'width:30%']
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
