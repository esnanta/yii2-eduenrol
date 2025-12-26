<?php

/** @var yii\web\View $this */

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;
use common\helper\DateHelper;

$this->title = Yii::$app->name;
?>


<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col"><?=Yii::t('app', 'Information');?></th>
        <th scope="col"><?=Yii::t('app', 'Date');?></th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td><?=Yii::t('app', 'Registration Status');?></td>
        <td>
            <?= $statusText ;?>
        </td>
    </tr>
    <tr>
        <th scope="row">2</th>
        <td><?=Yii::t('app', 'Open Registration');?></td>
        <td><?= DateHelper::formatDateTime($event->date_start);?></td>
    </tr>
    <tr>
        <th scope="row">3</th>
        <td><?=Yii::t('app', 'Closed');?></td>
        <td><?= DateHelper::formatDateTime($event->date_end);?></td>
    </tr>
    </tbody>
</table>





