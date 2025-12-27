<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use common\models\ApplicantDocument;

/**
 * ApplicantDocumentSearch represents the model behind the search form about `common\models\ApplicantDocument`.
 */
class ApplicantDocumentSearch extends ApplicantDocument
{
    public function rules()
    {
        return [
            [['id', 'applicant_id', 'event_id', 'document_id', 'quantity', 'document_status', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'file_name', 'description', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = ApplicantDocument::find()
            ->where(['tx_applicant_document.applicant_id'=>'tx_applicant.id'])
            ->joinWith('applicant')
            ->orderBy(['id'=>SORT_DESC]);


        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'tx_applicant_document.id' => $this->id,
            'tx_applicant_document.applicant_id' => $this->applicant_id,
            'tx_applicant_document.event_id' => $this->event_id,
            'tx_applicant_document.document_id' => $this->document_id,
            'tx_applicant_document.quantity' => $this->quantity,
            'tx_applicant_document.document_status' => $this->document_status,
            'tx_applicant_document.created_at' => $this->created_at,
            'tx_applicant_document.updated_at' => $this->updated_at,
            'tx_applicant_document.created_by' => $this->created_by,
            'tx_applicant_document.updated_by' => $this->updated_by,
            'tx_applicant_document.deleted_at' => $this->deleted_at,
            'tx_applicant_document.deleted_by' => $this->deleted_by,
            'tx_applicant_document.verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'tx_applicant_document.title', $this->title])
            ->andFilterWhere(['like', 'tx_applicant_document.file_name', $this->file_name])
            ->andFilterWhere(['like', 'tx_applicant_document.description', $this->description])
            ->andFilterWhere(['like', 'tx_applicant_document.uuid', $this->uuid]);

        return $dataProvider;
    }
}
