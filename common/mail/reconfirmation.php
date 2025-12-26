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
 * @var dektrium\user\models\Token $token
 */
?>

<p class="mb-3 lh-base">
    <?= Yii::t('app', 'Hello') ?>,
</p>
<p class="mb-3 lh-base">
    <?= Yii::t(
        'app',
        'We have received a request to change the email address for your account on {0}',
        Yii::$app->name
    ) ?>.
    <?= Yii::t('app', 'In order to complete your request, please click the link below') ?>.
</p>
<p class="mb-3 lh-base">
    <?= Html::a(Html::encode($token->getUrl()), $token->getUrl()); ?>
</p>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'If you cannot click the link, please try pasting the text into your browser') ?>.
</p>
<p class="mb-3 lh-base">
    <?= Yii::t('app', 'If you did not make this request you can ignore this email') ?>.
</p>