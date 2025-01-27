<?php

use yii\helpers\Html;
use yii\helpers\Url;
use kartik\widgets\SideNav;
?>

<?php
$module = Yii::$app->getModule('user');

function getMenu($_menuName, $_classIcon): string
{
    return '<span>' .
            '<i class="' . $_classIcon . '"></i>' .
            '</span>' .
            '<span class="hide-menu">' . $_menuName . '</span>';
}

$homeUrl = str_replace('user/','',Url::to(['site/index']));
$welcomeMessage = (Yii::$app->user->isGuest) ? 'Guest':Yii::$app->user->identity->username;
?>

<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="<?= $homeUrl ?>" class="text-nowrap logo-img">
                <img src="<?= Url::base() ?>/frontend/web/themes-b5-modernize/assets/images/logos/dark-logo.svg"
                     width="180" alt="" />
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>

        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">

                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu"><?= $welcomeMessage; ?></span>
                </li>
                <li class="sidebar-item">
                    <?php
                    $index = Html::a(
                        getMenu(Yii::t('app', 'Home'), 'fa fa-home'),
                        ['site/index'],
                        ['class' => 'sidebar-link']
                    );
                    echo str_replace('user/', '', $index);
                    ?>
                </li>


                <?php if (!Yii::$app->user->isGuest) { ?>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">
                            Home
                        </span>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu"><?=Yii::t('app', 'Data')?></span>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Profile'), 'fa fa-angle-right'),
                            ['/applicant/profile'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Assessment'), 'fa fa-angle-right'),
                            ['/assessment/index'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Chart'), 'fa fa-angle-right'),
                            ['/chart/participant-chart'],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">
                            <?=Yii::t('app', 'Auth');?>
                        </span>
                    </li>
                    <li class="sidebar-item">
                        <?=
                        Html::a(
                            getMenu(Yii::t('app', 'Logout'), 'fa fa-sign-out'),
                            ['/site/logout'],
                            ['data-method' => 'POST', 'data-confirm' => "Logout?", 'class' => 'sidebar-link']
                        )
                        ?>
                    </li>
                <?php } else { ?>

                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu"><?=Yii::t('app', 'Auth');?></span>
                    </li>
                    <?php if ($module->enableRegistration) : ?>
                        <li class="sidebar-item">
                            <?php
                            $register = Html::a(
                                getMenu(Yii::t('app', 'Register'), 'fa fa-user-plus'),
                                ['user/register'],
                                ['class' => 'sidebar-link']
                            );

                            echo str_replace('user/user/', 'user/', $register);
                            ?>
                        </li>
                    <?php endif ?>
                    <li class="sidebar-item">
                        <?php
                        $login = Html::a(
                            getMenu(Yii::t('app', 'Login'), 'fa fa-sign-in'),
                            ['user/login'],
                            ['class' => 'sidebar-link']
                        );

                        echo str_replace('user/user/', 'user/', $login);
                        ?>
                    </li>

                <?php } ?>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>


