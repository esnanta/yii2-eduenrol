<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\bootstrap5\Nav;

/**
 * @var \yii\web\View $this
 * @var \dektrium\user\models\User $user
 * @var string $content
 */

$this->title = Yii::t('user', 'Update user account');
$this->params['breadcrumbs'][] = ['label' => Yii::t('user', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

<?= $this->render('_menu') ?>
<div class="row">
    <!-- Sidebar Navigation -->
    <div class="col-md-3">
        <div class="card mb-4">
            <div class="card-body">
                <?= Nav::widget([
                    'options' => [
                        'class' => 'nav flex-column nav-pills', // Updated classes for Bootstrap 5
                    ],
                    'items' => [
                        [
                            'label' => Yii::t('user', 'Account details'),
                            'url' => ['/user/admin/update', 'id' => $user->id]
                        ],
                        [
                            'label' => Yii::t('user', 'Profile details'),
                            'url' => ['/user/admin/update-profile', 'id' => $user->id]
                        ],
                        ['label' => Yii::t('user', 'Information'), 'url' => ['/user/admin/info', 'id' => $user->id]],
                        [
                            'label' => Yii::t('user', 'Assignments'),
                            'url' => ['/user/admin/assignments', 'id' => $user->id],
                            'visible' => isset(Yii::$app->extensions['dektrium/yii2-rbac']),
                        ],
                        '<div class="dropdown-divider"></div>', // Replaces <hr>
                        [
                            'label' => Yii::t('user', 'Confirm'),
                            'url' => ['/user/admin/confirm', 'id' => $user->id],
                            'visible' => !$user->isConfirmed,
                            'linkOptions' => [
                                'class' => 'text-success',
                                'data-method' => 'post',
                                'data-confirm' => Yii::t('user', 'Are you sure you want to confirm this user?'),
                            ],
                        ],
                        [
                            'label' => Yii::t('user', 'Block'),
                            'url' => ['/user/admin/block', 'id' => $user->id],
                            'visible' => !$user->isBlocked,
                            'linkOptions' => [
                                'class' => 'text-danger',
                                'data-method' => 'post',
                                'data-confirm' => Yii::t('user', 'Are you sure you want to block this user?'),
                            ],
                        ],
                        [
                            'label' => Yii::t('user', 'Unblock'),
                            'url' => ['/user/admin/block', 'id' => $user->id],
                            'visible' => $user->isBlocked,
                            'linkOptions' => [
                                'class' => 'text-success',
                                'data-method' => 'post',
                                'data-confirm' => Yii::t('user', 'Are you sure you want to unblock this user?'),
                            ],
                        ],
                        [
                            'label' => Yii::t('user', 'Delete'),
                            'url' => ['/user/admin/delete', 'id' => $user->id],
                            'linkOptions' => [
                                'class' => 'text-danger',
                                'data-method' => 'post',
                                'data-confirm' => Yii::t('user', 'Are you sure you want to delete this user?'),
                            ],
                        ],
                    ],
                ]) ?>
            </div>
        </div>
    </div>

    <!-- Content Section -->
    <div class="col-md-9">
        <div class="card">
            <div class="card-body">
                <?= $content ?>
            </div>
        </div>
    </div>
</div>
