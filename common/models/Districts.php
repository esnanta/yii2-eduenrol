<?php

namespace common\models;

use Yii;
use \common\models\base\Districts as BaseDistricts;

/**
 * This is the model class for table "tx_districts".
 */
class Districts extends BaseDistricts
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['city_id'], 'integer'],
            [['dis_name'], 'string', 'max' => 255],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
