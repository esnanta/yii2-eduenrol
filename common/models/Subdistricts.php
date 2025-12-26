<?php

namespace common\models;

use Yii;
use \common\models\base\Subdistricts as BaseSubdistricts;

/**
 * This is the model class for table "tx_subdistricts".
 */
class Subdistricts extends BaseSubdistricts
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['dis_id'], 'integer'],
            [['subdis_name'], 'string', 'max' => 255],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
