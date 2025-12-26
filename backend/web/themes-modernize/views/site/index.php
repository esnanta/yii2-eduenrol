<?php

/** @var yii\web\View $this */
/** @var int $applicantCount */
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
                            <h4 class="mb-0 fw-semibold">1,250</h4>
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
                            <h4 class="mb-0 fw-semibold">350</h4>
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
                            <p class="text-muted mb-0">Menunggu Konfirmasi</p>
                            <h4 class="mb-0 fw-semibold">900</h4>
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
</div>
