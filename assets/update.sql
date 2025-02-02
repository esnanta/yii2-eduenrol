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


ALTER TABLE `tx_educational_stage` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_educational_stage` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_educational_stage` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_educational_stage` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_educational_stage` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_educational_stage` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_educational_stage` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_educational_stage` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                          ADD `deleted_by` INT NULL AFTER `deleted_at`;

ALTER TABLE `tx_income` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_income` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_income` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_income` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_income` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_income` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_income` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_income` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
                            ADD `deleted_by` INT NULL AFTER `deleted_at`;


ALTER TABLE `tx_occupation` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;
ALTER TABLE `tx_occupation` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_occupation` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_occupation` CHANGE `created_at` `created_at` DATETIME;
ALTER TABLE `tx_occupation` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_occupation` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_occupation` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_occupation` ADD `deleted_at` DATETIME NULL AFTER `updated_by`,
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

ALTER TABLE `tx_staff` CHANGE `file_name` `asset_name` VARCHAR(200)
    NULL DEFAULT NULL;

ALTER TABLE `tx_staff`
    DROP `google_plus`,
    DROP `instagram`,
    DROP `facebook`,
    DROP `twitter`;

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

UPDATE tx_staff SET office_id = 1 WHERE office_id IS NULL;

DELETE FROM tx_staff WHERE id <> 1;
ALTER TABLE tx_staff AUTO_INCREMENT = 1;

ALTER TABLE `tx_employment`
    ADD COLUMN `office_id` INT(11) NULL AFTER `id`;

ALTER TABLE `tx_employment` ADD CONSTRAINT
    `FK_tx_employment_office` FOREIGN KEY (`office_id`)
        REFERENCES `tx_office`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

UPDATE `tx_employment` SET `office_id` = 1 where `office_id` IS NULL;

ALTER TABLE tx_staff
    DROP FOREIGN KEY FK_tx_staff_employment;

DELETE FROM tx_employment WHERE id <> 2;
UPDATE tx_employment set id = 1 where id = 2;
ALTER TABLE tx_employment AUTO_INCREMENT = 1;

UPDATE tx_staff SET employment_id = 1 WHERE employment_id <> 1;
ALTER TABLE `tx_staff` ADD CONSTRAINT
    `FK_tx_staff_employment` FOREIGN KEY (`employment_id`)
        REFERENCES `tx_employment`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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

UPDATE `tx_applicant` SET `office_id` = 1 where `office_id` IS NULL;
UPDATE `tx_applicant_almamater` SET `office_id` = 1 where `office_id` IS NULL;
UPDATE `tx_applicant_document` SET `office_id` = 1 where `office_id` IS NULL;
UPDATE `tx_applicant_family` SET `office_id` = 1 where `office_id` IS NULL;
UPDATE `tx_applicant_grade` SET `office_id` = 1 where `office_id` IS NULL;

UPDATE `tx_staff` SET `office_id` = 1 where `id` = 1;
UPDATE `tx_staff` SET `user_id` = 1 where `id` = 1;


ALTER TABLE `tx_event` CHANGE `date_start` `date_start` VARCHAR(20);
UPDATE `tx_event` SET `date_start` = FROM_UNIXTIME(`date_start`);
ALTER TABLE `tx_event` CHANGE `date_start` `date_start` DATETIME;

ALTER TABLE `tx_event` CHANGE `date_end` `date_end` VARCHAR(20);
UPDATE `tx_event` SET `date_end` = FROM_UNIXTIME(`date_end`);
ALTER TABLE `tx_event` CHANGE `date_end` `date_end` DATETIME;

ALTER TABLE `tx_event` CHANGE `created_at` `created_at` VARCHAR(20);
UPDATE `tx_event` SET `created_at` = FROM_UNIXTIME(`created_at`);
ALTER TABLE `tx_event` CHANGE `created_at` `created_at` DATETIME;

ALTER TABLE `tx_event` CHANGE `updated_at` `updated_at` VARCHAR(20);
UPDATE `tx_event` SET `updated_at` = FROM_UNIXTIME(`updated_at`);
ALTER TABLE `tx_event` CHANGE `updated_at` `updated_at` DATETIME;

ALTER TABLE `tx_event` CHANGE `deleted_at` `deleted_at` VARCHAR(20);
UPDATE `tx_event` SET `deleted_at` = FROM_UNIXTIME(`deleted_at`);
ALTER TABLE `tx_event` CHANGE `deleted_at` `deleted_at` DATETIME;

ALTER TABLE `tx_event` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;




DROP TABLE `tx_page`;
DROP TABLE `tx_page_type`;

ALTER TABLE `tx_theme_detail` DROP FOREIGN KEY `FK_tx_theme_detail_theme`;
ALTER TABLE `tx_theme_detail` DROP INDEX `FK_tx_content_theme`;
ALTER TABLE `tx_theme_detail` DROP INDEX `layout_code_UNIQUE`;
ALTER TABLE `tx_theme_detail` DROP `theme_id`;
ALTER TABLE `tx_theme_detail` DROP `token`;

DROP TABLE `tx_theme`;
RENAME TABLE `tx_theme_detail` TO `tx_page`;

ALTER TABLE `tx_page`
    ADD COLUMN `page_type` INTEGER(11) NULL AFTER `id`;

ALTER TABLE `tx_page` ADD `uuid` VARCHAR(36) NULL AFTER `verlock`;


--
-- Dumping data for table `tx_page`
--
delete from `tx_page`;
INSERT INTO `tx_page` (`id`, `page_type`, `title`, `content`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`)
VALUES
    (1, 2, 'Logo 1', '<p><img style=\"width: 103px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGcAAAAnCAYAAAASGVaVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODcxNjQ4RjBEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODcxNjQ4RUZEMDI5MTFFNjhFOUZCNTlCN0ZERTdEREIiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo3YTJkN2YzYS0xNGQxLTQyODQtYmYwZC00MGUxZTJkMjNjOGYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6N2EyZDdmM2EtMTRkMS00Mjg0LWJmMGQtNDBlMWUyZDIzYzhm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\" data-filename=\"logo-1.png\"><br></p>', 'Logo 1 - Bagian Atas Kiri', '2018-01-08 21:47:15', '2024-08-18 15:55:56', 1, 1, NULL, NULL, NULL, 0, ''),
    (2, 2, 'Logo 2', '<p><img style=\"width: 200px;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAnCAYAAABKSgfJAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDE0IDc5LjE1Njc5NywgMjAxNC8wOC8yMC0wOTo1MzowMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MERFMUI5RERGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MERFMUI5REVGNTlGMTFFNDk4QTZDQjA2OEIzQTJBRUUiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowREUxQjlEQkY1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowREUxQjlEQ0Y1OUYxMUU0OThBNkNCMDY4QjNBMkFFRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoaoddcAAA6SSURBVHja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\" data-filename=\"logo-14.png\"><br></p>', 'Logo 2 - Bagian Bawah Kiri', '2018-01-08 21:47:15', '2024-08-18 15:55:41', 1, 1, NULL, NULL, NULL, 0, ''),
    (3, 2, 'Logo Report 1', 'b3MYTwJeYCkb4IUmLrPkjcePntzALUBi.png', 'Logo 1 - Bagian Atas Kiri', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
    (4, 2, 'Logo Report 2', 'q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png', 'NA', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
    (11, 1, 'SEO Description', NULL, 'SEO Description', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
    (12, 1, 'SEO Keyword', NULL, 'SEO Keyword', '2018-01-08 21:47:15', '2018-01-08 21:47:15', 1, 1, NULL, NULL, NULL, 0, ''),
    (21, 1, 'About', 'VD6pJHgk7ikBhHW6gmW59mfrWLQhjpFx.png', 'Donec id elit y DESCRIPTION.', '2017-12-02 22:33:55', '2017-12-02 22:39:25', 1, 1, NULL, NULL, NULL, 0, '');


