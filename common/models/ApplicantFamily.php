<?php

namespace common\models;

use Yii;
use \common\models\base\ApplicantFamily as BaseApplicantFamily;

/**
 * This is the model class for table "tx_applicant_family".
 */
class ApplicantFamily extends BaseApplicantFamily
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['applicant_id', 'event_id', 'family_type', 'religion_id', 'educational_stage_id', 'occupation_id', 'income_id', 'citizenship_status', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_birth', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title', 'birth_place'], 'string', 'max' => 100],
            [['identity_number', 'phone_number', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province'], 'string', 'max' => 50],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
