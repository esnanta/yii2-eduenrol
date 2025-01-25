<?php

namespace common\models;

use Yii;
use \common\models\base\EducationalStage as BaseEducationalStage;

/**
 * This is the model class for table "tx_educational_stage".
 */
class EducationalStage extends BaseEducationalStage
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
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
