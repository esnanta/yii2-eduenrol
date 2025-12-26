<?php

namespace common\models;

use Yii;
use \common\models\base\Cities as BaseCities;

/**
 * This is the model class for table "tx_cities".
 */
class Cities extends BaseCities
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['prov_id'], 'integer'],
            [['city_name'], 'string', 'max' => 255],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
