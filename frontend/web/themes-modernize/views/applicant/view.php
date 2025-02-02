<?php

use common\models\Applicant;
use common\models\Religion;
use kartik\datecontrol\DateControl;
use kartik\detail\DetailView;
use kartik\select2\Select2;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var Applicant $model
 * @var Applicant $ganderList
 * @var Applicant $childStatusList
 * @var Applicant $citizenshipList
 * @var Applicant $bloodTypeList
 * @var Religion $religionList
 */

$this->title = $model->record_number.' : '.$model->title;
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <!-- Applicant Image -->
                    <div class="mb-3 position-relative">
                        <?=
                            Html::a('<i class="fa fa-pencil"></i> Change',
                                ['/applicant/update', 'id' => $model->id],
                                ['class' => 'btn btn-sm btn-primary position-absolute top-0 end-0 m-0']);
                        ?>
                        <img src="<?= $model->getImageUrl() ?>" alt="<?= $model->title; ?>" class="img-fluid rounded-circle" style="width: 150px; height: 150px; object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
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
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'nick_name',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],

                    [
                        'attribute' => 'identity_number',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'birth_certificate_number',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],

                    [
                        'attribute' => 'birth_place',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'date_birth',
                        'type'=>DetailView::INPUT_WIDGET,
                        'widgetOptions'=>[
                            'class'=>DateControl::classname(),
                            'type'=>DateControl::FORMAT_DATE,
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
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
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'citizenship_status',
                        'format'=>'html',
                        'value'=>(!empty($model->citizenship_status)) ? $model->getOneCitizenshipStatus($model->citizenship_status):'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'citizenship_id', 'prompt' => '', 'disabled'=>false],
                        'items' => $citizenshipList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$citizenshipList,
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'gender_status',
                        'format'=>'html',
                        'value'=>(!empty($model->gender_status)) ? $model->getOneGenderStatus($model->gender_status):'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'gender_status', 'prompt' => '', 'disabled'=>false],
                        'items' => $ganderList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$ganderList,
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'blood_type',
                        'format'=>'html',
                        'value'=>(!empty($model->blood_type)) ? $model->getOneBloodType($model->blood_type):'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'blood_type', 'prompt' => '', 'disabled'=>false],
                        'items' => $bloodTypeList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$bloodTypeList,
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],

                    [
                        'attribute' => 'height',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'weight',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],

                    [
                        'group'=>true,
                        'label'=>'2: '.Yii::t('app', 'Address'),
                        'rowOptions'=>['class'=>'default']
                    ],
                    [
                        'attribute' => 'address_street',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'address_village',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'address_sub_district',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'address_city',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'address_province',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'phone_number',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],

                    [
                        'group'=>true,
                        'label'=>'3: '.Yii::t('app', 'Family'),
                        'rowOptions'=>['class'=>'default']
                    ],

                    [
                        'attribute' => 'birth_order',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute'=>'child_status',
                        'format'=>'html',
                        'value'=>(!empty($model->child_status)) ? $model->getOneChildStatus($model->child_status):'-',
                        'type'=>DetailView::INPUT_SELECT2,
                        'options' => ['id' => 'child_status', 'prompt' => '', 'disabled'=>false],
                        'items' => $childStatusList,
                        'widgetOptions'=>[
                            'class'=> Select2::className(),
                            'data'=>$childStatusList,
                        ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'number_of_sibling',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'number_of_step_sibling',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],

                    [
                        'attribute' => 'number_of_dependent',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'native_language',
                        'type'=>DetailView::INPUT_TEXT,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],

                    [
                        'group'=>true,
                        'label'=>'4: '.Yii::t('app', 'Other'),
                        'rowOptions'=>['class'=>'default']
                    ],
                    [
                        'attribute' => 'hobby',
                        'type'=>DetailView::INPUT_TEXTAREA,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'illness',
                        'type'=>DetailView::INPUT_TEXTAREA,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'attribute' => 'disability',
                        'type'=>DetailView::INPUT_TEXTAREA,
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                        'group'=>true,
                        'label'=>'5: '.Yii::t('app', 'Description'),
                        'rowOptions'=>['class'=>'default']
                    ],

                    [
                        'attribute' => 'description',
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
    </div>
</div>


