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
 * @var dektrium\user\Module $module
 * @var dektrium\user\models\User $user
 * @var dektrium\user\models\Token $token
 * @var bool $showPassword
 */
?>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Hello') ?>,
</p>

<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Your account on {0} has been successfully created.', Yii::$app->name) ?>
    <?php if ($showPassword || $module->enableGeneratingPassword): ?>
        <?= Yii::t('app', 'We have generated a password for you') ?>: <strong><?= $user->password ?></strong>
    <?php endif ?>

</p>

<?php if ($token !== null): ?>
    <p class="mb-3 lh-base">
        <?= Yii::t('app', 'Click the following link to activate your account and complete the registration process:') ?>
    </p>
    <p class="mb-3 lh-base">
        <?= Html::a(Html::encode($token->url), $token->url); ?>
    </p>
    <p class="mb-3 lh-base">
        <?= Yii::t('app', 'If the link is not clickable, try copying and pasting it into your web browser.') ?>
    </p>
<?php endif ?>

<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Ignore this email and do not reply if you feel you never registered.') ?>
</p>

<p class="mb-3 lh-base">
    <?= Yii::t('app', 'If you have any questions or difficulties, please contact the contact person on the website or admin at 081804292926.') ?>
</p>

<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Thank You') ?>
</p>