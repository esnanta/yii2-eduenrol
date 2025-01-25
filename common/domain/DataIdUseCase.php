<?php

namespace common\domain;

use common\service\CacheService;

class DataIdUseCase
{
    public static function getOfficeId()
    {
        return CacheService::getInstance()->getOfficeId();
    }
}
