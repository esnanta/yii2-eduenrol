<?php

/** @var yii\web\View $this */

use aneeshikmat\yii2\Yii2TimerCountDown\Yii2TimerCountDown;

$this->title = Yii::$app->name;

$timeStart = strtotime($event->date_start);
$timeEnd = strtotime($event->date_end);
$currentTime = time();
$statusText = Yii::t('app', 'Closed');
$badgeLabel = 'badge bg-danger text-white';

if($currentTime < $timeStart) {
    $statusText = Yii::t('app', 'Countdown');
}
elseif ($currentTime >= $timeStart && $currentTime <= $timeEnd) {
    $badgeLabel = 'badge bg-success text-white';
    $statusText = Yii::t('app', 'Ongoing');
    $timeStart = $timeEnd;
}

Yii2TimerCountDown::widget([
    'countDownIdSelector' => 'time-down-counter-',
    'countDownDate' => strtotime(date("Y-m-d H:i:s", $timeStart)) * 1000
]);
?>

<div class="card border-default mb-3">
    <div class="card-header d-flex justify-content-between align-items-center">
        <?= Yii::t('app', 'Online Registration'); ?>
        <span>
            <div class="<?= $badgeLabel; ?>">
                <div id="time-down-counter-"></div>
            </div>
        </span>
    </div>
    <div class="card-body">
        <?php
        $registrationOpen = ($currentTime >= $timeStart && $currentTime <= $timeEnd);

        if ($registrationOpen) {
            echo $this->render('_open_registration', [
                'event' => $event,
                'timeStart' => $timeStart,
                'badgeLabel' => $badgeLabel,
                'statusText' => $statusText
            ]);
        } else {
            echo $this->render('_closed_registration', [
                'event' => $event,
                'timeStart' => $timeStart,
                'badgeLabel' => $badgeLabel,
                'statusText' => $statusText
            ]);
        }
        ?>

</div>