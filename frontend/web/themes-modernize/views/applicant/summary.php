<?php

use common\models\Applicant;
use common\models\ApplicantFamily;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var \common\models\Applicant $applicant
 */

$this->title = $applicant->title;
$this->params['breadcrumbs'][] = ['label' => 'Applicants', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$finalStatus        = $applicant->final_status;
$buttonText         = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 'Selesai pada '.Yii::$app->formatter->format($applicant->date_final, 'datetime') : 'Finalisasi';
$buttonIcon         = ($finalStatus == Applicant::FINAL_STATUS_YES) ? '<i class="fa fa-check"></i>' :'<i class="fa fa-exclamation-circle"></i>';
$buttonLabel        = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 'primary' :'danger';

$finalDisplayStatus         = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 
                                '<button type="button" class="btn btn-md btn-'.$buttonLabel.'" disabled>'.$buttonIcon.' '.$buttonText.'</button>'
                                : 
                                Html::a($buttonIcon.' '.$buttonText, ['final','title'=>$applicant->title], ['data-method' => 'POST', 'data-confirm'=>'Data setelah finalisasi tidak bisa diedit. Lanjutkan?','class' => 'btn btn-'.$buttonLabel]) ;

$printBerkasDisplay   = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 
                                Html::a('<i class="fa fa-print"></i> Print Berkas', ['print-document','title'=>$applicant->title], ['class' => 'btn btn-success']) 
                                :
                                '<button type="button" class="btn btn-md btn-success" disabled><i class="fa fa-print"></i> Print Berkas</button>';

$printKartuDisplay   = ($finalStatus == Applicant::FINAL_STATUS_YES) ? 
                                Html::a('<i class="fa fa-print"></i> Print Kartu', ['print-card','title'=>$applicant->title], ['class' => 'btn btn-success']) 
                                :
                                '<button type="button" class="btn btn-md btn-success" disabled><i class="fa fa-print"></i> Print Kartu</button>';


?>


<!-- Info Panel -->
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-tasks"></i> Summary</h3>
    </div>
    <div class="panel-body">
        <h4>Progress Pengisian Data <span class="pull pull-right"><?= $finalDisplayStatus.' '.$printBerkasDisplay.' '.$printKartuDisplay; ?></span></h4>
        <br>
        <div class="tag-box tag-box-v2" style="margin-bottom:0px; padding:10px">
            <ol>
                <li style="padding-bottom:5px">Diharapkan setiap peserta mengisi data sehingga progress indikator mencapai sempurna.</li>
                <li style="padding-bottom:5px">Klik tombol <span class="label label-primary">Finalisasi</span> setelah menyelesaikan seluruh proses pengisian data.</li>
                <li style="padding-bottom:5px">Tombol <span class="label label-success">Print</span> bisa diakses setelah finalisasi data.</li>
                <li style="padding-bottom:5px">Web Admin : <strong>Syahrul Hamdi, S.Pd (085 358 836836)</strong> - <strong>Nanta Es (081 804 292926)</strong></li>
            </ol>

        </div>
                
        
        <br>
        
        <?php 
            if(Yii::$app->params['Feat-Applicant']){
                
                $fieldFilled     = 0;              
                $totalField     = 19;
                
                /*01*/(!empty($applicant->identity_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*02*/(!empty($applicant->title)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*03*/(!empty($applicant->gender_status)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*04*/(!empty($applicant->birth_place)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*05*/(!empty($applicant->date_birth)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*06*/(!empty($applicant->religion_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*07*/(!empty($applicant->citizenship_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*08*/(!empty($applicant->address_street)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*09*/(!empty($applicant->address_village)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*10*/(!empty($applicant->address_sub_district)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*11*/(!empty($applicant->address_city)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*12*/(!empty($applicant->address_province)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*13*/(!empty($applicant->phone_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*14*/(!empty($applicant->hobby)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*15*/(!empty($applicant->blood_type)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*16*/(!empty($applicant->height)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*17*/(!empty($applicant->weight)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*18*/(!empty($applicant->illness)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*19*/(!empty($applicant->disability)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*20*///(!empty($applicant->description)) ? ($fieldFilled+=1) : ($fieldFilled+0);

                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs"><?= Html::a('<i class="fa fa-angle-right "></i> Biodata', ['applicant/profile','title'=>$applicant->title]);?> <span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>
                    
        <?php 
            if(Yii::$app->params['Feat-Applicant-Academic']){
                
                $fieldFilled     = 0;              
                $totalField     = 13;
                
                /*01*/(!empty($applicantAcademic->title)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*02*/(!empty($applicantAcademic->academic_year_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*03*/(!empty($applicantAcademic->national_registration_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*04*/(!empty($applicantAcademic->school_registration_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*05*/(!empty($applicantAcademic->residence_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*06*/(!empty($applicantAcademic->address_street)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*07*/(!empty($applicantAcademic->address_village)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*08*/(!empty($applicantAcademic->address_sub_district)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*09*/(!empty($applicantAcademic->address_city)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*10*/(!empty($applicantAcademic->address_province)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*11*/(!empty($applicantAcademic->distance)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*12*/(!empty($applicantAcademic->transportation_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*13*/(!empty($applicantAcademic->tuition_payer_status)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*14*///(!empty($applicantAcademic->description)) ? ($fieldFilled+=1) : ($fieldFilled+0);

                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs">Data Akademik <span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>                
    
        <?php 
            if(Yii::$app->params['Feat-Applicant-Almamater']){
                
                $fieldFilled     = 0;              
                $totalField     = 18;
                
                /*01*/(!empty($applicantAlmamater->title)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*02*/(!empty($applicantAlmamater->national_school_principal_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*03*/(!empty($applicantAlmamater->educational_stage_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*04*/(!empty($applicantAlmamater->school_status)) ? ($fieldFilled+=1) : ($fieldFilled+0);                
                /*05*/(!empty($applicantAlmamater->national_registration_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*06*/(!empty($applicantAlmamater->school_registration_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*07*/(!empty($applicantAlmamater->date_graduation)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*08*/(!empty($applicantAlmamater->study_time_length)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*09*/(!empty($applicantAlmamater->tuition_payer)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                
                /*10*///(!empty($applicantAlmamater->certificate_serial_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*11*///(!empty($applicantAlmamater->examination_serial_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*12*///(!empty($applicantAlmamater->examination_card_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);                
                
                /*13*/(!empty($applicantAlmamater->address_street)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*14*/(!empty($applicantAlmamater->address_village)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*15*/(!empty($applicantAlmamater->address_sub_district)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*16*/(!empty($applicantAlmamater->address_city)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*17*/(!empty($applicantAlmamater->address_province)) ? ($fieldFilled+=1) : ($fieldFilled+0);                
                
                /*18*/(!empty($applicantAlmamater->residence_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);                
                /*19*/(!empty($applicantAlmamater->transportation_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*20*/(!empty($applicantAlmamater->distance)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                
                /*21*/(!empty($applicantAlmamater->phone_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*22*///(!empty($applicantAlmamater->description)) ? ($fieldFilled+=1) : ($fieldFilled+0);

                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs"><?= Html::a('<i class="fa fa-angle-right "></i> Almamater', ['applicant/almamater','title'=>$applicant->title]);?><span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>  
               
        <?php 
            if(Yii::$app->params['Feat-Applicant-Family']){
                
                $fieldFilled     = 0;              
                $totalField     = 15;

                /*01*/(!empty($applicantFather->title)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*02*/(!empty($applicantFather->identity_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*03*/(!empty($applicantFather->birth_place)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*04*/(!empty($applicantFather->date_birth)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*05*/(!empty($applicantFather->religion_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*06*/(!empty($applicantFather->educational_stage_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*07*/(!empty($applicantFather->occupation_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*08*/(!empty($applicantFather->income_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*09*/(!empty($applicantFather->phone_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*10*/(!empty($applicantFather->citizenship_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*11*/(!empty($applicantFather->address_street)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*12*/(!empty($applicantFather->address_village)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*13*/(!empty($applicantFather->address_sub_district)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*14*/(!empty($applicantFather->address_city)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*15*/(!empty($applicantFather->address_province)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*16*///(!empty($applicantFather->description)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs"><?= Html::a('<i class="fa fa-angle-right "></i> Ayah', ['applicant/family','type'=>ApplicantFamily::FAMILY_TYPE_FATHER,'title'=>$applicant->title]);?> <span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>                 
            
        <?php 
            if(Yii::$app->params['Feat-Applicant-Family']){
                
                $fieldFilled     = 0;              
                $totalField     = 15;

                /*01*/(!empty($applicantMother->title)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*02*/(!empty($applicantMother->identity_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*03*/(!empty($applicantMother->birth_place)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*04*/(!empty($applicantMother->date_birth)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*05*/(!empty($applicantMother->religion_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*06*/(!empty($applicantMother->educational_stage_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*07*/(!empty($applicantMother->occupation_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*08*/(!empty($applicantMother->income_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*09*/(!empty($applicantMother->phone_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*10*/(!empty($applicantMother->citizenship_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*11*/(!empty($applicantMother->address_street)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*12*/(!empty($applicantMother->address_village)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*13*/(!empty($applicantMother->address_sub_district)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*14*/(!empty($applicantMother->address_city)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*15*/(!empty($applicantMother->address_province)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*16*///(!empty($applicantMother->description)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs"><?= Html::a('<i class="fa fa-angle-right "></i> Ibu', ['applicant/family','type'=>ApplicantFamily::FAMILY_TYPE_MOTHER,'title'=>$applicant->title]);?><span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>                
                
        <?php 
            if(Yii::$app->params['Feat-Applicant-Family']){
                
                $fieldFilled     = 0;              
                $totalField     = 15;

                /*01*/(!empty($applicantGuardian->title)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*02*/(!empty($applicantGuardian->identity_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*03*/(!empty($applicantGuardian->birth_place)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*04*/(!empty($applicantGuardian->date_birth)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*05*/(!empty($applicantGuardian->religion_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*06*/(!empty($applicantGuardian->educational_stage_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*07*/(!empty($applicantGuardian->occupation_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*08*/(!empty($applicantGuardian->income_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*09*/(!empty($applicantGuardian->phone_number)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*10*/(!empty($applicantGuardian->citizenship_id)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*11*/(!empty($applicantGuardian->address_street)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*12*/(!empty($applicantGuardian->address_village)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*13*/(!empty($applicantGuardian->address_sub_district)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*14*/(!empty($applicantGuardian->address_city)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*15*/(!empty($applicantGuardian->address_province)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                /*16*///(!empty($applicantGuardian->description)) ? ($fieldFilled+=1) : ($fieldFilled+0);
                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs"><?= Html::a('<i class="fa fa-angle-right "></i> Wali', ['applicant/family','type'=>ApplicantFamily::FAMILY_TYPE_GUARDIAN,'title'=>$applicant->title]);?><span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>                
                
        <?php 
            if(Yii::$app->params['Feat-Applicant-Grade']){
                
                $fieldFilled     = 0;              
                $totalField     = count($semesters)*count($courses);

                
                foreach ($semesters as $semesterModel) {    
                    foreach ($courses as $courseModel) {

                        $applicantGrade = \common\models\ApplicantGrade::find()->where([
                            'applicant_id'=>$applicant->id,
                            'semester_id'=>$semesterModel->id,
                            'course_id'=>$courseModel->id,
                        ])->one();

                        if(!empty($applicantGrade)){
                            /*01*/($applicantGrade->grade > 0) ? ($fieldFilled+=1) : ($fieldFilled+0);
                        }
                    }

                }

                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs"><?= Html::a('<i class="fa fa-angle-right "></i> Raport ', ['applicant/recapitulation','title'=>$semesterModel->title]);?><span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>                  
                
        <?php 
            if(Yii::$app->params['Feat-Applicant-Document']){
                
                $fieldFilled     = 0;              
                $totalField     = count($documents);

                
                foreach ($documents as $documentModel) {    
                    $applicantDocument = \common\models\ApplicantDocument::find()->where([
                        'applicant_id'=>$applicant->id,
                        'document_id'=>$documentModel->id,
                    ])->one();
                    
                    if(!empty($applicantDocument)){
                        /*01*/($applicantDocument->document_status == \common\models\ApplicantDocument::DOCUMENT_TYPE_YES) ? ($fieldFilled+=1) : ($fieldFilled+0);
                    }
                    
                }

                $percentEmpty = ($fieldFilled == 0) ? 0 :ceil((($fieldFilled/$totalField)*100));
        ?>
                <h3 class="heading-xs">Data Dokumen <span class="pull-right"><?=$percentEmpty;?>%</span></h3>
                <div class="progress progress-u progress-xxs">
                    <div style="width: <?=$percentEmpty;?>%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="<?=$percentEmpty;?>" role="progressbar" class="progress-bar progress-bar-u">
                    </div>
                </div>
        <?php } ?>  
  
    </div>
</div>
<!-- End Info Panel -->

