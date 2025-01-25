<?php

namespace common\models;

use Yii;
use \common\models\base\ApplicantAlmamater as BaseApplicantAlmamater;

/**
 * This is the model class for table "tx_applicant_almamater".
 */
class ApplicantAlmamater extends BaseApplicantAlmamater
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['applicant_id', 'event_id', 'educational_stage_id', 'school_status', 'study_time_length', 'tuition_payer', 'residence_id', 'distance', 'transportation_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_graduation', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'description'], 'string'],
            [['title', 'phone_number'], 'string', 'max' => 100],
            [['national_school_principal_number', 'national_registration_number', 'school_registration_number'], 'string', 'max' => 20],
            [['certificate_serial_number', 'examination_serial_number', 'examination_card_number'], 'string', 'max' => 15],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
