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
 * @var dektrium\user\models\User $user
 * @var dektrium\user\models\Token $token
 */
?>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Hello') ?>,
</p>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Thank you for signing up on {0}', Yii::$app->name) ?>.
    <?= Yii::t('app', 'In order to complete your registration, please click the link below') ?>.
</p>
<p class="mb-3 lh-base">
    <?= Html::a(Html::encode($token->url), $token->url) ?>
</p>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'If you cannot click the link, please try pasting the text into your browser') ?>.
</p>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'If you did not make this request you can ignore this email') ?>.
</p>