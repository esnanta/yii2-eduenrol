<?php

namespace common\models;

use Yii;
use \common\models\base\ApplicantGrade as BaseApplicantGrade;

/**
 * This is the model class for table "tx_applicant_grade".
 */
class ApplicantGrade extends BaseApplicantGrade
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['applicant_id', 'event_id', 'course_id', 'semester_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['grade'], 'number'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
	
}
