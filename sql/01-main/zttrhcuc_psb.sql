-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2021 at 09:19 PM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zttrhcuc_psb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tx_academic_year`
--

CREATE TABLE `tx_academic_year` (
  `id` int(11) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_academic_year`
--

INSERT INTO `tx_academic_year` (`id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, '2019-2020', 1, 'Tahun Ajaran 2019 / 2020', 1551288227, 1551288227, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_album`
--

CREATE TABLE `tx_album` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_applicant`
--

CREATE TABLE `tx_applicant` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `record_number` varchar(15) DEFAULT NULL,
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIK',
  `birth_certificate_number` varchar(100) DEFAULT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_applicant`
--

INSERT INTO `tx_applicant` (`id`, `user_id`, `record_number`, `identity_number`, `birth_certificate_number`, `title`, `nick_name`, `gender_status`, `birth_place`, `date_birth`, `religion_id`, `citizenship_status`, `address_street`, `address_village`, `address_sub_district`, `address_city`, `address_province`, `phone_number`, `email`, `hobby`, `blood_type`, `height`, `weight`, `number_of_sibling`, `number_of_dependent`, `number_of_step_sibling`, `birth_order`, `child_status`, `native_language`, `illness`, `disability`, `file_name`, `final_status`, `date_final`, `approval_status`, `date_approval`, `approved_by`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(15, 21, 'SNA2100013', '1104035806060002', '1104CLI2202200704404', 'Zaphira Viola Fitrasani ', 'Viola', 2, 'Takengon', 1150606800, 1, 1, 'Lembaga', 'Datu Kemili', 'Bebesen', 'Aceh Tengah', 'Aceh', '0822-7513-1147', 'zaphiraviolaa@gmail.com', 'Membaca,menulis,dan Menggambar.', 1, 128, 49, 2, 0, 0, 3, 1, 'Bahasa Indonesia', '0', '0', 'JurqQ4yHe8OM0-sJzgV4M0eAa4ycAZu_.jpg', 2, 1613203923, 1, NULL, NULL, 'Saya ingin pergi ke sekolah ini karena ini adalah sekolah yang bagus dimana hanya sedikit siswa yang bisa lulus ujian masuk, dan juga para lulusannya memiliki prestasi yang bagus dan masuk ke universitas negeri yang hebat. ', 1613195914, 1613203923, NULL, 21, 5),
(16, 22, 'SNA2100014', NULL, NULL, '', '', NULL, '', 18000, NULL, NULL, '', '', '', '', '', NULL, 'nizamullahmuchtar1974@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, 1, NULL, 1, NULL, NULL, NULL, 1613544141, 1613544141, NULL, NULL, 0),
(17, 23, 'SNA2100015', NULL, NULL, '', '', NULL, '', 18000, NULL, NULL, '', '', '', '', '', NULL, 'Raihanrizqi@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, 1, NULL, 1, NULL, NULL, NULL, 1613544992, 1613544992, NULL, NULL, 0),
(18, 24, 'SNA2100016', '1108020712060003', '1226/T/25/2008', 'Raihan Rizqi Robbani', 'Raihan', 1, 'Lhokseumawe', 1165467600, 1, 1, 'Seulawah No. 46. Komp PT PIM', 'Permai', 'Dewantara', 'Aceh Utara', 'Aceh', '08116711252', 'ultraihan@gmail.com', 'Bulutangkis Dan Renang', 4, 165, 58, 4, 6, 0, 3, 1, 'Indonesia', 'Tidak Ada', 'Tidak Ada', 'A9yd9EZClHyutZgE8X_Y_jYKO-SJwbT2.JPG', 1, NULL, 1, NULL, NULL, 'Menghafal 3 Juz Al quran', 1613547482, 1613553675, NULL, 24, 3),
(19, 25, 'SNA2100017', NULL, NULL, '', '', NULL, '', 18000, NULL, NULL, '', '', '', '', '', NULL, 'sandsx@gmail.com', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, 1, NULL, 1, NULL, NULL, NULL, 1613603282, 1613603282, NULL, NULL, 0),
(25, 31, 'SNA2100021', '', '', '', '', NULL, '', 916722000, NULL, 2, '', '', '', '', '', '', 'kedipkedip@ymail.com', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 'uHLG07txgF1Sb7Fp7MECd1Ky3HGMhWxl.jpeg', 1, NULL, 1, NULL, NULL, 'baik hati, rajin menabung, tidak sombong.', 1613830732, 1613837984, NULL, 31, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tx_applicant_almamater`
--

CREATE TABLE `tx_applicant_almamater` (
  `id` int(11) NOT NULL,
  `applicant_id` int(11) DEFAULT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_applicant_almamater`
--

INSERT INTO `tx_applicant_almamater` (`id`, `applicant_id`, `title`, `national_school_principal_number`, `national_registration_number`, `school_registration_number`, `educational_stage_id`, `school_status`, `phone_number`, `date_graduation`, `study_time_length`, `tuition_payer`, `certificate_serial_number`, `examination_serial_number`, `examination_card_number`, `address_street`, `address_village`, `address_sub_district`, `address_city`, `address_province`, `residence_id`, `distance`, `transportation_id`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(15, 15, 'SMP NEGERI 1 TAKENGON', '10102188', '0065219061', '17401', 4, 1, '0852-6248-0232', 1589518800, 3, 1, NULL, NULL, NULL, 'Jalan Kartini No. 01', 'Merah Mersa', 'Lut Tawar', 'ACEH TENGAH', 'Aceh', 1, 1, 2, 'No Telpon Wali Kelas & Guru BP : 0813-7568-3541', 1613195914, 1613200476, NULL, 21, 2),
(16, 16, '', NULL, NULL, NULL, NULL, NULL, NULL, 18000, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, 1613544141, 1613544141, NULL, NULL, 0),
(17, 17, '', NULL, NULL, NULL, NULL, NULL, NULL, 18000, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, 1613544992, 1613544992, NULL, NULL, 0),
(18, 18, 'SMP NEGERI ARUN', '10105616', '0069183235', '1208', 4, 1, '0645653256', 1589518800, 3, 1, NULL, NULL, NULL, 'Jl. Cilacap. Komp. Perumahan PT. Arun', 'Batuphat Barat', 'Muara Satu', 'Lhokseumawe', 'Aceh', 1, 5, 3, 'Berasal dari SMP Negeri Arun', 1613547482, 1613553418, NULL, 24, 2),
(19, 19, '', NULL, NULL, NULL, NULL, NULL, NULL, 18000, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, 1613603282, 1613603282, NULL, NULL, 0),
(25, 25, '', NULL, NULL, NULL, NULL, NULL, NULL, 18000, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, 1613830732, 1613830732, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_applicant_document`
--

CREATE TABLE `tx_applicant_document` (
  `id` int(11) NOT NULL,
  `applicant_id` int(11) DEFAULT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_applicant_document`
--

INSERT INTO `tx_applicant_document` (`id`, `applicant_id`, `document_id`, `title`, `quantity`, `file_name`, `document_status`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(9, 15, 1, 'Fotocopy Kartu Keluarga', 3, NULL, 1, NULL, 1613201465, 1613201465, 21, 21, 0),
(10, 15, 2, 'Fotocopy Ijazah', 3, NULL, 1, NULL, 1613201465, 1613201465, 21, 21, 0),
(11, 18, 1, 'Fotocopy Kartu Keluarga', 3, 'rQ6u8PM2wzZJklA8aqwHIKsJdrOCw-WN.pdf', 1, NULL, 1613552048, 1613552715, 24, 24, 1),
(12, 18, 2, 'Fotocopy Ijazah', 3, NULL, 1, NULL, 1613552048, 1613552048, 24, 24, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_applicant_family`
--

CREATE TABLE `tx_applicant_family` (
  `id` int(11) NOT NULL,
  `applicant_id` int(11) DEFAULT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_applicant_family`
--

INSERT INTO `tx_applicant_family` (`id`, `applicant_id`, `family_type`, `title`, `identity_number`, `birth_place`, `date_birth`, `religion_id`, `educational_stage_id`, `occupation_id`, `income_id`, `phone_number`, `citizenship_status`, `address_street`, `address_village`, `address_sub_district`, `address_city`, `address_province`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(9, 15, 1, 'Iid Fitrasani', '1104030201680001', 'Takengon', -63054000, 1, 10, 5, 4, '0852-9760-4100', 1, 'Lembaga No. 182', 'Datu Kemili', 'Bebesen', 'Aceh Tengah', 'Aceh', 'Bekerja pada Dinas Perdagangan Koperasi Usaha Kecil dan Menengah Kabupaten Aceh Tengah', 1613200500, 1613200814, 21, 21, 1),
(10, 15, 2, 'Haidayati', '1104036210680001', 'Takengon', -37652400, 1, 10, 5, 4, '0821-6558-7495', 1, 'Lembaga No. 182', 'Datu Kemili', 'Bebesen', 'Aceh Tengah', 'Aceh', 'Bekerja pada Dinas Transmigrasi dan Tenaga Kerja Kabupaten Aceh Tengah', 1613200819, 1613201045, 21, 21, 1),
(11, 18, 1, 'Nizamullah', '1108022205740001', 'Kuta Binjei', 138430800, 1, 11, 6, 5, '08116711252', 1, 'Jl. Seulawah No. 40. Komp. PT PIM', 'Permai', 'Dewantara', 'Aceh Utara', 'Aceh', 'SMA Modal Bangsa Arun merupakan SMA Favorit', 1613549567, 1613552961, 24, 24, 2),
(12, 18, 2, 'Muri Yani', '1108025810770001', 'Banda Aceh', 1571374800, 1, 10, 1, 2, '081360666444', 1, 'Jl. Seulawah No. 40. Komp. PT PIM', 'Permai', 'Dewantara', 'Aceh Utara', 'Aceh', 'SMA Favorit', 1613549830, 1613553104, 24, 24, 1),
(13, 18, 3, 'Maimun Yusuf', '', 'Kuta Binjei', -378675000, 1, 8, 12, NULL, '085277183990', 1, 'Jl. Cilacap. Komp. PT Arun', 'Batuphat Barat', 'Muara Satu', 'Lhokseumawe', 'Aceh', '', 1613550550, 1613550688, 24, 24, 1),
(14, 25, 1, '', NULL, '', 18000, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, 1613838083, 1613838083, 31, 31, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_applicant_grade`
--

CREATE TABLE `tx_applicant_grade` (
  `id` int(11) NOT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `grade` decimal(18,2) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_applicant_grade`
--

INSERT INTO `tx_applicant_grade` (`id`, `applicant_id`, `course_id`, `title`, `semester_id`, `grade`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(21, 15, 1, 'Pendidikan Agama', 1, 89.00, NULL, 1613201054, 1613201241, 21, 21, 2),
(22, 15, 2, 'Bahasa Indonesia', 1, 89.00, NULL, 1613201054, 1613201241, 21, 21, 2),
(23, 15, 3, 'Bahasa Inggris', 1, 89.00, NULL, 1613201054, 1613201241, 21, 21, 2),
(24, 15, 4, 'Matematika', 1, 89.00, NULL, 1613201054, 1613201241, 21, 21, 2),
(25, 15, 5, 'IPA', 1, 89.00, NULL, 1613201054, 1613201241, 21, 21, 2),
(26, 15, 1, 'Pendidikan Agama', 2, 90.00, NULL, 1613201247, 1613201301, 21, 21, 1),
(27, 15, 2, 'Bahasa Indonesia', 2, 91.00, NULL, 1613201247, 1613201301, 21, 21, 1),
(28, 15, 3, 'Bahasa Inggris', 2, 90.00, NULL, 1613201247, 1613201301, 21, 21, 1),
(29, 15, 4, 'Matematika', 2, 88.00, NULL, 1613201247, 1613201301, 21, 21, 1),
(30, 15, 5, 'IPA', 2, 91.00, NULL, 1613201247, 1613201301, 21, 21, 1),
(31, 15, 1, 'Pendidikan Agama', 3, 89.00, NULL, 1613201306, 1613201407, 21, 21, 1),
(32, 15, 2, 'Bahasa Indonesia', 3, 89.00, NULL, 1613201306, 1613201407, 21, 21, 1),
(33, 15, 3, 'Bahasa Inggris', 3, 91.00, NULL, 1613201306, 1613201407, 21, 21, 1),
(34, 15, 4, 'Matematika', 3, 93.00, NULL, 1613201306, 1613201407, 21, 21, 1),
(35, 15, 5, 'IPA', 3, 89.00, NULL, 1613201306, 1613201407, 21, 21, 1),
(36, 18, 1, 'Pendidikan Agama', 1, 92.00, NULL, 1613551273, 1613551553, 24, 24, 2),
(37, 18, 2, 'Bahasa Indonesia', 1, 97.00, NULL, 1613551273, 1613551553, 24, 24, 2),
(38, 18, 3, 'Bahasa Inggris', 1, 92.00, NULL, 1613551273, 1613551553, 24, 24, 2),
(39, 18, 4, 'Matematika', 1, 89.00, NULL, 1613551273, 1613551553, 24, 24, 2),
(40, 18, 5, 'IPA', 1, 85.00, NULL, 1613551273, 1613551553, 24, 24, 2),
(41, 18, 1, 'Pendidikan Agama', 2, 85.00, NULL, 1613551595, 1613551774, 24, 24, 1),
(42, 18, 2, 'Bahasa Indonesia', 2, 97.00, NULL, 1613551595, 1613551774, 24, 24, 1),
(43, 18, 3, 'Bahasa Inggris', 2, 86.00, NULL, 1613551595, 1613551774, 24, 24, 1),
(44, 18, 4, 'Matematika', 2, 86.00, NULL, 1613551595, 1613551774, 24, 24, 1),
(45, 18, 5, 'IPA', 2, 83.00, NULL, 1613551595, 1613551774, 24, 24, 1),
(46, 18, 1, 'Pendidikan Agama', 3, 94.00, NULL, 1613551789, 1613551936, 24, 24, 2),
(47, 18, 2, 'Bahasa Indonesia', 3, 90.00, NULL, 1613551789, 1613551936, 24, 24, 2),
(48, 18, 3, 'Bahasa Inggris', 3, 98.00, NULL, 1613551789, 1613551936, 24, 24, 2),
(49, 18, 4, 'Matematika', 3, 84.00, NULL, 1613551789, 1613551936, 24, 24, 2),
(50, 18, 5, 'IPA', 3, 85.00, NULL, 1613551789, 1613551936, 24, 24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tx_applicant_standing`
--

CREATE TABLE `tx_applicant_standing` (
  `id` int(11) NOT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `final_status` int(11) DEFAULT NULL,
  `date_final` int(11) DEFAULT NULL,
  `approval_status` int(11) DEFAULT NULL,
  `date_approval` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_archive`
--

CREATE TABLE `tx_archive` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `archive_url` varchar(500) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `download_counter` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_area`
--

CREATE TABLE `tx_area` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_author`
--

CREATE TABLE `tx_author` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_author`
--

INSERT INTO `tx_author` (`id`, `user_id`, `title`, `phone_number`, `email`, `google_plus`, `instagram`, `facebook`, `twitter`, `file_name`, `address`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, NULL, 'Admin', '', '', '', '', '', '', NULL, '', '', 1611637710, 1611637710, 1, 1, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_assignment`
--

CREATE TABLE `tx_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_assignment`
--

INSERT INTO `tx_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1525160867),
('reguler', '14', 1581095751),
('reguler', '21', 1613195914),
('reguler', '22', 1613544141),
('reguler', '23', 1613544992),
('reguler', '24', 1613547482),
('reguler', '25', 1613603282),
('reguler', '31', 1613830732);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item`
--

CREATE TABLE `tx_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_item`
--

INSERT INTO `tx_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Admin', NULL, NULL, 1512398979, 1546191619),
('create-academic-year', 2, 'Create Academic Year', NULL, NULL, 1546180222, 1546180222),
('create-album', 2, 'Create Album', NULL, NULL, 1525157509, 1525157509),
('create-applicant', 2, 'Create Applicant', NULL, NULL, 1546180495, 1546180495),
('create-archive', 2, 'Create Archive', NULL, NULL, 1525157675, 1525157675),
('create-author', 2, 'Create Author', NULL, NULL, 1525157796, 1525157796),
('create-blog', 2, 'Create Blog', NULL, NULL, 1525157867, 1525157867),
('create-category', 2, 'Create Category', NULL, NULL, 1525157955, 1525157955),
('create-citizenship', 2, 'Create Citizenship', NULL, NULL, 1546187097, 1546187097),
('create-comment', 2, 'Create Comment', NULL, NULL, 1525158012, 1525158012),
('create-content', 2, 'Create Content', NULL, NULL, 1525158072, 1525158072),
('create-course', 2, 'Create Course', NULL, NULL, 1546187162, 1546187162),
('create-document', 2, 'Create Document', NULL, NULL, 1551191603, 1551191603),
('create-educational-stage', 2, 'Create Educational Stage', NULL, NULL, 1546187233, 1546187233),
('create-employment', 2, 'Create Employment', NULL, NULL, 1525158127, 1525158127),
('create-event', 2, 'Create Event', NULL, NULL, 1525158262, 1525158262),
('create-feature', 2, 'Create Feature', NULL, NULL, 1546187309, 1546187309),
('create-income', 2, 'Create Income', NULL, NULL, 1546187391, 1546187391),
('create-lookup', 2, 'Create Lookup', NULL, NULL, 1525158317, 1525158317),
('create-master', 2, 'Create Master', NULL, NULL, 1525157380, 1551191887),
('create-measure', 2, 'Create Measure', NULL, NULL, 1546187463, 1546187463),
('create-occupation', 2, 'Create Occupation', NULL, NULL, 1546187540, 1546187540),
('create-office', 2, 'Create Office', NULL, NULL, 1525158381, 1525158381),
('create-page', 2, 'Create Page', NULL, NULL, 1525158462, 1525158462),
('create-page-type', 2, 'Create Page Type', NULL, NULL, 1525158549, 1525158549),
('create-photo', 2, 'Create Photo', NULL, NULL, 1525158617, 1525158617),
('create-pricing', 2, 'Create Pricing', NULL, NULL, 1546187710, 1546187710),
('create-product', 2, 'Create Product', NULL, NULL, 1546187013, 1546187013),
('create-product-type', 2, 'Create Product Type', NULL, NULL, 1546191477, 1546191477),
('create-profile', 2, 'Create Profile', NULL, NULL, 1525158723, 1525158723),
('create-quote', 2, 'Create Quote', NULL, NULL, 1525158789, 1525158789),
('create-religion', 2, 'Create Religion', NULL, NULL, 1546188986, 1546188986),
('create-residence', 2, 'Create Residence', NULL, NULL, 1546189079, 1546189079),
('create-semester', 2, 'Create Semester', NULL, NULL, 1551191714, 1551191714),
('create-staff', 2, 'Create Staff', NULL, NULL, 1525158861, 1525158861),
('create-subscriber', 2, 'Create Subscriber', NULL, NULL, 1525159056, 1525159056),
('create-theme', 2, 'Create Theme', NULL, NULL, 1525159126, 1525159126),
('create-transaction', 2, 'Create Transaction', NULL, NULL, 1525157439, 1525160284),
('create-transportation', 2, 'Create Transportation', NULL, NULL, 1546189149, 1546189822),
('delete-academic-year', 2, 'Delete Academic Year', NULL, NULL, 1546180306, 1546180306),
('delete-album', 2, 'Delete Album', NULL, NULL, 1525157549, 1525157549),
('delete-applicant', 2, 'Delete Applicant', NULL, NULL, 1546180531, 1546180531),
('delete-archive', 2, 'Delete Archive', NULL, NULL, 1525157720, 1525157720),
('delete-author', 2, 'Delete Author', NULL, NULL, 1525157843, 1525157843),
('delete-blog', 2, 'Delete Blog', NULL, NULL, 1525157896, 1525157896),
('delete-category', 2, 'Delete Category', NULL, NULL, 1525157992, 1525157992),
('delete-citizenship', 2, 'Delete Citizenship', NULL, NULL, 1546187124, 1546187124),
('delete-comment', 2, 'Delete Comment', NULL, NULL, 1525158049, 1525158049),
('delete-content', 2, 'Delete Content', NULL, NULL, 1525158100, 1525158100),
('delete-course', 2, 'Delete Course', NULL, NULL, 1546187189, 1546187189),
('delete-document', 2, 'Delete Document', NULL, NULL, 1551191642, 1551191642),
('delete-educational-stage', 2, 'Delete Educational Stage', NULL, NULL, 1546187265, 1546187265),
('delete-employment', 2, 'Delete Employment', NULL, NULL, 1525158168, 1525158168),
('delete-event', 2, 'Delete Event', NULL, NULL, 1525158293, 1525158293),
('delete-feature', 2, 'Delete Feature', NULL, NULL, 1546187338, 1546187338),
('delete-income', 2, 'Delete Income', NULL, NULL, 1546187425, 1546187425),
('delete-lookup', 2, 'Delete Lookup', NULL, NULL, 1525158353, 1525158353),
('delete-master', 2, 'Delete Master', NULL, NULL, 1525157409, 1551191865),
('delete-measure', 2, 'Delete Measure', NULL, NULL, 1546187502, 1546187502),
('delete-occupation', 2, 'Delete Occupation', NULL, NULL, 1546187574, 1546187574),
('delete-office', 2, 'Delete Office', NULL, NULL, 1525158430, 1525158430),
('delete-page', 2, 'Delete Page', NULL, NULL, 1525158528, 1525158528),
('delete-page-type', 2, 'Delete Page Type', NULL, NULL, 1525158589, 1525158589),
('delete-photo', 2, 'Delete Photo', NULL, NULL, 1525158698, 1525158698),
('delete-pricing', 2, 'Delete Pricing', NULL, NULL, 1546187739, 1546187739),
('delete-product', 2, 'Delete Product', NULL, NULL, 1546187051, 1546187051),
('delete-product-type', 2, 'Delete Product Type', NULL, NULL, 1546191506, 1546191506),
('delete-profile', 2, 'Delete Profile', NULL, NULL, 1525158764, 1525158764),
('delete-quote', 2, 'Delete Quote', NULL, NULL, 1525158841, 1525158841),
('delete-religion', 2, 'Delete Religion', NULL, NULL, 1546189028, 1546189028),
('delete-residence', 2, 'Delete Residence', NULL, NULL, 1546189108, 1546189108),
('delete-semester', 2, 'Delete Semester', NULL, NULL, 1551191743, 1551191743),
('delete-staff', 2, 'Delete Staff', NULL, NULL, 1525158966, 1525158966),
('delete-subscriber', 2, 'Delete Subscriber', NULL, NULL, 1525159103, 1525159103),
('delete-theme', 2, 'Delete Theme', NULL, NULL, 1525159181, 1525159181),
('delete-transaction', 2, 'Delete Transaction', NULL, NULL, 1525157483, 1525160303),
('delete-transportation', 2, 'Delete Transportation', NULL, NULL, 1546189176, 1546189733),
('guest', 1, 'Guest', NULL, NULL, 1525156986, 1525156986),
('index-academic-year', 2, 'Index Academic Year', NULL, NULL, 1546180280, 1546180280),
('index-album', 2, 'Index Album', NULL, NULL, 1525157526, 1525157526),
('index-applicant', 2, 'Index Applicant', NULL, NULL, 1546180506, 1546180506),
('index-archive', 2, 'Index Archive', NULL, NULL, 1525157695, 1525157695),
('index-author', 2, 'Index Author', NULL, NULL, 1525157816, 1525157816),
('index-blog', 2, 'Index Blog', NULL, NULL, 1525157881, 1525157881),
('index-category', 2, 'Index Category', NULL, NULL, 1525157975, 1525157975),
('index-citizenship', 2, 'Index Citizenship', NULL, NULL, 1546187133, 1546187133),
('index-comment', 2, 'Index Comment', NULL, NULL, 1525158032, 1525158032),
('index-content', 2, 'Index Content', NULL, NULL, 1525158085, 1525158085),
('index-course', 2, 'Index Course', NULL, NULL, 1546187197, 1546187197),
('index-document', 2, 'Index Document', NULL, NULL, 1551191625, 1551191625),
('index-educational-stage', 2, 'Index Educational Stage', NULL, NULL, 1546187277, 1546187277),
('index-employment', 2, 'Index Employment', NULL, NULL, 1525158150, 1525158150),
('index-event', 2, 'Index Event', NULL, NULL, 1525158276, 1525158276),
('index-feature', 2, 'Index Feature', NULL, NULL, 1546187347, 1546187347),
('index-income', 2, 'Index Income', NULL, NULL, 1546187436, 1546187436),
('index-lookup', 2, 'Index Lookup', NULL, NULL, 1525158333, 1525158333),
('index-master', 2, 'Index Master', NULL, NULL, 1525157393, 1551191960),
('index-measure', 2, 'Index Measure', NULL, NULL, 1546187510, 1546187510),
('index-occupation', 2, 'Index Occupation', NULL, NULL, 1546187585, 1546187585),
('index-office', 2, 'Index Office', NULL, NULL, 1525158405, 1525158405),
('index-page', 2, 'Index Page', NULL, NULL, 1525158477, 1525158477),
('index-page-type', 2, 'Index Page Type', NULL, NULL, 1525158570, 1525158570),
('index-photo', 2, 'Index Photo', NULL, NULL, 1525158641, 1525158641),
('index-pricing', 2, 'Index Pricing', NULL, NULL, 1546187759, 1546187759),
('index-product', 2, 'Index Product', NULL, NULL, 1546187042, 1546187042),
('index-product-type', 2, 'Index Product Type', NULL, NULL, 1546191517, 1546191517),
('index-profile', 2, 'Index Profile', NULL, NULL, 1525158743, 1525158743),
('index-quote', 2, 'Index Quote', NULL, NULL, 1525158812, 1525158812),
('index-religion', 2, 'Index Religion', NULL, NULL, 1546189050, 1546189050),
('index-residence', 2, 'Index Residence', NULL, NULL, 1546189117, 1546189117),
('index-semester', 2, 'Index Semester', NULL, NULL, 1551191723, 1551191723),
('index-staff', 2, 'Index Staff', NULL, NULL, 1525158877, 1525158877),
('index-subscriber', 2, 'Index Subscriber', NULL, NULL, 1525159080, 1525159080),
('index-theme', 2, 'Index Theme', NULL, NULL, 1525159151, 1525159151),
('index-transaction', 2, 'Index Transaction', NULL, NULL, 1525157460, 1525160347),
('index-transportation', 2, 'Index Transportation', NULL, NULL, 1546189188, 1546189827),
('reguler', 1, 'Reguler', NULL, NULL, 1514393890, 1546190217),
('update-academic-year', 2, 'Update Academic Year', NULL, NULL, 1546180333, 1546180333),
('update-album', 2, 'Update Album', NULL, NULL, 1525157518, 1525157518),
('update-applicant', 2, 'Update Applicant', NULL, NULL, 1546180541, 1546180541),
('update-archive', 2, 'Update Archive', NULL, NULL, 1525157684, 1525157684),
('update-author', 2, 'Update Author', NULL, NULL, 1525157804, 1525157804),
('update-blog', 2, 'Update Blog', NULL, NULL, 1525157875, 1525157875),
('update-category', 2, 'Update Category', NULL, NULL, 1525157964, 1525157964),
('update-citizenship', 2, 'Update Citizenship', NULL, NULL, 1546187107, 1546187107),
('update-comment', 2, 'Update Comment', NULL, NULL, 1525158019, 1525158019),
('update-content', 2, 'Update Content', NULL, NULL, 1525158079, 1525158079),
('update-course', 2, 'Update Course', NULL, NULL, 1546187173, 1546187173),
('update-document', 2, 'Update Document', NULL, NULL, 1551191652, 1551191652),
('update-educational-stage', 2, 'Update Educational Stage', NULL, NULL, 1546187243, 1546187243),
('update-employment', 2, 'Update Employment', NULL, NULL, 1525158139, 1525158139),
('update-event', 2, 'Update Event', NULL, NULL, 1525158269, 1525158269),
('update-feature', 2, 'Update Feature', NULL, NULL, 1546187317, 1546187317),
('update-income', 2, 'Update Income', NULL, NULL, 1546187400, 1546187400),
('update-lookup', 2, 'Update Lookup', NULL, NULL, 1525158323, 1525158323),
('update-master', 2, 'Update Master', NULL, NULL, 1525157385, 1551191976),
('update-measure', 2, 'Update Mesure', NULL, NULL, 1546187481, 1546187481),
('update-occupation', 2, 'Update Occupation', NULL, NULL, 1546187552, 1546187552),
('update-office', 2, 'Update Office', NULL, NULL, 1525158392, 1525158392),
('update-page', 2, 'Update Page', NULL, NULL, 1525158469, 1525158469),
('update-page-type', 2, 'Update Page Type', NULL, NULL, 1525158557, 1525158557),
('update-photo', 2, 'Update Photo', NULL, NULL, 1525158625, 1525158625),
('update-pricing', 2, 'Update Pricing', NULL, NULL, 1546187719, 1546187719),
('update-product', 2, 'Update Product', NULL, NULL, 1546187023, 1546187023),
('update-product-type', 2, 'Update Product Type', NULL, NULL, 1546191486, 1546191486),
('update-profile', 2, 'Update Profile', NULL, NULL, 1525158735, 1525158735),
('update-quote', 2, 'Update Quote', NULL, NULL, 1525158802, 1525158802),
('update-religion', 2, 'Update Religion', NULL, NULL, 1546188996, 1546188996),
('update-residence', 2, 'Update Residence', NULL, NULL, 1546189089, 1546189089),
('update-semester', 2, 'Update Semester', NULL, NULL, 1551191776, 1551191776),
('update-staff', 2, 'Update Staff', NULL, NULL, 1525158867, 1525158867),
('update-subscriber', 2, 'Update Subscriber', NULL, NULL, 1525159068, 1525159068),
('update-theme', 2, 'Update Theme', NULL, NULL, 1525159142, 1525159142),
('update-transaction', 2, 'Update Transaction', NULL, NULL, 1525157449, 1525160372),
('update-transportation', 2, 'Update Transportation', NULL, NULL, 1546189158, 1546189829),
('view-academic-year', 2, 'View Academic Year', NULL, NULL, 1546180264, 1546180264),
('view-album', 2, 'View Album', NULL, NULL, 1525157535, 1525157535),
('view-applicant', 2, 'View Applicant', NULL, NULL, 1546180518, 1546180518),
('view-archive', 2, 'View Archive', NULL, NULL, 1525157709, 1525157709),
('view-author', 2, 'View Author', NULL, NULL, 1525157824, 1525157824),
('view-blog', 2, 'View Blog', NULL, NULL, 1525157889, 1525157889),
('view-category', 2, 'View Category', NULL, NULL, 1525157984, 1525157984),
('view-citizenship', 2, 'View Citizenship', NULL, NULL, 1546187115, 1546187115),
('view-comment', 2, 'View Comment', NULL, NULL, 1525158040, 1525158040),
('view-content', 2, 'View Content', NULL, NULL, 1525158092, 1525158092),
('view-course', 2, 'View Course', NULL, NULL, 1546187182, 1546187182),
('view-document', 2, 'View Document', NULL, NULL, 1551191634, 1551191634),
('view-educational-stage', 2, 'View Educational Stage', NULL, NULL, 1546187253, 1546187253),
('view-employment', 2, 'View Employment', NULL, NULL, 1525158158, 1525158158),
('view-event', 2, 'View Event', NULL, NULL, 1525158284, 1525158284),
('view-feature', 2, 'View Feature', NULL, NULL, 1546187329, 1546187329),
('view-income', 2, 'View Income', NULL, NULL, 1546187416, 1546187416),
('view-lookup', 2, 'View Lookup', NULL, NULL, 1525158343, 1525158343),
('view-master', 2, 'View Master', NULL, NULL, 1525157402, 1551192249),
('view-measure', 2, 'View Measure', NULL, NULL, 1546187493, 1546187493),
('view-occupation', 2, 'View Occupation', NULL, NULL, 1546187563, 1546187563),
('view-office', 2, 'View Office', NULL, NULL, 1525158416, 1525158416),
('view-page', 2, 'View Page', NULL, NULL, 1525158499, 1525158499),
('view-page-type', 2, 'View Page Type', NULL, NULL, 1525158580, 1525158580),
('view-photo', 2, 'View Photo', NULL, NULL, 1525158689, 1525158689),
('view-pricing', 2, 'View Pricing', NULL, NULL, 1546187728, 1546187728),
('view-product', 2, 'View Product', NULL, NULL, 1546187033, 1546187033),
('view-product-type', 2, 'View Product Type', NULL, NULL, 1546191494, 1546191494),
('view-profile', 2, 'View Profile', NULL, NULL, 1525158752, 1525158752),
('view-quote', 2, 'View Quote', NULL, NULL, 1525158823, 1525158823),
('view-religion', 2, 'View Religion', NULL, NULL, 1546189021, 1546189021),
('view-residence', 2, 'View Residence', NULL, NULL, 1546189099, 1546189099),
('view-semester', 2, 'View Semester', NULL, NULL, 1551191733, 1551191733),
('view-staff', 2, 'View Staff', NULL, NULL, 1525158885, 1525158885),
('view-subscriber', 2, 'View Subscriber', NULL, NULL, 1525159091, 1525159091),
('view-theme', 2, 'View Theme', NULL, NULL, 1525159172, 1525159172),
('view-transaction', 2, 'View Transaction', NULL, NULL, 1525157471, 1525160397),
('view-transportation', 2, 'View Transportation', NULL, NULL, 1546189167, 1546189838);

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_item_child`
--

CREATE TABLE `tx_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_auth_item_child`
--

INSERT INTO `tx_auth_item_child` (`parent`, `child`) VALUES
('admin', 'create-academic-year'),
('admin', 'create-album'),
('admin', 'create-applicant'),
('admin', 'create-archive'),
('admin', 'create-author'),
('admin', 'create-blog'),
('admin', 'create-category'),
('admin', 'create-citizenship'),
('admin', 'create-comment'),
('admin', 'create-content'),
('admin', 'create-course'),
('admin', 'create-educational-stage'),
('admin', 'create-employment'),
('admin', 'create-event'),
('admin', 'create-feature'),
('admin', 'create-income'),
('admin', 'create-lookup'),
('admin', 'create-master'),
('admin', 'create-measure'),
('admin', 'create-occupation'),
('admin', 'create-office'),
('admin', 'create-page'),
('admin', 'create-page-type'),
('admin', 'create-photo'),
('admin', 'create-pricing'),
('admin', 'create-product'),
('admin', 'create-product-type'),
('admin', 'create-profile'),
('admin', 'create-quote'),
('admin', 'create-religion'),
('admin', 'create-residence'),
('admin', 'create-staff'),
('admin', 'create-subscriber'),
('admin', 'create-theme'),
('admin', 'create-transaction'),
('admin', 'create-transportation'),
('admin', 'delete-academic-year'),
('admin', 'delete-album'),
('admin', 'delete-applicant'),
('admin', 'delete-archive'),
('admin', 'delete-author'),
('admin', 'delete-blog'),
('admin', 'delete-category'),
('admin', 'delete-citizenship'),
('admin', 'delete-comment'),
('admin', 'delete-content'),
('admin', 'delete-course'),
('admin', 'delete-educational-stage'),
('admin', 'delete-employment'),
('admin', 'delete-event'),
('admin', 'delete-feature'),
('admin', 'delete-income'),
('admin', 'delete-lookup'),
('admin', 'delete-master'),
('admin', 'delete-measure'),
('admin', 'delete-occupation'),
('admin', 'delete-office'),
('admin', 'delete-page'),
('admin', 'delete-page-type'),
('admin', 'delete-photo'),
('admin', 'delete-pricing'),
('admin', 'delete-product'),
('admin', 'delete-product-type'),
('admin', 'delete-profile'),
('admin', 'delete-quote'),
('admin', 'delete-religion'),
('admin', 'delete-residence'),
('admin', 'delete-staff'),
('admin', 'delete-subscriber'),
('admin', 'delete-theme'),
('admin', 'delete-transaction'),
('admin', 'delete-transportation'),
('admin', 'guest'),
('admin', 'index-academic-year'),
('admin', 'index-album'),
('admin', 'index-applicant'),
('admin', 'index-archive'),
('admin', 'index-author'),
('admin', 'index-blog'),
('admin', 'index-category'),
('admin', 'index-citizenship'),
('admin', 'index-comment'),
('admin', 'index-content'),
('admin', 'index-course'),
('admin', 'index-educational-stage'),
('admin', 'index-employment'),
('admin', 'index-event'),
('admin', 'index-feature'),
('admin', 'index-income'),
('admin', 'index-lookup'),
('admin', 'index-master'),
('admin', 'index-measure'),
('admin', 'index-occupation'),
('admin', 'index-office'),
('admin', 'index-page'),
('admin', 'index-page-type'),
('admin', 'index-photo'),
('admin', 'index-pricing'),
('admin', 'index-product'),
('admin', 'index-product-type'),
('admin', 'index-profile'),
('admin', 'index-quote'),
('admin', 'index-religion'),
('admin', 'index-residence'),
('admin', 'index-staff'),
('admin', 'index-subscriber'),
('admin', 'index-theme'),
('admin', 'index-transaction'),
('admin', 'index-transportation'),
('admin', 'reguler'),
('admin', 'update-academic-year'),
('admin', 'update-album'),
('admin', 'update-applicant'),
('admin', 'update-archive'),
('admin', 'update-author'),
('admin', 'update-blog'),
('admin', 'update-category'),
('admin', 'update-citizenship'),
('admin', 'update-comment'),
('admin', 'update-content'),
('admin', 'update-course'),
('admin', 'update-educational-stage'),
('admin', 'update-employment'),
('admin', 'update-event'),
('admin', 'update-feature'),
('admin', 'update-income'),
('admin', 'update-lookup'),
('admin', 'update-master'),
('admin', 'update-measure'),
('admin', 'update-occupation'),
('admin', 'update-office'),
('admin', 'update-page'),
('admin', 'update-page-type'),
('admin', 'update-photo'),
('admin', 'update-pricing'),
('admin', 'update-product'),
('admin', 'update-product-type'),
('admin', 'update-profile'),
('admin', 'update-quote'),
('admin', 'update-religion'),
('admin', 'update-residence'),
('admin', 'update-staff'),
('admin', 'update-subscriber'),
('admin', 'update-theme'),
('admin', 'update-transaction'),
('admin', 'update-transportation'),
('admin', 'view-academic-year'),
('admin', 'view-album'),
('admin', 'view-applicant'),
('admin', 'view-archive'),
('admin', 'view-author'),
('admin', 'view-blog'),
('admin', 'view-category'),
('admin', 'view-citizenship'),
('admin', 'view-comment'),
('admin', 'view-content'),
('admin', 'view-course'),
('admin', 'view-educational-stage'),
('admin', 'view-employment'),
('admin', 'view-event'),
('admin', 'view-feature'),
('admin', 'view-income'),
('admin', 'view-lookup'),
('admin', 'view-master'),
('admin', 'view-measure'),
('admin', 'view-occupation'),
('admin', 'view-office'),
('admin', 'view-page'),
('admin', 'view-page-type'),
('admin', 'view-photo'),
('admin', 'view-pricing'),
('admin', 'view-product'),
('admin', 'view-product-type'),
('admin', 'view-profile'),
('admin', 'view-quote'),
('admin', 'view-religion'),
('admin', 'view-residence'),
('admin', 'view-staff'),
('admin', 'view-subscriber'),
('admin', 'view-theme'),
('admin', 'view-transaction'),
('admin', 'view-transportation'),
('create-master', 'create-academic-year'),
('create-master', 'create-album'),
('create-master', 'create-archive'),
('create-master', 'create-author'),
('create-master', 'create-category'),
('create-master', 'create-citizenship'),
('create-master', 'create-course'),
('create-master', 'create-document'),
('create-master', 'create-educational-stage'),
('create-master', 'create-employment'),
('create-master', 'create-event'),
('create-master', 'create-feature'),
('create-master', 'create-income'),
('create-master', 'create-measure'),
('create-master', 'create-occupation'),
('create-master', 'create-page'),
('create-master', 'create-page-type'),
('create-master', 'create-product-type'),
('create-master', 'create-quote'),
('create-master', 'create-religion'),
('create-master', 'create-residence'),
('create-master', 'create-semester'),
('create-master', 'create-staff'),
('create-master', 'create-transportation'),
('create-transaction', 'create-blog'),
('create-transaction', 'create-photo'),
('delete-master', 'delete-academic-year'),
('delete-master', 'delete-album'),
('delete-master', 'delete-archive'),
('delete-master', 'delete-author'),
('delete-master', 'delete-category'),
('delete-master', 'delete-citizenship'),
('delete-master', 'delete-content'),
('delete-master', 'delete-course'),
('delete-master', 'delete-document'),
('delete-master', 'delete-educational-stage'),
('delete-master', 'delete-employment'),
('delete-master', 'delete-event'),
('delete-master', 'delete-feature'),
('delete-master', 'delete-income'),
('delete-master', 'delete-measure'),
('delete-master', 'delete-occupation'),
('delete-master', 'delete-page'),
('delete-master', 'delete-page-type'),
('delete-master', 'delete-product-type'),
('delete-master', 'delete-quote'),
('delete-master', 'delete-religion'),
('delete-master', 'delete-residence'),
('delete-master', 'delete-semester'),
('delete-master', 'delete-staff'),
('delete-master', 'delete-subscriber'),
('delete-master', 'delete-transportation'),
('delete-transaction', 'delete-blog'),
('delete-transaction', 'delete-photo'),
('index-master', 'index-academic-year'),
('index-master', 'index-album'),
('index-master', 'index-archive'),
('index-master', 'index-author'),
('index-master', 'index-category'),
('index-master', 'index-citizenship'),
('index-master', 'index-content'),
('index-master', 'index-course'),
('index-master', 'index-document'),
('index-master', 'index-educational-stage'),
('index-master', 'index-employment'),
('index-master', 'index-event'),
('index-master', 'index-feature'),
('index-master', 'index-income'),
('index-master', 'index-lookup'),
('index-master', 'index-measure'),
('index-master', 'index-occupation'),
('index-master', 'index-page'),
('index-master', 'index-page-type'),
('index-master', 'index-photo'),
('index-master', 'index-product-type'),
('index-master', 'index-quote'),
('index-master', 'index-religion'),
('index-master', 'index-residence'),
('index-master', 'index-semester'),
('index-master', 'index-staff'),
('index-master', 'index-subscriber'),
('index-master', 'index-theme'),
('index-master', 'index-transportation'),
('index-transaction', 'index-blog'),
('index-transaction', 'index-photo'),
('reguler', 'create-applicant'),
('reguler', 'delete-applicant'),
('reguler', 'index-applicant'),
('reguler', 'update-applicant'),
('reguler', 'view-applicant'),
('update-master', 'update-academic-year'),
('update-master', 'update-album'),
('update-master', 'update-archive'),
('update-master', 'update-author'),
('update-master', 'update-category'),
('update-master', 'update-citizenship'),
('update-master', 'update-course'),
('update-master', 'update-document'),
('update-master', 'update-educational-stage'),
('update-master', 'update-employment'),
('update-master', 'update-event'),
('update-master', 'update-feature'),
('update-master', 'update-income'),
('update-master', 'update-measure'),
('update-master', 'update-occupation'),
('update-master', 'update-office'),
('update-master', 'update-page'),
('update-master', 'update-page-type'),
('update-master', 'update-product-type'),
('update-master', 'update-profile'),
('update-master', 'update-quote'),
('update-master', 'update-religion'),
('update-master', 'update-residence'),
('update-master', 'update-semester'),
('update-master', 'update-staff'),
('update-master', 'update-transportation'),
('update-transaction', 'update-blog'),
('update-transaction', 'update-photo'),
('view-master', 'view-academic-year'),
('view-master', 'view-album'),
('view-master', 'view-archive'),
('view-master', 'view-author'),
('view-master', 'view-category'),
('view-master', 'view-citizenship'),
('view-master', 'view-content'),
('view-master', 'view-course'),
('view-master', 'view-document'),
('view-master', 'view-educational-stage'),
('view-master', 'view-employment'),
('view-master', 'view-event'),
('view-master', 'view-feature'),
('view-master', 'view-income'),
('view-master', 'view-measure'),
('view-master', 'view-occupation'),
('view-master', 'view-office'),
('view-master', 'view-page'),
('view-master', 'view-product-type'),
('view-master', 'view-profile'),
('view-master', 'view-quote'),
('view-master', 'view-religion'),
('view-master', 'view-residence'),
('view-master', 'view-semester'),
('view-master', 'view-staff'),
('view-master', 'view-theme'),
('view-master', 'view-transportation'),
('view-transaction', 'view-blog'),
('view-transaction', 'view-photo');

-- --------------------------------------------------------

--
-- Table structure for table `tx_auth_rule`
--

CREATE TABLE `tx_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_blog`
--

CREATE TABLE `tx_blog` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_blog`
--

INSERT INTO `tx_blog` (`id`, `category_id`, `author_id`, `title`, `cover`, `url`, `content`, `description`, `tags`, `month_period`, `publish_status`, `pinned_status`, `view_counter`, `rating`, `date_issued`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 1, 1, 'Titik Temu Agama-Agama Besar di Jawa', '', NULL, '<p>Tidak terhitung ada berapa banyak jumlah tradisi kebudayaan yang ada di Indonesia karena saking kayanya keberagaman yang ada. Di Banyuwangi misalnya, terdapat tradisi Petik Laut yang dilakukan para nelayan sebagai bentuk rasa syukur dan keselamatan dari wabah penyakit dan bencana. Ada pula di Yogyakarta dengan tradisi Grebeg yang diselenggarakan Kraton Yogyakarta sebagai mengingat hari-hari besar dalam Islam.</p>\r\n\r\n<p>Meskipun hingga kini tradisi-tradisi yang diselenggarakan oleh sebagian muslim tersebut masih bertahan, tidak jarang kita sering mendengar ujaran-ujaran bernada antagonisme dan sinisme atas perilaku tersebut &mdash;bukan &nbsp;bagian dari ajaran Islam yang sesungguhnya. Akibatnya kita sering pula mendengar peristiwa-peristiwa persekusi baik secara verbal, teks, maupun fisik yang menimpa minoritas agama maupun minoritas aliran kepercayaan.</p>\r\n\r\n<p>Atas dasar itu Asah Kritis Indonesia (ASKI) menggelar di diskusi dari seri kesembilan dengan topik Panel Antropologi Agama. Adapun pembicara dalam diskusi ini di antaranya adalah Masudi Jufri (Dosen Fakultas Dakwah dan Komunikasi Islam IAIN Kudus), Aris Arif Mundayat Pendiri Asah Kritis Indonesia (ASKI), Andri Rosadi (Dosen Fakultas Adab UIN Padang).</p>\r\n\r\n<p><strong>Genealogi Islam Nusantara</strong></p>\r\n\r\n<p>Terminologi Islam Nusantara yang sempat muncul di penghujung Muktamar Nahdlatul Ulama di Jombang pada 2015 lalu, sempat menimbulkan pro kontra kepada sebagian besar kalangan muslim di Indonesia. Sinisme yang muncul adalah anggapan Islam Nusantara sebagai bentuk ajaran baru yang memiliki kencenderungan pengelompokan atau sebagai Islam varian baru.</p>\r\n\r\n<p>Masudi Jufri punya anggapan lain, bahwa Islam Nusantara tidak bisa dilihat secara sepotong hanya dengan berdasarkan aspek terminologis semata. Islam yang lahir di Indonesia atau yang saat itu lebih populer disebut nusantara merupakan hasil sebuah difusi kebudayaan yang berasal dari tempat lain yang berkesinambungan.</p>\r\n\r\n<p>Bila dirunut ke belakang, proses kodifikasi dari perjalanan peradaban pengetahuan berlangsung secara periodik. Bermula dari periode Yunani sejak abad 6 SM sampai dengan 6 M. Dilanjutkan periode Islam sejak abad 6 M sampai abad 12 M. Dan, berlanjut pada periode Eropa/Barat sejak abad 12 M, sekaligus mulai menunjukan dominasi sejak filsuf kenamaan Rene Descartes menggelorakan kredo&nbsp;<em>Cogito Ergo Sum&nbsp;</em>yang berarti &ldquo;Aku berpikir. Maka aku ada.&rdquo;</p>\r\n\r\n<p>Nusantara yang sejak awal berada pada posisi pinggiran dunia Islam menyebabkan terjadi proses perpindahan Islam secara besar-besaran dikarenakan terdapat sebuah hubungan. Beberapa di antaranya adalah hubungan perdagangan, banyak pedagang Islam yang membawa hasil komoditas yang diperdagangkan ke nusantara; Hubungan keagamaan dan keilmuan, terjadi sejak banyak ulama nusantara yang mempelajari ilmu hadis dan tasawuf di Mekkah dan Madinah sebagai pusat keilmuan Islam; Hubungan politis, dalam beberapa catatan sejarah menjelaskan tentang hubungan Kerajaan Yogyakarta dengan Turki Usmani.</p>\r\n\r\n<p>Masudi juga sempat menunjukan beberapa teori yang diutarakan Pijnappel, Moquette, Fatimi, Marrison, dan Naguib Al-Attas. Berdasarkan teori-teori tersebut meski memiliki beberapa atribut berbeda, sebagai basis analisis terdapat entitas yang memiliki kemiripan dan terbuka untuk diperdebatkan. Entitas yang memiliki kemiripan itu di antaranya memuat tempat asal kedatangan Islam, waktu kedatangan Islam, dan para pembawa Islam.</p>\r\n\r\n<p>Jaringan ulama nusantara kemudian dapat terlacak pada periode sekitar abad 17-18, seiring mulai berakhirnya kekuasaan Kerajaan Majapahit pada abad ke-16. Walaupun kemudian, monumen bersejarah Islam yakni Masjid Menara Kudus sudah ada sejak tahun 1549 yang menunjukan keberadaan Islam walau belum secara hegemonik.</p>\r\n\r\n<p><strong>Usaha Akulturasi Islam di Jawa</strong></p>\r\n\r\n<p>Hubungan keagamaan sekaligus keilmuan ulama nusantara dalam mempelajari ilmu hadis dan tasawuf kemudian menjadikan ciri khas bentuk keislaman di nusantara. Kedalaman ilmu tasawuf falsafi yang dimiliki para ulama nusantara, menjadikan modal utama dalam menyampaikan Islam dengan cara yang lembut di tengah dominasi Budha dan Hindu saat itu. Ulama yang tergabung dalam Wali Songo mencontohkan dakwah Islam dengan baik.</p>\r\n\r\n<p>Seperti halnya yang dicatat oleh Solichin Salam yang menerangkan Sunan Kudus misalnya, selalu membawa sapi yang diikatkan di halaman Masjid Menara Kudus. Di saat bersamaan juga membiarkan masyarakat Kudus yang saat itu masih beragama Hindu agar masuk ke masjid untuk mendengarkan ceramah yang disampaikan dengan menggunakan potongan Surah Al-Baqarah yang berarti sapi betina sebagai materi dakwah.</p>\r\n\r\n<p>Sunan Kudus juga menghimbau kepada kaum muslim agar tidak menyembelih dan memakan daging sapi. Sebab, umat Hindu memuliakan sapi sebagai salah satu hewan suci. Himbauan tersebut berbuah simpati dari umat Hindu dan bersedia masuk Islam. Tidak hanya itu, Sunan Kudus juga memanfaatkan wayang golek sebagai medium dakwah dan membangun Menara Kudus yang menyerupai pura berarsitektur Hindu. Masudi menyebut apa yang diupayakan Sunan Kudus bagian dari semangat tauhidi bernafaskan egalitarianisme. Tidak menempatkan Islam sebagai agama superior.</p>\r\n\r\n<blockquote>\r\n<p>Pada akhirnya Sunan Kudus melakukan islamisasi di Kudus tanpa mengupayakannya dengan cara kekerasan secara fisik maupun kekerasan secara budaya, sehingga umat Hindu di Kudus tidak merasakan Islam sebagai sebuah ancaman yang menakutan yang bersifat memberhangus kepada&nbsp;<em>liyan.</em></p>\r\n</blockquote>\r\n\r\n<p>Kini, nilai-nilai yang sudah lama ditanamkan oleh Sunan Kudus masih terus berlangsung. Di antaranya seperti masyarakat Kudus tidak menyembelih sapi, sekalipun itu bertepatan pada momen besar seperti Iduladha. Bahkan kini Kudus yang sudah bercorak kota Islami dan termasuk bagian dari Kota Wali, masih terus mempertahankan dan melestarikan Menara Kudus sebagai tanda penyebaran Islam di Kudus.</p>\r\n\r\n<p>Selain Sunan Kudus, proses akulturasi pendekatan sufisme juga dilakukan oleh Sunan Kalijaga yang memanfaatkan wayang sebagai medium dakwah &mdash;termasuk menciptakan tembang syair Lir-Ilir yang memiliki nilai islami dan bermuatan ketauhidan sebagai tanda pengingat umat. Adapun Sunan Bonang yang memanfaatkan alat-alat musik tradisional seperti gamelan sebagai medium dakwah Islam agar mudah diterima dan menarik simpatik umat lain untuk mengenal Islam lebih mendalam.</p>\r\n\r\n<p><strong>Soekarno: Ber-Tuhan secara Berkebudayaan</strong></p>\r\n\r\n<p>Sebelum menjelaskan perspektif Soekarno dalam ber-Tuhan, Aris mencoba mengurai bahwa terminologi Tuhan mulai dimunculkan oleh Melchior Leijdecker, seorang penginjil berkebangsaan Belanda yang di dalam Kitab Testamentvm Baharv yang berbahasa Inggris dan &nbsp;Belanda tertuliskan kata&nbsp;<em>Lord Jesus</em>. Tak satu pun tertulis sebagai&nbsp;<em>Lord God</em>&nbsp;sebagaimana kemudian belakangan Jesus diasosiasikan sebagai bagian dari Tuhan.</p>\r\n\r\n<p>Leijdecker yang pernah mendatangi Indonesia 1675 sebagai pendeta militer Belanda sempat menerjemahkan&nbsp;<em>Lord&nbsp;</em>menjadi Tuan atau bermakna sebagai seorang yang memiliki kedudukan. Ini karena ketekunannya meneliti naskah-naskah Alkitab dalam bahasa aslinya &mdash;termasuk bagaimana Leijdecker menelusuri kata dan istilah dalam bahasa Melayu untuk proses mengalihbahasakan Alkitab agar mudah dipahami jamaahnya.</p>\r\n\r\n<p>Selanjutnya makna Tuan, oleh Abdullah bin Abdul Kadir Munsyi seorang sastrawan Melayu berubah menjadi Tuhan. Perubahan ini dikarenakan semakin lama makna Tuan mengalami proses transendensi yang bersifat keillahian, maka dalam penerjemahan Injil dapat ditemui kata Tuhan Bapak &mdash;terkadang disebut Tuhan Allah. Tuhan kemudian menemukan padanan kata sekaligus pemaknaanya sebagai bagian dari bahasa Melayu lama, sekali pun tradisi lisan sempat bertahan dengan penyebutan Tuan.</p>\r\n\r\n<p>Dalam penafsiran Aris, ber-Tuhan dengan huruf T besar perspektif Soekarno tidaklah dimaknai secara eskatologis, melainkan pemaknaan secara politis dan berkebudayaan meskipun tidak bermaksud mereduksi makna kandungan keillahian di dalamnya. Langkah politis ini bagian dari mengoperasionalkan terminologi Tuhan agar dapat diterima semua kalangan sebagai bentuk kompromis kepada umat selain agama Islam dan aliran kepercayaan yang keberatan penyebutan Allah sebagai Tuhan.</p>\r\n\r\n<blockquote>\r\n<p>Dalam konteks tersebut, Soekarno ingin menekankan bagaimana beragama dan ber-Tuhan secara leluasa dengan kata kunci ber-Tuhan secara berkebudayaan dengan maksud menanggalkan egoisme dalam beragama. Caranya adalah bagaimana memunculkan sikap penghargaan antara manusia satu dengan yang lainnya sebagai takdir perbedaan yang tidak bisa dielakkan.</p>\r\n</blockquote>\r\n\r\n<p>Gagasan ber-Tuhan dan berkebudayaan tentunya tidak bisa dipisahkan dengan momentum pidato Pancasila pada 1 Juni 1945 dengan ajakan untuk ber-Tuhan kepada seluruh rakyat Indonesia. Walau kemudian Soekarno memunculkan pertanyaan, &ldquo;Kita ber-Tuhan seperti apa di dalam konteks masyarakat majemuk?&rdquo; Sebuah pertanyaan besar yang bagi Soekarno memunculkan jawaban yang sulit perihal tidak mudahnya mengelola kemajemukan rakyat Indonesia saat itu.</p>\r\n\r\n<p>Soekarno yang berkesempatan melakukan pidato PBB pada 30 September 1960 mengawali pidatonya dengan potongan Surah Al-Hujurat Ayat 13 yang berarti, secara garis besar adalah ajakan persatuan di atas perbedaan merupakan hasil kegelisahan manisfestasi pemikiran Soekarno pada pidato Pancasila pada 1 Juni sebelumnya.</p>\r\n\r\n<p>Menurut analisis Aris kepada tulisan-tulisan Soekarno terdapat ribuan kata kunci seperti kemanusiaan dan keadilan. Logika inti yang coba dibangun Soekarno adalah hubungan kemanusiaan sebagai pondasi hubungan dalam beragama. Ketika Soekarno menempatkan sila Ketuhanan pada sila kelima, berarti sekaligus menjalankan sila satu sampai empat yang bernilai profan &mdash;akan dengan sendirinya mendapat ridha dan ganjaran dari Tuhan. Kedalaman gagasan Soekarno soal Pancasila, tak menjadikan persoalan serius ketika sila Ketuhanan yang semula sila kelima berpindah pada sila pertama.</p>\r\n\r\n<p><strong>Konsep Ajaran dan Interkorelasi Budha-Hindu-Islam</strong></p>\r\n\r\n<p>Sebagaimana sebelumnya Soekarno menekankan ber-Tuhan dan berkebudayaan, Aris mencoba mengurai bahwa kebudayaan memiliki akar kata Budi yang berasal dari bahasa sansekerta yakni Bodhi. Dalam keyakinan Budha, terdapat konsep yang disebut dengan Bodhi Satva.</p>\r\n\r\n<p>Satva yang berarti makhluk, sedangkan Bodi dalam Budha berarti level penyerahan diri paling tinggi dengan mengikat nafsu yang dapat membuat rasa sengsara, seperti iri, dengki, berhasrat yang bukan hak, tidak mau kelintasan, suka menyesali dan lainnya. Dalam bahasa Arab pengartian Bodhi Satva setara dengan makna Insan Kamil. Dalam kitab-kitab agama Budha pun dapat ditemukan persamaan konsep-konsep Bodi Satva dengan konsep Insan Kamil.</p>\r\n\r\n<p>Secara spesifik patung Budha di Candi Borobudur yang dalam catatan pengelana muslim Ibnu Battuta menyebutnya sebagai kaum bersila. Posisi Budha yang bersila dapat diartikan menjadi tiga bagian; Pertama, bagian atas adalah kepala yang dimaknai aspek akal; Kedua, bagian tengah dari pangkal kepala sampai pinggang yang dimaknai aspek rasa; Ketiga, bagian bawah dari pinggang sampai kaki yang dimaknai sebagai aspek nasfu.</p>\r\n\r\n<p>Posisi Budha yang duduk bersila dengan cara menumpangkan kaki satu sama lain sehingga tidak bergerak dapat dimaknai sebagai pengekangan nafsu biologis. Siapa yang mengekang nafsu? Adalah bagian tengah yang terletak pada badan. Adapun kepala yang berarti akal sebagai tempat bermukimnya panca indra menjadi pintu masuk nafsu yang bersifat keduniawian (non biologis).</p>\r\n\r\n<p>Seseorang yang melawati fase perlawanan terhadap nafsu dapat pula kemudian disebut mencapai level Bodhi Satva atau Insan Kamil. Tujuannya adalah menyatu dengan tataran&nbsp;<em>Arupa Datu&nbsp;</em>yang berarti penyatuan yang wujud dan tiada. Pencapaian tersebut memiliki kesamaan seperti halnya konsep&nbsp;<em>Wahdlatul Wujud</em>.</p>\r\n\r\n<p>Persamaan konsep antara&nbsp;<em>Wahdlatul Wujud</em>&nbsp;dengan praktik bersila menuju Vodgi Satva dapat kemudian menjadi titik temu antara ajaran Budha dan Islam yang sufistik dalam proses akulturasi yang terjadi secara natural dengan tidak saling menegasikan satu sama lain. Konsekuensinya, agama Budha ataupun Hindu perlahan mengalami proses islamisasi secara halus &mdash;walau tidak bisa ditampik dalam selama proses tersebut berlangsung juga terdapat konflik dan pergesekkan namun tidak dalam berskala besar dan meluas .</p>\r\n\r\n<p>Pertemuan konsep ajaran tersebut yang berakhir pada transformasi kebudayaan juga dilatarbelakangi dengan kuatnya pemahaman dan implementasi ilmu tasawuf yang dibawa Wali Songo. Jumlah ulama yang tergabung dalam Wali Songo juga memiliki kesamaan dengan konsep ajaran Hindu tentang Dewa Sembilan.</p>\r\n\r\n<p>Kita juga bisa melihat bagaimana tradisi tumpengan &mdash;hasil transformasi kebudayaan yang masih berlangsung dan bertahan sejak sekian ratus tahun sampai sekarang. Baik itu yang dilakukan menjadi prasyarat utama ritus adat maupun keagamaan, juga sebagai pelengkap kegiatan masyarakat tradisionalis maupun masyarakat modern perkotaan sebagai wujud syukur kepada Tuhan &mdash;atas capaian dalam bentuk pemberian maupun dalam bentuk keselamatan dan kebahagiaan.</p>\r\n\r\n<p>Nasi tumpeng yang berbentuk kerucut juga dapat dimaknai memiliki nilai tauhid yang terletak pada posisi atas yang meruncing. Adapun nasi tumpeng yang semakin melebar ke bawah memiliki arti hubungan manusia &mdash;sebagai dasar nasi yang bermakna manusia.</p>\r\n\r\n<p>Sejak keberadaan nasi tumpeng dalam tradisi Hindu, tidak ditemui daging hewan sebagai pelengkap karena larangan umat Hindu memakan daging dalam setiap upacara keagamaan. Jadi hanya sayuran sebagai pelengkap yang mengelilingi nasi tumpeng disimbolkan sebagai hubungan manusia dengan alam.</p>\r\n\r\n<p>Secara keseluruhan dapat disimpulkan nasi kuning disimbolkan sebagai bentuk hubungan manusia dengan sesama manusia, manusia dengan alam, dan manusia dengan Tuhan. Tradisi nasi tumpeng yang masih bertahan inilah yang lebih mudah diterima kelompok Islam tradisionalis seperti Nahdlatul Ulama.</p>\r\n\r\n<p>Melanggengnya nasi tumpeng sebagai bagian dari tradisi, kata Aris, sebagai bentuk penerimaan sekaligus kesamaan konsep ajaran Budha, Hindu, dan Islam yang bernafaskan tasawuf falsafi&mdash;seperti halnya yang dilakukan Wali Songo dengan merangkul budaya dan agama sebagai entitas yang terpisahkan. Inilah yang sejalan dengan alam pikiran Soekarno dalam ber-Tuhan secara berkebudayaan adalah mengantisipasi sikap egoisme dalam beragama.</p>\r\n\r\n<blockquote>\r\n<p>Fanatisme agama yang terjadi belakangan ini disebabkan posisi agama yang terpeleset dari posisi semestinya yakni pada level rasa ke posisi identitas. Agama yang diletakkan pada posisi identitas lebih sering jatuh serendah-rendahnya karena terbakar sifat egoisme karena sifat alamiahnya yang mudah terbakar. Kala agama meresap sebagai rasa, ekspresi keagamaan lebih memiliki kecenderungan mudah terkendali sekaligus mendudukan agama dalam posisi yang terhormat.</p>\r\n</blockquote>\r\n\r\n<p><strong>Relasi Islam dengan Agama Setempat</strong></p>\r\n\r\n<p>Ketika sedang duduk bersila di Masjid Al-Azhar, punggung Andri Rosadi ditepuk oleh seorang temannya berbangsa Arab &mdash;lalu mengatakan, &ldquo;Kenapa cara dudukmu seperti orang Budha,&rdquo; kenang Andri saat menempuh S-1 Peradaban Islam di Universitas Al-Azhar, Kairo, Mesir.</p>\r\n\r\n<p>Bagi Andri, model duduk bersila sudah sering atau biasa dilakukan oleh orang-orang Asia Tenggara &mdash;meski kemudian dia menyadari bahwa duduk bersila tidak biasa dilakukan oleh orang-orang Arab. &ldquo;Andaikan Imam Syafii bangun dari tidurnya, mungkin hari ini dia akan mengubah banyak pendapatnya,&rdquo; kata Andri, mengutip Dekan Ushuluddin, Prof. Mukti Bayuni.</p>\r\n\r\n<p>Ungkapan tersebut merupakan bagian dari respon perubahan zaman yang menuntut adanya perubahan. Proses tersebut dapat dilalui dengan adanya dialog yang melibatkan antara kultur, konteks, dan lokalitas yang sudah sejak lama dipikirkan para ulama dan sarjana muslim &mdash;yang proses perubahannya mengalami keterbukaan sekaligus ketertutupan.</p>\r\n\r\n<p>Sebuah pertanyaan kemudian muncul, mungkinkah sejak awal keberadaan Islam merupakan bagian dari satu paket dari langit dalam bentuk Al-Quran yang mengandung originalitas yang tidak memiliki landasan historis dan kultural?</p>\r\n\r\n<blockquote>\r\n<p>Hipotesis inilah yang perlu dikonstruksi, sebagaimana ketika Andri, mengutip Jonathan P. Berkey dalam bukunya berjudul Proses Terbentuknya Islam (<em>The Formation of Islam</em>) yang menyebutkan bahwa Islam tidaklah muncul dalam sebuah ruang kosong. Sebab, Islam membutuhkan konteks sosial, historis, dan kultural untuk menerangkan defenisi konsep kenabian sebagai penerima risalah dan konsep keillahian sebagai pemberi risalah.</p>\r\n</blockquote>\r\n\r\n<p>Artinya proses akulturasi kepada Islam adalah sebuah gejala yang tidak bisa dipisahkan. Seperti halnya popularitas Islam di bawah kepemimpinan Nabi Muhammad juga bagian dari hasil evolusi sosial yang terus bergerak. Bagi Berkey, periode kegemilangan Islam tersebut adalah puncak kematangan yang melintasi batas wilayah karena keberpihakannya kepada nilai kemanusiaan sebagai landasan filosofisnya. Sehingga Islam mudah diterima di berbagai tempat dan berkembang selama ribuan tahun kemudian.</p>\r\n\r\n<p>Peran Islam dalam proses akulturasi, setidaknya tidak terlepas dari empat fungsi penting yang di antaranya: meneruskan, mengoreksi, memperkuat, dan menambah. Sebagai contoh, tradisi haji yang sudah ada sejak Nabi Ibrahim, sejak awal orang yang melakukan haji dengan tidak menggunakan pakaian dengan mengelilingi Kabah yang dipenuhi oleh ratusan berhala atau patung.</p>\r\n\r\n<p>Kehadiran Nabi Muhammad yang sekaligus membawa empat fungsi tersebut sebagai bagian proses akulturasi, sedikit banyak memberikan perubahan kepada tradisi haji yang dapat kita rasakan saat ini. Beberapa di antaranya seperti mengelilingi Kabah dengan bacaan dan pakaian ihram. Termasuk menghancurkan ratusan berhala yang sempat dipuja bangsa Arab saat itu. Dari peristiwa tersebut, setidaknya terdapat perubahan seperti yang salah dikoreksi, yang lemah diperkuat, yang baik diteruskan, dan yang kurang ditambahkan.</p>\r\n\r\n<p>Proses selektif tersebut menjadi bagian hubungan dialog antara agama dengan kultur lokal. Meminjam istilah yang digunakan oleh Dame Mary Douglas yang terbagi menjadi&nbsp;<em>pollutant, purity,&nbsp;</em>dan<em>&nbsp;danger.&nbsp;</em>Artinya langkah selektif yang kini lebih populer sebagai shahih dan bid&rsquo;ah tidak bisa disematkan secara brutal dengan mengingkari substansi Islam yang kemunculannya secara perlahan.</p>\r\n\r\n<p>Hal ini persis sebagaimana metode sufisme yang dibawa Wali Songo dalam mengajarkan dan menyebarkan Islam di Indonesia. Pada fase tersebut secara kebudayaan terjadi proses pengayaan dan pemiskinan secara sekaligus. Artinya, dialog akulturasi yang sedang berlangsung membawa konsekuensi akan adanya kultur yang dominan dan kultur subdominant yang terkikis karena kuatnya kultur yang dominan. Maka beragamnya varian Islam di setiap wilayah tertentu merupakan hasil dari evolusi secara sosial, historis, dan budaya yang saling beririsan dan saling berkaitan.</p>\r\n', 'Tidak terhitung ada berapa banyak jumlah tradisi kebudayaan yang ada di Indonesia karena saking kayanya keberagaman yang ada.', '', '012021', 1, 1, 15, NULL, 1611637200, 1611638506, 1613985087, 1, 1, 0, NULL, NULL, 17),
(2, 1, 1, 'Kegagalan Pembelajaran Jarak Jauh Murni karena Mental Pemalas', '', NULL, '<p>Terdampak di masa pandemi adalah sebuah keniscayaan, artinya tidak bisa tidak, semua orang adalah korban dalam pandemi. Seperti yang kita ketahui bahwa semua sektor terkena dampak, baik dalam jangka pendek maupun panjang. Semua sektor terdampak, termasuk sektor pendidikan, khususnya sekolah.</p>\r\n\r\n<p>Dalam perjalanannya, pendidikan tetap dilaksanakan meskipun dengan menggunakan pembelajaran jarak jauh atau disingkat PJJ.</p>\r\n\r\n<p>Ketika membincang PJJ, akan sangat mustahil jika kita tidak menghubungkannya dengan kritik dan keluhan, mulai dari kebutuhan kuota, kekuatan sinyal yang tidak memadahi, tidak memiliki gawai, mudah bosan, sampai kesulitan memahami materi.&nbsp;</p>\r\n\r\n<p>Kritik tersebut datang dari berbagai kalangan, mulai dari anak sekolah, emak-emak, bapak-bapak, sampai pedagang sayur keliling.</p>\r\n\r\n<p>PJJ memang isu yang selalu hangat dibahas di mana saja dan oleh siapa saja. Apalagi pada semester ini yang diramalkan akan menggunakan pembelajaran tatap muka, ternyata kembali menggunakan sistem pembelajaran jarak jauh.&nbsp;</p>\r\n\r\n<p>Hal ini menyebabkan banyak pihak khawatir dengan kualitas pendidikan di masa depan jika tetap menggunakan sistem ini. Namun, sepertinya kekhawatiran tersebut terlalu berlebihan.&nbsp;</p>\r\n\r\n<p>Memangnya sejak kapan sekolah benar-benar dirindukan? Bukankah sejak dulu sekolah adalah tempat yang mengganggu? bukankah sekolah adalah tempat yang membosankan? Sampai pelajaran yang paling ditunggu adalah pelajaran kosong.</p>\r\n\r\n<p>Seingat saya, sebelum pandemi sekolah selalu dikritik habis-habisan, entah dari metode, kurikulum, sarana prasarana, profesionalitas guru, sampai hukuman terhadap siswa.&nbsp;</p>\r\n\r\n<p>Namun ketika pandemi terjadi, dan sekolah harus menerapkan PJJ, tiba-tiba semua orang berlomba-lomba merindukan sekolah tatap muka. Seakan-akan beranggapan kalau pembelajaran tatap muka, maka pendidikan Indonesia akan sangat mencerdaskan kehidupan bangsa, warbiyasah.</p>\r\n\r\n<p>Ketika ada pernyataan kalau PJJ membuat peserta didik tidak terlalu memahami materi yang disampaikan, pertanyaan saya sederhana, apakah ketika pembelajaran normal mereka otomatis memahami materi? Bukankah ketika pembelajaran normal juga terjadi ketidakpahaman dan kebosanan? Bukankah hal tersebut selalu terjadi setiap tahun, bahkan sebelum pandemi?</p>\r\n\r\n<p>Lantas kenapa seakan-akan ketika ada anak yang tidak paham materi maka otomatis gara-gara pandemi? Ketika ada kesulitan dalam belajar maka pandemi yang disalahkan? Kenapa pandemi selalu dikambing hitamkan?</p>\r\n\r\n<p>Perlu diakui bersama bahwa ketidakefektifan PJJ bukan saja karena faktor eksternal, seperti sinyal, kuota, atau sebagainya. Namun juga diakibatkan oleh faktor internal, yaitu diri sendiri. Atau lebih tepatnya adalah kemalasan. Jadi faktor eksternal adalah salah satu, bukan satu-satunya. Dan faktor kedua dinilai cukup dominan pengaruhnya.</p>\r\n\r\n<p>Mengutip kalimat Mas Butet Kartaredjasa di salah satu video, ia mengatakan &ldquo;<em>Jangan beralasan karena covid-19 aku tidak berkarya, itu pernyataan yang tolol, karena jika anda beralasan seperti itu, itu karena Anda pemalas, murni pemalas</em>&rdquo;.</p>\r\n\r\n<p>Perkataan Mas Butet tersebut benar-benar lugas dan terkesan ganas dalam menanggapi keluhan tentang pandemi yang terjadi secara trengginas. Kalimat tersebut sedikit banyak menggedor-gedor dinding keangkuhan umat manusia yang selalu menyalahkan segala hal yang bukan tentang dirinya. Karena itu kalimat tersebut layak diberikan tepuk tangan yang meriah.</p>\r\n\r\n<p>Saya sendiri sangat setuju dengan kalimat Mas Butet di atas. Secara logika jika pandemi menghambat kreatifitas dan pemahaman, maka harusnya tidak ada lagi dong orang-orang yang bisa membuat karya di masa pandemi. Semua industri kreatif harusnya gulung tikar dan pindah menjadi peternak lele.</p>\r\n\r\n<p>Nyatanya industri kreatif tetap ada dan tetap hidup. Mereka menemukan cara berjalan masing-masing dan menyikapi pandemi dengan cara yang bijak. Kreatifitas memang tidak bisa dimatikan.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Kritik seenak perut tentang PJJ tentu saja adalah hal yang lucu. Bagaimana mungkin menyalahkan keadaan sedang dirinya malah berbaring nyaman di dekat jendela?</p>\r\n\r\n<p>Memang, kendala PJJ yang paling disuarakan adalah faktor sinyal dan kuota. Bagi yang tinggal di daerah susah sinyal, akan sangat layak dimaklumi ketika mengeluh, karena memang terdampak dan tidak bisa berbuat apa-apa. Namun, bagi kalian yang tinggal di daerah perkotaan tidak wajar untuk ikut-ikutan.</p>\r\n\r\n<p>Memangnya apa sih yang ingin mau dikeluhkan? Kalian kan tinggal di kota, harusnya bisa dong memakai subsidi dari pemerintah? Kan sinyal lancar. Atau kalau misal kuota habis, bukankah sangat mudah mencari wifi di daerah kota dengan bekal kopi satu cangkir?</p>\r\n\r\n<p>Yang ngomel-ngomel di media sosial jelas anak perkotaan, karena bagaimana mungkin yang tinggal di daerah susah sinyal bisa ngomel-ngomel di media sosial dengan sangat aktif dan trengginas? Lah wong sinyal saja susah kok.</p>\r\n\r\n<p>Darurat memang. Kedaruratan ini seharusnya menyadarkan kita bahwa masalah utama dalam pendidikan di Indonesia bukanlah kurikulum, metode, evaluasi, bahkan pandemi. Melainkan kemalasan yang masih dipegang erat-erat.</p>\r\n\r\n<p>Jadi yang harus diwaspadai dari pandemi pada bidang pendidikan bukan sistem pembelajarannya, melainkan sikap mental seorang pemalas. Dan pandemi bagaikan sasak tinju idaman bagi pemalas. Pandemi memang penyelamat orang-orang pemalas.</p>\r\n\r\n<p>Perlu diingat bahwa tidak ada yang menginginkan keadaan seperti ini, pandemi bukan pilihan, melainkan keterpaksaan, karena itu, ya mau gimana lagi. maka akan lebih bijak jika<strong>&nbsp;</strong>berhenti menyalahkan keadaan dan mencari solusi untuk beradaptasi dalam pandemi.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Panjang umur kesehatan!</p>\r\n', 'Terdampak di masa pandemi adalah sebuah keniscayaan, artinya tidak bisa tidak, semua orang adalah korban dalam pandemi. Seperti yang kita ketahui bahwa semua sektor terkena dampak, baik dalam jangka pendek maupun panjang.', 'kesehatan, belajar', '012021', 1, 1, 24, NULL, 1611637200, 1611640996, 1613985094, 1, 1, 0, NULL, NULL, 26);

-- --------------------------------------------------------

--
-- Table structure for table `tx_category`
--

CREATE TABLE `tx_category` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_category`
--

INSERT INTO `tx_category` (`id`, `title`, `label`, `sequence`, `description`, `time_line`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 'Informasi', '', 1, '-', 2, 1527784489, 1611640816, 1, 1, 0, NULL, NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tx_comment`
--

CREATE TABLE `tx_comment` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT 'author',
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `category_status` int(11) NOT NULL,
  `publish_status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_counter`
--

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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_counter`
--

INSERT INTO `tx_counter` (`id`, `counter`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
('SNA21', 21, 1612195184, 1613830732, NULL, NULL, 0, NULL, NULL, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tx_course`
--

CREATE TABLE `tx_course` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_course`
--

INSERT INTO `tx_course` (`id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Pendidikan Agama', 1, '', 1546140159, 1546140159, 1, 1, 0),
(2, 'Bahasa Indonesia', 2, '', 1546140247, 1546140247, 1, 1, 0),
(3, 'Bahasa Inggris', 3, '', 1546140260, 1546140260, 1, 1, 0),
(4, 'Matematika', 4, '', 1546140276, 1546140276, 1, 1, 0),
(5, 'IPA', 5, 'Mapel SMP, untuk penerimaan siswa di SMA', 1546140302, 1546140302, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_customer`
--

CREATE TABLE `tx_customer` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_dashblock`
--

CREATE TABLE `tx_dashblock` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `actions` text DEFAULT NULL,
  `weight` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_document`
--

CREATE TABLE `tx_document` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_document`
--

INSERT INTO `tx_document` (`id`, `title`, `quantity`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Fotocopy Kartu Keluarga', 3, NULL, 'lembar', 1550162526, 1550163487, 1, 1, 1),
(2, 'Fotocopy Ijazah', 3, NULL, '', 1550163607, 1550163607, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_educational_stage`
--

CREATE TABLE `tx_educational_stage` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_educational_stage`
--

INSERT INTO `tx_educational_stage` (`id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Tidak Sekolah', 1, '', 1551288428, 1551288428, 1, 1, 0),
(2, 'Putus SD', 2, '', 1551288440, 1551288440, 1, 1, 0),
(3, 'SD Sederajat', 3, '', 1551288452, 1551288452, 1, 1, 0),
(4, 'SMP Sederajat', 4, '', 1551288468, 1551288468, 1, 1, 0),
(5, 'SMA Sederajat', 5, '', 1551288479, 1551288479, 1, 1, 0),
(6, 'D1', 6, '', 1551288489, 1551288596, 1, 1, 1),
(7, 'D2', 7, '', 1551288505, 1551288598, 1, 1, 1),
(8, 'D3', 8, '', 1551288514, 1551288601, 1, 1, 1),
(9, 'D4', 9, '', 1551288529, 1551288605, 1, 1, 1),
(10, 'S1', 10, '', 1551288547, 1551288612, 1, 1, 1),
(11, 'S2', 11, '', 1551288560, 1551288614, 1, 1, 1),
(12, 'S3', 12, '', 1551288565, 1551288618, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tx_employment`
--

CREATE TABLE `tx_employment` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_employment`
--

INSERT INTO `tx_employment` (`id`, `title`, `description`, `sequence`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(2, 'Administrasi', '-', NULL, 1441114705, 1441114705, 1, NULL, NULL, NULL, NULL, 0),
(3, 'Guru', '-', NULL, 1441114738, 1441114738, 1, NULL, NULL, NULL, NULL, 0),
(4, 'Siswa', '-', NULL, 1441638718, 1441638718, 1, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_event`
--

CREATE TABLE `tx_event` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date_start` int(11) DEFAULT NULL,
  `date_end` int(11) DEFAULT NULL,
  `location` tinytext DEFAULT NULL,
  `content` text DEFAULT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_feature`
--

CREATE TABLE `tx_feature` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_feature`
--

INSERT INTO `tx_feature` (`id`, `title`, `icon`, `label`, `content`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 'Free customisation', '<i class=\"fa fa-gift\"></i>', '', '', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium', 1542433717, 1544972074, 1, 1, NULL, NULL, NULL, 3),
(2, '24 hour support', '<i class=\"fa fa-inbox\"></i>', '', '', 'Umum', 1542897527, 1544972115, 1, 1, NULL, NULL, NULL, 1),
(3, '10 GB Disckspace', '<i class=\"fa fa-globe\"></i>', NULL, NULL, 'Umum', 1544972511, 1544972511, 1, 1, NULL, NULL, NULL, 0),
(4, 'Cloud Storage', '<i class=\"fa fa-cloud-upload\"></i>', NULL, NULL, '-', 1544972537, 1544972537, 1, 1, NULL, NULL, NULL, 0),
(5, 'Online Protection', '<i class=\"fa fa-umbrella\"></i>', NULL, NULL, '-', 1544972560, 1544972560, 1, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_import_attribute`
--

CREATE TABLE `tx_import_attribute` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_import_attribute`
--

INSERT INTO `tx_import_attribute` (`id`, `import_data_id`, `title`, `column_index`, `conversion`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 1, 'id', 0, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(2, 1, 'category_id', 2, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(3, 1, 'author_id', 1, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(4, 1, 'title', 3, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(5, 1, 'cover', 4, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(6, 1, 'url', 5, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(7, 1, 'content', 6, 14, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(8, 1, 'description', 7, 14, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(9, 1, 'tags', 8, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(10, 1, 'publish_status', 9, 4, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(11, 1, 'pinned_status', 11, 4, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(12, 1, 'view_counter', 12, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(13, 1, 'rating', 13, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(14, 1, 'date_issued', 14, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(15, 1, 'created_at', 14, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(16, 1, 'updated_at', 15, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(17, 1, 'created_by', 16, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7),
(18, 1, 'updated_by', 17, 1, '', 1523769614, 1528653903, 1, 1, NULL, NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tx_import_data`
--

CREATE TABLE `tx_import_data` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_import_data`
--

INSERT INTO `tx_import_data` (`id`, `modul_type`, `title`, `row_start`, `row_end`, `file_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 17, 'blog.xlsx', 1, 100, 'SCcCrBw2APTWedwO6VJNZO4Hv8HXXTUf.xlsx', '-', 1523769614, 1528654029, 1, 1, NULL, NULL, NULL, 21);

-- --------------------------------------------------------

--
-- Table structure for table `tx_income`
--

CREATE TABLE `tx_income` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_income`
--

INSERT INTO `tx_income` (`id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Kurang dari Rp. 500,000', 1, '', 1551288972, 1551288972, 1, 1, 0),
(2, 'Rp. 500,000 - Rp. 999.999', 2, '', 1551289023, 1551289023, 1, 1, 0),
(3, 'Rp. 1.000.000 - Rp. 1.999.999', 3, '', 1551289058, 1551289058, 1, 1, 0),
(4, 'Rp. 2.000.000 - 4.999.999', 4, '', 1551289087, 1551289087, 1, 1, 0),
(5, 'Rp. 5.000.000 - Rp. 20.000.000', 5, '', 1551289120, 1551289120, 1, 1, 0),
(6, 'Lebih dari Rp. 20.000.000', 6, '', 1551289151, 1551289151, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_lookup`
--

CREATE TABLE `tx_lookup` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_lookup`
--

INSERT INTO `tx_lookup` (`id`, `title`, `token`, `category`, `sequence`, `editable`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 'NA', 'XNA', 'NA', 0, 0, 'Not Available', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'No', 'XNO', 'YesNo', 0, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 'Yes', 'YES', 'YesNo', 1, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'Private', 'PRI', 'PrivatePublic', 0, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Public', 'PBC', 'PrivatePublic', 1, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Draft', 'DRF', 'DraftPublish', 0, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Publish', 'PBH', 'DraftPublish', 1, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 'Approved', 'APR', 'Approval', 0, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Rejected', 'REJ', 'Approval', 1, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 'Pending', 'PEN', 'Approval', 2, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'Male', 'MLE', 'Gender', 0, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 'Female', 'FML', 'Gender', 1, 0, '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 'Blog', 'BLG', 'CommentCategory', 0, 0, '-', 1513358918, 1513358918, 1, 1, NULL, NULL, NULL, 0),
(14, 'Picture', 'PCT', 'CommentCategory', 1, 0, '-', 1513359156, 1513359156, 1, 1, NULL, NULL, NULL, 0),
(15, 'Kandung', 'CBL', 'ChildStatus', 0, 0, 'Biological Children', 1546698954, 1546698954, 1, 1, NULL, NULL, NULL, 0),
(16, 'Anak Tiri', 'STE', 'ChildStatus', 1, 0, '-', 1546699109, 1546699109, 1, 1, NULL, NULL, NULL, 0),
(17, 'Anak Angkat', 'ADP', 'ChildStatus', 2, 0, '-', 1546699143, 1546699143, 1, 1, NULL, NULL, NULL, 0),
(18, 'Darah A', 'BTA', 'BloodType', 0, 0, '', 1546699178, 1546700958, 1, 1, NULL, NULL, NULL, 1),
(19, 'Darah B', 'BTB', 'BloodType', 1, 0, '', 1546699201, 1546699201, 1, 1, NULL, NULL, NULL, 0),
(20, 'Darah AB', 'BTX', 'BloodType', 3, 0, '-', 1546700989, 1546700989, 1, 1, NULL, NULL, NULL, 0),
(21, 'Darah O', 'BTO', 'BloodType', 3, 0, '', 1546701060, 1546701060, 1, 1, NULL, NULL, NULL, 0),
(22, 'Ayah', 'TPF', 'TuitionPayer', 0, 0, '', 1546704275, 1546704275, 1, 1, NULL, NULL, NULL, 0),
(23, 'Ibu', 'TPM', 'TuitionPayer', 1, 0, '', 1546704291, 1546704291, 1, 1, NULL, NULL, NULL, 0),
(24, 'Wali', 'TPW', 'TuitionPayer', 2, 0, '', 1546704307, 1546704307, 1, 1, NULL, NULL, NULL, 0),
(25, 'Mandiri', 'TPD', 'TuitionPayer', 3, 0, '', 1546704325, 1546704325, 1, 1, NULL, NULL, NULL, 0),
(26, 'Negeri', 'SNT', 'SchoolStatus', 0, 0, '', 1546705966, 1546705966, 1, 1, NULL, NULL, NULL, 0),
(27, 'Swasta', 'SST', 'SchoolStatus', 1, 0, '', 1546705976, 1546705976, 1, 1, NULL, NULL, NULL, 0),
(28, 'Ayah', 'FFA', 'FamilyType', 0, 0, '', 1547820999, 1547820999, 1, 1, NULL, NULL, NULL, 0),
(29, 'Ibu', 'FMO', 'FamilyType', 1, 0, '', 1547821018, 1547821018, 1, 1, NULL, NULL, NULL, 0),
(30, 'Wali', 'FGU', 'FamilyType', 2, 0, '', 1547821089, 1547821089, 1, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_measure`
--

CREATE TABLE `tx_measure` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_measure`
--

INSERT INTO `tx_measure` (`id`, `title`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Per Tahun', '-', 1541603176, 1544973329, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tx_migration`
--

CREATE TABLE `tx_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_migration`
--

INSERT INTO `tx_migration` (`version`, `apply_time`) VALUES
('Da\\User\\Migration\\m000000_000001_create_user_table', 1507740966),
('Da\\User\\Migration\\m000000_000002_create_profile_table', 1507740968),
('Da\\User\\Migration\\m000000_000003_create_social_account_table', 1507740970),
('Da\\User\\Migration\\m000000_000004_create_token_table', 1507740972),
('Da\\User\\Migration\\m000000_000005_add_last_login_at', 1507740973),
('Da\\User\\Migration\\m000000_000006_add_two_factor_fields', 1514392155),
('m140506_102106_rbac_init', 1507741269),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1514392156);

-- --------------------------------------------------------

--
-- Table structure for table `tx_note`
--

CREATE TABLE `tx_note` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_note_type`
--

CREATE TABLE `tx_note_type` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_notification`
--

CREATE TABLE `tx_notification` (
  `id` bigint(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_occupation`
--

CREATE TABLE `tx_occupation` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_occupation`
--

INSERT INTO `tx_occupation` (`id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Tidak Bekerja', 1, '', 1551288660, 1551288660, 1, 1, 0),
(2, 'Nelayan', 2, '', 1551288665, 1551288665, 1, 1, 0),
(3, 'Petani', 3, '', 1551288694, 1551288694, 1, 1, 0),
(4, 'Peternak', 4, '', 1551288700, 1551288700, 1, 1, 0),
(5, 'PNS/TNI/Polri', 5, '', 1551288711, 1551288711, 1, 1, 0),
(6, 'Karyawan Swasta', 6, '', 1551288730, 1551288730, 1, 1, 0),
(7, 'Pedagang Kecil', 7, '', 1551288747, 1551288747, 1, 1, 0),
(8, 'Pedagang Besar', 8, '', 1551288756, 1551288756, 1, 1, 0),
(9, 'Wiraswasta', 9, '', 1551288865, 1551288865, 1, 1, 0),
(10, 'Wirausaha', 10, '', 1551288871, 1551288871, 1, 1, 0),
(11, 'Buruh', 11, '', 1551288877, 1551288877, 1, 1, 0),
(12, 'Pensiunan', 12, '', 1551288894, 1551288894, 1, 1, 0),
(13, 'Lain-lain', 13, '', 1551288901, 1551288901, 1, 1, 0),
(14, 'Meninggal Dunia', 2, '', 1581094008, 1581094008, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_office`
--

CREATE TABLE `tx_office` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_office`
--

INSERT INTO `tx_office` (`id`, `token`, `title`, `phone_number`, `fax_number`, `email`, `web`, `address`, `latitude`, `longitude`, `facebook`, `google_plus`, `instagram`, `twitter`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, '007', 'SMAN Modal Bangsa Arun', '0645 65 3247,3248,3249', '0645 65 3342 ', 'tu@smanmba.sch.id', 'https://smanmba.sch.id', 'Jl Bontang Komplek Perumahan PT. Perta Arun Gas', '5.210698', '97.056603', '', '', '', '', 'SMA Negeri Modal Bangsa Arun merupakan salah satu Sekolah Unggul di Provinsi Aceh dengan status Sekolah Negeri. Berakreditasi “A” dan selalu siap mengabdi untuk Nusa dan Bangsa, berkarya membangun Negara Indonesia dengan segenap jiwa dan raga.', 1430536627, 1613842968, 1, 1, 0, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tx_page`
--

CREATE TABLE `tx_page` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_page`
--

INSERT INTO `tx_page` (`id`, `page_type_id`, `title`, `sequence`, `description`, `content`, `view_counter`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 1, 'Pramuka', 0, '-', '<p><strong>Materi Pramuka</strong>&nbsp;kali ini sangat sederhana sekali, karena sahabat-sahabat pramuka di seluruh Nusantara pasti secara umum telah mengetahuinya, sehingga postingan kali ini hanya berfungsi sebagai feedback (umpan balik) dari ilmu-ilmu pramuka yang telah diketahui, khusus para pembina mungkin saja dapat memberikan masukkan sebagai penambahan relevansi yang lebih baik.</p>\r\n\r\n<p>Berikut Beberapa Kegiatan Pramuka yang ada berdasarkan golongan keanggotaan.</p>\r\n\r\n<p><img alt=\"\" src=\"/application/yii2-escyber13/backend/web/uploads/page/sBtOJi5RBka4Q40J.jpg\" style=\"height:265px; width:420px\" /></p>\r\n', 40, 1515915714, 1572536205, 1, NULL, NULL, NULL, NULL, 41);

-- --------------------------------------------------------

--
-- Table structure for table `tx_page_type`
--

CREATE TABLE `tx_page_type` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_page_type`
--

INSERT INTO `tx_page_type` (`id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 'Umum', 0, '-', 1515915159, 1515915159, 1, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_photo`
--

CREATE TABLE `tx_photo` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_pricing`
--

CREATE TABLE `tx_pricing` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_pricing_detail`
--

CREATE TABLE `tx_pricing_detail` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_product`
--

CREATE TABLE `tx_product` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_product_feature`
--

CREATE TABLE `tx_product_feature` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_product_feature`
--

INSERT INTO `tx_product_feature` (`id`, `product_id`, `feature_id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, NULL, 1, 'Free customisation', 1, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium', 1545841156, 1545841156, 1, 1, NULL, NULL, NULL, 0),
(2, NULL, 2, '24 hour support', 2, 'Umum', 1545841156, 1545841156, 1, 1, NULL, NULL, NULL, 0),
(3, NULL, 3, '10 GB Disckspace', 3, 'Umum', 1545841156, 1545841156, 1, 1, NULL, NULL, NULL, 0),
(4, NULL, 4, 'Cloud Storage', 4, '-', 1545841156, 1545841156, 1, 1, NULL, NULL, NULL, 0),
(5, NULL, 5, 'Online Protection', 5, '-', 1545841156, 1545841156, 1, 1, NULL, NULL, NULL, 0),
(6, NULL, 1, 'Free customisation', 1, 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium', 1545841390, 1545841390, 1, 1, NULL, NULL, NULL, 0),
(7, NULL, 2, '24 hour support', 2, 'Umum', 1545841390, 1545841390, 1, 1, NULL, NULL, NULL, 0),
(8, NULL, 3, '10 GB Disckspace', 3, 'Umum', 1545841390, 1545841390, 1, 1, NULL, NULL, NULL, 0),
(9, NULL, 4, 'Cloud Storage', 4, '-', 1545841390, 1545841390, 1, 1, NULL, NULL, NULL, 0),
(10, NULL, 5, 'Online Protection', 5, '-', 1545841390, 1545841390, 1, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_product_image`
--

CREATE TABLE `tx_product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_product_type`
--

CREATE TABLE `tx_product_type` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_product_type`
--

INSERT INTO `tx_product_type` (`id`, `title`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(3, 'Profile', '-', 1541603308, 1542895956, 1, 1, NULL, NULL, NULL, 1),
(4, 'Landing Page', '', 1542895974, 1542895974, 1, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_profile`
--

CREATE TABLE `tx_profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_profile`
--

INSERT INTO `tx_profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `timezone`, `bio`, `file_name`) VALUES
(1, 'Nanta Es', 'ombakrinai@gmail.com', '', 'd41d8cd98f00b204e9800998ecf8427e', 'Lhokseumawe', 'https://escyber.com/', NULL, '-', 'DBv6ptTbTKuTM6QtftkuLlQrikiL-3l9.JPG'),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tx_quote`
--

CREATE TABLE `tx_quote` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_ranking`
--

CREATE TABLE `tx_ranking` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_ranking`
--

INSERT INTO `tx_ranking` (`id`, `title`, `sequence`, `minimum`, `label`, `description`, `file_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'VIP', 1, 1, NULL, 'Reserved', NULL, 1532260395, 1532260395, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_religion`
--

CREATE TABLE `tx_religion` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_religion`
--

INSERT INTO `tx_religion` (`id`, `title`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Islam', '-', 1551289232, 1551289232, 1, 1, 0),
(2, 'Kristen Protestan', '-', 1551289249, 1551289249, 1, 1, 0),
(3, 'Kristen Katolik', '-', 1551289256, 1551289256, 1, 1, 0),
(4, 'Hindu', '-', 1551289265, 1551289265, 1, 1, 0),
(5, 'Budha', '-', 1551289271, 1551289271, 1, 1, 0),
(6, 'Konghucu', '', 1551289305, 1551289305, 1, 1, 0),
(7, 'Lainnya', '', 1551289340, 1551289340, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_residence`
--

CREATE TABLE `tx_residence` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_residence`
--

INSERT INTO `tx_residence` (`id`, `title`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Bersama Orang Tua', '-', 1551289378, 1551289378, 1, 1, 0),
(2, 'Bersama Wali', '-', 1551289383, 1551289383, 1, 1, 0),
(3, 'Kos', '-', 1551289389, 1551289389, 1, 1, 0),
(4, 'Asrama', '-', 1551289392, 1551289392, 1, 1, 0),
(5, 'Panti Asuhan', '', 1551289410, 1551289410, 1, 1, 0),
(6, 'Lainnya', '', 1551289415, 1551289415, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_semester`
--

CREATE TABLE `tx_semester` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_semester`
--

INSERT INTO `tx_semester` (`id`, `title`, `sequence`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Semester III', 1, '', 1548081285, 1581006816, 1, 1, 1),
(2, 'Semester IV', 2, '', 1548081380, 1581006820, 1, 1, 1),
(3, 'Semester V', 3, '', 1548081392, 1581006823, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tx_session`
--

CREATE TABLE `tx_session` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tx_social_account`
--

CREATE TABLE `tx_social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tx_staff`
--

CREATE TABLE `tx_staff` (
  `id` int(11) NOT NULL,
  `employment_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `initial` varchar(10) DEFAULT NULL,
  `identity_number` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `gender_status` int(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `active_status` int(11) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_staff`
--

INSERT INTO `tx_staff` (`id`, `employment_id`, `title`, `initial`, `identity_number`, `phone_number`, `gender_status`, `address`, `file_name`, `email`, `google_plus`, `instagram`, `facebook`, `twitter`, `active_status`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 3, 'Mikel Andrews', NULL, '1234567890', '081 888 990077', 11, 'Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.', 'N7YtH-CW-N6jM_KfA7MkD0xjdkc-ih75.jpg', 'mike@andrew.com', 'http://localhost/application/yii2-escyber13/web', 'http://localhost/application/yii2-escyber13/web', '', '', NULL, 'Kepala Sekolah', 1511799015, 1528212677, 1, 1, NULL, NULL, NULL, 4),
(2, 3, 'Natasha Kolnikova', NULL, '0987654321', '081 888 123456', 12, 'Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.', 'Q1_Irm4HnrUfUpTOqBy3fFTVs53PheWC.jpg', 'natasha@kolnikova', '', 'http://localhost/application/yii2-escyber13/web', 'http://localhost/application/yii2-escyber13/web', '', NULL, 'Guru Bahasa Indonesia', 1511799269, 1528212684, 1, 1, NULL, NULL, NULL, 1),
(3, 2, 'Sasha Elli', NULL, '1234509876', '081 222 44 5673', 12, 'Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.\r\n\r\n', 'scAZiivNNRAX10qPJ2SKlp-j0Mj2cxjm.jpg', 'sasha@eli', '', '', 'http://localhost/application/yii2-escyber13/web', 'http://localhost/application/yii2-escyber13/web', NULL, 'Staff Tata Usaha\r\n', 1511799388, 1528212692, 1, 1, NULL, NULL, NULL, 1),
(4, 3, 'Mariah Syifa Salsabila', NULL, '', '', 12, '', 'S4E9kdOToKDBpOEu48WuVy30FAHtEAFu.jpg', '', '', '', '', '', NULL, 'MBA 16', 1528136205, 1528212705, 1, 1, NULL, NULL, NULL, 2),
(5, 4, 'Nadia Alvya Djaelani', NULL, '', '', 12, '', 'W_kwgD0egzTWi9p3eUBmQJ1FzjoC5p3p.jpg', '', '', '', '', '', NULL, 'MBA 16', 1528136224, 1528212711, 1, 1, NULL, NULL, NULL, 2),
(6, 3, 'Mariah Syifa Salsabila', NULL, '', '', 12, '', 'WJ7oJTzE73ZUPq84gKeY1uVAvXWdrX5-.jpg', '', '', '', '', '', NULL, '', 1528284554, 1528284554, 1, 1, NULL, NULL, NULL, 0),
(7, 4, 'Nadia Alvya Djaelani', NULL, '', '', 12, '', 'J_fLwzZqUx55Bu0pQwI7kC2c4zb9sWej.jpg', '', '', '', '', '', NULL, '', 1528284575, 1528284575, 1, 1, NULL, NULL, NULL, 0),
(8, 2, 'Nadia Alvya Djaelani', NULL, '', '', 12, '', 'gDzMxRbgqp1tIM_k7vMaqq4vS4C32A7k.jpg', '', '', '', '', '', NULL, '', 1528284593, 1528284593, 1, 1, NULL, NULL, NULL, 0),
(9, 3, 'Nadia Alvya Djaelani', NULL, '', '', 12, '', '0R8GiqO77fW8M9uvVLY-aZQgDQyuFWPb.jpg', '', '', '', '', '', NULL, '', 1528284611, 1528284611, 1, 1, NULL, NULL, NULL, 0),
(10, 4, 'Nadia Alvya Djaelani', NULL, '', '', 12, '', 'A_hdpW-_RlRynqaaVyXBaN_1rQF3T2eP.jpg', '', '', '', '', '', NULL, '', 1528284633, 1528284633, 1, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_subscriber`
--

CREATE TABLE `tx_subscriber` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `active_status` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tx_tag`
--

CREATE TABLE `tx_tag` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(150) NOT NULL,
  `frequency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tx_tag`
--

INSERT INTO `tx_tag` (`id`, `tag_name`, `frequency`) VALUES
(1, 'kesehatan', 1),
(2, 'belajar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tx_theme`
--

CREATE TABLE `tx_theme` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_theme`
--

INSERT INTO `tx_theme` (`id`, `title`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 'Global', 'Dipakai di semua halaman', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(2, 'Lawyer', 'Unify263 Lawyer One Page', 2147483647, 2147483647, 1, 0, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tx_theme_detail`
--

CREATE TABLE `tx_theme_detail` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_theme_detail`
--

INSERT INTO `tx_theme_detail` (`id`, `theme_id`, `title`, `token`, `content`, `file_name`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`) VALUES
(1, 1, 'Logo 1', '001', '<p>b3MYTwJeYCkb4IUmLrPkjcePntzALUBi.png</p>\r\n', 'OD-opEXwJE2WOlFcfEqGOP_CDbNfuTmm.jpg', 'Logo 1 - Bagian Atas Kiri', 2147483647, 1613491000, 1, 1, 0, NULL, NULL, 3),
(2, 1, 'Logo 2', '002', 'q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png', NULL, 'Logo 2 - Bagian Bawah Kiri', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(3, 1, 'Profile', '005', '/uploads/web/img5985a8c7b0133.jpg', NULL, '0', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(4, 1, 'Deskripsi Bawah', '006', '', NULL, '-', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(5, 1, 'Footer Links', '007', '<ul>\r\n	<li><a href=\"http://www.escyber.com\">www.escyber.com</a></li>\r\n</ul>\r\n', NULL, NULL, 1515422835, 1515422835, 1, 1, NULL, NULL, NULL, 0),
(6, 1, 'TERMS', '008', 'CONTENT OF TERM', NULL, 'DESCRIPTION OF TERM.', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(7, 1, 'ABOUT', '009', 'CONTENT OF ABOUT', NULL, 'DESCRIPTION OF ABOUT.', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(8, 1, 'SEO Description', '011', NULL, NULL, 'SEO Description', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(9, 1, 'SEO Keyword', '012', NULL, NULL, 'SEO Keyword', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(10, 1, 'Logo Report 1', '016', 'b3MYTwJeYCkb4IUmLrPkjcePntzALUBi.png', 'wYsHtSPP6i77jbMk05ddv74dCSY07bAm.png', 'Logo 1 - Bagian Atas Kiri', 2147483647, 1613982674, 1, 1, 0, NULL, NULL, 1),
(11, 1, 'Logo Report 2', '017', 'q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png', '4ATL_2Nwq6oZyPnr8GbFNQHEtVrzskfZ.png', 'Logo Bagian Kanan Report', 2147483647, 1613982596, 1, 1, 0, NULL, NULL, 2),
(12, 1, 'Deskripsi Report', '018', 'q8Z7e_TqQrBwU8URdcZ4I7t62u3-EHCm.png', NULL, 'DESKRIPSI', 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(13, 1, 'Facebook', '021', '<i class=\"fa fa-facebook\"></i>', NULL, NULL, 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(14, 1, 'Skype', '022', '<i class=\"fa fa-skype\"></i>', NULL, NULL, 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(15, 1, 'Google Plus', '023', '<i class=\"fa fa-google-plus\"></i>', NULL, NULL, 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(16, 1, 'Linkedin', '024', '<i class=\"fa fa-linkedin\"></i>', NULL, NULL, 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(17, 1, 'Pinterest', '025', '<i class=\"fa fa-pinterest\"></i>', NULL, NULL, 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(18, 1, 'Twitter', '026', '<i class=\"fa fa-twitter\"></i>', NULL, NULL, 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(19, 1, 'Dribbble', '027', '<i class=\"fa fa-dribbble\"></i>', NULL, NULL, 2147483647, 2147483647, 1, 1, NULL, NULL, NULL, 0),
(20, 2, 'Image Main', '201', '<p>IMG</p>\r\n', 'Av69ZGCDAvQ0l5yi6toEN15MBi-0kBbZ.JPG', 'IMAGE Ukuran 1600x1066', 2147483647, 1611423810, 1, 1, 0, NULL, NULL, 1),
(21, 2, 'Promo Text 1', '202', 'Penerimaan Siswa Baru\r\n', NULL, 'PROMO 1 - HEADER', 2147483647, 1613840010, 1, 1, 0, NULL, NULL, 2),
(22, 2, 'Promo Text 2', '203', '<p>Melaksanakan pendidikan umum yang bersinergi dengan agama.<br />\r\nMembentuk intelektual berintegritas dan mampu<br />\r\nmenghadapi tantangan hidup</p>\r\n', NULL, 'PROMO 2 - DESKRIPSI', 2147483647, 1613840262, 1, 1, 0, NULL, NULL, 3),
(23, 2, 'Visi', '204', '<p>Terselenggaranya pendidikan yang dapat menghasilkan intelektual muslim yang berkualitas, berintegritas tinggi, serta mampu menghadapi tantangan hidup yang semakin kompleks.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '12OM0av6ZSOC1dt8LKq0r74RnBr88U8_.JPG', 'ABOUT 1 / Image 1200x800', 2147483647, 1613984667, 1, 1, 0, NULL, NULL, 10),
(24, 2, 'Kurikulum', '205', '<p>SMAN Modal Bangsa Arun melaksanakan Program Reguler, Program Plus, dan Pengembangan Diri. Semua program dikemas dan diarahkan untuk&nbsp;proses belajar dalam keadaan nyaman.</p>\r\n', 'yRJWDN0o3NnJjlGFDvrOPJcZ-RjtoCSH.JPG', 'ABOUT 2 / Image 1200x800', 2147483647, 1613984222, 1, 1, 0, NULL, NULL, 5),
(25, 2, 'Fasilitas', '206', '<p>Fasilitas yang tersedia untuk mendukung proses belajar mengajar adalah ruang kelas dan asrama ber-AC, lapangan serbaguna, gedung olahraga, gedung auditorium, laboratorium IPA (Fisika, Kimia, Biologi), laboratorium bahasa, laboratorium komputer, musolla putra dan putri.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '16oLbEgpcrczEbHC0d82scw-5kgonxGT.JPG', 'ABOUT 3 / Image 1200x800', 2147483647, 1613984549, 1, 1, 0, NULL, NULL, 5),
(26, 2, 'Narahubung', '207', '<p>Setiap calon siswa harus melengkapi data secara online. Jika terdapat kendala, silahkan menghubungi salah satu dari narahubung yang tertera.</p>\r\n\r\n<p>Sebelum mulai pengisian data, pastikan dokumen seperti Kartu Keluarga, Akte Kelahiran, dan Raport Sekolah tersedia agar pengisian berjalan lancar dan mencapai indikator 100%.</p>\r\n', NULL, 'TEAM - Header dan Deskripsi', 2147483647, 1613984893, 1, 1, 0, NULL, NULL, 4),
(27, 2, 'Helmi Dedi Wartana, S. Pd', '208', '<p>0813 6052 0101</p>\r\n', 'dA9K8UrK07hs-IXO6rsP94m-82gln5ZL.jpg', 'Ketua Panitia', 2147483647, 1613985721, 1, 1, 0, NULL, NULL, 3),
(28, 2, 'Emi Hasnita, ST', '209', '<p>0852 6004 5522</p>\r\n', 'JjEQMOkBTOd1ukXYDp7uP3YPMqbLbKJK.jpg', 'Sekretaris', 2147483647, 1613985730, 1, 1, 0, NULL, NULL, 3),
(29, 2, 'Drs. Mahdani Usman', '210', '<p>0853 7385 3222</p>\r\n', 'GOHHd_gHcuJGi1d7eGSP1z_bGbH2KyeJ.jpg', 'Waka Kesiswaan', 2147483647, 1613985712, 1, 1, 0, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tx_token`
--

CREATE TABLE `tx_token` (
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_token`
--

INSERT INTO `tx_token` (`user_id`, `code`, `type`, `created_at`) VALUES
(1, 'XxnfcSJhSl93g2OskP24qV-XBKvNS9bj', 0, 1507741399),
(22, 'YfZwg0RrY6taKsvGdys9tWPVdF2j6nuO', 0, 1613544772),
(23, 'FVvHbN3eEt5P9lLqtvm9XndBgcW81Tt8', 0, 1613544992),
(25, 'S2hIRhS0NGzT3ETMs_j280cYJshKLS_x', 0, 1613603282),
(31, '_Rg2xrSbHHoR_KQ6UZ2KhrFCUi5QOQnC', 0, 1613830732);

-- --------------------------------------------------------

--
-- Table structure for table `tx_transportation`
--

CREATE TABLE `tx_transportation` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_transportation`
--

INSERT INTO `tx_transportation` (`id`, `title`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `verlock`) VALUES
(1, 'Jalan Kaki', '', 1551289447, 1551289447, 1, 1, 0),
(2, 'Kendaraan Pribadi', '', 1551289453, 1551289453, 1, 1, 0),
(3, 'Kendaraan Umum', '', 1551289458, 1551289458, 1, 1, 0),
(4, 'Jemputan Sekolah', '', 1551289469, 1551289469, 1, 1, 0),
(5, 'Kereta Api', '', 1551289474, 1551289474, 1, 1, 0),
(6, 'Ojek', '', 1551289491, 1551289491, 1, 1, 0),
(7, 'Andong', '', 1551289503, 1551289503, 1, 1, 0),
(8, 'Perahu', '', 1551289508, 1551289508, 1, 1, 0),
(9, 'Lainnya', '', 1551289510, 1551289510, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_user`
--

CREATE TABLE `tx_user` (
  `id` int(11) NOT NULL,
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
  `auth_tf_enabled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_user`
--

INSERT INTO `tx_user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `unconfirmed_email`, `registration_ip`, `flags`, `confirmed_at`, `blocked_at`, `updated_at`, `created_at`, `last_login_at`, `auth_tf_key`, `auth_tf_enabled`) VALUES
(1, 'admin', 'ombakrinai@gmail.com', '$2y$12$exl6mG/cWOt.DgoW11kiKuRkPKvQ/iYFNj.6FlwHLNtk3IYq8GmoO', 'JpJ77Y4v9Ffj8zN5lLGb2WN9-sotAgUx', NULL, '::1', 0, 1525156961, NULL, 1527960555, 1507741399, 1613985641, NULL, 0),
(21, 'zaphiraviolaa@gmail.com', 'zaphiraviolaa@gmail.com', '$2y$12$U2imbvPxPWcM96waGY1wRu4YwhdSpMJjVzeSm9GjNAHXS3Och9Uz2', 'eHPOrYLWCcgoaIOHv1fKlBbr2KMF6DZO', NULL, '36.71.138.205', 0, 1613196875, NULL, 1613195914, 1613195914, NULL, NULL, 0),
(22, 'nizamullahmuchtar1974@gmail.com', 'nizamullahmuchtar1974@gmail.com', '$2y$12$FOZ.aHd2msDvac.shq8FvO8yYFrr0OP8FfR.xDlCgtaIpIeQBrl7S', 'vKRnlSFfYupbCnXypMBGxZ283aR-NB6s', NULL, '36.71.138.24', 0, NULL, NULL, 1613544140, 1613544140, NULL, NULL, 0),
(23, 'Raihanrizqi@gmail.com', 'Raihanrizqi@gmail.com', '$2y$12$U0nHA89tc3QNcrEpoi9Z5.N9zxyKd9Yp.rUfcw7jdvFNi8rUctSWC', 'im7mg7ZZQuMuPKoO3NUy3z-MPB9LVQLF', NULL, '118.97.151.41', 0, NULL, NULL, 1613544992, 1613544992, NULL, NULL, 0),
(24, 'ultraihan@gmail.com', 'ultraihan@gmail.com', '$2y$12$4ujVzzPUG1iqiqBRdBEHmuc0m/62wo62bI.ffRHtJStzNhu81i3gO', '7Ko_RyOMVz4-jV7Eo9XP6-xd4cDrnPBl', NULL, '118.97.151.41', 0, 1613547757, NULL, 1613547482, 1613547482, 1613553936, NULL, 0),
(25, 'sandsx@gmail.com', 'sandsx@gmail.com', '$2y$12$fnp9gylEWlAGuI3PiBYoKOxzZLjPOHp85XRtLno355xQU8lRJt5B2', 'ShtV30Es1hNltfLpcPzucYyqV6AGf58Z', NULL, '103.124.137.50', 0, NULL, NULL, 1613603282, 1613603282, NULL, NULL, 0),
(31, 'kedipkedip@ymail.com', 'kedipkedip@ymail.com', '$2y$12$LKZRRdWIKJqSnx9.IAtVy..6z.XLAq0/DaPAef1c2Bgyd8U66YLWm', '38x5SRNhSzMhDoHDm11j7xdvEW1iT5ha', NULL, '180.241.45.156', 0, 1613837715, NULL, 1613830732, 1613830732, 1613837896, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tx_village`
--

CREATE TABLE `tx_village` (
  `id` int(11) NOT NULL,
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
  `verlock` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tx_academic_year`
--
ALTER TABLE `tx_academic_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_album`
--
ALTER TABLE `tx_album`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_name_UNIQUE` (`title`),
  ADD KEY `FK_tx_album_type` (`album_type`);

--
-- Indexes for table `tx_applicant`
--
ALTER TABLE `tx_applicant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_applicant_user` (`user_id`),
  ADD KEY `FK_tx_applicant_citizenship` (`citizenship_status`),
  ADD KEY `FK_tx_applicant_religion` (`religion_id`),
  ADD KEY `FK_tx_applicant_gender` (`gender_status`),
  ADD KEY `FK_tx_applicant_blood_type` (`blood_type`),
  ADD KEY `FK_tx_applicant_child_status` (`child_status`);

--
-- Indexes for table `tx_applicant_almamater`
--
ALTER TABLE `tx_applicant_almamater`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_applicant_almamater` (`applicant_id`),
  ADD KEY `FK_tx_applicant_almamater_school_status` (`school_status`),
  ADD KEY `FK_tx_applicant_almamater_educational_stage` (`educational_stage_id`),
  ADD KEY `FK_tx_applicant_almamater_transportation` (`transportation_id`),
  ADD KEY `FK_tx_applicant_almamater_residence` (`residence_id`);

--
-- Indexes for table `tx_applicant_document`
--
ALTER TABLE `tx_applicant_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_applicant_document_applicant` (`applicant_id`),
  ADD KEY `FK_tx_applicant_document_document` (`document_id`),
  ADD KEY `FK_tx_applicant_document_lookup_status` (`document_status`);

--
-- Indexes for table `tx_applicant_family`
--
ALTER TABLE `tx_applicant_family`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_applicant_family` (`applicant_id`),
  ADD KEY `FK_tx_applicant_family_type` (`family_type`),
  ADD KEY `FK_tx_applicant_family_income` (`income_id`),
  ADD KEY `FK_tx_applicant_family_religion` (`religion_id`),
  ADD KEY `FK_tx_applicant_family_occupation` (`occupation_id`),
  ADD KEY `FK_tx_applicant_family_citizenship` (`citizenship_status`),
  ADD KEY `FK_tx_applicant_family_educational_stage` (`educational_stage_id`);

--
-- Indexes for table `tx_applicant_grade`
--
ALTER TABLE `tx_applicant_grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_applicant_grade_semester` (`semester_id`),
  ADD KEY `FK_tx_applicant_grade_course` (`course_id`),
  ADD KEY `FK_tx_applicant_grade_applicnat` (`applicant_id`);

--
-- Indexes for table `tx_applicant_standing`
--
ALTER TABLE `tx_applicant_standing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_applicant_standing_applicant` (`applicant_id`),
  ADD KEY `FK_tx_applicant_standing_final` (`final_status`),
  ADD KEY `FK_tx_applicant_standing_approval` (`approval_status`);

--
-- Indexes for table `tx_archive`
--
ALTER TABLE `tx_archive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_area`
--
ALTER TABLE `tx_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_author`
--
ALTER TABLE `tx_author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_author_user` (`user_id`);

--
-- Indexes for table `tx_auth_assignment`
--
ALTER TABLE `tx_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `tx_auth_item`
--
ALTER TABLE `tx_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `tx_auth_item_child`
--
ALTER TABLE `tx_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `tx_auth_rule`
--
ALTER TABLE `tx_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tx_blog`
--
ALTER TABLE `tx_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_blog_author` (`author_id`),
  ADD KEY `FK_tx_blog_category` (`category_id`),
  ADD KEY `FK_tx_blog_publish` (`publish_status`),
  ADD KEY `FK_tx_blog_pinned` (`pinned_status`);

--
-- Indexes for table `tx_category`
--
ALTER TABLE `tx_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_UNIQUE` (`title`),
  ADD KEY `FK_tx_category_time_line` (`time_line`);

--
-- Indexes for table `tx_comment`
--
ALTER TABLE `tx_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_comment_content` (`blog_id`),
  ADD KEY `FK_tx_comment_lookup` (`publish_status`),
  ADD KEY `FK_tx_comment_category` (`category_status`);

--
-- Indexes for table `tx_counter`
--
ALTER TABLE `tx_counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_course`
--
ALTER TABLE `tx_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_customer`
--
ALTER TABLE `tx_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_number_UNIQUE` (`customer_number`),
  ADD KEY `FK_tx_customer_area` (`area_id`),
  ADD KEY `FK_tx_customer_village` (`village_id`),
  ADD KEY `FK_tx_customer_gender_lookup` (`gender_status`);

--
-- Indexes for table `tx_dashblock`
--
ALTER TABLE `tx_dashblock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_document`
--
ALTER TABLE `tx_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_educational_stage`
--
ALTER TABLE `tx_educational_stage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_employment`
--
ALTER TABLE `tx_employment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_title_name_UNIQUE` (`title`);

--
-- Indexes for table `tx_event`
--
ALTER TABLE `tx_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_feature`
--
ALTER TABLE `tx_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_product_feature_index` (`id`);

--
-- Indexes for table `tx_import_attribute`
--
ALTER TABLE `tx_import_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_import_attribute_import` (`import_data_id`);

--
-- Indexes for table `tx_import_data`
--
ALTER TABLE `tx_import_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_income`
--
ALTER TABLE `tx_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_lookup`
--
ALTER TABLE `tx_lookup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_UNIQUE` (`token`);

--
-- Indexes for table `tx_measure`
--
ALTER TABLE `tx_measure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_migration`
--
ALTER TABLE `tx_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tx_note`
--
ALTER TABLE `tx_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_note_note_type` (`note_type_id`),
  ADD KEY `FK_tx_note_staff` (`staff_id`);

--
-- Indexes for table `tx_note_type`
--
ALTER TABLE `tx_note_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_notification`
--
ALTER TABLE `tx_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_notification_given_by` (`notify_from`),
  ADD KEY `FK_tx_notification_lookup` (`notification_type`),
  ADD KEY `FK_tx_notification_given_to` (`user_id`),
  ADD KEY `FK_tx_notification_approval` (`approval_status`);

--
-- Indexes for table `tx_occupation`
--
ALTER TABLE `tx_occupation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_office`
--
ALTER TABLE `tx_office`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_page`
--
ALTER TABLE `tx_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_page_page_type` (`page_type_id`);

--
-- Indexes for table `tx_page_type`
--
ALTER TABLE `tx_page_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_photo`
--
ALTER TABLE `tx_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_photo_album` (`album_id`);

--
-- Indexes for table `tx_pricing`
--
ALTER TABLE `tx_pricing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_pricing_product` (`product_id`),
  ADD KEY `FK_tx_pricing_measure` (`measure_id`);

--
-- Indexes for table `tx_pricing_detail`
--
ALTER TABLE `tx_pricing_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_pricing_detail_pricing` (`pricing_id`),
  ADD KEY `FK_tx_pricing_detail_feature` (`feature_id`),
  ADD KEY `FK_tx_pricing_detail_lookup` (`available_status`);

--
-- Indexes for table `tx_product`
--
ALTER TABLE `tx_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_product_type` (`product_type_id`);

--
-- Indexes for table `tx_product_feature`
--
ALTER TABLE `tx_product_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_product_feature_feature` (`feature_id`),
  ADD KEY `FK_tx_product_feature_product` (`product_id`);

--
-- Indexes for table `tx_product_image`
--
ALTER TABLE `tx_product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_product_image_product` (`product_id`);

--
-- Indexes for table `tx_product_type`
--
ALTER TABLE `tx_product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_profile`
--
ALTER TABLE `tx_profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tx_quote`
--
ALTER TABLE `tx_quote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_ranking`
--
ALTER TABLE `tx_ranking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_religion`
--
ALTER TABLE `tx_religion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_residence`
--
ALTER TABLE `tx_residence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_semester`
--
ALTER TABLE `tx_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_session`
--
ALTER TABLE `tx_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_social_account`
--
ALTER TABLE `tx_social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  ADD UNIQUE KEY `idx_social_account_code` (`code`),
  ADD KEY `fk_social_account_user` (`user_id`);

--
-- Indexes for table `tx_staff`
--
ALTER TABLE `tx_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_staff_gender` (`gender_status`),
  ADD KEY `FK_tx_staff_role` (`employment_id`),
  ADD KEY `FK_tx_staff_active_status` (`active_status`);

--
-- Indexes for table `tx_subscriber`
--
ALTER TABLE `tx_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_subscriber_lookup` (`active_status`);

--
-- Indexes for table `tx_tag`
--
ALTER TABLE `tx_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_theme`
--
ALTER TABLE `tx_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `tx_theme_detail`
--
ALTER TABLE `tx_theme_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `layout_code_UNIQUE` (`token`),
  ADD KEY `FK_tx_content_theme` (`theme_id`);

--
-- Indexes for table `tx_token`
--
ALTER TABLE `tx_token`
  ADD UNIQUE KEY `idx_token_user_id_code_type` (`user_id`,`code`,`type`);

--
-- Indexes for table `tx_transportation`
--
ALTER TABLE `tx_transportation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_user`
--
ALTER TABLE `tx_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_username` (`username`),
  ADD UNIQUE KEY `idx_user_email` (`email`);

--
-- Indexes for table `tx_village`
--
ALTER TABLE `tx_village`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tx_village_area` (`area_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tx_academic_year`
--
ALTER TABLE `tx_academic_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_album`
--
ALTER TABLE `tx_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_applicant`
--
ALTER TABLE `tx_applicant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tx_applicant_almamater`
--
ALTER TABLE `tx_applicant_almamater`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tx_applicant_document`
--
ALTER TABLE `tx_applicant_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tx_applicant_family`
--
ALTER TABLE `tx_applicant_family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tx_applicant_grade`
--
ALTER TABLE `tx_applicant_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tx_applicant_standing`
--
ALTER TABLE `tx_applicant_standing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_archive`
--
ALTER TABLE `tx_archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_area`
--
ALTER TABLE `tx_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_author`
--
ALTER TABLE `tx_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_blog`
--
ALTER TABLE `tx_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_category`
--
ALTER TABLE `tx_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_comment`
--
ALTER TABLE `tx_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_course`
--
ALTER TABLE `tx_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_customer`
--
ALTER TABLE `tx_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_dashblock`
--
ALTER TABLE `tx_dashblock`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_document`
--
ALTER TABLE `tx_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_educational_stage`
--
ALTER TABLE `tx_educational_stage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tx_employment`
--
ALTER TABLE `tx_employment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tx_event`
--
ALTER TABLE `tx_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_feature`
--
ALTER TABLE `tx_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tx_import_attribute`
--
ALTER TABLE `tx_import_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tx_import_data`
--
ALTER TABLE `tx_import_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_income`
--
ALTER TABLE `tx_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tx_lookup`
--
ALTER TABLE `tx_lookup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tx_measure`
--
ALTER TABLE `tx_measure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_note`
--
ALTER TABLE `tx_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_note_type`
--
ALTER TABLE `tx_note_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_notification`
--
ALTER TABLE `tx_notification`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_occupation`
--
ALTER TABLE `tx_occupation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tx_office`
--
ALTER TABLE `tx_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_page`
--
ALTER TABLE `tx_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_page_type`
--
ALTER TABLE `tx_page_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_photo`
--
ALTER TABLE `tx_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_pricing`
--
ALTER TABLE `tx_pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_pricing_detail`
--
ALTER TABLE `tx_pricing_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_product`
--
ALTER TABLE `tx_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_product_feature`
--
ALTER TABLE `tx_product_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tx_product_image`
--
ALTER TABLE `tx_product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_product_type`
--
ALTER TABLE `tx_product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tx_profile`
--
ALTER TABLE `tx_profile`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tx_quote`
--
ALTER TABLE `tx_quote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_ranking`
--
ALTER TABLE `tx_ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tx_religion`
--
ALTER TABLE `tx_religion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tx_residence`
--
ALTER TABLE `tx_residence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tx_semester`
--
ALTER TABLE `tx_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tx_social_account`
--
ALTER TABLE `tx_social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_staff`
--
ALTER TABLE `tx_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tx_subscriber`
--
ALTER TABLE `tx_subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tx_tag`
--
ALTER TABLE `tx_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_theme`
--
ALTER TABLE `tx_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tx_theme_detail`
--
ALTER TABLE `tx_theme_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tx_transportation`
--
ALTER TABLE `tx_transportation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tx_user`
--
ALTER TABLE `tx_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tx_village`
--
ALTER TABLE `tx_village`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tx_applicant`
--
ALTER TABLE `tx_applicant`
  ADD CONSTRAINT `FK_tx_applicant_religion` FOREIGN KEY (`religion_id`) REFERENCES `tx_religion` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`);

--
-- Constraints for table `tx_applicant_almamater`
--
ALTER TABLE `tx_applicant_almamater`
  ADD CONSTRAINT `FK_tx_applicant_almamater` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_almamater_educational_stage` FOREIGN KEY (`educational_stage_id`) REFERENCES `tx_educational_stage` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_almamater_residence` FOREIGN KEY (`residence_id`) REFERENCES `tx_residence` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_almamater_transportation` FOREIGN KEY (`transportation_id`) REFERENCES `tx_transportation` (`id`);

--
-- Constraints for table `tx_applicant_document`
--
ALTER TABLE `tx_applicant_document`
  ADD CONSTRAINT `FK_tx_applicant_document_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_document_document` FOREIGN KEY (`document_id`) REFERENCES `tx_document` (`id`);

--
-- Constraints for table `tx_applicant_family`
--
ALTER TABLE `tx_applicant_family`
  ADD CONSTRAINT `FK_tx_applicant_family` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_family_educational_stage` FOREIGN KEY (`educational_stage_id`) REFERENCES `tx_educational_stage` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_family_income` FOREIGN KEY (`income_id`) REFERENCES `tx_income` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_family_occupation` FOREIGN KEY (`occupation_id`) REFERENCES `tx_occupation` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_family_religion` FOREIGN KEY (`religion_id`) REFERENCES `tx_religion` (`id`);

--
-- Constraints for table `tx_applicant_grade`
--
ALTER TABLE `tx_applicant_grade`
  ADD CONSTRAINT `FK_tx_applicant_grade_applicnat` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_grade_course` FOREIGN KEY (`course_id`) REFERENCES `tx_course` (`id`),
  ADD CONSTRAINT `FK_tx_applicant_grade_semester` FOREIGN KEY (`semester_id`) REFERENCES `tx_semester` (`id`);

--
-- Constraints for table `tx_applicant_standing`
--
ALTER TABLE `tx_applicant_standing`
  ADD CONSTRAINT `FK_tx_applicant_standing_applicant` FOREIGN KEY (`applicant_id`) REFERENCES `tx_applicant` (`id`);

--
-- Constraints for table `tx_author`
--
ALTER TABLE `tx_author`
  ADD CONSTRAINT `FK_tx_author_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`);

--
-- Constraints for table `tx_auth_assignment`
--
ALTER TABLE `tx_auth_assignment`
  ADD CONSTRAINT `tx_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tx_auth_item`
--
ALTER TABLE `tx_auth_item`
  ADD CONSTRAINT `tx_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `tx_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tx_auth_item_child`
--
ALTER TABLE `tx_auth_item_child`
  ADD CONSTRAINT `tx_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tx_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `tx_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tx_blog`
--
ALTER TABLE `tx_blog`
  ADD CONSTRAINT `FK_tx_blog_author` FOREIGN KEY (`author_id`) REFERENCES `tx_author` (`id`),
  ADD CONSTRAINT `FK_tx_blog_category` FOREIGN KEY (`category_id`) REFERENCES `tx_category` (`id`);

--
-- Constraints for table `tx_comment`
--
ALTER TABLE `tx_comment`
  ADD CONSTRAINT `FK_tx_comment_blog` FOREIGN KEY (`blog_id`) REFERENCES `tx_blog` (`id`),
  ADD CONSTRAINT `FK_tx_comment_category` FOREIGN KEY (`category_status`) REFERENCES `tx_lookup` (`id`),
  ADD CONSTRAINT `FK_tx_comment_publish` FOREIGN KEY (`publish_status`) REFERENCES `tx_lookup` (`id`);

--
-- Constraints for table `tx_customer`
--
ALTER TABLE `tx_customer`
  ADD CONSTRAINT `FK_tx_customer_area` FOREIGN KEY (`area_id`) REFERENCES `tx_area` (`id`),
  ADD CONSTRAINT `FK_tx_customer_village` FOREIGN KEY (`village_id`) REFERENCES `tx_village` (`id`);

--
-- Constraints for table `tx_import_attribute`
--
ALTER TABLE `tx_import_attribute`
  ADD CONSTRAINT `FK_tx_import_attribute_import` FOREIGN KEY (`import_data_id`) REFERENCES `tx_import_data` (`id`);

--
-- Constraints for table `tx_note`
--
ALTER TABLE `tx_note`
  ADD CONSTRAINT `FK_tx_note_staff` FOREIGN KEY (`staff_id`) REFERENCES `tx_staff` (`id`);

--
-- Constraints for table `tx_page`
--
ALTER TABLE `tx_page`
  ADD CONSTRAINT `FK_tx_page_page_type` FOREIGN KEY (`page_type_id`) REFERENCES `tx_page_type` (`id`);

--
-- Constraints for table `tx_photo`
--
ALTER TABLE `tx_photo`
  ADD CONSTRAINT `FK_tx_photo_album` FOREIGN KEY (`album_id`) REFERENCES `tx_album` (`id`);

--
-- Constraints for table `tx_pricing`
--
ALTER TABLE `tx_pricing`
  ADD CONSTRAINT `FK_tx_pricing_measure` FOREIGN KEY (`measure_id`) REFERENCES `tx_measure` (`id`),
  ADD CONSTRAINT `FK_tx_pricing_product` FOREIGN KEY (`product_id`) REFERENCES `tx_product` (`id`);

--
-- Constraints for table `tx_pricing_detail`
--
ALTER TABLE `tx_pricing_detail`
  ADD CONSTRAINT `FK_tx_pricing_detail_feature` FOREIGN KEY (`feature_id`) REFERENCES `tx_feature` (`id`),
  ADD CONSTRAINT `FK_tx_pricing_detail_lookup` FOREIGN KEY (`available_status`) REFERENCES `tx_lookup` (`id`),
  ADD CONSTRAINT `FK_tx_pricing_detail_pricing` FOREIGN KEY (`pricing_id`) REFERENCES `tx_pricing` (`id`);

--
-- Constraints for table `tx_product`
--
ALTER TABLE `tx_product`
  ADD CONSTRAINT `FK_tx_product_type` FOREIGN KEY (`product_type_id`) REFERENCES `tx_product_type` (`id`);

--
-- Constraints for table `tx_product_feature`
--
ALTER TABLE `tx_product_feature`
  ADD CONSTRAINT `FK_tx_product_feature_feature` FOREIGN KEY (`feature_id`) REFERENCES `tx_feature` (`id`),
  ADD CONSTRAINT `FK_tx_product_feature_product` FOREIGN KEY (`product_id`) REFERENCES `tx_product` (`id`);

--
-- Constraints for table `tx_product_image`
--
ALTER TABLE `tx_product_image`
  ADD CONSTRAINT `FK_tx_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `tx_product` (`id`);

--
-- Constraints for table `tx_profile`
--
ALTER TABLE `tx_profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tx_social_account`
--
ALTER TABLE `tx_social_account`
  ADD CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tx_staff`
--
ALTER TABLE `tx_staff`
  ADD CONSTRAINT `FK_tx_staff_employment` FOREIGN KEY (`employment_id`) REFERENCES `tx_employment` (`id`);

--
-- Constraints for table `tx_subscriber`
--
ALTER TABLE `tx_subscriber`
  ADD CONSTRAINT `FK_tx_subscriber_lookup` FOREIGN KEY (`active_status`) REFERENCES `tx_lookup` (`id`);

--
-- Constraints for table `tx_theme_detail`
--
ALTER TABLE `tx_theme_detail`
  ADD CONSTRAINT `FK_tx_theme_detail_theme` FOREIGN KEY (`theme_id`) REFERENCES `tx_theme` (`id`);

--
-- Constraints for table `tx_token`
--
ALTER TABLE `tx_token`
  ADD CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `tx_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tx_village`
--
ALTER TABLE `tx_village`
  ADD CONSTRAINT `FK_tx_village_area` FOREIGN KEY (`area_id`) REFERENCES `tx_area` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
