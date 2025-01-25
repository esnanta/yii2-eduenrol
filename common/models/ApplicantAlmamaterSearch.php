<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use common\models\ApplicantAlmamater;

/**
 * ApplicantAlmamaterSearch represents the model behind the search form about `common\models\ApplicantAlmamater`.
 */
class ApplicantAlmamaterSearch extends ApplicantAlmamater
{
    public function rules()
    {
        return [
            [['id', 'applicant_id', 'event_id', 'educational_stage_id', 'school_status', 'study_time_length', 'tuition_payer', 'residence_id', 'distance', 'transportation_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'national_school_principal_number', 'national_registration_number', 'school_registration_number', 'phone_number', 'date_graduation', 'certificate_serial_number', 'examination_serial_number', 'examination_card_number', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'description', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = ApplicantAlmamater::find();

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
            'educational_stage_id' => $this->educational_stage_id,
            'school_status' => $this->school_status,
            'date_graduation' => $this->date_graduation,
            'study_time_length' => $this->study_time_length,
            'tuition_payer' => $this->tuition_payer,
            'residence_id' => $this->residence_id,
            'distance' => $this->distance,
            'transportation_id' => $this->transportation_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'national_school_principal_number', $this->national_school_principal_number])
            ->andFilterWhere(['like', 'national_registration_number', $this->national_registration_number])
            ->andFilterWhere(['like', 'school_registration_number', $this->school_registration_number])
            ->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'certificate_serial_number', $this->certificate_serial_number])
            ->andFilterWhere(['like', 'examination_serial_number', $this->examination_serial_number])
            ->andFilterWhere(['like', 'examination_card_number', $this->examination_card_number])
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
