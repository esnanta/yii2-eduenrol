<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_educational_stage".
 *
 * @property integer $id
 * @property string $title
 * @property integer $sequence
 * @property string $description
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $created_by
 * @property integer $updated_by
 * @property integer $verlock
 *
 * @property \common\models\ApplicantAlmamater[] $applicantAlmamaters
 * @property \common\models\ApplicantFamily[] $applicantFamilies
 */
class EducationalStage extends \yii\db\ActiveRecord
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
            'applicantAlmamaters',
            'applicantFamilies'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sequence', 'created_at', 'updated_at', 'created_by', 'updated_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['title'], 'string', 'max' => 100],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tx_educational_stage';
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
            'sequence' => Yii::t('app', 'Sequence'),
            'description' => Yii::t('app', 'Description'),
            'verlock' => Yii::t('app', 'Verlock'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantAlmamaters()
    {
        return $this->hasMany(\common\models\ApplicantAlmamater::className(), ['educational_stage_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApplicantFamilies()
    {
        return $this->hasMany(\common\models\ApplicantFamily::className(), ['educational_stage_id' => 'id']);
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
