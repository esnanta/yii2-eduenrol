<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ApplicantSearch */

$this->title = 'Export Laporan Pendaftar';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="applicant-report">

    <div class="card">
        <div class="card-body">
            <h5 class="card-title fw-semibold mb-4"><?= Html::encode($this->title) ?></h5>
            <p class="mb-0">
                Pilih rentang tanggal untuk mengekspor data pendaftar ke dalam file Excel.
            </p>
            <br>
            <?php echo $this->render('_form_report', ['model' => $searchModel]); ?>
        </div>
    </div>

</div>
