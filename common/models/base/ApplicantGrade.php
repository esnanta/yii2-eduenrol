<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_applicant_grade".
 *
 * @property integer $id
 * @property integer $applicant_id
 * @property integer $event_id
 * @property integer $course_id
 * @property string $title
 * @property integer $semester_id
 * @property string $grade
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
 * @property \common\models\Course $course
 * @property \common\models\Event $event
 * @property \common\models\Semester $semester
 */
class ApplicantGrade extends \yii\db\ActiveRecord
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
            'course',
            'event',
            'semester'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['applicant_id', 'event_id', 'course_id', 'semester_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['grade'], 'number'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
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
        return 'tx_applicant_grade';
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
            'course_id' => Yii::t('app', 'Course ID'),
            'title' => Yii::t('app', 'Title'),
            'semester_id' => Yii::t('app', 'Semester ID'),
            'grade' => Yii::t('app', 'Grade'),
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
    public function getCourse()
    {
        return $this->hasOne(\common\models\Course::className(), ['id' => 'course_id']);
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
    public function getSemester()
    {
        return $this->hasOne(\common\models\Semester::className(), ['id' => 'semester_id']);
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
