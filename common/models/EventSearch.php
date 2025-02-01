<?php

namespace common\models;

use kartik\daterange\DateRangeBehavior;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * EventSearch represents the model behind the search form about `common\models\Event`.
 */
class EventSearch extends \common\models\Event
{
    
    public $date_start_range;
    public $date_start_first;
    public $date_start_last;    
    
    public $date_end_range;
    public $date_end_first;
    public $date_end_last;  
    
    public function behaviors()
    {
        return [
            [
                'class' => DateRangeBehavior::className(),
                'attribute' => 'date_start_range',
                'dateStartAttribute' => 'date_start_first',
                'dateEndAttribute' => 'date_start_last',
            ],
            [
                'class' => DateRangeBehavior::className(),
                'attribute' => 'date_end_range',
                'dateStartAttribute' => 'date_end_first',
                'dateEndAttribute' => 'date_end_last',
            ],            
        ];
    }    
    
    public function rules()
    {
        return [
            [['date_start', 'date_end', 'view_counter', 'created_at', 'updated_at', 'created_by', 'updated_by', 'is_deleted', 'deleted_at', 'deleted_by', 'verlock'], 'integer'],
            [['title', 'location', 'content','description'], 'safe'],
            [['is_open_registration'], 'string', 'max' => 1],
            [['is_using_comingsoon'], 'string', 'max' => 1],
            [['is_active'], 'string', 'max' => 1],
            [['date_start_range', 'date_end_range'], 'match', 'pattern' => '/^.+\s\-\s.+$/'],
        ];
    }

    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = \common\models\Event::find()->orderBy(['created_at'=>SORT_DESC]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
 
        
        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }
	        
        $query->andFilterWhere([
            'id' => $this->id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'location', $this->location])
            ->andFilterWhere(['like', 'content', $this->location])
            ->andFilterWhere(['like', 'description', $this->description]);

        $query->andFilterWhere(['>=', 'date_start', $this->date_start_first])
              ->andFilterWhere(['<', 'date_start', $this->date_start_last])
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'is_open_registration', $this->is_open_registration])
            ->andFilterWhere(['like', 'is_using_comingsoon', $this->is_using_comingsoon])
            ->andFilterWhere(['like', 'is_active', $this->is_active])
            ->andFilterWhere(['like', 'days_for_comingsoon', $this->days_for_comingsoon]);
        
        $query->andFilterWhere(['>=', 'date_end', $this->date_end_first])
              ->andFilterWhere(['<', 'date_end', $this->date_end_last]);           
        
        return $dataProvider;
    }
}
