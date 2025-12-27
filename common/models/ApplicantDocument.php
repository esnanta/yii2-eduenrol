<?php

namespace common\models;

use Yii;
use \common\models\base\ApplicantDocument as BaseApplicantDocument;

/**
 * This is the model class for table "tx_applicant_document".
 */
class ApplicantDocument extends BaseApplicantDocument
{
    public $file;

    const DOCUMENT_STATUS_UNCONFIRM     = 1;
    const DOCUMENT_STATUS_APPROVE       = 2;
    const DOCUMENT_STATUS_REJECT        = 3;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['applicant_id', 'event_id', 'document_id', 'quantity', 'document_status', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['description'], 'string'],
            [['created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['file_name'], 'string', 'max' => 200],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator'],
            [['file'], 'file', 'skipOnEmpty' => false, 'extensions' => 'pdf', 'maxSize' => 1024 * 1024 * 2, 'on' => 'create'], // Max 2MB, required on create
            [['file'], 'file', 'skipOnEmpty' => true, 'extensions' => 'pdf', 'maxSize' => 1024 * 1024 * 2, 'on' => 'update'], // Max 2MB, optional on update
        ]);
    }

    public function beforeSave($insert) {

        if ($this->isNewRecord) {
            $this->document_status = self::DOCUMENT_STATUS_UNCONFIRM;
        }
        return parent::beforeSave($insert);
    }
    public function getFileUrl()
    {
        if ($this->file_name) {
            return Yii::getAlias('@web/uploads/applicant-documents/' . $this->file_name);
        }
        return null;
    }

    public static function getArrayDocumentStatus(): array
    {
        return [
            //MASTER
            self::DOCUMENT_STATUS_UNCONFIRM     => 'Antrian',
            self::DOCUMENT_STATUS_REJECT        => 'Ditolak',
            self::DOCUMENT_STATUS_APPROVE       => 'Disetujui',
        ];
    }

    public static function getOneDocumentStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayDocumentStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::DOCUMENT_STATUS_UNCONFIRM)://1
                    $returnValue = '<span class="label label-warning">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::DOCUMENT_STATUS_APPROVE)://2
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::DOCUMENT_STATUS_REJECT): //3
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">NA</span>';
            }

            return $returnValue;
        }
        else
            return;
    }
}
