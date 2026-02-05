<?php
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

?>

<style>
    @media print {
        body {
            width: 100%;
            margin: 0;
        }
        .container-fluid {
            padding: 0;
        }
    }
</style>

    <div class="container-fluid">
        <!-- Invoice Header -->
        <div class="row my-4 align-items-center">
            <div class="col-3 text-center">
                <?= $logoLeft; ?>
            </div>
            <div class="col-6 text-center">
                <h3>
                    Kartu Peserta Ujian PPDB<br/>
                    SMAN Modal Bangsa Arun<br/>
                    Tahun Ajaran 2026/2027
                </h3>
            </div>
            <div class="col-3 text-center">
                <?= $logoRight; ?>
            </div>
        </div>

        <!-- Invoice Details -->
        <div class="row mb-4">
            <div class="col-3">
                <div class="border p-3">
                    <?= Html::img(str_replace('frontend', 'backend', $applicant->getImageUrl()), ['class'=>'img-fluid','style'=>'max-height:150px; object-fit: contain;'])?>
                </div>
            </div>
            <div class="col-9">
                <div class="border p-3">
                    <div class="d-flex justify-content-between align-items-start">
                        <h4>
                            Nomor Peserta : <?= $applicant->record_number; ?>
                        </h4>
                        <small class="text-muted"><i class="fas fa-print"></i> <?= Yii::$app->formatter->format(time(), 'date'); ?></small>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-sm table-borderless mb-0">
                                <tbody>
                                <tr>
                                    <td style="width: 80px">Nama</td>
                                    <td>: <?= $applicant->title; ?></td>
                                </tr>
                                <tr>
                                    <td>NISN</td>
                                    <td>: <?= $applicantAlmamaterJunior->national_registration_number; ?></td>
                                </tr>
                                <tr>
                                    <td>Almamater</td>
                                    <td>: <?= $applicantAlmamaterJunior->title; ?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-7">
                <div class="border p-3 mb-3">
                    <p><strong>Kegiatan SPMB 2026 Jalur Prestasi</strong></p>
                    <ul class="list-unstyled">
                        <li><strong>Minggu, 8 Februari 2026</strong></li>
                        <li>
                            <span>Materi wawancara:</span>
                            <ul>
                                <li>- Bakat minat</li>
                                <li>- Kemampuan baca Quran</li>
                                <li>- Kemampuan dasar Bahasa Inggris</li>
                            </ul>
                        </li>

                        <li>
                            <span>Berkas yang harus dibawa:</span>
                            <ul>
                                <li>- Kartu Pendaftaran</li>
                                <li>- Fotokopi Kartu NISN (2 lembar)</li>
                                <li>- Fotokopi Kartu Keluarga</li>
                                <li>- Fotokopi Akte Kelahiran</li>
                                <li>- Fotokopi Rapor Semester 2,3,4 dan 5 (legalisir)</li>
                                <li>- Surat Keterangan Aktif (asli)</li>
                                <li>- Sertifikat Prestasi yang di upload (asli &amp; photocopy)</li>
                            </ul>
                        </li>
                    </ul>
                    Semua berkas dimasukkan dalam 1 folder. Merah : perempuan dan biru: laki-laki.
                    Calon siswa memakai pakaian seragam sekolah asal, alat tulis yang diperlukan.
                    <p><strong>Informasi Pemeriksaan Kesehatan dan Daftar Ulang akan disampaikan kemudian</strong></p>
                </div>
            </div>
            <div class="col-5">
                <div class="border p-3 mb-3">
                    <address class="mb-0">
                        <strong>VERIFIKASI PENGAWAS</strong>
                        <br/>
                        <br/>
                        <table class="table table-borderless">
                            <tbody>
                            <tr>
                                <td>Kemampuan Bahasa</td>
                                <td>:</td>
                            </tr>
                            <tr>
                                <td>Bakat Minat<br/></td>
                                <td>:</td>
                            </tr>
                            <tr>
                                <td>Baca Quran</td>
                                <td>:</td>
                            </tr>
                            </tbody>
                        </table>
                    </address>
                </div>
                <div class="border p-3 text-center">
                    <address class="mb-0">
                        <span class="float-start">Lhokseumawe,</span><br>
                        Panitia SPMB
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        (..................................................)
                    </address>
                </div>
            </div>
        </div>
        <button class="btn btn-primary my-3 float-end d-print-none" onclick="javascript:window.print();">
            <i class="fas fa-print"></i> Print
        </button>
    </div>

<?php
$this->title = 'Print '.$applicant->title;
?>