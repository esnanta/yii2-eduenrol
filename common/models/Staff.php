<?php

namespace common\models;

use Yii;
use \common\models\base\Staff as BaseStaff;

/**
 * This is the model class for table "tx_staff".
 */
class Staff extends BaseStaff
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['employment_id', 'gender_status', 'active_status', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock'], 'integer'],
            [['initial'], 'required'],
            [['address', 'description'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['title', 'identity_number', 'email', 'google_plus', 'instagram', 'facebook', 'twitter'], 'string', 'max' => 100],
            [['initial'], 'string', 'max' => 10],
            [['phone_number'], 'string', 'max' => 50],
            [['file_name'], 'string', 'max' => 200],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
