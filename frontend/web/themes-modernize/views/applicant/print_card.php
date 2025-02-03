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
                    Tahun Ajaran 2025/2026
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

        <!-- Invoice Footer -->
        <div class="row">
            <div class="col-7">
                <div class="border p-3 mb-3">
                    <p><strong>Jadwal Kegiatan PPDB TP 2025/2026 Gel 2</strong></p>
                    <ul class="list-unstyled">
                        <li>Pendaftaran Calon Siswa : Senin, 03 Feb - Minggu 09 Februari 2025</li>
                        <li>Tes Akademik, Kesehatan & Wawancara : Selasa, 11 Februari 2025, pukul 08.00 - Selesai</li>
                        <li>Pengumuman Kelulusan : Rabu, 12 Februari 2025</li>
                        <li>
                            Rapat Dengan Komite : Sabtu, 15 Februari 2025, Pukul 09.00-Selesai
                        </li>
                        <li>
                            Pendaftaran Ulang : 15-21 Februari 2025, Pukul 08.30-15.00 (Sabtu,
                            Pukul 08.30-14.00)
                        </li>
                    </ul>

                    <p><strong>Informasi Tes</strong></p>

                    <ul class="list-unstyled">
                        <li>Hari/Tanggal : Selasa, 11 Februari 2025</li>
                        <li>Mapel : Matematika, Bahasa Indonesia, IPA, Bahasa Inggris</li>
                        <li>Waktu : Tes Akademik 08.00-10.30 / Wawancara & Kesehatan (11.00 - selesai)</li>
                        <li>Lokasi : SMAN Modal Bangsa Arun</li>
                    </ul>

                    <p><strong>Perlengkapan Peserta Tes</strong></p>
                    <ul class="list-unstyled">
                        <li>Kartu Peserta PPDB 2024/2025</li>
                        <li>Laptop atau smartphone</li>
                        <li>Pakaian Seragam Sekolah Asal dan Memakai Sepatu</li>
                        <li>Alat Tulis : Pensil, Karet Penghapus, Rautan, Pulpen</li>
                    </ul>
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
                                <td style="width: 50%">Tes Akademik</td>
                                <td>:</td>
                            </tr>
                            <tr>
                                <td>Kemampuan Bahasa</td>
                                <td>:</td>
                            </tr>
                            <tr>
                                <td>Wawancara<br/></td>
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
                        Panitia PPDB
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