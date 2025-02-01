<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\helpers\Html;

/**
 * @var dektrium\user\Module          $module
 * @var dektrium\user\models\User     $user
 * @var dektrium\user\models\Password $password
 */

?>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Hello') ?>,
</p>

<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Your account on {0} has a new password', Yii::$app->name) ?>.
    <?= Yii::t('app', 'We have generated a password for you') ?>: <strong><?= $user->password ?></strong>
</p>

<p class="mb-3 lh-base">
    <?= Yii::t('app', 'If you did not make this request you can ignore this email') ?>.
</p>