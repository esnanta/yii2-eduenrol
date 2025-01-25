<?php

namespace common\models;

use Yii;
use \common\models\base\Document as BaseDocument;

/**
 * This is the model class for table "tx_document".
 */
class Document extends BaseDocument
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['quantity', 'sequence', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
