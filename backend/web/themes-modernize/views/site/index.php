<?php

/** @var yii\web\View $this */
/** @var int $applicantCount */
/** @var int $finalizedCount */
/** @var int $notFinalizedCount */ 
/** @var int $approvalRejectCount */
/** @var int $finalizedMaleCount */
/** @var int $finalizedFemaleCount */
/** @var array $dailyApplicantLabels */
/** @var array $dailyApplicantData */
/** @var array $dailyFinalizedData */
/** @var common\models\Event|null $activeEvent */

use common\models\Applicant;
use dosamigos\chartjs\ChartJs;
use yii\helpers\Html;


$this->title = 'Dashboard';
?>
<div class="site-index">
    <div class="row">
        <div class="col-sm-6 col-xl-3">
            <div class="card shadow-sm border-start border-primary border-4">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="me-3">
                            <p class="text-muted mb-0" title="<?= $activeEvent ? Html::encode($activeEvent->title) : 'Event tidak aktif' ?>">
                                Pendaftar Aktif
                            </p>
                            <h4 class="mb-0 fw-semibold"><?= number_format($applicantCount) ?></h4>
                        </div>
                        <div class="flex-shrink-0">
                            <div class="bg-primary-subtle text-primary d-flex align-items-center justify-content-center rounded-circle" style="width: 45px; height: 45px;">
                                <i class="ti ti-users fs-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="card shadow-sm border-start border-success border-4">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="me-3">
                            <p class="text-muted mb-0">Pendaftar Finalisasi</p>
                            <h4 class="mb-0 fw-semibold"><?= number_format($finalizedCount) ?></h4>
                        </div>
                        <div class="flex-shrink-0">
                            <div class="bg-success-subtle text-success d-flex align-items-center justify-content-center rounded-circle" style="width: 45px; height: 45px;">
                                <i class="ti ti-user-check fs-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="card shadow-sm border-start border-danger border-4">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="me-3">
                            <p class="text-muted mb-0">Belum Finalisasi</p>
                            <h4 class="mb-0 fw-semibold"><?= number_format($notFinalizedCount) ?></h4>
                        </div>
                        <div class="flex-shrink-0">
                            <div class="bg-danger-subtle text-danger d-flex align-items-center justify-content-center rounded-circle" style="width: 45px; height: 45px;">
                                <i class="ti ti-user-x fs-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="card shadow-sm border-start border-warning border-4">
                <div class="card-body">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="me-3">
                            <p class="text-muted mb-0">Ditolak</p>
                            <h4 class="mb-0 fw-semibold"><?= number_format($approvalRejectCount) ?></h4>
                        </div>
                        <div class="flex-shrink-0">
                            <div class="bg-warning-subtle text-warning d-flex align-items-center justify-content-center rounded-circle" style="width: 45px; height: 45px;">
                                <i class="ti ti-user-exclamation fs-5"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row mt-4">

        <!-- Pendaftar Harian -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="fw-semibold text-primary mb-0">Pendaftar Harian</h6>
                        <?php if ($activeEvent && $activeEvent->date_start && $activeEvent->date_end): ?>
                            <small class="text-muted">
                                <?= Yii::$app->formatter->asDate($activeEvent->date_start, 'd MMM Y') ?> &mdash; <?= Yii::$app->formatter->asDate($activeEvent->date_end, 'd MMM Y') ?>
                            </small>
                        <?php endif; ?>
                    </div>
                    <div class="dropdown">
                        <a class="text-muted" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="ti ti-dots-vertical"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body" style="height: 320px;">
                    <?= ChartJs::widget([
                        'type' => 'line',
                        'data' => [
                            'labels' => $dailyApplicantLabels,
                            'datasets' => [
                                [
                                    'label' => 'Jumlah Pendaftar',
                                    'data' => $dailyApplicantData,
                                    'backgroundColor' => 'rgba(93, 135, 255, 0.2)',
                                    'borderColor' => '#5D87FF',
                                    'borderWidth' => 2,
                                    'pointBackgroundColor' => '#5D87FF',
                                    'fill' => true,
                                    'tension' => 0.4,
                                ],
                                [
                                    'label' => 'Jumlah Finalisasi',
                                    'data' => $dailyFinalizedData,
                                    'backgroundColor' => 'rgba(19, 222, 185, 0.2)',
                                    'borderColor' => '#13DEB9',
                                    'borderWidth' => 2,
                                    'pointBackgroundColor' => '#13DEB9',
                                    'fill' => true,
                                    'tension' => 0.4,
                                ],
                            ],
                        ],
                        'clientOptions' => [
                            'responsive' => true,
                            'maintainAspectRatio' => false,
                            'plugins' => [
                                'legend' => ['display' => true, 'position' => 'top', 'align' => 'end'],
                            ],
                            'scales' => ['y' => ['beginAtZero' => true, 'ticks' => ['precision' => 0]]],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>

        <!-- Finalisasi Pendaftar -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h6 class="fw-semibold text-primary mb-0">Finalisasi Pendaftar</h6>
                    <div class="dropdown">
                        <a class="text-muted" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="ti ti-dots-vertical"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div style="height: 250px; position: relative;">
                        <?php
                        $genderLabels = Applicant::getArrayGenderStatus();
                        echo ChartJs::widget([
                            'type' => 'doughnut',
                            'data' => [
                                'labels' => array_values($genderLabels),
                                'datasets' => [
                                    [
                                        'label' => 'Finalisasi Pendaftar',
                                        'data' => [$finalizedMaleCount, $finalizedFemaleCount],
                                        'backgroundColor' => ['#5D87FF', '#13DEB9'], // primary, success
                                        'borderColor' =>  ['#fff', '#fff'],
                                        'borderWidth' => 1,
                                        'hoverBorderWidth' => 2,
                                    ],
                                ],
                            ],
                            'clientOptions' => [
                                'plugins' => [
                                    'legend' => ['display' => false],
                                ],
                                'maintainAspectRatio' => false,
                            ],
                        ]);
                        ?>
                    </div>

                    <div class="mt-4 text-center small">
                        <span class="me-3">
                            <i class="ti ti-circle-filled text-primary"></i> <?= Html::encode($genderLabels[Applicant::GENDER_STATUS_MALE]) ?>
                        </span>
                        <span class="me-3">
                            <i class="ti ti-circle-filled text-success"></i> <?= Html::encode($genderLabels[Applicant::GENDER_STATUS_FEMALE]) ?>
                        </span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
