-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.5-10.0.15-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for hrms
DROP DATABASE IF EXISTS `hrms`;
CREATE DATABASE IF NOT EXISTS `hrms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hrms`;


-- Dumping structure for table hrms.applicants
DROP TABLE IF EXISTS `applicants`;
CREATE TABLE IF NOT EXISTS `applicants` (
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `place_of_birth` varchar(50) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `nationality_val` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `computer_skills` varchar(500) DEFAULT NULL,
  `professional_skills` varchar(500) DEFAULT NULL,
  `applicants_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `letter` varchar(100) DEFAULT NULL,
  `contract1_start_date` datetime DEFAULT NULL,
  `contract1_end_date` datetime DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `job_position` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `principal_advisor` int(11) DEFAULT NULL,
  `financial_controller` int(11) DEFAULT NULL,
  `project_number` varchar(50) DEFAULT NULL,
  `team_leader` int(11) DEFAULT NULL,
  `project_location` varchar(50) DEFAULT NULL,
  `office_manager` int(11) DEFAULT NULL,
  `responsible_superior` int(11) DEFAULT NULL,
  `SAP_No` varchar(50) DEFAULT NULL,
  `working_time` int(11) DEFAULT NULL,
  `salary` varchar(300) DEFAULT NULL,
  `salary_band` varchar(5) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `no_working_exp` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants: ~6 rows (approximately)
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` (`first_name`, `last_name`, `place_of_birth`, `date_of_birth`, `gender`, `marital_status`, `nationality_id`, `nationality_val`, `address`, `country_id`, `country_name`, `province_id`, `city_id`, `post_code`, `phone1`, `phone2`, `computer_skills`, `professional_skills`, `applicants_id`, `user_id`, `cv`, `letter`, `contract1_start_date`, `contract1_end_date`, `job_title`, `job_position`, `project_name`, `principal_advisor`, `financial_controller`, `project_number`, `team_leader`, `project_location`, `office_manager`, `responsible_superior`, `SAP_No`, `working_time`, `salary`, `salary_band`, `title`, `no_working_exp`, `updated_by`, `created_at`, `updated_at`) VALUES
	('Susan', 'Aulia', 'Jakarta', '1985-12-19 00:00:00', 'Female', 'Single', 1, NULL, 'Jln. Padang', 1, NULL, 13, 72, '12345', '987651', '784561', 'Ms Word, Ms Excel', 'Research Skill', 1, 113, '.pdf', '.docx', '2015-05-01 00:00:00', '2015-07-31 00:00:00', 'Senior Manager', 'Head of Accounting', 'PAKLIM', 68, 69, '001-PAK', 69, 'Jakarta GIZ', 103, 69, 'SAP No', 100, 'fu2BMYe3RmyC27SAQ8kMv9pUNmy3dNNvySVFDH8euY+vtoE3c6oy7Q==', '2T', 'Ms.', NULL, 97, '2015-05-04 13:31:24', '2015-05-04 21:31:05'),
	('Bella', 'Nurul', 'Jakarta', '1986-04-15 00:00:00', 'Female', 'Single', 1, NULL, 'jakarta', 1, NULL, 31, 156, '11250', '12345', NULL, NULL, NULL, 2, 115, '.pdf', '.docx', '2015-05-05 00:00:00', '2015-06-30 00:00:00', 'Senior Advisor', 'Head of Accounting', 'PAKLIM', 125, 125, '001-PAK', 125, 'Jakarta GIZ', 125, 125, 'SAPhj', 100, 'ROZZu2jHSkmc++lPYfps3KckeSEajCpf4cLeRxXeWL7L+WGTJdi2nw==', '2T', 'Ms.', NULL, 97, '2015-05-04 16:24:29', '2015-05-05 09:01:16'),
	('Angga', 'Aditya', 'Semarang', '1989-01-01 00:00:00', 'Male', 'Married', 1, NULL, 'Salatiga', 1, NULL, 33, 209, '12345', '1578952132', NULL, NULL, NULL, 3, 116, NULL, NULL, '2015-05-01 00:00:00', '2015-07-31 00:00:00', 'Senior Manager', 'Head of Accounting', 'Nama-Sutri', 134, 125, '001', 125, 'Jakarta Nama-Sutri', 134, 134, 'abcde', 100, 'mEBLDxwzT+cFXfT2AiNttVU1oTq9Oq3Zl7bbCFFDlgU0wx9soGq8M/pplg==', '2T', 'Mr.', NULL, 97, '2015-05-04 22:48:27', '2015-05-09 15:26:58'),
	('Kevin', 'Arief', 'Jakarta', '1990-05-05 00:00:00', 'Male', 'Single', 5, NULL, 'jakarta', 1, NULL, 31, 155, '11236', '123456', NULL, NULL, NULL, 4, 114, '.docx', '.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mr.', NULL, 114, '2015-05-05 09:43:54', '2015-05-05 09:45:14'),
	('Kevin', 'Halim', 'Jakarta', '1991-05-05 00:00:00', 'Male', 'Married', 1, NULL, 'indonesia', 1, NULL, 31, 153, '12345', '6394332', NULL, NULL, NULL, 5, 135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mr.', NULL, 135, '2015-05-05 10:59:33', '2015-05-05 10:59:33'),
	('Fitri', 'f', 'Jakarta', '1980-05-05 00:00:00', 'Female', 'Married', 1, NULL, 'jakarta', 1, NULL, 31, 155, '12345', '1235', 's', 'a', NULL, 6, 136, '.docx', '.pdf', '2015-05-06 00:00:00', '2015-07-31 00:00:00', 'Senior Manager', 'Head of Accounting', 'PAKLIM', 125, 125, '001-PAK', 125, 'Jakarta GIZ', 125, 134, NULL, 100, 'MMK7haJwwxgYQDJXyLmZ/9xQzjPB2qyOlCoPe1Zn/N/FyjRKRHLT', '3T', 'Ms.', NULL, 97, '2015-05-05 13:25:39', '2015-05-05 13:42:02');
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_answer
DROP TABLE IF EXISTS `applicants_answer`;
CREATE TABLE IF NOT EXISTS `applicants_answer` (
  `applicant_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_applied_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `choice_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicant_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_answer: ~11 rows (approximately)
/*!40000 ALTER TABLE `applicants_answer` DISABLE KEYS */;
INSERT INTO `applicants_answer` (`applicant_answer_id`, `job_applied_id`, `question_id`, `choice_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 4, 5, 172, 113, '2015-05-04 15:12:11', '2015-05-04 15:12:11'),
	(2, 4, 1, 167, 113, '2015-05-04 15:12:11', '2015-05-04 15:12:11'),
	(3, 5, 5, 173, 115, '2015-05-04 22:47:20', '2015-05-04 22:47:20'),
	(4, 5, 1, 167, 115, '2015-05-04 22:47:20', '2015-05-04 22:47:20'),
	(5, 6, 5, 172, 116, '2015-05-04 22:50:55', '2015-05-04 22:50:55'),
	(6, 6, 1, 167, 116, '2015-05-04 22:50:55', '2015-05-04 22:50:55'),
	(7, 7, 5, 172, 114, '2015-05-05 09:46:12', '2015-05-05 09:46:12'),
	(8, 7, 1, 167, 114, '2015-05-05 09:46:12', '2015-05-05 09:46:12'),
	(9, 8, 15, 175, 136, '2015-05-05 13:33:41', '2015-05-05 13:33:41'),
	(10, 8, 2, 168, 136, '2015-05-05 13:33:41', '2015-05-05 13:33:41'),
	(11, 8, 1, 167, 136, '2015-05-05 13:33:41', '2015-05-05 13:33:41');
/*!40000 ALTER TABLE `applicants_answer` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_education
DROP TABLE IF EXISTS `applicants_education`;
CREATE TABLE IF NOT EXISTS `applicants_education` (
  `applicants_education_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `education_id` int(11) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `year_from` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `countries_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_education: ~7 rows (approximately)
/*!40000 ALTER TABLE `applicants_education` DISABLE KEYS */;
INSERT INTO `applicants_education` (`applicants_education_id`, `user_id`, `education_id`, `major`, `place`, `year_from`, `year_to`, `countries_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 113, 1, 'IPA', 'Ricci', 1996, 1999, 101, 113, '2015-05-04 13:53:52', '2015-05-04 13:54:37'),
	(2, 113, 5, 'IT', 'Binus', 1999, 2004, 101, 113, '2015-05-04 13:56:35', '2015-05-04 13:57:09'),
	(3, 115, 2, 'Accounting', 'Untar', 2004, 2006, 101, 115, '2015-05-04 22:44:41', '2015-05-04 22:44:41'),
	(4, 116, 1, 'IPA', 'SMUN', 1996, 1999, 6, 116, '2015-05-04 22:50:38', '2015-05-04 22:50:38'),
	(5, 114, 2, 'Accounting', 'Trisakti', 2000, 2003, 101, 114, '2015-05-05 09:44:24', '2015-05-05 09:44:24'),
	(6, 135, 1, 'IPA', 'Ricci', 1996, 1999, 101, 135, '2015-05-05 11:00:03', '2015-05-05 11:00:03'),
	(7, 136, 1, 'a', 'a', 1999, 2002, 101, 136, '2015-05-05 13:26:45', '2015-05-05 13:26:45');
/*!40000 ALTER TABLE `applicants_education` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_language
DROP TABLE IF EXISTS `applicants_language`;
CREATE TABLE IF NOT EXISTS `applicants_language` (
  `applicants_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(50) DEFAULT NULL,
  `language_skill_id` int(50) DEFAULT NULL,
  `language_val` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_language: ~18 rows (approximately)
/*!40000 ALTER TABLE `applicants_language` DISABLE KEYS */;
INSERT INTO `applicants_language` (`applicants_language_id`, `user_id`, `language_id`, `language_skill_id`, `language_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 113, 1, 1, NULL, 113, '2015-05-04 13:57:24', '2015-05-04 13:57:24'),
	(2, 113, 2, 3, NULL, 113, '2015-05-04 13:57:34', '2015-05-04 13:57:34'),
	(3, 113, 3, 4, NULL, 113, '2015-05-04 13:57:45', '2015-05-04 13:57:45'),
	(4, 115, 1, 1, NULL, 115, '2015-05-04 22:44:50', '2015-05-04 22:44:50'),
	(5, 115, 2, 3, NULL, 115, '2015-05-04 22:44:55', '2015-05-04 22:44:55'),
	(6, 115, 3, 2, NULL, 115, '2015-05-04 22:45:00', '2015-05-04 22:45:00'),
	(7, 116, 1, 1, NULL, 116, '2015-05-04 22:48:34', '2015-05-04 22:48:34'),
	(8, 116, 2, 1, NULL, 116, '2015-05-04 22:48:38', '2015-05-04 22:48:38'),
	(9, 116, 3, 1, NULL, 116, '2015-05-04 22:48:43', '2015-05-04 22:48:43'),
	(10, 114, 3, 5, NULL, 114, '2015-05-05 09:44:37', '2015-05-05 09:44:37'),
	(11, 114, 2, 4, NULL, 114, '2015-05-05 09:44:38', '2015-05-05 09:44:38'),
	(12, 114, 1, 1, NULL, 114, '2015-05-05 09:44:39', '2015-05-05 09:44:39'),
	(13, 135, 1, 1, NULL, 135, '2015-05-05 11:00:10', '2015-05-05 11:00:10'),
	(14, 135, 2, 3, NULL, 135, '2015-05-05 11:00:15', '2015-05-05 11:00:15'),
	(15, 135, 3, 2, NULL, 135, '2015-05-05 11:01:13', '2015-05-05 11:01:13'),
	(16, 136, 1, 1, NULL, 136, '2015-05-05 13:26:57', '2015-05-05 13:26:57'),
	(17, 136, 2, 5, NULL, 136, '2015-05-05 13:27:04', '2015-05-05 13:27:04'),
	(18, 136, 3, 4, NULL, 136, '2015-05-05 13:27:09', '2015-05-05 13:27:09');
/*!40000 ALTER TABLE `applicants_language` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_other_language
DROP TABLE IF EXISTS `applicants_other_language`;
CREATE TABLE IF NOT EXISTS `applicants_other_language` (
  `applicants_other_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_skill_id` int(50) DEFAULT NULL,
  `language_val` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_other_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_other_language: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants_other_language` DISABLE KEYS */;
INSERT INTO `applicants_other_language` (`applicants_other_language_id`, `user_id`, `language_skill_id`, `language_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(3, 113, 4, 'Japanese', 113, '2015-05-04 13:58:28', '2015-05-04 13:58:28');
/*!40000 ALTER TABLE `applicants_other_language` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_other_reference
DROP TABLE IF EXISTS `applicants_other_reference`;
CREATE TABLE IF NOT EXISTS `applicants_other_reference` (
  `applicants_other_reference_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(50) DEFAULT NULL,
  `reference_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_other_reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_other_reference: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants_other_reference` DISABLE KEYS */;
INSERT INTO `applicants_other_reference` (`applicants_other_reference_id`, `job_title`, `reference_name`, `email`, `phone`, `user_id`, `description`, `company_name`, `title`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'IT Staff', 'Jack', NULL, '456434', 113, 'Colleague', 'PT Angin Ribut', 'Mr.', 113, '2015-05-04 14:02:55', '2015-05-04 14:03:30');
/*!40000 ALTER TABLE `applicants_other_reference` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_reference
DROP TABLE IF EXISTS `applicants_reference`;
CREATE TABLE IF NOT EXISTS `applicants_reference` (
  `applicants_reference_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(50) DEFAULT NULL,
  `reference_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_reference: ~6 rows (approximately)
/*!40000 ALTER TABLE `applicants_reference` DISABLE KEYS */;
INSERT INTO `applicants_reference` (`applicants_reference_id`, `job_title`, `reference_name`, `email`, `phone`, `user_id`, `company_name`, `description`, `title`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Manager', 'Johnson', 'johnson.johnson', '123456', 113, 'PT Angin Ribut', 'my boss boss', 'Mr.', 113, '2015-05-04 14:01:53', '2015-05-04 14:02:16'),
	(2, 'Assistant Manager', 'Susi', 'susi.susi', '021-6394594', 115, 'PT Angin Anginan', 'my boss', 'Mrs.', 115, '2015-05-04 22:45:52', '2015-05-04 22:45:52'),
	(3, 'Manager', 'Murni', 'murni', '123456', 116, 'PT Angin', 'No Description', 'Ms.', 116, '2015-05-04 22:49:37', '2015-05-04 22:49:37'),
	(4, 'Manager', 'John', 'john', NULL, 114, 'PT John', NULL, 'Mr.', 114, '2015-05-05 09:44:59', '2015-05-05 09:44:59'),
	(5, 'Manager', 'Jackson', 'jackson', NULL, 135, 'jackson', 'a', 'Mr.', 135, '2015-05-05 11:00:42', '2015-05-05 11:00:42'),
	(6, 'Manager', 'Indra', 'indra', NULL, 136, 'indra', 'a', 'Mr.', 136, '2015-05-05 13:28:30', '2015-05-05 13:28:30');
/*!40000 ALTER TABLE `applicants_reference` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_salary_sharing
DROP TABLE IF EXISTS `applicants_salary_sharing`;
CREATE TABLE IF NOT EXISTS `applicants_salary_sharing` (
  `applicants_salary_sharing_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `project_number` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_salary_sharing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_salary_sharing: ~4 rows (approximately)
/*!40000 ALTER TABLE `applicants_salary_sharing` DISABLE KEYS */;
INSERT INTO `applicants_salary_sharing` (`applicants_salary_sharing_id`, `user_id`, `project_name`, `percentage`, `project_number`, `updated_by`, `created_at`, `updated_at`) VALUES
	(11, 113, 'PAKLIM', 100, '001-PAK', 97, '2015-05-04 21:31:05', '2015-05-04 21:31:05'),
	(12, 115, 'PAKLIM', 70, '001-PAK', 97, '2015-05-05 09:01:16', '2015-05-05 09:01:16'),
	(13, 115, 'Nama-Sutri', 30, '001', 97, '2015-05-05 09:01:16', '2015-05-05 09:01:16'),
	(14, 116, 'PAKLIM', 100, '001-PAK', 97, '2015-05-09 15:26:58', '2015-05-09 15:26:58');
/*!40000 ALTER TABLE `applicants_salary_sharing` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_working
DROP TABLE IF EXISTS `applicants_working`;
CREATE TABLE IF NOT EXISTS `applicants_working` (
  `applicants_working_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `month_from` int(11) DEFAULT NULL,
  `year_from` int(11) DEFAULT NULL,
  `month_to` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `may_contact` tinyint(1) DEFAULT NULL,
  `leave_reason` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `countries_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_working_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_working: ~7 rows (approximately)
/*!40000 ALTER TABLE `applicants_working` DISABLE KEYS */;
INSERT INTO `applicants_working` (`applicants_working_id`, `user_id`, `month_from`, `year_from`, `month_to`, `year_to`, `employer`, `job_title`, `business_id`, `may_contact`, `leave_reason`, `email`, `phone`, `countries_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(2, 113, 5, 2004, 1, 2007, 'IT Solusindo', 'Staff', 2, 1, NULL, 'james.watt', NULL, 101, 113, '2015-05-04 14:16:52', '2015-05-04 14:16:52'),
	(3, 113, 3, 2000, 5, 2004, 'fdsfds', 'fdsfsd', 2, 1, NULL, NULL, NULL, 8, 113, '2015-05-04 14:17:28', '2015-05-04 14:52:21'),
	(4, 115, 1, 2008, 1, 2010, 'My Employer', 'Staff', 3, 0, 'No Reason', NULL, NULL, 15, 115, '2015-05-04 22:46:58', '2015-05-04 22:46:58'),
	(5, 116, 3, 2000, 3, 2003, 'Employer', 'No Title', 3, 1, 'No Reason', 'employer', NULL, 3, 116, '2015-05-04 22:50:14', '2015-05-04 22:50:14'),
	(6, 114, 1, 2005, 1, 2007, 'EMployer', 'Staff', 1, 1, NULL, 'my.employer', NULL, 3, 114, '2015-05-05 09:45:52', '2015-05-05 09:45:52'),
	(7, 135, 1, 1999, 1, 2000, 'Test', 'test', 2, 0, NULL, NULL, NULL, 3, 135, '2015-05-05 11:01:02', '2015-05-05 11:01:02'),
	(8, 136, 1, 2000, 1, 2003, 'Employer', 'employer', 4, 0, NULL, NULL, NULL, 15, 136, '2015-05-05 13:29:04', '2015-05-05 13:29:04');
/*!40000 ALTER TABLE `applicants_working` ENABLE KEYS */;


-- Dumping structure for table hrms.business
DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.business: ~7 rows (approximately)
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` (`business_id`, `business_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'NGO', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(2, 'Private Sector', 2, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(3, 'Government', 3, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(4, 'International Organization', 4, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(5, 'University', 5, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(6, 'Self-Employed', 6, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(7, 'Others', 7, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;


-- Dumping structure for table hrms.change_log
DROP TABLE IF EXISTS `change_log`;
CREATE TABLE IF NOT EXISTS `change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated_by` int(11) DEFAULT NULL,
  `tbl` varchar(50) DEFAULT NULL,
  `changes` varchar(10000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `trans_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.change_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_log` ENABLE KEYS */;


-- Dumping structure for table hrms.choice
DROP TABLE IF EXISTS `choice`;
CREATE TABLE IF NOT EXISTS `choice` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `choice_val` varchar(1000) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.choice: ~16 rows (approximately)
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` (`choice_id`, `question_id`, `choice_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(165, 15, '1-2 years', 0, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(166, 1, '3-5 years', 0, 97, '2015-05-02 16:07:42', '2015-05-04 15:34:24'),
	(167, 1, '5-8 years', 1, 97, '2015-05-02 16:07:42', '2015-05-04 15:34:24'),
	(168, 2, '3-5 years', 0, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(169, 2, '>7years', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(170, 9, '1-3 years', 0, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(171, 5, '1-3 years', 0, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(172, 5, '4-7 years', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(173, 5, '>7 years', 2, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(174, 9, '>3years', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(175, 15, '>2years', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(176, 16, '0-3years', 0, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(177, 16, '3-5years', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(178, 16, '>5years', 2, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(179, 1, '>8 years', 2, 97, '2015-05-02 16:07:42', '2015-05-04 15:34:24'),
	(180, 17, 'fdsgfd', 0, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;


-- Dumping structure for table hrms.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `city_val` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.city: ~583 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`city_id`, `province_id`, `city_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 11, 'Simeulue', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(2, 11, 'Aceh Singkil', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(3, 11, 'Aceh Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(4, 11, 'Aceh Tenggara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(5, 11, 'Aceh Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(6, 11, 'Aceh Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(8, 11, 'Aceh Besar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(9, 11, 'Pidie', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(10, 11, 'Bireuen', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(11, 11, 'Aceh Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(12, 11, 'Aceh Barat Daya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(13, 11, 'Gayo Lues', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(14, 11, 'Aceh Tamiang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(15, 11, 'Nagan Raya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(16, 11, 'Aceh Jaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(17, 11, 'Bener Meriah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(18, 11, 'Pidie Jaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(19, 11, 'Banda Aceh', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(20, 11, 'Sabang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(21, 11, 'Langsa', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(22, 11, 'Lhokseumawe', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(23, 11, 'Subulussalam', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(24, 12, 'Nias', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(25, 12, 'Mandailing Natal', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(26, 12, 'Tapanuli Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(27, 12, 'Tapanuli Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(28, 12, 'Tapanuli Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(29, 12, 'Toba Samosir', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(30, 12, 'Labuhan Batu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(31, 12, 'Asahan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(32, 12, 'Simalungun', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(33, 12, 'Dairi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(34, 12, 'Karo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(35, 12, 'Deli Serdang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(36, 12, 'Langkat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(37, 12, 'Nias Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(38, 12, 'Humbang Hasundutan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(39, 12, 'Pakpak Bharat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(40, 12, 'Samosir', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(41, 12, 'Serdang Bedagai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(42, 12, 'Batu Bara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(43, 12, 'Padang Lawas Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(44, 12, 'Padang Lawas', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(45, 12, 'Labuhan Batu Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(46, 12, 'Labuhan Batu Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(47, 12, 'Nias Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(48, 12, 'Nias Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(49, 12, 'Sibolga', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(50, 12, 'Tanjung Balai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(51, 12, 'Pematang Siantar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(52, 12, 'Tebing Tinggi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(53, 12, 'Medan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(54, 12, 'Binjai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(55, 12, 'Padangsidimpuan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(56, 12, 'Gunungsitoli', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(57, 13, 'Kepulauan Mentawai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(58, 13, 'Pesisir Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(59, 13, 'Solok', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(60, 13, 'Sijunjung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(61, 13, 'Tanah Datar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(62, 13, 'Padang Pariaman', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(63, 13, 'Agam', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(64, 13, 'Lima Puluh Kota', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(65, 13, 'Pasaman', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(66, 13, 'Solok Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(67, 13, 'Dharmasraya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(68, 13, 'Pasaman Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(69, 13, 'Padang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(70, 13, 'Sawah Lunto', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(71, 13, 'Padang Panjang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(72, 13, 'Bukittinggi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(73, 13, 'Payakumbuh', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(74, 13, 'Pariaman', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(75, 14, 'Kuantan Singingi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(76, 14, 'Indragiri Hulu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(77, 14, 'Indragiri Hilir', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(78, 14, 'Pelalawan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(79, 14, 'S I A K', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(80, 14, 'Kampar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(81, 14, 'Rokan Hulu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(82, 14, 'Bengkalis', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(83, 14, 'Rokan Hilir', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(84, 14, 'Kepulauan Meranti', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(85, 14, 'Pekanbaru', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(86, 14, 'Dumai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(87, 15, 'Kerinci', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(88, 15, 'Merangin', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(89, 15, 'Sarolangun', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(90, 15, 'Batang Hari', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(91, 15, 'Muaro Jambi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(92, 15, 'Tanjung Jabung Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(93, 15, 'Tanjung Jabung Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(94, 15, 'Tebo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(95, 15, 'Bungo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(96, 15, 'Jambi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(97, 15, 'Sungai Penuh', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(98, 16, 'Ogan Komering Ulu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(99, 16, 'Ogan Komering Ilir', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(100, 16, 'Muara Enim', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(101, 16, 'Lahat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(102, 16, 'Musi Rawas', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(103, 16, 'Musi Banyuasin', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(104, 16, 'Banyu Asin', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(105, 16, 'Ogan Komering Ulu Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(106, 16, 'Ogan Komering Ulu Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(107, 16, 'Ogan Ilir', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(108, 16, 'Empat Lawang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(109, 16, 'Palembang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(110, 16, 'Prabumulih', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(111, 16, 'Pagar Alam', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(112, 16, 'Lubuklinggau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(113, 17, 'Bengkulu Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(114, 17, 'Rejang Lebong', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(115, 17, 'Bengkulu Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(116, 17, 'Kaur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(117, 17, 'Seluma', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(118, 17, 'Mukomuko', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(119, 17, 'Lebong', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(120, 17, 'Kepahiang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(121, 17, 'Bengkulu Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(122, 17, 'Bengkulu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(123, 18, 'Lampung Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(124, 18, 'Tanggamus', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(125, 18, 'Lampung Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(126, 18, 'Lampung Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(127, 18, 'Lampung Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(128, 18, 'Lampung Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(129, 18, 'Way Kanan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(130, 18, 'Tulangbawang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(131, 18, 'Pesawaran', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(132, 18, 'Pringsewu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(133, 18, 'Mesuji', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(134, 18, 'Tulang Bawang Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(135, 18, 'Pesisir Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(136, 18, 'Bandar Lampung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(137, 18, 'Metro', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(138, 19, 'Bangka', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(139, 19, 'Belitung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(140, 19, 'Bangka Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(141, 19, 'Bangka Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(142, 19, 'Bangka Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(143, 19, 'Belitung Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(144, 19, 'Pangkal Pinang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(145, 21, 'Karimun', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(146, 21, 'Bintan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(147, 21, 'Natuna', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(148, 21, 'Lingga', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(149, 21, 'Kepulauan Anambas', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(150, 21, 'Batam', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(151, 21, 'Tanjung Pinang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(152, 31, 'Kepulauan Seribu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(153, 31, 'Jakarta Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(154, 31, 'Jakarta Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(155, 31, 'Jakarta Pusat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(156, 31, 'Jakarta Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(157, 31, 'Jakarta Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(158, 32, 'Bogor', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(159, 32, 'Sukabumi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(160, 32, 'Cianjur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(161, 32, 'Bandung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(162, 32, 'Garut', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(163, 32, 'Tasikmalaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(164, 32, 'Ciamis', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(165, 32, 'Kuningan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(166, 32, 'Cirebon', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(167, 32, 'Majalengka', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(168, 32, 'Sumedang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(169, 32, 'Indramayu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(170, 32, 'Subang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(171, 32, 'Purwakarta', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(172, 32, 'Karawang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(173, 32, 'Bekasi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(174, 32, 'Bandung Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(175, 32, 'Pangandaran', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(176, 32, 'Depok', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(177, 32, 'Cimahi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(178, 32, 'Banjar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(179, 33, 'Cilacap', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(180, 33, 'Banyumas', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(181, 33, 'Purbalingga', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(182, 33, 'Banjarnegara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(183, 33, 'Kebumen', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(184, 33, 'Purworejo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(185, 33, 'Wonosobo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(186, 33, 'Magelang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(187, 33, 'Boyolali', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(188, 33, 'Klaten', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(189, 33, 'Sukoharjo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(190, 33, 'Wonogiri', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(191, 33, 'Karanganyar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(192, 33, 'Sragen', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(193, 33, 'Grobogan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(194, 33, 'Blora', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(195, 33, 'Rembang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(196, 33, 'Pati', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(197, 33, 'Kudus', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(198, 33, 'Jepara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(199, 33, 'Demak', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(200, 33, 'Semarang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(201, 33, 'Temanggung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(202, 33, 'Kendal', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(203, 33, 'Batang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(204, 33, 'Pekalongan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(205, 33, 'Pemalang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(206, 33, 'Tegal', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(207, 33, 'Brebes', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(208, 33, 'Surakarta', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(209, 33, 'Salatiga', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(210, 34, 'Kulon Progo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(211, 34, 'Bantul', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(212, 34, 'Gunung Kidul', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(213, 34, 'Sleman', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(214, 34, 'Yogyakarta', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(215, 35, 'Pacitan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(216, 35, 'Ponorogo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(217, 35, 'Trenggalek', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(218, 35, 'Tulungagung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(219, 35, 'Blitar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(220, 35, 'Kediri', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(221, 35, 'Malang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(222, 35, 'Lumajang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(223, 35, 'Jember', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(224, 35, 'Banyuwangi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(225, 35, 'Bondowoso', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(226, 35, 'Situbondo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(227, 35, 'Probolinggo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(228, 35, 'Pasuruan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(229, 35, 'Sidoarjo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(230, 35, 'Mojokerto', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(231, 35, 'Jombang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(232, 35, 'Nganjuk', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(233, 35, 'Madiun', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(234, 35, 'Magetan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(235, 35, 'Ngawi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(236, 35, 'Bojonegoro', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(237, 35, 'Tuban', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(238, 35, 'Lamongan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(239, 35, 'Gresik', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(240, 35, 'Bangkalan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(241, 35, 'Sampang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(242, 35, 'Pamekasan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(243, 35, 'Sumenep', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(244, 35, 'Surabaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(245, 35, 'Batu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(246, 36, 'Pandeglang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(247, 36, 'Lebak', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(248, 36, 'Tangerang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(249, 36, 'Serang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(250, 36, 'Cilegon', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(251, 36, 'Tangerang Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(252, 51, 'Jembrana', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(253, 51, 'Tabanan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(254, 51, 'Badung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(255, 51, 'Gianyar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(256, 51, 'Klungkung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(257, 51, 'Bangli', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(258, 51, 'Karang Asem', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(259, 51, 'Buleleng', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(260, 51, 'Denpasar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(261, 52, 'Lombok Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(262, 52, 'Lombok Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(263, 52, 'Lombok Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(264, 52, 'Sumbawa', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(265, 52, 'Dompu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(266, 52, 'Bima', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(267, 52, 'Sumbawa Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(268, 52, 'Lombok Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(269, 52, 'Mataram', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(270, 53, 'Sumba Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(271, 53, 'Sumba Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(272, 53, 'Kupang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(273, 53, 'Timor Tengah Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(274, 53, 'Timor Tengah Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(275, 53, 'Belu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(276, 53, 'Alor', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(277, 53, 'Lembata', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(278, 53, 'Flores Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(279, 53, 'Sikka', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(280, 53, 'Ende', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(281, 53, 'Ngada', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(282, 53, 'Manggarai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(283, 53, 'Rote Ndao', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(284, 53, 'Manggarai Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(285, 53, 'Sumba Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(286, 53, 'Sumba Barat Daya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(287, 53, 'Nagekeo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(288, 53, 'Manggarai Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(289, 53, 'Sabu Raijua', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(290, 61, 'Sambas', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(291, 61, 'Bengkayang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(292, 61, 'Landak', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(293, 61, 'Pontianak', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(294, 61, 'Sanggau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(295, 61, 'Ketapang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(296, 61, 'Sintang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(297, 61, 'Kapuas Hulu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(298, 61, 'Sekadau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(299, 61, 'Melawi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(300, 61, 'Kayong Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(301, 61, 'Kubu Raya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(302, 61, 'Singkawang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(303, 62, 'Kotawaringin Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(304, 62, 'Kotawaringin Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(305, 62, 'Kapuas', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(306, 62, 'Barito Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(307, 62, 'Barito Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(308, 62, 'Sukamara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(309, 62, 'Lamandau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(310, 62, 'Seruyan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(311, 62, 'Katingan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(312, 62, 'Pulang Pisau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(313, 62, 'Gunung Mas', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(314, 62, 'Barito Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(315, 62, 'Murung Raya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(316, 62, 'Palangka Raya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(317, 63, 'Tanah Laut', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(318, 63, 'Baru', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(319, 63, 'Banjar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(320, 63, 'Barito Kuala', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(321, 63, 'Tapin', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(322, 63, 'Hulu Sungai Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(323, 63, 'Hulu Sungai Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(324, 63, 'Hulu Sungai Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(325, 63, 'Tabalong', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(326, 63, 'Tanah Bumbu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(327, 63, 'Balangan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(328, 63, 'Banjarmasin', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(329, 63, 'Banjar Baru', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(330, 64, 'Paser', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(331, 64, 'Kutai Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(332, 64, 'Kutai Kartanegara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(333, 64, 'Kutai Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(334, 64, 'Berau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(335, 64, 'Penajam Paser Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(336, 64, 'Balikpapan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(337, 64, 'Samarinda', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(338, 64, 'Bontang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(339, 65, 'Malinau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(340, 65, 'Bulungan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(341, 65, 'Tana Tidung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(342, 65, 'Nunukan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(343, 65, 'Tarakan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(344, 71, 'Bolaang Mongondow', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(345, 71, 'Minahasa', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(346, 71, 'Kepulauan Sangihe', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(347, 71, 'Kepulauan Talaud', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(348, 71, 'Minahasa Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(349, 71, 'Minahasa Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(350, 71, 'Bolaang Mongondow Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(351, 71, 'Siau Tagulandang Biaro', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(352, 71, 'Minahasa Tenggara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(353, 71, 'Bolaang Mongondow Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(354, 71, 'Bolaang Mongondow Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(355, 71, 'Manado', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(356, 71, 'Bitung', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(357, 71, 'Tomohon', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(358, 71, 'Kotamobagu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(359, 72, 'Banggai Kepulauan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(360, 72, 'Banggai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(361, 72, 'Morowali', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(362, 72, 'Poso', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(363, 72, 'Donggala', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(364, 72, 'Toli-toli', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(365, 72, 'Buol', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(366, 72, 'Parigi Moutong', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(367, 72, 'Tojo Una-una', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(368, 72, 'Sigi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(369, 72, 'Palu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(370, 73, 'Kepulauan Selayar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(371, 73, 'Bulukumba', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(372, 73, 'Bantaeng', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(373, 73, 'Jeneponto', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(374, 73, 'Takalar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(375, 73, 'Gowa', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(376, 73, 'Sinjai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(377, 73, 'Maros', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(378, 73, 'Pangkajene Dan Kepulauan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(379, 73, 'Barru', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(380, 73, 'Bone', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(381, 73, 'Soppeng', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(382, 73, 'Wajo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(383, 73, 'Sidenreng Rappang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(384, 73, 'Pinrang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(385, 73, 'Enrekang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(386, 73, 'Luwu', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(387, 73, 'Tana Toraja', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(388, 73, 'Luwu Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(389, 73, 'Luwu Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(390, 73, 'Toraja Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(391, 73, 'Makassar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(392, 73, 'Parepare', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(393, 73, 'Palopo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(394, 74, 'Buton', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(395, 74, 'Muna', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(396, 74, 'Konawe', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(397, 74, 'Kolaka', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(398, 74, 'Konawe Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(399, 74, 'Bombana', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(400, 74, 'Wakatobi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(401, 74, 'Kolaka Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(402, 74, 'Buton Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(403, 74, 'Konawe Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(404, 74, 'Kendari', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(405, 74, 'Baubau', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(406, 75, 'Boalemo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(407, 75, 'Gorontalo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(408, 75, 'Pohuwato', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(409, 75, 'Bone Bolango', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(410, 75, 'Gorontalo Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(411, 76, 'Majene', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(412, 76, 'Polewali Mandar', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(413, 76, 'Mamasa', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(414, 76, 'Mamuju', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(415, 76, 'Mamuju Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(416, 81, 'Maluku Tenggara Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(417, 81, 'Maluku Tenggara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(418, 81, 'Maluku Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(419, 81, 'Buru', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(420, 81, 'Kepulauan Aru', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(421, 81, 'Seram Bagian Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(422, 81, 'Seram Bagian Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(423, 81, 'Maluku Barat Daya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(424, 81, 'Buru Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(425, 81, 'Ambon', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(426, 81, 'Tual', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(427, 82, 'Halmahera Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(428, 82, 'Halmahera Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(429, 82, 'Kepulauan Sula', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(430, 82, 'Halmahera Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(431, 82, 'Halmahera Utara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(432, 82, 'Halmahera Timur', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(433, 82, 'Pulau Morotai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(434, 82, 'Ternate', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(435, 82, 'Tidore Kepulauan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(436, 91, 'Fakfak', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(437, 91, 'Kaimana', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(438, 91, 'Teluk Wondama', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(439, 91, 'Teluk Bintuni', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(440, 91, 'Manokwari', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(441, 91, 'Sorong Selatan', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(442, 91, 'Sorong', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(443, 91, 'Raja Ampat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(444, 91, 'Tambrauw', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(445, 91, 'Maybrat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(446, 94, 'Merauke', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(447, 94, 'Jayawijaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(448, 94, 'Jayapura', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(449, 94, 'Nabire', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(450, 94, 'Kepulauan Yapen', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(451, 94, 'Biak Numfor', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(452, 94, 'Paniai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(453, 94, 'Puncak Jaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(454, 94, 'Mimika', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(455, 94, 'Boven Digoel', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(456, 94, 'Mappi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(457, 94, 'Asmat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(458, 94, 'Yahukimo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(459, 94, 'Pegunungan Bintang', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(460, 94, 'Tolikara', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(461, 94, 'Sarmi', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(462, 94, 'Keerom', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(463, 94, 'Waropen', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(464, 94, 'Supiori', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(465, 94, 'Mamberamo Raya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(466, 94, 'Nduga', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(467, 94, 'Lanny Jaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(468, 94, 'Mamberamo Tengah', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(469, 94, 'Yalimo', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(470, 94, 'Puncak', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(471, 94, 'Dogiyai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(472, 94, 'Intan Jaya', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(473, 94, 'Deiyai', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(474, 11, 'Aceh Barat', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


-- Dumping structure for table hrms.contract_history
DROP TABLE IF EXISTS `contract_history`;
CREATE TABLE IF NOT EXISTS `contract_history` (
  `contract_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `contract_status` int(11) DEFAULT '0',
  `salary_band` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `project_number` varchar(50) DEFAULT NULL,
  `project_location` varchar(50) DEFAULT NULL,
  `responsible_superior` int(11) DEFAULT NULL,
  `SAP_No` varchar(50) DEFAULT NULL,
  `job_position` varchar(50) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `contract_reminder_email` tinyint(4) DEFAULT NULL,
  `working_time` int(11) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `vacancy_type` varchar(50) DEFAULT NULL,
  `allowance` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contract_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.contract_history: ~33 rows (approximately)
/*!40000 ALTER TABLE `contract_history` DISABLE KEYS */;
INSERT INTO `contract_history` (`contract_history_id`, `user_id`, `start_date`, `end_date`, `job_title`, `contract_status`, `salary_band`, `project_name`, `project_number`, `project_location`, `responsible_superior`, `SAP_No`, `job_position`, `reason`, `contract_reminder_email`, `working_time`, `salary`, `vacancy_type`, `allowance`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 56, '2015-02-01 00:00:00', '2015-02-15 00:00:00', 'fjdsio jfioed', 0, 'Level 2', 'name', 'blabla', 'location', -1, '3423 fkdsop', 'Project', 'Initial Salary', 1, NULL, '3vFzwD9igVbyyA8u2GmzWz4z3z/QOrEIqJJ+KfP2jsu04BGoVemG', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(2, 56, '2015-02-16 00:00:00', '2015-02-20 00:00:00', 'fjdsio jfioed', 0, 'Level 2', 'name', 'qqq2', 'location', -1, '3423 fkdsop', 'Project', 'Initial Salary', 1, NULL, 'KFpz3RqI+06Nk6tLlXF6Yxu5rppvjLLDbtKsyboPLaF4ce1rN4/bo0U=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(3, 56, '2015-02-21 00:00:00', '2015-02-28 00:00:00', 'fjdsio jfioed', 0, 'Level 2', 'Project baru', 'qqq2', 'location', -1, '3423 fkdsop', 'Project', 'Initial Salary', 1, NULL, 'usirLBqeH+r61ANUsw8xd06jXGJ8yWhAGC/nwIVcnqCxF+0DBwAj5g==', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(29, 59, '1900-01-01 00:00:00', '3000-01-01 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, 'Q9mG9OX3n0VQ0WEJrSxN8egVhWnVZ81nLsID3YhfdZ3pZeS9T1c=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(30, 60, '2015-03-01 00:00:00', '2015-03-24 00:00:00', 'fdsjio', 0, '2T', 'PAKLIM', '001', 'jiofds jio', -1, 'jfdiso ', 'jfdiso', 'Initial Salary', 1, 100, 'IQOA7X+WO33Fu6TXy1ACvRpvs/cKQkoeXIMmhJMqf3jCPOvOhGL8eOA=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(63, 9, '2015-03-30 00:00:00', '2015-03-30 00:00:00', 'abr', 0, '6A', 'PAKLIM', '001', 'e', -1, 'i', 'bt', 'hebatg', 1, 100, 'O2E27WY9Bm5JOhmtqTeHysv5pI05YDcl38CaEmPUgOlXnD2EwHNnqtecQc0=', 'Intern', 50000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(64, 9, '2015-03-31 00:00:00', '2015-07-14 00:00:00', 'ab', 0, '2T', 'PAKLIM', '001', 'e', -1, 'i', 'b', 'salah input', 1, NULL, 'k6Iay7YWoqRiGkk4LOt+PaREi/e0dsjmCxdzrk/ct0uaT1HSjutjUg==', 'National Personnel', NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(65, 9, '2015-07-15 00:00:00', '2015-07-29 00:00:00', 'ab', 0, '4T', 'PAKLIM', '001', 'e', -1, 'i', 'b', 'coba coba', 1, NULL, 'CcTxbAm1hFlMP/cM6WOdEZ7FNiS6XGIvjxppLBZaxv58rv3DVFwH1SE=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(66, 5, '2016-01-01 00:00:00', '2016-12-31 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', -1, 'i', 'b', 'dsfdsfds', NULL, 70, 'l8qRhPJMRUH6fDgiJGLz/AnaxRjYmw4N7n8Uy3zEyRw0BSiC7srl', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(67, 9, '2015-07-30 00:00:00', '2015-08-29 00:00:00', 'ab', 0, '4T', 'PAKLIM', '001', 'e', -1, 'i', 'b', 'coba coba', 1, 85, 'l8qRhPJMRUH6fDgiJGLz/AnaxRjYmw4N7n8Uy3zEyRw0BSiC7srl', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(68, 9, '2015-08-30 00:00:00', '2016-06-30 00:00:00', 'ab', 0, '4T', 'PAKLIM', '001', 'e', -1, 'i', 'b', 'coba coba', 1, 85, 'n5MKZ0IirO3hsHGwnXhNN4Nj2sPeC9neIspQ2nXb/OBlEbd8l61ABXg=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(75, 9, '2016-07-01 00:00:00', '2016-07-31 00:00:00', 'ab', 0, '4T', 'PAKLIM', '001', 'e', -1, 'i', 'b', 'coba coba', 1, 85, 'n5MKZ0IirO3hsHGwnXhNN4Nj2sPeC9neIspQ2nXb/OBlEbd8l61ABXg=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(78, 9, '2015-03-31 00:00:00', '2016-08-31 00:00:00', 'ab', 0, '1', 'PAKLIM', '001', 'e', -1, 'i', 'b', 'sdfsdfds', 1, NULL, '2frHy+/GZ50gdBLgQn8YA6bEfdD9MWztouRXNU8XHCsgjvy9vg==', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(80, 66, '2015-03-31 00:00:00', '2015-03-31 00:00:00', 'cjxio', 0, '1', 'PAKLIM', '001', 'hjkhk', -1, 'fyusdi', 'fuidsocj', 'dsfds', 1, 100, 'pNzeN2Mhxy9D8NBzfLgZcR/Pu9FjFOAlHR9y4hyfB0aekz4Qj+oj4A==', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(82, 68, '2015-01-01 00:00:00', '2015-05-30 00:00:00', 'fdshjk', 0, '1', 'PAKLIM', '001-PAK', 'Jakarta GIZ', -1, 'fhdsi', 'fhdskj', 'Initial Salary', 1, 100, 'pmWHxrR/i7etbkmC/m0q56M5SAgJp345r3MiXCE8tWstoZ7NUuMg', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(84, 70, '2015-03-25 00:00:00', '2015-04-24 00:00:00', 'Senior Officer', 0, '1', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 69, 'bhvh', 'Head of Accounting', 'fdsfds', 1, 100, 'Zi8zqMZqDTkPD6zhbxdu2slm6DmP5TOhxF0BTIARbLdcKI5B8/PuQAHITR8=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(85, 71, '1900-01-01 00:00:00', '3000-01-01 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(86, 72, '1900-01-01 00:00:00', '3000-01-01 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(88, 8, '2015-03-01 00:00:00', '2015-06-30 00:00:00', 'Senior Officer', 0, '1', 'PAKLIM', '001-PAK', 'dhasjfkds hi', 69, 'ADFD', 'Head of Accounting', 'Initial Salary', 1, 100, 'epfZ/5ev9IJ8y07rLOEkcGQyhylnyuehB4+IO9Id8NquivYxf94=', 'Intern', 50000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(89, 8, NULL, NULL, 'Senior Officer', 0, '2T', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 69, 'bhjghj', 'Head of Accounting', 'Initial Salary', 1, 100, 'sgbp06nwGGNbmzsDp4pgZcMeGyRx3sglFEV4gyvHwMv/d+3yxTs=', 'Intern', 50000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(101, 97, '2015-03-01 00:00:00', '2015-05-24 00:00:00', 'Senior Manager', 0, '1', 'PAKLIM', '001-PAK', 'dhasjfkds hi', 100, 'SAP Number', 'Head of Accounting', 'Initial Salary', 1, 100, 'SN24V8CGnzkIsB5S90I7ocngRIommlAEgNNcnbzEq2H2lKeM7ZqQ', 'Intern', 50000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(104, 68, '2015-03-31 00:00:00', '2015-06-30 00:00:00', 'Principal Advisor', 0, '2A', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 68, 'fhdsi', 'Head of Accounting', 'sdfds hjkfds', 1, NULL, 'kzPI1ij63ZG+lHgI2VEtqjCy24G3M6dKrDSR0XeuIUEp4ni3no50', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(108, 98, '2015-03-26 00:00:00', NULL, 'Senior Officer', 0, '2T', 'PAKLIM', '001-PAK', 'hcuxiv', 69, 'dsafds', 'Head of Accounting', 'Naik  Gaji', NULL, 100, 'F3zEbpDExm9aYCR+oOgKI7VhmFRifQj2cOKr0GX0t9ic2lX0lyjEHg==', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(110, 69, '2015-03-01 00:00:00', '2015-04-30 00:00:00', 'Senior Advisor', 0, '1', 'PAKLIM', '001-PAK', 'hcuxiv', 68, 'Ganti SAP No', 'Accounting Staff', 'Initial Salary', 1, 100, 'nlM33qs2BsBxXA/A8OkI18snBWRl2JDYtL0K2SxU5dz+FIoch000yAc=', 'National Personnel', 1000000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(115, 100, '2015-03-01 00:00:00', '2015-03-31 00:00:00', 'Senior Advisor', 0, '1', 'Nama-Sutri', 'gfdgfd', 'dhasjfkds hi', 69, 'SAP Number', 'Head of Accounting', 'Initial Salary', 1, 100, 'umRFWd+tHatmp1JpWiiCuX6Sf+KFHS0PXhFHnE6t51xmvAsN9oEipQ==', 'National Personnel', 500000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(116, 103, '2015-04-01 00:00:00', '2015-06-30 00:00:00', 'Senior Manager', 0, '2A', 'Nama-Sutri', '001', 'dhasjfkds hi', 97, 'ghjghj', 'Head of Accounting', 'Initial Salary', 1, 100, 'PwFRcUk4f2Ghb3ZVJc5g0AAy5/YdHuD3NPD06PJkEUe56JgRH9drGPt8Kg==', 'Intern', 300000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(117, 69, '2015-06-01 00:00:00', '2015-04-30 00:00:00', 'Senior Advisor', 0, '3T', 'PAKLIM', '001-PAK', 'hcuxiv', 68, 'Ganti SAP No', 'Head of Accounting', 'Initial Salary', 1, 100, 'IABM71jNWWW+Zv87YLDTKgu8YPffOt6CBj2vOKEyBCT+JkFpT+bItRY=', 'National Personnel', 1000000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(119, 97, '2015-05-25 00:00:00', '2015-06-14 00:00:00', 'Senior Manager', 0, '1', 'PAKLIM', '001-PAK', 'dhasjfkds hi', 69, 'SAP Number', 'Head of Accounting', 'Initial Salary', 1, 100, 'p4h+KdLItGyJwd4wYCvgyrHd9XhlBK7j/4bF8/ro9wVWbOA4mjrb', 'Intern', 50000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(120, 97, '2015-06-15 00:00:00', '2015-06-30 00:00:00', 'Senior Manager', 0, '1', 'Nama-Sutri', '001', 'Jakarta Nama-Sutri', 125, 'ganti SAP', 'Head of Accounting', 'Initial Salary', 1, 100, 'OJ7XEyKaSzaWIiSQ8WWluPfe/8Ww7jECoN9tKbhDiQoH7CwxYhUPHDdlAIs=', 'Intern', 50000, 97, '2015-05-02 16:07:42', '2015-05-05 09:41:08'),
	(126, 111, '1900-01-01 00:00:00', '3000-01-01 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, '2015-05-02 18:24:44', '2015-05-02 18:24:44'),
	(133, 125, '2015-05-01 00:00:00', '2015-07-31 00:00:00', 'Senior Manager', 0, '2T', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 125, 'SAP No', 'Head of Accounting', 'Initial Salary', 1, 100, 'VN6wUkRkGcKzXWZRVLaEFwqWKnwlR4s8CbRlEOmUSUK/qjtoNMe6NfY=', 'Intern', 2000000, 97, '2015-05-04 21:35:17', '2015-05-04 22:29:04'),
	(142, 134, '2015-05-05 00:00:00', '2015-06-30 00:00:00', 'Senior Advisor', 0, '2T', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 125, 'SAPhj', 'Head of Accounting', 'Initial Salary', 1, 100, 'ROZZu2jHSkmc++lPYfps3KckeSEajCpf4cLeRxXeWL7L+WGTJdi2nw==', 'Intern', 2000000, 97, '2015-05-05 09:21:58', '2015-05-05 09:22:44'),
	(143, 137, '2015-05-06 00:00:00', '2015-07-31 00:00:00', 'Senior Manager', 0, '3T', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 134, NULL, 'Head of Accounting', 'Initial Salary', 1, 100, 'MMK7haJwwxgYQDJXyLmZ/9xQzjPB2qyOlCoPe1Zn/N/FyjRKRHLT', 'Intern', 300000, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:43');
/*!40000 ALTER TABLE `contract_history` ENABLE KEYS */;


-- Dumping structure for table hrms.contract_history2
DROP TABLE IF EXISTS `contract_history2`;
CREATE TABLE IF NOT EXISTS `contract_history2` (
  `contract_history_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `contract_status` int(11) DEFAULT '0',
  `salary_band` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `project_number` varchar(50) DEFAULT NULL,
  `project_location` varchar(50) DEFAULT NULL,
  `responsible_superior` int(11) DEFAULT NULL,
  `SAP_No` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `contract_reminder_email` tinyint(4) DEFAULT NULL,
  `working_time` int(11) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `vacancy_type` varchar(50) DEFAULT NULL,
  `allowance` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.contract_history2: ~14 rows (approximately)
/*!40000 ALTER TABLE `contract_history2` DISABLE KEYS */;
INSERT INTO `contract_history2` (`contract_history_id`, `user_id`, `start_date`, `end_date`, `job_title`, `contract_status`, `salary_band`, `project_name`, `project_number`, `project_location`, `responsible_superior`, `SAP_No`, `position`, `reason`, `contract_reminder_email`, `working_time`, `salary`, `vacancy_type`, `allowance`, `updated_by`, `created_at`, `updated_at`) VALUES
	(50, 9, '2015-07-01 00:00:00', '2016-06-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(52, 9, '2015-07-01 00:00:00', '2016-06-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(53, 9, '2015-07-01 00:00:00', '2016-06-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(54, 9, '2015-06-01 00:00:00', '2016-06-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(47, 5, '2015-04-01 00:00:00', '2015-09-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(56, 5, '2015-06-30 00:00:00', '2015-06-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(57, 5, '2015-06-30 00:00:00', '2015-07-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(59, 5, '2015-03-17 00:00:00', '2015-08-30 00:00:00', 'a', 0, '2T', 'PAKLIM', '001', 'e', 0, 'i', 'b', 'dsfdsfds', NULL, 70, '7+1LSYUmSwhlqa31/1ArKeiQzSabsxY1S3EF+0OrMmC/g0+8vxAA/jc4', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(77, 66, '2015-03-01 00:00:00', '2015-03-31 00:00:00', 'cjxio', 0, '1', 'PAKLIM', '001', 'hjkhk', 0, 'fyusdi', 'fuidsocj', 'dsfds', NULL, 100, 'YLsXnm94t+rDozUxxnhlnCCYc8wWDlA6LWrKAMCycSTMogkN12DJ6g==', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(79, 66, '2015-03-31 00:00:00', '2015-07-31 00:00:00', 'cjxio', 0, '1', 'PAKLIM', '001', 'hjkhk', 0, 'fyusdi', 'fuidsocj', 'dsfds', NULL, 100, '/hVupU4W0SLhOTHq4DehaoC0RTjHpr0/CIMg5Omli6dtJ8IGfqituOo=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(102, 98, '2015-03-01 00:00:00', '2015-03-14 00:00:00', 'Senior Officer', 0, '2T', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 69, 'dsafds', 'Head of Accounting', 'Initial Salary', 1, 100, '+8gXSHe4OEsU2r1FNmO2PmygfV2WLvr1ESbGaysQB7zjc/aQANdqfFg=', 'Intern', 50000, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(103, 98, '2015-03-15 00:00:00', '2015-03-30 00:00:00', 'Senior Officer', 0, '2T', 'PAKLIM', '001-PAK', 'Jakarta GIZ', 69, 'dsafds', 'Head of Accounting', 'Naik  Gaji', 1, 100, 'gYybtGqzv48qXXqtNf59+nSAizNNjra6PDF7BrHX2heSMihUuMi0', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(83, 69, '2015-01-01 00:00:00', '2015-02-28 00:00:00', 'Senior Officer', 0, '1', 'PAKLIM', '001-PAK', 'dhasjfkds hi', 97, 'fsdfds', 'Head of Accounting', 'Initial Salary', 1, 100, 'UlDrh05fqCeaU9WBhmhFLCDHkptUfa9JRbS5qs84goxfhYmn/XtiHjA=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(109, 69, '2015-03-01 00:00:00', '2015-06-30 00:00:00', 'Senior Officer', 0, '1', 'PAKLIM', '001-PAK', 'dhasjfkds hi', 97, 'Ganti SAP No', 'Head of Accounting', 'Initial Salary', 1, 100, 'ILOmBfHYJhKe6ZQGpgLrmjJVaovs/VPhxaxYbMxGyLWcsVEduyDxVCI=', NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `contract_history2` ENABLE KEYS */;


-- Dumping structure for table hrms.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `code` char(2) CHARACTER SET latin1 NOT NULL,
  `countries_val` varchar(50) DEFAULT NULL,
  `name_fr` tinytext CHARACTER SET latin1,
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`countries_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- Dumping data for table hrms.countries: ~248 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`code`, `countries_val`, `name_fr`, `countries_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	('AD', 'Andorra', 'Andorre', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AE', 'United Arab Emirates', 'Émirats arabes unis', 2, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AF', 'Afghanistan', 'Afghanistan', 3, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AG', 'Antigua and Barbuda', 'Antigua-et-Barbuda', 4, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AI', 'Anguilla', 'Anguilla', 5, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AL', 'Albania', 'Albanie', 6, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AM', 'Armenia', 'Arménie', 7, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AO', 'Angola', 'Angola', 8, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AQ', 'Antarctica', 'Antarctique', 9, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AR', 'Argentina', 'Argentine', 10, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AS', 'American Samoa', 'Samoa américaine', 11, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AT', 'Austria', 'Autriche', 12, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AU', 'Australia', 'Australie', 13, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AW', 'Aruba', 'Aruba', 14, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AX', 'Aland Islands', 'Îles d\'Åland', 15, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('AZ', 'Azerbaijan', 'Azerbaïdjan', 16, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BA', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine', 17, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BB', 'Barbados', 'Barbade', 18, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BD', 'Bangladesh', 'Bangladesh', 19, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BE', 'Belgium', 'Belgique', 20, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BF', 'Burkina Faso', 'Burkina Faso', 21, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BG', 'Bulgaria', 'Bulgarie', 22, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BH', 'Bahrain', 'Bahreïn', 23, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BI', 'Burundi', 'Burundi', 24, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BJ', 'Benin', 'Bénin', 25, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BL', 'Saint BarthÃ©lemy', 'Saint-Barthélemy', 26, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BM', 'Bermuda', 'Bermudes', 27, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BN', 'Brunei Darussalam', 'Brunei Darussalam', 28, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BO', 'Bolivia', 'Bolivie', 29, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BQ', 'Caribbean Netherlands ', 'Pays-Bas caribéens', 30, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BR', 'Brazil', 'Brésil', 31, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BS', 'Bahamas', 'Bahamas', 32, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BT', 'Bhutan', 'Bhoutan', 33, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BV', 'Bouvet Island', 'Île Bouvet', 34, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BW', 'Botswana', 'Botswana', 35, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BY', 'Belarus', 'Bélarus', 36, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('BZ', 'Belize', 'Belize', 37, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CA', 'Canada', 'Canada', 38, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CC', 'Cocos (Keeling) Islands', 'Îles Cocos (Keeling)', 39, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CD', 'Congo, Democratic Republic of', 'Congo, République démocratique du', 40, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CF', 'Central African Republic', 'République centrafricaine', 41, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CG', 'Congo', 'Congo', 42, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CH', 'Switzerland', 'Suisse', 43, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CI', 'Cote d\'Ivoire', 'Côte d\'Ivoire', 44, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CK', 'Cook Islands', 'Îles Cook', 45, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CL', 'Chile', 'Chili', 46, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CM', 'Cameroon', 'Cameroun', 47, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CN', 'China', 'Chine', 48, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CO', 'Colombia', 'Colombie', 49, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CR', 'Costa Rica', 'Costa Rica', 50, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CU', 'Cuba', 'Cuba', 51, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CV', 'Cape Verde', 'Cap-Vert', 52, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CW', 'Curaçao', 'Curaçao', 53, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CX', 'Christmas Island', 'Île Christmas', 54, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CY', 'Cyprus', 'Chypre', 55, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('CZ', 'Czech Republic', 'République tchèque', 56, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('DE', 'Germany', 'Allemagne', 57, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('DJ', 'Djibouti', 'Djibouti', 58, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('DK', 'Denmark', 'Danemark', 59, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('DM', 'Dominica', 'Dominique', 60, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('DO', 'Dominican Republic', 'République dominicaine', 61, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('DZ', 'Algeria', 'Algérie', 62, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('EC', 'Ecuador', 'Équateur', 63, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('EE', 'Estonia', 'Estonie', 64, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('EG', 'Egypt', 'Égypte', 65, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('EH', 'Western Sahara', 'Sahara Occidental', 66, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ER', 'Eritrea', 'Érythrée', 67, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ES', 'Spain', 'Espagne', 68, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ET', 'Ethiopia', 'Éthiopie', 69, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('FI', 'Finland', 'Finlande', 70, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('FJ', 'Fiji', 'Fidji', 71, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('FK', 'Falkland Islands', 'Îles Malouines', 72, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('FM', 'Micronesia, Federated States of', 'Micronésie, États fédérés de', 73, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('FO', 'Faroe Islands', 'Îles Féroé', 74, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('FR', 'France', 'France', 75, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GA', 'Gabon', 'Gabon', 76, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GB', 'United Kingdom', 'Royaume-Uni', 77, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GD', 'Grenada', 'Grenade', 78, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GE', 'Georgia', 'Géorgie', 79, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GF', 'French Guiana', 'Guyane française', 80, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GG', 'Guernsey', 'Guernesey', 81, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GH', 'Ghana', 'Ghana', 82, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GI', 'Gibraltar', 'Gibraltar', 83, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GL', 'Greenland', 'Groenland', 84, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GM', 'Gambia', 'Gambie', 85, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GN', 'Guinea', 'Guinée', 86, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GP', 'Guadeloupe', 'Guadeloupe', 87, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GQ', 'Equatorial Guinea', 'Guinée équatoriale', 88, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GR', 'Greece', 'Grèce', 89, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GS', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les îles Sandwich du Sud', 90, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GT', 'Guatemala', 'Guatemala', 91, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GU', 'Guam', 'Guam', 92, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GW', 'Guinea-Bissau', 'Guinée-Bissau', 93, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('GY', 'Guyana', 'Guyana', 94, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('HK', 'Hong Kong', 'Hong Kong', 95, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('HM', 'Heard and McDonald Islands', 'Îles Heard et McDonald', 96, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('HN', 'Honduras', 'Honduras', 97, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('HR', 'Croatia', 'Croatie', 98, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('HT', 'Haiti', 'Haïti', 99, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('HU', 'Hungary', 'Hongrie', 100, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ID', 'Indonesia', 'Indonésie', 101, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IE', 'Ireland', 'Irlande', 102, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IL', 'Israel', 'Israël', 103, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IM', 'Isle of Man', 'Île de Man', 104, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IN', 'India', 'Inde', 105, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IO', 'British Indian Ocean Territory', 'Territoire britannique de l\'océan Indien', 106, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IQ', 'Iraq', 'Irak', 107, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IR', 'Iran', 'Iran', 108, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IS', 'Iceland', 'Islande', 109, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('IT', 'Italy', 'Italie', 110, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('JE', 'Jersey', 'Jersey', 111, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('JM', 'Jamaica', 'Jamaïque', 112, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('JO', 'Jordan', 'Jordanie', 113, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('JP', 'Japan', 'Japon', 114, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KE', 'Kenya', 'Kenya', 115, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KG', 'Kyrgyzstan', 'Kirghizistan', 116, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KH', 'Cambodia', 'Cambodge', 117, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KI', 'Kiribati', 'Kiribati', 118, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KM', 'Comoros', 'Comores', 119, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KN', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis', 120, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KP', 'North Korea', 'Corée du Nord', 121, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KR', 'South Korea', 'Corée du Sud', 122, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KW', 'Kuwait', 'Koweït', 123, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KY', 'Cayman Islands', 'Îles Caïmans', 124, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('KZ', 'Kazakhstan', 'Kazakhstan', 125, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LA', 'Laos', 'Laos', 126, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LB', 'Lebanon', 'Liban', 127, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LC', 'Saint Lucia', 'Sainte-Lucie', 128, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LI', 'Liechtenstein', 'Liechtenstein', 129, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LK', 'Sri Lanka', 'Sri Lanka', 130, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LR', 'Liberia', 'Libéria', 131, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LS', 'Lesotho', 'Lesotho', 132, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LT', 'Lithuania', 'Lituanie', 133, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LU', 'Luxembourg', 'Luxembourg', 134, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LV', 'Latvia', 'Lettonie', 135, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('LY', 'Libya', 'Libye', 136, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MA', 'Morocco', 'Maroc', 137, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MC', 'Monaco', 'Monaco', 138, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MD', 'Moldova', 'Moldavie', 139, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ME', 'Montenegro', 'Monténégro', 140, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MF', 'Saint-Martin (France)', 'Saint-Martin (France)', 141, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MG', 'Madagascar', 'Madagascar', 142, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MH', 'Marshall Islands', 'Îles Marshall', 143, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MK', 'Macedonia', 'Macédoine', 144, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ML', 'Mali', 'Mali', 145, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MM', 'Myanmar', 'Myanmar', 146, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MN', 'Mongolia', 'Mongolie', 147, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MO', 'Macau', 'Macao', 148, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MP', 'Northern Mariana Islands', 'Mariannes du Nord', 149, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MQ', 'Martinique', 'Martinique', 150, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MR', 'Mauritania', 'Mauritanie', 151, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MS', 'Montserrat', 'Montserrat', 152, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MT', 'Malta', 'Malte', 153, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MU', 'Mauritius', 'Maurice', 154, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MV', 'Maldives', 'Maldives', 155, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MW', 'Malawi', 'Malawi', 156, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MX', 'Mexico', 'Mexique', 157, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MY', 'Malaysia', 'Malaisie', 158, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('MZ', 'Mozambique', 'Mozambique', 159, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NA', 'Namibia', 'Namibie', 160, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NC', 'New Caledonia', 'Nouvelle-Calédonie', 161, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NE', 'Niger', 'Niger', 162, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NF', 'Norfolk Island', 'Île Norfolk', 163, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NG', 'Nigeria', 'Nigeria', 164, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NI', 'Nicaragua', 'Nicaragua', 165, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NL', 'The Netherlands', 'Pays-Bas', 166, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NO', 'Norway', 'Norvège', 167, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NP', 'Nepal', 'Népal', 168, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NR', 'Nauru', 'Nauru', 169, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NU', 'Niue', 'Niue', 170, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('NZ', 'New Zealand', 'Nouvelle-Zélande', 171, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('OM', 'Oman', 'Oman', 172, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PA', 'Panama', 'Panama', 173, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PE', 'Peru', 'Pérou', 174, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PF', 'French Polynesia', 'Polynésie française', 175, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PG', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée', 176, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PH', 'Philippines', 'Philippines', 177, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PK', 'Pakistan', 'Pakistan', 178, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PL', 'Poland', 'Pologne', 179, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PM', 'St. Pierre and Miquelon', 'Saint-Pierre-et-Miquelon', 180, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PN', 'Pitcairn', 'Pitcairn', 181, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PR', 'Puerto Rico', 'Puerto Rico', 182, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PS', 'Palestine, State of', 'Palestine', 183, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PT', 'Portugal', 'Portugal', 184, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PW', 'Palau', 'Palau', 185, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('PY', 'Paraguay', 'Paraguay', 186, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('QA', 'Qatar', 'Qatar', 187, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('RO', 'Romania', 'Roumanie', 189, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('RS', 'Serbia', 'Serbie', 190, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('RU', 'Russian Federation', 'Russie', 191, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('RW', 'Rwanda', 'Rwanda', 192, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SA', 'Saudi Arabia', 'Arabie saoudite', 193, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SB', 'Solomon Islands', 'Îles Salomon', 194, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SC', 'Seychelles', 'Seychelles', 195, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SD', 'Sudan', 'Soudan', 196, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SE', 'Sweden', 'Suède', 197, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SG', 'Singapore', 'Singapour', 198, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SH', 'Saint Helena', 'Sainte-Hélène', 199, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SI', 'Slovenia', 'Slovénie', 200, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SJ', 'Svalbard and Jan Mayen Islands', 'Svalbard et île de Jan Mayen', 201, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SK', 'Slovakia', 'Slovaquie', 202, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SL', 'Sierra Leone', 'Sierra Leone', 203, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SM', 'San Marino', 'Saint-Marin', 204, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SN', 'Senegal', 'Sénégal', 205, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SO', 'Somalia', 'Somalie', 206, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SR', 'Suriname', 'Suriname', 207, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SS', 'South Sudan', 'Soudan du Sud', 208, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ST', 'Sao Tome and Principe', 'Sao Tomé-et-Principe', 209, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SV', 'El Salvador', 'El Salvador', 210, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SX', 'Sint Maarten (Dutch part)', 'Saint-Martin (Pays-Bas)', 211, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SY', 'Syria', 'Syrie', 212, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('SZ', 'Swaziland', 'Swaziland', 213, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TC', 'Turks and Caicos Islands', 'Îles Turks et Caicos', 214, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TD', 'Chad', 'Tchad', 215, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TF', 'French Southern Territories', 'Terres australes françaises', 216, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TG', 'Togo', 'Togo', 217, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TH', 'Thailand', 'Thaïlande', 218, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TJ', 'Tajikistan', 'Tadjikistan', 219, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TK', 'Tokelau', 'Tokelau', 220, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TL', 'Timor-Leste', 'Timor-Leste', 221, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TM', 'Turkmenistan', 'Turkménistan', 222, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TN', 'Tunisia', 'Tunisie', 223, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TO', 'Tonga', 'Tonga', 224, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TR', 'Turkey', 'Turquie', 225, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TT', 'Trinidad and Tobago', 'Trinité-et-Tobago', 226, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TV', 'Tuvalu', 'Tuvalu', 227, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TW', 'Taiwan', 'Taïwan', 228, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('TZ', 'Tanzania', 'Tanzanie', 229, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('UA', 'Ukraine', 'Ukraine', 230, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('UG', 'Uganda', 'Ouganda', 231, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('UM', 'United States Minor Outlying Islands', 'Îles mineures éloignées des États-Unis', 232, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('US', 'United States', 'États-Unis', 233, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('UY', 'Uruguay', 'Uruguay', 234, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('UZ', 'Uzbekistan', 'Ouzbékistan', 235, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('VA', 'Vatican', 'Vatican', 236, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('VC', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les-Grenadines', 237, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('VE', 'Venezuela', 'Venezuela', 238, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('VG', 'Virgin Islands (British)', 'Îles Vierges britanniques', 239, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('VI', 'Virgin Islands (U.S.)', 'Îles Vierges américaines', 240, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('VN', 'Vietnam', 'Vietnam', 241, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('VU', 'Vanuatu', 'Vanuatu', 242, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('WF', 'Wallis and Futuna Islands', 'Îles Wallis-et-Futuna', 243, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('WS', 'Samoa', 'Samoa', 244, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('YE', 'Yemen', 'Yémen', 245, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('YT', 'Mayotte', 'Mayotte', 246, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ZA', 'South Africa', 'Afrique du Sud', 247, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ZM', 'Zambia', 'Zambie', 248, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('ZW', 'Zimbabwe', 'Zimbabwe', 249, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;


-- Dumping structure for table hrms.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_val` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.country: ~1 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`country_id`, `country_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Indonesia', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


-- Dumping structure for table hrms.education
DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `education_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.education: ~5 rows (approximately)
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` (`education_id`, `education_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Senior High School', 1, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(2, 'College', 2, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(3, 'Master', 4, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(4, 'Ph.D', 5, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(5, 'University', 3, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;


-- Dumping structure for table hrms.email
DROP TABLE IF EXISTS `email`;
CREATE TABLE IF NOT EXISTS `email` (
  `email_from` varchar(50) DEFAULT NULL,
  `email_to` varchar(50) DEFAULT NULL,
  `email_cc` varchar(50) DEFAULT NULL,
  `email_bcc` varchar(50) DEFAULT NULL,
  `email_subject` varchar(50) DEFAULT NULL,
  `email_content` varchar(5000) DEFAULT NULL,
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attachment` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.email: ~0 rows (approximately)
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;


-- Dumping structure for table hrms.email_from
DROP TABLE IF EXISTS `email_from`;
CREATE TABLE IF NOT EXISTS `email_from` (
  `host` varchar(50) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `pwd` varchar(500) DEFAULT NULL,
  `security_type` varchar(50) DEFAULT NULL,
  `sender_name` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.email_from: ~1 rows (approximately)
/*!40000 ALTER TABLE `email_from` DISABLE KEYS */;
INSERT INTO `email_from` (`host`, `port`, `user_name`, `pwd`, `security_type`, `sender_name`, `updated_by`, `created_at`, `updated_at`) VALUES
	('smtp.gmail.com', 587, 'zhao.iskandar@gmail.com', 'NpSH2FYqu1Ykn+ocYtU5gNZBmcr1R4wDWbMdj9JEfeINcKECdOg5qhpuuCyf+HLLPXHJ+S1q', 'tls', 'Iskandar Tio', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42');
/*!40000 ALTER TABLE `email_from` ENABLE KEYS */;


-- Dumping structure for table hrms.email_setup
DROP TABLE IF EXISTS `email_setup`;
CREATE TABLE IF NOT EXISTS `email_setup` (
  `email_type` varchar(50) NOT NULL,
  `email_from` varchar(50) DEFAULT NULL,
  `email_to` varchar(50) DEFAULT NULL,
  `email_cc` varchar(50) DEFAULT NULL,
  `email_bcc` varchar(50) DEFAULT NULL,
  `email_subject` varchar(100) DEFAULT NULL,
  `email_content` varchar(5000) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `email_setup_id` int(11) NOT NULL AUTO_INCREMENT,
  `params` varchar(1000) DEFAULT NULL,
  `general` int(11) DEFAULT NULL,
  `email_type_name` varchar(50) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_setup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.email_setup: ~31 rows (approximately)
/*!40000 ALTER TABLE `email_setup` DISABLE KEYS */;
INSERT INTO `email_setup` (`email_type`, `email_from`, `email_to`, `email_cc`, `email_bcc`, `email_subject`, `email_content`, `updatetime`, `email_setup_id`, `params`, `general`, `email_type_name`, `attachment`, `updated_by`, `created_at`, `updated_at`) VALUES
	('forgot_password', NULL, '@email', 'iskandar.tio@gmail.com', NULL, '[GIZ e-recruitment] Forgot Password', 'Your password has been&nbsp;reset to @password. You can login using your new password<br>Regards,<br>Iskandar Tio', NULL, 1, '@email,  @password', 1, 'Forgot Password', NULL, 97, '2015-05-02 16:07:42', '2015-05-04 12:56:52'),
	('register', 'iskandar.tio@gmail.com', '@email', 'iskandar.tio@gmail.com', NULL, 'Account Activation', 'Your password is: @password Please activate by clicking this link: <br><a href="@link" data-mce-href="@link">@link</a>', NULL, 2, '@email, @link', 1, 'Registration', NULL, 97, '2015-05-02 16:07:42', '2015-05-04 12:56:58'),
	('invitation_5', NULL, '@applicant_email', 'iskandar.tio@gmail.com', NULL, '[GIZ] Negotiation for @vacancy_name', '<div>Dear @applicant_name, &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div>We would like to invite you to attend an interview for @vacancy_name&nbsp;position as attached job description on @interview_date&nbsp;at @interview_time.</div><div>&nbsp;</div><div>@interview_location<br></div><div>&nbsp;</div><div>You will have the interview with @interviewer and negotiation about your salary.</div><div>&nbsp;</div><div>Please confirm your availability for the interview.</div><div>&nbsp;</div><div>We look forward to meeting you.</div><div>&nbsp;</div><div>Best Regards,</div><div>&nbsp;</div><div><br>Fitri Kusumayanti</div><div>HR Professional</div><div>PAKLIM - Policy Advice for Environment and Climate Change</div><div>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</div><div>&nbsp;</div><div>Deutsche Gesellschaft fÃ¼r</div><div>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</div><div>c/o Kementerian Negara Lingkungan Hidup (KLH)</div><div>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</div><div>13410 Jakarta, Indonesia</div><div>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></div><div>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></div><div>M +62 8129 5346 045</div><div>E <a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></div><div><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></div><div>&nbsp;</div>', NULL, 3, '@applicant_email, @vacancy_name', NULL, NULL, '0', 97, '2015-05-02 16:07:42', '2015-05-04 19:02:55'),
	('rejection_5', NULL, '@applicant_email', 'iskandar.tio@gmail.com', NULL, 'Your application for @vacancy_name is rejected', '<p>Dear @applicant_name,<br><br>We\'re sorry to inform you that you are not good enough for this position<br><br>@signature</p>', NULL, 4, '@applicant_email', NULL, NULL, '0', 97, '2015-05-02 16:07:42', '2015-05-04 18:59:19'),
	('invitation_3', NULL, '@applicant_email', '@admin_email;iskandar.tio@gmail.com', NULL, 'First Interview', '<div>Dear @applicant_name,<br><br>We would like to invite you to attend an interview for @vacancy_name&nbsp;position as attached job description on @interview_date&nbsp;at @interview_time.</div><div>&nbsp;</div><div>@interview_location<br></div><div>&nbsp;</div><div>You will have the interview with @interviewer.</div><div>&nbsp;</div><div>Please confirm your availability for the interview.</div><div>&nbsp;</div><div>We look forward to meeting you.</div><div>&nbsp;</div><div>Best Regards,</div><div>@signature</div><div>&nbsp;<br></div>', NULL, 5, '@applicant_email, @applicant_name, @vacancy_name, @interview_date, @interview_time, @interview_location, @interviewer', NULL, NULL, '1', 97, '2015-05-02 16:07:42', '2015-05-04 19:03:52'),
	('rejection_9', NULL, '@applicant_email', 'iskandar.tio@gmail.com', NULL, '[GIZ] @vacancy_name', '<div><strong>Dear @applicant_name,</strong></div><div><strong>&nbsp;</strong></div><div><strong>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.</strong></div><div><strong>&nbsp;</strong></div><div><strong>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We do appreciate you taking the time to interview with us.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Again, thank you for your time.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%207186&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%207186&quot;&quot;&quot;&quot;">+62 21 851 7186</a></strong></div><div><strong>F <a href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%206110&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%206110&quot;&quot;&quot;&quot;">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="&quot;&quot;&quot;&quot;mailto:fitri.kusumayanti@giz.de&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;mailto:fitri.kusumayanti@giz.de&quot;&quot;&quot;&quot;">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="&quot;&quot;&quot;&quot;http://www.paklim.or.id/&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;http://www.paklim.or.id/&quot;&quot;&quot;&quot;">www.paklim.org</a></strong></div>', NULL, 6, '@applicant_email, @vacancy_name, @applicant_name', NULL, NULL, '0', 97, '2015-05-02 16:07:42', '2015-05-04 18:53:33'),
	('invitation_9', NULL, '@applicant_email', 'iskandar.tio@gmail.com', NULL, '[GIZ] Interview Invitation', '<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>We </strong><strong>would like to invite you to attend a written test&nbsp;</strong><strong>for @vacancy_name&nbsp;position as attached job description </strong><strong>o</strong><strong>n @interview_date</strong><strong>&nbsp;</strong><strong>a</strong><strong>t @interview_time.</strong></div><div><strong>&nbsp;</strong></div><div><strong>@interview_location</strong><br></div><div><strong>&nbsp;</strong></div><div><strong></strong><strong>Please confirm your availability for the test.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong><br>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></strong></div><div><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></strong></div><div>&nbsp;</div>', NULL, 7, '@applicant_email, @applicant_name, @vacancy_name, @interview_date, @interview_time, @interview_location, @interviewer', NULL, NULL, '1', 97, '2015-05-02 16:07:42', '2015-05-04 18:52:57'),
	('invitation_4', NULL, '@applicant_email', 'iskandar.tio@gmail.com', NULL, '[GIZ] Interview Invitation @vacancy_name', '<div><strong>Dear @applicant_name, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>We </strong><strong>would like to invite you to attend an interview </strong><strong>for @vacancy_name&nbsp;position as attached job description </strong><strong>o</strong><strong>n @interview_date</strong><strong>&nbsp;</strong><strong>a</strong><strong>t @interview_time.</strong></div><div><strong>&nbsp;</strong></div><div><strong>@interview_location</strong><br></div><div><strong>&nbsp;</strong></div><div><strong>You will have the interview with @interviewer.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Please confirm your availability for the interview.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong><br>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></strong></div><div><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></strong></div><div>&nbsp;</div>', NULL, 8, NULL, NULL, NULL, '1', 97, '2015-05-02 16:07:42', '2015-05-04 19:03:09'),
	('interviewer_3', NULL, '@interviewer_email', 'iskandar.tio@gmail.com', NULL, 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p>@list</p><p>Regards,<br>@signature</p>', NULL, 9, '@interviewer_email, @interviewer_name, @list', NULL, NULL, '0', 97, '2015-05-02 16:07:42', '2015-05-04 18:54:24'),
	('reference_3', NULL, '@reference_email', 'iskandar.tio@gmail.com', NULL, 'Asking for reference', '<p>Dear @reference_name,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding @applicant_name, who considered to become @vacancy_name.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for @applicant_name, as @he has putting your name as @his referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding @applicant_name\'s qualifications and skills in @vacancy_criteria, as well as your connection with @him.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p>@signature</p><p>&nbsp;</p><p>&nbsp;</p>', NULL, 10, '@reference_name, @reference_email, @applicant_name, @vacancy_criteria, @he, @his, @her', NULL, NULL, '0', 97, '2015-05-02 16:07:42', '2015-05-04 18:54:44'),
	('invitation_6', NULL, '@applicant_email', '@admin_email', NULL, 'Written Test', 'Dear @applicant_name,<br><br>We would like to invite you for written test<br><br><p>Place: @interview_date</p><p>Time: @interview_time</p><p>Location: @interview_location</p><p>Regards,<br>@signature</p><br>', NULL, 11, '@applicant_email, @applicant_name, @vacancy_name, @interview_date, @interview_time, @interview_location, @interviewer', NULL, NULL, '1', NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('interviewer_6', NULL, '@interviewer_email', NULL, NULL, 'Interview', 'Here is the list,<br>@list', NULL, 12, '@interviewer_email, @interviewer_name, @list', NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('reference_6', NULL, '@reference_email', NULL, NULL, 'Asking for reference', '<p>Dear @reference_name,&nbsp;</p><p>I hope this email finds you well.</p><p>&nbsp;First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding @applicant_name, who considered to become @vacancy_name.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for @applicant_name, as @he has putting your name as @his referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding @applicant_name\'s qualifications and skills in @vacancy_criteria, as well as your connection with @him.</p><p>We do really hope that we could receive your recommendation by Tuesday, 27th January 2015.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p>@signature</p><p>&nbsp;</p><p>&nbsp;</p>', NULL, 13, '@reference_name, @reference_email, @applicant_name, @vacancy_criteria,@signature, @he, @his, @him', NULL, NULL, NULL, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	('contract_reminder', NULL, '@admin', 'iskandar.tio@gmail.com', NULL, 'Contract Expiring Reminder', 'Below is the list of contract that will expired in @days days<br>@list', NULL, 14, '@admin,  @days, @list', 1, 'Contract Reminder', NULL, 97, '2015-05-02 16:07:42', '2015-05-04 12:56:07'),
	('contract_reminder_employee', NULL, '@employee_email', 'iskandar.tio@gmail.com', NULL, 'Contract Reminder', 'Dear @name,<br><br>Your Contract will be expired at @end<br><br>@signature', NULL, 15, '@employee_email, @name, @end, @signature, @days', 1, 'Contract Reminder Employee', NULL, 97, '2015-05-02 16:07:42', '2015-05-04 12:56:32'),
	('contract_reminder_team_leader', NULL, '@team_leader_email', 'iskandar.tio@gmail.com', NULL, 'Contract Expiring for your team', 'Dear @team_leader_name,<br><br>Below is the list of contract\'s&nbsp;that expiring in @project_name - @project_number:<br>@list<br><br>@signature', NULL, 16, '@team_leader, @team_leader_name, @project_name, @project_number, @list, @signature, @days', 1, 'Contract Reminder Team Leader', NULL, 97, '2015-05-02 16:07:42', '2015-05-04 12:56:18'),
	('rejection_3', NULL, '@applicant_email', 'iskandar.tio@gmail.com', NULL, 'Your Application', '<div>Dear @applicant_name,</div><div>&nbsp;</div><div>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.</div><div>&nbsp;</div><div>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.</div><div>&nbsp;</div><div>We do appreciate you taking the time to interview with us.</div><div>&nbsp;</div><div>Again, thank you for your time.</div><div>&nbsp;</div><div>Best Regards,</div><div>@signature</div>', NULL, 17, '@applicant_email', NULL, NULL, '0', 97, '2015-05-02 16:07:42', '2015-05-04 19:04:18'),
	('rejection_4', NULL, '@applicant_email', 'iskandar.tio@gmail.com', NULL, '[GIZ] Email Rejection for @vacancy_name', '<div><strong>Dear @applicant_name,</strong></div><div><strong>&nbsp;</strong></div><div><strong>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.</strong></div><div><strong>&nbsp;</strong></div><div><strong>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We do appreciate you taking the time to interview with us.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Again, thank you for your time.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>@signature</strong></div>', NULL, 18, '@applicant_email, @vacancy_name', NULL, NULL, '0', 97, '2015-05-04 18:56:05', '2015-05-04 18:56:05'),
	('interviewer_4', NULL, '@interviewer_email', 'iskandar.tio@gmail.com', NULL, 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p>@list</p><p>Regards,<br>@signature</p>', NULL, 19, '@interviewer_email, @vacancy_name, @list', NULL, NULL, '0', 97, '2015-05-04 18:56:40', '2015-05-04 18:57:06'),
	('reference_4', NULL, '@reference_email', 'iskandar.tio@gmail.com', NULL, 'Asking for reference', '<p>Dear @reference_name,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding @applicant_name, who considered to become @vacancy_name.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for @applicant_name, as @he has putting your name as @his referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding @applicant_name\'s qualifications and skills in @vacancy_criteria, as well as your connection with @him.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p>@signature</p><p>&nbsp;</p><p>&nbsp;</p>', NULL, 20, '@reference_name, @reference_email, @applicant_name, @vacancy_criteria, @he, @his, @her', NULL, NULL, '0', 97, '2015-05-04 18:57:32', '2015-05-04 18:58:09'),
	('interviewer_5', NULL, '@interviewer_email', 'iskandar.tio@gmail.com', NULL, 'Negotiation on @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule for negotiation.&nbsp;</p><p>@list</p><p>Regards,<br>@signature</p>', NULL, 21, NULL, NULL, NULL, '0', 97, '2015-05-04 19:02:09', '2015-05-04 19:02:09');
/*!40000 ALTER TABLE `email_setup` ENABLE KEYS */;


-- Dumping structure for table hrms.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `place_of_birth` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `giz_staff` tinyint(1) DEFAULT NULL,
  `computer_skills` varchar(500) DEFAULT NULL,
  `professional_skills` varchar(500) DEFAULT NULL,
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `applicant_status` int(11) DEFAULT NULL,
  `nationality_val` varchar(100) DEFAULT NULL,
  `contract1_start_date` datetime DEFAULT NULL,
  `contract1_end_date` datetime DEFAULT NULL,
  `am1_start_date` datetime DEFAULT NULL,
  `am1_end_date` datetime DEFAULT NULL,
  `contract2_start_date` datetime DEFAULT NULL,
  `contract2_end_date` datetime DEFAULT NULL,
  `am2_start_date` datetime DEFAULT NULL,
  `am2_end_date` datetime DEFAULT NULL,
  `adj_salary` varchar(200) DEFAULT NULL,
  `adj_salary_band` varchar(50) DEFAULT NULL,
  `adj_reason` varchar(100) DEFAULT NULL,
  `contract_state` varchar(50) DEFAULT NULL,
  `spouse_name` varchar(50) DEFAULT NULL,
  `marry_date` datetime DEFAULT NULL,
  `account_bank` varchar(50) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `spouse_entitled` int(11) DEFAULT NULL,
  `emergency_phone` varchar(50) DEFAULT NULL,
  `emergency_email` varchar(50) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee: ~4 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`first_name`, `last_name`, `place_of_birth`, `gender`, `nationality_id`, `address`, `country_id`, `province_id`, `city_id`, `post_code`, `phone1`, `phone2`, `giz_staff`, `computer_skills`, `professional_skills`, `employee_id`, `user_id`, `date_of_birth`, `country_name`, `applicant_status`, `nationality_val`, `contract1_start_date`, `contract1_end_date`, `am1_start_date`, `am1_end_date`, `contract2_start_date`, `contract2_end_date`, `am2_start_date`, `am2_end_date`, `adj_salary`, `adj_salary_band`, `adj_reason`, `contract_state`, `spouse_name`, `marry_date`, `account_bank`, `account_number`, `marital_status`, `spouse_entitled`, `emergency_phone`, `emergency_email`, `title`, `email`, `updated_by`, `created_at`, `updated_at`) VALUES
	('Amir', 'Budianto', 'jiofsd', 'Male', -1, 'fdsfds', 1, 17, 120, '123', '123', '123', NULL, 'PHP, MySQL, Java', 'Project Manager, IT Team Leader', 22, 97, '2015-03-19 00:00:00', 'test', NULL, 'Jawa', '2015-03-01 00:00:00', '2015-06-30 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Budi', '2015-04-07 00:00:00', 'BCAf', '483290482', 'Single', 1, 'csfds', 'qwe', 'Mr.', 'my.email@gmail.com', 97, '2015-05-02 16:07:42', '2015-05-13 13:00:22'),
	('Susan', 'Aulia', 'Jakarta', 'Female', 1, 'Jln. Padang', 1, 13, 72, '12345', '987651', '784561', NULL, 'Ms Word, Ms Excel', 'Research Skill', 35, 125, '1985-12-19 00:00:00', NULL, NULL, NULL, '2015-05-01 00:00:00', '2015-07-31 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Single', NULL, NULL, NULL, 'Ms.', 'susan.aulia', 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	('Bella', 'Nurul', 'Jakarta', 'Female', 1, 'jakarta', 1, 31, 156, '11250', '12345', NULL, NULL, NULL, NULL, 44, 134, '1986-04-15 00:00:00', NULL, NULL, NULL, '2015-05-05 00:00:00', '2015-06-30 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Single', NULL, NULL, NULL, 'Ms.', 'bella.nurul', 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	('Fitri', 'f', 'Jakarta', 'Female', 1, 'jakarta', 1, 31, 155, '12345', '1235', 's', NULL, 'a', NULL, 45, 137, '1980-05-05 00:00:00', NULL, NULL, NULL, '2015-05-06 00:00:00', '2015-07-31 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Married', NULL, NULL, NULL, 'Ms.', 'fitri', 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_dependent
DROP TABLE IF EXISTS `employee_dependent`;
CREATE TABLE IF NOT EXISTS `employee_dependent` (
  `employee_dependent_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `entitled` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_dependent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_dependent: ~1 rows (approximately)
/*!40000 ALTER TABLE `employee_dependent` DISABLE KEYS */;
INSERT INTO `employee_dependent` (`employee_dependent_id`, `user_id`, `relation`, `name`, `date_of_birth`, `entitled`, `updated_by`, `created_at`, `updated_at`) VALUES
	(19, 97, 'Son', 'fgfhfgh', '2015-04-07 00:00:00', 1, 97, '2015-05-02 16:07:42', '2015-05-07 14:10:28');
/*!40000 ALTER TABLE `employee_dependent` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_education
DROP TABLE IF EXISTS `employee_education`;
CREATE TABLE IF NOT EXISTS `employee_education` (
  `employee_education_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `education_id` int(11) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `year_from` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `countries_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_education: ~5 rows (approximately)
/*!40000 ALTER TABLE `employee_education` DISABLE KEYS */;
INSERT INTO `employee_education` (`employee_education_id`, `user_id`, `education_id`, `major`, `place`, `year_from`, `year_to`, `countries_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(13, 97, 2, 'dfgfd', 'gfdgf', 2000, 2003, 101, NULL, '2015-05-02 16:07:42', '2015-05-02 16:07:42'),
	(32, 125, 1, 'IPA', 'Ricci', 1996, 1999, 101, 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	(33, 125, 5, 'IT', 'Binus', 1999, 2004, 101, 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	(45, 134, 2, 'Accounting', 'Untar', 2004, 2006, 101, 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(46, 137, 1, 'a', 'a', 1999, 2002, 101, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `employee_education` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_eyeglasses
DROP TABLE IF EXISTS `employee_eyeglasses`;
CREATE TABLE IF NOT EXISTS `employee_eyeglasses` (
  `employee_eyeglasses_id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_type` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_date` varchar(500) DEFAULT NULL,
  `invoice_val` varchar(500) DEFAULT NULL,
  `claim` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `paid_status` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_eyeglasses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_eyeglasses: ~1 rows (approximately)
/*!40000 ALTER TABLE `employee_eyeglasses` DISABLE KEYS */;
INSERT INTO `employee_eyeglasses` (`employee_eyeglasses_id`, `claim_type`, `user_id`, `invoice_date`, `invoice_val`, `claim`, `paid`, `paid_status`, `remarks`, `updated_by`, `created_at`, `updated_at`) VALUES
	(16, 'Frame', 97, '2015-05-05', '800000', 800000, 750000, 1, '', 125, '2015-05-05 14:06:04', '2015-05-05 14:06:17');
/*!40000 ALTER TABLE `employee_eyeglasses` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_history
DROP TABLE IF EXISTS `employee_history`;
CREATE TABLE IF NOT EXISTS `employee_history` (
  `applicants_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `contract1_start_date` date DEFAULT NULL,
  `contract1_end_date` date DEFAULT NULL,
  `am1_start_date` date DEFAULT NULL,
  `am1_end_date` date DEFAULT NULL,
  `contract2_start_date` date DEFAULT NULL,
  `contract2_end_date` date DEFAULT NULL,
  `am2_start_date` date DEFAULT NULL,
  `am2_end_date` date DEFAULT NULL,
  `severance` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `new_severance` int(11) DEFAULT NULL,
  `terminate_date` datetime DEFAULT NULL,
  `housing` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `employee_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_history` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_language
DROP TABLE IF EXISTS `employee_language`;
CREATE TABLE IF NOT EXISTS `employee_language` (
  `employee_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(50) DEFAULT NULL,
  `language_skill_id` int(50) DEFAULT NULL,
  `language_val` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_language_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_language: ~11 rows (approximately)
/*!40000 ALTER TABLE `employee_language` DISABLE KEYS */;
INSERT INTO `employee_language` (`employee_language_id`, `user_id`, `language_id`, `language_skill_id`, `language_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(3, 97, -1, 4, ' Holland', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(4, 97, 2, 3, NULL, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(40, 125, 1, 1, NULL, 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	(41, 125, 2, 3, NULL, 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	(42, 125, 3, 4, NULL, 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	(67, 134, 1, 1, NULL, 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(68, 134, 2, 3, NULL, 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(69, 134, 3, 2, NULL, 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(70, 137, 1, 1, NULL, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21'),
	(71, 137, 2, 5, NULL, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21'),
	(72, 137, 3, 4, NULL, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `employee_language` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_medical_checkup
DROP TABLE IF EXISTS `employee_medical_checkup`;
CREATE TABLE IF NOT EXISTS `employee_medical_checkup` (
  `employee_medical_checkup_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `invoice_date` varchar(500) DEFAULT NULL,
  `invoice_val` varchar(500) DEFAULT NULL,
  `claim` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `paid_status` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_medical_checkup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_medical_checkup: ~0 rows (approximately)
/*!40000 ALTER TABLE `employee_medical_checkup` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_medical_checkup` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_outpatient
DROP TABLE IF EXISTS `employee_outpatient`;
CREATE TABLE IF NOT EXISTS `employee_outpatient` (
  `employee_outpatient_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_val` int(11) DEFAULT NULL,
  `claim` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `paid_status` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_outpatient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_outpatient: ~6 rows (approximately)
/*!40000 ALTER TABLE `employee_outpatient` DISABLE KEYS */;
INSERT INTO `employee_outpatient` (`employee_outpatient_id`, `user_id`, `invoice_date`, `invoice_val`, `claim`, `paid`, `input_date`, `paid_status`, `remarks`, `updated_by`, `created_at`, `updated_at`) VALUES
	(42, 97, '2015-04-28 00:00:00', 200000, 200000, 180000, '2015-04-28 00:00:00', 1, 'gfdgfd', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(43, 97, '2015-04-29 00:00:00', 350000, 350000, 315000, '2015-04-28 00:00:00', 1, 'ifhdsui hfudsi', 97, '2015-05-02 16:07:43', '2015-05-05 01:28:36'),
	(44, 97, '2015-04-28 00:00:00', -60000, -60000, -54000, '2015-05-05 00:00:00', 1, 'salah bayar', 125, '2015-05-02 16:07:43', '2015-05-05 13:54:30'),
	(46, 97, '2015-05-05 00:00:00', 210000, 210000, 189000, '2015-05-05 00:00:00', 1, 'obat', 125, '2015-05-05 01:25:38', '2015-05-05 13:54:31'),
	(47, 97, '2015-05-05 00:00:00', 50000, 50000, 45000, '2015-05-05 00:00:00', 1, '', 125, '2015-05-05 13:53:42', '2015-05-05 13:54:32'),
	(48, 97, '2015-05-13 00:00:00', 75000, 75000, 67500, '2015-05-13 00:00:00', NULL, '', 97, '2015-05-13 13:12:32', '2015-05-13 13:12:32');
/*!40000 ALTER TABLE `employee_outpatient` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_pregnancy
DROP TABLE IF EXISTS `employee_pregnancy`;
CREATE TABLE IF NOT EXISTS `employee_pregnancy` (
  `employee_pregnancy_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_val` int(11) DEFAULT NULL,
  `claim` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `paid_status` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_pregnancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_pregnancy: ~2 rows (approximately)
/*!40000 ALTER TABLE `employee_pregnancy` DISABLE KEYS */;
INSERT INTO `employee_pregnancy` (`employee_pregnancy_id`, `user_id`, `invoice_date`, `invoice_val`, `claim`, `paid`, `input_date`, `paid_status`, `remarks`, `updated_by`, `created_at`, `updated_at`) VALUES
	(24, 97, '2015-05-05 00:00:00', 750000, 750000, 675000, '2015-05-05 00:00:00', NULL, 'rs ', 97, '2015-05-05 01:36:09', '2015-05-05 01:36:09'),
	(25, 97, '2015-05-05 00:00:00', 10000, 10000, 9000, '2015-05-05 00:00:00', NULL, 'medicine', 97, '2015-05-05 01:37:19', '2015-05-05 01:37:35');
/*!40000 ALTER TABLE `employee_pregnancy` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_working
DROP TABLE IF EXISTS `employee_working`;
CREATE TABLE IF NOT EXISTS `employee_working` (
  `employee_working_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `month_from` int(11) DEFAULT NULL,
  `year_from` int(11) DEFAULT NULL,
  `month_to` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `employer` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `may_contact` tinyint(1) DEFAULT NULL,
  `leave_reason` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `countries_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_working_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_working: ~4 rows (approximately)
/*!40000 ALTER TABLE `employee_working` DISABLE KEYS */;
INSERT INTO `employee_working` (`employee_working_id`, `user_id`, `month_from`, `year_from`, `month_to`, `year_to`, `employer`, `job_title`, `business_id`, `may_contact`, `leave_reason`, `email`, `phone`, `countries_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(26, 125, 5, 2004, 1, 2007, 'IT Solusindo', 'Staff', 2, 1, NULL, 'james.watt', NULL, 101, 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	(27, 125, 3, 2000, 5, 2004, 'fdsfds', 'fdsfsd', 2, 1, NULL, NULL, NULL, 8, 97, '2015-05-04 21:35:17', '2015-05-04 21:35:17'),
	(39, 134, 1, 2008, 1, 2010, 'My Employer', 'Staff', 3, 0, 'No Reason', NULL, NULL, 15, 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(40, 137, 1, 2000, 1, 2003, 'Employer', 'employer', 4, 0, NULL, NULL, NULL, 15, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `employee_working` ENABLE KEYS */;


-- Dumping structure for table hrms.filter_choice
DROP TABLE IF EXISTS `filter_choice`;
CREATE TABLE IF NOT EXISTS `filter_choice` (
  `filter_choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_choice_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`filter_choice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.filter_choice: ~10 rows (approximately)
/*!40000 ALTER TABLE `filter_choice` DISABLE KEYS */;
INSERT INTO `filter_choice` (`filter_choice_id`, `filter_choice_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Name', 1, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(2, 'Place of Birth', 2, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'Gender', 3, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(4, 'Marital Status', 4, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(5, 'Nationality', 5, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(6, 'Address', 6, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(7, 'Country', 7, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(8, 'City', 9, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(9, 'Province', 8, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(10, 'Post Code', 10, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `filter_choice` ENABLE KEYS */;


-- Dumping structure for table hrms.gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.gender: ~2 rows (approximately)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`gender_id`, `gender`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(2, 'Female', 2, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'Male', 3, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;


-- Dumping structure for table hrms.job_applied
DROP TABLE IF EXISTS `job_applied`;
CREATE TABLE IF NOT EXISTS `job_applied` (
  `job_applied_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_applied` datetime DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  `vacancy_shortlist` int(11) DEFAULT '0',
  `next_vacancy_progress_id` int(11) DEFAULT NULL,
  `salary_expectation` int(11) DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_applied_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.job_applied: ~5 rows (approximately)
/*!40000 ALTER TABLE `job_applied` DISABLE KEYS */;
INSERT INTO `job_applied` (`job_applied_id`, `vacancy_id`, `user_id`, `date_applied`, `description`, `vacancy_progress_id`, `vacancy_shortlist`, `next_vacancy_progress_id`, `salary_expectation`, `negotiable`, `updated_by`, `created_at`, `updated_at`) VALUES
	(4, 3, 113, '2015-05-04 15:12:11', NULL, 6, 0, -1, 5500000, 1, 97, '2015-05-04 15:12:11', '2015-05-05 09:13:09'),
	(5, 3, 115, '2015-05-04 22:47:20', NULL, 6, 0, 1000, 7000000, 1, 97, '2015-05-04 22:47:20', '2015-05-05 09:21:58'),
	(6, 3, 116, '2015-05-04 22:50:55', NULL, 3, 1, 6, 5000000, 0, 97, '2015-05-04 22:50:55', '2015-05-09 15:26:58'),
	(7, 3, 114, '2015-05-05 09:46:12', NULL, 3, 1, 4, 5000000, 1, 97, '2015-05-05 09:46:12', '2015-05-09 15:27:27'),
	(8, 1, 136, '2015-05-05 13:33:41', NULL, 6, 0, 1000, 2000000, 1, 97, '2015-05-05 13:33:41', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `job_applied` ENABLE KEYS */;


-- Dumping structure for table hrms.job_position
DROP TABLE IF EXISTS `job_position`;
CREATE TABLE IF NOT EXISTS `job_position` (
  `job_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_position` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.job_position: ~2 rows (approximately)
/*!40000 ALTER TABLE `job_position` DISABLE KEYS */;
INSERT INTO `job_position` (`job_position_id`, `job_position`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Head of Accounting', 1, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'Accounting Staff', 2, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `job_position` ENABLE KEYS */;


-- Dumping structure for table hrms.job_title
DROP TABLE IF EXISTS `job_title`;
CREATE TABLE IF NOT EXISTS `job_title` (
  `job_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.job_title: ~3 rows (approximately)
/*!40000 ALTER TABLE `job_title` DISABLE KEYS */;
INSERT INTO `job_title` (`job_title_id`, `job_title`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Senior Advisor', 2, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(2, 'Senior Manager', 1, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'Principal Advisor', 3, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `job_title` ENABLE KEYS */;


-- Dumping structure for table hrms.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.language: ~3 rows (approximately)
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`language_id`, `language_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Indonesian', 1, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(2, 'English', 2, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'German', 3, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;


-- Dumping structure for table hrms.language_skill
DROP TABLE IF EXISTS `language_skill`;
CREATE TABLE IF NOT EXISTS `language_skill` (
  `language_skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_skill_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.language_skill: ~5 rows (approximately)
/*!40000 ALTER TABLE `language_skill` DISABLE KEYS */;
INSERT INTO `language_skill` (`language_skill_id`, `language_skill_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Mother Tongue', 1, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(2, 'Advanced', 4, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'Intermediate', 3, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(4, 'Basic', 2, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(5, 'None', 6, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `language_skill` ENABLE KEYS */;


-- Dumping structure for table hrms.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(50) DEFAULT NULL,
  `location_val` varchar(1000) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.location: ~2 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`location_id`, `location_code`, `location_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(2, 'Wisma Bakrie2', '<p>Location:</p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href="ffds" data-mce-href="ffds">ffds</a>gfdgtr</p>', 97, '2015-05-02 16:07:43', '2015-05-05 01:51:02'),
	(3, 'KLH', '<p>Kementrian Lingkungan Hidup</p><p>Gedung Otorita Batam<br>Jln. jdisoa jfiods no.23<br>gfdjior</p>', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;


-- Dumping structure for table hrms.marital_status
DROP TABLE IF EXISTS `marital_status`;
CREATE TABLE IF NOT EXISTS `marital_status` (
  `marital_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `marital_status` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`marital_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.marital_status: ~2 rows (approximately)
/*!40000 ALTER TABLE `marital_status` DISABLE KEYS */;
INSERT INTO `marital_status` (`marital_status_id`, `marital_status`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Single', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(2, 'Married', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `marital_status` ENABLE KEYS */;


-- Dumping structure for table hrms.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table hrms.migrations: ~2 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`, `updated_by`, `created_at`, `updated_at`) VALUES
	('2014_10_12_000000_create_users_table', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	('2014_10_12_100000_create_password_resets_table', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table hrms.month_options
DROP TABLE IF EXISTS `month_options`;
CREATE TABLE IF NOT EXISTS `month_options` (
  `month_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_id` int(11) DEFAULT NULL,
  `month_name` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`month_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.month_options: ~0 rows (approximately)
/*!40000 ALTER TABLE `month_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `month_options` ENABLE KEYS */;


-- Dumping structure for table hrms.m_category
DROP TABLE IF EXISTS `m_category`;
CREATE TABLE IF NOT EXISTS `m_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_category: ~8 rows (approximately)
/*!40000 ALTER TABLE `m_category` DISABLE KEYS */;
INSERT INTO `m_category` (`category_id`, `category_name`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Employee Database', 1, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(2, 'Master Data', 8, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'Statistics', 6, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(4, 'Recruitment', 3, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(5, 'Employee Self Service', 4, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(6, 'Applicant Data', 5, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(7, 'Medical', 7, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(9, 'Employee Contract', 2, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43');
/*!40000 ALTER TABLE `m_category` ENABLE KEYS */;


-- Dumping structure for table hrms.m_module
DROP TABLE IF EXISTS `m_module`;
CREATE TABLE IF NOT EXISTS `m_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) DEFAULT NULL,
  `module_description` varchar(50) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `sub_module` varchar(2000) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_module: ~50 rows (approximately)
/*!40000 ALTER TABLE `m_module` DISABLE KEYS */;
INSERT INTO `m_module` (`module_id`, `module_name`, `module_description`, `status_id`, `category_id`, `sort_id`, `sub_module`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'employee', 'Employee List', 1, 1, 1, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(3, 'accept_employee', 'Accept Employee', 1, 4, 26, NULL, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(4, 'call_interview', 'Call Interview', 1, 4, 25, NULL, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(5, 'self_data', 'My Self', 1, 5, 5, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(6, 'superadmin', 'Super Admin', 1, 2, 6, '', 97, '2015-05-02 16:07:43', '2015-05-02 18:54:39'),
	(7, 'applicant', 'Personal Data', 1, 6, 7, NULL, NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(8, 'contract_expiring', 'Contract Expiring', 1, 9, 8, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(9, 'education', 'Education', 1, 6, 9, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(10, 'employee_statistics', 'Employee Statistics', 1, 3, 10, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(11, 'eyeglasses', 'Eye Glasses', 1, 7, 15, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(12, 'filter_applicant', 'Filter Applicant', 1, 4, 24, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(13, 'former_employee', 'Former Employee', 1, 1, 13, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(14, 'language', 'Language', 1, 6, 14, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(15, 'location', 'Interview Location', 1, 2, 18, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(16, 'medical_checkup', 'Medical Checkup', 1, 7, 17, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(17, 'medical_summary', 'Medical Summary', 1, 7, 20, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(18, 'others', 'Others', 1, 2, 23, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(19, 'outpatient', 'Outpatient', 1, 7, 11, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(20, 'pay_medical', 'Pay Medical', 1, 7, 19, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(21, 'position_applied', 'Position Applied', 1, 6, 21, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(23, 'project', 'Project', 1, 2, 2, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(24, 'question', 'Questions', 1, 4, 4, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(25, 'recruitment', 'Recruitment', 1, 4, 27, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(26, 'recruitment_report', 'Recruitment Report', 1, 4, 34, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(27, 'recruitment_summary', 'Recruitment Summary', 1, 4, 35, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(28, 'references', 'References', 1, 6, 28, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(29, 'region', 'Region', 1, 2, 29, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(30, 'salary', 'Salary Adjustment', 1, 1, 30, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(31, 'settings', 'Settings', 1, 2, 31, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(32, 'statistics', 'Recruitment Statistics', 1, 3, 32, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(33, 'uploadcv', 'Upload CV+Cover Letter', 1, 6, 33, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(34, 'vacancy', 'Vacancy', 1, 4, 12, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(35, 'vacancy_progress', 'Setup Recruitment Email', 1, 4, 3, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(36, 'working', 'Working Experiences', 1, 6, 37, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(37, 'email_setting', 'Email Setting', 1, 2, 38, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(38, 'change_password', 'Change Password', 1, 5, 39, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(40, 'pregnancy', 'Pregnancy', 1, 7, 16, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(41, 'update_contract_data', 'Update Contract Data', 1, 9, 40, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(42, 'employee_detail', 'Employee Detail', 1, 1, 41, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(43, 'print_recruitment_summary', 'Print Recruitment Summary', 1, 4, 42, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(44, 'employee_om', 'Employee for OM', 1, 1, 43, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(45, 'employee_detail_om', 'Employee Detail for OM', 1, 1, 44, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(46, 'print_hrsr', 'Print HRSR', 1, 1, 45, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(47, 'downloadcv', 'Download CV', 1, 6, 46, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(48, 'upload', 'Upload Photo and Pictures', 1, 1, 47, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(49, 'print_outpatient_data', 'Print Outpatient Data', 1, 7, 48, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(50, 'print_pregnancy_data', 'Print Pregnancy Data', 1, 7, 49, '1', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(51, 'employee_pa', 'Employee for PA', 1, 1, 50, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(52, 'terminate', 'Resign/Terminate', 1, 9, 51, '', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(53, 'change_log', 'Change Log', 1, 2, 52, '', 97, '2015-05-02 18:49:18', '2015-05-02 18:49:18');
/*!40000 ALTER TABLE `m_module` ENABLE KEYS */;


-- Dumping structure for table hrms.m_role
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE IF NOT EXISTS `m_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_description` varchar(100) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_role: ~7 rows (approximately)
/*!40000 ALTER TABLE `m_role` DISABLE KEYS */;
INSERT INTO `m_role` (`role_id`, `role_name`, `role_description`, `status_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'applicant', 'Applicant', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(2, 'hr', 'HR Manager', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(3, 'employee', 'Employee', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(6, 'superadmin', 'Super Admin', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 'office manager', 'Office Manager', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(8, 'finance', 'Finance', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(9, 'principal advisor', 'Principal Advisor', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `m_role` ENABLE KEYS */;


-- Dumping structure for table hrms.m_role_module
DROP TABLE IF EXISTS `m_role_module`;
CREATE TABLE IF NOT EXISTS `m_role_module` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `module_id` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_role_module: ~67 rows (approximately)
/*!40000 ALTER TABLE `m_role_module` DISABLE KEYS */;
INSERT INTO `m_role_module` (`role_id`, `module_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 7, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 9, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 14, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 21, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 28, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 33, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 36, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 47, 97, '2015-05-04 23:46:21', '2015-05-04 23:46:21'),
	(2, 1, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 3, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 4, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 5, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 8, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 10, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 11, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 12, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 13, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 15, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 16, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 17, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 18, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 19, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 23, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 24, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 27, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 29, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 30, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 31, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 32, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 34, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 35, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 37, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 38, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 40, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 41, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 42, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 43, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 46, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 47, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 48, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 49, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 50, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 52, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(2, 53, 125, '2015-05-05 12:47:57', '2015-05-05 12:47:57'),
	(3, 5, 97, '2015-05-04 23:46:10', '2015-05-04 23:46:10'),
	(3, 25, 97, '2015-05-04 23:46:10', '2015-05-04 23:46:10'),
	(3, 26, 97, '2015-05-04 23:46:10', '2015-05-04 23:46:10'),
	(3, 38, 97, '2015-05-04 23:46:10', '2015-05-04 23:46:10'),
	(3, 47, 97, '2015-05-04 23:46:21', '2015-05-04 23:46:21'),
	(6, 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(6, 6, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(6, 38, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 11, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 16, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 17, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 19, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 38, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 40, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 44, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 45, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 46, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(7, 48, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(8, 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(8, 20, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(8, 38, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(9, 51, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `m_role_module` ENABLE KEYS */;


-- Dumping structure for table hrms.m_user
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE IF NOT EXISTS `m_user` (
  `pwd` varchar(1000) DEFAULT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `activation_code` varchar(50) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- Dumping data for table hrms.m_user: ~10 rows (approximately)
/*!40000 ALTER TABLE `m_user` DISABLE KEYS */;
INSERT INTO `m_user` (`pwd`, `user_id`, `user_name`, `activation_code`, `status_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 97, 'amir', 'zs5tc7jvmtdrvch8r7s3hzvw4vnxr2', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 113, 'susan.aulia', 'fbxm3drzwjmn6w874yfrt8cp68p2h3', 1, 0, '2015-05-04 13:20:58', '2015-05-04 14:33:26'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 114, 'kevin.arief', '3546j863s8tyr7bdsspdpbmts4hph6', 1, 0, '2015-05-04 16:19:25', '2015-05-05 09:42:57'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 115, 'bella.nurul', 'bt77kbb7tbscmmj2f4dvzr33688fwc', 1, 0, '2015-05-04 16:21:12', '2015-05-04 16:23:47'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 116, 'angga.aditya', 'rxcph4sndj8vwfbdjzc4738xxnr5df', 1, 0, '2015-05-04 16:22:12', '2015-05-04 16:23:29'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 125, 'susan.giz', '8rwpf5wz2ktvt42v6kh7hvr5hwrhs7', 1, 125, '2015-05-04 21:35:17', '2015-05-04 23:26:25'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 134, 'bella.giz', 'xxz3shf454p8dv76wptc5jtjpbjrws', 1, 134, '2015-05-05 09:21:58', '2015-05-05 09:25:54'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 135, 'kevin.halim', 'v6vbj67w5sdppy46kcv2zsd4cdz3fh', 1, 0, '2015-05-05 10:57:47', '2015-05-05 10:58:02'),
	('1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 136, 'fitri', 'hwrxf2fpy52d8n225k4crdcp7tf4d8', 1, 0, '2015-05-05 13:23:25', '2015-05-05 13:23:52'),
	(NULL, 137, '', NULL, NULL, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `m_user` ENABLE KEYS */;


-- Dumping structure for table hrms.m_user_role
DROP TABLE IF EXISTS `m_user_role`;
CREATE TABLE IF NOT EXISTS `m_user_role` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_user_role: ~21 rows (approximately)
/*!40000 ALTER TABLE `m_user_role` DISABLE KEYS */;
INSERT INTO `m_user_role` (`role_id`, `user_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 103, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(1, 112, NULL, '2015-05-04 12:52:54', '2015-05-04 12:52:54'),
	(1, 113, NULL, '2015-05-04 13:20:58', '2015-05-04 13:20:58'),
	(1, 114, 0, '2015-05-04 16:19:25', '2015-05-04 16:19:25'),
	(1, 115, 0, '2015-05-04 16:21:12', '2015-05-04 16:21:12'),
	(1, 116, 0, '2015-05-04 16:22:12', '2015-05-04 16:22:12'),
	(1, 135, 0, '2015-05-05 10:57:47', '2015-05-05 10:57:47'),
	(1, 136, 0, '2015-05-05 13:23:25', '2015-05-05 13:23:25'),
	(2, 97, 97, '2015-05-05 09:50:39', '2015-05-05 09:50:39'),
	(3, 103, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(3, 106, 97, '2015-05-02 18:10:45', '2015-05-02 18:10:45'),
	(3, 111, 97, '2015-05-02 19:56:49', '2015-05-02 19:56:49'),
	(3, 125, 125, '2015-05-05 12:47:19', '2015-05-05 12:47:19'),
	(3, 134, 97, '2015-05-05 09:24:55', '2015-05-05 09:24:55'),
	(6, 104, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(6, 125, 125, '2015-05-05 12:47:19', '2015-05-05 12:47:19'),
	(7, 134, 97, '2015-05-05 09:26:38', '2015-05-05 09:26:38'),
	(8, 69, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(8, 125, 125, '2015-05-05 12:47:19', '2015-05-05 12:47:19'),
	(9, 125, 125, '2015-05-05 12:47:19', '2015-05-05 12:47:19'),
	(9, 134, 97, '2015-05-05 09:38:02', '2015-05-05 09:38:02');
/*!40000 ALTER TABLE `m_user_role` ENABLE KEYS */;


-- Dumping structure for table hrms.nationality
DROP TABLE IF EXISTS `nationality`;
CREATE TABLE IF NOT EXISTS `nationality` (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.nationality: ~11 rows (approximately)
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` (`nationality_id`, `nationality_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Indonesia', 4, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(2, 'Germany', 3, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(3, 'Singapore', 9, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(4, 'Malaysia', 6, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(5, 'Brunei Darussalam', 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(8, 'Myanmar', 7, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(9, 'Philippines', 8, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(10, 'Thailand', 10, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(11, 'Vietnam', 11, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(12, 'Laos', 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(13, 'Cambodia', 2, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;


-- Dumping structure for table hrms.project_location
DROP TABLE IF EXISTS `project_location`;
CREATE TABLE IF NOT EXISTS `project_location` (
  `project_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_location` varchar(50) DEFAULT NULL,
  `office_manager` int(11) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.project_location: ~3 rows (approximately)
/*!40000 ALTER TABLE `project_location` DISABLE KEYS */;
INSERT INTO `project_location` (`project_location_id`, `project_location`, `office_manager`, `project_name`, `start_date`, `end_date`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Jakarta GIZ', 125, 'PAKLIM', '2015-02-01 00:00:00', '2015-02-10 00:00:00', 97, '2015-05-02 16:07:44', '2015-05-04 21:59:26'),
	(2, 'Jakarta Nama-Sutri', 134, 'Nama-Sutri', '2015-01-01 00:00:00', NULL, 97, '2015-05-02 16:07:44', '2015-05-05 09:24:28'),
	(4, 'Jakarta GIZ2', 125, 'PAKLIM2', '2015-02-11 00:00:00', '3000-12-31 00:00:00', 97, '2015-05-02 16:07:44', '2015-05-04 21:59:35');
/*!40000 ALTER TABLE `project_location` ENABLE KEYS */;


-- Dumping structure for table hrms.project_name
DROP TABLE IF EXISTS `project_name`;
CREATE TABLE IF NOT EXISTS `project_name` (
  `project_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) DEFAULT NULL,
  `principal_advisor` int(11) DEFAULT NULL,
  `financial_controller` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.project_name: ~3 rows (approximately)
/*!40000 ALTER TABLE `project_name` DISABLE KEYS */;
INSERT INTO `project_name` (`project_name_id`, `project_name`, `principal_advisor`, `financial_controller`, `start_date`, `end_date`, `updated_by`, `created_at`, `updated_at`) VALUES
	(3, 'PAKLIM', 125, 125, '2015-01-01 00:00:00', '2015-02-05 00:00:00', 97, '2015-05-02 16:07:44', '2015-05-04 21:58:19'),
	(5, 'Nama-Sutri', 134, 125, NULL, NULL, 97, '2015-05-02 16:07:44', '2015-05-05 09:37:34'),
	(6, 'PAKLIM2', 125, 125, '2015-02-06 00:00:00', '2015-03-31 00:00:00', 97, '2015-05-02 16:07:44', '2015-05-04 21:58:28');
/*!40000 ALTER TABLE `project_name` ENABLE KEYS */;


-- Dumping structure for table hrms.project_number
DROP TABLE IF EXISTS `project_number`;
CREATE TABLE IF NOT EXISTS `project_number` (
  `project_number_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_number` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `team_leader` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_number_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.project_number: ~2 rows (approximately)
/*!40000 ALTER TABLE `project_number` DISABLE KEYS */;
INSERT INTO `project_number` (`project_number_id`, `project_number`, `project_name`, `team_leader`, `start_date`, `end_date`, `updated_by`, `created_at`, `updated_at`) VALUES
	(2, '001', 'Nama-Sutri', 125, NULL, NULL, 97, '2015-05-02 16:07:44', '2015-05-04 21:58:48'),
	(3, '001-PAK', 'PAKLIM', 125, NULL, NULL, 97, '2015-05-02 16:07:44', '2015-05-04 21:58:54');
/*!40000 ALTER TABLE `project_number` ENABLE KEYS */;


-- Dumping structure for table hrms.province
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_val` varchar(50) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.province: ~34 rows (approximately)
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` (`province_id`, `province_val`, `region_id`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(11, 'Aceh', 1, 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(12, 'Sumatera Utara', 1, 2, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(13, 'Sumatera Barat', 1, 3, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(14, 'Riau', 1, 4, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(15, 'Jambi', 1, 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(16, 'Sumatera Selatan', 1, 6, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(17, 'Bengkulu', 1, 7, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(18, 'Lampung', 1, 8, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(19, 'Kepulauan Bangka Belitung', 1, 9, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(21, 'Kepulauan Riau', 1, 10, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(31, 'Dki Jakarta', 7, 2, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(32, 'Jawa Barat', 7, 3, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(33, 'Jawa Tengah', 7, 4, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(34, 'Di Yogyakarta', 7, 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(35, 'Jawa Timur', 7, 6, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(36, 'Banten', 7, 11, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(51, 'Bali', 3, 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(52, 'Nusa Tenggara Barat', 3, 2, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(53, 'Nusa Tenggara Timur', 3, 3, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(61, 'Kalimantan Barat', 3, 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(62, 'Kalimantan Tengah', 3, 2, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(63, 'Kalimantan Selatan', 3, 3, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(64, 'Kalimantan Timur', 3, 4, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(65, 'Kalimantan Utara', 3, 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(71, 'Sulawesi Utara', 5, 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(72, 'Sulawesi Tengah', 5, 2, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(73, 'Sulawesi Selatan', 5, 3, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(74, 'Sulawesi Tenggara', 5, 4, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(75, 'Gorontalo', 5, 5, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(76, 'Sulawesi Barat', 5, 6, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(81, 'Maluku', 6, 1, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(82, 'Maluku Utara', 6, 2, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(91, 'Papua Barat', 6, 3, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(94, 'Papua', 6, 4, NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;


-- Dumping structure for table hrms.question
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_val` varchar(1000) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.question: ~6 rows (approximately)
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`question_id`, `question_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Manage the team', 97, '2015-05-02 16:07:44', '2015-05-04 15:34:24'),
	(2, 'Experiences on Capacity Building', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(5, 'Experiences in accounting', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(9, 'Experiences in finance', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(15, ' Experiences in general administration', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(16, 'Experiences in inventory', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Dumping structure for table hrms.ranking
DROP TABLE IF EXISTS `ranking`;
CREATE TABLE IF NOT EXISTS `ranking` (
  `ranking_id` int(11) NOT NULL AUTO_INCREMENT,
  `ranking_val` varchar(40) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ranking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.ranking: ~3 rows (approximately)
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
INSERT INTO `ranking` (`ranking_id`, `ranking_val`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'A', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(2, 'B', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44'),
	(3, 'C', NULL, '2015-05-02 16:07:44', '2015-05-02 16:07:44');
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;


-- Dumping structure for table hrms.region
DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.region: ~6 rows (approximately)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`region_id`, `region_val`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Sumatera', 1, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(3, 'Kalimantan', 6, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, 'Sulawesi', 5, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(6, 'Maluku dan Papua', 7, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(7, 'Jawa', 4, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(8, 'Kalimantan', 8, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;


-- Dumping structure for table hrms.relation
DROP TABLE IF EXISTS `relation`;
CREATE TABLE IF NOT EXISTS `relation` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `relation` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.relation: ~3 rows (approximately)
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` (`relation_id`, `relation`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(2, 'Son', 2, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(3, 'Daughter', 3, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(4, 'Father', 4, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;


-- Dumping structure for table hrms.salary_band
DROP TABLE IF EXISTS `salary_band`;
CREATE TABLE IF NOT EXISTS `salary_band` (
  `salary_band` varchar(50) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_band`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_band: ~11 rows (approximately)
/*!40000 ALTER TABLE `salary_band` DISABLE KEYS */;
INSERT INTO `salary_band` (`salary_band`, `updated_by`, `created_at`, `updated_at`) VALUES
	('1', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('2A', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('2T', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('3A', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('3T', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('4A', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('4T', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('5A', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('5T', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('6A', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	('6T', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45');
/*!40000 ALTER TABLE `salary_band` ENABLE KEYS */;


-- Dumping structure for table hrms.salary_enc
DROP TABLE IF EXISTS `salary_enc`;
CREATE TABLE IF NOT EXISTS `salary_enc` (
  `contract_history_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `salary_enc` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contract_history_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_enc: ~8 rows (approximately)
/*!40000 ALTER TABLE `salary_enc` DISABLE KEYS */;
INSERT INTO `salary_enc` (`contract_history_id`, `user_id`, `salary_enc`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 4, 'Ïh)®ƒ]IsƒÑ›¦ŸqS?gLùK>-âÍPºÈSärª‰êÃM', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(2, 4, 's°7‹Ù¡èfQ7<Ì/lOaèùÏná|†¬£>šas*a°`‡', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(3, 4, '¢^ ÊdîÆE›o«{Ø}C¹5q-4o¯e8þ)Øá\'­”%Y™', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(29, 4, 'ë2Ž:\\h£ó<ìó(`JÁÁYxñ,Õ«-‹ñ|“ÈPˆø2b:™Lz', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(30, 4, 'KU¡ÇÔAU­~2Ø´Ìw†>ƒ8W¢…®¢¡îà®±Qa£ý–óIÏ', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(55, 4, 'èÛ®m9€®ší¦®$œÆƒìµÎL¢nÖs‹GéÜÂ6Œ±±Øf', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(58, 4, '›³HV¨z]o²l|ÍÅ!%(Ñ÷¬¨›mÙ³3<Û\r8sUA\n#[.(', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(59, 4, 'üDîDFï©PÅJŽh	ÑsJ>Ìfr$¿ŒZ‘à\\(\0‡oi©¶', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45');
/*!40000 ALTER TABLE `salary_enc` ENABLE KEYS */;


-- Dumping structure for table hrms.salary_enc2
DROP TABLE IF EXISTS `salary_enc2`;
CREATE TABLE IF NOT EXISTS `salary_enc2` (
  `contract_history_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `salary_enc` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_enc2: ~5 rows (approximately)
/*!40000 ALTER TABLE `salary_enc2` DISABLE KEYS */;
INSERT INTO `salary_enc2` (`contract_history_id`, `user_id`, `salary_enc`, `updated_by`, `created_at`, `updated_at`) VALUES
	(3, 56, '!bÊ‚ßô\rRªµC(ùŠRÂ€aZzoza\'›2X™MaÚÏÛ½', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(59, 5, 'môª§òyJ/Æv:ŸðÁ6¡Ó3Oøéêí™›äîXI\'|ùÐ', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(55, 9, 'y$SâË÷6ƒ6áU?_ w,¾A¤µîîH*ò¦¿Foo0ðEmu&', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(29, 59, 'AwWTiC!¡§EÃÛˆ·‘Õ’€ð/"¹ž‡à^âÓ¾®€ÆÔ®±›ûÝ\'^', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(30, 60, 'eªvÚãU³þ–‘¤V>?\\û>;÷Wm6{~ÕAlSÍ( Ÿèë|\\', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45');
/*!40000 ALTER TABLE `salary_enc2` ENABLE KEYS */;


-- Dumping structure for table hrms.salary_enc_history
DROP TABLE IF EXISTS `salary_enc_history`;
CREATE TABLE IF NOT EXISTS `salary_enc_history` (
  `contract_history_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `salary_enc` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_enc_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `salary_enc_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_enc_history` ENABLE KEYS */;


-- Dumping structure for table hrms.salary_sharing
DROP TABLE IF EXISTS `salary_sharing`;
CREATE TABLE IF NOT EXISTS `salary_sharing` (
  `salary_sharing_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_history_id` int(11) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `project_number` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_sharing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_sharing: ~3 rows (approximately)
/*!40000 ALTER TABLE `salary_sharing` DISABLE KEYS */;
INSERT INTO `salary_sharing` (`salary_sharing_id`, `contract_history_id`, `project_name`, `percentage`, `project_number`, `updated_by`, `created_at`, `updated_at`) VALUES
	(8, 133, 'PAKLIM', 100, '001-PAK', 97, '2015-05-04 22:29:04', '2015-05-04 22:29:04'),
	(31, 142, 'PAKLIM', 70, '001-PAK', 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(32, 142, 'Nama-Sutri', 30, '001', 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58');
/*!40000 ALTER TABLE `salary_sharing` ENABLE KEYS */;


-- Dumping structure for table hrms.salary_sharing2
DROP TABLE IF EXISTS `salary_sharing2`;
CREATE TABLE IF NOT EXISTS `salary_sharing2` (
  `user_id` int(11) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `percentage` varchar(50) DEFAULT NULL,
  `project_number` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_sharing2: ~19 rows (approximately)
/*!40000 ALTER TABLE `salary_sharing2` DISABLE KEYS */;
INSERT INTO `salary_sharing2` (`user_id`, `end_date`, `project_name`, `percentage`, `project_number`, `updated_by`, `created_at`, `updated_at`) VALUES
	(9, '2016-06-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, '2016-06-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, '2016-06-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, '2016-06-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, '2016-06-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, '2016-06-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, '2016-06-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, '2016-06-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-09-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-09-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-06-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-06-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-07-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-07-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-08-30 00:00:00', 'PAKLIM', '60', '001', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(5, '2015-08-30 00:00:00', 'PAKLIM', '40', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(98, '2015-03-14 00:00:00', 'PAKLIM', '100', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(98, '2015-03-30 00:00:00', 'PAKLIM', '100', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(69, '2015-06-30 00:00:00', 'PAKLIM', '100', '001-PAK', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45');
/*!40000 ALTER TABLE `salary_sharing2` ENABLE KEYS */;


-- Dumping structure for table hrms.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `setting_name` varchar(50) NOT NULL,
  `setting_val` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.settings: ~7 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`setting_name`, `setting_val`, `updated_by`, `created_at`, `updated_at`, `settings_id`) VALUES
	('Admin Email', 'iskandar.tio@gmail.com', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45', 1),
	('Contract Reminder', '30', 97, '2015-05-02 16:07:45', '2015-05-05 18:40:27', 2),
	('Dependent Limit', '1000000', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45', 3),
	('Frame Limit', '750000', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45', 4),
	('Medical Checkup Limit', '1500000', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45', 5),
	('Outpatient Limit', '7800000', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45', 6),
	('Pregnancy Limit', '4500000', NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45', 7);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;


-- Dumping structure for table hrms.signature
DROP TABLE IF EXISTS `signature`;
CREATE TABLE IF NOT EXISTS `signature` (
  `signature_id` int(11) NOT NULL AUTO_INCREMENT,
  `signature` varchar(1000) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`signature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.signature: ~1 rows (approximately)
/*!40000 ALTER TABLE `signature` DISABLE KEYS */;
INSERT INTO `signature` (`signature_id`, `signature`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, '<strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', 97, '2015-05-02 16:07:45', '2015-05-04 23:54:10');
/*!40000 ALTER TABLE `signature` ENABLE KEYS */;


-- Dumping structure for table hrms.title
DROP TABLE IF EXISTS `title`;
CREATE TABLE IF NOT EXISTS `title` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.title: ~3 rows (approximately)
/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` (`title_id`, `title`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Mr.', 1, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(3, 'Ms.', 4, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45'),
	(9, 'Mrs.', 5, NULL, '2015-05-02 16:07:45', '2015-05-02 16:07:45');
/*!40000 ALTER TABLE `title` ENABLE KEYS */;


-- Dumping structure for table hrms.training
DROP TABLE IF EXISTS `training`;
CREATE TABLE IF NOT EXISTS `training` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_name` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.training: ~0 rows (approximately)
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
/*!40000 ALTER TABLE `training` ENABLE KEYS */;


-- Dumping structure for table hrms.user_ranking
DROP TABLE IF EXISTS `user_ranking`;
CREATE TABLE IF NOT EXISTS `user_ranking` (
  `user_ranking_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_employee_id` int(11) DEFAULT NULL,
  `ranking_id` int(11) DEFAULT NULL,
  `user_comment` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_ranking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.user_ranking: ~15 rows (approximately)
/*!40000 ALTER TABLE `user_ranking` DISABLE KEYS */;
INSERT INTO `user_ranking` (`user_ranking_id`, `vacancy_employee_id`, `ranking_id`, `user_comment`, `user_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, 'ok', 115, 97, '2015-05-04 23:23:11', '2015-05-04 23:23:11'),
	(2, 2, 2, 'ok', 116, 97, '2015-05-04 23:23:11', '2015-05-04 23:23:11'),
	(3, 1, 1, 'Best', 115, 125, '2015-05-04 23:51:03', '2015-05-04 23:51:03'),
	(4, 1, 2, 'Second Best', 116, 125, '2015-05-04 23:51:11', '2015-05-04 23:51:11'),
	(5, 3, 1, 'ok', 115, 97, '2015-05-05 00:50:18', '2015-05-05 00:50:18'),
	(6, 3, 2, 'ok', 116, 97, '2015-05-05 00:50:19', '2015-05-05 00:50:19'),
	(7, 4, 1, 'a', 115, 125, '2015-05-05 00:51:02', '2015-05-05 00:51:02'),
	(8, 4, 1, 'a', 116, 125, '2015-05-05 00:51:08', '2015-05-05 00:51:08'),
	(9, 5, 2, 'a', 115, 97, '2015-05-05 01:57:39', '2015-05-05 01:57:39'),
	(10, 6, 2, 'fdsfd', 115, 125, '2015-05-05 01:58:24', '2015-05-05 01:58:24'),
	(11, 3, 1, 'a', 114, 97, '2015-05-05 10:54:01', '2015-05-05 10:54:01'),
	(12, 4, 2, 'ok', 114, 125, '2015-05-05 10:54:36', '2015-05-05 10:54:36'),
	(13, 8, 1, 'good', 136, 97, '2015-05-05 13:37:04', '2015-05-05 13:37:04'),
	(14, 7, 1, 'ok', 136, 134, '2015-05-05 13:38:17', '2015-05-05 13:38:17'),
	(15, 5, 1, 'good', 114, 97, '2015-05-09 15:27:27', '2015-05-09 15:27:27');
/*!40000 ALTER TABLE `user_ranking` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy
DROP TABLE IF EXISTS `vacancy`;
CREATE TABLE IF NOT EXISTS `vacancy` (
  `vacancy_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_code` varchar(50) DEFAULT NULL,
  `vacancy_name` varchar(50) DEFAULT NULL,
  `vacancy_startdate` datetime DEFAULT NULL,
  `vacancy_enddate` datetime DEFAULT NULL,
  `vacancy_description` blob,
  `vacancy_closedate` datetime DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  `vacancy_code2` varchar(50) DEFAULT NULL,
  `vacancy_type` varchar(50) DEFAULT NULL,
  `allowance` int(11) DEFAULT NULL,
  `vacancy_criteria` varchar(1000) DEFAULT NULL,
  `next_vacancy_progress_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy: ~2 rows (approximately)
/*!40000 ALTER TABLE `vacancy` DISABLE KEYS */;
INSERT INTO `vacancy` (`vacancy_id`, `vacancy_code`, `vacancy_name`, `vacancy_startdate`, `vacancy_enddate`, `vacancy_description`, `vacancy_closedate`, `vacancy_progress_id`, `vacancy_code2`, `vacancy_type`, `allowance`, `vacancy_criteria`, `next_vacancy_progress_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'IT', 'IT Developer', '2015-04-01 00:00:00', '2015-05-31 00:00:00', _binary 0x495420446576656C6F706572206E6565646564, NULL, 6, 'IT', 'Intern', 300000, 'skills', 6, 97, '2015-05-02 16:07:45', '2015-05-05 13:42:21'),
	(3, 'Acc', 'Accounting', '2015-04-27 00:00:00', '2015-05-31 00:00:00', _binary 0x4E6577204163636F756E74696E67205374616666206E6565646564, NULL, 3, 'Acc', 'Intern', 2000000, 'jfojfds fsd', 4, 97, '2015-05-02 16:07:45', '2015-05-09 15:27:27');
/*!40000 ALTER TABLE `vacancy` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_employee
DROP TABLE IF EXISTS `vacancy_employee`;
CREATE TABLE IF NOT EXISTS `vacancy_employee` (
  `vacancy_employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` varchar(50) DEFAULT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_employee: ~8 rows (approximately)
/*!40000 ALTER TABLE `vacancy_employee` DISABLE KEYS */;
INSERT INTO `vacancy_employee` (`vacancy_employee_id`, `vacancy_id`, `employee_id`, `vacancy_progress_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, '3', '125', 9, 97, '2015-05-04 23:22:53', '2015-05-04 23:22:53'),
	(2, '3', '97', 9, 97, '2015-05-04 23:23:11', '2015-05-04 23:23:11'),
	(3, '3', '97', 3, 97, '2015-05-05 00:50:18', '2015-05-05 00:50:18'),
	(4, '3', '125', 3, 97, '2015-05-05 00:50:32', '2015-05-05 00:50:32'),
	(5, '3', '97', 4, 97, '2015-05-05 01:57:39', '2015-05-05 01:57:39'),
	(6, '3', '125', 4, 97, '2015-05-05 01:58:01', '2015-05-05 01:58:01'),
	(7, '1', '134', 3, 97, '2015-05-05 13:36:41', '2015-05-05 13:36:41'),
	(8, '1', '97', 3, 97, '2015-05-05 13:37:03', '2015-05-05 13:37:03');
/*!40000 ALTER TABLE `vacancy_employee` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_interview
DROP TABLE IF EXISTS `vacancy_interview`;
CREATE TABLE IF NOT EXISTS `vacancy_interview` (
  `vacancy_interview_id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_date` datetime DEFAULT NULL,
  `interview_time` varchar(50) DEFAULT NULL,
  `interview_place` varchar(50) DEFAULT NULL,
  `vacancy_id` int(11) DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_interview_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_interview: ~8 rows (approximately)
/*!40000 ALTER TABLE `vacancy_interview` DISABLE KEYS */;
INSERT INTO `vacancy_interview` (`vacancy_interview_id`, `interview_date`, `interview_time`, `interview_place`, `vacancy_id`, `vacancy_progress_id`, `user_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, '2015-05-04 00:00:00', '12.30', 'Wisma Bakrie2', 3, 9, 115, 97, '2015-05-04 23:23:11', '2015-05-04 23:24:19'),
	(2, '2015-05-04 00:00:00', '13.30', 'Wisma Bakrie2', 3, 9, 116, 97, '2015-05-04 23:23:11', '2015-05-04 23:24:30'),
	(3, '2015-05-05 00:00:00', '12.30', 'Wisma Bakrie2', 3, 3, 115, 97, '2015-05-05 00:50:18', '2015-05-05 01:00:01'),
	(4, '2015-05-05 00:00:00', '11.30', 'KLH', 3, 3, 116, 97, '2015-05-05 00:50:19', '2015-05-05 00:50:19'),
	(5, '2015-05-05 00:00:00', '17.30', 'Wisma Bakrie2', 3, 4, 115, 97, '2015-05-05 01:57:39', '2015-05-05 01:57:39'),
	(6, '2015-05-05 00:00:00', '17.00', 'Wisma Bakrie2', 3, 3, 114, 97, '2015-05-05 10:54:01', '2015-05-05 10:54:01'),
	(7, '2015-05-05 00:00:00', '11.00', 'Wisma Bakrie2', 1, 3, 136, 97, '2015-05-05 13:37:04', '2015-05-05 13:38:55'),
	(8, '2015-05-09 00:00:00', '12.15', 'Wisma Bakrie2', 3, 4, 114, 97, '2015-05-09 15:27:27', '2015-05-09 15:27:27');
/*!40000 ALTER TABLE `vacancy_interview` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_progress
DROP TABLE IF EXISTS `vacancy_progress`;
CREATE TABLE IF NOT EXISTS `vacancy_progress` (
  `vacancy_progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_progress_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `process_name` varchar(50) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_progress: ~6 rows (approximately)
/*!40000 ALTER TABLE `vacancy_progress` DISABLE KEYS */;
INSERT INTO `vacancy_progress` (`vacancy_progress_id`, `vacancy_progress_val`, `sort_id`, `process_name`, `required`, `active`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Shortlist', 1, 'Shortlist', 1, 1, 97, '2015-05-04 15:41:07', '2015-05-04 16:01:01'),
	(3, 'First Interview', 5, 'First Interview', NULL, 1, 97, '2015-05-04 15:41:34', '2015-05-04 16:14:54'),
	(4, 'Second Interview', 6, 'Second Interview', NULL, 1, 97, '2015-05-04 15:41:48', '2015-05-04 16:14:53'),
	(5, 'Negotiation', 7, 'Negotiation', 1, 1, 97, '2015-05-04 15:42:08', '2015-05-04 16:14:51'),
	(6, 'Closing', 8, 'Accept as Employee', 1, 1, 97, '2015-05-04 15:42:26', '2015-05-04 16:14:50'),
	(9, 'Written Test', 4, 'Written Test', NULL, 1, 97, '2015-05-04 16:14:48', '2015-05-04 19:55:40');
/*!40000 ALTER TABLE `vacancy_progress` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_question
DROP TABLE IF EXISTS `vacancy_question`;
CREATE TABLE IF NOT EXISTS `vacancy_question` (
  `vacancy_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `vacancy_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_question: ~5 rows (approximately)
/*!40000 ALTER TABLE `vacancy_question` DISABLE KEYS */;
INSERT INTO `vacancy_question` (`vacancy_question_id`, `question_id`, `vacancy_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 5, 3, 97, '2015-05-04 15:11:29', '2015-05-04 15:11:29'),
	(2, 1, 3, 97, '2015-05-04 15:11:29', '2015-05-04 15:11:29'),
	(3, 15, 1, 97, '2015-05-05 11:05:23', '2015-05-05 11:05:23'),
	(4, 2, 1, 97, '2015-05-05 11:05:23', '2015-05-05 11:05:23'),
	(5, 1, 1, 97, '2015-05-05 11:05:23', '2015-05-05 11:05:23');
/*!40000 ALTER TABLE `vacancy_question` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_timeline
DROP TABLE IF EXISTS `vacancy_timeline`;
CREATE TABLE IF NOT EXISTS `vacancy_timeline` (
  `vacancy_timeline_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` int(11) DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_timeline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_timeline: ~8 rows (approximately)
/*!40000 ALTER TABLE `vacancy_timeline` DISABLE KEYS */;
INSERT INTO `vacancy_timeline` (`vacancy_timeline_id`, `vacancy_id`, `vacancy_progress_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(5, 3, 9, 97, '2015-05-04 23:52:57', '2015-05-04 23:52:57'),
	(7, 3, 4, 97, '2015-05-05 01:58:57', '2015-05-05 01:58:57'),
	(9, 3, 6, 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(10, 3, 1, 97, '2015-05-05 10:53:19', '2015-05-05 10:53:19'),
	(11, 3, 3, 97, '2015-05-05 10:55:27', '2015-05-05 10:55:27'),
	(12, 1, 1, 97, '2015-05-05 13:36:16', '2015-05-05 13:36:16'),
	(13, 1, 3, 97, '2015-05-05 13:39:41', '2015-05-05 13:39:41'),
	(14, 1, 6, 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `vacancy_timeline` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_type
DROP TABLE IF EXISTS `vacancy_type`;
CREATE TABLE IF NOT EXISTS `vacancy_type` (
  `vacancy_type` varchar(50) DEFAULT NULL,
  `vacancy_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `vacancy_type` DISABLE KEYS */;
INSERT INTO `vacancy_type` (`vacancy_type`, `vacancy_type_id`, `sort_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	('Intern', 1, 1, NULL, '2015-05-02 16:07:46', '2015-05-02 16:07:46'),
	('National Personnel', 2, 2, NULL, '2015-05-02 16:07:46', '2015-05-02 16:07:46');
/*!40000 ALTER TABLE `vacancy_type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
