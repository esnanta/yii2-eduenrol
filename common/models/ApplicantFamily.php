<?php

namespace common\models;

use Yii;
use \common\models\base\ApplicantFamily as BaseApplicantFamily;

/**
 * This is the model class for table "tx_applicant_family".
 */
class ApplicantFamily extends BaseApplicantFamily
{

    const FAMILY_TYPE_FATHER        = 1;
    const FAMILY_TYPE_MOTHER        = 2;
    const FAMILY_TYPE_GUARDIAN      = 3;

    const CITIZENSHIP_STATUS_WNI    = 1;
    const CITIZENSHIP_STATUS_WNA    = 2;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['applicant_id', 'event_id', 'family_type', 'religion_id', 'educational_stage_id', 'occupation_id', 'income_id', 'citizenship_status', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_birth', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['description'], 'string'],
            [['title', 'birth_place'], 'string', 'max' => 100],
            [['identity_number', 'phone_number', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province'], 'string', 'max' => 50],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }

    public static function getArrayModule()
    {
        return [
            //MASTER
            self::FAMILY_TYPE_FATHER     => Yii::t('app', 'Father'),
            self::FAMILY_TYPE_MOTHER     => Yii::t('app', 'Mother'),
            self::FAMILY_TYPE_GUARDIAN   => Yii::t('app', 'Guardian'),
        ];
    }

    public static function getOneModule($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayModule();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::FAMILY_TYPE_FATHER):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::FAMILY_TYPE_MOTHER):
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::FAMILY_TYPE_GUARDIAN):
                    $returnValue = '<span class="label label-warning">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;
        }
        else
            return;
    }

    public static function getArrayCitizenshipStatus()
    {
        return [
            //MASTER
            self::CITIZENSHIP_STATUS_WNI    => Yii::t('app', 'Indonesian'),
            self::CITIZENSHIP_STATUS_WNA    => Yii::t('app', 'Foreign'),
        ];
    }

    public static function getOneCitizenshipStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayCitizenshipStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::CITIZENSHIP_STATUS_WNI):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::CITIZENSHIP_STATUS_WNA):
                    $returnValue = '<span class="label label-warning">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;

        }
        else
            return;
    }
}
