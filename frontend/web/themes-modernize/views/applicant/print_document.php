<?php

use yii\helpers\Html;

$width1 = '5px';
$width2 = '300px';
?>

<!--Invoice Header-->
<div class="row invoice-header">
    <div class="col-xs-3 text-center">
        <?= Html::img(str_replace('frontend', 'backend', $logoLeft->getImageUrl()), ['class'=>'img-responsive','style'=>'width:80px;height:90px'])?> 
    </div>
    <div class="col-xs-6 invoice-numb text-center">
        <h3>Dokumen Pendaftaran Siswa Baru<br>
        SMA Negeri Modal Bangsa Arun<br>
        Tahun Ajaran 2020/2021</h3>
    </div>
    <div class="col-xs-3 text-center">
        <?= Html::img(str_replace('frontend', 'backend', $logoRight->getImageUrl()), ['class'=>'img-responsive pull-right','style'=>'width:80px;height:90px'])?> 
    </div> 
</div>

<br>

<!--Invoice Detials-->
<div class="row invoice-info">
    <div class="col-xs-3">
        <div class="tag-box tag-box-v3" style="padding:10px">
            <?= Html::img(str_replace('frontend', 'backend', $applicant->getImageUrl()), ['class'=>'img-responsive','style'=>'width:100%;height:150px'])?> 
        </div>
    </div>
    <div class="col-xs-9">
        <div class="tag-box tag-box-v3" style="padding:10px">
            <h4>
                Reg : <?=$applicant->record_number;?> - <?=$applicant->title;?>
                <span class="pull pull-right"><small><i class="fa fa-print"></i> <?= Yii::$app->formatter->format(time(), 'date'); ?></small></span>
            </h4>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <table class="table table-striped" style="margin-bottom:0px">
                        <tbody>
                            <tr>
                                <td style="width: 50px">NISN</td>
                                <td>: <?= $applicantAlmamater->national_registration_number;?></td>
                            </tr>   
                            <tr>
                                <td>Almamater</td>
                                <td>: <?= $applicantAlmamater->title;?></td>
                            </tr>   
                            <tr>
                                <td>Rata-rata</td>
                                <td>: <?= Yii::$app->formatter->asDecimal($applicant->sumAverage());?></td>
                            </tr>                    
                        </tbody>
                    </table>                      
                </div>
            </div>             
        </div>
    </div>
</div>
<!--End Invoice Detials-->

<?= $this->render('profile', [
    'model'             => $applicant,
    'userList'          => $userList,
    'religionList'      => $religionList,
    'citizenshipList'   => $citizenshipList,
    'ganderList'        => $ganderList,
    'bloodTypeList'     => $bloodTypeList,
    'childStatusList'   => $childStatusList,   
    'editMode'          => $editMode
]) 
?>



<?php if(!empty($applicantAcademic)){ ?>
    
    <?= $this->render('academic', [

        'model'                 => $applicantAcademic,
        'applicantList'         => $applicantList,
        'academicYearList'      => $academicYearList,
        'residenceList'         => $residenceList,
        'transportationList'    => $transportationList,
        'tuitionPayerList'      => $tuitionPayerList,

        'editMode'              => $editMode
    ]) 
    ?>
<?php }
    else{
?>
<!--        <hr class="devider devider-db">
        <div class="tag-box tag-box-v3">
            <p>Data Akademik Belum Diisi</p>
        </div>-->
<?php
    }
?>
    
    
<?php if(!empty($applicantAlmamater)){ ?>    
    

    <?= $this->render('almamater', [

        'model'                 => $applicantAlmamater,
        'applicantList'         => $applicantList,
        'educationalStageList'  => $educationalStageList,
        'schoolStatusList'      => $schoolStatusList,
        'tuitionPayerList'      => $tuitionPayerList,
        'residenceList'         => $residenceList,
        'transportationList'    => $transportationList,

        'editMode'              => $editMode
    ]) 
    ?>
<?php }
    else{
?>
        <hr class="devider devider-db">
        <div class="tag-box tag-box-v3">
            <p>Data Almamater Belum Diisi</p>
        </div>
<?php
    }
?>

    
<?php if(!empty($applicant->applicantGrades)){ ?>        
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Nilai Semester <span class="pull pull-right">Rata-rata : <?=$applicant->sumAverage();?> </span></h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-bordered table-striped">
                <tbody>

                    <tr>
                        <th style="width:10px;min-width:0px">No</th>
                        <th><?=Yii::$app->params['Attribute_Course'];?></th>
                            <?php
                                foreach ($semesters as $i=>$semesterModel) { 
                            ?>                    
                                    <th><?=$semesterModel->title;?></th>
                            <?php } ?>
                    </tr>

                    <?php
                        foreach ($courses as $i=>$courseModel) { 
                    ?>
                            <tr>
                                <td><?= ($i+1) ;?></td>
                                <td><?= $courseModel->title;?></td> 
                                <?php
                                    foreach ($semesters as $i=>$semesterModel) { 
                                        $applicantGrade = \common\models\ApplicantGrade::find()
                                            ->where(['applicant_id'=>$applicant->id,'course_id'=>$courseModel->id,'semester_id'=>$semesterModel->id])
                                            ->one();
                                        
                                        $grade = (!empty($applicantGrade->grade)) ? Yii::$app->formatter->asDecimal($applicantGrade->grade) : '-';
                                ?>
                                        <td style="text-align:center"><?= $grade; ?></td>
                                <?php 
                                    }                        
                                ?>     
                            </tr>        
                    <?php }  ?>                 
                </tbody>
            </table>      
        </div>
    </div>
<?php }
    else{
?>
        <hr class="devider devider-db">
        <div class="tag-box tag-box-v3">
            <p>Data Nilai Belum Diisi</p>
        </div>
<?php
    }
?>
    
    
<?php if(!empty($applicantFather)){ ?>    

    <?= $this->render('family', [

        'model'                 => $applicantFather,
        'familyTypeList'        => $familyTypeList,
        'religionList'          => $religionList,
        'educationalStageList'  => $educationalStageList,
        'occupationList'        => $occupationList,
        'incomeList'            => $incomeList,
        'citizenshipList'       => $citizenshipList,

        'editMode'              => $editMode
    ]) 
    ?>
<?php }
    else{
?>
        <hr class="devider devider-db">
        <div class="tag-box tag-box-v3">
            <p>Data Ayah Belum Diisi</p>
        </div>
<?php
    }
?>

    
<?php if(!empty($applicantMother)){ ?>        

    <?= $this->render('family', [

        'model'                 => $applicantMother,
        'familyTypeList'        => $familyTypeList,
        'religionList'          => $religionList,
        'educationalStageList'  => $educationalStageList,
        'occupationList'        => $occupationList,
        'incomeList'            => $incomeList,
        'citizenshipList'       => $citizenshipList,

        'editMode'              => $editMode
    ]) 
    ?>
<?php }
    else{
?>
        <hr class="devider devider-db">
        <div class="tag-box tag-box-v3">
            <p>Data Ibu Belum Diisi</p>
        </div>
<?php
    }
?>
    
 
<?php if(!empty($applicantGuardian)){ ?>

    <?= $this->render('family', [

        'model'                 => $applicantGuardian,
        'familyTypeList'        => $familyTypeList,
        'religionList'          => $religionList,
        'educationalStageList'  => $educationalStageList,
        'occupationList'        => $occupationList,
        'incomeList'            => $incomeList,
        'citizenshipList'       => $citizenshipList,

        'editMode'              => $editMode
    ]) 
    ?>
<?php }
    else{
?>
        <hr class="devider devider-db">
        <div class="tag-box tag-box-v3">
            <p>Data Wali Belum Diisi</p>
        </div>
<?php
    }
?>

<hr class="devider devider-db">

<p>
    Dengan ini saya menyatakan bahwa data yang diisikan adalah benar. Jika di kemudian hari 
    ditemukan kesalahan, saya siap menerima segala konsekuensi yang diputuskan oleh pihak sekolah.
</p>

<!--Invoice Footer-->
<div class="row">
    <div class="col-xs-6 text-center">
        <div class="tag-box tag-box-v3 no-margin-bottom">
            <address class="no-margin-bottom">
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
    <div class="col-xs-6 text-center">
        <div class="tag-box tag-box-v3 no-margin-bottom">
            <address class="no-margin-bottom">
                .................................................., <?= Yii::$app->formatter->format(time(), 'date'); ?> <br>
                Calon Siswa
                <br>
                <br>
                <br>
                <br> 
                <br> 
                (<?=$applicant->title;?>)
            </address>
        </div>
    </div>
</div>

<button class="btn-u sm-margin-bottom-10 pull-right hidden-print" onclick="javascript:window.print();"><i class="fa fa-print"></i> Print</button>

<?php
    $this->title = 'Print '.$applicant->title;
?>
