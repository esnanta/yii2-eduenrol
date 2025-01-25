<?php

namespace common\models;

use Yii;
use \common\models\base\Applicant as BaseApplicant;

/**
 * This is the model class for table "tx_applicant".
 */
class Applicant extends BaseApplicant
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['event_id', 'user_id', 'gender_status', 'religion_id', 'citizenship_status', 'blood_type', 'height', 'weight', 'head_circle', 'number_of_sibling', 'number_of_dependent', 'number_of_step_sibling', 'birth_order', 'child_status', 'final_status', 'approval_status', 'date_approval', 'approved_by', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_birth', 'date_final', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['hobby', 'illness', 'disability', 'description'], 'string'],
            [['email', 'title', 'nick_name', 'native_language', 'file_name'], 'string', 'max' => 100],
            [['record_number'], 'string', 'max' => 15],
            [['family_card_number', 'identity_number', 'birth_certificate_number', 'birth_place', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'phone_number'], 'string', 'max' => 50],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
