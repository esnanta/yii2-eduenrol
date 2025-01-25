<?php

namespace common\models;

use Yii;
use \common\models\base\Employment as BaseEmployment;

/**
 * This is the model class for table "tx_employment".
 */
class Employment extends BaseEmployment
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['description'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock'], 'integer'],
            [['title'], 'string', 'max' => 100],
            [['sequence'], 'string', 'max' => 4],
            [['uuid'], 'string', 'max' => 36],
            [['title'], 'unique'],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
