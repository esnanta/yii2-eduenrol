<?php

namespace common\models;

use Yii;
use \common\models\base\Income as BaseIncome;

/**
 * This is the model class for table "tx_income".
 */
class Income extends BaseIncome
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['sequence', 'created_at', 'updated_at', 'created_by', 'updated_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
