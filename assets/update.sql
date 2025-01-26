DROP TABLE `tx_pricing_detail`;
DROP TABLE `tx_pricing`;
DROP TABLE `tx_product_image`;
DROP TABLE `tx_product_feature`;
DROP TABLE `tx_product`;
DROP TABLE `tx_product_type`;
DROP TABLE `tx_quote`;
DROP TABLE `tx_ranking`;
DROP TABLE `tx_subscriber`;
DROP TABLE `tx_customer`;

DROP TABLE `tx_village`;
DROP TABLE `tx_blog`;
DROP TABLE `tx_category`;
DROP TABLE `tx_tag`;
DROP TABLE `tx_author`;
DROP TABLE `tx_feature`;
DROP TABLE `tx_measure`;
DROP TABLE `tx_note_type`;
DROP TABLE `tx_note`;
DROP TABLE `tx_area`;
DROP TABLE `tx_photo`;
DROP TABLE `tx_album`;


ALTER TABLE `tx_applicant` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_applicant` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_applicant` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_applicant` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_applicant` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_applicant` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_applicant` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_applicant` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
    ADD `deleted_by` INT NULL AFTER `deleted_at`;

ALTER TABLE `tx_applicant` CHANGE `date_birth` `date_birth` VARCHAR(20);
UPDATE `tx_applicant` SET `date_birth` = FROM_UNIXTIME(`date_birth`);
ALTER TABLE `tx_applicant` CHANGE `date_birth` `date_birth` DATETIME;

ALTER TABLE `tx_applicant` CHANGE `date_final` `date_final` VARCHAR(20);
UPDATE `tx_applicant` SET `date_final` = FROM_UNIXTIME(`date_final`);
ALTER TABLE `tx_applicant` CHANGE `date_final` `date_final` DATETIME;


ALTER TABLE `tx_applicant_almamater` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_applicant_almamater` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_applicant_almamater` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_applicant_almamater` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_applicant_almamater` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_applicant_almamater` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_applicant_almamater` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_applicant_almamater` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                           ADD `deleted_by` INT NULL AFTER `deleted_at`;

ALTER TABLE `tx_applicant_almamater` CHANGE `date_graduation` `date_graduation` VARCHAR(20);
UPDATE `tx_applicant_almamater` SET `date_graduation` = FROM_UNIXTIME(`date_graduation`);
ALTER TABLE `tx_applicant_almamater` CHANGE `date_graduation` `date_graduation` DATETIME;

ALTER TABLE `tx_applicant_document` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_applicant_document` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_applicant_document` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_applicant_document` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_applicant_document` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_applicant_document` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_applicant_document` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_applicant_document` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                                     ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_applicant_family` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_applicant_family` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_applicant_family` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_applicant_family` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_applicant_family` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_applicant_family` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_applicant_family` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_applicant_family` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                                    ADD `deleted_by` INT NULL AFTER `deleted_at`;

ALTER TABLE `tx_applicant_family` CHANGE `date_birth` `date_birth` VARCHAR(20);
UPDATE `tx_applicant_family` SET `date_birth` = FROM_UNIXTIME(`date_birth`);
ALTER TABLE `tx_applicant_family` CHANGE `date_birth` `date_birth` DATETIME;

ALTER TABLE `tx_applicant_grade` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_applicant_grade` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_applicant_grade` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_applicant_grade` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_applicant_grade` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_applicant_grade` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_applicant_grade` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_applicant_grade` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                                  ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_course` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_course` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_course` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_course` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_course` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_course` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_course` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_course` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                                 ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_document` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_document` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_document` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_document` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_document` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_document` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_document` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_document` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                        ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_employment` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_employment` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_employment` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_employment` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_employment` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_employment` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_employment` CHANGE `updated_at` `updated_at` DATETIME;
ALTER TABLE `tx_employment` CHANGE `deleted_at` `deleted_at` VARCHAR(20);
UPDATE `tx_employment` SET `deleted_at` = FROM_UNIXTIME(`deleted_at`);
ALTER TABLE `tx_employment` CHANGE `deleted_at` `deleted_at` DATETIME;

ALTER TABLE `tx_income` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_income` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_income` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_income` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_income` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_income` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_income` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_income` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                            ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_religion` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_religion` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_religion` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_religion` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_religion` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_religion` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_religion` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_religion` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                        ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_residence` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_residence` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_residence` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_residence` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_residence` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_residence` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_residence` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_residence` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                          ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_semester` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_semester` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_semester` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_semester` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_semester` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_semester` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_semester` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_semester` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                           ADD `deleted_by` INT NULL AFTER `deleted_at`;



ALTER TABLE `tx_staff` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_staff` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_staff` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_staff` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_staff` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_staff` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_staff` CHANGE `updated_at` `updated_at` DATETIME;
ALTER TABLE `tx_staff` CHANGE `deleted_at` `deleted_at` VARCHAR(20);
UPDATE `tx_staff` SET `deleted_at` = FROM_UNIXTIME(`deleted_at`);
ALTER TABLE `tx_staff` CHANGE `deleted_at` `deleted_at` DATETIME;


ALTER TABLE `tx_transportation` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_transportation` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_transportation` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_transportation` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_transportation` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_transportation` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_transportation` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_transportation` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                       ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_office` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_office` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_office` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_office` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_office` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_office` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_office` CHANGE `updated_at` `updated_at` DATETIME;
ALTER TABLE `tx_office` CHANGE `deleted_at` `deleted_at` VARCHAR(20);
UPDATE `tx_office` SET `deleted_at` = FROM_UNIXTIME(`deleted_at`);
ALTER TABLE `tx_office` CHANGE `deleted_at` `deleted_at` DATETIME;

ALTER TABLE `tx_office`
    ADD COLUMN `unique_id` VARCHAR(15) NULL AFTER `id`;

ALTER TABLE `tx_applicant`
    ADD COLUMN `office_id` INT(11) NULL AFTER `id`;

ALTER TABLE `tx_applicant` ADD CONSTRAINT
    `FK_tx_applicant_office` FOREIGN KEY (`office_id`)
        REFERENCES `tx_office`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tx_applicant_almamater`
    ADD COLUMN `office_id` INT(11) NULL AFTER `id`;

ALTER TABLE `tx_applicant_almamater` ADD CONSTRAINT
    `Fk_applicant_almamater_office` FOREIGN KEY (`office_id`)
        REFERENCES `tx_office`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tx_applicant_document`
    ADD COLUMN `office_id` INT(11) NULL AFTER `id`;

ALTER TABLE `tx_applicant_document` ADD CONSTRAINT
    `Fk_applicant_document_office` FOREIGN KEY (`office_id`)
        REFERENCES `tx_office`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tx_applicant_family`
    ADD COLUMN `office_id` INT(11) NULL AFTER `id`;

ALTER TABLE `tx_applicant_family` ADD CONSTRAINT
    `Fk_applicant_family_office` FOREIGN KEY (`office_id`)
        REFERENCES `tx_office`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tx_applicant_grade`
    ADD COLUMN `office_id` INT(11) NULL AFTER `id`;

ALTER TABLE `tx_applicant_grade` ADD CONSTRAINT
    `Fk_applicant_grade_office` FOREIGN KEY (`office_id`)
        REFERENCES `tx_office`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;



ALTER TABLE `tx_staff`
    ADD COLUMN `office_id` INT(11) NULL AFTER `id`;

ALTER TABLE `tx_staff` ADD CONSTRAINT
    `Fk_staff_office` FOREIGN KEY (`office_id`)
        REFERENCES `tx_office`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `tx_staff`
    ADD COLUMN `user_id` INT(11) NULL AFTER `office_id`;

ALTER TABLE `tx_staff` ADD CONSTRAINT
    `Fk_staff_user` FOREIGN KEY (`user_id`)
        REFERENCES `tx_user`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


--
-- ASSET CATEGORY
--

RENAME TABLE `tx_archive_category` TO `tx_asset_category`;

ALTER TABLE `tx_asset_category`
    ADD COLUMN `uuid` VARCHAR(36) DEFAULT NULL AFTER `verlock`;


ALTER TABLE `tx_asset_category` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_asset_category` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_asset_category` CHANGE `created_at` `created_at` DATETIME;

ALTER TABLE `tx_asset_category` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_asset_category` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_asset_category` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_asset_category` CHANGE `deleted_at` `deleted_at` VARCHAR(20);
UPDATE `tx_asset_category` SET `deleted_at` = FROM_UNIXTIME(`deleted_at`);
ALTER TABLE `tx_asset_category` CHANGE `deleted_at` `deleted_at` DATETIME;


--
-- ARCHIVE
--
RENAME TABLE `tx_archive` TO `tx_asset`;

ALTER TABLE `tx_asset`
    ADD COLUMN `uuid` VARCHAR(36) DEFAULT NULL AFTER `verlock`;

ALTER TABLE `tx_asset` CHANGE `file_name` `asset_name` VARCHAR(100);

ALTER TABLE `tx_asset` CHANGE `archive_type` `asset_type` INT(11);
ALTER TABLE `tx_asset` CHANGE `archive_category_id`  `asset_category_id` INT(11);
ALTER TABLE `tx_asset` CHANGE `archive_url` `asset_url` VARCHAR(500) NULL DEFAULT NULL;


ALTER TABLE `tx_asset`
    ADD COLUMN `asset_group` INTEGER(11) NULL AFTER `asset_type`;

ALTER TABLE `tx_asset` CHANGE `date_issued` `date_issued` VARCHAR(20);
UPDATE `tx_asset` SET `date_issued` = FROM_UNIXTIME(`date_issued`);
ALTER TABLE `tx_asset` CHANGE `date_issued` `date_issued` DATE;

ALTER TABLE `tx_asset` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_asset` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_asset` CHANGE `created_at` `created_at` DATETIME;

ALTER TABLE `tx_asset` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_asset` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_asset` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_asset` CHANGE `deleted_at` `deleted_at` VARCHAR(20);
UPDATE `tx_asset` SET `deleted_at` = FROM_UNIXTIME(`deleted_at`);
ALTER TABLE `tx_asset` CHANGE `deleted_at` `deleted_at` DATETIME;

