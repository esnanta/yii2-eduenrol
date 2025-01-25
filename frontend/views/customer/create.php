<?php

use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var common\models\Customer $model
 */

$this->title = Yii::t('app', 'Create {modelClass}', [
    'modelClass' => 'Customer',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Customers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="card border-default mb-3">
    <div class="card-header">Please fill out the form below 
        <span class="pull-right">
            Customer        </span>
    </div>
    <div class="card-body text-default">
        <div class="customer-create">
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
