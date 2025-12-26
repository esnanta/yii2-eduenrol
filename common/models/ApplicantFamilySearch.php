<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use common\models\ApplicantFamily;

/**
 * ApplicantFamilySearch represents the model behind the search form about `common\models\ApplicantFamily`.
 */
class ApplicantFamilySearch extends ApplicantFamily
{
    public function rules()
    {
        return [
            [['id', 'applicant_id', 'event_id', 'family_type', 'religion_id', 'educational_stage_id', 'occupation_id', 'income_id', 'citizenship_status', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'identity_number', 'birth_place', 'date_birth', 'phone_number', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'description', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = ApplicantFamily::find();

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
            'family_type' => $this->family_type,
            'date_birth' => $this->date_birth,
            'religion_id' => $this->religion_id,
            'educational_stage_id' => $this->educational_stage_id,
            'occupation_id' => $this->occupation_id,
            'income_id' => $this->income_id,
            'citizenship_status' => $this->citizenship_status,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'identity_number', $this->identity_number])
            ->andFilterWhere(['like', 'birth_place', $this->birth_place])
            ->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'address_street', $this->address_street])
            ->andFilterWhere(['like', 'address_village', $this->address_village])
            ->andFilterWhere(['like', 'address_sub_district', $this->address_sub_district])
            ->andFilterWhere(['like', 'address_city', $this->address_city])
            ->andFilterWhere(['like', 'address_province', $this->address_province])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
