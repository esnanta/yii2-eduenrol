<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_applicant_family".
 *
 * @property integer $id
 * @property integer $applicant_id
 * @property integer $event_id
 * @property integer $family_type
 * @property string $title
 * @property string $identity_number
 * @property string $birth_place
 * @property string $date_birth
 * @property integer $religion_id
 * @property integer $educational_stage_id
 * @property integer $occupation_id
 * @property integer $income_id
 * @property string $phone_number
 * @property integer $citizenship_status
 * @property string $address_street
 * @property string $address_village
 * @property string $address_sub_district
 * @property string $address_city
 * @property string $address_province
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
 * @property \common\models\Income $income
 * @property \common\models\Occupation $occupation
 * @property \common\models\Religion $religion
 */
class ApplicantFamily extends \yii\db\ActiveRecord
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
            'income',
            'occupation',
            'religion'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['applicant_id', 'event_id', 'family_type', 'religion_id', 'educational_stage_id', 'occupation_id', 'income_id', 'citizenship_status', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_birth', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title', 'birth_place'], 'string', 'max' => 100],
            [['identity_number', 'phone_number', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province'], 'string', 'max' => 50],
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
        return 'tx_applicant_family';
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
            'applicant_id' => Yii::t('app', 'Applicant ID'),
            'event_id' => Yii::t('app', 'Event ID'),
            'family_type' => Yii::t('app', 'Family Type'),
            'title' => Yii::t('app', 'Title'),
            'identity_number' => Yii::t('app', 'Identity Number'),
            'birth_place' => Yii::t('app', 'Birth Place'),
            'date_birth' => Yii::t('app', 'Date Birth'),
            'religion_id' => Yii::t('app', 'Religion ID'),
            'educational_stage_id' => Yii::t('app', 'Educational Stage ID'),
            'occupation_id' => Yii::t('app', 'Occupation ID'),
            'income_id' => Yii::t('app', 'Income ID'),
            'phone_number' => Yii::t('app', 'Phone Number'),
            'citizenship_status' => Yii::t('app', 'Citizenship Status'),
            'address_street' => Yii::t('app', 'Address Street'),
            'address_village' => Yii::t('app', 'Address Village'),
            'address_sub_district' => Yii::t('app', 'Address Sub District'),
            'address_city' => Yii::t('app', 'Address City'),
            'address_province' => Yii::t('app', 'Address Province'),
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
    public function getIncome()
    {
        return $this->hasOne(\common\models\Income::className(), ['id' => 'income_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOccupation()
    {
        return $this->hasOne(\common\models\Occupation::className(), ['id' => 'occupation_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReligion()
    {
        return $this->hasOne(\common\models\Religion::className(), ['id' => 'religion_id']);
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
