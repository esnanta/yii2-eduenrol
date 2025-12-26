<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_applicant_almamater".
 *
 * @property integer $id
 * @property integer $office_id
 * @property integer $applicant_id
 * @property integer $event_id
 * @property string $title
 * @property string $national_school_principal_number
 * @property string $national_registration_number
 * @property string $school_registration_number
 * @property integer $educational_stage_id
 * @property integer $school_status
 * @property string $phone_number
 * @property string $date_graduation
 * @property integer $study_time_length
 * @property integer $tuition_payer
 * @property string $certificate_serial_number
 * @property string $examination_serial_number
 * @property string $examination_card_number
 * @property string $address_street
 * @property string $address_village
 * @property string $address_sub_district
 * @property string $address_city
 * @property string $address_province
 * @property integer $residence_id
 * @property integer $distance
 * @property integer $transportation_id
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property string $deleted_at
 * @property integer $deleted_by
 * @property integer $verlock
 * @property string $uuid
 *
 * @property \common\models\Applicant $applicant
 * @property \common\models\EducationalStage $educationalStage
 * @property \common\models\Event $event
 * @property \common\models\Office $office
 * @property \common\models\Residence $residence
 * @property \common\models\Transportation $transportation
 */
class ApplicantAlmamater extends \yii\db\ActiveRecord
{
    use \mootensai\relation\RelationTrait;

    private $_rt_softdelete;
    private $_rt_softrestore;

    public function __construct(){
        parent::__construct();
        $this->_rt_softdelete = [
            'deleted_by' => \Yii::$app->user->id,
            'deleted_at' => date('Y-m-d H:i:s'),
        ];
        $this->_rt_softrestore = [
            'deleted_by' => 0,
            'deleted_at' => date('Y-m-d H:i:s'),
        ];
    }

    /**
    * This function helps \mootensai\relation\RelationTrait runs faster
    * @return array relation names of this model
    */
    public function relationNames()
    {
        return [
            'applicant',
            'educationalStage',
            'event',
            'office',
            'residence',
            'transportation'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['office_id', 'applicant_id', 'event_id', 'educational_stage_id', 'school_status', 'study_time_length', 'tuition_payer', 'residence_id', 'distance', 'transportation_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_graduation', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'description'], 'string'],
            [['title', 'phone_number'], 'string', 'max' => 100],
            [['national_school_principal_number', 'national_registration_number', 'school_registration_number'], 'string', 'max' => 20],
            [['certificate_serial_number', 'examination_serial_number', 'examination_card_number'], 'string', 'max' => 15],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tx_applicant_almamater';
    }

    /**
     *
     * @return string
     * overwrite function optimisticLock
     * return string name of field are used to stored optimistic lock
     *
     */
    public function optimisticLock() {
        return 'verlock';
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'office_id' => Yii::t('app', 'Office ID'),
            'applicant_id' => Yii::t('app', 'Applicant ID'),
            'event_id' => Yii::t('app', 'Event ID'),
            'title' => Yii::t('app', 'Title'),
            'national_school_principal_number' => Yii::t('app', 'National School Principal Number'),
            'national_registration_number' => Yii::t('app', 'National Registration Number'),
            'school_registration_number' => Yii::t('app', 'School Registration Number'),
            'educational_stage_id' => Yii::t('app', 'Educational Stage ID'),
            'school_status' => Yii::t('app', 'School Status'),
            'phone_number' => Yii::t('app', 'Phone Number'),
            'date_graduation' => Yii::t('app', 'Date Graduation'),
            'study_time_length' => Yii::t('app', 'Study Time Length'),
            'tuition_payer' => Yii::t('app', 'Tuition Payer'),
            'certificate_serial_number' => Yii::t('app', 'Certificate Serial Number'),
            'examination_serial_number' => Yii::t('app', 'Examination Serial Number'),
            'examination_card_number' => Yii::t('app', 'Examination Card Number'),
            'address_street' => Yii::t('app', 'Address Street'),
            'address_village' => Yii::t('app', 'Address Village'),
            'address_sub_district' => Yii::t('app', 'Address Sub District'),
            'address_city' => Yii::t('app', 'Address City'),
            'address_province' => Yii::t('app', 'Address Province'),
            'residence_id' => Yii::t('app', 'Residence ID'),
            'distance' => Yii::t('app', 'Distance'),
            'transportation_id' => Yii::t('app', 'Transportation ID'),
            'description' => Yii::t('app', 'Description'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicant()
    {
        return $this->hasOne(\common\models\Applicant::className(), ['id' => 'applicant_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEducationalStage()
    {
        return $this->hasOne(\common\models\EducationalStage::className(), ['id' => 'educational_stage_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEvent()
    {
        return $this->hasOne(\common\models\Event::className(), ['id' => 'event_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOffice()
    {
        return $this->hasOne(\common\models\Office::className(), ['id' => 'office_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getResidence()
    {
        return $this->hasOne(\common\models\Residence::className(), ['id' => 'residence_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTransportation()
    {
        return $this->hasOne(\common\models\Transportation::className(), ['id' => 'transportation_id']);
    }
    
    /**
     * @inheritdoc
     * @return array mixed
     */
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
                'value' => date('Y-m-d H:i:s'),
            ],
            'blameable' => [
                'class' => BlameableBehavior::className(),
                'createdByAttribute' => 'created_by',
                'updatedByAttribute' => 'updated_by',
            ],
            'uuid' => [
                'class' => UUIDBehavior::className(),
                'column' => 'uuid',
            ],
        ];
    }
}
