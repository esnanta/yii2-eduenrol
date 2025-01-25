<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use common\models\Applicant;

/**
 * ApplicantSearch represents the model behind the search form about `common\models\Applicant`.
 */
class ApplicantSearch extends Applicant
{
    public function rules()
    {
        return [
            [['id', 'event_id', 'user_id', 'gender_status', 'religion_id', 'citizenship_status', 'blood_type', 'height', 'weight', 'head_circle', 'number_of_sibling', 'number_of_dependent', 'number_of_step_sibling', 'birth_order', 'child_status', 'final_status', 'approval_status', 'date_approval', 'approved_by', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['email', 'record_number', 'family_card_number', 'identity_number', 'birth_certificate_number', 'title', 'nick_name', 'birth_place', 'date_birth', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'phone_number', 'hobby', 'native_language', 'illness', 'disability', 'file_name', 'date_final', 'description', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = Applicant::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'event_id' => $this->event_id,
            'user_id' => $this->user_id,
            'gender_status' => $this->gender_status,
            'date_birth' => $this->date_birth,
            'religion_id' => $this->religion_id,
            'citizenship_status' => $this->citizenship_status,
            'blood_type' => $this->blood_type,
            'height' => $this->height,
            'weight' => $this->weight,
            'head_circle' => $this->head_circle,
            'number_of_sibling' => $this->number_of_sibling,
            'number_of_dependent' => $this->number_of_dependent,
            'number_of_step_sibling' => $this->number_of_step_sibling,
            'birth_order' => $this->birth_order,
            'child_status' => $this->child_status,
            'final_status' => $this->final_status,
            'date_final' => $this->date_final,
            'approval_status' => $this->approval_status,
            'date_approval' => $this->date_approval,
            'approved_by' => $this->approved_by,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'record_number', $this->record_number])
            ->andFilterWhere(['like', 'family_card_number', $this->family_card_number])
            ->andFilterWhere(['like', 'identity_number', $this->identity_number])
            ->andFilterWhere(['like', 'birth_certificate_number', $this->birth_certificate_number])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'nick_name', $this->nick_name])
            ->andFilterWhere(['like', 'birth_place', $this->birth_place])
            ->andFilterWhere(['like', 'address_street', $this->address_street])
            ->andFilterWhere(['like', 'address_village', $this->address_village])
            ->andFilterWhere(['like', 'address_sub_district', $this->address_sub_district])
            ->andFilterWhere(['like', 'address_city', $this->address_city])
            ->andFilterWhere(['like', 'address_province', $this->address_province])
            ->andFilterWhere(['like', 'phone_number', $this->phone_number])
            ->andFilterWhere(['like', 'hobby', $this->hobby])
            ->andFilterWhere(['like', 'native_language', $this->native_language])
            ->andFilterWhere(['like', 'illness', $this->illness])
            ->andFilterWhere(['like', 'disability', $this->disability])
            ->andFilterWhere(['like', 'file_name', $this->file_name])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
