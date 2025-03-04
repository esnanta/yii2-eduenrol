<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_office".
 *
 * @property integer $id
 * @property string $unique_id
 * @property string $token
 * @property string $title
 * @property string $phone_number
 * @property string $fax_number
 * @property string $email
 * @property string $web
 * @property string $address
 * @property string $latitude
 * @property string $longitude
 * @property string $facebook
 * @property string $google_plus
 * @property string $instagram
 * @property string $twitter
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $is_deleted
 * @property string $deleted_at
 * @property integer $deleted_by
 * @property integer $verlock
 * @property string $uuid
 *
 * @property \common\models\Applicant[] $applicants
 * @property \common\models\ApplicantAlmamater[] $applicantAlmamaters
 * @property \common\models\ApplicantDocument[] $applicantDocuments
 * @property \common\models\ApplicantFamily[] $applicantFamilies
 * @property \common\models\ApplicantGrade[] $applicantGrades
 * @property \common\models\Employment[] $employments
 * @property \common\models\Staff[] $staff
 */
class Office extends \yii\db\ActiveRecord
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
            'applicants',
            'applicantAlmamaters',
            'applicantDocuments',
            'applicantFamilies',
            'applicantGrades',
            'employments',
            'staff'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['unique_id'], 'string', 'max' => 15],
            [['token'], 'string', 'max' => 5],
            [['title', 'phone_number', 'fax_number', 'email', 'web', 'address', 'latitude', 'longitude', 'facebook', 'google_plus', 'instagram', 'twitter'], 'string', 'max' => 100],
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
        return 'tx_office';
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
            'unique_id' => Yii::t('app', 'Unique ID'),
            'token' => Yii::t('app', 'Token'),
            'title' => Yii::t('app', 'Title'),
            'phone_number' => Yii::t('app', 'Phone Number'),
            'fax_number' => Yii::t('app', 'Fax Number'),
            'email' => Yii::t('app', 'Email'),
            'web' => Yii::t('app', 'Web'),
            'address' => Yii::t('app', 'Address'),
            'latitude' => Yii::t('app', 'Latitude'),
            'longitude' => Yii::t('app', 'Longitude'),
            'facebook' => Yii::t('app', 'Facebook'),
            'google_plus' => Yii::t('app', 'Google Plus'),
            'instagram' => Yii::t('app', 'Instagram'),
            'twitter' => Yii::t('app', 'Twitter'),
            'description' => Yii::t('app', 'Description'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicants()
    {
        return $this->hasMany(\common\models\Applicant::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantAlmamaters()
    {
        return $this->hasMany(\common\models\ApplicantAlmamater::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantDocuments()
    {
        return $this->hasMany(\common\models\ApplicantDocument::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantFamilies()
    {
        return $this->hasMany(\common\models\ApplicantFamily::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantGrades()
    {
        return $this->hasMany(\common\models\ApplicantGrade::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployments()
    {
        return $this->hasMany(\common\models\Employment::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStaff()
    {
        return $this->hasMany(\common\models\Staff::className(), ['office_id' => 'id']);
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
