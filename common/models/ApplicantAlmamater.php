<?php

namespace common\models;

use Yii;
use \common\models\base\ApplicantAlmamater as BaseApplicantAlmamater;

/**
 * This is the model class for table "tx_applicant_almamater".
 */
class ApplicantAlmamater extends BaseApplicantAlmamater
{
    const SCHOOL_STATUS_NATIONAL            = 1;
    const SCHOOL_STATUS_PRIVATE             = 2;
    const SCHOOL_STATUS_RELIGIOUS_NATIONAL  = 3;
    const SCHOOL_STATUS_RELIGIOUS_PRIVATE   = 4;

    const TUITION_PAYER_FATHER              = 1;
    const TUITION_PAYER_MOTHER              = 2;
    const TUITION_PAYER_FATHER_MOTHER       = 3;
    const TUITION_PAYER_GUARDIAN            = 4;
    const TUITION_PAYER_SELF                = 5;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['applicant_id', 'event_id', 'educational_stage_id', 'school_status', 'study_time_length', 'tuition_payer', 'residence_id', 'distance', 'transportation_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_graduation', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'description'], 'string'],
            [['title', 'phone_number'], 'string', 'max' => 100],
            [['national_school_principal_number', 'national_registration_number', 'school_registration_number'], 'string', 'max' => 20],
            [['certificate_serial_number', 'examination_serial_number', 'examination_card_number'], 'string', 'max' => 15],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }

    public function beforeSave($insert) {

        $this->title                    = strtoupper($this->title);
        $this->address_street           = ucwords($this->address_street);
        $this->address_village          = ucwords($this->address_village);
        $this->address_sub_district     = ucwords($this->address_sub_district);
        $this->address_city             = ucwords($this->address_city);
        $this->address_province         = ucwords($this->address_province);

        if(empty($this->event_id)){
            $this->event_id                 = $this->applicant->event_id;
        }

        return parent::beforeSave($insert);
    }

    public static function getArrayTuitionPayer()
    {
        return [
            //MASTER
            self::TUITION_PAYER_FATHER          => 'Ayah',
            self::TUITION_PAYER_MOTHER          => 'Ibu',
            self::TUITION_PAYER_FATHER_MOTHER   => 'Ayah Ibu',
            self::TUITION_PAYER_GUARDIAN        => 'Wali',
            self::TUITION_PAYER_SELF            => 'Mandiri',
        ];
    }

    public static function getOneTuitionPayer($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayTuitionPayer();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::TUITION_PAYER_FATHER):
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::TUITION_PAYER_MOTHER):
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::TUITION_PAYER_FATHER_MOTHER):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::TUITION_PAYER_GUARDIAN):
                    $returnValue = '<span class="label label-warning">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::TUITION_PAYER_SELF):
                    $returnValue = '<span class="label label-info">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;
        }
        else
            return;
    }

    public static function getArraySchoolStatus()
    {
        return [
            //MASTER
            self::SCHOOL_STATUS_NATIONAL            => 'Negeri',
            self::SCHOOL_STATUS_PRIVATE             => 'Swasta',
            self::SCHOOL_STATUS_RELIGIOUS_NATIONAL  => 'MTsN',
            self::SCHOOL_STATUS_RELIGIOUS_PRIVATE   => 'MTsS',
        ];
    }

    public static function getOneSchoolStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArraySchoolStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::SCHOOL_STATUS_NATIONAL):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::SCHOOL_STATUS_PRIVATE):
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::SCHOOL_STATUS_RELIGIOUS_NATIONAL):
                    $returnValue = '<span class="label label-info">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::SCHOOL_STATUS_RELIGIOUS_PRIVATE):
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
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
        return Yii::$app->getUrlManager()->createUrl(['applicant-almamater/view', 'id' => $this->id, 'title' => $this->title]);
    }
    public static function countSchoolStatus($_schoolStatus){

        $query = ApplicantAlmamater::find()
            ->where(['school_status'=>$_schoolStatus])
            ->andWhere(['tx_applicant.final_status'=> Applicant::FINAL_STATUS_YES]);
        $query->joinWith(['applicant']);

        $queryCount = $query->asArray()->count();
        return (!empty($queryCount)) ? $queryCount: 0 ;
    }

    public static function getElementarySchool(): int
    {
        return 3;
    }
    public static function getJuniorHighSchool(): int
    {
        return 4;
    }
}
