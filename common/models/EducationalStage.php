<?php

namespace common\models;

use Yii;
use \common\models\base\EducationalStage as BaseEducationalStage;

/**
 * This is the model class for table "tx_educational_stage".
 */
class EducationalStage extends BaseEducationalStage
{

    //SESUAIKAN DENGAN DATABASE
    const ELEMENTARY_SCHOOL     = 3;
    const JUNIOR_HIGH_SCHOOL    = 4;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['sequence', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
