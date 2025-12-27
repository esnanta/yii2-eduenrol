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
	
}
