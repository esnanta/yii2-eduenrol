<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use kartik\detail\DetailView;
use kartik\datecontrol\DateControl;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantDocument $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicant Documents'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$create = Html::a('<i class="fas fa-plus"></i>', ['create'], ['class' => 'button pull-right', 'style' => 'color:#333333;padding:0 5px']);

?>
<div class="applicant-document-view">

    <?= DetailView::widget([
            'model' => $model,
            'condensed' => false,
            'hover' => true,
            'mode' => Yii::$app->request->get('edit') == 't' ? DetailView::MODE_EDIT : DetailView::MODE_VIEW,
            'panel' => [
                    'heading' => $this->title . $create,
                    'type' => DetailView::TYPE_DEFAULT,
            ],
            'attributes' => [
                    [
                            'attribute' => 'event_id',
                            'label' => 'Kegiatan',
                            'value' => ($model->event_id != null) ? $model->event->title : '',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'event_id', 'prompt' => '', 'disabled' => true],
                            'items' => $eventList,
                            'widgetOptions' => [
                                    'class' => Select2::class,
                                    'data' => $eventList,
                            ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                            'attribute' => 'applicant_id',
                            'value' => ($model->applicant_id != null) ? $model->applicant->title : '',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'applicant_id', 'prompt' => '', 'disabled' => true],
                            'items' => $applicantList,
                            'widgetOptions' => [
                                    'class' => Select2::class,
                                    'data' => $applicantList,
                            ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    [
                            'attribute' => 'document_id',
                            'label' => 'Dokumen',
                            'value' => ($model->document_id != null) ? $model->document->title : '',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'document_id', 'prompt' => '', 'disabled' => false],
                            'items' => $documentList,
                            'widgetOptions' => [
                                    'class' => Select2::class,
                                    'data' => $documentList,
                            ],
                        //'valueColOptions'=>['style'=>'width:30%']
                    ],
                    'title',
                    'file_name',
            ],
            'deleteOptions' => [
                    'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => true,
    ]) ?>

</div>
