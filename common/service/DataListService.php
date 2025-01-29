<?php

namespace common\service;

use common\models\Asset;
use common\models\AssetCategory;
use common\models\Course;
use common\models\EducationalStage;
use common\models\Employment;
use common\models\Income;
use common\models\Occupation;
use common\models\Office;
use common\models\Religion;
use common\models\Residence;
use common\models\Semester;
use common\models\Staff;
use common\models\Transportation;
use yii\helpers\ArrayHelper;

class DataListService
{
    public static function getOffice(): array
    {
        return ArrayHelper::map(Office::find()
            ->where(['id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }
    public static function getAsset(): array
    {
        return ArrayHelper::map(Asset::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getAssetCategory(): array
    {
        return ArrayHelper::map(AssetCategory::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getCourse(): array
    {
        return ArrayHelper::map(Course::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getEducationalStage(): array
    {
        return ArrayHelper::map(EducationalStage::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getIncome(): array
    {
        return ArrayHelper::map(Income::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getOccupation(): array
    {
        return ArrayHelper::map(Occupation::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getReligion(): array
    {
        return ArrayHelper::map(Religion::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getResidence(): array
    {
        return ArrayHelper::map(Residence::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getSemester(): array
    {
        return ArrayHelper::map(Semester::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getTransportation(): array
    {
        return ArrayHelper::map(Transportation::find()
            ->asArray()->all(), 'id', 'title');
    }
    public static function getEmployment(): array
    {
        return ArrayHelper::map(Employment::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }
    public static function getStaff(): array
    {
        return ArrayHelper::map(Staff::find()
            ->where(['office_id' => DataIdService::getOfficeId()])
            ->asArray()->all(), 'id', 'title');
    }
}