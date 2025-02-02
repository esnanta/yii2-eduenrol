<?php

use common\models\ApplicantAlmamater;
use common\models\ApplicantFamily;
use common\models\Semester;
use yii\helpers\Html;
use yii\helpers\Url;
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
    $username = (Yii::$app->user->isGuest) ? 'Guest' : Yii::$app->user->identity->username;
?>

<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="<?= $homeUrl ?>" class="text-nowrap logo-img">
                <img src="<?= Url::base() ?>/frontend/web/themes-modernize/assets/images/logos/dark-logo.svg"
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
                    <span class="hide-menu"><?= $username; ?></span>
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
                        <span class="hide-menu"><?=Yii::t('app', 'Data')?></span>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Profile'), 'fa fa-angle-right'),
                            ['/applicant/view','title'=>$username],
                            ['class' => 'sidebar-link']
                        ) ?>
                    </li>

                    <!-- Example Collapsible Parent Menu -->
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow collapsed" data-bs-toggle="collapse" href="#educationMenu" aria-expanded="false" aria-controls="applicantMenu">
                            <?= getMenu(Yii::t('app', 'Almamater'), 'fa fa-university') ?>
                        </a>
                        <ul class="collapse list-unstyled" id="educationMenu" data-bs-parent="#sidebarnav">
                            <li class="sidebar-item" style="padding-left: 10px">
                                <?= Html::a(getMenu(Yii::t('app', 'Elementary School'), 'fa fa-angle-right'),
                                    ['/applicant-almamater/view', 'edu'=>ApplicantAlmamater::getElementarySchool()],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item" style="padding-left: 10px">
                                <?= Html::a(getMenu(Yii::t('app', 'Junior High School'), 'fa fa-angle-right'),
                                    ['/applicant-almamater/view', 'edu'=>ApplicantAlmamater::getJuniorHighSchool()],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                        </ul>
                    </li>

                    <!-- Example Collapsible Parent Menu -->
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow collapsed" data-bs-toggle="collapse" href="#profileFamilyMenu" aria-expanded="false" aria-controls="applicantMenu">
                            <?= getMenu(Yii::t('app', 'Family'), 'fa fa-users') ?>
                        </a>
                        <ul class="collapse list-unstyled" id="profileFamilyMenu" data-bs-parent="#sidebarnav">
                            <li class="sidebar-item" style="padding-left: 10px">
                                <?= Html::a(getMenu(Yii::t('app', 'Father'), 'fa fa-angle-right'),
                                    ['/applicant-family/view','type'=> ApplicantFamily::FAMILY_TYPE_FATHER, 'title'=>$username],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item" style="padding-left: 10px">
                                <?= Html::a(getMenu(Yii::t('app', 'Mother'), 'fa fa-angle-right'),
                                    ['/applicant-family/view','type'=> ApplicantFamily::FAMILY_TYPE_MOTHER, 'title'=>$username],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item" style="padding-left: 10px">
                                <?= Html::a(getMenu(Yii::t('app', 'Guardian'), 'fa fa-angle-right'),
                                    ['/applicant-family/view','type'=> ApplicantFamily::FAMILY_TYPE_GUARDIAN, 'title'=>$username],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                        </ul>
                    </li>
                    <!-- Example Collapsible Parent Menu -->
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow collapsed" data-bs-toggle="collapse" href="#gradeMenu" aria-expanded="false" aria-controls="applicantMenu">
                            <?= getMenu(Yii::t('app', 'Grade'), 'fa fa-file') ?>
                        </a>
                        <ul class="collapse list-unstyled" id="gradeMenu" data-bs-parent="#sidebarnav">
                            <?php
                                foreach (Semester::find()->all() as $semester) {
                            ?>
                                    <li class="sidebar-item" style="padding-left: 10px">
                                        <?= Html::a(getMenu($semester->title, 'fa fa-angle-right'),
                                            ['/applicant-grade/index','sem'=>$semester->id,'title'=>$semester->title],
                                            ['class' => 'sidebar-link']) ?>
                                    </li>
                            <?php
                                }
                            ?>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(
                            getMenu(Yii::t('app', 'Summary'), 'fa fa-angle-right'),
                            ['/applicant/summary','title'=>$username],
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
                <?php } ?>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>


