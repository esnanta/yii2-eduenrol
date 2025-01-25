<?php

namespace common\models\base;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use mootensai\behaviors\UUIDBehavior;

/**
 * This is the base model class for table "tx_staff".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $office_id
 * @property integer $employment_id
 * @property string $title
 * @property string $initial
 * @property string $identity_number
 * @property string $phone_number
 * @property integer $gender_status
 * @property integer $active_status
 * @property string $address
 * @property string $file_name
 * @property string $email
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
 * @property \common\models\AccountPayable[] $accountPayables
 * @property \common\models\Purchase[] $purchases
 * @property \common\models\PurchaseReceive[] $purchaseReceives
 * @property \common\models\Employment $employment
 * @property \common\models\Office $office
 * @property \common\models\StockAdjustment[] $stockAdjustments
 * @property \common\models\StockDistribution[] $stockDistributions
 * @property \common\models\StockOpname[] $stockOpnames
 */
class Staff extends \yii\db\ActiveRecord
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
            'accountPayables',
            'purchases',
            'purchaseReceives',
            'employment',
            'office',
            'stockAdjustments',
            'stockDistributions',
            'stockOpnames'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'office_id', 'employment_id', 'gender_status', 'active_status', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['address', 'description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title', 'identity_number', 'email'], 'string', 'max' => 100],
            [['initial'], 'string', 'max' => 10],
            [['phone_number'], 'string', 'max' => 50],
            [['file_name'], 'string', 'max' => 200],
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
        return 'tx_staff';
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
            'user_id' => Yii::t('app', 'User'),
            'office_id' => Yii::t('app', 'Office'),
            'employment_id' => Yii::t('app', 'Employment'),
            'title' => Yii::t('app', 'Title'),
            'initial' => Yii::t('app', 'Initial'),
            'identity_number' => Yii::t('app', 'Identity Number'),
            'phone_number' => Yii::t('app', 'Phone Number'),
            'gender_status' => Yii::t('app', 'Gender Status'),
            'active_status' => Yii::t('app', 'Active Status'),
            'address' => Yii::t('app', 'Address'),
            'file_name' => Yii::t('app', 'File Name'),
            'email' => Yii::t('app', 'Email'),
            'description' => Yii::t('app', 'Description'),
            'is_deleted' => Yii::t('app', 'Is Deleted'),
            'verlock' => Yii::t('app', 'Verlock'),
            'uuid' => Yii::t('app', 'Uuid'),
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccountPayables()
    {
        return $this->hasMany(\common\models\AccountPayable::className(), ['staff_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPurchases()
    {
        return $this->hasMany(\common\models\Purchase::className(), ['staff_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPurchaseReceives()
    {
        return $this->hasMany(\common\models\PurchaseReceive::className(), ['staff_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmployment()
    {
        return $this->hasOne(\common\models\Employment::className(), ['id' => 'employment_id']);
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
    public function getStockAdjustments()
    {
        return $this->hasMany(\common\models\StockAdjustment::className(), ['staff_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStockDistributions()
    {
        return $this->hasMany(\common\models\StockDistribution::className(), ['staff_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStockOpnames()
    {
        return $this->hasMany(\common\models\StockOpname::className(), ['staff_id' => 'id']);
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
