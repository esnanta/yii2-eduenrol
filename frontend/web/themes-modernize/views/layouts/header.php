<?php

use common\models\Applicant;
use common\models\Office;
use common\models\Staff;
use yii\helpers\Html;
use yii\helpers\Url;

if (!Yii::$app->user->isGuest) {
    if (Yii::$app->user->identity->isAdmin) {
        return Yii::$app->response->redirect(['/admin/site/index']);
    }
    $model = Applicant::find()->where(['user_id' => Yii::$app->user->id])->one();
    if ($model->office->unique_id=='') :
        $office = Office::find()->where(['id' => $model->office_id])->one();
        $office->save();
    endif;
}
?>
<header class="app-header d-print-none">
    <nav class="navbar navbar-expand-lg navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse"
                   href="javascript:void(0)">
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
                <?php if (!Yii::$app->user->isGuest) : ?>

                <?php endif; ?>

                <?php if (Yii::$app->user->isGuest): ?>
                    <li class="nav-item">
                        <?php
                        $defaultImage = "/frontend/web/themes-modernize/assets/images/profile/user-1.jpg";
                        echo Html::a(
                            Html::img(Url::base() . $defaultImage, [
                                'alt' => 'Login',
                                'width' => 35,
                                'height' => 35,
                                'class' => 'rounded-circle'
                            ]),
                            ['/admin/user/login'],
                            ['class' => 'nav-link nav-icon-hover']
                        );
                        ?>
                    </li>
                <?php else: ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <img src="<?= $model->getImageUrl(); ?>"
                                 width="35" height="35" class="rounded-circle"
                            >
                        </a>

                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                            <div class="message-body">
                                <a href="<?= Url::to(['applicant/view', 'id' => $model->id]) ?>"
                                   class="d-flex align-items-center gap-2 dropdown-item">
                                    <i class="ti ti-user fs-6"></i>
                                    <p class="mb-0 fs-3">My Profile</p>
                                </a>
                                <?= Html::a('Logout', ['/user/logout'], ['data-method' => 'POST', 'data-confirm' => "Logout?", 'class' => 'btn btn-outline-primary mx-3 mt-2 d-block']) ?>
                            </div>
                        </div>
                    </li>
                <?php endif; ?>
            </ul>
        </div>
    </nav>
</header>
