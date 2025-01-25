<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Customer $model
 */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
        'modelClass' => 'Customer',
    ]) . ' update.php' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Customers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
            Please fill out the form below
            <div class="pull-right">
                Customer            </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="customer-update">
            <?=
            $this->render('_form', [
                'model' => $model,
                'areaList' => $areaList,
                'provinceList' => $provinceList,
                'cityList' => $cityList,
                'districtList' => $districtList,
                'subdistrictList' => $subdistrictList
            ])
            ?>
        </div>
    </div>
</div>



