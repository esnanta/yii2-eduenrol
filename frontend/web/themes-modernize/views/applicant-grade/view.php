<?php

use kartik\widgets\Select2;
use kartik\detail\DetailView;

/**
 * @var yii\web\View $this
 * @var common\models\ApplicantGrade $model
 */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Applicant Grades'),
        'url' => ['index', 'sem' => $model->semester_id]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="applicant-grade-view">

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
                            'attribute' => 'course_id',
                            'value' => ($model->course_id != null) ? $model->course->title : '',
                            'format' => 'html',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'course_id', 'prompt' => '', 'disabled' => true],
                            'items' => $courseList,
                            'widgetOptions' => [
                                    'class' => Select2::class,
                                    'data' => $courseList,
                            ],
                    ],
                    [
                            'attribute' => 'semester_id',
                            'value' => ($model->semester_id != null) ? $model->semester->title : '',
                            'format' => 'html',
                            'type' => DetailView::INPUT_SELECT2,
                            'options' => ['id' => 'semester_id', 'prompt' => '', 'disabled' => true],
                            'items' => $semesterList,
                            'widgetOptions' => [
                                    'class' => Select2::class,
                                    'data' => $semesterList,
                            ],
                    ],
                    'grade',
                    [
                            'label' => '',
                            'format' => 'raw',
                            'displayOnly' => true,
                            'value' => '<span class="text-muted" style="font-size:12px;">
                                            Gunakan titik sebagai pemisah ribuan. Contoh: 89.54
                                        </span>',
                    ],
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
            ],
            'deleteOptions' => [
                    'url' => ['delete', 'id' => $model->id],
            ],
            'enableEditMode' => true,
    ]) ?>

</div>
