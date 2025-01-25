/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.22-MariaDB : Database - yii2-enrollment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yii2-enrollment` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `yii2-enrollment`;

/*Table structure for table `tx_album` */

DROP TABLE IF EXISTS `tx_album`;

CREATE TABLE `tx_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_type` int(11) DEFAULT NULL,
  `cover` varchar(500) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_name_UNIQUE` (`title`),
  KEY `FK_tx_album_type` (`album_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_album` */

/*Table structure for table `tx_applicant` */

DROP TABLE IF EXISTS `tx_applicant`;

CREATE TABLE `tx_applicant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `record_number` varchar(15) DEFAULT NULL,
  `family_card_number` varchar(50) DEFAULT NULL COMMENT 'No KK',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIK',
  `birth_certificate_number` varchar(50) DEFAULT NULL COMMENT 'No Akte',
  `title` varchar(100) DEFAULT NULL,
  `nick_name` varchar(100) DEFAULT NULL,
  `gender_status` int(11) DEFAULT NULL,
  `birth_place` varchar(50) DEFAULT NULL,
  `date_birth` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `citizenship_status` int(11) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_village` varchar(50) DEFAULT NULL,
  `address_sub_district` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_province` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hobby` tinytext DEFAULT NULL,
  `blood_type` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `head_circle` int(11) DEFAULT NULL,
  `number_of_sibling` int(4) DEFAULT NULL,
  `number_of_dependent` int(4) DEFAULT NULL,
  `number_of_step_sibling` int(4) DEFAULT NULL,
  `birth_order` int(4) DEFAULT NULL,
  `child_status` int(11) DEFAULT NULL,
  `native_language` varchar(100) DEFAULT NULL,
  `illness` tinytext DEFAULT NULL,
  `disability` tinytext DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `final_status` int(11) DEFAULT NULL,
  `date_final` int(11) DEFAULT NULL,
  `approval_status` int(11) DEFAULT NULL,
  `date_approval` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_applicant_user` (`user_id`),
  KEY `FK_tx_applicant_citizenship` (`citizenship_status`),
  KEY `FK_tx_applicant_religion` (`religion_id`),
  KEY `FK_tx_applicant_gender` (`gender_status`),
  KEY `FK_tx_applicant_blood_type` (`blood_type`),
  KEY `FK_tx_applicant_child_status` (`child_status`),
  KEY `FK_tx_applicant_event` (`event_id`),
  CONSTRAINT `FK_tx_applicant_event` FOREIGN KEY (`event_id`) REFERENCES `tx_event` (`id`),
  CONSTRAINT `FK_tx_applicant_religion` FOREIGN KEY (`religion_id`) REFERENCES `tx_religion` (`id`),
  CONSTRAINT `FK_tx_applicant_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tx_applicant` */

insert  into `tx_applicant`(`id`,`event_id`,`user_id`,`record_number`,`family_card_number`,`identity_number`,`birth_certificate_number`,`title`,`nick_name`,`gender_status`,`birth_place`,`date_birth`,`religion_id`,`citizenship_status`,`address_street`,`address_village`,`address_sub_district`,`address_city`,`address_province`,`phone_number`,`email`,`hobby`,`blood_type`,`height`,`weight`,`head_circle`,`number_of_sibling`,`number_of_dependent`,`number_of_step_sibling`,`birth_order`,`child_status`,`native_language`,`illness`,`disability`,`file_name`,`final_status`,`date_final`,`approval_status`,`date_approval`,`approved_by`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(2,NULL,338,'MBA2200002',NULL,NULL,NULL,'','',NULL,'',1643518800,NULL,NULL,'','','','','',NULL,'oke@test.com','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',NULL,1,NULL,1,NULL,NULL,NULL,1643476242,1643476242,NULL,NULL,0);

/*Table structure for table `tx_applicant_almamater` */

DROP TABLE IF EXISTS `tx_applicant_almamater`;

CREATE TABLE `tx_applicant_almamater` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT 'almamater name',
  `national_school_principal_number` varchar(20) DEFAULT NULL COMMENT 'npsn',
  `national_registration_number` varchar(20) DEFAULT NULL COMMENT 'nisn',
  `school_registration_number` varchar(20) DEFAULT NULL COMMENT 'nis',
  `educational_stage_id` int(11) DEFAULT NULL,
  `school_status` int(11) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `date_graduation` int(11) DEFAULT NULL,
  `study_time_length` int(11) DEFAULT NULL,
  `tuition_payer` int(11) DEFAULT NULL,
  `certificate_serial_number` varchar(15) DEFAULT NULL COMMENT 'nomor seri ijazah',
  `examination_serial_number` varchar(15) DEFAULT NULL COMMENT 'nomor seri skhun',
  `examination_card_number` varchar(15) DEFAULT NULL COMMENT 'nomor peserta ujian',
  `address_street` tinytext DEFAULT NULL,
  `address_village` tinytext DEFAULT NULL,
  `address_sub_district` tinytext DEFAULT NULL,
  `address_city` tinytext DEFAULT NULL,
  `address_province` tinytext DEFAULT NULL,
  `residence_id` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `transportation_id` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_applicant_almamater` (`applicant_id`),
  KEY `FK_tx_applicant_almamater_school_status` (`school_status`),
  KEY `FK_tx_applicant_almamater_educational_stage` (`educational_stage_id`),
  KEY `FK_tx_applicant_almamater_transportation` (`transportation_id`),
  KEY `FK_tx_applicant_almamater_residence` (`residence_id`),
  KEY `FK_tx_applicant_almamater_event` (`event_id`),
  CONSTRAINT `FK_tx_applicant_almamater` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  CONSTRAINT `FK_tx_applicant_almamater_educational_stage` FOREIGN KEY (`educational_stage_id`) REFERENCES `tx_educational_stage` (`id`),
  CONSTRAINT `FK_tx_applicant_almamater_event` FOREIGN KEY (`event_id`) REFERENCES `tx_event` (`id`),
  CONSTRAINT `FK_tx_applicant_almamater_residence` FOREIGN KEY (`residence_id`) REFERENCES `tx_residence` (`id`),
  CONSTRAINT `FK_tx_applicant_almamater_transportation` FOREIGN KEY (`transportation_id`) REFERENCES `tx_transportation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tx_applicant_almamater` */

insert  into `tx_applicant_almamater`(`id`,`applicant_id`,`event_id`,`title`,`national_school_principal_number`,`national_registration_number`,`school_registration_number`,`educational_stage_id`,`school_status`,`phone_number`,`date_graduation`,`study_time_length`,`tuition_payer`,`certificate_serial_number`,`examination_serial_number`,`examination_card_number`,`address_street`,`address_village`,`address_sub_district`,`address_city`,`address_province`,`residence_id`,`distance`,`transportation_id`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,2,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,1643518800,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,1643476242,1643476242,NULL,NULL,0);

/*Table structure for table `tx_applicant_document` */

DROP TABLE IF EXISTS `tx_applicant_document`;

CREATE TABLE `tx_applicant_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `document_status` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_applicant_document_applicant` (`applicant_id`),
  KEY `FK_tx_applicant_document_document` (`document_id`),
  KEY `FK_tx_applicant_document_lookup_status` (`document_status`),
  KEY `FK_tx_applicant_document_event` (`event_id`),
  CONSTRAINT `FK_tx_applicant_document_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  CONSTRAINT `FK_tx_applicant_document_document` FOREIGN KEY (`document_id`) REFERENCES `tx_document` (`id`),
  CONSTRAINT `FK_tx_applicant_document_event` FOREIGN KEY (`event_id`) REFERENCES `tx_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tx_applicant_document` */

insert  into `tx_applicant_document`(`id`,`applicant_id`,`event_id`,`document_id`,`title`,`quantity`,`file_name`,`document_status`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,2,NULL,6,'Olimpiade Penelitian Siswa Indonesia',1,NULL,1,'Tingkat Provinsi/Kab/Kota	',1643478999,1643478999,338,338,0),
(2,2,NULL,1,'Juara 1,2,3 OSN/KSM',1,NULL,1,'Tingkat Provinsi/Kab/Kota',1643478999,1643478999,338,338,0),
(3,2,NULL,2,'Juara 1,2,3 MTQ',1,NULL,1,'Tingkat Provinsi/Kab/Kota',1643478999,1643478999,338,338,0),
(4,2,NULL,3,'Rangking 1 Kelas IX Semester V',1,NULL,1,'',1643478999,1643478999,338,338,0),
(5,2,NULL,4,'Juara 1 FLS2N',1,NULL,1,'',1643478999,1643478999,338,338,0),
(6,2,NULL,5,'Tahfiz 2 Jus',1,NULL,1,'',1643478999,1643478999,338,338,0);

/*Table structure for table `tx_applicant_family` */

DROP TABLE IF EXISTS `tx_applicant_family`;

CREATE TABLE `tx_applicant_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `family_type` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `identity_number` varchar(50) DEFAULT NULL,
  `birth_place` varchar(100) DEFAULT NULL,
  `date_birth` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `educational_stage_id` int(11) DEFAULT NULL,
  `occupation_id` int(11) DEFAULT NULL,
  `income_id` int(11) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `citizenship_status` int(11) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_village` varchar(50) DEFAULT NULL,
  `address_sub_district` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_province` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_applicant_family` (`applicant_id`),
  KEY `FK_tx_applicant_family_type` (`family_type`),
  KEY `FK_tx_applicant_family_income` (`income_id`),
  KEY `FK_tx_applicant_family_religion` (`religion_id`),
  KEY `FK_tx_applicant_family_occupation` (`occupation_id`),
  KEY `FK_tx_applicant_family_citizenship` (`citizenship_status`),
  KEY `FK_tx_applicant_family_educational_stage` (`educational_stage_id`),
  KEY `FK_tx_applicant_family_event` (`event_id`),
  CONSTRAINT `FK_tx_applicant_family` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  CONSTRAINT `FK_tx_applicant_family_educational_stage` FOREIGN KEY (`educational_stage_id`) REFERENCES `tx_educational_stage` (`id`),
  CONSTRAINT `FK_tx_applicant_family_event` FOREIGN KEY (`event_id`) REFERENCES `tx_event` (`id`),
  CONSTRAINT `FK_tx_applicant_family_income` FOREIGN KEY (`income_id`) REFERENCES `tx_income` (`id`),
  CONSTRAINT `FK_tx_applicant_family_occupation` FOREIGN KEY (`occupation_id`) REFERENCES `tx_occupation` (`id`),
  CONSTRAINT `FK_tx_applicant_family_religion` FOREIGN KEY (`religion_id`) REFERENCES `tx_religion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tx_applicant_family` */

insert  into `tx_applicant_family`(`id`,`applicant_id`,`event_id`,`family_type`,`title`,`identity_number`,`birth_place`,`date_birth`,`religion_id`,`educational_stage_id`,`occupation_id`,`income_id`,`phone_number`,`citizenship_status`,`address_street`,`address_village`,`address_sub_district`,`address_city`,`address_province`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,2,NULL,1,'',NULL,'',1643518800,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,1643478924,1643478924,338,338,0),
(2,2,NULL,2,'',NULL,'',1643518800,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,1643478954,1643478954,338,338,0),
(3,2,NULL,3,'',NULL,'',1643518800,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,1643478961,1643478961,338,338,0);

/*Table structure for table `tx_applicant_grade` */

DROP TABLE IF EXISTS `tx_applicant_grade`;

CREATE TABLE `tx_applicant_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `grade` decimal(18,2) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_applicant_grade_semester` (`semester_id`),
  KEY `FK_tx_applicant_grade_course` (`course_id`),
  KEY `FK_tx_applicant_grade_applicnat` (`applicant_id`),
  KEY `FK_tx_applicant_grade_event` (`event_id`),
  CONSTRAINT `FK_tx_applicant_grade_applicnat` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  CONSTRAINT `FK_tx_applicant_grade_course` FOREIGN KEY (`course_id`) REFERENCES `tx_course` (`id`),
  CONSTRAINT `FK_tx_applicant_grade_event` FOREIGN KEY (`event_id`) REFERENCES `tx_event` (`id`),
  CONSTRAINT `FK_tx_applicant_grade_semester` FOREIGN KEY (`semester_id`) REFERENCES `tx_semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tx_applicant_grade` */

insert  into `tx_applicant_grade`(`id`,`applicant_id`,`event_id`,`course_id`,`title`,`semester_id`,`grade`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,2,NULL,1,'Pendidikan Agama',1,89.87,NULL,1643478970,1643478990,338,338,1),
(2,2,NULL,2,'Bahasa Indonesia',1,0.00,NULL,1643478970,1643478990,338,338,2),
(3,2,NULL,3,'Bahasa Inggris',1,0.00,NULL,1643478970,1643478990,338,338,2),
(4,2,NULL,4,'Matematika',1,0.00,NULL,1643478970,1643478990,338,338,2),
(5,2,NULL,5,'IPA',1,0.00,NULL,1643478970,1643478990,338,338,2);

/*Table structure for table `tx_archive` */

DROP TABLE IF EXISTS `tx_archive`;

CREATE TABLE `tx_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_visible` int(11) DEFAULT NULL,
  `archive_type` int(11) DEFAULT NULL,
  `archive_category_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date_issued` int(11) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `archive_url` varchar(500) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `download_counter` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_archive_category` (`archive_category_id`),
  CONSTRAINT `FK_tx_archive_category` FOREIGN KEY (`archive_category_id`) REFERENCES `tx_archive_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_archive` */

/*Table structure for table `tx_archive_category` */

DROP TABLE IF EXISTS `tx_archive_category`;

CREATE TABLE `tx_archive_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_archive_category` */

/*Table structure for table `tx_area` */

DROP TABLE IF EXISTS `tx_area`;

CREATE TABLE `tx_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_area` */

/*Table structure for table `tx_auth_assignment` */

DROP TABLE IF EXISTS `tx_auth_assignment`;

CREATE TABLE `tx_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `tx_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_assignment` */

insert  into `tx_auth_assignment`(`item_name`,`user_id`,`created_at`) values 
('admin','1',1525160867),
('reguler','100',1615207953),
('reguler','101',1615207972),
('reguler','102',1615208383),
('reguler','103',1615208961),
('reguler','104',1615209367),
('reguler','105',1615210696),
('reguler','106',1615210800),
('reguler','107',1615210978),
('reguler','108',1615211361),
('reguler','109',1615211833),
('reguler','110',1615213265),
('reguler','111',1615213353),
('reguler','112',1615214193),
('reguler','113',1615215258),
('reguler','114',1615216405),
('reguler','115',1615217154),
('reguler','116',1615217935),
('reguler','117',1615217970),
('reguler','118',1615227754),
('reguler','119',1615251664),
('reguler','120',1615256566),
('reguler','123',1615257783),
('reguler','124',1615258126),
('reguler','125',1615258395),
('reguler','126',1615260218),
('reguler','127',1615262164),
('reguler','128',1615263128),
('reguler','129',1615264724),
('reguler','130',1615270734),
('reguler','131',1615271184),
('reguler','132',1615271301),
('reguler','133',1615271900),
('reguler','134',1615273037),
('reguler','135',1615273044),
('reguler','136',1615274769),
('reguler','137',1615280272),
('reguler','138',1615284533),
('reguler','139',1615284818),
('reguler','14',1581095751),
('reguler','140',1615284880),
('reguler','141',1615287149),
('reguler','142',1615287812),
('reguler','143',1615290073),
('reguler','144',1615291394),
('reguler','145',1615291504),
('reguler','146',1615291932),
('reguler','147',1615293420),
('reguler','148',1615295347),
('reguler','149',1615295378),
('reguler','150',1615296728),
('reguler','151',1615297481),
('reguler','152',1615300183),
('reguler','153',1615304399),
('reguler','154',1615308687),
('reguler','155',1615309516),
('reguler','156',1615330237),
('reguler','157',1615339254),
('reguler','158',1615345908),
('reguler','159',1615345935),
('reguler','161',1615347258),
('reguler','162',1615351337),
('reguler','163',1615353641),
('reguler','164',1615353669),
('reguler','165',1615353671),
('reguler','166',1615353699),
('reguler','167',1615353787),
('reguler','168',1615354398),
('reguler','169',1615358238),
('reguler','170',1615372791),
('reguler','171',1615373060),
('reguler','172',1615375446),
('reguler','173',1615375790),
('reguler','174',1615380540),
('reguler','175',1615383989),
('reguler','176',1615384395),
('reguler','177',1615384485),
('reguler','178',1615387165),
('reguler','179',1615395071),
('reguler','180',1615418244),
('reguler','181',1615423166),
('reguler','182',1615426554),
('reguler','184',1615428148),
('reguler','185',1615428348),
('reguler','186',1615429822),
('reguler','187',1615433258),
('reguler','188',1615446178),
('reguler','189',1615448913),
('reguler','190',1615465320),
('reguler','191',1615466409),
('reguler','192',1615472931),
('reguler','193',1615473632),
('reguler','195',1615476745),
('reguler','196',1615477738),
('reguler','197',1615480427),
('reguler','198',1615513722),
('reguler','199',1615516961),
('reguler','200',1615517959),
('reguler','201',1615518917),
('reguler','202',1615525373),
('reguler','203',1615558975),
('reguler','204',1615568497),
('reguler','205',1615594920),
('reguler','206',1615629120),
('reguler','208',1615640052),
('reguler','209',1615640181),
('reguler','210',1615681033),
('reguler','211',1615685967),
('reguler','212',1615686053),
('reguler','213',1615687110),
('reguler','214',1615706094),
('reguler','215',1615709557),
('reguler','216',1615719760),
('reguler','217',1615724863),
('reguler','218',1615735366),
('reguler','219',1615740811),
('reguler','220',1615775478),
('reguler','221',1615782923),
('reguler','222',1615783026),
('reguler','223',1615783148),
('reguler','224',1615783863),
('reguler','225',1615790947),
('reguler','226',1615792012),
('reguler','227',1615798862),
('reguler','228',1615807961),
('reguler','229',1615811027),
('reguler','231',1615813021),
('reguler','232',1615819272),
('reguler','233',1615819805),
('reguler','234',1615859670),
('reguler','237',1615863824),
('reguler','238',1615867224),
('reguler','239',1615868207),
('reguler','240',1615868288),
('reguler','242',1615868459),
('reguler','243',1615868462),
('reguler','246',1615876968),
('reguler','247',1615898641),
('reguler','248',1615902472),
('reguler','249',1615942502),
('reguler','250',1615946515),
('reguler','251',1615947266),
('reguler','252',1615948264),
('reguler','253',1615948340),
('reguler','254',1615950013),
('reguler','255',1615950653),
('reguler','256',1615951543),
('reguler','257',1615952610),
('reguler','258',1615958949),
('reguler','260',1615959327),
('reguler','261',1615961441),
('reguler','262',1615963414),
('reguler','264',1615983857),
('reguler','265',1615984870),
('reguler','267',1615988239),
('reguler','268',1615991172),
('reguler','269',1615991302),
('reguler','270',1615991584),
('reguler','271',1615992793),
('reguler','272',1616036779),
('reguler','273',1616046695),
('reguler','274',1616047385),
('reguler','275',1616054700),
('reguler','276',1616060700),
('reguler','277',1616061153),
('reguler','278',1616070353),
('reguler','280',1616078839),
('reguler','281',1616083263),
('reguler','282',1616120420),
('reguler','283',1616121832),
('reguler','284',1616130276),
('reguler','285',1616130644),
('reguler','286',1616131376),
('reguler','287',1616132173),
('reguler','288',1616133523),
('reguler','289',1616152904),
('reguler','291',1616157447),
('reguler','292',1616158712),
('reguler','293',1616158783),
('reguler','294',1616158849),
('reguler','296',1616162524),
('reguler','297',1616170276),
('reguler','298',1616200433),
('reguler','299',1616200580),
('reguler','300',1616201122),
('reguler','301',1616203198),
('reguler','302',1616205393),
('reguler','303',1616205992),
('reguler','304',1616207378),
('reguler','305',1616209433),
('reguler','306',1616210094),
('reguler','307',1616221946),
('reguler','309',1616224984),
('reguler','310',1616225641),
('reguler','311',1616226249),
('reguler','312',1616241566),
('reguler','313',1616247741),
('reguler','314',1616252172),
('reguler','315',1616263253),
('reguler','316',1616295280),
('reguler','317',1616296614),
('reguler','318',1616310407),
('reguler','319',1616320414),
('reguler','320',1616331456),
('reguler','321',1616333943),
('reguler','323',1616349448),
('reguler','324',1616349524),
('reguler','325',1616369682),
('reguler','326',1616381113),
('reguler','327',1616384154),
('reguler','328',1616384213),
('reguler','329',1616392048),
('reguler','33',1615163356),
('reguler','330',1616394940),
('reguler','331',1616730273),
('reguler','333',1617595237),
('reguler','334',1617596130),
('reguler','335',1617596158),
('reguler','336',1623118151),
('reguler','337',1643216605),
('reguler','338',1643476242),
('reguler','34',1615164328),
('reguler','35',1615165710),
('reguler','36',1615167219),
('reguler','37',1615168070),
('reguler','38',1615168910),
('reguler','39',1615169075),
('reguler','40',1615169528),
('reguler','41',1615169908),
('reguler','42',1615170298),
('reguler','43',1615170384),
('reguler','44',1615170734),
('reguler','45',1615170851),
('reguler','46',1615171816),
('reguler','47',1615172602),
('reguler','48',1615173126),
('reguler','49',1615173997),
('reguler','50',1615174057),
('reguler','51',1615175040),
('reguler','52',1615176127),
('reguler','53',1615177076),
('reguler','54',1615177431),
('reguler','55',1615178095),
('reguler','56',1615178488),
('reguler','57',1615178877),
('reguler','58',1615179131),
('reguler','59',1615179655),
('reguler','60',1615179664),
('reguler','61',1615179990),
('reguler','62',1615180263),
('reguler','63',1615181124),
('reguler','64',1615182264),
('reguler','65',1615183325),
('reguler','66',1615185117),
('reguler','67',1615186210),
('reguler','68',1615187871),
('reguler','69',1615187935),
('reguler','70',1615188318),
('reguler','71',1615188463),
('reguler','72',1615188830),
('reguler','73',1615189168),
('reguler','74',1615191417),
('reguler','75',1615193162),
('reguler','76',1615195719),
('reguler','77',1615196666),
('reguler','78',1615198042),
('reguler','79',1615198195),
('reguler','80',1615198781),
('reguler','81',1615200916),
('reguler','82',1615202315),
('reguler','83',1615202471),
('reguler','84',1615203861),
('reguler','85',1615203934),
('reguler','86',1615204012),
('reguler','87',1615204319),
('reguler','88',1615204420),
('reguler','89',1615205355),
('reguler','90',1615206024),
('reguler','91',1615206029),
('reguler','92',1615206158),
('reguler','93',1615206461),
('reguler','94',1615207264),
('reguler','95',1615207266),
('reguler','96',1615207347),
('reguler','97',1615207508),
('reguler','98',1615207675),
('reguler','99',1615207820);

/*Table structure for table `tx_auth_item` */

DROP TABLE IF EXISTS `tx_auth_item`;

CREATE TABLE `tx_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `tx_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tx_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_item` */

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values 
('admin',1,'Admin',NULL,NULL,1512398979,1546191619),
('create-academic-year',2,'Create Academic Year',NULL,NULL,1546180222,1546180222),
('create-album',2,'Create Album',NULL,NULL,1525157509,1525157509),
('create-applicant',2,'Create Applicant',NULL,NULL,1546180495,1546180495),
('create-archive',2,'Create Archive',NULL,NULL,1525157675,1525157675),
('create-author',2,'Create Author',NULL,NULL,1525157796,1525157796),
('create-blog',2,'Create Blog',NULL,NULL,1525157867,1525157867),
('create-category',2,'Create Category',NULL,NULL,1525157955,1525157955),
('create-citizenship',2,'Create Citizenship',NULL,NULL,1546187097,1546187097),
('create-comment',2,'Create Comment',NULL,NULL,1525158012,1525158012),
('create-content',2,'Create Content',NULL,NULL,1525158072,1525158072),
('create-course',2,'Create Course',NULL,NULL,1546187162,1546187162),
('create-document',2,'Create Document',NULL,NULL,1551191603,1551191603),
('create-educational-stage',2,'Create Educational Stage',NULL,NULL,1546187233,1546187233),
('create-employment',2,'Create Employment',NULL,NULL,1525158127,1525158127),
('create-event',2,'Create Event',NULL,NULL,1525158262,1525158262),
('create-feature',2,'Create Feature',NULL,NULL,1546187309,1546187309),
('create-income',2,'Create Income',NULL,NULL,1546187391,1546187391),
('create-lookup',2,'Create Lookup',NULL,NULL,1525158317,1525158317),
('create-master',2,'Create Master',NULL,NULL,1525157380,1551191887),
('create-measure',2,'Create Measure',NULL,NULL,1546187463,1546187463),
('create-occupation',2,'Create Occupation',NULL,NULL,1546187540,1546187540),
('create-office',2,'Create Office',NULL,NULL,1525158381,1525158381),
('create-page',2,'Create Page',NULL,NULL,1525158462,1525158462),
('create-page-type',2,'Create Page Type',NULL,NULL,1525158549,1525158549),
('create-photo',2,'Create Photo',NULL,NULL,1525158617,1525158617),
('create-pricing',2,'Create Pricing',NULL,NULL,1546187710,1546187710),
('create-product',2,'Create Product',NULL,NULL,1546187013,1546187013),
('create-product-type',2,'Create Product Type',NULL,NULL,1546191477,1546191477),
('create-profile',2,'Create Profile',NULL,NULL,1525158723,1525158723),
('create-quote',2,'Create Quote',NULL,NULL,1525158789,1525158789),
('create-religion',2,'Create Religion',NULL,NULL,1546188986,1546188986),
('create-residence',2,'Create Residence',NULL,NULL,1546189079,1546189079),
('create-semester',2,'Create Semester',NULL,NULL,1551191714,1551191714),
('create-staff',2,'Create Staff',NULL,NULL,1525158861,1525158861),
('create-subscriber',2,'Create Subscriber',NULL,NULL,1525159056,1525159056),
('create-theme',2,'Create Theme',NULL,NULL,1525159126,1525159126),
('create-transaction',2,'Create Transaction',NULL,NULL,1525157439,1525160284),
('create-transportation',2,'Create Transportation',NULL,NULL,1546189149,1546189822),
('delete-academic-year',2,'Delete Academic Year',NULL,NULL,1546180306,1546180306),
('delete-album',2,'Delete Album',NULL,NULL,1525157549,1525157549),
('delete-applicant',2,'Delete Applicant',NULL,NULL,1546180531,1546180531),
('delete-archive',2,'Delete Archive',NULL,NULL,1525157720,1525157720),
('delete-author',2,'Delete Author',NULL,NULL,1525157843,1525157843),
('delete-blog',2,'Delete Blog',NULL,NULL,1525157896,1525157896),
('delete-category',2,'Delete Category',NULL,NULL,1525157992,1525157992),
('delete-citizenship',2,'Delete Citizenship',NULL,NULL,1546187124,1546187124),
('delete-comment',2,'Delete Comment',NULL,NULL,1525158049,1525158049),
('delete-content',2,'Delete Content',NULL,NULL,1525158100,1525158100),
('delete-course',2,'Delete Course',NULL,NULL,1546187189,1546187189),
('delete-document',2,'Delete Document',NULL,NULL,1551191642,1551191642),
('delete-educational-stage',2,'Delete Educational Stage',NULL,NULL,1546187265,1546187265),
('delete-employment',2,'Delete Employment',NULL,NULL,1525158168,1525158168),
('delete-event',2,'Delete Event',NULL,NULL,1525158293,1525158293),
('delete-feature',2,'Delete Feature',NULL,NULL,1546187338,1546187338),
('delete-income',2,'Delete Income',NULL,NULL,1546187425,1546187425),
('delete-lookup',2,'Delete Lookup',NULL,NULL,1525158353,1525158353),
('delete-master',2,'Delete Master',NULL,NULL,1525157409,1551191865),
('delete-measure',2,'Delete Measure',NULL,NULL,1546187502,1546187502),
('delete-occupation',2,'Delete Occupation',NULL,NULL,1546187574,1546187574),
('delete-office',2,'Delete Office',NULL,NULL,1525158430,1525158430),
('delete-page',2,'Delete Page',NULL,NULL,1525158528,1525158528),
('delete-page-type',2,'Delete Page Type',NULL,NULL,1525158589,1525158589),
('delete-photo',2,'Delete Photo',NULL,NULL,1525158698,1525158698),
('delete-pricing',2,'Delete Pricing',NULL,NULL,1546187739,1546187739),
('delete-product',2,'Delete Product',NULL,NULL,1546187051,1546187051),
('delete-product-type',2,'Delete Product Type',NULL,NULL,1546191506,1546191506),
('delete-profile',2,'Delete Profile',NULL,NULL,1525158764,1525158764),
('delete-quote',2,'Delete Quote',NULL,NULL,1525158841,1525158841),
('delete-religion',2,'Delete Religion',NULL,NULL,1546189028,1546189028),
('delete-residence',2,'Delete Residence',NULL,NULL,1546189108,1546189108),
('delete-semester',2,'Delete Semester',NULL,NULL,1551191743,1551191743),
('delete-staff',2,'Delete Staff',NULL,NULL,1525158966,1525158966),
('delete-subscriber',2,'Delete Subscriber',NULL,NULL,1525159103,1525159103),
('delete-theme',2,'Delete Theme',NULL,NULL,1525159181,1525159181),
('delete-transaction',2,'Delete Transaction',NULL,NULL,1525157483,1525160303),
('delete-transportation',2,'Delete Transportation',NULL,NULL,1546189176,1546189733),
('guest',1,'Guest',NULL,NULL,1525156986,1525156986),
('index-academic-year',2,'Index Academic Year',NULL,NULL,1546180280,1546180280),
('index-album',2,'Index Album',NULL,NULL,1525157526,1525157526),
('index-applicant',2,'Index Applicant',NULL,NULL,1546180506,1546180506),
('index-archive',2,'Index Archive',NULL,NULL,1525157695,1525157695),
('index-author',2,'Index Author',NULL,NULL,1525157816,1525157816),
('index-blog',2,'Index Blog',NULL,NULL,1525157881,1525157881),
('index-category',2,'Index Category',NULL,NULL,1525157975,1525157975),
('index-citizenship',2,'Index Citizenship',NULL,NULL,1546187133,1546187133),
('index-comment',2,'Index Comment',NULL,NULL,1525158032,1525158032),
('index-content',2,'Index Content',NULL,NULL,1525158085,1525158085),
('index-course',2,'Index Course',NULL,NULL,1546187197,1546187197),
('index-document',2,'Index Document',NULL,NULL,1551191625,1551191625),
('index-educational-stage',2,'Index Educational Stage',NULL,NULL,1546187277,1546187277),
('index-employment',2,'Index Employment',NULL,NULL,1525158150,1525158150),
('index-event',2,'Index Event',NULL,NULL,1525158276,1525158276),
('index-feature',2,'Index Feature',NULL,NULL,1546187347,1546187347),
('index-income',2,'Index Income',NULL,NULL,1546187436,1546187436),
('index-lookup',2,'Index Lookup',NULL,NULL,1525158333,1525158333),
('index-master',2,'Index Master',NULL,NULL,1525157393,1551191960),
('index-measure',2,'Index Measure',NULL,NULL,1546187510,1546187510),
('index-occupation',2,'Index Occupation',NULL,NULL,1546187585,1546187585),
('index-office',2,'Index Office',NULL,NULL,1525158405,1525158405),
('index-page',2,'Index Page',NULL,NULL,1525158477,1525158477),
('index-page-type',2,'Index Page Type',NULL,NULL,1525158570,1525158570),
('index-photo',2,'Index Photo',NULL,NULL,1525158641,1525158641),
('index-pricing',2,'Index Pricing',NULL,NULL,1546187759,1546187759),
('index-product',2,'Index Product',NULL,NULL,1546187042,1546187042),
('index-product-type',2,'Index Product Type',NULL,NULL,1546191517,1546191517),
('index-profile',2,'Index Profile',NULL,NULL,1525158743,1525158743),
('index-quote',2,'Index Quote',NULL,NULL,1525158812,1525158812),
('index-religion',2,'Index Religion',NULL,NULL,1546189050,1546189050),
('index-residence',2,'Index Residence',NULL,NULL,1546189117,1546189117),
('index-semester',2,'Index Semester',NULL,NULL,1551191723,1551191723),
('index-staff',2,'Index Staff',NULL,NULL,1525158877,1525158877),
('index-subscriber',2,'Index Subscriber',NULL,NULL,1525159080,1525159080),
('index-theme',2,'Index Theme',NULL,NULL,1525159151,1525159151),
('index-transaction',2,'Index Transaction',NULL,NULL,1525157460,1525160347),
('index-transportation',2,'Index Transportation',NULL,NULL,1546189188,1546189827),
('reguler',1,'Reguler',NULL,NULL,1514393890,1546190217),
('update-academic-year',2,'Update Academic Year',NULL,NULL,1546180333,1546180333),
('update-album',2,'Update Album',NULL,NULL,1525157518,1525157518),
('update-applicant',2,'Update Applicant',NULL,NULL,1546180541,1546180541),
('update-archive',2,'Update Archive',NULL,NULL,1525157684,1525157684),
('update-author',2,'Update Author',NULL,NULL,1525157804,1525157804),
('update-blog',2,'Update Blog',NULL,NULL,1525157875,1525157875),
('update-category',2,'Update Category',NULL,NULL,1525157964,1525157964),
('update-citizenship',2,'Update Citizenship',NULL,NULL,1546187107,1546187107),
('update-comment',2,'Update Comment',NULL,NULL,1525158019,1525158019),
('update-content',2,'Update Content',NULL,NULL,1525158079,1525158079),
('update-course',2,'Update Course',NULL,NULL,1546187173,1546187173),
('update-document',2,'Update Document',NULL,NULL,1551191652,1551191652),
('update-educational-stage',2,'Update Educational Stage',NULL,NULL,1546187243,1546187243),
('update-employment',2,'Update Employment',NULL,NULL,1525158139,1525158139),
('update-event',2,'Update Event',NULL,NULL,1525158269,1525158269),
('update-feature',2,'Update Feature',NULL,NULL,1546187317,1546187317),
('update-income',2,'Update Income',NULL,NULL,1546187400,1546187400),
('update-lookup',2,'Update Lookup',NULL,NULL,1525158323,1525158323),
('update-master',2,'Update Master',NULL,NULL,1525157385,1551191976),
('update-measure',2,'Update Mesure',NULL,NULL,1546187481,1546187481),
('update-occupation',2,'Update Occupation',NULL,NULL,1546187552,1546187552),
('update-office',2,'Update Office',NULL,NULL,1525158392,1525158392),
('update-page',2,'Update Page',NULL,NULL,1525158469,1525158469),
('update-page-type',2,'Update Page Type',NULL,NULL,1525158557,1525158557),
('update-photo',2,'Update Photo',NULL,NULL,1525158625,1525158625),
('update-pricing',2,'Update Pricing',NULL,NULL,1546187719,1546187719),
('update-product',2,'Update Product',NULL,NULL,1546187023,1546187023),
('update-product-type',2,'Update Product Type',NULL,NULL,1546191486,1546191486),
('update-profile',2,'Update Profile',NULL,NULL,1525158735,1525158735),
('update-quote',2,'Update Quote',NULL,NULL,1525158802,1525158802),
('update-religion',2,'Update Religion',NULL,NULL,1546188996,1546188996),
('update-residence',2,'Update Residence',NULL,NULL,1546189089,1546189089),
('update-semester',2,'Update Semester',NULL,NULL,1551191776,1551191776),
('update-staff',2,'Update Staff',NULL,NULL,1525158867,1525158867),
('update-subscriber',2,'Update Subscriber',NULL,NULL,1525159068,1525159068),
('update-theme',2,'Update Theme',NULL,NULL,1525159142,1525159142),
('update-transaction',2,'Update Transaction',NULL,NULL,1525157449,1525160372),
('update-transportation',2,'Update Transportation',NULL,NULL,1546189158,1546189829),
('view-academic-year',2,'View Academic Year',NULL,NULL,1546180264,1546180264),
('view-album',2,'View Album',NULL,NULL,1525157535,1525157535),
('view-applicant',2,'View Applicant',NULL,NULL,1546180518,1546180518),
('view-archive',2,'View Archive',NULL,NULL,1525157709,1525157709),
('view-author',2,'View Author',NULL,NULL,1525157824,1525157824),
('view-blog',2,'View Blog',NULL,NULL,1525157889,1525157889),
('view-category',2,'View Category',NULL,NULL,1525157984,1525157984),
('view-citizenship',2,'View Citizenship',NULL,NULL,1546187115,1546187115),
('view-comment',2,'View Comment',NULL,NULL,1525158040,1525158040),
('view-content',2,'View Content',NULL,NULL,1525158092,1525158092),
('view-course',2,'View Course',NULL,NULL,1546187182,1546187182),
('view-document',2,'View Document',NULL,NULL,1551191634,1551191634),
('view-educational-stage',2,'View Educational Stage',NULL,NULL,1546187253,1546187253),
('view-employment',2,'View Employment',NULL,NULL,1525158158,1525158158),
('view-event',2,'View Event',NULL,NULL,1525158284,1525158284),
('view-feature',2,'View Feature',NULL,NULL,1546187329,1546187329),
('view-income',2,'View Income',NULL,NULL,1546187416,1546187416),
('view-lookup',2,'View Lookup',NULL,NULL,1525158343,1525158343),
('view-master',2,'View Master',NULL,NULL,1525157402,1551192249),
('view-measure',2,'View Measure',NULL,NULL,1546187493,1546187493),
('view-occupation',2,'View Occupation',NULL,NULL,1546187563,1546187563),
('view-office',2,'View Office',NULL,NULL,1525158416,1525158416),
('view-page',2,'View Page',NULL,NULL,1525158499,1525158499),
('view-page-type',2,'View Page Type',NULL,NULL,1525158580,1525158580),
('view-photo',2,'View Photo',NULL,NULL,1525158689,1525158689),
('view-pricing',2,'View Pricing',NULL,NULL,1546187728,1546187728),
('view-product',2,'View Product',NULL,NULL,1546187033,1546187033),
('view-product-type',2,'View Product Type',NULL,NULL,1546191494,1546191494),
('view-profile',2,'View Profile',NULL,NULL,1525158752,1525158752),
('view-quote',2,'View Quote',NULL,NULL,1525158823,1525158823),
('view-religion',2,'View Religion',NULL,NULL,1546189021,1546189021),
('view-residence',2,'View Residence',NULL,NULL,1546189099,1546189099),
('view-semester',2,'View Semester',NULL,NULL,1551191733,1551191733),
('view-staff',2,'View Staff',NULL,NULL,1525158885,1525158885),
('view-subscriber',2,'View Subscriber',NULL,NULL,1525159091,1525159091),
('view-theme',2,'View Theme',NULL,NULL,1525159172,1525159172),
('view-transaction',2,'View Transaction',NULL,NULL,1525157471,1525160397),
('view-transportation',2,'View Transportation',NULL,NULL,1546189167,1546189838);

/*Table structure for table `tx_auth_item_child` */

DROP TABLE IF EXISTS `tx_auth_item_child`;

CREATE TABLE `tx_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `tx_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tx_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_item_child` */

insert  into `tx_auth_item_child`(`parent`,`child`) values 
('admin','create-academic-year'),
('admin','create-album'),
('admin','create-applicant'),
('admin','create-archive'),
('admin','create-author'),
('admin','create-blog'),
('admin','create-category'),
('admin','create-citizenship'),
('admin','create-comment'),
('admin','create-content'),
('admin','create-course'),
('admin','create-educational-stage'),
('admin','create-employment'),
('admin','create-event'),
('admin','create-feature'),
('admin','create-income'),
('admin','create-lookup'),
('admin','create-master'),
('admin','create-measure'),
('admin','create-occupation'),
('admin','create-office'),
('admin','create-page'),
('admin','create-page-type'),
('admin','create-photo'),
('admin','create-pricing'),
('admin','create-product'),
('admin','create-product-type'),
('admin','create-profile'),
('admin','create-quote'),
('admin','create-religion'),
('admin','create-residence'),
('admin','create-staff'),
('admin','create-subscriber'),
('admin','create-theme'),
('admin','create-transaction'),
('admin','create-transportation'),
('admin','delete-academic-year'),
('admin','delete-album'),
('admin','delete-applicant'),
('admin','delete-archive'),
('admin','delete-author'),
('admin','delete-blog'),
('admin','delete-category'),
('admin','delete-citizenship'),
('admin','delete-comment'),
('admin','delete-content'),
('admin','delete-course'),
('admin','delete-educational-stage'),
('admin','delete-employment'),
('admin','delete-event'),
('admin','delete-feature'),
('admin','delete-income'),
('admin','delete-lookup'),
('admin','delete-master'),
('admin','delete-measure'),
('admin','delete-occupation'),
('admin','delete-office'),
('admin','delete-page'),
('admin','delete-page-type'),
('admin','delete-photo'),
('admin','delete-pricing'),
('admin','delete-product'),
('admin','delete-product-type'),
('admin','delete-profile'),
('admin','delete-quote'),
('admin','delete-religion'),
('admin','delete-residence'),
('admin','delete-staff'),
('admin','delete-subscriber'),
('admin','delete-theme'),
('admin','delete-transaction'),
('admin','delete-transportation'),
('admin','guest'),
('admin','index-academic-year'),
('admin','index-album'),
('admin','index-applicant'),
('admin','index-archive'),
('admin','index-author'),
('admin','index-blog'),
('admin','index-category'),
('admin','index-citizenship'),
('admin','index-comment'),
('admin','index-content'),
('admin','index-course'),
('admin','index-educational-stage'),
('admin','index-employment'),
('admin','index-event'),
('admin','index-feature'),
('admin','index-income'),
('admin','index-lookup'),
('admin','index-master'),
('admin','index-measure'),
('admin','index-occupation'),
('admin','index-office'),
('admin','index-page'),
('admin','index-page-type'),
('admin','index-photo'),
('admin','index-pricing'),
('admin','index-product'),
('admin','index-product-type'),
('admin','index-profile'),
('admin','index-quote'),
('admin','index-religion'),
('admin','index-residence'),
('admin','index-staff'),
('admin','index-subscriber'),
('admin','index-theme'),
('admin','index-transaction'),
('admin','index-transportation'),
('admin','reguler'),
('admin','update-academic-year'),
('admin','update-album'),
('admin','update-applicant'),
('admin','update-archive'),
('admin','update-author'),
('admin','update-blog'),
('admin','update-category'),
('admin','update-citizenship'),
('admin','update-comment'),
('admin','update-content'),
('admin','update-course'),
('admin','update-educational-stage'),
('admin','update-employment'),
('admin','update-event'),
('admin','update-feature'),
('admin','update-income'),
('admin','update-lookup'),
('admin','update-master'),
('admin','update-measure'),
('admin','update-occupation'),
('admin','update-office'),
('admin','update-page'),
('admin','update-page-type'),
('admin','update-photo'),
('admin','update-pricing'),
('admin','update-product'),
('admin','update-product-type'),
('admin','update-profile'),
('admin','update-quote'),
('admin','update-religion'),
('admin','update-residence'),
('admin','update-staff'),
('admin','update-subscriber'),
('admin','update-theme'),
('admin','update-transaction'),
('admin','update-transportation'),
('admin','view-academic-year'),
('admin','view-album'),
('admin','view-applicant'),
('admin','view-archive'),
('admin','view-author'),
('admin','view-blog'),
('admin','view-category'),
('admin','view-citizenship'),
('admin','view-comment'),
('admin','view-content'),
('admin','view-course'),
('admin','view-educational-stage'),
('admin','view-employment'),
('admin','view-event'),
('admin','view-feature'),
('admin','view-income'),
('admin','view-lookup'),
('admin','view-master'),
('admin','view-measure'),
('admin','view-occupation'),
('admin','view-office'),
('admin','view-page'),
('admin','view-page-type'),
('admin','view-photo'),
('admin','view-pricing'),
('admin','view-product'),
('admin','view-product-type'),
('admin','view-profile'),
('admin','view-quote'),
('admin','view-religion'),
('admin','view-residence'),
('admin','view-staff'),
('admin','view-subscriber'),
('admin','view-theme'),
('admin','view-transaction'),
('admin','view-transportation'),
('create-master','create-academic-year'),
('create-master','create-album'),
('create-master','create-archive'),
('create-master','create-author'),
('create-master','create-category'),
('create-master','create-citizenship'),
('create-master','create-course'),
('create-master','create-document'),
('create-master','create-educational-stage'),
('create-master','create-employment'),
('create-master','create-event'),
('create-master','create-feature'),
('create-master','create-income'),
('create-master','create-measure'),
('create-master','create-occupation'),
('create-master','create-page'),
('create-master','create-page-type'),
('create-master','create-product-type'),
('create-master','create-quote'),
('create-master','create-religion'),
('create-master','create-residence'),
('create-master','create-semester'),
('create-master','create-staff'),
('create-master','create-transportation'),
('create-transaction','create-blog'),
('create-transaction','create-photo'),
('delete-master','delete-academic-year'),
('delete-master','delete-album'),
('delete-master','delete-archive'),
('delete-master','delete-author'),
('delete-master','delete-category'),
('delete-master','delete-citizenship'),
('delete-master','delete-content'),
('delete-master','delete-course'),
('delete-master','delete-document'),
('delete-master','delete-educational-stage'),
('delete-master','delete-employment'),
('delete-master','delete-event'),
('delete-master','delete-feature'),
('delete-master','delete-income'),
('delete-master','delete-measure'),
('delete-master','delete-occupation'),
('delete-master','delete-page'),
('delete-master','delete-page-type'),
('delete-master','delete-product-type'),
('delete-master','delete-quote'),
('delete-master','delete-religion'),
('delete-master','delete-residence'),
('delete-master','delete-semester'),
('delete-master','delete-staff'),
('delete-master','delete-subscriber'),
('delete-master','delete-transportation'),
('delete-transaction','delete-blog'),
('delete-transaction','delete-photo'),
('index-master','index-academic-year'),
('index-master','index-album'),
('index-master','index-archive'),
('index-master','index-author'),
('index-master','index-category'),
('index-master','index-citizenship'),
('index-master','index-content'),
('index-master','index-course'),
('index-master','index-document'),
('index-master','index-educational-stage'),
('index-master','index-employment'),
('index-master','index-event'),
('index-master','index-feature'),
('index-master','index-income'),
('index-master','index-lookup'),
('index-master','index-measure'),
('index-master','index-occupation'),
('index-master','index-page'),
('index-master','index-page-type'),
('index-master','index-photo'),
('index-master','index-product-type'),
('index-master','index-quote'),
('index-master','index-religion'),
('index-master','index-residence'),
('index-master','index-semester'),
('index-master','index-staff'),
('index-master','index-subscriber'),
('index-master','index-theme'),
('index-master','index-transportation'),
('index-transaction','index-blog'),
('index-transaction','index-photo'),
('reguler','create-applicant'),
('reguler','delete-applicant'),
('reguler','index-applicant'),
('reguler','update-applicant'),
('reguler','view-applicant'),
('update-master','update-academic-year'),
('update-master','update-album'),
('update-master','update-archive'),
('update-master','update-author'),
('update-master','update-category'),
('update-master','update-citizenship'),
('update-master','update-course'),
('update-master','update-document'),
('update-master','update-educational-stage'),
('update-master','update-employment'),
('update-master','update-event'),
('update-master','update-feature'),
('update-master','update-income'),
('update-master','update-measure'),
('update-master','update-occupation'),
('update-master','update-office'),
('update-master','update-page'),
('update-master','update-page-type'),
('update-master','update-product-type'),
('update-master','update-profile'),
('update-master','update-quote'),
('update-master','update-religion'),
('update-master','update-residence'),
('update-master','update-semester'),
('update-master','update-staff'),
('update-master','update-transportation'),
('update-transaction','update-blog'),
('update-transaction','update-photo'),
('view-master','view-academic-year'),
('view-master','view-album'),
('view-master','view-archive'),
('view-master','view-author'),
('view-master','view-category'),
('view-master','view-citizenship'),
('view-master','view-content'),
('view-master','view-course'),
('view-master','view-document'),
('view-master','view-educational-stage'),
('view-master','view-employment'),
('view-master','view-event'),
('view-master','view-feature'),
('view-master','view-income'),
('view-master','view-measure'),
('view-master','view-occupation'),
('view-master','view-office'),
('view-master','view-page'),
('view-master','view-product-type'),
('view-master','view-profile'),
('view-master','view-quote'),
('view-master','view-religion'),
('view-master','view-residence'),
('view-master','view-semester'),
('view-master','view-staff'),
('view-master','view-theme'),
('view-master','view-transportation'),
('view-transaction','view-blog'),
('view-transaction','view-photo');

/*Table structure for table `tx_auth_rule` */

DROP TABLE IF EXISTS `tx_auth_rule`;

CREATE TABLE `tx_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_auth_rule` */

/*Table structure for table `tx_author` */

DROP TABLE IF EXISTS `tx_author`;

CREATE TABLE `tx_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_author_user` (`user_id`),
  CONSTRAINT `FK_tx_author_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tx_author` */

insert  into `tx_author`(`id`,`user_id`,`title`,`phone_number`,`email`,`google_plus`,`instagram`,`facebook`,`twitter`,`file_name`,`address`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,NULL,'Nanta Es','','','','','','','605f0fac6903f.jpeg','','<p>Admin</p>\r\n',1611637710,1616842706,1,1,0,NULL,NULL,3);

/*Table structure for table `tx_blog` */

DROP TABLE IF EXISTS `tx_blog`;

CREATE TABLE `tx_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `cover` varchar(300) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `content` longtext NOT NULL,
  `description` longtext DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `month_period` varchar(6) DEFAULT NULL,
  `publish_status` int(11) NOT NULL,
  `pinned_status` int(11) DEFAULT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `date_issued` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_blog_author` (`author_id`),
  KEY `FK_tx_blog_category` (`category_id`),
  KEY `FK_tx_blog_publish` (`publish_status`),
  KEY `FK_tx_blog_pinned` (`pinned_status`),
  CONSTRAINT `FK_tx_blog_author` FOREIGN KEY (`author_id`) REFERENCES `tx_author` (`id`),
  CONSTRAINT `FK_tx_blog_category` FOREIGN KEY (`category_id`) REFERENCES `tx_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tx_blog` */

insert  into `tx_blog`(`id`,`category_id`,`author_id`,`title`,`cover`,`url`,`content`,`description`,`tags`,`month_period`,`publish_status`,`pinned_status`,`view_counter`,`rating`,`date_issued`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(3,1,1,'PENERIMAAN PESERTA DIDIK BARU 2021-2022','',NULL,'<p><strong>PERSYARATAN UMUM</strong></p>\r\n\r\n<ol>\r\n	<li>Mampu membaca Alquran.</li>\r\n	<li>Memiliki kemampuan dasar berbahasa inggris.</li>\r\n	<li>Sehat jasmani dan rohani serta bebas dari narkoba.</li>\r\n	<li>Sanggup tinggal di asrama selama pendidikan dan bersedia mematuhi peraturan/tata tertib sekolah dan asrama.</li>\r\n	<li>Memiliki nilai raport SMP/MTs untuk mata pelajaran Agama, Bahasa Indonesia, Bahasa Inggris, Matematika dan IPA dari semester 3, 4 dan 5 dengan rata-rata minimal 75.</li>\r\n	<li>Mengisi formulir pendaftaran secara Online.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>WAKTU DAN TEMPAT PENDAFTARAN</strong></p>\r\n\r\n<ol>\r\n	<li>Pendaftaran mulai tanggal 08 &ndash; 22 Maret 2021 dengan mengisi formulir pendaftaran secara Online melalui web resmi : https://psb.smanmba.sch.id.</li>\r\n	<li>Tes Tahap I (Ujian tulis/Akademik) dilaksanakan pada hari Sabtu tanggal 27 Maret 2021 pukul 08.00 s/d selesai di SMA Negeri Modal Bangsa Arun. Peserta tes wajib memakai seragam sekolah asal dan membawa pensil 2B dan papan alas (untuk sistem LJK).</li>\r\n	<li>Pengumuman Tes Tahap I pada Hari Rabu tanggal 31 Maret 2021.</li>\r\n	<li>Tes Tahap II (Wawancara, Baca Alqur&rsquo;an, Bahasa Inggris, kepribadian dan kesehatan) dilaksanakan pada hari Minggu tanggal 04 April 2021.</li>\r\n	<li>Pengumuman Tes Tahap II pada hari Selasa tanggal 06 April 2021.</li>\r\n	<li>Pendaftaran Ulang tanggal 07 s/d 10 April 2021 pukul 08.30 s/d 16.00 WIB (Kecuali Hari Sabtu pukul 08:30 s/d 12:00 ).</li>\r\n	<li>Bila tidak mendaftar ulang sampai dengan batas waktu yang ditentukan, calon siswa tersebut dianggap gugur.</li>\r\n	<li>Informasi pendaftaran dan pengumuman dapat di akses melalui laman www.smanmba.sch.id.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>KELENGKAPAN ADMINISTRASI (DISERAHKAN SAAT DAFTAR ULANG KELULUSAN)</strong></p>\r\n\r\n<ol>\r\n	<li>Mengembalikan formulir pendaftaran dan kartu peserta ujian yang telah di cetak, untuk putra dimasukkan dalam Map Merah dan Putri Map Kuning.</li>\r\n	<li>Asli dan Fotocopi Raport SMP/MTs semester 3, 4 dan 5 sebanyak 1 eks</li>\r\n	<li>Asli dan Fotocopy sertifikat lomba, jika ada</li>\r\n	<li>Pasfoto warna ukuran 3 x 4 cm sebanyak 3 lembar (Latar merah)</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>PENGHARGAAN UNTUK CALON SISWA BERPRESTASI</strong></p>\r\n\r\n<p>SMA Negeri Modal Bangsa Arun memberikan penghargaan kepada calon siswa berprestasi dengan kriteria sbb :</p>\r\n\r\n<p>Bebas tes tahap I (Ujian Tulis/Akademik) untuk :</p>\r\n\r\n<ol>\r\n	<li>Juara 1, 2 dan 3 OSN/KSM, SMP/MTs Tingkat Propinsi/Kab/Kota,</li>\r\n	<li>Juara 1, 2 dan 3 MTQ tingkat Kab/Kota/Propinsi,</li>\r\n	<li>Siswa rangking 1 Kelas IX Semester V,</li>\r\n	<li>Juara 1 Desain Poster FLS2N SMP Tingkat Propinsi/Kab/Kota,</li>\r\n	<li>Juara 1 Gitar Solo FLS2N SMP Tingkat Propinsi/Kab/Kota,</li>\r\n	<li>Juara 1 Nyanyi Solo FLS2N SMP Tingkat Propinsi/Kab/Kota,</li>\r\n	<li>Tahfiz 2 Juz,</li>\r\n	<li>Juara 1 Karya tulis ilmiah dari lembaga kementerian.</li>\r\n	<li>Discount Sumbangan Dana Komite Sekolah untuk :</li>\r\n	<li>Peserta OSN/KSM, SMP/MTs Tingkat Nasional sebesar 100%</li>\r\n	<li>Juara 1 OSN/KSM SMP/MTs Tingkat Kab/Kota sebesar 25%</li>\r\n</ol>\r\n','PENERIMAAN PESERTA DIDIK BARU (PPDB) 2021-2022','ppdb','022021',2,1,583,NULL,1614315600,1614339495,1643092109,1,NULL,0,NULL,NULL,594),
(4,1,1,'Petunjuk Daftar','',NULL,'<p><strong>Tahap 1</strong></p>\r\n\r\n<ol>\r\n	<li>Buat akun pada tautan berikut : <a href=\"https://psb.smanmba.sch.id/user/registration/register\">Register</a></li>\r\n	<li>Setelah akun dibuat, sistem secara otomatis mengirim link ke alamat email yang didaftarkan</li>\r\n	<li>Buka email pribadi anda, dan periksa pesan masuk dari PSB SMAN Modal Bangsa Arun.</li>\r\n	<li>Klik link aktivasi yang terdapat di dalam isi pesan.</li>\r\n	<li>Jika proses ini berhasil maka akun sudah aktif dan bisa mengisi data pendaftaran.</li>\r\n	<li>Jika tidak menemukan pesan aktivasi di dalam email, silakan hubungi web admin untuk dibantu.</li>\r\n</ol>\r\n\r\n<p><img alt=\"\" class=\"img-fluid img-responsive\" src=\"/admin/uploads/blog/ietNovCTsQ7CxEmo.png\" style=\"height:424px; width:600px\" /></p>\r\n\r\n<p><strong>Tahap 2</strong></p>\r\n\r\n<ol>\r\n	<li>Siapkan dokumen seperti kartu keluarga, akte kelahiran, dan raport sekolah.</li>\r\n	<li>Lakukan proses login pada tautan berikut : <a href=\"https://psb.smanmba.sch.id/user/security/login\">Login</a>.</li>\r\n	<li>Setelah masuk ke halaman pengisian data, di sebelah kiri terdapat menu foto. Silahkan unggah foto dengan seragam sekolah, ukuran 4x3.</li>\r\n	<li>Lengkapi semua isian data, mulai dari biodata, asal sekolah, data orang tua, dan data nilai.</li>\r\n	<li>Lakukan finalisasi setelah indikator sempurna (100%). Data yang sudah difinalisasi tidak bisa diedit.</li>\r\n	<li>Cetak dokumen formulir dan kartu ujian. Kartu ujian harap dibawa saat ujian tes tahap 1 dan 2.</li>\r\n	<li>Satukan dokumen dalam satu map, warna merah untuk putra, dan warna kuning untuk putri.</li>\r\n	<li>Kumpulkan kepada panitia sesuai jadwal yang telah ditentukan.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Web Admin</strong></p>\r\n\r\n<p><strong>Syahrul Hamdi, S.Pd (085 358 836836) - Nanta Es (081 804 292926)</strong></p>\r\n','Petunjuk daftar Penerimaan Siswa Baru SMAN Modal Bangsa Arun','ppdb','022021',2,2,719,NULL,1614315600,1614353209,1643128793,1,NULL,0,NULL,NULL,732),
(6,1,1,'Pengumuman Ujian Tes Tulis Tahap I','',NULL,'<p style=\"text-align:center\"><strong>Nomor : 139/C.1.5/007/III/2021</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>Panitia Penerimaan Peserta Didik baru</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>SMA Negeri Modal Bangsa Arun</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>Tahun Pelajaran 2021/2022</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol style=\"list-style-type:upper-alpha\">\r\n	<li>Bagi setiap peserta ujian dan keluarga yang mengantar wajib mengindahkan dan menerapkan protokol kesehatan sesuai ketentuan yang berlaku.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol start=\"2\" style=\"list-style-type:upper-alpha\">\r\n	<li>Bagi peserta ujian diharapkan sudah hadir di sekolah pada :</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:40px\">Hari : Sabtu, 27 Maret 2021</p>\r\n\r\n<p style=\"margin-left:40px\">Waktu : 08.00 &ndash; Selesai</p>\r\n\r\n<p style=\"margin-left:40px\">Tempat : SMAN Modal Bangsa Arun</p>\r\n\r\n<p style=\"margin-left:80px\">dengan kententuan :</p>\r\n\r\n<ol style=\"margin-left:80px\">\r\n	<li>Memakai baju seragam sekolah asal.</li>\r\n	<li>Membawa perlengkapan alat tulis seperti pensil 2B, penghapus, dan papan alas.</li>\r\n	<li>Membawa kartu ujian.</li>\r\n	<li><strong>Sudah berada di lokasi ujian pada pukul 07.30 WIB</strong>.</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:90.0pt\">&nbsp;</p>\r\n\r\n<ol start=\"3\" style=\"list-style-type:upper-alpha\">\r\n	<li>Kepada orang tua/wali dari seluruh calon siswa baru diundang untuk menghadiri rapat dengan komite sekolah pada hari Sabtu, 27 Maret 2021 pukul 09.30 sampai selesai. Bertempat di auditorium SMAN Modal Bangsa Arun. <strong>Demi alasan kesehatan, setiap calon siswa baru hanya diwakili oleh satu orang tua/wa</strong>li.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol start=\"4\" style=\"list-style-type:upper-alpha\">\r\n	<li>Demikian pengumuman ini dibuat dan jika ada yang kurang jelas silahkan menghubungi narahubung yang tertera di <a href=\"https://psb.smanmba.sch.id/site/index\">beranda</a>.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:10.0cm\">\r\n			<p>Mengetahui,</p>\r\n\r\n			<p>Kepala Sekolah</p>\r\n\r\n			<p><strong>Dr. Muhammad</strong></p>\r\n\r\n			<p><strong>NIP 19670818 199512 1 001</strong></p>\r\n			</td>\r\n			<td style=\"width:184.0pt\">\r\n			<p>Lhokseumawe 25 Maret 2021</p>\r\n\r\n			<p>Ketua Panitia</p>\r\n\r\n			<p><strong>Helmi Dedi Wartana, S. Pd</strong></p>\r\n\r\n			<p><strong>NIP 19810628 200504 1 001</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','Pengumuman Ujian Tes Tulis Tahap I PPDB Tahun Ajaran 2021/2022','ppdb','032021',2,2,845,NULL,1616648400,1616653652,1642918401,1,NULL,0,NULL,NULL,854),
(7,1,1,'Pengumuman Bebas Tes Tulis Tahap I','',NULL,'<p style=\"text-align:center\"><strong>Panitia Penerimaan Peserta Didik baru</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>Nomor : 140/C.1.5/007/III/2021</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>SMA Negeri Modal Bangsa Arun</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>Tahun Pelajaran 2021/2022</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol style=\"list-style-type:upper-alpha\">\r\n	<li>Berdasarkan hasil pemeriksaan berkas yang diunggah saat penerimaan siswa baru yang telah dilaksanakan pada tanggal 08-22 Maret 2021, maka peserta yang dinyatakan &ldquo;Bebas Tes&rdquo; pada SMA Negeri Modal Bangsa Arun adalah sebagai berikut :</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse; border:undefined; width:9.0cm\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100005</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Nayla Nabila Syahel</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100012</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>JAVIERA JAUZANI</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100018</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Dwi Fahrozi</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100025</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Ahmad Aqil Syalikin</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100042</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>M. ISYRAQI AL FATHAN</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100045</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>YUMNA FAIRUZA</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100053</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Rani Tazkia Irawan</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100068</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Raysa Nabila Wafa</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100072</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Yusrina Nurjannah</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100086</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Muhammad Isra Aguza</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100090</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Salwa Thahira</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100109</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Anbar Salsabilla</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100110</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>AFIFAH ZAHRA</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100154</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Zufar Ahmad Maulidy</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100156</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Taris Rizki</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100162</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Muhammad Gibral Al Tariq</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100165</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Naila Mawaddah</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100176</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Putri Nazira</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100177</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Farah Azlina</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100192</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>TRIYA SASKYA UNAYA</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100195</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>INDAH RAISYA</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100207</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Aura Nafisa Thahira</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100225</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Syifaus Syauqina</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100232</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Nailah Rafifah</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100241</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Gery Juan Devista</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100250</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>PUTRI INDAH LESTARI</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100260</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Lova Larasima</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100263</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Rafani Wasi&#39;unnikmah Siregar</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100272</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Firna Zahra Fenedi</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100212</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Silvi Mardhatillah</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"width:99.25pt\">\r\n			<p>MBA2100039</p>\r\n			</td>\r\n			<td style=\"width:155.9pt\">\r\n			<p>Nabila Alya Zahra</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol start=\"2\" style=\"list-style-type:upper-alpha\">\r\n	<li>Bagi peserta yang mengunggah sertifikat dan dinyatakan tidak lulus bebas tes dapat melakukan sanggahan dengan menghubungi nomor 0852600455 a.n. Emi Hasnita, ST. Mohon lengkapi bukti foto kartu ujian dan sertifikat yang diunggah. Sanggahan diterima paling lambat 26 Maret 2021 pukul 13.00 wib.</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:21.3pt\">&nbsp;</p>\r\n\r\n<ol start=\"3\" style=\"list-style-type:upper-alpha\">\r\n	<li>Peserta yang dinyatakan bebas tes pada poin A, diharapkan mengikuti tes tahap II/tes wawancara dengan membawa kartu ujian dan bukti sertifikat pada:</li>\r\n</ol>\r\n\r\n<p style=\"margin-left:36.0pt\">Hari &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : Minggu, 04 April 2021</p>\r\n\r\n<p style=\"margin-left:36.0pt\">Waktu &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 08.00-16.00</p>\r\n\r\n<p style=\"margin-left:36.0pt\">Tempat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : SMAN Modal Bangsa Arun</p>\r\n\r\n<p style=\"margin-left:36.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Jalan Bontang Kompleks Perumahan PT PAG Batuphat, Lhokseumawe</p>\r\n\r\n<ol start=\"4\" style=\"list-style-type:upper-alpha\">\r\n	<li>Kepada orang tua/wali dari seluruh calon siswa baru diundang untuk menghadiri rapat dengan komite sekolah pada hari Sabtu, 27 Maret 2021 pukul 09.30 sampai selesai. Bertempat di auditorium SMAN Modal Bangsa Arun. Demi alasan kesehatan, setiap calon siswa baru hanya diwakili oleh satu orang tua/wali.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol start=\"5\" style=\"list-style-type:upper-alpha\">\r\n	<li>Demikian pengumuman ini dibuat dan jika ada yang kurang jelas silahkan menghubungi narahubung yang tertera di <a href=\"https://psb.smanmba.sch.id/site/index\">beranda</a>.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"MsoTableGrid\" style=\"border-collapse:collapse; border:undefined\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width:10.0cm\">\r\n			<p>Mengetahui,</p>\r\n\r\n			<p>Kepala Sekolah</p>\r\n\r\n			<p><strong>Dr. Muhammad</strong></p>\r\n\r\n			<p><strong>NIP 19670818 199512 1 001</strong></p>\r\n			</td>\r\n			<td style=\"width:184.0pt\">\r\n			<p>Lhokseumawe 25 Maret 2021</p>\r\n\r\n			<p>Ketua Panitia</p>\r\n\r\n			<p><strong>Helmi Dedi Wartana, S. Pd</strong></p>\r\n\r\n			<p><strong>NIP 19810628 200504 1 001</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','Pengumuman Bebas Tes Tulis Tahap I PPDB Tahun Pelajaran 2021/2022','ppdb','032021',2,2,769,NULL,1616648400,1616653928,1642980457,1,NULL,0,NULL,NULL,776),
(8,1,1,'Pengumuman Kelulusan PPDB TA 2021-2022 Tahap 1','',NULL,'<p><img alt=\"\" src=\"/admin/uploads/blog/hTVDAOfgoN4gRnJN.jpg\" /></p>\r\n','Pengumuman Kelulusan PPDB TA 2021-2022 Tahap 1 SMAN Modal Bangsa Arun','ppdb','032021',2,1,594,NULL,1617166800,1617181741,1643062387,1,NULL,0,NULL,NULL,600),
(9,1,1,'Pengumuman Kelulusan PPDB TA 2021-2022 Tahap 2','',NULL,'<p><img alt=\"\" src=\"/admin/uploads/blog/oRJBwk_LfeuD5KSJ.jpg\" style=\"height:1822px; width:1199px\" /></p>\r\n','Pengumuman Kelulusan PPDB TA 2021-2022 Tahap 2','ppdb','042021',2,1,503,NULL,1617685200,1617698492,1643350888,1,1,0,NULL,NULL,507);

/*Table structure for table `tx_category` */

DROP TABLE IF EXISTS `tx_category`;

CREATE TABLE `tx_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `label` varchar(20) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `time_line` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_UNIQUE` (`title`),
  KEY `FK_tx_category_time_line` (`time_line`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tx_category` */

insert  into `tx_category`(`id`,`title`,`label`,`sequence`,`description`,`time_line`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,'Informasi','',1,'-',2,1527784489,1611640816,1,1,0,NULL,NULL,11);

/*Table structure for table `tx_counter` */

DROP TABLE IF EXISTS `tx_counter`;

CREATE TABLE `tx_counter` (
  `id` varchar(8) NOT NULL,
  `counter` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_counter` */

insert  into `tx_counter`(`id`,`counter`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
('MBA21',283,1615163357,1623118152,NULL,NULL,0,NULL,NULL,282),
('MBA22',2,1643216605,1643476242,NULL,NULL,0,NULL,NULL,1),
('SNA21',22,1612195184,1614700443,NULL,NULL,0,NULL,NULL,21);

/*Table structure for table `tx_course` */

DROP TABLE IF EXISTS `tx_course`;

CREATE TABLE `tx_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tx_course` */

insert  into `tx_course`(`id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Pendidikan Agama',1,'',1546140159,1546140159,1,1,0),
(2,'Bahasa Indonesia',2,'',1546140247,1546140247,1,1,0),
(3,'Bahasa Inggris',3,'',1546140260,1546140260,1,1,0),
(4,'Matematika',4,'',1546140276,1546140276,1,1,0),
(5,'IPA',5,'Mapel SMP, untuk penerimaan siswa di SMA',1546140302,1546140302,1,1,0);

/*Table structure for table `tx_customer` */

DROP TABLE IF EXISTS `tx_customer`;

CREATE TABLE `tx_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `customer_number` varchar(10) DEFAULT NULL,
  `identity_number` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `gender_status` int(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `date_issued` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_number_UNIQUE` (`customer_number`),
  KEY `FK_tx_customer_area` (`area_id`),
  KEY `FK_tx_customer_village` (`village_id`),
  KEY `FK_tx_customer_gender_lookup` (`gender_status`),
  CONSTRAINT `FK_tx_customer_area` FOREIGN KEY (`area_id`) REFERENCES `tx_area` (`id`),
  CONSTRAINT `FK_tx_customer_village` FOREIGN KEY (`village_id`) REFERENCES `tx_village` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_customer` */

/*Table structure for table `tx_dashblock` */

DROP TABLE IF EXISTS `tx_dashblock`;

CREATE TABLE `tx_dashblock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `actions` text DEFAULT NULL,
  `weight` int(11) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(4) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_dashblock` */

/*Table structure for table `tx_document` */

DROP TABLE IF EXISTS `tx_document`;

CREATE TABLE `tx_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tx_document` */

insert  into `tx_document`(`id`,`title`,`quantity`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Juara 1,2,3 OSN/KSM',1,1,'Tingkat Provinsi/Kab/Kota',1550162526,1615178759,1,1,4),
(2,'Juara 1,2,3 MTQ',1,2,'Tingkat Provinsi/Kab/Kota',1550163607,1615178747,1,1,3),
(3,'Rangking 1 Kelas IX Semester V',1,3,'',1615115196,1615178810,1,1,4),
(4,'Juara 1 FLS2N',1,4,'',1615115216,1615178895,1,1,5),
(5,'Tahfiz 2 Jus',1,5,'',1615115512,1615179049,1,1,3),
(6,'Olimpiade Penelitian Siswa Indonesia',1,0,'Tingkat Provinsi/Kab/Kota	',1615115944,1615179146,1,1,7);

/*Table structure for table `tx_educational_stage` */

DROP TABLE IF EXISTS `tx_educational_stage`;

CREATE TABLE `tx_educational_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `tx_educational_stage` */

insert  into `tx_educational_stage`(`id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Tidak Sekolah',1,'',1551288428,1551288428,1,1,0),
(2,'Putus SD',2,'',1551288440,1551288440,1,1,0),
(3,'SD Sederajat',3,'',1551288452,1551288452,1,1,0),
(4,'SMP Sederajat',4,'',1551288468,1551288468,1,1,0),
(5,'SMA Sederajat',5,'',1551288479,1551288479,1,1,0),
(6,'D1',6,'',1551288489,1551288596,1,1,1),
(7,'D2',7,'',1551288505,1551288598,1,1,1),
(8,'D3',8,'',1551288514,1551288601,1,1,1),
(9,'D4',9,'',1551288529,1551288605,1,1,1),
(10,'S1',10,'',1551288547,1551288612,1,1,1),
(11,'S2',11,'',1551288560,1551288614,1,1,1),
(12,'S3',12,'',1551288565,1551288618,1,1,1);

/*Table structure for table `tx_employment` */

DROP TABLE IF EXISTS `tx_employment`;

CREATE TABLE `tx_employment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sequence` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_title_name_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tx_employment` */

insert  into `tx_employment`(`id`,`title`,`description`,`sequence`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(2,'Administrasi','-',NULL,1441114705,1441114705,1,NULL,NULL,NULL,NULL,0),
(3,'Guru','-',NULL,1441114738,1441114738,1,NULL,NULL,NULL,NULL,0),
(4,'Siswa','-',NULL,1441638718,1441638718,1,NULL,NULL,NULL,NULL,0);

/*Table structure for table `tx_event` */

DROP TABLE IF EXISTS `tx_event`;

CREATE TABLE `tx_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `date_start` int(11) DEFAULT NULL,
  `date_end` int(11) DEFAULT NULL,
  `location` tinytext DEFAULT NULL,
  `content` text DEFAULT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_open_registration` tinyint(1) DEFAULT NULL,
  `is_using_comingsoon` tinyint(4) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_event` */

/*Table structure for table `tx_feature` */

DROP TABLE IF EXISTS `tx_feature`;

CREATE TABLE `tx_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_product_feature_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tx_feature` */

insert  into `tx_feature`(`id`,`title`,`icon`,`label`,`content`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,'Free customisation','<i class=\"fa fa-gift\"></i>','','','At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium',1542433717,1544972074,1,1,NULL,NULL,NULL,3),
(2,'24 hour support','<i class=\"fa fa-inbox\"></i>','','','Umum',1542897527,1544972115,1,1,NULL,NULL,NULL,1),
(3,'10 GB Disckspace','<i class=\"fa fa-globe\"></i>',NULL,NULL,'Umum',1544972511,1544972511,1,1,NULL,NULL,NULL,0),
(4,'Cloud Storage','<i class=\"fa fa-cloud-upload\"></i>',NULL,NULL,'-',1544972537,1544972537,1,1,NULL,NULL,NULL,0),
(5,'Online Protection','<i class=\"fa fa-umbrella\"></i>',NULL,NULL,'-',1544972560,1544972560,1,1,NULL,NULL,NULL,0);

/*Table structure for table `tx_import_attribute` */

DROP TABLE IF EXISTS `tx_import_attribute`;

CREATE TABLE `tx_import_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_data_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT 'column title',
  `column_index` int(11) DEFAULT NULL,
  `conversion` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_import_attribute_import` (`import_data_id`),
  CONSTRAINT `FK_tx_import_attribute_import` FOREIGN KEY (`import_data_id`) REFERENCES `tx_import_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `tx_import_attribute` */

insert  into `tx_import_attribute`(`id`,`import_data_id`,`title`,`column_index`,`conversion`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,1,'id',0,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(2,1,'category_id',2,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(3,1,'author_id',1,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(4,1,'title',3,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(5,1,'cover',4,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(6,1,'url',5,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(7,1,'content',6,14,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(8,1,'description',7,14,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(9,1,'tags',8,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(10,1,'publish_status',9,4,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(11,1,'pinned_status',11,4,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(12,1,'view_counter',12,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(13,1,'rating',13,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(14,1,'date_issued',14,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(15,1,'created_at',14,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(16,1,'updated_at',15,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(17,1,'created_by',16,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7),
(18,1,'updated_by',17,1,'',1523769614,1528653903,1,1,NULL,NULL,NULL,7);

/*Table structure for table `tx_import_data` */

DROP TABLE IF EXISTS `tx_import_data`;

CREATE TABLE `tx_import_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modul_type` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `row_start` int(11) DEFAULT NULL,
  `row_end` int(11) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tx_import_data` */

insert  into `tx_import_data`(`id`,`modul_type`,`title`,`row_start`,`row_end`,`file_name`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,17,'blog.xlsx',1,100,'SCcCrBw2APTWedwO6VJNZO4Hv8HXXTUf.xlsx','-',1523769614,1528654029,1,1,NULL,NULL,NULL,21);

/*Table structure for table `tx_income` */

DROP TABLE IF EXISTS `tx_income`;

CREATE TABLE `tx_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tx_income` */

insert  into `tx_income`(`id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Kurang dari Rp. 500,000',1,'',1551288972,1551288972,1,1,0),
(2,'Rp. 500,000 - Rp. 999.999',2,'',1551289023,1551289023,1,1,0),
(3,'Rp. 1.000.000 - Rp. 1.999.999',3,'',1551289058,1551289058,1,1,0),
(4,'Rp. 2.000.000 - 4.999.999',4,'',1551289087,1551289087,1,1,0),
(5,'Rp. 5.000.000 - Rp. 20.000.000',5,'',1551289120,1551289120,1,1,0),
(6,'Lebih dari Rp. 20.000.000',6,'',1551289151,1551289151,1,1,0);

/*Table structure for table `tx_lookup` */

DROP TABLE IF EXISTS `tx_lookup`;

CREATE TABLE `tx_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `editable` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_lookup` */

insert  into `tx_lookup`(`id`,`title`,`token`,`category`,`sequence`,`editable`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,'NA','XNA','NA',0,0,'Not Available',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(2,'No','XNO','YesNo',0,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(3,'Yes','YES','YesNo',1,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(4,'Private','PRI','PrivatePublic',0,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(5,'Public','PBC','PrivatePublic',1,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(6,'Draft','DRF','DraftPublish',0,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(7,'Publish','PBH','DraftPublish',1,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(8,'Approved','APR','Approval',0,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(9,'Rejected','REJ','Approval',1,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(10,'Pending','PEN','Approval',2,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(11,'Male','MLE','Gender',0,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(12,'Female','FML','Gender',1,0,'-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
(13,'Blog','BLG','CommentCategory',0,0,'-',1513358918,1513358918,1,1,NULL,NULL,NULL,0),
(14,'Picture','PCT','CommentCategory',1,0,'-',1513359156,1513359156,1,1,NULL,NULL,NULL,0),
(15,'Kandung','CBL','ChildStatus',0,0,'Biological Children',1546698954,1546698954,1,1,NULL,NULL,NULL,0),
(16,'Anak Tiri','STE','ChildStatus',1,0,'-',1546699109,1546699109,1,1,NULL,NULL,NULL,0),
(17,'Anak Angkat','ADP','ChildStatus',2,0,'-',1546699143,1546699143,1,1,NULL,NULL,NULL,0),
(18,'Darah A','BTA','BloodType',0,0,'',1546699178,1546700958,1,1,NULL,NULL,NULL,1),
(19,'Darah B','BTB','BloodType',1,0,'',1546699201,1546699201,1,1,NULL,NULL,NULL,0),
(20,'Darah AB','BTX','BloodType',3,0,'-',1546700989,1546700989,1,1,NULL,NULL,NULL,0),
(21,'Darah O','BTO','BloodType',3,0,'',1546701060,1546701060,1,1,NULL,NULL,NULL,0),
(22,'Ayah','TPF','TuitionPayer',0,0,'',1546704275,1546704275,1,1,NULL,NULL,NULL,0),
(23,'Ibu','TPM','TuitionPayer',1,0,'',1546704291,1546704291,1,1,NULL,NULL,NULL,0),
(24,'Wali','TPW','TuitionPayer',2,0,'',1546704307,1546704307,1,1,NULL,NULL,NULL,0),
(25,'Mandiri','TPD','TuitionPayer',3,0,'',1546704325,1546704325,1,1,NULL,NULL,NULL,0),
(26,'Negeri','SNT','SchoolStatus',0,0,'',1546705966,1546705966,1,1,NULL,NULL,NULL,0),
(27,'Swasta','SST','SchoolStatus',1,0,'',1546705976,1546705976,1,1,NULL,NULL,NULL,0),
(28,'Ayah','FFA','FamilyType',0,0,'',1547820999,1547820999,1,1,NULL,NULL,NULL,0),
(29,'Ibu','FMO','FamilyType',1,0,'',1547821018,1547821018,1,1,NULL,NULL,NULL,0),
(30,'Wali','FGU','FamilyType',2,0,'',1547821089,1547821089,1,1,NULL,NULL,NULL,0);

/*Table structure for table `tx_measure` */

DROP TABLE IF EXISTS `tx_measure`;

CREATE TABLE `tx_measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tx_measure` */

insert  into `tx_measure`(`id`,`title`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Per Tahun','-',1541603176,1544973329,1,1,1);

/*Table structure for table `tx_migration` */

DROP TABLE IF EXISTS `tx_migration`;

CREATE TABLE `tx_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_migration` */

insert  into `tx_migration`(`version`,`apply_time`) values 
('Da\\User\\Migration\\m000000_000001_create_user_table',1507740966),
('Da\\User\\Migration\\m000000_000002_create_profile_table',1507740968),
('Da\\User\\Migration\\m000000_000003_create_social_account_table',1507740970),
('Da\\User\\Migration\\m000000_000004_create_token_table',1507740972),
('Da\\User\\Migration\\m000000_000005_add_last_login_at',1507740973),
('Da\\User\\Migration\\m000000_000006_add_two_factor_fields',1514392155),
('m140506_102106_rbac_init',1507741269),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1514392156);

/*Table structure for table `tx_note` */

DROP TABLE IF EXISTS `tx_note`;

CREATE TABLE `tx_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_type_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date_issued` int(11) DEFAULT NULL,
  `date_due` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_note_note_type` (`note_type_id`),
  KEY `FK_tx_note_staff` (`staff_id`),
  CONSTRAINT `FK_tx_note_staff` FOREIGN KEY (`staff_id`) REFERENCES `tx_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_note` */

/*Table structure for table `tx_note_type` */

DROP TABLE IF EXISTS `tx_note_type`;

CREATE TABLE `tx_note_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_note_type` */

/*Table structure for table `tx_notification` */

DROP TABLE IF EXISTS `tx_notification`;

CREATE TABLE `tx_notification` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `notification_type` int(11) DEFAULT NULL,
  `reference` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notify_from` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `approval_status` int(11) DEFAULT NULL,
  `read_status` tinyint(4) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_notification_given_by` (`notify_from`),
  KEY `FK_tx_notification_lookup` (`notification_type`),
  KEY `FK_tx_notification_given_to` (`user_id`),
  KEY `FK_tx_notification_approval` (`approval_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_notification` */

/*Table structure for table `tx_occupation` */

DROP TABLE IF EXISTS `tx_occupation`;

CREATE TABLE `tx_occupation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `tx_occupation` */

insert  into `tx_occupation`(`id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Tidak Bekerja',1,'',1551288660,1551288660,1,1,0),
(2,'Nelayan',2,'',1551288665,1551288665,1,1,0),
(3,'Petani',3,'',1551288694,1551288694,1,1,0),
(4,'Peternak',4,'',1551288700,1551288700,1,1,0),
(5,'PNS/TNI/Polri',5,'',1551288711,1551288711,1,1,0),
(6,'Karyawan Swasta',6,'',1551288730,1551288730,1,1,0),
(7,'Pedagang Kecil',7,'',1551288747,1551288747,1,1,0),
(8,'Pedagang Besar',8,'',1551288756,1551288756,1,1,0),
(9,'Wiraswasta',9,'',1551288865,1551288865,1,1,0),
(10,'Wirausaha',10,'',1551288871,1551288871,1,1,0),
(11,'Buruh',11,'',1551288877,1551288877,1,1,0),
(12,'Pensiunan',12,'',1551288894,1551288894,1,1,0),
(13,'Lain-lain',13,'',1551288901,1551288901,1,1,0),
(14,'Meninggal Dunia',2,'',1581094008,1581094008,1,1,0);

/*Table structure for table `tx_office` */

DROP TABLE IF EXISTS `tx_office`;

CREATE TABLE `tx_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(5) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `fax_number` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tx_office` */

insert  into `tx_office`(`id`,`token`,`title`,`phone_number`,`fax_number`,`email`,`web`,`address`,`latitude`,`longitude`,`facebook`,`google_plus`,`instagram`,`twitter`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,'007','SMAN Modal Bangsa Arun','0645 65 3247,3248,3249','0645 65 3342 ','tu@smanmba.sch.id','https://smanmba.sch.id','Jl Bontang Komplek Perumahan PT. Perta Arun Gas','5.210698','97.056603','','','','','SMA Negeri Modal Bangsa Arun merupakan salah satu Sekolah Unggul di Provinsi Aceh dengan status Sekolah Negeri. Berakreditasi “A” dan selalu siap mengabdi untuk Nusa dan Bangsa, berkarya membangun Negara Indonesia dengan segenap jiwa dan raga.',1430536627,1613842968,1,1,0,NULL,NULL,4);

/*Table structure for table `tx_page` */

DROP TABLE IF EXISTS `tx_page`;

CREATE TABLE `tx_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `content` text DEFAULT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_page_page_type` (`page_type_id`),
  CONSTRAINT `FK_tx_page_page_type` FOREIGN KEY (`page_type_id`) REFERENCES `tx_page_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tx_page` */

insert  into `tx_page`(`id`,`page_type_id`,`title`,`sequence`,`description`,`content`,`view_counter`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,1,'Pramuka',0,'-','<p><strong>Materi Pramuka</strong>&nbsp;kali ini sangat sederhana sekali, karena sahabat-sahabat pramuka di seluruh Nusantara pasti secara umum telah mengetahuinya, sehingga postingan kali ini hanya berfungsi sebagai feedback (umpan balik) dari ilmu-ilmu pramuka yang telah diketahui, khusus para pembina mungkin saja dapat memberikan masukkan sebagai penambahan relevansi yang lebih baik.</p>\r\n\r\n<p>Berikut Beberapa Kegiatan Pramuka yang ada berdasarkan golongan keanggotaan.</p>\r\n\r\n<p><img alt=\"\" src=\"/application/yii2-escyber13/backend/web/uploads/page/sBtOJi5RBka4Q40J.jpg\" style=\"height:265px; width:420px\" /></p>\r\n',40,1515915714,1572536205,1,NULL,NULL,NULL,NULL,41);

/*Table structure for table `tx_page_type` */

DROP TABLE IF EXISTS `tx_page_type`;

CREATE TABLE `tx_page_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tx_page_type` */

insert  into `tx_page_type`(`id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,'Umum',0,'-',1515915159,1515915159,1,1,NULL,NULL,NULL,0);

/*Table structure for table `tx_photo` */

DROP TABLE IF EXISTS `tx_photo`;

CREATE TABLE `tx_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `thumb` varchar(500) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `mime_type` varchar(20) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_photo_album` (`album_id`),
  CONSTRAINT `FK_tx_photo_album` FOREIGN KEY (`album_id`) REFERENCES `tx_album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_photo` */

/*Table structure for table `tx_pricing` */

DROP TABLE IF EXISTS `tx_pricing`;

CREATE TABLE `tx_pricing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `quantity` decimal(18,2) DEFAULT NULL,
  `measure_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_pricing_product` (`product_id`),
  KEY `FK_tx_pricing_measure` (`measure_id`),
  CONSTRAINT `FK_tx_pricing_measure` FOREIGN KEY (`measure_id`) REFERENCES `tx_measure` (`id`),
  CONSTRAINT `FK_tx_pricing_product` FOREIGN KEY (`product_id`) REFERENCES `tx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_pricing` */

/*Table structure for table `tx_pricing_detail` */

DROP TABLE IF EXISTS `tx_pricing_detail`;

CREATE TABLE `tx_pricing_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pricing_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `available_status` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_pricing_detail_pricing` (`pricing_id`),
  KEY `FK_tx_pricing_detail_feature` (`feature_id`),
  KEY `FK_tx_pricing_detail_lookup` (`available_status`),
  CONSTRAINT `FK_tx_pricing_detail_feature` FOREIGN KEY (`feature_id`) REFERENCES `tx_feature` (`id`),
  CONSTRAINT `FK_tx_pricing_detail_lookup` FOREIGN KEY (`available_status`) REFERENCES `tx_lookup` (`id`),
  CONSTRAINT `FK_tx_pricing_detail_pricing` FOREIGN KEY (`pricing_id`) REFERENCES `tx_pricing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_pricing_detail` */

/*Table structure for table `tx_product` */

DROP TABLE IF EXISTS `tx_product`;

CREATE TABLE `tx_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `cover` varchar(300) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_product_type` (`product_type_id`),
  CONSTRAINT `FK_tx_product_type` FOREIGN KEY (`product_type_id`) REFERENCES `tx_product_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_product` */

/*Table structure for table `tx_product_feature` */

DROP TABLE IF EXISTS `tx_product_feature`;

CREATE TABLE `tx_product_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_product_feature_feature` (`feature_id`),
  KEY `FK_tx_product_feature_product` (`product_id`),
  CONSTRAINT `FK_tx_product_feature_feature` FOREIGN KEY (`feature_id`) REFERENCES `tx_feature` (`id`),
  CONSTRAINT `FK_tx_product_feature_product` FOREIGN KEY (`product_id`) REFERENCES `tx_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tx_product_feature` */

insert  into `tx_product_feature`(`id`,`product_id`,`feature_id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,NULL,1,'Free customisation',1,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium',1545841156,1545841156,1,1,NULL,NULL,NULL,0),
(2,NULL,2,'24 hour support',2,'Umum',1545841156,1545841156,1,1,NULL,NULL,NULL,0),
(3,NULL,3,'10 GB Disckspace',3,'Umum',1545841156,1545841156,1,1,NULL,NULL,NULL,0),
(4,NULL,4,'Cloud Storage',4,'-',1545841156,1545841156,1,1,NULL,NULL,NULL,0),
(5,NULL,5,'Online Protection',5,'-',1545841156,1545841156,1,1,NULL,NULL,NULL,0),
(6,NULL,1,'Free customisation',1,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium',1545841390,1545841390,1,1,NULL,NULL,NULL,0),
(7,NULL,2,'24 hour support',2,'Umum',1545841390,1545841390,1,1,NULL,NULL,NULL,0),
(8,NULL,3,'10 GB Disckspace',3,'Umum',1545841390,1545841390,1,1,NULL,NULL,NULL,0),
(9,NULL,4,'Cloud Storage',4,'-',1545841390,1545841390,1,1,NULL,NULL,NULL,0),
(10,NULL,5,'Online Protection',5,'-',1545841390,1545841390,1,1,NULL,NULL,NULL,0);

/*Table structure for table `tx_product_image` */

DROP TABLE IF EXISTS `tx_product_image`;

CREATE TABLE `tx_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_product_image_product` (`product_id`),
  CONSTRAINT `FK_tx_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `tx_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_product_image` */

/*Table structure for table `tx_product_type` */

DROP TABLE IF EXISTS `tx_product_type`;

CREATE TABLE `tx_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tx_product_type` */

insert  into `tx_product_type`(`id`,`title`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(3,'Profile','-',1541603308,1542895956,1,1,NULL,NULL,NULL,1),
(4,'Landing Page','',1542895974,1542895974,1,1,NULL,NULL,NULL,0);

/*Table structure for table `tx_profile` */

DROP TABLE IF EXISTS `tx_profile`;

CREATE TABLE `tx_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_profile` */

insert  into `tx_profile`(`user_id`,`name`,`public_email`,`gravatar_email`,`gravatar_id`,`location`,`website`,`timezone`,`bio`,`file_name`) values 
(1,'Nanta Es','ombakrinai@gmail.com','','d41d8cd98f00b204e9800998ecf8427e','Lhokseumawe','https://escyber.com/',NULL,'-','DBv6ptTbTKuTM6QtftkuLlQrikiL-3l9.JPG'),
(338,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `tx_quote` */

DROP TABLE IF EXISTS `tx_quote`;

CREATE TABLE `tx_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_quote` */

/*Table structure for table `tx_ranking` */

DROP TABLE IF EXISTS `tx_ranking`;

CREATE TABLE `tx_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL COMMENT 'minimum post',
  `label` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tx_ranking` */

insert  into `tx_ranking`(`id`,`title`,`sequence`,`minimum`,`label`,`description`,`file_name`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'VIP',1,1,NULL,'Reserved',NULL,1532260395,1532260395,1,1,0);

/*Table structure for table `tx_religion` */

DROP TABLE IF EXISTS `tx_religion`;

CREATE TABLE `tx_religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tx_religion` */

insert  into `tx_religion`(`id`,`title`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Islam','-',1551289232,1551289232,1,1,0),
(2,'Kristen Protestan','-',1551289249,1551289249,1,1,0),
(3,'Kristen Katolik','-',1551289256,1551289256,1,1,0),
(4,'Hindu','-',1551289265,1551289265,1,1,0),
(5,'Budha','-',1551289271,1551289271,1,1,0),
(6,'Konghucu','',1551289305,1551289305,1,1,0),
(7,'Lainnya','',1551289340,1551289340,1,1,0);

/*Table structure for table `tx_residence` */

DROP TABLE IF EXISTS `tx_residence`;

CREATE TABLE `tx_residence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tx_residence` */

insert  into `tx_residence`(`id`,`title`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Bersama Orang Tua','-',1551289378,1551289378,1,1,0),
(2,'Bersama Wali','-',1551289383,1551289383,1,1,0),
(3,'Kos','-',1551289389,1551289389,1,1,0),
(4,'Asrama','-',1551289392,1551289392,1,1,0),
(5,'Panti Asuhan','',1551289410,1551289410,1,1,0),
(6,'Lainnya','',1551289415,1551289415,1,1,0);

/*Table structure for table `tx_semester` */

DROP TABLE IF EXISTS `tx_semester`;

CREATE TABLE `tx_semester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tx_semester` */

insert  into `tx_semester`(`id`,`title`,`sequence`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Semester III',1,'',1548081285,1581006816,1,1,1),
(2,'Semester IV',2,'',1548081380,1581006820,1,1,1),
(3,'Semester V',3,'',1548081392,1581006823,1,1,1);

/*Table structure for table `tx_session` */

DROP TABLE IF EXISTS `tx_session`;

CREATE TABLE `tx_session` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tx_session` */

/*Table structure for table `tx_site_link` */

DROP TABLE IF EXISTS `tx_site_link`;

CREATE TABLE `tx_site_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tx_site_link` */

insert  into `tx_site_link`(`id`,`title`,`url`,`sequence`,`description`,`created_at`,`created_by`,`updated_at`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,'Biola Mop Mop Aceh','https://www.youtube.com/watch?v=vDRmbNXCQnk&t=331s',1,'',1643350610,1,1643350610,1,NULL,NULL,NULL,0);

/*Table structure for table `tx_social_account` */

DROP TABLE IF EXISTS `tx_social_account`;

CREATE TABLE `tx_social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  UNIQUE KEY `idx_social_account_code` (`code`),
  KEY `fk_social_account_user` (`user_id`),
  CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_social_account` */

/*Table structure for table `tx_staff` */

DROP TABLE IF EXISTS `tx_staff`;

CREATE TABLE `tx_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employment_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `initial` varchar(10) NOT NULL,
  `identity_number` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `gender_status` int(11) DEFAULT NULL,
  `active_status` int(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_staff_gender` (`gender_status`),
  KEY `FK_tx_staff_role` (`employment_id`),
  CONSTRAINT `FK_tx_staff_employment` FOREIGN KEY (`employment_id`) REFERENCES `tx_employment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tx_staff` */

insert  into `tx_staff`(`id`,`employment_id`,`title`,`initial`,`identity_number`,`phone_number`,`gender_status`,`active_status`,`address`,`file_name`,`email`,`google_plus`,`instagram`,`facebook`,`twitter`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,3,'Mikel Andrews','','1234567890','081 888 990077',11,NULL,'Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.','N7YtH-CW-N6jM_KfA7MkD0xjdkc-ih75.jpg','mike@andrew.com','http://localhost/application/yii2-escyber13/web','http://localhost/application/yii2-escyber13/web','','','Kepala Sekolah',1511799015,1528212677,1,1,NULL,NULL,NULL,4),
(2,3,'Natasha Kolnikova','','0987654321','081 888 123456',12,NULL,'Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.','Q1_Irm4HnrUfUpTOqBy3fFTVs53PheWC.jpg','natasha@kolnikova','','http://localhost/application/yii2-escyber13/web','http://localhost/application/yii2-escyber13/web','','Guru Bahasa Indonesia',1511799269,1528212684,1,1,NULL,NULL,NULL,1),
(3,2,'Sasha Elli','','1234509876','081 222 44 5673',12,NULL,'Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.\r\n\r\n','scAZiivNNRAX10qPJ2SKlp-j0Mj2cxjm.jpg','sasha@eli','','','http://localhost/application/yii2-escyber13/web','http://localhost/application/yii2-escyber13/web','Staff Tata Usaha\r\n',1511799388,1528212692,1,1,NULL,NULL,NULL,1),
(4,3,'Mariah Syifa Salsabila','','','',12,NULL,'','S4E9kdOToKDBpOEu48WuVy30FAHtEAFu.jpg','','','','','','MBA 16',1528136205,1528212705,1,1,NULL,NULL,NULL,2),
(5,4,'Nadia Alvya Djaelani','','','',12,NULL,'','W_kwgD0egzTWi9p3eUBmQJ1FzjoC5p3p.jpg','','','','','','MBA 16',1528136224,1528212711,1,1,NULL,NULL,NULL,2),
(6,3,'Mariah Syifa Salsabila','','','',12,NULL,'','WJ7oJTzE73ZUPq84gKeY1uVAvXWdrX5-.jpg','','','','','','',1528284554,1528284554,1,1,NULL,NULL,NULL,0),
(7,4,'Nadia Alvya Djaelani','','','',12,NULL,'','J_fLwzZqUx55Bu0pQwI7kC2c4zb9sWej.jpg','','','','','','',1528284575,1528284575,1,1,NULL,NULL,NULL,0),
(8,2,'Nadia Alvya Djaelani','','','',12,NULL,'','gDzMxRbgqp1tIM_k7vMaqq4vS4C32A7k.jpg','','','','','','',1528284593,1528284593,1,1,NULL,NULL,NULL,0),
(9,3,'Nadia Alvya Djaelani','','','',12,NULL,'','0R8GiqO77fW8M9uvVLY-aZQgDQyuFWPb.jpg','','','','','','',1528284611,1528284611,1,1,NULL,NULL,NULL,0),
(10,4,'Nadia Alvya Djaelani','','','',12,NULL,'','A_hdpW-_RlRynqaaVyXBaN_1rQF3T2eP.jpg','','','','','','',1528284633,1528284633,1,1,NULL,NULL,NULL,0);

/*Table structure for table `tx_subscriber` */

DROP TABLE IF EXISTS `tx_subscriber`;

CREATE TABLE `tx_subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `active_status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_subscriber_lookup` (`active_status`),
  CONSTRAINT `FK_tx_subscriber_lookup` FOREIGN KEY (`active_status`) REFERENCES `tx_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_subscriber` */

/*Table structure for table `tx_tag` */

DROP TABLE IF EXISTS `tx_tag`;

CREATE TABLE `tx_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(150) NOT NULL,
  `frequency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tx_tag` */

insert  into `tx_tag`(`id`,`tag_name`,`frequency`) values 
(3,'ppdb',8);

/*Table structure for table `tx_theme` */

DROP TABLE IF EXISTS `tx_theme`;

CREATE TABLE `tx_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tx_theme` */

insert  into `tx_theme`(`id`,`title`,`description`,`verlock`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`) values 
(1,'Global','Dipakai di semua halaman',0,2147483647,2147483647,1,1,NULL,NULL,NULL),
(2,'Lawyer','Unify263 Lawyer One Page',1,2147483647,2147483647,1,0,NULL,NULL,NULL);

/*Table structure for table `tx_theme_detail` */

DROP TABLE IF EXISTS `tx_theme_detail`;

CREATE TABLE `tx_theme_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `token` varchar(5) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `layout_code_UNIQUE` (`token`),
  KEY `FK_tx_content_theme` (`theme_id`),
  CONSTRAINT `FK_tx_theme_detail_theme` FOREIGN KEY (`theme_id`) REFERENCES `tx_theme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `tx_theme_detail` */

insert  into `tx_theme_detail`(`id`,`theme_id`,`title`,`token`,`content`,`file_name`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,`verlock`) values 
(1,1,'Logo 1','001','<p>b3MYTwJeYCkb4IUmLrPkjcePntzALUBi.png</p>\r\n','OD-opEXwJE2WOlFcfEqGOP_CDbNfuTmm.jpg','Logo 1 - Bagian Atas Kiri',2147483647,1613491000,1,1,0,NULL,NULL,3),
(2,1,'Logo 2','002','q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png',NULL,'Logo 2 - Bagian Bawah Kiri',2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(3,1,'Profile','005','/uploads/web/img5985a8c7b0133.jpg',NULL,'0',2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(4,1,'Deskripsi Bawah','006','',NULL,'-',2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(5,1,'Footer Links','007','<ul>\r\n	<li><a href=\"http://www.escyber.com\">www.escyber.com</a></li>\r\n</ul>\r\n',NULL,NULL,1515422835,1515422835,1,1,NULL,NULL,NULL,0),
(6,1,'TERMS','008','CONTENT OF TERM',NULL,'DESCRIPTION OF TERM.',2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(7,1,'ABOUT','009','CONTENT OF ABOUT',NULL,'DESCRIPTION OF ABOUT.',2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(8,1,'SEO Description','011',NULL,NULL,'SEO Description',2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(9,1,'SEO Keyword','012',NULL,NULL,'SEO Keyword',2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(10,1,'Logo Report 1','016','b3MYTwJeYCkb4IUmLrPkjcePntzALUBi.png','wYsHtSPP6i77jbMk05ddv74dCSY07bAm.png','Logo 1 - Bagian Atas Kiri',2147483647,1613982674,1,1,0,NULL,NULL,1),
(11,1,'Logo Report 2','017','q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png','4ATL_2Nwq6oZyPnr8GbFNQHEtVrzskfZ.png','Logo Bagian Kanan Report',2147483647,1613982596,1,1,0,NULL,NULL,2),
(12,1,'Deskripsi Report','018','<p><strong>Jadwal Kegiatan PPDB TP 2021/2022</strong></p>\r\n\r\n<ul>\r\n	<li>Pendaftaran Calon Siswa : 08-22 Maret 2021</li>\r\n	<li>Tes Tahap 1 : Sabtu 27 Maret 2021</li>\r\n	<li>Pengumuman Tes Tahap 1 :&nbsp; Rabu, 31 Maret 2021</li>\r\n	<li>Tes Tahap 2 : Minggu, 04 April 2021</li>\r\n	<li>Pengumuman Tes Tahap 2 : &nbsp;Selasa, 06 April 2021</li>\r\n	<li>Pendaftaran Ulang : 07-10 April 2021, Pukul 08.00-16.00 (Sabtu Pukul 08.30-12.00)</li>\r\n</ul>\r\n\r\n<p><strong>Informasi Tes Akademik</strong></p>\r\n\r\n<ul>\r\n	<li>Hari/Tanggal : 27 Maret 2021</li>\r\n	<li>Pukul : 08.00 &ndash; 10.00 : Matematika &amp; Bahasa Indonesia</li>\r\n	<li>Pukul : 10.30 &ndash; 12.30 : IPA &amp; Bahasa Inggris</li>\r\n	<li>Pukul : 14.00 &ndash; 16.00 : Panggung Apresiasi Siswa</li>\r\n	<li>Lokasi : SMAN Modal Bangsa Arun</li>\r\n</ul>\r\n\r\n<p><strong>Perlengkapan Peserta Tes</strong></p>\r\n\r\n<ul>\r\n	<li>Kartu Peserta PPDB 2021/2022</li>\r\n	<li>Pakaian Seragam Sekolah Asal</li>\r\n	<li>Alat Tulis : Pensil, Karet Penghapus, Rautan, Pulpen</li>\r\n</ul>\r\n',NULL,'DESKRIPSI',2147483647,1614743537,1,1,0,NULL,NULL,1),
(13,1,'Facebook','021','<i class=\"fa fa-facebook\"></i>',NULL,NULL,2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(14,1,'Skype','022','<i class=\"fa fa-skype\"></i>',NULL,NULL,2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(15,1,'Google Plus','023','<i class=\"fa fa-google-plus\"></i>',NULL,NULL,2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(16,1,'Linkedin','024','<i class=\"fa fa-linkedin\"></i>',NULL,NULL,2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(17,1,'Pinterest','025','<i class=\"fa fa-pinterest\"></i>',NULL,NULL,2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(18,1,'Twitter','026','<i class=\"fa fa-twitter\"></i>',NULL,NULL,2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(19,1,'Dribbble','027','<i class=\"fa fa-dribbble\"></i>',NULL,NULL,2147483647,2147483647,1,1,NULL,NULL,NULL,0),
(20,2,'Image Main','201','<p>IMG</p>\r\n','5nNTwZtpm_PSoHuJpytNNs27jvQNq84R.JPG','IMAGE Ukuran 1600x1066',2147483647,1643348983,1,1,0,NULL,NULL,10),
(21,2,'Promo Text 1','202','PPDB 08-22 Maret 2021',NULL,'PROMO 1 - HEADER',2147483647,1614339204,1,1,0,NULL,NULL,4),
(22,2,'Promo Text 2','203','<p>Melaksanakan pendidikan umum yang bersinergi dengan agama.<br />\r\nMembentuk intelektual berintegritas dan mampu<br />\r\nmenghadapi tantangan hidup</p>\r\n',NULL,'PROMO 2 - DESKRIPSI',2147483647,1613840262,1,1,0,NULL,NULL,3),
(23,2,'Visi','204','<p>Terselenggaranya pendidikan yang dapat menghasilkan intelektual muslim yang berkualitas, berintegritas tinggi, serta mampu menghadapi tantangan hidup yang semakin kompleks.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n','ILVTbwHptEV0bN1KzuTGEAlSU_2njrXV.JPG','ABOUT 1 / Image 1200x800',2147483647,1614174225,1,1,0,NULL,NULL,11),
(24,2,'Kurikulum','205','<p>SMAN Modal Bangsa Arun melaksanakan Program Reguler, Program Plus, dan Pengembangan Diri. Semua program dikemas dan diarahkan untuk&nbsp;proses belajar dalam keadaan nyaman.</p>\r\n','yRJWDN0o3NnJjlGFDvrOPJcZ-RjtoCSH.JPG','ABOUT 2 / Image 1200x800',2147483647,1613984222,1,1,0,NULL,NULL,5),
(25,2,'Fasilitas','206','<p>Fasilitas yang tersedia untuk mendukung proses belajar mengajar adalah ruang kelas dan asrama ber-AC, lapangan serbaguna, gedung olahraga, gedung auditorium, laboratorium IPA (Fisika, Kimia, Biologi), laboratorium bahasa, laboratorium komputer, musolla putra dan putri.</p>\r\n\r\n<p>&nbsp;</p>\r\n','MMqado3ii0fX8ktL0UcIMb7gtnteSXQ_.JPG','ABOUT 3 / Image 1200x800',2147483647,1614175821,1,1,0,NULL,NULL,7),
(26,2,'Narahubung','207','<p>Setiap calon siswa harus melengkapi data secara online. Jika terdapat kendala, silahkan menghubungi salah satu dari narahubung yang tertera.</p>\r\n\r\n<p>Sebelum mulai pengisian data, pastikan dokumen seperti Kartu Keluarga, Akte Kelahiran, dan Raport Sekolah tersedia agar pengisian berjalan lancar dan mencapai indikator 100%.</p>\r\n',NULL,'TEAM - Header dan Deskripsi',2147483647,1613984893,1,1,0,NULL,NULL,4),
(27,2,'Helmi Dedi Wartana, S. Pd','208','<p>0813 6052 0101</p>\r\n','Hp1yKn9PQ8xIGUvLszjw9irrl7z8VKY2.jpg','Ketua Panitia',2147483647,1614006870,1,1,0,NULL,NULL,4),
(28,2,'Emi Hasnita, ST','209','<p>0852 6004 5522</p>\r\n','g7tIS7TOzOzEFK6UEMqAckp51fqJahI4.jpg','Sekretaris',2147483647,1614006874,1,1,0,NULL,NULL,4),
(29,2,'Drs. Mahdani Usman','210','<p>0853 7385 3222</p>\r\n','5u0THQeAUoOWX_H-jfDnzbKzeUffy985.jpg','Waka Kesiswaan',2147483647,1614006881,1,1,0,NULL,NULL,4);

/*Table structure for table `tx_token` */

DROP TABLE IF EXISTS `tx_token`;

CREATE TABLE `tx_token` (
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL,
  UNIQUE KEY `idx_token_user_id_code_type` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_token` */

insert  into `tx_token`(`user_id`,`code`,`type`,`created_at`) values 
(1,'XxnfcSJhSl93g2OskP24qV-XBKvNS9bj',0,1507741399),
(338,'r-e22deOD0_eGU-rbPRAdDH3lykEMIgZ',0,1643476242);

/*Table structure for table `tx_transportation` */

DROP TABLE IF EXISTS `tx_transportation`;

CREATE TABLE `tx_transportation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tx_transportation` */

insert  into `tx_transportation`(`id`,`title`,`description`,`created_at`,`updated_at`,`created_by`,`updated_by`,`verlock`) values 
(1,'Jalan Kaki','',1551289447,1551289447,1,1,0),
(2,'Kendaraan Pribadi','',1551289453,1551289453,1,1,0),
(3,'Kendaraan Umum','',1551289458,1551289458,1,1,0),
(4,'Jemputan Sekolah','',1551289469,1551289469,1,1,0),
(5,'Kereta Api','',1551289474,1551289474,1,1,0),
(6,'Ojek','',1551289491,1551289491,1,1,0),
(7,'Andong','',1551289503,1551289503,1,1,0),
(8,'Perahu','',1551289508,1551289508,1,1,0),
(9,'Lainnya','',1551289510,1551289510,1,1,0);

/*Table structure for table `tx_user` */

DROP TABLE IF EXISTS `tx_user`;

CREATE TABLE `tx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `confirmed_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `last_login_at` int(11) DEFAULT NULL,
  `auth_tf_key` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_username` (`username`),
  UNIQUE KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tx_user` */

insert  into `tx_user`(`id`,`username`,`email`,`password_hash`,`auth_key`,`unconfirmed_email`,`registration_ip`,`flags`,`confirmed_at`,`blocked_at`,`updated_at`,`created_at`,`last_login_at`,`auth_tf_key`,`auth_tf_enabled`) values 
(1,'admin','ombakrinai@gmail.com','$2y$12$exl6mG/cWOt.DgoW11kiKuRkPKvQ/iYFNj.6FlwHLNtk3IYq8GmoO','JpJ77Y4v9Ffj8zN5lLGb2WN9-sotAgUx',NULL,'::1',0,1525156961,NULL,1527960555,1507741399,1643476724,NULL,0),
(338,'oke@test.com','oke@test.com','$2y$12$pz4g6P1NGuJ5REc2oIwWWOP13MGcMV23gDZ8XDQ0UpiP6YNV1RhMu','bYWz8eZWiP-TvTawdZm-4qNu2fdRWOG_',NULL,'127.0.0.1',0,1643476260,NULL,1643476242,1643476242,NULL,NULL,0);

/*Table structure for table `tx_village` */

DROP TABLE IF EXISTS `tx_village`;

CREATE TABLE `tx_village` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tx_village_area` (`area_id`),
  CONSTRAINT `FK_tx_village_area` FOREIGN KEY (`area_id`) REFERENCES `tx_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tx_village` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
