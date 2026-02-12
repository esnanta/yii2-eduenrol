<?php

use common\helper\DataCompletionHelper;
use common\models\Applicant;
use common\models\ApplicantFamily;
use common\models\ApplicantGrade;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var \common\models\Applicant $applicant
 * @var \common\models\ApplicantAlmamater $applicantAlmamaterElementary
 * @var \common\models\ApplicantAlmamater $applicantAlmamaterJunior
 * @var \common\models\ApplicantFamily $applicantFather
 * @var \common\models\ApplicantFamily $applicantMother
 * @var \common\models\ApplicantFamily $applicantGuardian
 * @var \common\models\Semester $semesters
 * @var \common\models\Course $courses
 */

$this->title = $applicant->title;
$this->params['breadcrumbs'][] = ['label' => 'Applicants', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$finalStatus        = $applicant->final_status;
$buttonText         = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 'Selesai pada '.Yii::$app->formatter->format($applicant->date_final, 'datetime') : 'Finalisasi';
$buttonIcon         = ($finalStatus == Applicant::FINAL_STATUS_YES) ? '<i class="fa fa-check"></i>' :'<i class="fa fa-exclamation-circle"></i>';
$buttonLabel        = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 'primary' :'danger';

$finalDisplayStatus         = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 
                                '<button type="button" class="btn btn-sm btn-'.$buttonLabel.'" disabled>'.$buttonIcon.' '.$buttonText.'</button>'
                                : 
                                Html::a($buttonIcon.' '.$buttonText, ['final','title'=>$applicant->title], ['data-method' => 'POST', 'data-confirm'=>'Data setelah finalisasi tidak bisa diedit. Lanjutkan?','class' => 'btn btn-'.$buttonLabel]) ;

$printBerkasDisplay   = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 
    Html::a('<i class="fa fa-print"></i> Print Berkas', ['print-document','title'=>$applicant->title], ['class' => 'btn btn-sm btn-success'])
    :
    '<button type="button" class="btn btn-sm btn-success" disabled><i class="fa fa-print"></i> Print Berkas</button>';

$printKartuDisplay   = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 
    Html::a('<i class="fa fa-print"></i> Print Kartu', ['print-card','title'=>$applicant->title], ['class' => 'btn btn-sm btn-success'])
    :
    '<button type="button" class="btn btn-sm btn-success" disabled><i class="fa fa-print"></i> Print Kartu</button>';

$printKartuDisplayAchievement   = ($finalStatus == Applicant::FINAL_STATUS_YES) ?
    Html::a('<i class="fa fa-print"></i> Print Kartu (Jalur Prestasi)', ['print-card-achievement','title'=>$applicant->title], ['class' => 'btn btn-sm btn-success'])
    :
    '<button type="button" class="btn btn-sm btn-success" disabled><i class="fa fa-print"></i> Print Kartu (Jalur Prestasi)</button>';


$columnsApplicant = [
    'identity_number', 'title', 'gender_status', 'birth_place', 'date_birth',
    'religion_id', 'citizenship_status',
    'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province',
    'phone_number', 'hobby', 'blood_type', 'height', 'weight', 'illness', 'disability'
];

$filledApplicantPercentage = DataCompletionHelper::calculateFilledPercentage(
        $applicant, $columnsApplicant
);
$emptyColumnsApplicant = DataCompletionHelper::getEmptyColumns($applicant, $columnsApplicant);

$columnsAcademic = [
    'title', 'national_registration_number', 'school_registration_number',
    'residence_id',
    'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province',
    'transportation_id', 'tuition_payer'
];

$filledAcademicElementaryPercentage = DataCompletionHelper::calculateFilledPercentage(
        $applicantAlmamaterElementary, $columnsAcademic);

$emptyColumnsAcademicElementary = DataCompletionHelper::getEmptyColumns(
        $applicantAlmamaterElementary, $columnsAcademic);

$filledAcademicJuniorPercentage = DataCompletionHelper::calculateFilledPercentage(
    $applicantAlmamaterJunior, $columnsAcademic);

$emptyColumnsAcademicJunior = DataCompletionHelper::getEmptyColumns(
    $applicantAlmamaterJunior, $columnsAcademic);

$columnsFamily = [
    'title', 'identity_number', 'birth_place', 'date_birth',
    'religion_id', 'citizenship_status','educational_stage_id', 'occupation_id', 'income_id',
    'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province',
    'phone_number'
];
$filledFamilyFatherPercentage = DataCompletionHelper::calculateFilledPercentage(
    $applicantFather, $columnsFamily
);
$filledFamilyMotherPercentage = DataCompletionHelper::calculateFilledPercentage(
    $applicantMother, $columnsFamily
);
$filledFamilyGuardianPercentage = DataCompletionHelper::calculateFilledPercentage(
    $applicantGuardian, $columnsFamily
);


$fieldFilled = 0;
$totalFields = count($semesters) * count($courses); // Total expected grade fields

foreach ($semesters as $semesterModel) {
    foreach ($courses as $courseModel) {

        $applicantGrade = ApplicantGrade::find()->where([
            'applicant_id' => $applicant->id,
            'semester_id'  => $semesterModel->id,
            'course_id'    => $courseModel->id,
        ])->one();

        if (!empty($applicantGrade) && $applicantGrade->grade > 0) {
            // Check if 'grade' is filled
            $filledPercentage = DataCompletionHelper::calculateFilledPercentage($applicantGrade, ['grade']);

            if ($filledPercentage > 0) {
                $fieldFilled++; // Count as filled
            }
        }
    }
}

// Calculate the overall filled percentage
$overallFilledGradePercentage = ceil(($totalFields > 0) ? ($fieldFilled / $totalFields) * 100 : 0);
?>
<!-- Info Panel -->
<div class="card">
    <div class="card-header" style="background-color:#e3f2fd; ">
        <h3 class="card-title"><i class="fas fa-tasks"></i> Summary</h3>
    </div>
    <div class="card-body">
        <h4>Progress Pengisian Data <span class="float-end"><?= $finalDisplayStatus.' '.$printBerkasDisplay.' '.$printKartuDisplay.' '.$printKartuDisplayAchievement; ?></span></h4>
        <br>
        <div class="bg-light p-3 mb-3" style="border: 1px solid #ddd;">
            <ol class="mb-0">
                <li class="mb-2">Diharapkan setiap peserta mengisi data sehingga progress indikator mencapai sempurna.</li>
                <li class="mb-2">Klik tombol <span class="badge bg-primary">Finalisasi</span> setelah menyelesaikan seluruh proses pengisian data.</li>
                <li class="mb-2">Tombol <span class="badge bg-success">Print</span> bisa diakses setelah finalisasi data.</li>
                <li class="mb-2">Admin : <strong>Syahrul Hamdi, S.Pd., M. Pd. (085 358 836836)</strong> - <strong>Nanta Es, S. Kom (081 804 292926)</strong></li>
                <li class="mb-2">
                    <?php $whatsappGroupLink = 'https://chat.whatsapp.com/BXfMNCAi3KUKkiLYsQBbzV?mode=gi_t'; ?>
                    Ikut grup WA : <?= Html::a('SPMB SMAN MBA Gel. 2', $whatsappGroupLink, ['target' => '_blank', 'rel' => 'noopener noreferrer']);;?>
                </li>
            </ol>
        </div>


        <table class="table table-striped table-bordered mb-0">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col"><?=Yii::t('app', 'Data');?></th>
                <th scope="col"><?=Yii::t('app', 'Progress');?></th>
                <th scope="col"><?=Yii::t('app', 'Empty Columns');?></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td><?=Yii::t('app', 'Bio Data');?></td>
                <td>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                             style="width: <?=$filledApplicantPercentage;?>%"
                             aria-valuenow="<?=$filledApplicantPercentage;?>"
                             aria-valuemin="0"
                             aria-valuemax="100">
                            <?=$filledApplicantPercentage;?> %
                        </div>
                    </div>
                </td>
                <td><?= implode(', ', $emptyColumnsApplicant) ;?></td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td><?=Yii::t('app', 'Elementary School');?></td>
                <td>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                             style="width: <?=$filledAcademicElementaryPercentage;?>%"
                             aria-valuenow="<?=$filledAcademicElementaryPercentage;?>"
                             aria-valuemin="0"
                             aria-valuemax="100">
                            <?=$filledAcademicElementaryPercentage;?> %
                        </div>
                    </div>
                </td>
                <td><?= implode(', ', $emptyColumnsAcademicElementary) ;?></td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td><?=Yii::t('app', 'Junior High School');?></td>
                <td>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                             style="width: <?=$filledAcademicJuniorPercentage;?>%"
                             aria-valuenow="<?=$filledAcademicJuniorPercentage;?>"
                             aria-valuemin="0"
                             aria-valuemax="100">
                            <?=$filledAcademicJuniorPercentage;?> %
                        </div>
                    </div>
                </td>
                <td><?= implode(', ', $emptyColumnsAcademicJunior) ;?></td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td><?= Yii::t('app', 'Father') ?></td>
                <td>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                             style="width: <?=$filledFamilyFatherPercentage;?>%"
                             aria-valuenow="<?=$filledFamilyFatherPercentage;?>"
                             aria-valuemin="0"
                             aria-valuemax="100">
                            <?=$filledFamilyFatherPercentage;?> %
                        </div>
                    </div>
                </td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td><?=Yii::t('app', 'Mother');?></td>
                <td>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                             style="width: <?=$filledFamilyMotherPercentage;?>%"
                             aria-valuenow="<?=$filledFamilyMotherPercentage;?>"
                             aria-valuemin="0"
                             aria-valuemax="100">
                            <?=$filledFamilyMotherPercentage;?> %
                        </div>
                    </div>
                </td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">6</th>
                <td><?=Yii::t('app', 'Guardian');?></td>
                <td>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                             style="width: <?=$filledFamilyGuardianPercentage;?>%"
                             aria-valuenow="<?=$filledFamilyGuardianPercentage;?>"
                             aria-valuemin="0"
                             aria-valuemax="100">
                            <?=$filledFamilyGuardianPercentage;?> %
                        </div>
                    </div>
                </td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td><?=Yii::t('app', 'Grade');?></td>
                <td>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                             style="width: <?=$overallFilledGradePercentage;?>%"
                             aria-valuenow="<?=$overallFilledGradePercentage;?>"
                             aria-valuemin="0"
                             aria-valuemax="100">
                            <?=$overallFilledGradePercentage;?> %
                        </div>
                    </div>
                </td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- End Info Panel -->
