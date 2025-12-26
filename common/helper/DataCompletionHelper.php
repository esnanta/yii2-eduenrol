<?php

namespace common\helper;

class DataCompletionHelper
{
    /**
     * Calculate the filled percentage of specific columns in a record.
     *
     * @param \yii\db\ActiveRecord $record  The record to calculate.
     * @param array $columns                List of column names to check.
     * @return float                        Percentage of filled columns.
     */
    public static function calculateFilledPercentage($record, array $columns)
    {
        if (!$record) {
            return 0;
        }

        $filledCount = 0;

        foreach ($columns as $column) {
            if (!empty($record->$column)) {
                $filledCount++;
            }
        }

        return ceil(($filledCount / count($columns)) * 100);
    }

    /**
     * Identify which columns are empty or null in a record.
     *
     * @param \yii\db\ActiveRecord $record  The record to check.
     * @param array $columns                List of column names to verify.
     * @return array                        List of empty columns.
     */
    public static function getEmptyColumns($record, array $columns)
    {
        $emptyColumns = [];

        if (!$record) {
            return $columns; // All columns are empty if the record doesn't exist
        }

        foreach ($columns as $column) {
            if (empty($record->$column)) {
                $emptyColumns[] = $column;
            }
        }

        return $emptyColumns;
    }
}
