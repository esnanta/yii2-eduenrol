<?php

namespace common\service;

use common\models\Archive;
use common\models\ArchiveCategory;
use common\models\Assessment;
use common\models\Asset;
use common\models\AssetCategory;
use common\models\Course;
use common\models\Employment;
use common\models\Group;
use common\models\Office;
use common\models\Participant;
use common\models\Period;
use common\models\Religion;
use common\models\Room;
use common\models\Schedule;
use common\models\Staff;
use common\models\Subject;
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

    public static function getReligion(): array
    {
        return ArrayHelper::map(Religion::find()
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