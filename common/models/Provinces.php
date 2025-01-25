<?php

namespace common\models;

use Yii;
use \common\models\base\Provinces as BaseProvinces;

/**
 * This is the model class for table "tx_provinces".
 */
class Provinces extends BaseProvinces
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['locationid', 'status'], 'integer'],
            [['prov_name'], 'string', 'max' => 255],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
