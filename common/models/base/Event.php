<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_event".
 *
 * @property integer $id
 * @property string $title
 * @property string $date_start
 * @property string $date_end
 * @property string $location
 * @property string $content
 * @property integer $view_counter
 * @property string $description
 * @property integer $is_open_registration
 * @property integer $is_using_comingsoon
 * @property integer $is_active
 * @property integer $days_for_comingsoon
 * @property string $created_at
 * @property string $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $is_deleted
 * @property string $deleted_at
 * @property integer $deleted_by
 * @property integer $verlock
 *
 * @property \common\models\Applicant[] $applicants
 * @property \common\models\ApplicantAlmamater[] $applicantAlmamaters
 * @property \common\models\ApplicantDocument[] $applicantDocuments
 * @property \common\models\ApplicantFamily[] $applicantFamilies
 * @property \common\models\ApplicantGrade[] $applicantGrades
 */
class Event extends \yii\db\ActiveRecord
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
            'applicantGrades'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['date_start', 'date_end', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['location', 'content', 'description'], 'string'],
            [['view_counter', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['title'], 'string', 'max' => 200],
            [['is_open_registration', 'is_using_comingsoon', 'is_active'], 'string', 'max' => 1],
            [['days_for_comingsoon'], 'string', 'max' => 2],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tx_event';
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
            'title' => Yii::t('app', 'Title'),
            'date_start' => Yii::t('app', 'Date Start'),
            'date_end' => Yii::t('app', 'Date End'),
            'location' => Yii::t('app', 'Location'),
            'content' => Yii::t('app', 'Content'),
            'view_counter' => Yii::t('app', 'View Counter'),
            'description' => Yii::t('app', 'Description'),
            'is_open_registration' => Yii::t('app', 'Is Open Registration'),
            'is_using_comingsoon' => Yii::t('app', 'Is Using Comingsoon'),
            'is_active' => Yii::t('app', 'Is Active'),
            'days_for_comingsoon' => Yii::t('app', 'Days For Comingsoon'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicants()
    {
        return $this->hasMany(\common\models\Applicant::className(), ['event_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantAlmamaters()
    {
        return $this->hasMany(\common\models\ApplicantAlmamater::className(), ['event_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantDocuments()
    {
        return $this->hasMany(\common\models\ApplicantDocument::className(), ['event_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantFamilies()
    {
        return $this->hasMany(\common\models\ApplicantFamily::className(), ['event_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantGrades()
    {
        return $this->hasMany(\common\models\ApplicantGrade::className(), ['event_id' => 'id']);
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
