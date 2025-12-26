<?php

/** @var yii\web\View $this */
/** @var int $applicantCount */
/** @var int $finalizedCount */
/** @var int $notFinalizedCount */
/** @var int $approvalRejectCount */
/** @var common\models\Event|null $activeEvent */

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

        <!-- Earnings Overview -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h6 class="fw-semibold text-primary mb-0">Earnings Overview</h6>
                    <div class="dropdown">
                        <a class="text-muted" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="ti ti-dots-vertical"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <canvas id="earningsChart" height="110"></canvas>
                </div>
            </div>
        </div>

        <!-- Revenue Sources -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h6 class="fw-semibold text-primary mb-0">Revenue Sources</h6>
                    <div class="dropdown">
                        <a class="text-muted" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="ti ti-dots-vertical"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <canvas id="revenueChart" height="250"></canvas>

                    <div class="mt-4 text-center small">
                    <span class="me-3">
                        <i class="ti ti-circle-filled text-primary"></i> Direct
                    </span>
                        <span class="me-3">
                        <i class="ti ti-circle-filled text-success"></i> Social
                    </span>
                        <span>
                        <i class="ti ti-circle-filled text-info"></i> Referral
                    </span>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
