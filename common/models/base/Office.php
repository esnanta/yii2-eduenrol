<?php

namespace common\models\base;

use mootensai\behaviors\UUIDBehavior;
use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;

/**
 * This is the base model class for table "tx_office".
 *
 * @property integer $id
 * @property integer $user_id
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
 * @property \common\models\AccountDetail[] $accountDetails
 * @property \common\models\AccountHeader[] $accountHeaders
 * @property \common\models\AccountPayable[] $accountPayables
 * @property \common\models\AccountPayableDetail[] $accountPayableDetails
 * @property \common\models\AccountReceivable[] $accountReceivables
 * @property \common\models\AccountReceivableDetail[] $accountReceivableDetails
 * @property \common\models\Balance[] $balances
 * @property \common\models\Counter[] $counters
 * @property \common\models\Employment[] $employments
 * @property \common\models\Inventory[] $inventories
 * @property \common\models\Item[] $items
 * @property \common\models\ItemBrand[] $itemBrands
 * @property \common\models\ItemCategory[] $itemCategories
 * @property \common\models\ItemUnit[] $itemUnits
 * @property \User $user
 * @property \common\models\Product[] $products
 * @property \common\models\ProductDetail[] $productDetails
 * @property \common\models\Purchase[] $purchases
 * @property \common\models\PurchaseReceive[] $purchaseReceives
 * @property \common\models\Rack[] $racks
 * @property \common\models\Staff[] $staff
 * @property \common\models\StockAdjustment[] $stockAdjustments
 * @property \common\models\StockDistribution[] $stockDistributions
 * @property \common\models\StockDistributionDetail[] $stockDistributionDetails
 * @property \common\models\StockOpname[] $stockOpnames
 * @property \common\models\Supplier[] $suppliers
 * @property \common\models\Theme[] $themes
 * @property \common\models\Warehouse[] $warehouses
 * @property \common\models\WorkOrder[] $workOrders
 * @property \common\models\WorkOrderDetail[] $workOrderDetails
 * @property \common\models\WorkRequest[] $workRequests
 * @property \common\models\WorkRequestDetail[] $workRequestDetails
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
            'accountDetails',
            'accountHeaders',
            'accountPayables',
            'accountPayableDetails',
            'accountReceivables',
            'accountReceivableDetails',
            'balances',
            'counters',
            'employments',
            'inventories',
            'items',
            'itemBrands',
            'itemCategories',
            'itemUnits',
            'user',
            'products',
            'productDetails',
            'purchases',
            'purchaseReceives',
            'racks',
            'staff',
            'stockAdjustments',
            'stockDistributions',
            'stockDistributionDetails',
            'stockOpnames',
            'suppliers',
            'themes',
            'warehouses',
            'workOrders',
            'workOrderDetails',
            'workRequests',
            'workRequestDetails'
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
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
            'user_id' => Yii::t('app', 'User'),
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
    public function getAccountDetails()
    {
        return $this->hasMany(\common\models\AccountDetail::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccountHeaders()
    {
        return $this->hasMany(\common\models\AccountHeader::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccountPayables()
    {
        return $this->hasMany(\common\models\AccountPayable::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccountPayableDetails()
    {
        return $this->hasMany(\common\models\AccountPayableDetail::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccountReceivables()
    {
        return $this->hasMany(\common\models\AccountReceivable::className(), ['staff_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccountReceivableDetails()
    {
        return $this->hasMany(\common\models\AccountReceivableDetail::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBalances()
    {
        return $this->hasMany(\common\models\Balance::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCounters()
    {
        return $this->hasMany(\common\models\Counter::className(), ['office_id' => 'id']);
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
    public function getInventories()
    {
        return $this->hasMany(\common\models\Inventory::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(\common\models\Item::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemBrands()
    {
        return $this->hasMany(\common\models\ItemBrand::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemCategories()
    {
        return $this->hasMany(\common\models\ItemCategory::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemUnits()
    {
        return $this->hasMany(\common\models\ItemUnit::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(\User::className(), ['id' => 'user_id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(\common\models\Product::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductDetails()
    {
        return $this->hasMany(\common\models\ProductDetail::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPurchases()
    {
        return $this->hasMany(\common\models\Purchase::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPurchaseReceives()
    {
        return $this->hasMany(\common\models\PurchaseReceive::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRacks()
    {
        return $this->hasMany(\common\models\Rack::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStaff()
    {
        return $this->hasMany(\common\models\Staff::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStockAdjustments()
    {
        return $this->hasMany(\common\models\StockAdjustment::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStockDistributions()
    {
        return $this->hasMany(\common\models\StockDistribution::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStockDistributionDetails()
    {
        return $this->hasMany(\common\models\StockDistributionDetail::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStockOpnames()
    {
        return $this->hasMany(\common\models\StockOpname::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSuppliers()
    {
        return $this->hasMany(\common\models\Supplier::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getThemes()
    {
        return $this->hasMany(\common\models\Theme::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWarehouses()
    {
        return $this->hasMany(\common\models\Warehouse::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWorkOrders()
    {
        return $this->hasMany(\common\models\WorkOrder::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWorkOrderDetails()
    {
        return $this->hasMany(\common\models\WorkOrderDetail::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWorkRequests()
    {
        return $this->hasMany(\common\models\WorkRequest::className(), ['office_id' => 'id']);
    }
        
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWorkRequestDetails()
    {
        return $this->hasMany(\common\models\WorkRequestDetail::className(), ['office_id' => 'id']);
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
