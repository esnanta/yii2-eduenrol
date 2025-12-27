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
        $event = Event::find()->where(['is_active' => Event::IS_ACTIVE_ENABLED])->one();
        $query = ApplicantDocument::find()
            ->where(['event_id'=>$event->id])
            ->orderBy(['id'=>SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'applicant_id' => $this->applicant_id,
            'event_id' => $this->event_id,
            'document_id' => $this->document_id,
            'quantity' => $this->quantity,
            'document_status' => $this->document_status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'file_name', $this->file_name])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
