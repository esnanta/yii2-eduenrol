<?php

/** @var yii\web\View $this */

use common\models\Applicant;
use yii\bootstrap5\Html;

$this->title = Yii::$app->name;
?>

<div class="card border-default mb-3">
    <div class="card-header d-flex justify-content-between align-items-center">
        <?= Yii::t('app', 'Online Registration'); ?>
    </div>
    <div class="card-body">
        <ul class="nav nav-tabs mb-3" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home-1" role="tab">
                    <span class="badge bg-success">
                        <i class="fa fa-user"></i>
                        <?= Yii::$app->user->getIsGuest() ? 'Login/Sign Up' : 'Login as ' . Yii::$app->user->identity->username; ?>
                    </span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile-1" role="tab">
                    <span class="badge bg-danger">
                        <i class="fa fa-question-circle"></i> Baca Saya
                    </span>
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="home-1" role="tabpanel">
                <?php if (Yii::$app->user->getIsGuest()) : ?>
                    <div class="text-center my-4">
                        <p>Klik <strong>Login</strong> jika sudah punya akun.</p>
                        <div class="mb-3">
                            <?= Html::a('<i class="fa fa-lock"></i> Login', ['user/security/login'], ['class' => 'btn btn-success rounded-pill px-4']); ?>
                        </div>
                        <hr>
                        <p>Atau klik <strong>Sign Up</strong> untuk membuat akun jika belum punya.</p>
                        <div>
                            <?= Html::a('<i class="fa fa-user"></i> Sign Up', ['user/registration/register'], ['class' => 'btn btn-primary rounded-pill px-4']); ?>
                        </div>
                    </div>
                <?php elseif (Yii::$app->user->identity->isAdmin) : ?>
                    <h2 class="text-center">Welcome Admin</h2>
                <?php else :
                    $applicant = Applicant::findOne(['user_id' => Yii::$app->user->identity->id]); ?>
                    <h2 class="text-center">Selamat Datang</h2>
                    <p class="text-center">
                        Anda berhasil Login. Lengkapi data diri di halaman
                        <?= Html::a('PSB', ['applicant/summary', 'title' => Yii::$app->user->identity->username], ['class' => '']); ?>
                    </p>
                    <table class="table table-striped">
                        <tbody>
                        <tr>
                            <td>Username</td>
                            <td>:</td>
                            <td><?= $applicant->title; ?></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>:</td>
                            <td><?= $applicant->title; ?></td>
                        </tr>
                        </tbody>
                    </table>
                <?php endif; ?>
            </div>
            <div class="tab-pane fade" id="profile-1" role="tabpanel">
                <h2 class="text-center">Langkah Pendaftaran</h2>
                <ul class="timeline">
                    <li>
                        <h3>Buat Akun</h3>
                        <p>Klik Sign Up, kemudian isi email dan password. Email yang diisi harus email yang aktif.</p>
                    </li>
                    <li>
                        <h3>Verifikasi Email</h3>
                        <p>Setelah langkah pertama, sistem akan mengirim link untuk mengaktifkan akun. Buka email yang diisikan, kemudian klik link yang dikirim.</p>
                    </li>
                    <li>
                        <h3>Login</h3>
                        <p>Jika langkah kedua telah dilakukan, maka akun sudah aktif. Silahkan Login.</p>
                    </li>
                    <li>
                        <h3>Kendala</h3>
                        <p>Hubungi narahubung informasi untuk pertanyaan seputar PSB.</p>
                        <p>Hubungi narahubung web admin untuk kendala sistem pendaftaran.</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>