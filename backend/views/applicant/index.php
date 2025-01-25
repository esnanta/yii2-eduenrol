<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var common\models\ApplicantSearch $searchModel
 */

$this->title = Yii::t('app', 'Applicants');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="applicant-index">

        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /* echo Html::a(Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Applicant',
]),
        ['create'], ['class' => 'btn btn-success'])*/  ?>
    </p>

    <?php Pjax::begin(); echo GridView::widget([
        'dataProvider' => $dataProvider,
        
        'toolbar' => [
            [
                'content'=>
                    Html::a('<i class="fas fa-plus"></i> Add New', ['create'], ['class' => 'btn btn-success'])
                     . ' '.
                    Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info']),
                'options' => ['class' => 'btn-group-md']
            ],
            //'{export}',
            //'{toggleData}'
        ],
        
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

                'id',
            'event_id',
            'user_id',
            'email:email',
            'record_number',
//            'family_card_number', 
//            'identity_number', 
//            'birth_certificate_number', 
//            'title', 
//            'nick_name', 
//            'gender_status', 
//            'birth_place', 
//            ['attribute' => 'date_birth','format' => ['datetime',(isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime'])) ? Yii::$app->modules['datecontrol']['displaySettings']['datetime'] : 'd-m-Y H:i:s A']], 
//            'religion_id', 
//            'citizenship_status', 
//            'address_street', 
//            'address_village', 
//            'address_sub_district', 
//            'address_city', 
//            'address_province', 
//            'phone_number', 
//            'hobby:ntext', 
//            'blood_type', 
//            'height', 
//            'weight', 
//            'head_circle', 
//            'number_of_sibling', 
//            'number_of_dependent', 
//            'number_of_step_sibling', 
//            'birth_order', 
//            'child_status', 
//            'native_language', 
//            'illness:ntext', 
//            'disability:ntext', 
//            'file_name', 
//            'final_status', 
//            ['attribute' => 'date_final','format' => ['datetime',(isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime'])) ? Yii::$app->modules['datecontrol']['displaySettings']['datetime'] : 'd-m-Y H:i:s A']], 
//            'approval_status', 
//            'date_approval', 
//            'approved_by', 
//            'description:ntext', 
//            ['attribute' => 'created_at','format' => ['datetime',(isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime'])) ? Yii::$app->modules['datecontrol']['displaySettings']['datetime'] : 'd-m-Y H:i:s A']], 
//            ['attribute' => 'updated_at','format' => ['datetime',(isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime'])) ? Yii::$app->modules['datecontrol']['displaySettings']['datetime'] : 'd-m-Y H:i:s A']], 
//            'created_by', 
//            'updated_by', 
//            ['attribute' => 'deleted_at','format' => ['datetime',(isset(Yii::$app->modules['datecontrol']['displaySettings']['datetime'])) ? Yii::$app->modules['datecontrol']['displaySettings']['datetime'] : 'd-m-Y H:i:s A']], 
//            'deleted_by', 
//            'verlock', 
//            'uuid', 

            [
                'class' => 'common\widgets\ActionColumn',
                'contentOptions' => ['style' => 'white-space:nowrap;'],
                'template'=>'{update} {view}',
                'buttons' => [
                    'update' => function ($url, $model) {
                        return Html::a(
                            '<i class="fas fa-pencil-alt"></i>',
                            Yii::$app->urlManager->createUrl(['applicant/view', 'id' => $model->id, 'edit' => 't']),
                            [
                                'title' => Yii::t('yii', 'Edit'),
                                'class'=>'btn btn-sm btn-info',
                            ]
                        );
                    },
                    'view' => function ($url, $model) {
                        return Html::a(
                            '<i class="fas fa-eye"></i>',
                            Yii::$app->urlManager->createUrl(['applicant/view', 'id' => $model->id]),
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
