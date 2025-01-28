<?php

namespace common\models;

use common\models\base\Event as BaseEvent;
use Yii;

/**
 * This is the model class for table "tx_event".
 */
class Event extends BaseEvent
{
    
    public static $path='/images';    
    
    const IS_OPEN_REGISTRATION_DISABLED     = 1;
    const IS_OPEN_REGISTRATION_ENABLED      = 2;
    
    const IS_USING_COMINGSOON_DISABLED      = 1;
    const IS_USING_COMINGSOON_ENABLED       = 2;
    
    const IS_ACTIVE_DISABLED                = 1;
    const IS_ACTIVE_ENABLED                 = 2;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['date_start', 'date_end', 'view_counter', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock'], 'integer'],
            [['location', 'content', 'description'], 'string'],
            [['title'], 'string', 'max' => 200],
            [['is_open_registration', 'is_using_comingsoon', 'is_active'], 'string', 'max' => 1],
            [['days_for_comingsoon'], 'string', 'max' => 2],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ];  
        
    }
    
    public function beforeSave($insert) {

        if ($this->isNewRecord) {
            $this->view_counter = 0;       
        } 
        
        if($this->is_active==self::IS_ACTIVE_ENABLED){
            //UPDATE OTHER TO DISABLED IF ACTIVE
            Event::updateAll(['is_active' => self::IS_ACTIVE_DISABLED], 'is_active ='.self::IS_ACTIVE_ENABLED);
        }

        return parent::beforeSave($insert);
    }

    public static function getArrayIsOpenRegistration()
    {
        return [
            //MASTER
            self::IS_OPEN_REGISTRATION_DISABLED => 'No',
            self::IS_OPEN_REGISTRATION_ENABLED  => 'Yes',
        ];
    }
    
    public static function getArrayIsUsingComingsoon()
    {
        return [
            //MASTER
            self::IS_USING_COMINGSOON_DISABLED => 'No',
            self::IS_USING_COMINGSOON_ENABLED  => 'Yes',
        ];
    }    
    
    public static function getArrayIsActive()
    {
        return [
            //MASTER
            self::IS_ACTIVE_DISABLED => 'No',
            self::IS_ACTIVE_ENABLED  => 'Yes',
        ];
    }  
    
    public static function getOneIsOpenRegistration($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsOpenRegistration();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::IS_OPEN_REGISTRATION_DISABLED):
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::IS_OPEN_REGISTRATION_ENABLED):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;

        }
        else
            return;
    }
    
    public static function getOneIsUsingComingsoon($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsUsingComingsoon();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::IS_USING_COMINGSOON_DISABLED):
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::IS_USING_COMINGSOON_ENABLED):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;

        }
        else
            return;
    }
    
    public static function getOneIsActive($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayIsActive();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::IS_ACTIVE_DISABLED):
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::IS_ACTIVE_ENABLED):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;

        }
        else
            return;
    }
    
    /**
     *
     */
    public function getUrl()
    {
        return Yii::$app->getUrlManager()->createUrl(['event/view', 'id' => $this->id, 'title' => $this->title]);
    }
}
