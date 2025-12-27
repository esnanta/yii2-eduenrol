<?php

use common\models\ApplicantDocument;
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
                    'title',
                    [
                        'attribute' => 'document_status',
                        'format' => 'raw',
                        'value' => call_user_func(function($model){
                            $status = ApplicantDocument::getOneDocumentStatus($model->document_status);
                            $buttons = '';
                            $statusLabels = ApplicantDocument::getArrayDocumentStatus();

                            $approveButton = Html::a('<i class="fas fa-check"></i> ' . $statusLabels[ApplicantDocument::DOCUMENT_STATUS_APPROVE], ['document-status', 'id' => $model->id, 'status' => ApplicantDocument::DOCUMENT_STATUS_APPROVE], [
                                'class' => 'btn btn-sm btn-success',
                                'data' => [
                                    'confirm' => 'Apakah Anda yakin ingin menyetujui dokumen ini?',
                                    'method' => 'post',
                                ],
                            ]);
                            $rejectButton = Html::a('<i class="fas fa-times"></i> ' . $statusLabels[ApplicantDocument::DOCUMENT_STATUS_REJECT], ['document-status', 'id' => $model->id, 'status' => ApplicantDocument::DOCUMENT_STATUS_REJECT], [
                                'class' => 'btn btn-sm btn-danger',
                                'data' => [
                                    'confirm' => 'Apakah Anda yakin ingin menolak dokumen ini?',
                                    'method' => 'post',
                                ],
                            ]);

                            if ($model->document_status == ApplicantDocument::DOCUMENT_STATUS_UNCONFIRM) {
                                $buttons = '<div class="float-end">' . $approveButton . ' ' . $rejectButton . '</div>';
                            } elseif ($model->document_status == ApplicantDocument::DOCUMENT_STATUS_APPROVE) {
                                $buttons = '<div class="float-end">' . $rejectButton . '</div>';
                            } elseif ($model->document_status == ApplicantDocument::DOCUMENT_STATUS_REJECT) {
                                $buttons = '<div class="float-end">' . $approveButton . '</div>';
                            }
                            return $status . $buttons;
                        }, $model),
                        'displayOnly' => true
                    ],
                    [
                            'attribute' => 'file_name',
                            'displayOnly' => true,
                    ],
                    [
                            'label' => 'Dokumen',
                            'format' => 'raw',
                            'value' => $model->file_name ?
                                    Html::a(
                                            '<i class="fas fa-download"></i> Download',
                                            $model->fileUrl,
                                            ['target' => '_blank', 'class' => 'btn btn-sm btn-primary']
                                    )
                                    . '<br><br>'
                                    . '<iframe src="' . $model->fileUrl . '" width="100%" height="500px"></iframe>'
                                    : '-',
                    ],
            ],
            'deleteOptions' => [
                    'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => true,
    ]) ?>

</div>
