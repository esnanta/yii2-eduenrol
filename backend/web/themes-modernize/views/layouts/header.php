<?php

use common\models\Staff;
use common\service\CacheService;
use yii\helpers\Html;
use yii\helpers\Url;
if (!Yii::$app->user->isGuest) {
    $cacheCloud = new CacheService;
    $staffId = $cacheCloud->getStaffId();
    $model = Staff::find()->where(['id' => $staffId])->one();
}
?>
<header class="app-header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                    <i class="ti ti-menu-2"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                    <i class="ti ti-bell-ringing"></i>
                    <div class="notification bg-primary rounded-circle"></div>
                </a>
            </li>
        </ul>
        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">

                <?=
                    Html::a(
                        '<i class="fas fa-recycle fa-fw"></i>',
                        ['/site/flush'],
                        [
                            'data-method' => 'post',
                            'data-confirm' => 'Flush now?',
                            'class' => 'btn btn-danger',
                            'role' => 'button',
                            'title'=>'Flush'
                        ]
                    )
                ?>


                <li class="nav-item dropdown">
                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <?php if (Yii::$app->user->isGuest) { ?>
                            <?php $defaultImage = "/backend/web/themes-b5-modernize/assets/images/profile/user-1.jpg"?>
                            <img src="<?= Url::base() ?>"
                                 alt="" width="35" height="35" class="rounded-circle">
                        <?php } else { ?>
                            <img src="<?= $model->getAssetUrl(); ?>"
                                 width="35" height="35" class="rounded-circle"
                                 alt="<?= $model->title; ?>">
                        <?php } ?>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                        <div class="message-body">
                            <?php if (!Yii::$app->user->isGuest) : ?>
                                <a href="<?= Url::to(['admin/staff/view', 'id' => $model->id]) ?>"
                                   class="d-flex align-items-center gap-2 dropdown-item">
                                    <i class="ti ti-user fs-6"></i>
                                    <p class="mb-0 fs-3">My Profile</p>
                                </a>

                                <?= Html::a(
                                    'Logout',
                                    ['/user/logout'],
                                    [
                                        'data-method' => 'POST',
                                        'data-confirm' => "Logout?",
                                        'class' => 'btn btn-outline-primary mx-3 mt-2 d-block'
                                    ]
                                ) ?>
                            <?php endif ?>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>