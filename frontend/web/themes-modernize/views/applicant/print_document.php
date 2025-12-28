<?php

use common\models\ApplicantDocument;
use yii\helpers\Html;
?>
<style type=”text/css”>
    /* Custom CSS */
    .print-container {
        max-width: 1200px;
        margin-left: auto;
        margin-right: auto;
    }

    @media print {
        .print-container {
            max-width: none; /* Remove max-width on print */
            margin: 0; /* Remove margins on print */
            padding: 0; /* Remove padding on print */
        }
        .table-responsive{
            overflow:visible !important;
        }
    }
</style>


<div class="container-fluid print-container">
    <!-- Invoice Header -->
    <div class="row mt-1 mb-3">
        <div class="col-3 text-center">
            <?= $logoLeft ?>
        </div>
        <div class="col-6 text-center">
            <h4>Pendaftaran Peserta Didik Baru<br>
                SMA Negeri Modal Bangsa Arun<br>
                Tahun Ajaran 2026/2027</h4>
        </div>
        <div class="col-3 text-center">
            <?= $logoRight; ?>
        </div>
    </div>

    <!-- Invoice Details -->
    <div class="row mb-4">
        <div class="col-3">
            <div class="border p-3">
                <?= Html::img(str_replace('frontend', 'backend', $applicant->getImageUrl()), ['class' => 'img-fluid', 'style' => 'height:150px; object-fit:cover;']) ?>
            </div>
        </div>
        <div class="col-9">
            <div class="border p-3">
                <h4>
                    Reg : <?= $applicant->record_number; ?> - <?= $applicant->title; ?>
                    <span class="float-end"><small><i class="fas fa-print"></i> <?= Yii::$app->formatter->format(time(), 'date'); ?></small></span>
                </h4>
                <div class="row">
                    <div class="col-6">
                        <table class="table table-sm table-borderless">
                            <tbody>
                            <tr>
                                <td style="width: 80px">NISN</td>
                                <td>: <?= $applicantAlmamaterElementary->national_registration_number; ?></td>
                            </tr>
                            <tr>
                                <td>Almamater</td>
                                <td>: <?= $applicantAlmamaterElementary->title; ?></td>
                            </tr>
                            <tr>
                                <td>Rata-rata</td>
                                <td>: <?= $applicant->sumAverage(); ?></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-6">
                        <table class="table table-sm table-borderless">
                            <tbody>
                            <?php if (!empty($applicantDocuments)) { ?>
                                <?php foreach ($applicantDocuments as $doc) { ?>
                                    <tr>
                                        <td><?= $doc->title ?></td>
                                        <td>: <?= ApplicantDocument::getOneDocumentStatus($doc->document_status) ?></td>
                                    </tr>
                                <?php } ?>
                            <?php } else { ?>
                                <tr><td>Tidak ada dokumen.</td></tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
            </div>
        </div>
    </div>
    <!-- End Invoice Details -->

    <?= $this->render('_report_applicant', [
        'model' => $applicant,
        'religionList' => $religionList,
        'citizenshipList' => $citizenshipList,
        'ganderList' => $ganderList,
        'bloodTypeList' => $bloodTypeList,
        'childStatusList' => $childStatusList,
        'editMode' => $editMode
    ])
    ?>

    <?php if (!empty($applicantAlmamaterElementary)) { ?>

        <?= $this->render('/applicant-almamater/_report_almamater', [
            'model' => $applicantAlmamaterElementary,
            'applicantList' => $applicantList,
            'educationalStageList' => $educationalStageList,
            'schoolStatusList' => $schoolStatusList,
            'residenceList' => $residenceList,
            'transportationList' => $transportationList,
            'tuitionPayerList' => $tuitionPayerList,
            'editMode' => $editMode
        ])
        ?>
    <?php } else { ?>
        <hr class="my-4">
        <div class="border p-3">
            <p>Data Akademik Belum Diisi</p>
        </div>
        <?php
    }
    ?>


    <?php if (!empty($applicantAlmamaterJunior)) { ?>

        <?= $this->render('/applicant-almamater/_report_almamater', [
            'model' => $applicantAlmamaterJunior,
            'applicantList' => $applicantList,
            'educationalStageList' => $educationalStageList,
            'schoolStatusList' => $schoolStatusList,
            'tuitionPayerList' => $tuitionPayerList,
            'residenceList' => $residenceList,
            'transportationList' => $transportationList,
            'editMode' => $editMode
        ])
        ?>
    <?php } else { ?>
        <hr class="my-4">
        <div class="border p-3">
            <p>Data Almamater Belum Diisi</p>
        </div>
        <?php
    }
    ?>


    <?php if (!empty($applicant->applicantGrades)) { ?>
        <div class="card mt-4">
            <div class="card-header">
                <h3 class="card-title">Nilai Semester <span class="float-end">Rata-rata : <?= $applicant->sumAverage(); ?> </span></h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered table-striped" style="width:100%;">
                        <tbody>
                        <tr>
                            <th style="width:10px;min-width:0px">No</th>
                            <th><?= Yii::t('app', 'Course'); ?></th>
                            <?php
                            foreach ($semesters as $i => $semesterModel) {
                                ?>
                                <th><?= $semesterModel->title; ?></th>
                            <?php } ?>
                        </tr>

                        <?php
                        foreach ($courses as $i => $courseModel) {
                            ?>
                            <tr>
                                <td><?= ($i + 1); ?></td>
                                <td><?= $courseModel->title; ?></td>
                                <?php
                                foreach ($semesters as $i => $semesterModel) {
                                    $applicantGrade = \common\models\ApplicantGrade::find()
                                        ->where(['applicant_id' => $applicant->id, 'course_id' => $courseModel->id, 'semester_id' => $semesterModel->id])
                                        ->one();

                                    $grade = (!empty($applicantGrade->grade)) ? Yii::$app->formatter->asDecimal($applicantGrade->grade) : '-';
                                    ?>
                                    <td style="text-align:center"><?= $grade; ?></td>
                                    <?php
                                }
                                ?>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    <?php } else { ?>
        <hr class="my-4">
        <div class="border p-3">
            <p>Data Nilai Belum Diisi</p>
        </div>
        <?php
    }
    ?>


    <?php if (!empty($applicantFather)) { ?>

        <?= $this->render('/applicant-family/_report_family', [
            'model' => $applicantFather,
            'familyTypeList' => $familyTypeList,
            'religionList' => $religionList,
            'educationalStageList' => $educationalStageList,
            'occupationList' => $occupationList,
            'incomeList' => $incomeList,
            'citizenshipList' => $citizenshipList,
            'editMode' => $editMode
        ])
        ?>
    <?php } else { ?>
        <hr class="my-4">
        <div class="border p-3">
            <p>Data Ayah Belum Diisi</p>
        </div>
        <?php
    }
    ?>


    <?php if (!empty($applicantMother)) { ?>

        <?= $this->render('/applicant-family/_report_family', [
            'model' => $applicantMother,
            'familyTypeList' => $familyTypeList,
            'religionList' => $religionList,
            'educationalStageList' => $educationalStageList,
            'occupationList' => $occupationList,
            'incomeList' => $incomeList,
            'citizenshipList' => $citizenshipList,
            'editMode' => $editMode
        ])
        ?>
    <?php } else { ?>
        <hr class="my-4">
        <div class="border p-3">
            <p>Data Ibu Belum Diisi</p>
        </div>
        <?php
    }
    ?>


    <?php if (!empty($applicantGuardian)) { ?>

        <?= $this->render('/applicant-family/_report_family', [
            'model' => $applicantGuardian,
            'familyTypeList' => $familyTypeList,
            'religionList' => $religionList,
            'educationalStageList' => $educationalStageList,
            'occupationList' => $occupationList,
            'incomeList' => $incomeList,
            'citizenshipList' => $citizenshipList,
            'editMode' => $editMode
        ])
        ?>
    <?php } else { ?>
        <hr class="my-4">
        <div class="border p-3">
            <p>Data Wali Belum Diisi</p>
        </div>
        <?php
    }
    ?>

    <hr class="my-4">

    <p>
        Dengan ini saya menyatakan bahwa data yang diisikan adalah benar. Jika di kemudian hari
        ditemukan kesalahan, saya siap menerima segala konsekuensi yang diputuskan oleh pihak sekolah.
    </p>

    <!-- Invoice Footer -->
    <div class="row mt-4">
        <div class="col-6 text-center">
            <div class="border p-3">
                <address class="mb-0">
                    Mengetahui <br>
                    Orang Tua / Wali <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    (..................................................)
                </address>
            </div>
        </div>
        <div class="col-6 text-center">
            <div class="border p-3">
                <address class="mb-0">
                    .................................................., <?= Yii::$app->formatter->format(time(), 'date'); ?> <br>
                    Calon Siswa
                    <br>
                    <br>
                    <br>
                    <br>
                    (<?= $applicant->title; ?>)
                </address>
            </div>
        </div>
    </div>

    <button class="btn btn-primary mt-3 float-end d-print-none" onclick="javascript:window.print();"><i class="fas fa-print"></i> Print</button>

    <?php
    $this->title = 'Print ' . $applicant->title;
    ?>

</div></div>