<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;


/**
 * @var \yii\web\View $this
 * @var \yii\data\ActiveDataProvider $dataProvider
 * @var \dektrium\user\models\UserSearch $searchModel
 */

$this->title = Yii::t('user', 'Manage users');
$this->params['breadcrumbs'][] = $this->title;
?>

<?php //$this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

<?php //$this->render('/admin/_menu') ?>

<?php Pjax::begin() ?>

<div class="user-index">

    <?php Pjax::begin(); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'layout' => "{items}\n{pager}",
        'toolbar' => [
            [
                'content' =>
                    Html::a('<i class="fas fa-plus"></i> Add New', ['create'], ['class' => 'btn btn-success btn-sm']) . ' ' .
                    Html::a('<i class="fas fa-redo"></i> Reset List', ['index'], ['class' => 'btn btn-info btn-sm']),
                'options' => ['class' => 'btn-group-md'],
            ],
        ],
        'columns' => [
//            [
//                'attribute' => 'id',
//                'headerOptions' => ['style' => 'width:90px;'],
//            ],
//            'username',
            'email:email',
//            [
//                'attribute' => 'registration_ip',
//                'value' => function ($model) {
//                    return $model->registration_ip === null
//                        ? '<span class="not-set">' . Yii::t('user', '(not set)') . '</span>'
//                        : $model->registration_ip;
//                },
//                'format' => 'html',
//            ],
            [
                'attribute' => 'created_at',
                'value' => function ($model) {
                    return extension_loaded('intl')
                        ? Yii::t('user', '{0, date, MMMM dd, YYYY HH:mm}', [$model->created_at])
                        : date('Y-m-d G:i:s', $model->created_at);
                },
            ],
            [
                'attribute' => 'last_login_at',
                'value' => function ($model) {
                    if (!$model->last_login_at || $model->last_login_at == 0) {
                        return Yii::t('user', 'Never');
                    }
                    return extension_loaded('intl')
                        ? Yii::t('user', '{0, date, MMMM dd, YYYY HH:mm}', [$model->last_login_at])
                        : date('Y-m-d G:i:s', $model->last_login_at);
                },
            ],
            [
                'header' => Yii::t('user', 'Confirmation'),
                'value' => function ($model) {
                    if ($model->isConfirmed) {
                        return '<div class="text-center">
                                    <span class="text-success">' . Yii::t('user', 'Confirmed') . '</span>
                                </div>';
                    }
                    return Html::a(Yii::t('user', 'Confirm'), ['confirm', 'id' => $model->id], [
                        'class' => 'btn btn-success btn-sm',
                        'data-method' => 'post',
                        'data-confirm' => Yii::t('user', 'Are you sure you want to confirm this user?'),
                    ]);
                },
                'format' => 'raw',
                'visible' => Yii::$app->getModule('user')->enableConfirmation,
            ],
            [
                'header' => Yii::t('user', 'Block status'),
                'value' => function ($model) {
                    if ($model->isBlocked) {
                        return Html::a(Yii::t('user', 'Unblock'), ['block', 'id' => $model->id], [
                            'class' => 'btn btn-success btn-sm',
                            'data-method' => 'post',
                            'data-confirm' => Yii::t('user', 'Are you sure you want to unblock this user?'),
                        ]);
                    }
                    return Html::a(Yii::t('user', 'Block'), ['block', 'id' => $model->id], [
                        'class' => 'btn btn-danger btn-sm',
                        'data-method' => 'post',
                        'data-confirm' => Yii::t('user', 'Are you sure you want to block this user?'),
                    ]);
                },
                'format' => 'raw',
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{switch} {resend_password} {update} {delete}',
                'buttons' => [
                    'resend_password' => function ($url, $model, $key) {
                        if (\Yii::$app->user->identity->isAdmin && !$model->isAdmin) {
                            return Html::a(
                                '<i class="fas fa-envelope"></i>',
                                ['resend-password', 'id' => $model->id],
                                [
                                    'class' => 'btn btn-warning btn-sm',
                                    'title' => Yii::t('user', 'Generate and send new password to user'),
                                    'data-method' => 'post',
                                    'data-confirm' => Yii::t('user', 'Are you sure?'),
                                ]
                            );
                        }
                        return '';
                    },
                    'switch' => function ($url, $model) {
                        if (\Yii::$app->user->identity->isAdmin &&
                            $model->id != Yii::$app->user->id &&
                            Yii::$app->getModule('user')->enableImpersonateUser) {
                            return Html::a(
                                '<i class="fas fa-user"></i>',
                                ['/user/admin/switch', 'id' => $model->id],
                                [
                                    'title' => Yii::t('user', 'Become this user'),
                                    'class' => 'btn btn-secondary btn-sm',
                                    'data-confirm' => Yii::t('user', 'Are you sure you want to switch to this user for the rest of this Session?'),
                                    'data-method' => 'post',
                                ]
                            );
                        }
                        return '';
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
            'heading' => '<h3 class="panel-title"><i class="fas fa-th-list"></i> ' . Html::encode($this->title) . '</h3>',
            'type' => 'default',
            'showFooter' => false,
        ],
    ]); ?>

    <?php Pjax::end(); ?>
</div>
