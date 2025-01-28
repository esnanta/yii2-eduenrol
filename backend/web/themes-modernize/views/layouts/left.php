<?php

use yii\helpers\Html;

function getMenu($_menuName, $_classIcon)
{
    return '<span><i class="' . $_classIcon . '"></i></span><span class="hide-menu">' . $_menuName . '</span>';
}

?>

<aside class="left-sidebar">
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="./index.html" class="text-nowrap logo-img">
                <img src="../assets/images/logos/dark-logo.svg" width="180" alt="" />
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>

        <nav class="sidebar-nav scroll-sidebar" data-simplebar>
            <ul id="sidebarnav" class="list-unstyled">
                <?php if (!Yii::$app->user->isGuest) : ?>
                    <li class="nav-small-cap">
                        <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                        <span class="hide-menu">Backend</span>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(getMenu('Dashboard', 'fa fa-dashboard'), ['/site/index'], ['class' => 'sidebar-link']) ?>
                    </li>

                    <!-- Example Collapsible Parent Menu -->
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow collapsed" data-bs-toggle="collapse" href="#applicantMenu" aria-expanded="false" aria-controls="applicantMenu">
                            <?= getMenu(Yii::t('app', 'Applicant'), 'fa fa-users') ?>
                        </a>
                        <ul class="collapse list-unstyled" id="applicantMenu" data-bs-parent="#sidebarnav">
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Profile'), 'fa fa-angle-right'), ['/applicant/index'], ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Almamater'), 'fa fa-angle-right'), ['/applicant-almamater/index'], ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Family'), 'fa fa-angle-right'), ['/applicant-family/index'], ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Grade'), 'fa fa-angle-right'), ['/applicant-grade/index'], ['class' => 'sidebar-link']) ?>
                            </li>
                        </ul>
                    </li>


                    <!-- Example Collapsible Parent Menu -->
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow collapsed" data-bs-toggle="collapse" href="#officeMenu" aria-expanded="false" aria-controls="applicantMenu">
                            <?= getMenu(Yii::t('app', 'Office'), 'fa fa-university') ?>
                        </a>
                        <ul class="collapse list-unstyled" id="officeMenu" data-bs-parent="#sidebarnav">
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Office'), 'fa fa-angle-right'), ['/office/index'], ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Employment'), 'fa fa-angle-right'), ['/employment/index'], ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Staff'), 'fa fa-angle-right'), ['/staff/index'], ['class' => 'sidebar-link']) ?>
                            </li>
                        </ul>
                    </li>

                    <!-- Example Another Collapsible Parent Menu -->
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow collapsed" data-bs-toggle="collapse" href="#masterMenu" aria-expanded="false" aria-controls="masterMenu">
                            <?= getMenu('Master', 'fa fa-cogs') ?>
                        </a>
                        <ul class="collapse list-unstyled" id="masterMenu" data-bs-parent="#sidebarnav">
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Asset Category'),
                                    'fa fa-angle-right'), ['/asset-category/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Asset'),
                                    'fa fa-angle-right'), ['/asset/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Course'),
                                    'fa fa-angle-right'), ['/course/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Document'),
                                    'fa fa-angle-right'), ['/document/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Educational Stage'),
                                    'fa fa-angle-right'), ['/educational-stage/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Employment'),
                                    'fa fa-angle-right'), ['/employment/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Income'),
                                    'fa fa-angle-right'), ['/income/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Occupation'),
                                    'fa fa-angle-right'), ['/occupation/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Religion'),
                                    'fa fa-angle-right'), ['/religion/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Residence'),
                                    'fa fa-angle-right'), ['/residence/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Semester'),
                                    'fa fa-angle-right'), ['/semester/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                            <li class="sidebar-item">
                                <?= Html::a(getMenu(Yii::t('app', 'Transportation'),
                                    'fa fa-angle-right'), ['/transportation/index'],
                                    ['class' => 'sidebar-link']) ?>
                            </li>
                        </ul>
                    </li>
                <?php endif; ?>

                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">AUTH</span>
                </li>
                <?php if (Yii::$app->user->isGuest) : ?>
                    <li class="sidebar-item">
                        <?= Html::a(getMenu('Login', 'fa fa-sign-in'), ['/user/login'], ['class' => 'sidebar-link']) ?>
                    </li>
                <?php else : ?>
                    <li class="sidebar-item">
                        <?= Html::a(getMenu('Logout', 'fa fa-sign-out'), ['/user/logout'], ['data-method' => 'POST', 'data-confirm' => "Logout?", 'class' => 'sidebar-link']) ?>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(getMenu('User', 'fa fa-angle-right'), ['/user/admin/index'], ['class' => 'sidebar-link']) ?>
                    </li>
                    <li class="sidebar-item">
                        <?= Html::a(getMenu('Gii', 'fa fa-angle-right'), ['/gii'], ['class' => 'sidebar-link']) ?>
                    </li>
                <?php endif; ?>
            </ul>
        </nav>
    </div>
</aside>