<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use kartik\daterange\DateRangeBehavior;
use common\models\ApplicantGrade;

/**
 * ApplicantGradeSearch represents the model behind the search form about `common\models\ApplicantGrade`.
 */
class ApplicantGradeSearch extends ApplicantGrade
{
    public function rules()
    {
        return [
            [['id', 'applicant_id', 'event_id', 'course_id', 'semester_id', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'description', 'created_at', 'updated_at', 'deleted_at', 'uuid'], 'safe'],
            [['grade'], 'number'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = ApplicantGrade::find();

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
            'course_id' => $this->course_id,
            'semester_id' => $this->semester_id,
            'grade' => $this->grade,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'deleted_at' => $this->deleted_at,
            'deleted_by' => $this->deleted_by,
            'verlock' => $this->verlock,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'uuid', $this->uuid]);

        return $dataProvider;
    }
}
