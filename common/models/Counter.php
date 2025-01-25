<?php

namespace common\models;

use common\models\base\Counter as BaseCounter;
use common\service\CacheService;

/**
 * This is the model class for table "tx_counter".
 */
class Counter extends BaseCounter
{
    const CODE_OF_ACCOUNT_PAYABLE       = 'APY';
    const CODE_OF_ACCOUNT_RECEIVABLE    = 'ARV';
    const CODE_OF_CUSTOMER              = 'CST';
    const CODE_OF_PURCHASE              = 'PUR';
    const CODE_OF_STOCK_DISTRIBUTION    = 'SDT';
    const CODE_OF_STOCK_OPNAME          = 'SOP';
    const CODE_OF_STOCK_ADJUSTMENT      = 'SAD';
    const CODE_OF_WORK_REQUEST          = 'WRQ';
    const CODE_OF_WORK_ORDER            = 'WOR';
    
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return
        [
            [['office_id', 'counter', 'created_by', 'updated_by', 'is_deleted', 'deleted_by', 'verlock'], 'integer'],
            [['title'], 'required'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 15],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];
    }
    
    public static function getDataNumber($_code)
    {
        $counter    =0;
        $code       = $_code;
        
        $cacheCloud = new CacheService();
        $officeId   = $cacheCloud->getOfficeId();
            
        $model  = Counter::find()->where(['title' => $code,'office_id'=>$officeId])->one();

        if ($model==null) {
            $newCounter = new Counter();
            $newCounter->title = $code;
            $newCounter->office_id = $officeId;
            $newCounter->counter = 1;
            $newCounter->save();

            $counter=1;
        } else {
            $counter = $model->counter+1;
            $model->counter=$counter;
            $model->save();
        }

        //FORMAT DATA COUNTER
        return self::formatCounter($counter);
    }
    
    public static function getNextDataNumber($_code)
    {
        $counter=0;
        $model = Counter::find()->where(['id' => $_code])->one();
        if ($model==null) {
            $counter=1;
        } else {
            $counter = $model->counter+1;
        }

        $formattedCounter = self::formatCounter($counter);
        //FORMAT DATA COUNTER
        return $formattedCounter;
    }
    
    public static function convert($_counter)
    {
        return self::formatCounter($_counter);
    }
    
    private static function formatCounter($_counter)
    {
        $result = '';
        $counter = (int) $_counter;
        if ((int) $counter < 10) {
            $result = '0000';
        } elseif ((int) $counter >= 10 && (int) $counter < 100) {
            $result = '000';
        } elseif ((int) $counter >= 100 && (int) $counter < 1000) {
            $result = '00';
        } elseif ((int) $counter >= 1000 && (int) $counter < 10000) {
            $result = '0';
        } else {
            $result = null;
        }

        $result = $result . $counter;
        return $result;
    }
}
