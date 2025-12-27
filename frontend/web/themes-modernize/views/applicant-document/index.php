<?php

use common\models\ApplicantDocument;
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\ApplicantDocumentSearch $searchModel
 */

$this->title = Yii::t('app', 'Applicant Documents');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="applicant-document-index">

        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /* echo Html::a(Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Applicant Document',
]),
        ['create'], ['class' => 'btn btn-success'])*/  ?>
    </p>

    <?php Pjax::begin(); echo GridView::widget([
        'dataProvider' => $dataProvider,
        
        'toolbar' => [
            [
                'content'=>
                    Html::a('<i class="fas fa-plus"></i> Add New', ['create'], ['class' => 'btn btn-success'])
                    . ' ' .
                    Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
                'options' => ['class' => 'btn-group-md']
            ]
            //'{export}',
            //'{toggleData}'
        ],
        
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
                [
                        'attribute'=>'document_id',
                        'vAlign'=>'middle',
                        'width'=>'180px',
                        'value'=>function ($model, $key, $index, $widget) {
                            return ($model->document_id!=null) ? $model->document->title:'';
                        },
                        'filterType'=>GridView::FILTER_SELECT2,
                        'filter'=>$documentList,
                        'filterWidgetOptions'=>[
                                'pluginOptions'=>['allowClear'=>true],
                        ],
                        'filterInputOptions'=>['placeholder'=>''],
                        'format'=>'raw'
                ],
            'title',
            'description:ntext',
                [
                        'attribute' => 'document_status',
                        'vAlign' => 'middle',
                        'width' => '180px',
                        'value' => function ($model) {
                            return ApplicantDocument::getOneDocumentStatus($model->document_status);
                        },
                        'filterType' => GridView::FILTER_SELECT2,
                        'filter' => ApplicantDocument::getArrayDocumentStatus(),
                        'filterWidgetOptions' => [
                                'pluginOptions' => ['allowClear' => true],
                        ],
                        'filterInputOptions' => ['placeholder' => ''],
                        'format' => 'raw'
                ],
            [
                'class' => 'common\widgets\ActionColumn',
                'contentOptions' => ['style' => 'white-space:nowrap;'],
                'template'=>'{update} {view}',
                'buttons' => [
                    'update' => function ($url, $model) {
                        return Html::a(
                            '<i class="fas fa-pencil-alt"></i>',
                            Yii::$app->urlManager->createUrl(['applicant-document/view', 'id' => $model->id, 'edit' => 't']),
                            [
                                'title' => Yii::t('yii', 'Edit'),
                                'class'=>'btn btn-sm btn-info',
                            ]
                        );
                    },
                    'view' => function ($url, $model) {
                        return Html::a(
                            '<i class="fas fa-eye"></i>',
                            Yii::$app->urlManager->createUrl(['applicant-document/view', 'id' => $model->id]),
                            [
                                'title' => Yii::t('yii', 'View'),
                                'class'=>'btn btn-sm btn-info',
                            ]
                        );
                    },
                ],
            ],
        ],
        'responsive' => true,
        'hover' => true,
        'condensed' => true,
        'floatHeader' => false,
                        
        'bordered' => true,
        'striped' => false,
        'responsiveWrap' => false,

        'panel' => [
            'heading' => '<h3 class="panel-title"><i class="glyphicon glyphicon-th-list"></i> '.Html::encode($this->title).' </h3>',
            'type' => 'default',
            //'before' => Html::a('<i class="glyphicon glyphicon-plus"></i> Add', ['create'], ['class' => 'btn btn-success']),
            //'after' => Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
            'showFooter' => false
        ],
    ]); Pjax::end(); ?>
    

</div>
