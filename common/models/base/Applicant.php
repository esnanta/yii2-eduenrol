<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_applicant".
 *
 * @property integer $id
 * @property integer $event_id
 * @property integer $user_id
 * @property string $email
 * @property string $record_number
 * @property string $family_card_number
 * @property string $identity_number
 * @property string $birth_certificate_number
 * @property string $title
 * @property string $nick_name
 * @property integer $gender_status
 * @property string $birth_place
 * @property string $date_birth
 * @property integer $religion_id
 * @property integer $citizenship_status
 * @property string $address_street
 * @property string $address_village
 * @property string $address_sub_district
 * @property string $address_city
 * @property string $address_province
 * @property string $phone_number
 * @property string $hobby
 * @property integer $blood_type
 * @property integer $height
 * @property integer $weight
 * @property integer $head_circle
 * @property integer $number_of_sibling
 * @property integer $number_of_dependent
 * @property integer $number_of_step_sibling
 * @property integer $birth_order
 * @property integer $child_status
 * @property string $native_language
 * @property string $illness
 * @property string $disability
 * @property string $file_name
 * @property integer $final_status
 * @property string $date_final
 * @property integer $approval_status
 * @property integer $date_approval
 * @property integer $approved_by
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
 * @property \common\models\Event $event
 * @property \common\models\Religion $religion
 * @property \common\models\ApplicantAlmamater[] $applicantAlmamaters
 * @property \common\models\ApplicantDocument[] $applicantDocuments
 * @property \common\models\ApplicantFamily[] $applicantFamilies
 * @property \common\models\ApplicantGrade[] $applicantGrades
 * @property \common\models\ApplicantStanding[] $applicantStandings
 */
class Applicant extends \yii\db\ActiveRecord
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
            'event',
            'religion',
            'applicantAlmamaters',
            'applicantDocuments',
            'applicantFamilies',
            'applicantGrades',
            'applicantStandings'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['event_id', 'user_id', 'gender_status', 'religion_id', 'citizenship_status', 'blood_type', 'height', 'weight', 'head_circle', 'number_of_sibling', 'number_of_dependent', 'number_of_step_sibling', 'birth_order', 'child_status', 'final_status', 'approval_status', 'date_approval', 'approved_by', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_birth', 'date_final', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['hobby', 'illness', 'disability', 'description'], 'string'],
            [['email', 'title', 'nick_name', 'native_language', 'file_name'], 'string', 'max' => 100],
            [['record_number'], 'string', 'max' => 15],
            [['family_card_number', 'identity_number', 'birth_certificate_number', 'birth_place', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'phone_number'], 'string', 'max' => 50],
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
        return 'tx_applicant';
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
            'event_id' => Yii::t('app', 'Event ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'email' => Yii::t('app', 'Email'),
            'record_number' => Yii::t('app', 'Record Number'),
            'family_card_number' => Yii::t('app', 'Family Card Number'),
            'identity_number' => Yii::t('app', 'Identity Number'),
            'birth_certificate_number' => Yii::t('app', 'Birth Certificate Number'),
            'title' => Yii::t('app', 'Title'),
            'nick_name' => Yii::t('app', 'Nick Name'),
            'gender_status' => Yii::t('app', 'Gender Status'),
            'birth_place' => Yii::t('app', 'Birth Place'),
            'date_birth' => Yii::t('app', 'Date Birth'),
            'religion_id' => Yii::t('app', 'Religion ID'),
            'citizenship_status' => Yii::t('app', 'Citizenship Status'),
            'address_street' => Yii::t('app', 'Address Street'),
            'address_village' => Yii::t('app', 'Address Village'),
            'address_sub_district' => Yii::t('app', 'Address Sub District'),
            'address_city' => Yii::t('app', 'Address City'),
            'address_province' => Yii::t('app', 'Address Province'),
            'phone_number' => Yii::t('app', 'Phone Number'),
            'hobby' => Yii::t('app', 'Hobby'),
            'blood_type' => Yii::t('app', 'Blood Type'),
            'height' => Yii::t('app', 'Height'),
            'weight' => Yii::t('app', 'Weight'),
            'head_circle' => Yii::t('app', 'Head Circle'),
            'number_of_sibling' => Yii::t('app', 'Number Of Sibling'),
            'number_of_dependent' => Yii::t('app', 'Number Of Dependent'),
            'number_of_step_sibling' => Yii::t('app', 'Number Of Step Sibling'),
            'birth_order' => Yii::t('app', 'Birth Order'),
            'child_status' => Yii::t('app', 'Child Status'),
            'native_language' => Yii::t('app', 'Native Language'),
            'illness' => Yii::t('app', 'Illness'),
            'disability' => Yii::t('app', 'Disability'),
            'file_name' => Yii::t('app', 'File Name'),
            'final_status' => Yii::t('app', 'Final Status'),
            'date_final' => Yii::t('app', 'Date Final'),
            'approval_status' => Yii::t('app', 'Approval Status'),
            'date_approval' => Yii::t('app', 'Date Approval'),
            'approved_by' => Yii::t('app', 'Approved By'),
            'description' => Yii::t('app', 'Description'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
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
    public function getReligion()
    {
        return $this->hasOne(\common\models\Religion::className(), ['id' => 'religion_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantAlmamaters()
    {
        return $this->hasMany(\common\models\ApplicantAlmamater::className(), ['applicant_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantDocuments()
    {
        return $this->hasMany(\common\models\ApplicantDocument::className(), ['applicant_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantFamilies()
    {
        return $this->hasMany(\common\models\ApplicantFamily::className(), ['applicant_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantGrades()
    {
        return $this->hasMany(\common\models\ApplicantGrade::className(), ['applicant_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantStandings()
    {
        return $this->hasMany(\common\models\ApplicantStanding::className(), ['applicant_id' => 'id']);
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
