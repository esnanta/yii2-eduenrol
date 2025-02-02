<?php
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;

$width1 = '5px';
$width2 = '300px';
?>

<!--Invoice Header-->
<div class="row invoice-header">
    <div class="col-xs-3 text-center">
        <?= Html::img(str_replace('frontend', 'backend', $logoLeft->getImageUrl()), ['class'=>'img-responsive','style'=>'width:80px;height:90px'])?> 
    </div>
    <div class="col-xs-6 invoice-numb text-center">
        <h3>Kartu Peserta Ujian PPDB<br>
        SMAN Modal Bangsa Arun<br>
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
                Nomor Peserta : <?=$applicant->record_number;?>
                <span class="pull pull-right"><small><i class="fa fa-print"></i> <?= Yii::$app->formatter->format(time(), 'date'); ?></small></span>
            </h4>
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <table class="table table-striped" style="margin-bottom:0px">
                        <tbody>
                            <tr>
                                <td style="width: 50px">Nama</td>
                                <td>: <?=$applicant->title;?></td>
                            </tr>   
                            <tr>
                                <td>NISN</td>
                                <td>: <?= $applicantAlmamater->national_registration_number;?></td>
                            </tr>  
                            <tr>
                                <td style="width: 50px">Almamater</td>
                                <td>: <?= $applicantAlmamater->title;?></td>
                            </tr>                              
                        </tbody>
                    </table>                      
                </div>
            </div>             
        </div>
    </div>
</div>
<!--End Invoice Detials-->

<!--Invoice Footer-->
<div class="row">
    <div class="col-xs-6 text-left">
        <div class="tag-box tag-box-v3 no-margin-bottom">
            <?=$keteranganKartu->content;?>
        </div>     
    </div>
    <div class="col-xs-6">
        
        <div class="tag-box tag-box-v3 no-margin-bottom">
            <address class="no-margin-bottom">
                <strong>VERIFIKASI PENGAWAS</strong>
                
                <br>
                <br>
                
                <table class="table table-striped">
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
                                <td>Wawancara<br></td>
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
        <br>
        <div class="tag-box tag-box-v3 no-margin-bottom  text-center">
            <address class="no-margin-bottom">
                <span class="pull-left">Lhokseumawe,</span><br>
                Panitia PPDB
                <br>
                <br>
                <br>
                <br> 
                <br> 
                (..................................................)
            </address>
        </div>
    </div>
</div>

<button class="btn-u sm-margin-bottom-10 pull-right hidden-print" onclick="javascript:window.print();"><i class="fa fa-print"></i> Print</button>

<?php
    $this->title = 'Print '.$applicant->title;
?>