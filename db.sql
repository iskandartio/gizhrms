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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` (`first_name`, `last_name`, `place_of_birth`, `date_of_birth`, `gender`, `marital_status`, `nationality_id`, `nationality_val`, `address`, `country_id`, `country_name`, `province_id`, `city_id`, `post_code`, `phone1`, `phone2`, `computer_skills`, `professional_skills`, `applicants_id`, `user_id`, `cv`, `letter`, `contract1_start_date`, `contract1_end_date`, `job_title`, `job_position`, `project_name`, `principal_advisor`, `financial_controller`, `project_number`, `team_leader`, `project_location`, `office_manager`, `responsible_superior`, `SAP_No`, `working_time`, `salary`, `salary_band`, `title`, `no_working_exp`, `updated_by`, `created_at`, `updated_at`) VALUES
	('Susan', 'Aulia', 'Jakarta', '1985-12-19 00:00:00', 'Female', 'Single', 1, NULL, 'Jln. Padang', 1, NULL, 13, 72, '12345', '987651', '784561', 'Ms Word, Ms Excel', 'Research Skill', 1, 113, '.pdf', '.docx', '2015-05-01 00:00:00', '2015-07-31 00:00:00', 'Senior Manager', 'Head of Accounting', 'PAKLIM', 68, 69, '001-PAK', 69, 'Jakarta GIZ', 103, 69, 'SAP No', 100, 'fu2BMYe3RmyC27SAQ8kMv9pUNmy3dNNvySVFDH8euY+vtoE3c6oy7Q==', '2T', 'Ms.', NULL, 97, '2015-05-04 13:31:24', '2015-05-04 21:31:05'),
	('Bella', 'Nurul', 'Jakarta', '1986-04-15 00:00:00', 'Female', 'Single', 1, NULL, 'jakarta', 1, NULL, 31, 156, '11250', '12345', NULL, NULL, NULL, 2, 115, '.pdf', '.docx', '2015-05-05 00:00:00', '2015-06-30 00:00:00', 'Senior Advisor', 'Head of Accounting', 'PAKLIM', 125, 125, '001-PAK', 125, 'Jakarta GIZ', 125, 125, 'SAPhj', 100, 'ROZZu2jHSkmc++lPYfps3KckeSEajCpf4cLeRxXeWL7L+WGTJdi2nw==', '2T', 'Ms.', NULL, 97, '2015-05-04 16:24:29', '2015-05-05 09:01:16'),
	('Angga', 'Aditya', 'Semarang', '1989-01-01 00:00:00', 'Male', 'Married', 1, NULL, 'Salatiga', 1, NULL, 33, 209, '12345', '1578952132', NULL, NULL, NULL, 3, 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mr.', NULL, 116, '2015-05-04 22:48:27', '2015-05-04 22:48:27'),
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicant_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_answer: ~2 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_education: ~2 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_language: ~3 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_other_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_other_language: ~2 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_reference: ~1 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_salary_sharing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_salary_sharing: ~0 rows (approximately)
/*!40000 ALTER TABLE `applicants_salary_sharing` DISABLE KEYS */;
INSERT INTO `applicants_salary_sharing` (`applicants_salary_sharing_id`, `user_id`, `project_name`, `percentage`, `project_number`, `updated_by`, `created_at`, `updated_at`) VALUES
	(11, 113, 'PAKLIM', 100, '001-PAK', 97, '2015-05-04 21:31:05', '2015-05-04 21:31:05'),
	(12, 115, 'PAKLIM', 70, '001-PAK', 97, '2015-05-05 09:01:16', '2015-05-05 09:01:16'),
	(13, 115, 'Nama-Sutri', 30, '001', 97, '2015-05-05 09:01:16', '2015-05-05 09:01:16');
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_working_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_working: ~2 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.change_log: ~87 rows (approximately)
/*!40000 ALTER TABLE `change_log` DISABLE KEYS */;
INSERT INTO `change_log` (`id`, `updated_by`, `tbl`, `changes`, `created_at`, `trans_id`) VALUES
	(148, 97, 'employee', '{"emergency_phone":"null->f","emergency_email":"null->g"}', '2015-05-02 19:51:01', 'hrmnck4b2m4ymc77cxkfcx8v7xp8hwx2'),
	(149, 97, 'employee', '{"emergency_phone":"f->null","emergency_email":"g->null"}', '2015-05-02 19:51:18', 'ck87c463j6vsyjxsps2ykpvsf2f3sfk8'),
	(162, 97, 'employee', '{"first_name":"a->James","last_name":"a->Watson","place_of_birth":"a->Jakarta","gender":"Female->Male","nationality_id":"13->2","country_name":"a->Germany"}', '2015-05-02 19:56:49', 'j2vx3x4kchbmypj8nf7t3khhkrsvnyvn'),
	(163, 97, 'm_user_role', 'del {"user_id":"111"}', '2015-05-02 19:56:49', 'j2vx3x4kchbmypj8nf7t3khhkrsvnyvn'),
	(164, 97, 'm_user_role', '{"user_id":"111","role_id":"3"}', '2015-05-02 19:56:49', 'j2vx3x4kchbmypj8nf7t3khhkrsvnyvn'),
	(165, 97, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"james.watson","email_cc":"","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: nh5jk86hfr Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=nvn7prk7tyrnscdncz5dkny5y66mbd\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=nvn7prk7tyrnscdncz5dkny5y66mbd\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=nvn7prk7tyrnscdncz5dkny5y66mbd<\\/a>","attachment":""}', '2015-05-02 19:56:49', 'j2vx3x4kchbmypj8nf7t3khhkrsvnyvn'),
	(166, NULL, 'm_user_role', '{"user_id":"112","role_id":"1"}', '2015-05-04 12:52:54', 'kx848nzy3hjhn4js7dpptx56fx2h2s2t'),
	(167, NULL, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"sarah.aulia@gmail2.com","email_cc":"","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: a Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=hyf42tfttbj7h6c2yf8nck4846h8hn\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=hyf42tfttbj7h6c2yf8nck4846h8hn\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=hyf42tfttbj7h6c2yf8nck4846h8hn<\\/a>","attachment":""}', '2015-05-04 12:52:54', 'kx848nzy3hjhn4js7dpptx56fx2h2s2t'),
	(168, 97, 'email_setup', '{"email_to":"@email->@email;iskandar.tio@gmail.com","updated_by":"null->97"}', '2015-05-04 12:55:35', '5n4xzjj8pttysrdhwc4fhbvvv2jdchht'),
	(169, 97, 'email_setup', '{"email_to":"@email->@email;iskandar.tio@gmail.com","updated_by":"null->97"}', '2015-05-04 12:55:46', '3hs44wh76nmbh4tv3mppdbpv2m4t5c7j'),
	(170, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com","updated_by":"null->97"}', '2015-05-04 12:56:07', 't7mhtn76scdmrzvtsr6vxtxj4ryw5m27'),
	(171, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com","updated_by":"null->97"}', '2015-05-04 12:56:18', 't7tj87byzbm7hf6t2kfhz4n4cscdsmvd'),
	(172, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com","updated_by":"null->97"}', '2015-05-04 12:56:32', '348736z6rvh64mk5jwzbjyjbnzxj3dst'),
	(173, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com"}', '2015-05-04 12:56:40', '6vrxjr2c44wdmhz3zyh8nfc8kwx2n8xw'),
	(174, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com"}', '2015-05-04 12:56:44', 'cf4pnbd4mjt3hww3szt5fv4ht75hxdbv'),
	(175, 97, 'email_setup', '{"email_to":"@email;iskandar.tio@gmail.com->@email"}', '2015-05-04 12:56:52', 'bzbftpmyshzmmkxj3mksbvmhjjpyns2w'),
	(176, 97, 'email_setup', '{"email_to":"@email;iskandar.tio@gmail.com->@email"}', '2015-05-04 12:56:58', 'pj4x563v2f3c8ff878m2bkcfbhjz63hr'),
	(177, NULL, 'm_user_role', '{"user_id":"113","role_id":"1"}', '2015-05-04 13:20:58', 'cmt6z8rt7vmw54v4k86p7wyfcy46m6cv'),
	(178, NULL, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"susan.aulia","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: a Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=fbxm3drzwjmn6w874yfrt8cp68p2h3\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=fbxm3drzwjmn6w874yfrt8cp68p2h3\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=fbxm3drzwjmn6w874yfrt8cp68p2h3<\\/a>","attachment":""}', '2015-05-04 13:20:58', 'cmt6z8rt7vmw54v4k86p7wyfcy46m6cv'),
	(179, 113, 'm_user', '{"status_id":"null->1","updated_by":"null->113"}', '2015-05-04 13:26:43', '488jcvpbrw44mwkjzsjpc5nj42b6jbk2'),
	(180, 113, 'applicants', '{"user_id":"113","title":"Ms.","first_name":"Susan","last_name":"Aulia","place_of_birth":"Jakarta","date_of_birth":"1985-12-19","gender":"Female","marital_status":"Single","nationality_id":"1","nationality_val":null,"address":"Jln. Padang","country_id":"1","country_name":null,"province_id":"13","city_id":"72","post_code":"12345","phone1":"987654","phone2":null,"computer_skills":null,"professional_skills":null}', '2015-05-04 13:31:24', 'mv4yhf672bwfttkv24mrxxjcx54d8bzm'),
	(181, 113, 'applicants', '{"phone1":"987654->987651","phone2":"null->784561","computer_skills":"null->Ms Word, Ms Excel","professional_skills":"null->Research Skill"}', '2015-05-04 13:34:53', 'pvzkh2xnfnxzyhdmx276zdwcbp8fhntf'),
	(182, 113, 'applicants_education', '{"user_id":"113","education_id":"1","major":"IPA","place":"Ricci","year_from":"1996","year_to":"1999","countries_id":"101"}', '2015-05-04 13:53:52', '66w6cx7wddp47ss7b7hbm6cj5y6dvwmk'),
	(183, 113, 'applicants_education', '{"countries_id":"101->81"}', '2015-05-04 13:54:07', 'x6j6fx8wxp5jkf4m7pvfp7rj2zpjrjnw'),
	(184, 113, 'applicants_education', '{"countries_id":"81->101"}', '2015-05-04 13:54:37', 'n5trhsynk4bv5ddkn6kncfzfbywxj77x'),
	(185, 113, 'applicants_education', '{"user_id":"113","education_id":"5","major":"IT","place":"Binus","year_from":"1999","year_to":"2004","countries_id":"101"}', '2015-05-04 13:56:35', '5djjhcmcyvsnxmtbd62dkk84xvvpwz83'),
	(186, 113, 'applicants_education', '{"major":"IT->IT2","place":"Binus->Binus4"}', '2015-05-04 13:56:56', '7yvvkr84fyh744zm2sjnvdjsh3d2rtvn'),
	(187, 113, 'applicants_education', '{"major":"IT2->IT","place":"Binus4->Binus"}', '2015-05-04 13:57:09', 's44dc67pbjsv6syych4jtxkh6ks22hbj'),
	(188, 113, 'applicants_language', '{"user_id":"113","language_id":"1","language_skill_id":"1"}', '2015-05-04 13:57:24', 'sxmtwhhdym2nynbb2d4s3328dkp33wtk'),
	(189, 113, 'applicants_language', '{"user_id":"113","language_id":"2","language_skill_id":"3"}', '2015-05-04 13:57:34', 'hv4vnjp5rd8jd8wftbnmbzxrbf2n5n77'),
	(190, 113, 'applicants_language', '{"user_id":"113","language_id":"3","language_skill_id":"4"}', '2015-05-04 13:57:45', '4fvt7pd36f5dhs5dv2bbwpjhrfndc43d'),
	(191, 113, 'applicants_other_language', '{"user_id":"113","language_val":"Japanese","language_skill_id":"3"}', '2015-05-04 13:57:57', 'ndhcfh2335ck6bpcfm687mpbkzc4j5sd'),
	(192, 113, 'applicants_other_language', '{"user_id":"113","language_val":"Dutch","language_skill_id":"4"}', '2015-05-04 13:58:09', 'mbz63v56r542y76fxmzw38vmmf73nww5'),
	(193, 113, 'applicants_other_language', 'del {"applicants_other_language_id":"2"}', '2015-05-04 13:58:17', 'fytfjtcjt23sh4hkf8cx2c3c63xtzhxx'),
	(194, 113, 'applicants_other_language', 'del {"applicants_other_language_id":"1"}', '2015-05-04 13:58:19', 'tfkwtjbvpmwrr5whwcwryhn2pcb7zwcx'),
	(195, 113, 'applicants_other_language', '{"user_id":"113","language_val":"Japanese","language_skill_id":"4"}', '2015-05-04 13:58:28', 'xr6px34v7ytythycmt5vbpbcrs6rzmtt'),
	(196, 113, 'applicants_reference', '{"job_title":"Manager","title":"Mr.","reference_name":"Johnson","company_name":"PT Angin Ribut","description":"my boss","email":"johnson.johnson","phone":"123456","user_id":"113"}', '2015-05-04 14:01:53', 'k6yrn2tkymhkww3r3z8yc8zvtnbh24hx'),
	(197, 113, 'applicants_reference', '{"description":"my boss->my boss boss"}', '2015-05-04 14:02:16', 'x525yd7y5dmbwf2d4jhkv52bhj3r5khn'),
	(198, 113, 'applicants_other_reference', '{"job_title":"IT Staff","title":"Mr.","reference_name":"Jack","company_name":"PT Angin Ribut","description":"Colleague","email":null,"phone":"123456","user_id":"113"}', '2015-05-04 14:02:55', 'pkzyrzdypnfpfpbdrwy7tt2f5nrkczw2'),
	(199, 113, 'applicants_other_reference', '{"phone":"123456->456434"}', '2015-05-04 14:03:30', 'zvp6xkrv8s2tryzjxhvyt6kc34ny4sd3'),
	(200, 113, 'applicants', '{"cv":"null->.pdf"}', '2015-05-04 14:13:48', '5jrhthhby6km38dnn6p2wnyd7jhdzfx7'),
	(201, 113, 'applicants', '{"letter":"null->.docx"}', '2015-05-04 14:13:48', '56t5ytxyxhtpvhp5d4ycr2fss6fmw3dt'),
	(202, 113, 'applicants_working', '{"month_from":"3","year_from":"2004","month_to":"3","year_to":"2006","employer":"PT IT","countries_id":"101","job_title":"IT Staff","business_id":"2","email":null,"phone":null,"leave_reason":"tired","may_contact":"0","user_id":"113"}', '2015-05-04 14:15:54', 'pjx7dnjhr336mhd5d6k6wwpr468w8bsb'),
	(203, 113, 'applicants_working', '{"leave_reason":"tired->tired again"}', '2015-05-04 14:16:09', '5sjwf3242wx6d7wnchf5s4jbxyvcvjkm'),
	(204, 113, 'applicants_working', 'del {"applicants_working_id":"1"}', '2015-05-04 14:16:16', '2k6tdchnnhdwyh48j5mvmjzwtyj8mxdv'),
	(205, 113, 'applicants_working', '{"month_from":"5","year_from":"2004","month_to":"1","year_to":"2007","employer":"IT Solusindo","countries_id":"101","job_title":"Staff","business_id":"2","email":"james.watt","phone":null,"leave_reason":null,"may_contact":"1","user_id":"113"}', '2015-05-04 14:16:52', 'fb6mcj6mbmz57wj6btj6pbh23nsz3wmn'),
	(206, 113, 'applicants_working', '{"month_from":"3","year_from":"2000","month_to":"5","year_to":"2004","employer":"fdsfds","countries_id":null,"job_title":"fdsfsd","business_id":null,"email":null,"phone":null,"leave_reason":null,"may_contact":"1","user_id":"113"}', '2015-05-04 14:17:28', 'm4fhmddfwt3mbrsb2m42373p45426w3r'),
	(207, 113, 'applicants_working', '{"countries_id":"null->8"}', '2015-05-04 14:19:07', 'db8cn757hxcpnjrhykx2fwm62ymcc4fd'),
	(208, 0, 'm_user', '{"updated_by":"113->0"}', '2015-05-04 14:33:26', 'ywd7rkm6jd8wsjnytt3n35mvfwfm6h67'),
	(209, 113, 'applicants_working', '{"business_id":"null->2"}', '2015-05-04 14:52:21', 'nnk2832dt7m3s25mhnkrf5t5ccpv5ztw'),
	(210, 97, 'vacancy', '{"updated_by":"null->97"}', '2015-05-04 15:11:29', '7r6w4x8jpcwykkvv747hchwrdzc3dyt6'),
	(211, 97, 'vacancy_question', '{"question_id":"5","vacancy_id":"3"}', '2015-05-04 15:11:29', '7r6w4x8jpcwykkvv747hchwrdzc3dyt6'),
	(212, 97, 'vacancy_question', '{"question_id":"1","vacancy_id":"3"}', '2015-05-04 15:11:29', '7r6w4x8jpcwykkvv747hchwrdzc3dyt6'),
	(213, 113, 'job_applied', '{"vacancy_id":"3","user_id":"113","date_applied":"2015-05-04 15:12:11","salary_expectation":"5500000","negotiable":"1"}', '2015-05-04 15:12:11', 'tzywhfpd7s2j8k3t2vxk534mkw84f7bd'),
	(214, 113, 'applicants_answer', '{"job_applied_id":"4","question_id":"5","choice_id":"172"}', '2015-05-04 15:12:11', 'tzywhfpd7s2j8k3t2vxk534mkw84f7bd'),
	(215, 113, 'applicants_answer', '{"job_applied_id":"4","question_id":"1","choice_id":"167"}', '2015-05-04 15:12:11', 'tzywhfpd7s2j8k3t2vxk534mkw84f7bd'),
	(217, 97, 'question', '{"updated_by":"null->97"}', '2015-05-04 15:34:24', '3y6fbf48pwctzs8mmsry4v76xspm22h2'),
	(218, 97, 'choice', '{"updated_by":"null->97"}', '2015-05-04 15:34:24', '3y6fbf48pwctzs8mmsry4v76xspm22h2'),
	(219, 97, 'choice', '{"choice_val":">5 years->5-8 years","updated_by":"null->97"}', '2015-05-04 15:34:24', '3y6fbf48pwctzs8mmsry4v76xspm22h2'),
	(220, 97, 'choice', '{"choice_val":"gfdgfd->>8 years","updated_by":"null->97"}', '2015-05-04 15:34:24', '3y6fbf48pwctzs8mmsry4v76xspm22h2'),
	(221, 97, 'vacancy_progress', '{"vacancy_progress_val":"Shortlist","process_name":"Shortlist","active":"1","sort_id":null,"required":null}', '2015-05-04 15:41:07', '4ssxvs6dp7nr6w3nr8psxpmjfh8v4vn4'),
	(222, 97, 'vacancy_progress', '{"vacancy_progress_val":"Written Test","process_name":"Written Test","active":"1","sort_id":null,"required":null}', '2015-05-04 15:41:22', 'tnf47km2fvsrjnnrfpvmv2kzdh465tt4'),
	(223, 97, 'vacancy_progress', '{"vacancy_progress_val":"First Interview","process_name":"First Interview","active":"1","sort_id":null,"required":null}', '2015-05-04 15:41:34', 'nzmpfbxppw4nsznrsxpyfpjjdfhw7jkj'),
	(224, 97, 'vacancy_progress', '{"vacancy_progress_val":"Second Interview","process_name":"Second Interview","active":"1","sort_id":null,"required":null}', '2015-05-04 15:41:48', 'bjybpz8mwdh2twr8f8xns6zxz8fvkxz5'),
	(225, 97, 'vacancy_progress', '{"vacancy_progress_val":"Negotiation","process_name":"Negotiation","active":"1","sort_id":null,"required":null}', '2015-05-04 15:42:08', 'v83mx42my5bs8d27ysftrvrp28y235kx'),
	(226, 97, 'vacancy_progress', '{"vacancy_progress_val":"Closing","process_name":"Accept as Employee","active":"1","sort_id":null,"required":null}', '2015-05-04 15:42:26', 'xfpyw3ytkm7n734nmcn623c83xrrbj3n'),
	(227, 97, 'vacancy_progress', '{"vacancy_progress_val":"Written Test","process_name":"Written Test","active":"1","sort_id":"1","required":null}', '2015-05-04 16:00:38', 'nm4bp2nn5fw2253jxt25t4fsv5cy6xm4'),
	(228, 97, 'vacancy_progress', 'del {"vacancy_progress_id":"7","ifnull(required,0)":0}', '2015-05-04 16:09:40', 'wjnzbsbx8nypdw77rhyw6fxwf3m7w2nc'),
	(229, 97, 'vacancy_progress', '{"vacancy_progress_val":"Written Test","process_name":"Written Test","active":"1","sort_id":"7","required":null}', '2015-05-04 16:14:00', '64s3w5xb7r6dmfy4xjrbs8whxz7y84ky'),
	(230, 97, 'vacancy_progress', '{"sort_id":"6->7"}', '2015-05-04 16:14:06', 'n7k7thkkbkcwty5bs5c62zrhk542wv85'),
	(231, 97, 'vacancy_progress', '{"sort_id":"7->6"}', '2015-05-04 16:14:06', 'n7k7thkkbkcwty5bs5c62zrhk542wv85'),
	(232, 97, 'vacancy_progress', '{"sort_id":"5->6"}', '2015-05-04 16:14:10', 'bs8zvvf267vdnp2txjpbmxn72dnp8h2z'),
	(233, 97, 'vacancy_progress', '{"sort_id":"6->5"}', '2015-05-04 16:14:10', 'bs8zvvf267vdnp2txjpbmxn72dnp8h2z'),
	(234, 97, 'vacancy_progress', '{"sort_id":"4->5"}', '2015-05-04 16:14:12', '4vvw4545f55mnyc32bwshcjz4fhwyxxv'),
	(235, 97, 'vacancy_progress', '{"sort_id":"5->4"}', '2015-05-04 16:14:12', '4vvw4545f55mnyc32bwshcjz4fhwyxxv'),
	(236, 97, 'vacancy_progress', '{"sort_id":"3->4"}', '2015-05-04 16:14:13', 'b2d4jtnxnn4j3mpzjrbsyph4z44jkwm7'),
	(237, 97, 'vacancy_progress', '{"sort_id":"4->3"}', '2015-05-04 16:14:13', 'b2d4jtnxnn4j3mpzjrbsyph4z44jkwm7'),
	(238, 97, 'vacancy_progress', 'del {"vacancy_progress_id":"8","ifnull(required,0)":0}', '2015-05-04 16:14:29', '7zr5tc82m6wz475k7s3mds24hhwvbr8h'),
	(239, 97, 'vacancy_progress', '{"vacancy_progress_val":"Written Test","process_name":"Written Test","active":"1","sort_id":"8","required":null}', '2015-05-04 16:14:48', '62tcjvx42n6rthxwk4tkzpbj82dft7bz'),
	(240, 97, 'vacancy_progress', '{"sort_id":"7->8"}', '2015-05-04 16:14:50', 'r87zmcyckfz8hdm6wrxc4tdws7ddn2k3'),
	(241, 97, 'vacancy_progress', '{"sort_id":"8->7"}', '2015-05-04 16:14:50', 'r87zmcyckfz8hdm6wrxc4tdws7ddn2k3'),
	(242, 97, 'vacancy_progress', '{"sort_id":"6->7"}', '2015-05-04 16:14:51', 'zwb3v52h6f47mffnyd6wvkx54bzvxh72'),
	(243, 97, 'vacancy_progress', '{"sort_id":"7->6"}', '2015-05-04 16:14:51', 'zwb3v52h6f47mffnyd6wvkx54bzvxh72'),
	(244, 97, 'vacancy_progress', '{"sort_id":"5->6"}', '2015-05-04 16:14:53', 'm48kb425yz24v3574m8f8684kh4jjyvz'),
	(245, 97, 'vacancy_progress', '{"sort_id":"6->5"}', '2015-05-04 16:14:53', 'm48kb425yz24v3574m8f8684kh4jjyvz'),
	(246, 97, 'vacancy_progress', '{"sort_id":"4->5"}', '2015-05-04 16:14:54', 'jx4kxffs83tdzt82k7jj2ds8chx8rdkp'),
	(247, 97, 'vacancy_progress', '{"sort_id":"5->4"}', '2015-05-04 16:14:54', 'jx4kxffs83tdzt82k7jj2ds8chx8rdkp'),
	(248, 0, 'm_user_role', '{"user_id":"114","role_id":"1"}', '2015-05-04 16:19:25', 'v2tyh32ycp6mj37rkm6c244fxvkhk58s'),
	(249, 0, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"kevin.arief","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: a Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=3546j863s8tyr7bdsspdpbmts4hph6\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=3546j863s8tyr7bdsspdpbmts4hph6\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=3546j863s8tyr7bdsspdpbmts4hph6<\\/a>","attachment":""}', '2015-05-04 16:19:25', 'v2tyh32ycp6mj37rkm6c244fxvkhk58s'),
	(250, 0, 'm_user_role', '{"user_id":"115","role_id":"1"}', '2015-05-04 16:21:12', '6vfc7vtnhbc8w2jyjnv5jrpwxvp42tdb'),
	(251, 0, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"bella.nurul","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: a Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=bt77kbb7tbscmmj2f4dvzr33688fwc\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=bt77kbb7tbscmmj2f4dvzr33688fwc\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=bt77kbb7tbscmmj2f4dvzr33688fwc<\\/a>","attachment":""}', '2015-05-04 16:21:12', '6vfc7vtnhbc8w2jyjnv5jrpwxvp42tdb'),
	(252, 0, 'm_user_role', '{"user_id":"116","role_id":"1"}', '2015-05-04 16:22:12', 'prckyfx8kxvcp8ppwbnbx5pyrr5y5vcx'),
	(253, 0, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"angga.aditya","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: a Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=rxcph4sndj8vwfbdjzc4738xxnr5df\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=rxcph4sndj8vwfbdjzc4738xxnr5df\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=rxcph4sndj8vwfbdjzc4738xxnr5df<\\/a>","attachment":""}', '2015-05-04 16:22:12', 'prckyfx8kxvcp8ppwbnbx5pyrr5y5vcx'),
	(254, 0, 'm_user', '{"status_id":"null->1","updated_by":"null->0"}', '2015-05-04 16:23:29', 'b75rynzy8kr5fwscpryt2r44dz7bhhxd'),
	(255, 0, 'm_user', '{"status_id":"null->1","updated_by":"null->0"}', '2015-05-04 16:23:47', 'kpfm5f8rkc5swpmm8x68d6nc6xcswxyn'),
	(256, 115, 'applicants', '{"user_id":"115","title":"Ms.","first_name":"Bella","last_name":"Nurul","place_of_birth":"Jakarta","date_of_birth":"1986-04-15","gender":"Female","marital_status":"Single","nationality_id":"1","nationality_val":null,"address":"jakarta","country_id":"1","country_name":null,"province_id":"31","city_id":"156","post_code":"11250","phone1":"12345","phone2":null,"computer_skills":null,"professional_skills":null}', '2015-05-04 16:24:29', '6638tfphcpvsdy74xzc67bx7js763ckk'),
	(257, 97, 'job_applied', '{"next_vacancy_progress_id":"null->1","updated_by":"113->97"}', '2015-05-04 18:46:17', 'vv8c8n872ct3jnwvnc6c78rxx6sk8c2j'),
	(258, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"1"}', '2015-05-04 18:46:24', 'zswfb3pvw8nh5cbhtwvnn3msn8hx26dm'),
	(259, 97, 'email', '{"email_from":"","email_to":"susan.aulia","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"First Interview","email_content":"<div><strong>Dear Ms. Susan Aulia,<br><\\/strong><strong><br>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n Thursday, January 01, 1970<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t 07:00 am.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with .<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft f\\u00fcr Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/strong><\\/div><div>&nbsp;<br><\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-04 18:46:24', 'zswfb3pvw8nh5cbhtwvnn3msn8hx26dm'),
	(260, 97, 'email_setup', '{"email_to":"iskandar.tio@gmail.com->@applicant_email","email_cc":"null->iskandar.tio@gmail.com","email_content":"<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>-><div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend a written test&nbsp;<\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><\\/strong><strong>Please confirm your availability for the test.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>","attachment":"null->1","updated_by":"null->97"}', '2015-05-04 18:52:57', 'xf7cxny76wb3px74jv48bcxvr8zwhz6n'),
	(261, 97, 'email_setup', '{"email_to":"iskandar.tio@gmail.com->@applicant_email","email_cc":"null->iskandar.tio@gmail.com","attachment":"null->0","updated_by":"null->97"}', '2015-05-04 18:53:33', 'rs6c6272bwk7bzyzk7fyby6vdnpd7c4s'),
	(262, 97, 'email_setup', '{"email_cc":"@admin_email->@admin_email;iskandar.tio@gmail.com","updated_by":"null->97"}', '2015-05-04 18:53:53', '5v8sp2bdwjdpn42n7kpjwn8kfcfbbmhy'),
	(263, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com","email_content":"<div><strong>Dear @applicant_name,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We do appreciate you taking the time to interview with us.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Again, thank you for your time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><b>@signature<\\/b><\\/div>-><div><strong>Dear @applicant_name,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We do appreciate you taking the time to interview with us.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Again, thank you for your time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>@signature<\\/strong><\\/div>","attachment":"null->0","updated_by":"null->97"}', '2015-05-04 18:54:05', 'xzhffb6dypxr78j45bwypycrktwjywdb'),
	(264, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com","attachment":"null->0","updated_by":"null->97"}', '2015-05-04 18:54:24', 'mxmvz3jkmm6vn6zh53sp3mbfwxzf42bj'),
	(265, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com","email_content":"<p>Dear @reference_name,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>&nbsp;First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding @applicant_name, who considered to become @vacancy_name.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for @applicant_name, as @he has putting your name as @his referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding @applicant_name&#39;s qualifications and skills in @vacancy_criteria, as well as your connection with @him.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p>@signature<\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>-><p>Dear @reference_name,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding @applicant_name, who considered to become @vacancy_name.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for @applicant_name, as @he has putting your name as @his referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding @applicant_name&#39;s qualifications and skills in @vacancy_criteria, as well as your connection with @him.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p>@signature<\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","updated_by":"null->97"}', '2015-05-04 18:54:44', 'm28k3kftshnb5fvhmrm76fz5rshn7x37'),
	(266, 97, 'email_setup', '{"email_to":"iskandar.tio@gmail.com->@applicant_email","email_cc":"null->iskandar.tio@gmail.com","attachment":"null->1","updated_by":"null->97"}', '2015-05-04 18:55:06', 'dt2hpv8vmpvnfycfr4y65t6z8xhknfjn'),
	(267, 97, 'email_setup', '{"email_type":"rejection_4","email_to":"@applicant_email","email_cc":"iskandar.tio@gmail.com","email_subject":"[GIZ] Email Rejection for @vacancy_name","params":"@applicant_email, @vacancy_name","email_content":"<div><strong>Dear @applicant_name,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We do appreciate you taking the time to interview with us.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Again, thank you for your time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>@signature<\\/strong><\\/div>","attachment":"0"}', '2015-05-04 18:56:05', 'xyzmyb8x8jf6s733z7jpyjyw52vztbk6'),
	(268, 97, 'email_setup', '{"email_type":"interviewer_4","email_to":"@interviewer_email","email_cc":"iskandar.tio@gmail.com","email_subject":"Interview Schedule","params":null,"email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p>@list<\\/p><p>Regards,<br>@signature<\\/p>","attachment":"0"}', '2015-05-04 18:56:40', 'vwx4kfkhf5pbccmzpwd6cjrzypbd3ttr'),
	(269, 97, 'email_setup', '{"email_subject":"Interview Schedule->Interview for @vacancy_name","params":"null->@interviewer_email, @vacancy_name, @list"}', '2015-05-04 18:57:06', 'b5vcyrfw5rr4r8f4cp47fpk647dk4hsj'),
	(270, 97, 'email_setup', '{"email_type":"reference_4","email_to":null,"email_cc":null,"email_subject":null,"params":null,"email_content":"<p>Dear @reference_name,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding @applicant_name, who considered to become @vacancy_name.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for @applicant_name, as @he has putting your name as @his referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding @applicant_name\'s qualifications and skills in @vacancy_criteria, as well as your connection with @him.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p>@signature<\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","attachment":"0"}', '2015-05-04 18:57:32', 'r7rj57jmzpsz58p44cmfjfb3vr8bkjp4'),
	(271, 97, 'email_setup', '{"email_to":"null->@reference_email","email_cc":"null->iskandar.tio@gmail.com","email_subject":"null->Asking for reference"}', '2015-05-04 18:57:56', 's3wwbdmnrkzt5n7d7sfnjk6f6cd5bd8n'),
	(272, 97, 'email_setup', '{"params":"null->@reference_name, @reference_email, @applicant_name, @vacancy_criteria, @he, @his, @her"}', '2015-05-04 18:58:09', '35yxhb3wfxwdhm2rccmymzt6c2rh2ksb'),
	(273, 97, 'email_setup', '{"email_content":"<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>-><div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer and negotiation about your salary.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>"}', '2015-05-04 18:59:08', '2c73jftxm7bsxb7xy4rmcx76x5mn6wbn'),
	(274, 97, 'email_setup', '{"email_cc":"null->iskandar.tio@gmail.com","attachment":"null->0","updated_by":"null->97"}', '2015-05-04 18:59:19', 'cmnprzt8jbz4bfcw8hy5bv8ksyj8d3zm'),
	(275, 97, 'email_setup', '{"email_to":"idjsaioj->@applicant_email","email_cc":"null->iskandar.tio@gmail.com","email_subject":"dsjaio->[GIZ] Negotiation for @vacancy_name","params":"hfjfjfh->@applicant_email, @vacancy_name","attachment":"null->0","updated_by":"null->97"}', '2015-05-04 19:00:02', 'bxmc2dmhjtdp2ppv8c5p74f8nx4c22rj'),
	(276, 97, 'email_setup', '{"email_content":"<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer and negotiation about your salary.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>-><div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>"}', '2015-05-04 19:00:33', 'p3yp35287ktrm5y8n3h5zpswd83z427p'),
	(277, 97, 'email_setup', '{"email_content":"<p><br><\\/p>-><div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer and negotiation about your salary.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>"}', '2015-05-04 19:01:08', 'tfxjmhxjyt4fh3rn7mkzt8zhh8c8b4s2'),
	(278, 97, 'email_setup', '{"email_type":"interviewer_5","email_to":"@interviewer_email","email_cc":"iskandar.tio@gmail.com","email_subject":"Negotiation on @vacancy_name","params":null,"email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule for negotiation.&nbsp;<\\/p><p>@list<\\/p><p>Regards,<br>@signature<\\/p>","attachment":"0"}', '2015-05-04 19:02:09', 'bhdtpz2jdcbr7xfx3sc3pt685ywy4h6d'),
	(279, 97, 'email_setup', '{"email_content":"<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer and negotiation about your salary.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>-><div>Dear @applicant_name, &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<\\/div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/div><div>We would like to invite you to attend an interview for @vacancy_name&nbsp;position as attached job description on @interview_date&nbsp;at @interview_time.<\\/div><div>&nbsp;<\\/div><div>@interview_location<br><\\/div><div>&nbsp;<\\/div><div>You will have the interview with @interviewer and negotiation about your salary.<\\/div><div>&nbsp;<\\/div><div>Please confirm your availability for the interview.<\\/div><div>&nbsp;<\\/div><div>We look forward to meeting you.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div>&nbsp;<\\/div><div><br>Fitri Kusumayanti<\\/div><div>HR Professional<\\/div><div>PAKLIM - Policy Advice for Environment and Climate Change<\\/div><div>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/div><div>&nbsp;<\\/div><div>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/div><div>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/div><div>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/div><div>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/div><div>13410 Jakarta, Indonesia<\\/div><div>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/div><div>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/div><div>M +62 8129 5346 045<\\/div><div>E <a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/div><div><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/div><div>&nbsp;<\\/div>"}', '2015-05-04 19:02:55', 'hfmdr3cv836df65fzrkyxpmfx5srw878'),
	(280, 97, 'email_setup', '{"email_content":"<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>-><div><strong>Dear @applicant_name, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>"}', '2015-05-04 19:03:09', 'tx2vy3jtysvy766ktbxrk5c6d3fdv7ds'),
	(281, 97, 'email_setup', '{"email_content":"<div><strong>Dear @applicant_name,<br><\\/strong><strong><br>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for @vacancy_name&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n @interview_date<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t @interview_time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>@interview_location<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with @interviewer.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>@signature<\\/strong><\\/div><div>&nbsp;<br><\\/div>-><div>Dear @applicant_name,<br><br>We would like to invite you to attend an interview for @vacancy_name&nbsp;position as attached job description on @interview_date&nbsp;at @interview_time.<\\/div><div>&nbsp;<\\/div><div>@interview_location<br><\\/div><div>&nbsp;<\\/div><div>You will have the interview with @interviewer.<\\/div><div>&nbsp;<\\/div><div>Please confirm your availability for the interview.<\\/div><div>&nbsp;<\\/div><div>We look forward to meeting you.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div>@signature<\\/div><div>&nbsp;<br><\\/div>"}', '2015-05-04 19:03:52', 'nkyjddydf34tfkhrrdk6844hdtcw54f8'),
	(282, 97, 'email_setup', '{"email_content":"<div><strong>Dear @applicant_name,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We do appreciate you taking the time to interview with us.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Again, thank you for your time.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>@signature<\\/strong><\\/div>-><div>Dear @applicant_name,<\\/div><div>&nbsp;<\\/div><div>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.<\\/div><div>&nbsp;<\\/div><div>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.<\\/div><div>&nbsp;<\\/div><div>We do appreciate you taking the time to interview with us.<\\/div><div>&nbsp;<\\/div><div>Again, thank you for your time.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div>@signature<\\/div>"}', '2015-05-04 19:04:18', 'j4vp8w8cfn8c2spfsd3zkrssvfkvm5vt'),
	(283, 97, 'vacancy_progress', '{"process_name":"Written Test->Written Test (Test Tertulis)"}', '2015-05-04 19:53:14', 'cy7bd85synk8cz2r7nchxvb5bwdy4r7s'),
	(284, 97, 'vacancy_progress', '{"process_name":"Written Test (Test Tertulis)->Written Test"}', '2015-05-04 19:55:40', 'vxtpj6hhhynr7cbcpmhbk6yx2zts8xnh'),
	(285, 97, 'applicants', '{"contract1_start_date":"null->2015-05-01 00:00:00","contract1_end_date":"null->2015-07-31 00:00:00","job_title":"null->Senior Manager","job_position":"null->Head of Accounting","project_name":"null->PAKLIM","principal_advisor":"null->68","financial_controller":"null->69","project_number":"null->001-PAK","team_leader":"null->69","project_location":"null->Jakarta GIZ","office_manager":"null->103","responsible_superior":"null->69","SAP_No":"null->SAP No","working_time":"null->100","salary":"null->\\/uO7OzAe0Iu4r4gozDFAa9zqKMwIQg9PL\\/QGboiFfF3Vllo2UX7q","salary_band":"null->2T","updated_by":"113->97"}', '2015-05-04 19:58:32', 'pnbm6n2d2s82bv6kmmkpftbxjz227wnv'),
	(286, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 19:58:32', 'pnbm6n2d2s82bv6kmmkpftbxjz227wnv'),
	(289, 97, 'm_user', '{"user_name":""}', '2015-05-04 20:23:43', '6ck8vcbv44smjwm667nmmc6kxvtf46nn'),
	(290, 97, 'employee', '{"user_id":"119","email":null,"title":"Ms.","contract1_start_date":"2015-05-01 00:00:00","contract1_end_date":"2015-07-31 00:00:00","first_name":"Susan","last_name":"Aulia","place_of_birth":"Jakarta","date_of_birth":"1985-12-19 00:00:00","gender":"Female","marital_status":"Single","nationality_id":"1","nationality_val":null,"address":"Jln. Padang","country_id":"1","country_name":null,"province_id":"13","city_id":"72","post_code":"12345","phone1":"987651","phone2":"784561","computer_skills":"Ms Word, Ms Excel","professional_skills":"Research Skill"}', '2015-05-04 20:23:43', '6ck8vcbv44smjwm667nmmc6kxvtf46nn'),
	(291, 97, 'contract_history', '{"start_date":"2015-05-01 00:00:00","end_date":"2015-07-31 00:00:00","user_id":"119","job_title":"Senior Manager","job_position":"Head of Accounting","project_name":"PAKLIM","principal_advisor":"68","financial_controller":"69","project_number":"001-PAK","team_leader":"69","project_location":"Jakarta GIZ","office_manager":"103","responsible_superior":"69","SAP_No":"SAP No","salary":"\\/uO7OzAe0Iu4r4gozDFAa9zqKMwIQg9PL\\/QGboiFfF3Vllo2UX7q","salary_band":"2T","working_time":"100","vacancy_type":"Intern","allowance":"2000000","reason":"Initial Salary"}', '2015-05-04 20:23:43', '6ck8vcbv44smjwm667nmmc6kxvtf46nn'),
	(292, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"6"}', '2015-05-04 20:23:43', '6ck8vcbv44smjwm667nmmc6kxvtf46nn'),
	(293, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring Reminder","email_content":"Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Susan Aulia<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><\\/table>","attachment":""}', '2015-05-04 20:24:03', '5frytvcjtsphnt6fdj2r22tskp2t3pbh'),
	(294, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring for your team","email_content":"Dear No Data,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Susan Aulia<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><\\/table><br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft f\\u00fcr Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-04 20:24:03', 'bvkf2k747bp3hm6fhd23hcpcndtnb25t'),
	(295, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Reminder","email_content":"Dear Ms. Susan Aulia,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft f\\u00fcr Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-04 20:24:03', 'sxfnkwwn7kjtwbcpwjcf482p6vzsm6rh'),
	(296, 97, 'applicants', '{"salary":"\\/uO7OzAe0Iu4r4gozDFAa9zqKMwIQg9PL\\/QGboiFfF3Vllo2UX7q->k3BnYZgeoQX0C\\/ZjNXNrmlGvL5CrLhYgQ7FmSsVw1keIVuv5ug6JiCo="}', '2015-05-04 21:21:11', '6d2wvfpvhpkxy42th8bcwv2kvdwkffyt'),
	(297, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:21:11', '6d2wvfpvhpkxy42th8bcwv2kvdwkffyt'),
	(298, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:21:11', '6d2wvfpvhpkxy42th8bcwv2kvdwkffyt'),
	(299, 97, 'applicants', '{"salary":"k3BnYZgeoQX0C\\/ZjNXNrmlGvL5CrLhYgQ7FmSsVw1keIVuv5ug6JiCo=->v1Q6xVBnqwpw8bN4M7xWQghjpuDI8JbOlHEUI840HOlx6FRa\\/6CDr+g="}', '2015-05-04 21:21:33', '78dcd7ztyj5v74nhyn2symh5zz8j6rm6'),
	(300, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:21:33', '78dcd7ztyj5v74nhyn2symh5zz8j6rm6'),
	(301, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:21:33', '78dcd7ztyj5v74nhyn2symh5zz8j6rm6'),
	(302, 97, 'applicants', '{"salary":"v1Q6xVBnqwpw8bN4M7xWQghjpuDI8JbOlHEUI840HOlx6FRa\\/6CDr+g=->9pBL10yMjdb\\/GesxMTTD1xKIXf2CP0yqsKxKahpA3N8fy6Fy4jYk"}', '2015-05-04 21:21:40', 'mkhz3dmrzy36kcyhsxnz28b6t8fvw2ny'),
	(303, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:21:40', 'mkhz3dmrzy36kcyhsxnz28b6t8fvw2ny'),
	(304, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:21:40', 'mkhz3dmrzy36kcyhsxnz28b6t8fvw2ny'),
	(305, 97, 'applicants', '{"salary":"9pBL10yMjdb\\/GesxMTTD1xKIXf2CP0yqsKxKahpA3N8fy6Fy4jYk->Y0QNhrb6E9eOdyuFdOLTuLMZPgqqFwxiqeKCEJ0hDnZYtpvqYKibKtY="}', '2015-05-04 21:24:47', 'nxfc3cttf7zr5c6wztwcnrfrzvvnzvmb'),
	(306, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:24:47', 'nxfc3cttf7zr5c6wztwcnrfrzvvnzvmb'),
	(307, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:24:47', 'nxfc3cttf7zr5c6wztwcnrfrzvvnzvmb'),
	(308, 97, 'applicants', '{"salary":"Y0QNhrb6E9eOdyuFdOLTuLMZPgqqFwxiqeKCEJ0hDnZYtpvqYKibKtY=->iMN\\/5hcAn7Jr1A5TTwkfHYqKDa5fYMp8L69d+VmhoaTdkS+PSMXqYg=="}', '2015-05-04 21:25:48', '8wyy2hb4373s432nj37cwrnspm5pcdr4'),
	(309, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:25:48', '8wyy2hb4373s432nj37cwrnspm5pcdr4'),
	(310, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:25:48', '8wyy2hb4373s432nj37cwrnspm5pcdr4'),
	(311, 97, 'applicants', '{"salary":"iMN\\/5hcAn7Jr1A5TTwkfHYqKDa5fYMp8L69d+VmhoaTdkS+PSMXqYg==->3SE\\/hCy2OEyuN5AyvAxWNrDlw8g+YRTKjxEXDmnwWMSC2ZwVCGGf71mD"}', '2015-05-04 21:25:58', 'w2w78tyrpxnvxsxvmx8bhn2y7pw8tnpr'),
	(312, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:25:58', 'w2w78tyrpxnvxsxvmx8bhn2y7pw8tnpr'),
	(313, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:25:58', 'w2w78tyrpxnvxsxvmx8bhn2y7pw8tnpr'),
	(314, 97, 'applicants', '{"salary":"3SE\\/hCy2OEyuN5AyvAxWNrDlw8g+YRTKjxEXDmnwWMSC2ZwVCGGf71mD->LsY\\/EVnQQArunzhiGVt+oV0ZsQqOZ62ievlAwNQZbYtBHDGjptHoii2o"}', '2015-05-04 21:30:38', 'xzwzsfym8zwphzkthhdbc3yb7j846w5m'),
	(315, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:30:38', 'xzwzsfym8zwphzkthhdbc3yb7j846w5m'),
	(316, 97, 'job_applied', '{"vacancy_shortlist":"0->1","next_vacancy_progress_id":"null->6"}', '2015-05-04 21:30:38', 'xzwzsfym8zwphzkthhdbc3yb7j846w5m'),
	(317, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:30:38', 'xzwzsfym8zwphzkthhdbc3yb7j846w5m'),
	(318, 97, 'applicants', '{"salary":"LsY\\/EVnQQArunzhiGVt+oV0ZsQqOZ62ievlAwNQZbYtBHDGjptHoii2o->eT9HjSrIKesi6YNYDOcPoqc\\/enuPKJi+xmq6BPmtFq00T44RpIXsA\\/w0"}', '2015-05-04 21:30:58', 'zbvfmkf4jjn5z4bfd6mtkrhmd2pp7b3b'),
	(319, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:30:58', 'zbvfmkf4jjn5z4bfd6mtkrhmd2pp7b3b'),
	(320, 97, 'job_applied', '{"vacancy_shortlist":"0->1","next_vacancy_progress_id":"null->6"}', '2015-05-04 21:30:58', 'zbvfmkf4jjn5z4bfd6mtkrhmd2pp7b3b'),
	(321, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:30:58', 'zbvfmkf4jjn5z4bfd6mtkrhmd2pp7b3b'),
	(322, 97, 'applicants', '{"salary":"eT9HjSrIKesi6YNYDOcPoqc\\/enuPKJi+xmq6BPmtFq00T44RpIXsA\\/w0->tBHTWq\\/hWb7m\\/HCepT12LHw8BA2l20fSYe\\/9x7GecP54SBQ0CLKeiw=="}', '2015-05-04 21:30:59', 'yvn4wbryv7nchhhxfbdpr7pstb7dzdf5'),
	(323, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:30:59', 'yvn4wbryv7nchhhxfbdpr7pstb7dzdf5'),
	(324, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:30:59', 'yvn4wbryv7nchhhxfbdpr7pstb7dzdf5'),
	(325, 97, 'applicants', '{"salary":"tBHTWq\\/hWb7m\\/HCepT12LHw8BA2l20fSYe\\/9x7GecP54SBQ0CLKeiw==->fu2BMYe3RmyC27SAQ8kMv9pUNmy3dNNvySVFDH8euY+vtoE3c6oy7Q=="}', '2015-05-04 21:31:05', '5vzfz8pjc5shm6vcz6z6f8szhf3zjtdr'),
	(326, 97, 'applicants_salary_sharing', 'del {"user_id":"113"}', '2015-05-04 21:31:05', '5vzfz8pjc5shm6vcz6z6f8szhf3zjtdr'),
	(327, 97, 'applicants_salary_sharing', '{"user_id":"113","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 21:31:05', '5vzfz8pjc5shm6vcz6z6f8szhf3zjtdr'),
	(343, 97, 'm_user', '{"user_name":""}', '2015-05-04 21:35:17', 'n7h22fxrjpd6vvssxbzrpzd78s633cpr'),
	(344, 97, 'employee', '{"user_id":"125","email":"susan.aulia","title":"Ms.","contract1_start_date":"2015-05-01 00:00:00","contract1_end_date":"2015-07-31 00:00:00","first_name":"Susan","last_name":"Aulia","place_of_birth":"Jakarta","date_of_birth":"1985-12-19 00:00:00","gender":"Female","marital_status":"Single","nationality_id":"1","nationality_val":null,"address":"Jln. Padang","country_id":"1","country_name":null,"province_id":"13","city_id":"72","post_code":"12345","phone1":"987651","phone2":"784561","computer_skills":"Ms Word, Ms Excel","professional_skills":"Research Skill"}', '2015-05-04 21:35:17', 'n7h22fxrjpd6vvssxbzrpzd78s633cpr'),
	(345, 97, 'contract_history', '{"start_date":"2015-05-01 00:00:00","end_date":"2015-07-31 00:00:00","user_id":"125","job_title":"Senior Manager","job_position":"Head of Accounting","project_name":"PAKLIM","principal_advisor":"68","financial_controller":"69","project_number":"001-PAK","team_leader":"69","project_location":"Jakarta GIZ","office_manager":"103","responsible_superior":"69","SAP_No":"SAP No","salary":"fu2BMYe3RmyC27SAQ8kMv9pUNmy3dNNvySVFDH8euY+vtoE3c6oy7Q==","salary_band":"2T","working_time":"100","vacancy_type":"Intern","allowance":"2000000","reason":"Initial Salary"}', '2015-05-04 21:35:17', 'n7h22fxrjpd6vvssxbzrpzd78s633cpr'),
	(346, 97, 'job_applied', '{"vacancy_progress_id":"1->6","vacancy_shortlist":"1->0"}', '2015-05-04 21:35:17', 'n7h22fxrjpd6vvssxbzrpzd78s633cpr'),
	(347, 97, 'vacancy', '{"vacancy_progress_id":"1->6"}', '2015-05-04 21:35:17', 'n7h22fxrjpd6vvssxbzrpzd78s633cpr'),
	(348, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"6"}', '2015-05-04 21:35:17', 'n7h22fxrjpd6vvssxbzrpzd78s633cpr'),
	(349, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring Reminder","email_content":"Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Susan Aulia<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><\\/table>","attachment":""}', '2015-05-04 21:39:57', '7vz334kspspzyyfz8nsf5mv6kv3r7jrk'),
	(350, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring for your team","email_content":"Dear No Data,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Susan Aulia<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><\\/table><br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft f\\u00fcr Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-04 21:39:57', 'mkd7ybsv7nwcfv6pbcmb3psk7tcj64z5'),
	(351, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Reminder","email_content":"Dear Ms. Susan Aulia,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft f\\u00fcr Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-04 21:39:57', '7svnv6cy6xfrsrsyfbp8c6rcwhv7z2r6'),
	(352, 97, 'project_name', '{"principal_advisor":"69->125","financial_controller":"100->125","updated_by":"null->97"}', '2015-05-04 21:58:09', 'dpdnwd63mmbk3ndwsb6cy6d67crp63xx'),
	(353, 97, 'project_name', '{"principal_advisor":"68->125","financial_controller":"69->125","updated_by":"null->97"}', '2015-05-04 21:58:19', 'yyy7khsdv4fkwsx3vd7jds2z4pn7ftz7'),
	(354, 97, 'project_name', '{"principal_advisor":"69->125","financial_controller":"69->125","updated_by":"null->97"}', '2015-05-04 21:58:28', '3rryhx6yxhxjz8hkywmkxv6tp8jpfkys'),
	(355, 97, 'project_number', 'del {"project_number_id":"5"}', '2015-05-04 21:58:36', 'm8bdfr252k8bnpvv8x2wpnc5zcdvj3k2'),
	(356, 97, 'project_number', 'del {"project_number_id":"6"}', '2015-05-04 21:58:39', 'jssjw2z86bhtm844krtf2dbkyxj63yjz'),
	(357, 97, 'project_number', '{"team_leader":"103->125","updated_by":"null->97"}', '2015-05-04 21:58:48', 'bdy4hbss8fsd574z28474n468425h8vw'),
	(358, 97, 'project_number', '{"team_leader":"69->125","updated_by":"null->97"}', '2015-05-04 21:58:54', 'h47nw2hrpc5d7x2zhrcnptpkwxth688n'),
	(359, 97, 'project_location', '{"project_location":"dhasjfkds hi->Jakarta Nama-Sutri","office_manager":"70->125","updated_by":"null->97"}', '2015-05-04 21:59:12', 'h8jpx78hh5b8cr626ysscrmc6vcf643v'),
	(360, 97, 'project_location', 'del {"project_location_id":"3"}', '2015-05-04 21:59:18', 'cs46428dxy43xwmrpx72xrx4scyd46vc'),
	(361, 97, 'project_location', '{"office_manager":"103->125","updated_by":"null->97"}', '2015-05-04 21:59:26', '22cfbxn5z54p3rmvzrfk243hvrdc4xvc'),
	(362, 97, 'project_location', '{"office_manager":"70->125","updated_by":"null->97"}', '2015-05-04 21:59:35', 'fypbvj7rkcrfpsnxj8tr54rtr2xm4sjt'),
	(363, 97, 'contract_history', '{"responsible_superior":"69->125","salary":"fu2BMYe3RmyC27SAQ8kMv9pUNmy3dNNvySVFDH8euY+vtoE3c6oy7Q==->VN6wUkRkGcKzXWZRVLaEFwqWKnwlR4s8CbRlEOmUSUK\\/qjtoNMe6NfY="}', '2015-05-04 22:29:04', 'mx42kjh5hzf42kpyhzn8rp6dpmftfm58'),
	(364, 97, 'salary_sharing', 'del {"contract_history_id":"133"}', '2015-05-04 22:29:04', 'mx42kjh5hzf42kpyhzn8rp6dpmftfm58'),
	(365, 97, 'salary_sharing', '{"contract_history_id":"133","project_name":"PAKLIM","project_number":"001-PAK","percentage":"100"}', '2015-05-04 22:29:04', 'mx42kjh5hzf42kpyhzn8rp6dpmftfm58'),
	(366, 115, 'applicants_education', '{"user_id":"115","education_id":"2","major":"Accounting","place":"Untar","year_from":"2004","year_to":"2006","countries_id":"101"}', '2015-05-04 22:44:41', 't5kkjddcp4n2rncy4zw7wvkdb8knywxb'),
	(367, 115, 'applicants_language', '{"user_id":"115","language_id":"1","language_skill_id":"1"}', '2015-05-04 22:44:50', '6ppvvz7fnzzzpj8h3rhhffmjw74cwnz3'),
	(368, 115, 'applicants_language', '{"user_id":"115","language_id":"2","language_skill_id":"3"}', '2015-05-04 22:44:55', 'hfyy6dknxnzhkfxhwt8kb364cmjj7cp7'),
	(369, 115, 'applicants_language', '{"user_id":"115","language_id":"3","language_skill_id":"2"}', '2015-05-04 22:45:00', '2vr4h773653rdc5s5c3bfxzhnkc6znry'),
	(370, 115, 'applicants_reference', '{"job_title":"Assistant Manager","title":"Mrs.","reference_name":"Susi","company_name":"PT Angin Anginan","description":"my boss","email":"susi.susi","phone":"021-6394594","user_id":"115"}', '2015-05-04 22:45:52', 'mt7fmnkf6fchzsc7y7jxcr7sfkcjm2zd'),
	(371, 115, 'applicants', '{"cv":"null->.pdf"}', '2015-05-04 22:46:20', 'cpvph8bsvtspmr2vkhjjxw7fc264wsw5'),
	(372, 115, 'applicants', '{"letter":"null->.docx"}', '2015-05-04 22:46:20', '7j2rm5scvv6drdmdp25sxbz2s4jjjjcf'),
	(373, 115, 'applicants_working', '{"month_from":"1","year_from":"2008","month_to":"1","year_to":"2010","employer":"My Employer","countries_id":"15","job_title":"Staff","business_id":"3","email":null,"phone":null,"leave_reason":"No Reason","may_contact":"0","user_id":"115"}', '2015-05-04 22:46:58', 'yj85dbh76r5htbyxw77r6cjwd77nd237'),
	(374, 115, 'job_applied', '{"vacancy_id":"3","user_id":"115","date_applied":"2015-05-04 22:47:20","salary_expectation":"7000000","negotiable":"1"}', '2015-05-04 22:47:20', 'rsm4z5mfwxmhc3dr6bjws2v7phztdvt6'),
	(375, 115, 'applicants_answer', '{"job_applied_id":"5","question_id":"5","choice_id":"173"}', '2015-05-04 22:47:20', 'rsm4z5mfwxmhc3dr6bjws2v7phztdvt6'),
	(376, 115, 'applicants_answer', '{"job_applied_id":"5","question_id":"1","choice_id":"167"}', '2015-05-04 22:47:20', 'rsm4z5mfwxmhc3dr6bjws2v7phztdvt6'),
	(377, 116, 'applicants', '{"user_id":"116","title":"Mr.","first_name":"Angga","last_name":"Aditya","place_of_birth":"Semarang","date_of_birth":"1989-01-01","gender":"Male","marital_status":"Married","nationality_id":"1","nationality_val":null,"address":"Salatiga","country_id":"1","country_name":null,"province_id":"33","city_id":"209","post_code":"12345","phone1":"1578952132","phone2":null,"computer_skills":null,"professional_skills":null}', '2015-05-04 22:48:27', 'cntkdfv63mzypsnxrmkwd7krkm7ncm7v'),
	(378, 116, 'applicants_language', '{"user_id":"116","language_id":"1","language_skill_id":"1"}', '2015-05-04 22:48:34', 'pvp5nnhh6vzy8cn83x45mjp566djhn6v'),
	(379, 116, 'applicants_language', '{"user_id":"116","language_id":"2","language_skill_id":"1"}', '2015-05-04 22:48:38', 'xwvz7p8h3b5rcx8xwvk4zn2kjp26c8j2'),
	(380, 116, 'applicants_language', '{"user_id":"116","language_id":"3","language_skill_id":"1"}', '2015-05-04 22:48:43', 'v4f82z6vx3kyxt8fr8fxt255mzjtnfwj'),
	(381, 116, 'applicants_reference', '{"job_title":"Manager","title":"Ms.","reference_name":"Murni","company_name":"PT Angin","description":"No Description","email":"murni","phone":"123456","user_id":"116"}', '2015-05-04 22:49:37', '7hz3z6pv3s8xv4vcfbb5bvt28nkvm7s3'),
	(382, 116, 'applicants_working', '{"month_from":"3","year_from":"2000","month_to":"3","year_to":"2003","employer":"Employer","countries_id":"3","job_title":"No Title","business_id":"3","email":"employer","phone":null,"leave_reason":"No Reason","may_contact":"1","user_id":"116"}', '2015-05-04 22:50:14', 'sdhrp4tst3j26z5yfjtyb24syx4vhc3c'),
	(383, 116, 'applicants_education', '{"user_id":"116","education_id":"1","major":"IPA","place":"SMUN","year_from":"1996","year_to":"1999","countries_id":"6"}', '2015-05-04 22:50:38', 'w5536tw62dk4xdb25yk7vv8kcn2h4b7t'),
	(384, 116, 'job_applied', '{"vacancy_id":"3","user_id":"116","date_applied":"2015-05-04 22:50:55","salary_expectation":"5000000","negotiable":"0"}', '2015-05-04 22:50:55', 'y66bckzmk2thy3xn88584rjhds46syv4'),
	(385, 116, 'applicants_answer', '{"job_applied_id":"6","question_id":"5","choice_id":"172"}', '2015-05-04 22:50:55', 'y66bckzmk2thy3xn88584rjhds46syv4'),
	(386, 116, 'applicants_answer', '{"job_applied_id":"6","question_id":"1","choice_id":"167"}', '2015-05-04 22:50:55', 'y66bckzmk2thy3xn88584rjhds46syv4'),
	(387, 97, 'contract_history', '{"project_location":"dhasjfkds hi->Jakarta Nama-Sutri","responsible_superior":"69->125","salary":"oobnEjC7BfwXRwiQIOKYkTj7JZMyb7FesCwWJ0gZwP24TwkDU4eapQ==->w+Yzjmw1\\/gafmiNhe3i5nEh5e3mVEmNoNxYPg3Cr+zsdQNOdVXRk","updated_by":"null->97"}', '2015-05-04 22:56:12', 'rcbd54xrvnk3pbdhd3r5hx4sjf62n8cb'),
	(388, 97, 'job_applied', '{"next_vacancy_progress_id":"null->1","updated_by":"115->97"}', '2015-05-04 23:22:32', 'npd6x86wb7vvs3mc8t4ynmktrbjhsm4s'),
	(389, 97, 'job_applied', '{"next_vacancy_progress_id":"null->1","updated_by":"116->97"}', '2015-05-04 23:22:32', 'pk3wmkxhtd3v3pxdxnmnx3j5xx6s8wt7'),
	(390, 97, 'vacancy_timeline', 'del {"vacancy_id":"3","vacancy_progress_id":"1"}', '2015-05-04 23:22:39', 'yrbht62ssyncpxy6v52s3cjhpvdhhhdv'),
	(391, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"1"}', '2015-05-04 23:22:39', 'yrbht62ssyncpxy6v52s3cjhpvdhhhdv'),
	(392, 97, 'vacancy_employee', '{"vacancy_id":"3","employee_id":"125","vacancy_progress_id":"9"}', '2015-05-04 23:22:53', 'yzw46nrn7cc2whmdw2b2jbrhc6xvktp8'),
	(393, 97, 'vacancy_employee', '{"vacancy_id":"3","employee_id":"97","vacancy_progress_id":"9"}', '2015-05-04 23:23:11', '48cw6j8wfpjdz3dvdfsvsdcdvcw6fths'),
	(394, 97, 'user_ranking', '{"vacancy_employee_id":"2","user_id":"115","ranking_id":"1","user_comment":"ok"}', '2015-05-04 23:23:11', '48cw6j8wfpjdz3dvdfsvsdcdvcw6fths'),
	(395, 97, 'job_applied', '{"next_vacancy_progress_id":"null->9"}', '2015-05-04 23:23:11', '48cw6j8wfpjdz3dvdfsvsdcdvcw6fths'),
	(396, 97, 'vacancy_interview', '{"vacancy_id":"3","user_id":"115","vacancy_progress_id":"9","interview_place":"","interview_date":null,"interview_time":""}', '2015-05-04 23:23:11', '48cw6j8wfpjdz3dvdfsvsdcdvcw6fths'),
	(397, 97, 'user_ranking', '{"vacancy_employee_id":"2","user_id":"116","ranking_id":"2","user_comment":"ok"}', '2015-05-04 23:23:11', 'rtc5swv72pscwks6kfy784vbrxp6f24f'),
	(398, 97, 'job_applied', '{"next_vacancy_progress_id":"null->9"}', '2015-05-04 23:23:11', 'rtc5swv72pscwks6kfy784vbrxp6f24f'),
	(399, 97, 'vacancy_interview', '{"vacancy_id":"3","user_id":"116","vacancy_progress_id":"9","interview_place":"","interview_date":null,"interview_time":""}', '2015-05-04 23:23:11', 'rtc5swv72pscwks6kfy784vbrxp6f24f'),
	(400, 97, 'vacancy_interview', '{"interview_date":"null->2015-05-04 00:00:00","interview_time":"null->12.30","interview_place":"null->Wisma Bakrie2"}', '2015-05-04 23:24:19', 'jb62ns45xdwsszc86nn55xzdpd36bmmn'),
	(401, 97, 'vacancy_interview', '{"interview_date":"null->2015-05-04 00:00:00","interview_time":"null->13.30","interview_place":"null->Wisma Bakrie2"}', '2015-05-04 23:24:30', 'csrj7bmv2bn6pyd4nzrvnr75jtxnx8y2'),
	(402, 97, 'm_user_role', '{"user_id":"125","role_id":"3"}', '2015-05-04 23:25:14', 'vkvkmhjy7bzfrxw3w3f6btctptfzxs4j'),
	(403, 97, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"susan.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: vtxsn77n4t Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=8rwpf5wz2ktvt42v6kh7hvr5hwrhs7\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=8rwpf5wz2ktvt42v6kh7hvr5hwrhs7\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=8rwpf5wz2ktvt42v6kh7hvr5hwrhs7<\\/a>","attachment":""}', '2015-05-04 23:25:14', 'vkvkmhjy7bzfrxw3w3f6btctptfzxs4j'),
	(404, 0, 'm_user', '{"status_id":"null->1","updated_by":"97->0"}', '2015-05-04 23:25:52', '6hd8z4c2vy8s3wccr6kkfpc2pwbp3wvc'),
	(405, 125, 'm_user', '{"pwd":"4546c4b279f33d307344cde5589eee16bf2a5cdc4fd495f2e443880cdec894ab2b2ad920883601acaec3d1044c878d243fa5c287a30b455072af64ddfdb19799->1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75","updated_by":"0->125"}', '2015-05-04 23:26:25', '5zbc2mprcw4mtz3pjj3jkpxm57vms6fh'),
	(406, 97, 'm_role_module', 'del {"role_id":"3"}', '2015-05-04 23:46:10', '2psvjbkhpw5sxxr8tjn63y5sdv2r376x'),
	(407, 97, 'm_role_module', '{"module_id":"25","role_id":"3"}', '2015-05-04 23:46:10', '2psvjbkhpw5sxxr8tjn63y5sdv2r376x'),
	(408, 97, 'm_role_module', '{"module_id":"26","role_id":"3"}', '2015-05-04 23:46:10', '2psvjbkhpw5sxxr8tjn63y5sdv2r376x'),
	(409, 97, 'm_role_module', '{"module_id":"5","role_id":"3"}', '2015-05-04 23:46:10', '2psvjbkhpw5sxxr8tjn63y5sdv2r376x'),
	(410, 97, 'm_role_module', '{"module_id":"38","role_id":"3"}', '2015-05-04 23:46:10', '2psvjbkhpw5sxxr8tjn63y5sdv2r376x'),
	(411, 97, 'm_role_module', '{"module_id":"47","role_id":"3"}', '2015-05-04 23:46:10', '2psvjbkhpw5sxxr8tjn63y5sdv2r376x'),
	(412, 97, 'm_role_module', 'del {"module_id":"47"}', '2015-05-04 23:46:21', 'rsnthzfjpr3z2rjrf5xw6y4h2ndk4t88'),
	(413, 97, 'm_role_module', '{"module_id":"47","role_id":"3"}', '2015-05-04 23:46:21', 'rsnthzfjpr3z2rjrf5xw6y4h2ndk4t88'),
	(414, 97, 'm_role_module', '{"module_id":"47","role_id":"1"}', '2015-05-04 23:46:21', 'rsnthzfjpr3z2rjrf5xw6y4h2ndk4t88'),
	(415, 97, 'm_role_module', '{"module_id":"47","role_id":"2"}', '2015-05-04 23:46:21', 'rsnthzfjpr3z2rjrf5xw6y4h2ndk4t88'),
	(416, 125, 'user_ranking', '{"ranking_id":"1","user_comment":"Best","user_id":"115","vacancy_employee_id":"1"}', '2015-05-04 23:51:03', 'hkj37zddv2jpcktbt3x7n5nxxvwdsvbb'),
	(417, 125, 'user_ranking', '{"ranking_id":"2","user_comment":"Second Best","user_id":"116","vacancy_employee_id":"1"}', '2015-05-04 23:51:11', 'tnkh72ccs4hc4m5kj8t6pmpv8jrd83ct'),
	(418, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"9"}', '2015-05-04 23:52:57', 'rbnnwvmrmdy5b5p5c8b8w3rfkmt2mmjs'),
	(419, 97, 'email', '{"email_from":"","email_to":"bella.nurul","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"[GIZ] Interview Invitation","email_content":"<div><strong>Dear Ms. Bella Nurul,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend a written test&nbsp;<\\/strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n Monday, May 04, 2015<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t 12:30 pm.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Wisma Bakrie2<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><\\/strong><strong>Please confirm your availability for the test.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-04 23:52:57', 'rbnnwvmrmdy5b5p5c8b8w3rfkmt2mmjs'),
	(420, 97, 'email', '{"email_from":"","email_to":"angga.aditya","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"[GIZ] Interview Invitation","email_content":"<div><strong>Dear Mr. Angga Aditya,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend a written test&nbsp;<\\/strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n Monday, May 04, 2015<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t 01:30 pm.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Wisma Bakrie2<\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><\\/strong><strong>Please confirm your availability for the test.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-04 23:52:57', 'rbnnwvmrmdy5b5p5c8b8w3rfkmt2mmjs'),
	(421, 97, 'signature', '{"signature":"<strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft f\\u00fcr Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>-><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","updated_by":"null->97"}', '2015-05-04 23:54:10', 'sxd2t42zddd5mtm3tfn8wm8znypwm54s'),
	(422, 97, 'vacancy_employee', '{"vacancy_id":"3","employee_id":"97","vacancy_progress_id":"3"}', '2015-05-05 00:50:18', 'h6cbtf2b8fn7z4cfkz38sr7s66ws4hdv'),
	(423, 97, 'user_ranking', '{"vacancy_employee_id":"3","user_id":"115","ranking_id":"1","user_comment":"ok"}', '2015-05-05 00:50:18', 'h6cbtf2b8fn7z4cfkz38sr7s66ws4hdv'),
	(424, 97, 'job_applied', '{"next_vacancy_progress_id":"null->3"}', '2015-05-05 00:50:18', 'h6cbtf2b8fn7z4cfkz38sr7s66ws4hdv'),
	(425, 97, 'vacancy_interview', '{"vacancy_id":"3","user_id":"115","vacancy_progress_id":"3","interview_place":"KLH","interview_date":"2015-05-05","interview_time":"12.30"}', '2015-05-05 00:50:18', 'h6cbtf2b8fn7z4cfkz38sr7s66ws4hdv'),
	(426, 97, 'user_ranking', '{"vacancy_employee_id":"3","user_id":"116","ranking_id":"2","user_comment":"ok"}', '2015-05-05 00:50:19', 'dsy5h2p2cc68csnby8dj7mh2kp4crh6c'),
	(427, 97, 'job_applied', '{"next_vacancy_progress_id":"null->3"}', '2015-05-05 00:50:19', 'dsy5h2p2cc68csnby8dj7mh2kp4crh6c'),
	(428, 97, 'vacancy_interview', '{"vacancy_id":"3","user_id":"116","vacancy_progress_id":"3","interview_place":"KLH","interview_date":"2015-05-05","interview_time":"11.30"}', '2015-05-05 00:50:19', 'dsy5h2p2cc68csnby8dj7mh2kp4crh6c'),
	(429, 97, 'vacancy_employee', '{"vacancy_id":"3","employee_id":"125","vacancy_progress_id":"3"}', '2015-05-05 00:50:32', 'bfk348np6dk2vw4kn67vkfwjj4ph3r82'),
	(430, 125, 'user_ranking', '{"ranking_id":"1","user_comment":"a","user_id":"115","vacancy_employee_id":"4"}', '2015-05-05 00:51:02', 'hzb5ry4tyf773c7vc5vd64f2hn86pkfv'),
	(431, 125, 'user_ranking', '{"ranking_id":"1","user_comment":"a","user_id":"116","vacancy_employee_id":"4"}', '2015-05-05 00:51:08', 'mwbr624m8hn5kzn8243p3p3zwxtnzmmb'),
	(432, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"3"}', '2015-05-05 00:51:26', 'w4cwm8y2bxnhr22w2twxz5jr3v5wppfn'),
	(433, 97, 'email', '{"email_from":"","email_to":"bella.nurul","email_cc":"iskandar.tio@gmail.com;iskandar.tio@gmail.com","email_bcc":"","email_subject":"First Interview","email_content":"<div>Dear Ms. Bella Nurul,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 12:30 pm.<\\/div><div>&nbsp;<\\/div><div>KLH<br><\\/div><div>&nbsp;<\\/div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.<\\/div><div>&nbsp;<\\/div><div>Please confirm your availability for the interview.<\\/div><div>&nbsp;<\\/div><div>We look forward to meeting you.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div>&nbsp;<br><\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-05 00:51:26', 'w4cwm8y2bxnhr22w2twxz5jr3v5wppfn'),
	(434, 97, 'email', '{"email_from":"","email_to":"angga.aditya","email_cc":"iskandar.tio@gmail.com;iskandar.tio@gmail.com","email_bcc":"","email_subject":"First Interview","email_content":"<div>Dear Mr. Angga Aditya,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 11:30 am.<\\/div><div>&nbsp;<\\/div><div>KLH<br><\\/div><div>&nbsp;<\\/div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.<\\/div><div>&nbsp;<\\/div><div>Please confirm your availability for the interview.<\\/div><div>&nbsp;<\\/div><div>We look forward to meeting you.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div>&nbsp;<br><\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-05 00:51:26', 'w4cwm8y2bxnhr22w2twxz5jr3v5wppfn'),
	(435, 97, 'email', '{"email_from":"","email_to":"amir","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>KLH<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>12:30 pm<\\/td><\\/tr><tr><td>Mr. Angga Aditya<\\/td><td>KLH<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>11:30 am<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 00:51:26', 'w4cwm8y2bxnhr22w2twxz5jr3v5wppfn'),
	(436, 97, 'email', '{"email_from":"","email_to":"susan.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>KLH<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>12:30 pm<\\/td><\\/tr><tr><td>Mr. Angga Aditya<\\/td><td>KLH<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>11:30 am<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 00:51:26', 'w4cwm8y2bxnhr22w2twxz5jr3v5wppfn'),
	(437, 97, 'email', '{"email_from":"","email_to":"susi.susi","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Asking for reference","email_content":"<p>Dear Mrs. Susi,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding Bella Nurul, who considered to become Accounting.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for Bella Nurul, as she has putting your name as her referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding Bella Nurul&#39;s qualifications and skills in jfojfds fsd, as well as your connection with her.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","attachment":""}', '2015-05-05 00:51:26', 'w4cwm8y2bxnhr22w2twxz5jr3v5wppfn'),
	(438, 97, 'email', '{"email_from":"","email_to":"murni","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Asking for reference","email_content":"<p>Dear Ms. Murni,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding Angga Aditya, who considered to become Accounting.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for Angga Aditya, as he has putting your name as his referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding Angga Aditya&#39;s qualifications and skills in jfojfds fsd, as well as your connection with him.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","attachment":""}', '2015-05-05 00:51:26', 'w4cwm8y2bxnhr22w2twxz5jr3v5wppfn'),
	(439, 97, 'vacancy_interview', '{"interview_place":"KLH->Wisma Bakrie2"}', '2015-05-05 01:00:01', 'fy7b7b2tvyf8bf7xvvrrmx2c47ppkvtm'),
	(440, 97, 'employee_outpatient', '{"invoice_val":"-50000->-60000","claim":"-50000->-60000","paid":"-45000->-54000","input_date":"2015-04-28 00:00:00->2015-05-05 00:00:00","updated_by":"null->97"}', '2015-05-05 01:25:17', '8fjpcfvnw52w24cfncdmsfkdcd4dmvdy'),
	(441, 97, 'employee_outpatient', '{"user_id":"97","invoice_date":"2015-05-05","invoice_val":"200000","remarks":"obat","claim":"200000","paid":180000,"input_date":"2015-05-05"}', '2015-05-05 01:25:38', '73sxzffjv43mxbzfdn5hbw7c4wsfkv55'),
	(442, 97, 'employee_outpatient', '{"paid_status":"null->1","updated_by":"null->97"}', '2015-05-05 01:28:36', 'yk82nm3hysxxxtz64p4n7stpyw2vtw8n'),
	(443, 97, 'employee_eyeglasses', '{"claim_type":"Lens","user_id":"n7t88jf64s3t","invoice_date":"2015-05-05","invoice_val":"750000","remarks":"change lens","claim":"750000","paid":675000}', '2015-05-05 01:33:03', '3j3fpth3tpkj477ysybjjtjt8mm8mv3c'),
	(444, 97, 'employee_eyeglasses', '{"claim_type":"Lens","user_id":"97","invoice_date":"2015-05-05","invoice_val":"750000","remarks":"lengs","claim":"750000","paid":675000}', '2015-05-05 01:35:09', 'y7htz5tk58pypszkzkvpwz3pb3wscsc5'),
	(445, 97, 'employee_eyeglasses', '{"paid_status":"null->1"}', '2015-05-05 01:35:24', 't47z72k3ccsyhftwsrdkzxxhzzrhfxj4'),
	(446, 97, 'employee_pregnancy', '{"user_id":"97","invoice_date":"2015-05-05","invoice_val":"750000","remarks":"rs ","claim":"750000","paid":675000,"input_date":"2015-05-05"}', '2015-05-05 01:36:09', 'cd877k3xmdffbdzcswwnrwcpdvrfdzr5'),
	(447, 97, 'employee_pregnancy', '{"user_id":"97","invoice_date":"2015-05-05","invoice_val":"500000","remarks":"medicine","claim":"500000","paid":450000,"input_date":"2015-05-05"}', '2015-05-05 01:37:19', 'swr7y6h3yw7f6f5xnv8t67mspy8f7s8j'),
	(448, 97, 'employee_pregnancy', '{"invoice_val":"500000->10000","claim":"500000->10000","paid":"450000->9000"}', '2015-05-05 01:37:35', 'dyzj7625x55nk5hzfp7sp5h6hjjtnrmj'),
	(449, 97, 'employee_medical_checkup', '{"user_id":"","invoice_date":"2015-05-05","invoice_val":"500000","remarks":"hdjklf","claim":"500000","paid":450000}', '2015-05-05 01:38:44', 'vz6ybt55bvskxw8txm3jb7z77w4vvhsr'),
	(450, 97, 'employee_medical_checkup', '{"paid_status":"null->1"}', '2015-05-05 01:38:58', 'w8n2pkbp5jmn572447y463vd4fwzxcnd'),
	(451, 97, 'employee_medical_checkup', '{"user_id":"","invoice_date":"2015-05-05","invoice_val":"500000","remarks":"1fdsfds","claim":"500000","paid":450000}', '2015-05-05 01:39:53', 'v8y3w7wnnpbrn5dz5j7mk8n4b2mc3vwk'),
	(452, 97, 'employee_medical_checkup', '{"user_id":"97","invoice_date":"2015-05-05","invoice_val":"500000","remarks":"ok","claim":"500000","paid":450000}', '2015-05-05 01:42:33', 'jbskn8nyrrn7bsktckbrcdd7v8xcht82'),
	(453, 97, 'employee_medical_checkup', '{"paid_status":"null->1"}', '2015-05-05 01:42:48', 'xmsxvhjs2kytv7hm8675mzv55824vvdd'),
	(454, 97, 'location', '{"location_val":"<p>Location:<\\/p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsi<br>jfdskh<a href=\\"ffds\\" data-mce-href=\\"ffds\\">ffds<\\/a>gfdgtr<\\/p>-><p>Location:<\\/p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href=\\"ffds\\" data-mce-href=\\"ffds\\">ffds<\\/a>gfdgtr<\\/p>","updated_by":"null->97"}', '2015-05-05 01:51:02', '5cdzmh5tpjbwcb4rfs33tffwmdkd75y2'),
	(455, 97, 'vacancy_employee', '{"vacancy_id":"3","employee_id":"97","vacancy_progress_id":"4"}', '2015-05-05 01:57:39', 'nz53sz6fd4f6ctpttzdjyv63jbyxyk57'),
	(456, 97, 'user_ranking', '{"vacancy_employee_id":"5","user_id":"115","ranking_id":"2","user_comment":"a"}', '2015-05-05 01:57:39', 'nz53sz6fd4f6ctpttzdjyv63jbyxyk57'),
	(457, 97, 'job_applied', '{"next_vacancy_progress_id":"null->4"}', '2015-05-05 01:57:39', 'nz53sz6fd4f6ctpttzdjyv63jbyxyk57'),
	(458, 97, 'vacancy_interview', '{"vacancy_id":"3","user_id":"115","vacancy_progress_id":"4","interview_place":"Wisma Bakrie2","interview_date":"2015-05-05","interview_time":"17.30"}', '2015-05-05 01:57:39', 'nz53sz6fd4f6ctpttzdjyv63jbyxyk57'),
	(459, 97, 'vacancy_employee', '{"vacancy_id":"3","employee_id":"125","vacancy_progress_id":"4"}', '2015-05-05 01:58:01', 'y36v7nxhh82pdjynkwcyxdb7b8xm54j6'),
	(460, 125, 'user_ranking', '{"ranking_id":"2","user_comment":"fdsfd","user_id":"115","vacancy_employee_id":"6"}', '2015-05-05 01:58:24', 'cnz5jnvb56znxcfsf74kcyrwtkjnfpyr'),
	(461, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"4"}', '2015-05-05 01:58:57', 'vc5xwx3d8bb48szhw5vw4ps5887f8jhw'),
	(462, 97, 'email', '{"email_from":"","email_to":"bella.nurul","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"[GIZ] Interview Invitation Accounting (Acc-Acc)","email_content":"<div><strong>Dear Ms. Bella Nurul, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<\\/strong><\\/div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong><\\/div><div><strong>We <\\/strong><strong>would like to invite you to attend an interview <\\/strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description <\\/strong><strong>o<\\/strong><strong>n Tuesday, May 05, 2015<\\/strong><strong>&nbsp;<\\/strong><strong>a<\\/strong><strong>t 05:30 pm.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><p>Location:<\\/p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href=\\"ffds\\" data-mce-href=\\"ffds\\">ffds<\\/a>gfdgtr<\\/p><\\/strong><br><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Please confirm your availability for the interview.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>We look forward to meeting you.<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Best Regards,<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong><br>Fitri Kusumayanti<\\/strong><\\/div><div><strong>HR Professional<\\/strong><\\/div><div><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<\\/strong><\\/div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><\\/div><div><strong>&nbsp;<\\/strong><\\/div><div><strong>Deutsche Gesellschaft f\\u00c3\\u00bcr<\\/strong><\\/div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH<\\/strong><\\/div><div><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<\\/strong><\\/div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><\\/div><div><strong>13410 Jakarta, Indonesia<\\/strong><\\/div><div><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<\\/a><\\/strong><\\/div><div><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<\\/a><\\/strong><\\/div><div><strong>M +62 8129 5346 045<\\/strong><\\/div><div><strong>E <\\/strong><strong><a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div><strong><a href=\\"http:\\/\\/www.paklim.or.id\\/\\" data-mce-href=\\"http:\\/\\/www.paklim.or.id\\/\\">www.paklim.org<\\/a><\\/strong><\\/div><div>&nbsp;<\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-05 01:58:57', 'vc5xwx3d8bb48szhw5vw4ps5887f8jhw'),
	(463, 97, 'email', '{"email_from":"","email_to":"amir","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>Wisma Bakrie2<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>05:30 pm<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 01:58:57', 'vc5xwx3d8bb48szhw5vw4ps5887f8jhw'),
	(464, 97, 'email', '{"email_from":"","email_to":"susan.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>Wisma Bakrie2<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>05:30 pm<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 01:58:57', 'vc5xwx3d8bb48szhw5vw4ps5887f8jhw'),
	(465, 97, 'email', '{"email_from":"","email_to":"susi.susi","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Asking for reference","email_content":"<p>Dear Mrs. Susi,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding Bella Nurul, who considered to become Accounting.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for Bella Nurul, as she has putting your name as her referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding Bella Nurul&#39;s qualifications and skills in jfojfds fsd, as well as your connection with her.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","attachment":""}', '2015-05-05 01:58:57', 'vc5xwx3d8bb48szhw5vw4ps5887f8jhw'),
	(466, 97, 'applicants', '{"contract1_start_date":"null->2015-05-05 00:00:00","contract1_end_date":"null->2015-06-30 00:00:00","job_title":"null->Senior Advisor","job_position":"null->Head of Accounting","project_name":"null->PAKLIM","principal_advisor":"null->125","financial_controller":"null->125","project_number":"null->001-PAK","team_leader":"null->125","project_location":"null->Jakarta GIZ","office_manager":"null->125","responsible_superior":"null->125","SAP_No":"null->SAPhj","working_time":"null->100","salary":"null->ROZZu2jHSkmc++lPYfps3KckeSEajCpf4cLeRxXeWL7L+WGTJdi2nw==","salary_band":"null->2T","updated_by":"115->97"}', '2015-05-05 09:01:16', '3sj8r8j5tfkwtfjft2ppjxb3xr5y3sv7'),
	(467, 97, 'job_applied', '{"vacancy_shortlist":"0->1","next_vacancy_progress_id":"null->6"}', '2015-05-05 09:01:16', '3sj8r8j5tfkwtfjft2ppjxb3xr5y3sv7'),
	(468, 97, 'applicants_salary_sharing', '{"user_id":"115","project_name":"PAKLIM","project_number":"001-PAK","percentage":"70"}', '2015-05-05 09:01:16', '3sj8r8j5tfkwtfjft2ppjxb3xr5y3sv7'),
	(469, 97, 'applicants_salary_sharing', '{"user_id":"115","project_name":"Nama-Sutri","project_number":"001","percentage":"30"}', '2015-05-05 09:01:16', '3sj8r8j5tfkwtfjft2ppjxb3xr5y3sv7'),
	(470, 97, 'm_user', '{"user_name":""}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(471, 97, 'employee', '{"user_id":"126","email":"bella.nurul","title":"Ms.","contract1_start_date":"2015-05-01 00:00:00","contract1_end_date":"2015-07-31 00:00:00","first_name":"Susan","last_name":"Aulia","place_of_birth":"Jakarta","date_of_birth":"1985-12-19 00:00:00","gender":"Female","marital_status":"Single","nationality_id":"1","nationality_val":null,"address":"Jln. Padang","country_id":"1","country_name":null,"province_id":"13","city_id":"72","post_code":"12345","phone1":"987651","phone2":"784561","computer_skills":"Ms Word, Ms Excel","professional_skills":"Research Skill"}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(472, 97, 'contract_history', '{"start_date":"2015-05-01 00:00:00","end_date":"2015-07-31 00:00:00","user_id":"126","job_title":"Senior Manager","job_position":"Head of Accounting","project_name":"PAKLIM","project_number":"001-PAK","project_location":"Jakarta GIZ","responsible_superior":"69","SAP_No":"SAP No","salary":"fu2BMYe3RmyC27SAQ8kMv9pUNmy3dNNvySVFDH8euY+vtoE3c6oy7Q==","salary_band":"2T","working_time":"100","vacancy_type":"Intern","allowance":"2000000","reason":"Initial Salary"}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(473, 97, 'm_user', '{"user_name":""}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(474, 97, 'employee', '{"user_id":"127","email":"bella.nurul","title":"Ms.","contract1_start_date":"2015-05-05 00:00:00","contract1_end_date":"2015-06-30 00:00:00","first_name":"Bella","last_name":"Nurul","place_of_birth":"Jakarta","date_of_birth":"1986-04-15 00:00:00","gender":"Female","marital_status":"Single","nationality_id":"1","nationality_val":null,"address":"jakarta","country_id":"1","country_name":null,"province_id":"31","city_id":"156","post_code":"11250","phone1":"12345","phone2":null,"computer_skills":null,"professional_skills":null}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(475, 97, 'contract_history', '{"start_date":"2015-05-05 00:00:00","end_date":"2015-06-30 00:00:00","user_id":"127","job_title":"Senior Advisor","job_position":"Head of Accounting","project_name":"PAKLIM","project_number":"001-PAK","project_location":"Jakarta GIZ","responsible_superior":"125","SAP_No":"SAPhj","salary":"ROZZu2jHSkmc++lPYfps3KckeSEajCpf4cLeRxXeWL7L+WGTJdi2nw==","salary_band":"2T","working_time":"100","vacancy_type":"Intern","allowance":"2000000","reason":"Initial Salary"}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(476, 97, 'job_applied', '{"vacancy_progress_id":"4->6","vacancy_shortlist":"1->0"}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(477, 97, 'vacancy', '{"vacancy_progress_id":"4->6"}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(478, 97, 'vacancy_timeline', 'del {"vacancy_id":"3","vacancy_progress_id":"6"}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(479, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"6"}', '2015-05-05 09:02:13', 'm2vvs5m57yxc8wp4mx28fpnnyxspzbk7'),
	(480, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring Reminder","email_content":"Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Susan Aulia<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>Senior Advisor<\\/td><td>30-06-2015<\\/td><\\/tr><\\/table>","attachment":""}', '2015-05-05 09:02:21', 'sbjbkjh5srzcc7r87b7wchjjm3snnt5v'),
	(481, 97, 'email', '{"email_from":"","email_to":"susan.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring for your team","email_content":"Dear Ms. Susan Aulia,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Susan Aulia<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>Senior Advisor<\\/td><td>30-06-2015<\\/td><\\/tr><\\/table><br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-05 09:02:21', '7bnnn68mvtch5c522fynfrc77tsy4bdy'),
	(482, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Reminder","email_content":"Dear Ms. Susan Aulia,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-05 09:02:21', 'kwbrfpf3ckkx6wb46kznp5svdtdkcb28'),
	(483, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Reminder","email_content":"Dear Ms. Bella Nurul,<br><br>Your Contract will be expired at 30-06-2015<br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-05 09:02:21', '544w6tf864p22k3n6ph4fxszz7kc6k4h'),
	(502, 97, 'm_user', '{"user_name":""}', '2015-05-05 09:21:58', 'js6tx6y6dhvvc3px62skc83b8dbmwb4t'),
	(503, 97, 'employee', '{"user_id":"134","email":"bella.nurul","title":"Ms.","contract1_start_date":"2015-05-05 00:00:00","contract1_end_date":"2015-06-30 00:00:00","first_name":"Bella","last_name":"Nurul","place_of_birth":"Jakarta","date_of_birth":"1986-04-15 00:00:00","gender":"Female","marital_status":"Single","nationality_id":"1","nationality_val":null,"address":"jakarta","country_id":"1","country_name":null,"province_id":"31","city_id":"156","post_code":"11250","phone1":"12345","phone2":null,"computer_skills":null,"professional_skills":null}', '2015-05-05 09:21:58', 'js6tx6y6dhvvc3px62skc83b8dbmwb4t'),
	(504, 97, 'contract_history', '{"start_date":"2015-05-05 00:00:00","end_date":"2015-06-30 00:00:00","user_id":"134","job_title":"Senior Advisor","job_position":"Head of Accounting","project_name":"PAKLIM","project_number":"001-PAK","project_location":"Jakarta GIZ","responsible_superior":"125","SAP_No":"SAPhj","salary":"ROZZu2jHSkmc++lPYfps3KckeSEajCpf4cLeRxXeWL7L+WGTJdi2nw==","salary_band":"2T","working_time":"100","vacancy_type":"Intern","allowance":"2000000","reason":"Initial Salary"}', '2015-05-05 09:21:58', 'js6tx6y6dhvvc3px62skc83b8dbmwb4t'),
	(505, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"6"}', '2015-05-05 09:21:58', 'js6tx6y6dhvvc3px62skc83b8dbmwb4t'),
	(506, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring Reminder","email_content":"Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>Senior Advisor<\\/td><td>30-06-2015<\\/td><\\/tr><\\/table>","attachment":""}', '2015-05-05 09:22:44', 'tr3hbz2w8tfbj34w66ssvs2fx74kbkjh'),
	(507, 97, 'email', '{"email_from":"","email_to":"susan.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring for your team","email_content":"Dear Ms. Susan Aulia,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Bella Nurul<\\/td><td>Senior Advisor<\\/td><td>30-06-2015<\\/td><\\/tr><\\/table><br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-05 09:22:44', 'pr8cckjrdxmvwfwhzbf23zmnbs8hk2n5'),
	(508, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Reminder","email_content":"Dear Ms. Bella Nurul,<br><br>Your Contract will be expired at 30-06-2015<br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-05 09:22:44', 'msk7f7jdfws6p5bbjwyhf3ypmppywz67'),
	(509, 97, 'project_location', '{"office_manager":"125->134"}', '2015-05-05 09:24:28', 'pbnsnv82pkvtnfkdf5djjry465tsfc8t'),
	(510, 97, 'm_user_role', '{"user_id":"134","role_id":"3"}', '2015-05-05 09:24:55', '3rcstnrcty3vncv4n4v8j3x6nszp6drk'),
	(511, 97, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"bella.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: m5ccjf5swd Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=xxz3shf454p8dv76wptc5jtjpbjrws\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=xxz3shf454p8dv76wptc5jtjpbjrws\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=xxz3shf454p8dv76wptc5jtjpbjrws<\\/a>","attachment":""}', '2015-05-05 09:24:55', '3rcstnrcty3vncv4n4v8j3x6nszp6drk'),
	(512, 0, 'm_user', '{"status_id":"null->1","updated_by":"97->0"}', '2015-05-05 09:25:37', '6m58s65ppt2bkxcn2hkxt7tyhdcm5dbt'),
	(513, 134, 'm_user', '{"pwd":"03b2eb70583bb49a2f3a7c1c652518904861fd2c27aabef7f3f5724eb76cbae0ce16bd3ee078020b0f7a21356e5e676d3a5f2b7ad667a38c02ddf641ef1da16b->1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75","updated_by":"0->134"}', '2015-05-05 09:25:54', '7ms2c3nw3dzb6y7x3r4vrz83wtrds4j4'),
	(514, 97, 'm_user_role', 'del {"user_id":"103","role_id":"7"}', '2015-05-05 09:26:32', '3mx7yd5b28brdvr7scbrcb8fc2jtxmfn'),
	(515, 97, 'm_user_role', '{"user_id":"134","role_id":"7"}', '2015-05-05 09:26:38', 'pvpybrp2wphh3bvfk7p4hw3bv2xpd85d'),
	(516, 97, 'm_user_role', 'del {"user_id":"69","role_id":"9"}', '2015-05-05 09:36:50', 'k5yvkcvhwmm63mmhkt6h4txsnb54vph4'),
	(517, 97, 'm_user_role', '{"user_id":"125","role_id":"9"}', '2015-05-05 09:36:55', '87hxcn83f3hwc57pfcx4f5bnpncswwz4'),
	(518, 97, 'project_name', '{"principal_advisor":"125->134"}', '2015-05-05 09:37:34', '8k65whdhj8h2p8p8b25wbn3x6d4787xw'),
	(519, 97, 'm_user_role', '{"user_id":"134","role_id":"9"}', '2015-05-05 09:38:02', 'hbfs3774trncvyprx52bxbxjrrcppdmf'),
	(520, 97, 'contract_history', '{"project_name":"PAKLIM->Nama-Sutri","project_number":"001-PAK->001","salary":"w+Yzjmw1\\/gafmiNhe3i5nEh5e3mVEmNoNxYPg3Cr+zsdQNOdVXRk->OJ7XEyKaSzaWIiSQ8WWluPfe\\/8Ww7jECoN9tKbhDiQoH7CwxYhUPHDdlAIs="}', '2015-05-05 09:41:08', '3vvc2nryw3pxjp6k5pmjpjbyxcnryhxw'),
	(521, 0, 'm_user', '{"status_id":"null->1","updated_by":"null->0"}', '2015-05-05 09:42:57', 'sstx638ydh2ny5hcx8xkks4hynmhv5b4'),
	(522, 114, 'applicants', '{"user_id":"114","title":"Mr.","first_name":"Kevin","last_name":"Arief","place_of_birth":"Jakarta","date_of_birth":"1990-05-05","gender":"Male","marital_status":"Single","nationality_id":"5","nationality_val":null,"address":"jakarta","country_id":"1","country_name":null,"province_id":"31","city_id":"155","post_code":"11236","phone1":"123456","phone2":null,"computer_skills":null,"professional_skills":null}', '2015-05-05 09:43:54', 'tk8r66fy2s3dnrsnc2hvfyx42t56rcx5'),
	(523, 114, 'applicants_education', '{"user_id":"114","education_id":"2","major":"Accounting","place":"Trisakti","year_from":"2000","year_to":"2003","countries_id":"101"}', '2015-05-05 09:44:24', 'cnd5sjwv5jt5czy8dddxjptvmw2jkn53'),
	(524, 114, 'applicants_language', '{"user_id":"114","language_id":"3","language_skill_id":"5"}', '2015-05-05 09:44:37', 'jchrhx428t7vdyncrzdbd27zbwcxtn85'),
	(525, 114, 'applicants_language', '{"user_id":"114","language_id":"2","language_skill_id":"4"}', '2015-05-05 09:44:38', 'csrth2vxy2phcmwxf6rjn78rc8c5znxt'),
	(526, 114, 'applicants_language', '{"user_id":"114","language_id":"1","language_skill_id":"1"}', '2015-05-05 09:44:39', 'pz3r473brnbnwy4hzsnvvd8nhbnkcbyp'),
	(527, 114, 'applicants_reference', '{"job_title":"Manager","title":"Mr.","reference_name":"John","company_name":"PT John","description":null,"email":"john","phone":null,"user_id":"114"}', '2015-05-05 09:44:59', '8dtm8bwfkry7b2mntxpyh32v35hkjd7t'),
	(528, 114, 'applicants', '{"cv":"null->.docx"}', '2015-05-05 09:45:14', 'd8dd63t5zn2pbhyvcmj5xp2sv7yc3x3j'),
	(529, 114, 'applicants', '{"letter":"null->.pdf"}', '2015-05-05 09:45:14', 'nwwvzcmmfknc8hnjprv622dphf7fjvbc'),
	(530, 114, 'applicants_working', '{"month_from":"1","year_from":"2005","month_to":"1","year_to":"2007","employer":"EMployer","countries_id":"3","job_title":"Staff","business_id":"1","email":"my.employer","phone":null,"leave_reason":null,"may_contact":"1","user_id":"114"}', '2015-05-05 09:45:52', '3mw6fhf5pvkf4n5j7kwzhsvmzff28bvv'),
	(531, 114, 'job_applied', '{"vacancy_id":"3","user_id":"114","date_applied":"2015-05-05 09:46:12","salary_expectation":"5000000","negotiable":"1"}', '2015-05-05 09:46:12', 'hsbxfjc5tkrt233ydbmmrcfnywc3hmt7'),
	(532, 114, 'applicants_answer', '{"job_applied_id":"7","question_id":"5","choice_id":"172"}', '2015-05-05 09:46:12', 'hsbxfjc5tkrt233ydbmmrcfnywc3hmt7'),
	(533, 114, 'applicants_answer', '{"job_applied_id":"7","question_id":"1","choice_id":"167"}', '2015-05-05 09:46:12', 'hsbxfjc5tkrt233ydbmmrcfnywc3hmt7'),
	(534, 97, 'job_applied', '{"next_vacancy_progress_id":"null->1","updated_by":"114->97"}', '2015-05-05 09:48:49', '68vbtscz5jss3rwd3388zkxztzw8mhmy'),
	(535, 97, 'm_user_role', 'del {"user_id":"125"}', '2015-05-05 09:49:57', 'xy4jrk5hbjz8zxyjkw8w88mvcvf2svbc'),
	(536, 97, 'm_user_role', '{"user_id":"125","role_id":"3"}', '2015-05-05 09:49:57', 'xy4jrk5hbjz8zxyjkw8w88mvcvf2svbc'),
	(537, 97, 'm_user_role', '{"user_id":"125","role_id":"9"}', '2015-05-05 09:49:57', 'xy4jrk5hbjz8zxyjkw8w88mvcvf2svbc'),
	(538, 97, 'm_user_role', '{"user_id":"125","role_id":"6"}', '2015-05-05 09:49:57', 'xy4jrk5hbjz8zxyjkw8w88mvcvf2svbc'),
	(539, 97, 'm_role_module', 'del {"role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(540, 97, 'm_role_module', '{"module_id":"1","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(541, 97, 'm_role_module', '{"module_id":"13","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(542, 97, 'm_role_module', '{"module_id":"30","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(543, 97, 'm_role_module', '{"module_id":"42","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(544, 97, 'm_role_module', '{"module_id":"46","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(545, 97, 'm_role_module', '{"module_id":"48","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(546, 97, 'm_role_module', '{"module_id":"8","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(547, 97, 'm_role_module', '{"module_id":"41","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(548, 97, 'm_role_module', '{"module_id":"52","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(549, 97, 'm_role_module', '{"module_id":"35","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(550, 97, 'm_role_module', '{"module_id":"24","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(551, 97, 'm_role_module', '{"module_id":"34","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(552, 97, 'm_role_module', '{"module_id":"12","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(553, 97, 'm_role_module', '{"module_id":"4","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(554, 97, 'm_role_module', '{"module_id":"3","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(555, 97, 'm_role_module', '{"module_id":"27","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(556, 97, 'm_role_module', '{"module_id":"43","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(557, 97, 'm_role_module', '{"module_id":"5","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(558, 97, 'm_role_module', '{"module_id":"38","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(559, 97, 'm_role_module', '{"module_id":"47","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(560, 97, 'm_role_module', '{"module_id":"10","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(561, 97, 'm_role_module', '{"module_id":"32","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(562, 97, 'm_role_module', '{"module_id":"19","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(563, 97, 'm_role_module', '{"module_id":"11","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(564, 97, 'm_role_module', '{"module_id":"40","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(565, 97, 'm_role_module', '{"module_id":"16","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(566, 97, 'm_role_module', '{"module_id":"20","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(567, 97, 'm_role_module', '{"module_id":"17","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(568, 97, 'm_role_module', '{"module_id":"49","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(569, 97, 'm_role_module', '{"module_id":"50","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(570, 97, 'm_role_module', '{"module_id":"23","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(571, 97, 'm_role_module', '{"module_id":"15","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(572, 97, 'm_role_module', '{"module_id":"18","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(573, 97, 'm_role_module', '{"module_id":"29","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(574, 97, 'm_role_module', '{"module_id":"31","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(575, 97, 'm_role_module', '{"module_id":"37","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(576, 97, 'm_role_module', '{"module_id":"53","role_id":"2"}', '2015-05-05 09:50:24', 'c7ckv8mcsvvb3w43fszhnwj287vw38ty'),
	(577, 97, 'm_user_role', 'del {"user_id":"97"}', '2015-05-05 09:50:39', '3k2k2wp5c2ftt2xwd76wf7hxthjjvpbp'),
	(578, 97, 'm_user_role', '{"user_id":"97","role_id":"2"}', '2015-05-05 09:50:39', '3k2k2wp5c2ftt2xwd76wf7hxthjjvpbp'),
	(579, 97, 'vacancy_timeline', 'del {"vacancy_id":"3","vacancy_progress_id":"1"}', '2015-05-05 10:53:19', 'k6bkdsbzt6nnkmst4k7nnmz7ncx8jw2n'),
	(580, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"1"}', '2015-05-05 10:53:19', 'k6bkdsbzt6nnkmst4k7nnmz7ncx8jw2n'),
	(581, 97, 'user_ranking', '{"vacancy_employee_id":"3","user_id":"114","ranking_id":"1","user_comment":"a"}', '2015-05-05 10:54:01', 'b6wt7xhr7k383zxx6244c44nwhkpj8ks'),
	(582, 97, 'job_applied', '{"next_vacancy_progress_id":"null->3"}', '2015-05-05 10:54:01', 'b6wt7xhr7k383zxx6244c44nwhkpj8ks'),
	(583, 97, 'vacancy_interview', '{"vacancy_id":"3","user_id":"114","vacancy_progress_id":"3","interview_place":"Wisma Bakrie2","interview_date":"2015-05-05","interview_time":"17.00"}', '2015-05-05 10:54:01', 'b6wt7xhr7k383zxx6244c44nwhkpj8ks'),
	(584, 125, 'user_ranking', '{"ranking_id":"2","user_comment":"ok","user_id":"114","vacancy_employee_id":"4"}', '2015-05-05 10:54:36', '35vr8x6yzj7hwkchw6mnnsd2fw7vk3vk'),
	(585, 97, 'vacancy_timeline', 'del {"vacancy_id":"3","vacancy_progress_id":"3"}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(586, 97, 'vacancy_timeline', '{"vacancy_id":"3","vacancy_progress_id":"3"}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(587, 97, 'email', '{"email_from":"","email_to":"angga.aditya","email_cc":"iskandar.tio@gmail.com;iskandar.tio@gmail.com","email_bcc":"","email_subject":"First Interview","email_content":"<div>Dear Mr. Angga Aditya,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 11:30 am.<\\/div><div>&nbsp;<\\/div><div><p>Kementrian Lingkungan Hidup<\\/p><p>Gedung Otorita Batam<br>Jln. jdisoa jfiods no.23<br>gfdjior<\\/p><br><\\/div><div>&nbsp;<\\/div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.<\\/div><div>&nbsp;<\\/div><div>Please confirm your availability for the interview.<\\/div><div>&nbsp;<\\/div><div>We look forward to meeting you.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div>&nbsp;<br><\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(588, 97, 'email', '{"email_from":"","email_to":"kevin.arief","email_cc":"iskandar.tio@gmail.com;iskandar.tio@gmail.com","email_bcc":"","email_subject":"First Interview","email_content":"<div>Dear Mr. Kevin Arief,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 05:00 pm.<\\/div><div>&nbsp;<\\/div><div><p>Location:<\\/p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href=\\"ffds\\" data-mce-href=\\"ffds\\">ffds<\\/a>gfdgtr<\\/p><br><\\/div><div>&nbsp;<\\/div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.<\\/div><div>&nbsp;<\\/div><div>Please confirm your availability for the interview.<\\/div><div>&nbsp;<\\/div><div>We look forward to meeting you.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div>&nbsp;<br><\\/div>","attachment":"pages\\/vacancy\\/Acc_3.pdf"}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(589, 97, 'email', '{"email_from":"","email_to":"amir","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Mr. Angga Aditya<\\/td><td>KLH<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>11:30 am<\\/td><\\/tr><tr><td>Mr. Kevin Arief<\\/td><td>Wisma Bakrie2<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>05:00 pm<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(590, 97, 'email', '{"email_from":"","email_to":"susan.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Mr. Angga Aditya<\\/td><td>KLH<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>11:30 am<\\/td><\\/tr><tr><td>Mr. Kevin Arief<\\/td><td>Wisma Bakrie2<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>05:00 pm<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(591, 97, 'email', '{"email_from":"","email_to":"murni","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Asking for reference","email_content":"<p>Dear Ms. Murni,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding Angga Aditya, who considered to become Accounting.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for Angga Aditya, as he has putting your name as his referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding Angga Aditya&#39;s qualifications and skills in jfojfds fsd, as well as your connection with him.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","attachment":""}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(592, 97, 'email', '{"email_from":"","email_to":"john","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Asking for reference","email_content":"<p>Dear Mr. John,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding Kevin Arief, who considered to become Accounting.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for Kevin Arief, as he has putting your name as his referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding Kevin Arief&#39;s qualifications and skills in jfojfds fsd, as well as your connection with him.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","attachment":""}', '2015-05-05 10:55:27', 'z3tp3vs635t544ysdkc7jwpr3rw3yrwt'),
	(593, 0, 'm_user_role', '{"user_id":"135","role_id":"1"}', '2015-05-05 10:57:47', '2j2t65m8m7cb3w7m8jm5275hkhf2b2n7'),
	(594, 0, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"kevin.halim","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: a Please activate by clicking this link: <br><a href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=v6vbj67w5sdppy46kcv2zsd4cdz3fh\\" data-mce-href=\\"https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=v6vbj67w5sdppy46kcv2zsd4cdz3fh\\">https:\\/\\/192.168.8.104\\/gizhrms\\/activate?link=v6vbj67w5sdppy46kcv2zsd4cdz3fh<\\/a>","attachment":""}', '2015-05-05 10:57:47', '2j2t65m8m7cb3w7m8jm5275hkhf2b2n7'),
	(595, 0, 'm_user', '{"status_id":"null->1","updated_by":"null->0"}', '2015-05-05 10:58:02', 'dvt7dtjxm7mbtn34wn3h3zym4phn67k7'),
	(596, 135, 'applicants', '{"user_id":"135","title":"Mr.","first_name":"Kevin","last_name":"Halim","place_of_birth":"Jakarta","date_of_birth":"1991-05-05","gender":"Male","marital_status":"Married","nationality_id":"1","nationality_val":null,"address":"indonesia","country_id":"1","country_name":null,"province_id":"31","city_id":"153","post_code":"12345","phone1":"6394332","phone2":null,"computer_skills":null,"professional_skills":null}', '2015-05-05 10:59:33', 's2spc3jhhcyzb3vmx4p6pjj6vybs5xsx'),
	(597, 135, 'applicants_education', '{"user_id":"135","education_id":"1","major":"IPA","place":"Ricci","year_from":"1996","year_to":"1999","countries_id":"101"}', '2015-05-05 11:00:03', 'm7d8sx6fznf7bzc26frstjjv37wzycmc'),
	(598, 135, 'applicants_language', '{"user_id":"135","language_id":"1","language_skill_id":"1"}', '2015-05-05 11:00:10', 'ksn85t7ykfx6xfrdz6v7p28tscxpf4ft'),
	(599, 135, 'applicants_language', '{"user_id":"135","language_id":"2","language_skill_id":"3"}', '2015-05-05 11:00:15', '6jzffmmrtb2hbfjsmcz58wndyftbrk7h'),
	(600, 135, 'applicants_reference', '{"job_title":"Manager","title":"Mr.","reference_name":"Jackson","company_name":"jackson","description":"a","email":"jackson","phone":null,"user_id":"135"}', '2015-05-05 11:00:42', 'tzwd2sxcs4myj6sfw575pvrjrb628db4'),
	(601, 135, 'applicants_working', '{"month_from":"1","year_from":"1999","month_to":"1","year_to":"2000","employer":"Test","countries_id":"3","job_title":"test","business_id":"2","email":null,"phone":null,"leave_reason":null,"may_contact":"0","user_id":"135"}', '2015-05-05 11:01:02', 'zrk2xmsx5xvb4f5zf65vcbxby2h78t67'),
	(602, 135, 'applicants_language', '{"user_id":"135","language_id":"3","language_skill_id":"2"}', '2015-05-05 11:01:13', 'ppv7thxssmmbyn73hhcxrshvhmksw4xb'),
	(603, 97, 'vacancy', '{"vacancy_enddate":"2015-04-30 00:00:00->2015-05-31 00:00:00","updated_by":"null->97"}', '2015-05-05 11:05:23', '5s4ymdsj634s5bt57zrc2fcbp6zpb2kp'),
	(604, 97, 'vacancy_question', '{"question_id":"15","vacancy_id":"1"}', '2015-05-05 11:05:23', '5s4ymdsj634s5bt57zrc2fcbp6zpb2kp'),
	(605, 97, 'vacancy_question', '{"question_id":"2","vacancy_id":"1"}', '2015-05-05 11:05:23', '5s4ymdsj634s5bt57zrc2fcbp6zpb2kp'),
	(606, 97, 'vacancy_question', '{"question_id":"1","vacancy_id":"1"}', '2015-05-05 11:05:23', '5s4ymdsj634s5bt57zrc2fcbp6zpb2kp'),
	(607, 97, 'vacancy', '{"vacancy_description":"fdhfiu shfuids hfiuds->IT Developer needed","vacancy_criteria":"hfdskj, fjiosd->skills"}', '2015-05-05 11:08:20', 'jpvs82s88m75yfczw8xfp6ckmrh8pb7c'),
	(608, 97, 'employee_outpatient', '{"invoice_val":"200000->210000","claim":"200000->210000","paid":"180000->189000"}', '2015-05-05 12:45:53', '5mw6knd7mxh7kbvdf4f7nvvh8jztk8b7'),
	(609, 125, 'm_user_role', 'del {"user_id":"125"}', '2015-05-05 12:47:19', 'kz2ssb3cvkszxp4n22skn2nd6jc8fvkb'),
	(610, 125, 'm_user_role', '{"user_id":"125","role_id":"3"}', '2015-05-05 12:47:19', 'kz2ssb3cvkszxp4n22skn2nd6jc8fvkb'),
	(611, 125, 'm_user_role', '{"user_id":"125","role_id":"9"}', '2015-05-05 12:47:19', 'kz2ssb3cvkszxp4n22skn2nd6jc8fvkb'),
	(612, 125, 'm_user_role', '{"user_id":"125","role_id":"6"}', '2015-05-05 12:47:19', 'kz2ssb3cvkszxp4n22skn2nd6jc8fvkb'),
	(613, 125, 'm_user_role', '{"user_id":"125","role_id":"8"}', '2015-05-05 12:47:19', 'kz2ssb3cvkszxp4n22skn2nd6jc8fvkb'),
	(614, 125, 'm_role_module', 'del {"role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(615, 125, 'm_role_module', '{"module_id":"1","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(616, 125, 'm_role_module', '{"module_id":"13","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(617, 125, 'm_role_module', '{"module_id":"30","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(618, 125, 'm_role_module', '{"module_id":"42","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(619, 125, 'm_role_module', '{"module_id":"46","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(620, 125, 'm_role_module', '{"module_id":"48","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(621, 125, 'm_role_module', '{"module_id":"8","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(622, 125, 'm_role_module', '{"module_id":"41","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(623, 125, 'm_role_module', '{"module_id":"52","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(624, 125, 'm_role_module', '{"module_id":"35","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(625, 125, 'm_role_module', '{"module_id":"24","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(626, 125, 'm_role_module', '{"module_id":"34","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(627, 125, 'm_role_module', '{"module_id":"12","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(628, 125, 'm_role_module', '{"module_id":"4","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(629, 125, 'm_role_module', '{"module_id":"3","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(630, 125, 'm_role_module', '{"module_id":"27","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(631, 125, 'm_role_module', '{"module_id":"43","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(632, 125, 'm_role_module', '{"module_id":"5","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(633, 125, 'm_role_module', '{"module_id":"38","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(634, 125, 'm_role_module', '{"module_id":"47","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(635, 125, 'm_role_module', '{"module_id":"10","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(636, 125, 'm_role_module', '{"module_id":"32","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(637, 125, 'm_role_module', '{"module_id":"19","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(638, 125, 'm_role_module', '{"module_id":"11","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(639, 125, 'm_role_module', '{"module_id":"40","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(640, 125, 'm_role_module', '{"module_id":"16","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(641, 125, 'm_role_module', '{"module_id":"17","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(642, 125, 'm_role_module', '{"module_id":"49","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(643, 125, 'm_role_module', '{"module_id":"50","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(644, 125, 'm_role_module', '{"module_id":"23","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(645, 125, 'm_role_module', '{"module_id":"15","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(646, 125, 'm_role_module', '{"module_id":"18","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(647, 125, 'm_role_module', '{"module_id":"29","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(648, 125, 'm_role_module', '{"module_id":"31","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(649, 125, 'm_role_module', '{"module_id":"37","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(650, 125, 'm_role_module', '{"module_id":"53","role_id":"2"}', '2015-05-05 12:47:57', 'vbvzz5k4zyzr3j5zmwhwy278t4t28jmx'),
	(651, 97, 'vacancy', '{"vacancy_description":"New Accounting Staff needed <em><strong>djsai dfdsfds<\\/strong><\\/em>fsd->New Accounting Staff needed"}', '2015-05-05 12:58:21', 'd42nhj4kzskckcxpbd84jdbx7z582ydv'),
	(652, 0, 'm_user_role', '{"user_id":"136","role_id":"1"}', '2015-05-05 13:23:25', 'px6vc4sw75b5wtnxzjjm3c72zsbfbwh6'),
	(653, 0, 'email', '{"email_from":"iskandar.tio@gmail.com","email_to":"fitri","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Account Activation","email_content":"Your password is: a Please activate by clicking this link: <br><a href=\\"https:\\/\\/localhost\\/gizhrms\\/activate?link=hwrxf2fpy52d8n225k4crdcp7tf4d8\\" data-mce-href=\\"https:\\/\\/localhost\\/gizhrms\\/activate?link=hwrxf2fpy52d8n225k4crdcp7tf4d8\\">https:\\/\\/localhost\\/gizhrms\\/activate?link=hwrxf2fpy52d8n225k4crdcp7tf4d8<\\/a>","attachment":""}', '2015-05-05 13:23:25', 'px6vc4sw75b5wtnxzjjm3c72zsbfbwh6'),
	(654, 0, 'm_user', '{"status_id":"null->1","updated_by":"null->0"}', '2015-05-05 13:23:52', 'rzr33fnwcxbbjvdpfxfk5cswfhyf4kcs'),
	(655, 136, 'applicants', '{"user_id":"136","title":"Ms.","first_name":"Fitri","last_name":"f","place_of_birth":"Jakarta","date_of_birth":"1980-05-05","gender":"Female","marital_status":"Married","nationality_id":"1","nationality_val":null,"address":"jakarta","country_id":"1","country_name":null,"province_id":"31","city_id":"155","post_code":"12345","phone1":"1235","phone2":"s","computer_skills":"a","professional_skills":null}', '2015-05-05 13:25:39', 'yvm8xf5bb858fx324ms5ynmhx2c45bt8'),
	(656, 136, 'applicants_education', '{"user_id":"136","education_id":"1","major":"a","place":"a","year_from":"1999","year_to":"2002","countries_id":"101"}', '2015-05-05 13:26:45', 'sbzk5xmjbrndcfs28nrndpv8k3fhmx7k'),
	(657, 136, 'applicants_language', '{"user_id":"136","language_id":"1","language_skill_id":"1"}', '2015-05-05 13:26:57', 'nmk85rdssc425ny6hn5knc64f4mb2djf'),
	(658, 136, 'applicants_language', '{"user_id":"136","language_id":"2","language_skill_id":"5"}', '2015-05-05 13:27:04', '6xy73x2ytvtntbd64fn4wdvw78xhv3ht'),
	(659, 136, 'applicants_language', '{"user_id":"136","language_id":"3","language_skill_id":"4"}', '2015-05-05 13:27:09', 'shr4bbb65wt456tpb5sv8xnsd34w7cn3'),
	(660, 136, 'applicants_reference', '{"job_title":"Manager","title":"Mr.","reference_name":"Indra","company_name":"indra","description":"a","email":"indra","phone":null,"user_id":"136"}', '2015-05-05 13:28:30', '26jxthtx8x7pzpj672f7j2tkykhyrh3h'),
	(661, 136, 'applicants_working', '{"month_from":"1","year_from":"2000","month_to":"1","year_to":"2003","employer":"Employer","countries_id":"15","job_title":"employer","business_id":"4","email":null,"phone":null,"leave_reason":null,"may_contact":"0","user_id":"136"}', '2015-05-05 13:29:04', 'mp74wtjv8md3vmksxbwjw8pc7dkr6vt4'),
	(662, 136, 'applicants', '{"cv":"null->.docx"}', '2015-05-05 13:29:22', '6b5t2mk7fkcjpj4jhc3hsnvzrdvz2rwy'),
	(663, 136, 'applicants', '{"letter":"null->.pdf"}', '2015-05-05 13:29:22', 'k4yhjrjvjj3b3krzx483pmt7tc2cw4fh'),
	(664, 136, 'job_applied', '{"vacancy_id":"1","user_id":"136","date_applied":"2015-05-05 13:33:41","salary_expectation":"2000000","negotiable":"1"}', '2015-05-05 13:33:41', '3d4srysjxvfhzbm3256tzksrkw85kv5v'),
	(665, 136, 'applicants_answer', '{"job_applied_id":"8","question_id":"15","choice_id":"175"}', '2015-05-05 13:33:41', '3d4srysjxvfhzbm3256tzksrkw85kv5v'),
	(666, 136, 'applicants_answer', '{"job_applied_id":"8","question_id":"2","choice_id":"168"}', '2015-05-05 13:33:41', '3d4srysjxvfhzbm3256tzksrkw85kv5v'),
	(667, 136, 'applicants_answer', '{"job_applied_id":"8","question_id":"1","choice_id":"167"}', '2015-05-05 13:33:41', '3d4srysjxvfhzbm3256tzksrkw85kv5v'),
	(668, 97, 'job_applied', '{"next_vacancy_progress_id":"null->1","updated_by":"136->97"}', '2015-05-05 13:35:29', 'kwm6dwdswhj26ym5k7s73vn7nw6p773f'),
	(669, 97, 'vacancy_timeline', '{"vacancy_id":"1","vacancy_progress_id":"1"}', '2015-05-05 13:36:16', '7bnv8sfcvvp63ms5fd358wd27shk4m2j'),
	(670, 97, 'vacancy_employee', '{"vacancy_id":"1","employee_id":"134","vacancy_progress_id":"3"}', '2015-05-05 13:36:41', 'nnyyrn5jnvh35rsp7c6zdmh4c2jnn564'),
	(671, 97, 'vacancy_employee', '{"vacancy_id":"1","employee_id":"97","vacancy_progress_id":"3"}', '2015-05-05 13:37:04', 'hfz5ynp4kbbdxzzs6vc3zkm5b8mt7cxy'),
	(672, 97, 'user_ranking', '{"vacancy_employee_id":"8","user_id":"136","ranking_id":"1","user_comment":"good"}', '2015-05-05 13:37:04', 'hfz5ynp4kbbdxzzs6vc3zkm5b8mt7cxy'),
	(673, 97, 'job_applied', '{"next_vacancy_progress_id":"null->3"}', '2015-05-05 13:37:04', 'hfz5ynp4kbbdxzzs6vc3zkm5b8mt7cxy'),
	(674, 97, 'vacancy_interview', '{"vacancy_id":"1","user_id":"136","vacancy_progress_id":"3","interview_place":"","interview_date":null,"interview_time":""}', '2015-05-05 13:37:04', 'hfz5ynp4kbbdxzzs6vc3zkm5b8mt7cxy'),
	(675, 134, 'user_ranking', '{"ranking_id":"1","user_comment":"ok","user_id":"136","vacancy_employee_id":"7"}', '2015-05-05 13:38:17', '23h6hfnby238syzdjscstrvhbt6h2cv3'),
	(676, 97, 'vacancy_interview', '{"interview_date":"null->2015-05-05 00:00:00","interview_time":"null->11.00","interview_place":"null->Wisma Bakrie2"}', '2015-05-05 13:38:55', 'nwjk4b7hs8xp3bydrhsx4pfd6wxrskfx'),
	(677, 97, 'vacancy_timeline', '{"vacancy_id":"1","vacancy_progress_id":"3"}', '2015-05-05 13:39:41', 'fww7ry3n4wjnx83w7rzdktjyfbx6wk8w'),
	(678, 97, 'email', '{"email_from":"","email_to":"fitri","email_cc":"iskandar.tio@gmail.com;iskandar.tio@gmail.com","email_bcc":"","email_subject":"First Interview","email_content":"<div>Dear Ms. Fitri f,<br><br>We would like to invite you to attend an interview for IT Developer (IT-IT)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 11:00 am.<\\/div><div>&nbsp;<\\/div><div><p>Location:<\\/p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href=\\"ffds\\" data-mce-href=\\"ffds\\">ffds<\\/a>gfdgtr<\\/p><br><\\/div><div>&nbsp;<\\/div><div>You will have the interview with  me and Ms. Bella Nurul , the Senior Advisor.<\\/div><div>&nbsp;<\\/div><div>Please confirm your availability for the interview.<\\/div><div>&nbsp;<\\/div><div>We look forward to meeting you.<\\/div><div>&nbsp;<\\/div><div>Best Regards,<\\/div><div><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/div><div>&nbsp;<br><\\/div>","attachment":"pages\\/vacancy\\/IT_1.pdf"}', '2015-05-05 13:39:41', 'fww7ry3n4wjnx83w7rzdktjyfbx6wk8w'),
	(679, 97, 'email', '{"email_from":"","email_to":"amir","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Ms. Fitri f<\\/td><td>Wisma Bakrie2<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>11:00 am<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 13:39:41', 'fww7ry3n4wjnx83w7rzdktjyfbx6wk8w'),
	(680, 97, 'email', '{"email_from":"","email_to":"bella.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Interview for @vacancy_name","email_content":"<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;<\\/p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Location<\\/th><th>Date<\\/th><th>Time<\\/th><\\/tr><tr><td>Ms. Fitri f<\\/td><td>Wisma Bakrie2<\\/td>\\r\\n\\t\\t\\t\\t<td>Tuesday, May 05, 2015<\\/td><td>11:00 am<\\/td><\\/tr><\\/table><\\/p><p>Regards,<br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p>","attachment":""}', '2015-05-05 13:39:41', 'fww7ry3n4wjnx83w7rzdktjyfbx6wk8w'),
	(681, 97, 'email', '{"email_from":"","email_to":"indra","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Asking for reference","email_content":"<p>Dear Mr. Indra,&nbsp;<\\/p><p>I hope this email finds you well.<\\/p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.<\\/p><p>I am writing you regarding Fitri f, who considered to become IT Developer.&nbsp;<\\/p><p>As part of our recruitment process, we should conduct reference check for Fitri f, as she has putting your name as her referee.<\\/p><p>It would be great if &nbsp;you could share your comments and impressions regarding Fitri f&#39;s qualifications and skills in skills, as well as your connection with her.<\\/p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.<\\/p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.<\\/p><p><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong><\\/p><p>&nbsp;<\\/p><p>&nbsp;<\\/p>","attachment":""}', '2015-05-05 13:39:41', 'fww7ry3n4wjnx83w7rzdktjyfbx6wk8w'),
	(682, 97, 'applicants', '{"contract1_start_date":"null->2015-05-06 00:00:00","contract1_end_date":"null->2015-07-31 00:00:00","job_title":"null->Senior Manager","job_position":"null->Head of Accounting","project_name":"null->PAKLIM","principal_advisor":"null->125","financial_controller":"null->125","project_number":"null->001-PAK","team_leader":"null->125","project_location":"null->Jakarta GIZ","office_manager":"null->125","responsible_superior":"null->134","working_time":"null->100","salary":"null->MMK7haJwwxgYQDJXyLmZ\\/9xQzjPB2qyOlCoPe1Zn\\/N\\/FyjRKRHLT","salary_band":"null->3T","updated_by":"136->97"}', '2015-05-05 13:42:02', '8cynzwdtjhm3xdvn4mcbpfrpbd38k742'),
	(683, 97, 'job_applied', '{"vacancy_shortlist":"0->1","next_vacancy_progress_id":"null->6"}', '2015-05-05 13:42:02', '8cynzwdtjhm3xdvn4mcbpfrpbd38k742'),
	(684, 97, 'm_user', '{"user_name":""}', '2015-05-05 13:42:21', 'n3yfp3f7rd6j6c52fmmwhxm5nnzsz282'),
	(685, 97, 'employee', '{"user_id":"137","email":"fitri","title":"Ms.","contract1_start_date":"2015-05-06 00:00:00","contract1_end_date":"2015-07-31 00:00:00","first_name":"Fitri","last_name":"f","place_of_birth":"Jakarta","date_of_birth":"1980-05-05 00:00:00","gender":"Female","marital_status":"Married","nationality_id":"1","nationality_val":null,"address":"jakarta","country_id":"1","country_name":null,"province_id":"31","city_id":"155","post_code":"12345","phone1":"1235","phone2":"s","computer_skills":"a","professional_skills":null}', '2015-05-05 13:42:21', 'n3yfp3f7rd6j6c52fmmwhxm5nnzsz282'),
	(686, 97, 'contract_history', '{"start_date":"2015-05-06 00:00:00","end_date":"2015-07-31 00:00:00","user_id":"137","job_title":"Senior Manager","job_position":"Head of Accounting","project_name":"PAKLIM","project_number":"001-PAK","project_location":"Jakarta GIZ","responsible_superior":"134","SAP_No":null,"salary":"MMK7haJwwxgYQDJXyLmZ\\/9xQzjPB2qyOlCoPe1Zn\\/N\\/FyjRKRHLT","salary_band":"3T","working_time":"100","vacancy_type":"Intern","allowance":"300000","reason":"Initial Salary"}', '2015-05-05 13:42:21', 'n3yfp3f7rd6j6c52fmmwhxm5nnzsz282'),
	(687, 97, 'vacancy', '{"vacancy_progress_id":"3->6"}', '2015-05-05 13:42:21', 'n3yfp3f7rd6j6c52fmmwhxm5nnzsz282'),
	(688, 97, 'vacancy_timeline', '{"vacancy_id":"1","vacancy_progress_id":"6"}', '2015-05-05 13:42:21', 'n3yfp3f7rd6j6c52fmmwhxm5nnzsz282'),
	(689, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring Reminder","email_content":"Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Fitri f<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><\\/table>","attachment":""}', '2015-05-05 13:42:43', 'mnkmwf76nyddfxtydvw4ytdp6p7mtcyp'),
	(690, 97, 'email', '{"email_from":"","email_to":"susan.giz","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Expiring for your team","email_content":"Dear Ms. Susan Aulia,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name<\\/th><th>Job Title<\\/th><th>End Date<\\/th><\\/tr><tr><td>Ms. Fitri f<\\/td><td>Senior Manager<\\/td><td>31-07-2015<\\/td><\\/tr><\\/table><br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-05 13:42:43', 'ppcnm66sxy76mychrxyfm57zh5tpc6bk'),
	(691, 97, 'email', '{"email_from":"","email_to":"","email_cc":"iskandar.tio@gmail.com","email_bcc":"","email_subject":"Contract Reminder","email_content":"Dear Ms. Fitri f,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br><\\/strong><strong>HR Professional<br><\\/strong><strong>PAKLIM - <\\/strong><strong>Policy Advice for Environment and Climate Change<br><\\/strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim<\\/strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;<\\/strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br><\\/strong><strong>c\\/o Kementerian Negara Lingkungan Hidup (KLH)<br><\\/strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24<\\/strong><strong>13410 Jakarta, Indonesia<br><\\/strong><strong>T <a href=\\"tel:%2B62%2021%20851%207186\\" data-mce-href=\\"tel:%2B62%2021%20851%207186\\">+62 21 851 7186<br><\\/a><\\/strong><strong>F <a href=\\"tel:%2B62%2021%20851%206110\\" data-mce-href=\\"tel:%2B62%2021%20851%206110\\">+62 21 851 6110<br><\\/a><\\/strong><strong>M +62 8129 5346 045<br><\\/strong><strong>E&nbsp;<a href=\\"mailto:fitri.kusumayanti@giz.de\\" data-mce-href=\\"mailto:fitri.kusumayanti@giz.de\\">fitri.kusumayanti@giz.de<\\/a><\\/strong>","attachment":""}', '2015-05-05 13:42:43', 'bpnvmbjr36284n2pjzzcx5rvtfpn5z2w'),
	(692, 97, 'employee_outpatient', '{"user_id":"97","invoice_date":"2015-05-05","invoice_val":"50000","remarks":"","claim":"50000","paid":45000,"input_date":"2015-05-05"}', '2015-05-05 13:53:42', 'kxrfp6mby7m65kvmsr7tcw78nshj2rkf'),
	(693, 125, 'employee_outpatient', '{"paid_status":"null->1","updated_by":"97->125"}', '2015-05-05 13:54:30', '7sbt5kh3nn5ysptd85bvjjpxxb2kbb2p'),
	(694, 125, 'employee_outpatient', '{"paid_status":"null->1","updated_by":"97->125"}', '2015-05-05 13:54:31', 'yzkzsrzmk8ds7rfj6cs6r52xb3skwnfd'),
	(695, 125, 'employee_outpatient', '{"paid_status":"null->1","updated_by":"97->125"}', '2015-05-05 13:54:32', '2r777vb6vzkxc5y57773yh5vc2wpnx22'),
	(696, 97, 'employee_eyeglasses', '{"claim_type":"Frame","user_id":"97","invoice_date":"2015-05-05","invoice_val":"800000","remarks":"","claim":"800000","paid":750000}', '2015-05-05 14:06:04', 'pfmwkjkz5bw7f5snbjzrhfxnmc5rz2xr'),
	(697, 125, 'employee_eyeglasses', '{"paid_status":"null->1","updated_by":"97->125"}', '2015-05-05 14:06:17', 'jnr6zk8f452mpwz5yzry5ks38cn7ypt5'),
	(698, 97, 'settings', '{"setting_val":"300->30","updated_by":"null->97"}', '2015-05-05 18:40:27', 'vcjv44mbdfnf2pddcd7vxj4w6vys4kk2'),
	(699, 97, 'employee_dependent', '{"relation":"Spouse->Son","updated_by":"null->97"}', '2015-05-07 14:10:28', 'pkdkpfv3whdndyp7bbs4rk3j8nz56cv7');
/*!40000 ALTER TABLE `change_log` ENABLE KEYS */;


-- Dumping structure for table hrms.choice
DROP TABLE IF EXISTS `choice`;
CREATE TABLE IF NOT EXISTS `choice` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `choice_val` varchar(1000) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.city: ~329 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contract_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.contract_history: ~31 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attachment` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.email: ~1 rows (approximately)
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` (`email_from`, `email_to`, `email_cc`, `email_bcc`, `email_subject`, `email_content`, `updatetime`, `email_id`, `sent`, `attachment`, `updated_by`, `created_at`, `updated_at`) VALUES
	('iskandar.tio@gmail.com', 'susan.aulia', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: a Please activate by clicking this link: <br><a href="https://192.168.8.104/gizhrms/activate?link=fbxm3drzwjmn6w874yfrt8cp68p2h3" data-mce-href="https://192.168.8.104/gizhrms/activate?link=fbxm3drzwjmn6w874yfrt8cp68p2h3">https://192.168.8.104/gizhrms/activate?link=fbxm3drzwjmn6w874yfrt8cp68p2h3</a>', '2015-05-04 13:22:24', 30, '2015-05-04 13:22:24', '', NULL, '2015-05-04 13:20:58', '2015-05-04 13:22:24'),
	('iskandar.tio@gmail.com', 'kevin.arief', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: a Please activate by clicking this link: <br><a href="https://192.168.8.104/gizhrms/activate?link=3546j863s8tyr7bdsspdpbmts4hph6" data-mce-href="https://192.168.8.104/gizhrms/activate?link=3546j863s8tyr7bdsspdpbmts4hph6">https://192.168.8.104/gizhrms/activate?link=3546j863s8tyr7bdsspdpbmts4hph6</a>', '2015-05-04 16:19:51', 31, '2015-05-04 16:19:51', '', 0, '2015-05-04 16:19:25', '2015-05-04 16:19:51'),
	('iskandar.tio@gmail.com', 'bella.nurul', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: a Please activate by clicking this link: <br><a href="https://192.168.8.104/gizhrms/activate?link=bt77kbb7tbscmmj2f4dvzr33688fwc" data-mce-href="https://192.168.8.104/gizhrms/activate?link=bt77kbb7tbscmmj2f4dvzr33688fwc">https://192.168.8.104/gizhrms/activate?link=bt77kbb7tbscmmj2f4dvzr33688fwc</a>', '2015-05-04 16:21:56', 32, '2015-05-04 16:21:56', '', 0, '2015-05-04 16:21:12', '2015-05-04 16:21:56'),
	('iskandar.tio@gmail.com', 'angga.aditya', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: a Please activate by clicking this link: <br><a href="https://192.168.8.104/gizhrms/activate?link=rxcph4sndj8vwfbdjzc4738xxnr5df" data-mce-href="https://192.168.8.104/gizhrms/activate?link=rxcph4sndj8vwfbdjzc4738xxnr5df">https://192.168.8.104/gizhrms/activate?link=rxcph4sndj8vwfbdjzc4738xxnr5df</a>', '2015-05-04 16:22:21', 33, '2015-05-04 16:22:21', '', 0, '2015-05-04 16:22:12', '2015-05-04 16:22:21'),
	('', 'susan.aulia', 'iskandar.tio@gmail.com', '', 'First Interview', '<div><strong>Dear Ms. Susan Aulia,<br></strong><strong><br>We </strong><strong>would like to invite you to attend an interview </strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description </strong><strong>o</strong><strong>n Thursday, January 01, 1970</strong><strong>&nbsp;</strong><strong>a</strong><strong>t 07:00 am.</strong></div><div><strong>&nbsp;</strong></div><div><strong></strong><br></div><div><strong>&nbsp;</strong></div><div><strong>You will have the interview with .</strong></div><div><strong>&nbsp;</strong></div><div><strong>Please confirm your availability for the interview.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft für Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></strong></div><div>&nbsp;<br></div>', '2015-05-04 18:46:30', 34, '2015-05-04 18:46:30', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-04 18:46:24', '2015-05-04 18:46:30'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Expiring Reminder', 'Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Susan Aulia</td><td>Senior Manager</td><td>31-07-2015</td></tr></table>', '2015-05-04 20:24:09', 35, '2015-05-04 20:24:09', '', 97, '2015-05-04 20:24:03', '2015-05-04 20:24:09'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Expiring for your team', 'Dear No Data,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Susan Aulia</td><td>Senior Manager</td><td>31-07-2015</td></tr></table><br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft für Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-04 20:24:14', 36, '2015-05-04 20:24:14', '', 97, '2015-05-04 20:24:03', '2015-05-04 20:24:14'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Reminder', 'Dear Ms. Susan Aulia,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft für Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-04 20:24:20', 37, '2015-05-04 20:24:20', '', 97, '2015-05-04 20:24:03', '2015-05-04 20:24:20'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Expiring Reminder', 'Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Susan Aulia</td><td>Senior Manager</td><td>31-07-2015</td></tr></table>', '2015-05-04 21:40:03', 38, '2015-05-04 21:40:03', '', 97, '2015-05-04 21:39:57', '2015-05-04 21:40:03'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Expiring for your team', 'Dear No Data,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Susan Aulia</td><td>Senior Manager</td><td>31-07-2015</td></tr></table><br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft für Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-04 21:40:08', 39, '2015-05-04 21:40:08', '', 97, '2015-05-04 21:39:57', '2015-05-04 21:40:08'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Reminder', 'Dear Ms. Susan Aulia,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft für Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-04 21:40:13', 40, '2015-05-04 21:40:13', '', 97, '2015-05-04 21:39:57', '2015-05-04 21:40:13'),
	('iskandar.tio@gmail.com', 'susan.giz', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: vtxsn77n4t Please activate by clicking this link: <br><a href="https://192.168.8.104/gizhrms/activate?link=8rwpf5wz2ktvt42v6kh7hvr5hwrhs7" data-mce-href="https://192.168.8.104/gizhrms/activate?link=8rwpf5wz2ktvt42v6kh7hvr5hwrhs7">https://192.168.8.104/gizhrms/activate?link=8rwpf5wz2ktvt42v6kh7hvr5hwrhs7</a>', '2015-05-04 23:25:22', 41, '2015-05-04 23:25:22', '', 97, '2015-05-04 23:25:14', '2015-05-04 23:25:22'),
	('', 'bella.nurul', 'iskandar.tio@gmail.com', '', '[GIZ] Interview Invitation', '<div><strong>Dear Ms. Bella Nurul,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>We </strong><strong>would like to invite you to attend a written test&nbsp;</strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description </strong><strong>o</strong><strong>n Monday, May 04, 2015</strong><strong>&nbsp;</strong><strong>a</strong><strong>t 12:30 pm.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Wisma Bakrie2</strong><br></div><div><strong>&nbsp;</strong></div><div><strong></strong><strong>Please confirm your availability for the test.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong><br>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></strong></div><div><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></strong></div><div>&nbsp;</div>', '2015-05-04 23:53:03', 42, '2015-05-04 23:53:03', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-04 23:52:57', '2015-05-04 23:53:03'),
	('', 'angga.aditya', 'iskandar.tio@gmail.com', '', '[GIZ] Interview Invitation', '<div><strong>Dear Mr. Angga Aditya,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>We </strong><strong>would like to invite you to attend a written test&nbsp;</strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description </strong><strong>o</strong><strong>n Monday, May 04, 2015</strong><strong>&nbsp;</strong><strong>a</strong><strong>t 01:30 pm.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Wisma Bakrie2</strong><br></div><div><strong>&nbsp;</strong></div><div><strong></strong><strong>Please confirm your availability for the test.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong><br>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></strong></div><div><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></strong></div><div>&nbsp;</div>', '2015-05-04 23:53:08', 43, '2015-05-04 23:53:08', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-04 23:52:57', '2015-05-04 23:53:08'),
	('', 'bella.nurul', 'iskandar.tio@gmail.com;iskandar.tio@gmail.com', '', 'First Interview', '<div>Dear Ms. Bella Nurul,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 12:30 pm.</div><div>&nbsp;</div><div>KLH<br></div><div>&nbsp;</div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.</div><div>&nbsp;</div><div>Please confirm your availability for the interview.</div><div>&nbsp;</div><div>We look forward to meeting you.</div><div>&nbsp;</div><div>Best Regards,</div><div><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div>&nbsp;<br></div>', '2015-05-05 00:51:32', 44, '2015-05-05 00:51:32', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-05 00:51:26', '2015-05-05 00:51:32'),
	('', 'angga.aditya', 'iskandar.tio@gmail.com;iskandar.tio@gmail.com', '', 'First Interview', '<div>Dear Mr. Angga Aditya,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 11:30 am.</div><div>&nbsp;</div><div>KLH<br></div><div>&nbsp;</div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.</div><div>&nbsp;</div><div>Please confirm your availability for the interview.</div><div>&nbsp;</div><div>We look forward to meeting you.</div><div>&nbsp;</div><div>Best Regards,</div><div><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div>&nbsp;<br></div>', '2015-05-05 00:51:37', 45, '2015-05-05 00:51:37', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-05 00:51:26', '2015-05-05 00:51:37'),
	('', 'amir', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Ms. Bella Nurul</td><td>KLH</td>\r\n				<td>Tuesday, May 05, 2015</td><td>12:30 pm</td></tr><tr><td>Mr. Angga Aditya</td><td>KLH</td>\r\n				<td>Tuesday, May 05, 2015</td><td>11:30 am</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 00:51:42', 46, '2015-05-05 00:51:42', '', 97, '2015-05-05 00:51:26', '2015-05-05 00:51:42'),
	('', 'susan.giz', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Ms. Bella Nurul</td><td>KLH</td>\r\n				<td>Tuesday, May 05, 2015</td><td>12:30 pm</td></tr><tr><td>Mr. Angga Aditya</td><td>KLH</td>\r\n				<td>Tuesday, May 05, 2015</td><td>11:30 am</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 00:51:47', 47, '2015-05-05 00:51:47', '', 97, '2015-05-05 00:51:26', '2015-05-05 00:51:47'),
	('', 'susi.susi', 'iskandar.tio@gmail.com', '', 'Asking for reference', '<p>Dear Mrs. Susi,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding Bella Nurul, who considered to become Accounting.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for Bella Nurul, as she has putting your name as her referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding Bella Nurul&#39;s qualifications and skills in jfojfds fsd, as well as your connection with her.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p><p>&nbsp;</p><p>&nbsp;</p>', '2015-05-05 00:51:53', 48, '2015-05-05 00:51:53', '', 97, '2015-05-05 00:51:26', '2015-05-05 00:51:53'),
	('', 'murni', 'iskandar.tio@gmail.com', '', 'Asking for reference', '<p>Dear Ms. Murni,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding Angga Aditya, who considered to become Accounting.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for Angga Aditya, as he has putting your name as his referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding Angga Aditya&#39;s qualifications and skills in jfojfds fsd, as well as your connection with him.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p><p>&nbsp;</p><p>&nbsp;</p>', '2015-05-05 00:52:00', 49, '2015-05-05 00:52:00', '', 97, '2015-05-05 00:51:26', '2015-05-05 00:52:00'),
	('', 'bella.nurul', 'iskandar.tio@gmail.com', '', '[GIZ] Interview Invitation Accounting (Acc-Acc)', '<div><strong>Dear Ms. Bella Nurul, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>We </strong><strong>would like to invite you to attend an interview </strong><strong>for Accounting (Acc-Acc)&nbsp;position as attached job description </strong><strong>o</strong><strong>n Tuesday, May 05, 2015</strong><strong>&nbsp;</strong><strong>a</strong><strong>t 05:30 pm.</strong></div><div><strong>&nbsp;</strong></div><div><strong><p>Location:</p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href="ffds" data-mce-href="ffds">ffds</a>gfdgtr</p></strong><br></div><div><strong>&nbsp;</strong></div><div><strong>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Please confirm your availability for the interview.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong><br>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></strong></div><div><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></strong></div><div>&nbsp;</div>', '2015-05-05 01:59:03', 50, '2015-05-05 01:59:03', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-05 01:58:57', '2015-05-05 01:59:03'),
	('', 'amir', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Ms. Bella Nurul</td><td>Wisma Bakrie2</td>\r\n				<td>Tuesday, May 05, 2015</td><td>05:30 pm</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 01:59:08', 51, '2015-05-05 01:59:08', '', 97, '2015-05-05 01:58:57', '2015-05-05 01:59:08'),
	('', 'susan.giz', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Ms. Bella Nurul</td><td>Wisma Bakrie2</td>\r\n				<td>Tuesday, May 05, 2015</td><td>05:30 pm</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 01:59:13', 52, '2015-05-05 01:59:13', '', 97, '2015-05-05 01:58:57', '2015-05-05 01:59:13'),
	('', 'susi.susi', 'iskandar.tio@gmail.com', '', 'Asking for reference', '<p>Dear Mrs. Susi,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding Bella Nurul, who considered to become Accounting.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for Bella Nurul, as she has putting your name as her referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding Bella Nurul&#39;s qualifications and skills in jfojfds fsd, as well as your connection with her.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p><p>&nbsp;</p><p>&nbsp;</p>', '2015-05-05 01:59:19', 53, '2015-05-05 01:59:19', '', 97, '2015-05-05 01:58:57', '2015-05-05 01:59:19'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Expiring Reminder', 'Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Susan Aulia</td><td>Senior Manager</td><td>31-07-2015</td></tr><tr><td>Ms. Bella Nurul</td><td>Senior Advisor</td><td>30-06-2015</td></tr></table>', '2015-05-05 09:02:26', 54, '2015-05-05 09:02:26', '', 97, '2015-05-05 09:02:21', '2015-05-05 09:02:26'),
	('', 'susan.giz', 'iskandar.tio@gmail.com', '', 'Contract Expiring for your team', 'Dear Ms. Susan Aulia,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Susan Aulia</td><td>Senior Manager</td><td>31-07-2015</td></tr><tr><td>Ms. Bella Nurul</td><td>Senior Advisor</td><td>30-06-2015</td></tr></table><br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-05 09:02:31', 55, '2015-05-05 09:02:31', '', 97, '2015-05-05 09:02:21', '2015-05-05 09:02:31'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Reminder', 'Dear Ms. Susan Aulia,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-05 09:02:36', 56, '2015-05-05 09:02:36', '', 97, '2015-05-05 09:02:21', '2015-05-05 09:02:36'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Reminder', 'Dear Ms. Bella Nurul,<br><br>Your Contract will be expired at 30-06-2015<br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-05 09:02:44', 57, '2015-05-05 09:02:44', '', 97, '2015-05-05 09:02:21', '2015-05-05 09:02:44'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Expiring Reminder', 'Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Bella Nurul</td><td>Senior Advisor</td><td>30-06-2015</td></tr></table>', '2015-05-05 09:22:50', 58, '2015-05-05 09:22:50', '', 97, '2015-05-05 09:22:44', '2015-05-05 09:22:50'),
	('', 'susan.giz', 'iskandar.tio@gmail.com', '', 'Contract Expiring for your team', 'Dear Ms. Susan Aulia,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Bella Nurul</td><td>Senior Advisor</td><td>30-06-2015</td></tr></table><br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-05 09:22:55', 59, '2015-05-05 09:22:55', '', 97, '2015-05-05 09:22:44', '2015-05-05 09:22:55'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Reminder', 'Dear Ms. Bella Nurul,<br><br>Your Contract will be expired at 30-06-2015<br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-05 09:23:01', 60, '2015-05-05 09:23:01', '', 97, '2015-05-05 09:22:44', '2015-05-05 09:23:01'),
	('iskandar.tio@gmail.com', 'bella.giz', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: m5ccjf5swd Please activate by clicking this link: <br><a href="https://192.168.8.104/gizhrms/activate?link=xxz3shf454p8dv76wptc5jtjpbjrws" data-mce-href="https://192.168.8.104/gizhrms/activate?link=xxz3shf454p8dv76wptc5jtjpbjrws">https://192.168.8.104/gizhrms/activate?link=xxz3shf454p8dv76wptc5jtjpbjrws</a>', '2015-05-05 09:25:10', 61, '2015-05-05 09:25:10', '', 97, '2015-05-05 09:24:55', '2015-05-05 09:25:10'),
	('', 'angga.aditya', 'iskandar.tio@gmail.com;iskandar.tio@gmail.com', '', 'First Interview', '<div>Dear Mr. Angga Aditya,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 11:30 am.</div><div>&nbsp;</div><div><p>Kementrian Lingkungan Hidup</p><p>Gedung Otorita Batam<br>Jln. jdisoa jfiods no.23<br>gfdjior</p><br></div><div>&nbsp;</div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.</div><div>&nbsp;</div><div>Please confirm your availability for the interview.</div><div>&nbsp;</div><div>We look forward to meeting you.</div><div>&nbsp;</div><div>Best Regards,</div><div><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div>&nbsp;<br></div>', '2015-05-05 10:55:33', 62, '2015-05-05 10:55:33', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-05 10:55:27', '2015-05-05 10:55:33'),
	('', 'kevin.arief', 'iskandar.tio@gmail.com;iskandar.tio@gmail.com', '', 'First Interview', '<div>Dear Mr. Kevin Arief,<br><br>We would like to invite you to attend an interview for Accounting (Acc-Acc)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 05:00 pm.</div><div>&nbsp;</div><div><p>Location:</p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href="ffds" data-mce-href="ffds">ffds</a>gfdgtr</p><br></div><div>&nbsp;</div><div>You will have the interview with  me and Ms. Susan Aulia , the Senior Manager.</div><div>&nbsp;</div><div>Please confirm your availability for the interview.</div><div>&nbsp;</div><div>We look forward to meeting you.</div><div>&nbsp;</div><div>Best Regards,</div><div><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div>&nbsp;<br></div>', '2015-05-05 10:55:39', 63, '2015-05-05 10:55:39', 'pages/vacancy/Acc_3.pdf', 97, '2015-05-05 10:55:27', '2015-05-05 10:55:39'),
	('', 'amir', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Mr. Angga Aditya</td><td>KLH</td>\r\n				<td>Tuesday, May 05, 2015</td><td>11:30 am</td></tr><tr><td>Mr. Kevin Arief</td><td>Wisma Bakrie2</td>\r\n				<td>Tuesday, May 05, 2015</td><td>05:00 pm</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 10:55:44', 64, '2015-05-05 10:55:44', '', 97, '2015-05-05 10:55:27', '2015-05-05 10:55:44'),
	('', 'susan.giz', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Mr. Angga Aditya</td><td>KLH</td>\r\n				<td>Tuesday, May 05, 2015</td><td>11:30 am</td></tr><tr><td>Mr. Kevin Arief</td><td>Wisma Bakrie2</td>\r\n				<td>Tuesday, May 05, 2015</td><td>05:00 pm</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 10:55:49', 65, '2015-05-05 10:55:49', '', 97, '2015-05-05 10:55:27', '2015-05-05 10:55:49'),
	('', 'murni', 'iskandar.tio@gmail.com', '', 'Asking for reference', '<p>Dear Ms. Murni,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding Angga Aditya, who considered to become Accounting.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for Angga Aditya, as he has putting your name as his referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding Angga Aditya&#39;s qualifications and skills in jfojfds fsd, as well as your connection with him.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p><p>&nbsp;</p><p>&nbsp;</p>', '2015-05-05 10:55:54', 66, '2015-05-05 10:55:54', '', 97, '2015-05-05 10:55:27', '2015-05-05 10:55:54'),
	('', 'john', 'iskandar.tio@gmail.com', '', 'Asking for reference', '<p>Dear Mr. John,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding Kevin Arief, who considered to become Accounting.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for Kevin Arief, as he has putting your name as his referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding Kevin Arief&#39;s qualifications and skills in jfojfds fsd, as well as your connection with him.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p><p>&nbsp;</p><p>&nbsp;</p>', '2015-05-05 10:55:59', 67, '2015-05-05 10:55:59', '', 97, '2015-05-05 10:55:27', '2015-05-05 10:55:59'),
	('iskandar.tio@gmail.com', 'kevin.halim', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: a Please activate by clicking this link: <br><a href="https://192.168.8.104/gizhrms/activate?link=v6vbj67w5sdppy46kcv2zsd4cdz3fh" data-mce-href="https://192.168.8.104/gizhrms/activate?link=v6vbj67w5sdppy46kcv2zsd4cdz3fh">https://192.168.8.104/gizhrms/activate?link=v6vbj67w5sdppy46kcv2zsd4cdz3fh</a>', '2015-05-05 10:57:54', 68, '2015-05-05 10:57:54', '', 0, '2015-05-05 10:57:47', '2015-05-05 10:57:54'),
	('iskandar.tio@gmail.com', 'fitri', 'iskandar.tio@gmail.com', '', 'Account Activation', 'Your password is: a Please activate by clicking this link: <br><a href="https://localhost/gizhrms/activate?link=hwrxf2fpy52d8n225k4crdcp7tf4d8" data-mce-href="https://localhost/gizhrms/activate?link=hwrxf2fpy52d8n225k4crdcp7tf4d8">https://localhost/gizhrms/activate?link=hwrxf2fpy52d8n225k4crdcp7tf4d8</a>', '2015-05-05 13:23:36', 69, '2015-05-05 13:23:36', '', 0, '2015-05-05 13:23:25', '2015-05-05 13:23:36'),
	('', 'fitri', 'iskandar.tio@gmail.com;iskandar.tio@gmail.com', '', 'First Interview', '<div>Dear Ms. Fitri f,<br><br>We would like to invite you to attend an interview for IT Developer (IT-IT)&nbsp;position as attached job description on Tuesday, May 05, 2015&nbsp;at 11:00 am.</div><div>&nbsp;</div><div><p>Location:</p><p>Jalan Jend. Sudirman Kav.60, jdsiojf dsjio&nbsp;<br>fhdusif hdsiytr<br>jfdskh<a href="ffds" data-mce-href="ffds">ffds</a>gfdgtr</p><br></div><div>&nbsp;</div><div>You will have the interview with  me and Ms. Bella Nurul , the Senior Advisor.</div><div>&nbsp;</div><div>Please confirm your availability for the interview.</div><div>&nbsp;</div><div>We look forward to meeting you.</div><div>&nbsp;</div><div>Best Regards,</div><div><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div>&nbsp;<br></div>', '2015-05-05 13:39:49', 70, '2015-05-05 13:39:49', 'pages/vacancy/IT_1.pdf', 97, '2015-05-05 13:39:41', '2015-05-05 13:39:49'),
	('', 'amir', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Ms. Fitri f</td><td>Wisma Bakrie2</td>\r\n				<td>Tuesday, May 05, 2015</td><td>11:00 am</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 13:39:56', 71, '2015-05-05 13:39:56', '', 97, '2015-05-05 13:39:41', '2015-05-05 13:39:56'),
	('', 'bella.giz', 'iskandar.tio@gmail.com', '', 'Interview for @vacancy_name', '<p>Dear users,&nbsp;<br>Below please find the interview schedule.&nbsp;</p><p><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr><tr><td>Ms. Fitri f</td><td>Wisma Bakrie2</td>\r\n				<td>Tuesday, May 05, 2015</td><td>11:00 am</td></tr></table></p><p>Regards,<br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p>', '2015-05-05 13:40:01', 72, '2015-05-05 13:40:01', '', 97, '2015-05-05 13:39:41', '2015-05-05 13:40:01'),
	('', 'indra', 'iskandar.tio@gmail.com', '', 'Asking for reference', '<p>Dear Mr. Indra,&nbsp;</p><p>I hope this email finds you well.</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>I am writing you regarding Fitri f, who considered to become IT Developer.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for Fitri f, as she has putting your name as her referee.</p><p>It would be great if &nbsp;you could share your comments and impressions regarding Fitri f&#39;s qualifications and skills in skills, as well as your connection with her.</p><p>We do really hope that we could receive your recommendation&nbsp;within 3 working days.</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></p><p>&nbsp;</p><p>&nbsp;</p>', '2015-05-05 13:40:06', 73, '2015-05-05 13:40:06', '', 97, '2015-05-05 13:39:41', '2015-05-05 13:40:06'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Expiring Reminder', 'Below is the list of contract that will expired in 300 days<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Fitri f</td><td>Senior Manager</td><td>31-07-2015</td></tr></table>', '2015-05-05 13:42:49', 74, '2015-05-05 13:42:49', '', 97, '2015-05-05 13:42:43', '2015-05-05 13:42:49'),
	('', 'susan.giz', 'iskandar.tio@gmail.com', '', 'Contract Expiring for your team', 'Dear Ms. Susan Aulia,<br><br>Below is the list of contract&#39;s&nbsp;that expiring in PAKLIM - 001-PAK:<br><table border=1 cellpadding=3 cellspacing=0><tr><th>Name</th><th>Job Title</th><th>End Date</th></tr><tr><td>Ms. Fitri f</td><td>Senior Manager</td><td>31-07-2015</td></tr></table><br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-05 13:42:54', 75, '2015-05-05 13:42:54', '', 97, '2015-05-05 13:42:43', '2015-05-05 13:42:54'),
	('', '', 'iskandar.tio@gmail.com', '', 'Contract Reminder', 'Dear Ms. Fitri f,<br><br>Your Contract will be expired at 31-07-2015<br><br><strong>Fitri Kusumayanti<br></strong><strong>HR Professional<br></strong><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change<br></strong><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong><strong> <br>Deutsche Gesellschaft fur Internationale&nbsp;</strong><strong>Zusammenarbeit&nbsp;(GIZ) GmbH<br></strong><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)<br></strong><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong><strong>13410 Jakarta, Indonesia<br></strong><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186<br></a></strong><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110<br></a></strong><strong>M +62 8129 5346 045<br></strong><strong>E&nbsp;<a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong>', '2015-05-05 13:42:58', 76, '2015-05-05 13:42:58', '', 97, '2015-05-05 13:42:43', '2015-05-05 13:42:58');
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_setup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.email_setup: ~17 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee: ~1 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`first_name`, `last_name`, `place_of_birth`, `gender`, `nationality_id`, `address`, `country_id`, `province_id`, `city_id`, `post_code`, `phone1`, `phone2`, `giz_staff`, `computer_skills`, `professional_skills`, `employee_id`, `user_id`, `date_of_birth`, `country_name`, `applicant_status`, `nationality_val`, `contract1_start_date`, `contract1_end_date`, `am1_start_date`, `am1_end_date`, `contract2_start_date`, `contract2_end_date`, `am2_start_date`, `am2_end_date`, `adj_salary`, `adj_salary_band`, `adj_reason`, `contract_state`, `spouse_name`, `marry_date`, `account_bank`, `account_number`, `marital_status`, `spouse_entitled`, `emergency_phone`, `emergency_email`, `title`, `email`, `updated_by`, `created_at`, `updated_at`) VALUES
	('Amir', 'Budianto', 'jiofsd', 'Male', -1, 'fdsfds', 1, 17, 120, '123', '123', '123', NULL, 'PHP, MySQL, Java', 'Project Manager, IT Team Leader', 22, 97, '2015-03-19 00:00:00', 'test', NULL, 'Jawa', '2015-03-01 00:00:00', '2015-06-30 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Budi', '2015-04-07 00:00:00', 'BCAf', '483290482', 'Single', 1, 'csfds', 'dsfdsfds', 'Mr.', 'my.email@gmail.com', 97, '2015-05-02 16:07:42', '2015-05-02 17:47:25'),
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_dependent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_education: ~1 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicants_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_language_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_language: ~2 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_medical_checkup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_outpatient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_outpatient: ~3 rows (approximately)
/*!40000 ALTER TABLE `employee_outpatient` DISABLE KEYS */;
INSERT INTO `employee_outpatient` (`employee_outpatient_id`, `user_id`, `invoice_date`, `invoice_val`, `claim`, `paid`, `input_date`, `paid_status`, `remarks`, `updated_by`, `created_at`, `updated_at`) VALUES
	(42, 97, '2015-04-28 00:00:00', 200000, 200000, 180000, '2015-04-28 00:00:00', 1, 'gfdgfd', NULL, '2015-05-02 16:07:43', '2015-05-02 16:07:43'),
	(43, 97, '2015-04-29 00:00:00', 350000, 350000, 315000, '2015-04-28 00:00:00', 1, 'ifhdsui hfudsi', 97, '2015-05-02 16:07:43', '2015-05-05 01:28:36'),
	(44, 97, '2015-04-28 00:00:00', -60000, -60000, -54000, '2015-05-05 00:00:00', 1, 'salah bayar', 125, '2015-05-02 16:07:43', '2015-05-05 13:54:30'),
	(46, 97, '2015-05-05 00:00:00', 210000, 210000, 189000, '2015-05-05 00:00:00', 1, 'obat', 125, '2015-05-05 01:25:38', '2015-05-05 13:54:31'),
	(47, 97, '2015-05-05 00:00:00', 50000, 50000, 45000, '2015-05-05 00:00:00', 1, '', 125, '2015-05-05 13:53:42', '2015-05-05 13:54:32');
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_pregnancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_pregnancy: ~0 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_working_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_working: ~0 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_applied_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.job_applied: ~1 rows (approximately)
/*!40000 ALTER TABLE `job_applied` DISABLE KEYS */;
INSERT INTO `job_applied` (`job_applied_id`, `vacancy_id`, `user_id`, `date_applied`, `description`, `vacancy_progress_id`, `vacancy_shortlist`, `next_vacancy_progress_id`, `salary_expectation`, `negotiable`, `updated_by`, `created_at`, `updated_at`) VALUES
	(4, 3, 113, '2015-05-04 15:12:11', NULL, 6, 0, -1, 5500000, 1, 97, '2015-05-04 15:12:11', '2015-05-05 09:13:09'),
	(5, 3, 115, '2015-05-04 22:47:20', NULL, 6, 0, 1000, 7000000, 1, 97, '2015-05-04 22:47:20', '2015-05-05 09:21:58'),
	(6, 3, 116, '2015-05-04 22:50:55', NULL, 3, 0, NULL, 5000000, 0, 97, '2015-05-04 22:50:55', '2015-05-05 00:51:26'),
	(7, 3, 114, '2015-05-05 09:46:12', NULL, 3, 0, NULL, 5000000, 1, 97, '2015-05-05 09:46:12', '2015-05-05 10:55:27'),
	(8, 1, 136, '2015-05-05 13:33:41', NULL, 6, 0, 1000, 2000000, 1, 97, '2015-05-05 13:33:41', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `job_applied` ENABLE KEYS */;


-- Dumping structure for table hrms.job_position
DROP TABLE IF EXISTS `job_position`;
CREATE TABLE IF NOT EXISTS `job_position` (
  `job_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_position` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- Dumping data for table hrms.m_user: ~2 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_user_role: ~12 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.project_location: ~4 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.project_name: ~4 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`project_number_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.project_number: ~4 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_sharing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_sharing: ~0 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_ranking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.user_ranking: ~0 rows (approximately)
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
	(14, 7, 1, 'ok', 136, 134, '2015-05-05 13:38:17', '2015-05-05 13:38:17');
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy: ~2 rows (approximately)
/*!40000 ALTER TABLE `vacancy` DISABLE KEYS */;
INSERT INTO `vacancy` (`vacancy_id`, `vacancy_code`, `vacancy_name`, `vacancy_startdate`, `vacancy_enddate`, `vacancy_description`, `vacancy_closedate`, `vacancy_progress_id`, `vacancy_code2`, `vacancy_type`, `allowance`, `vacancy_criteria`, `next_vacancy_progress_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'IT', 'IT Developer', '2015-04-01 00:00:00', '2015-05-31 00:00:00', _binary 0x495420446576656C6F706572206E6565646564, NULL, 6, 'IT', 'Intern', 300000, 'skills', 6, 97, '2015-05-02 16:07:45', '2015-05-05 13:42:21'),
	(3, 'Acc', 'Accounting', '2015-04-27 00:00:00', '2015-05-31 00:00:00', _binary 0x4E6577204163636F756E74696E67205374616666206E6565646564, NULL, 3, 'Acc', 'Intern', 2000000, 'jfojfds fsd', 3, 97, '2015-05-02 16:07:45', '2015-05-05 12:58:21');
/*!40000 ALTER TABLE `vacancy` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_employee
DROP TABLE IF EXISTS `vacancy_employee`;
CREATE TABLE IF NOT EXISTS `vacancy_employee` (
  `vacancy_employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` varchar(50) DEFAULT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_employee: ~0 rows (approximately)
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_interview_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_interview: ~0 rows (approximately)
/*!40000 ALTER TABLE `vacancy_interview` DISABLE KEYS */;
INSERT INTO `vacancy_interview` (`vacancy_interview_id`, `interview_date`, `interview_time`, `interview_place`, `vacancy_id`, `vacancy_progress_id`, `user_id`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, '2015-05-04 00:00:00', '12.30', 'Wisma Bakrie2', 3, 9, 115, 97, '2015-05-04 23:23:11', '2015-05-04 23:24:19'),
	(2, '2015-05-04 00:00:00', '13.30', 'Wisma Bakrie2', 3, 9, 116, 97, '2015-05-04 23:23:11', '2015-05-04 23:24:30'),
	(3, '2015-05-05 00:00:00', '12.30', 'Wisma Bakrie2', 3, 3, 115, 97, '2015-05-05 00:50:18', '2015-05-05 01:00:01'),
	(4, '2015-05-05 00:00:00', '11.30', 'KLH', 3, 3, 116, 97, '2015-05-05 00:50:19', '2015-05-05 00:50:19'),
	(5, '2015-05-05 00:00:00', '17.30', 'Wisma Bakrie2', 3, 4, 115, 97, '2015-05-05 01:57:39', '2015-05-05 01:57:39'),
	(6, '2015-05-05 00:00:00', '17.00', 'Wisma Bakrie2', 3, 3, 114, 97, '2015-05-05 10:54:01', '2015-05-05 10:54:01'),
	(7, '2015-05-05 00:00:00', '11.00', 'Wisma Bakrie2', 1, 3, 136, 97, '2015-05-05 13:37:04', '2015-05-05 13:38:55');
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_question: ~2 rows (approximately)
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
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vacancy_timeline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_timeline: ~0 rows (approximately)
/*!40000 ALTER TABLE `vacancy_timeline` DISABLE KEYS */;
INSERT INTO `vacancy_timeline` (`vacancy_timeline_id`, `vacancy_id`, `vacancy_progress_id`, `update_time`, `updated_by`, `created_at`, `updated_at`) VALUES
	(5, 3, 9, '2015-05-04 23:52:57', 97, '2015-05-04 23:52:57', '2015-05-04 23:52:57'),
	(7, 3, 4, '2015-05-05 01:58:57', 97, '2015-05-05 01:58:57', '2015-05-05 01:58:57'),
	(9, 3, 6, '2015-05-05 09:21:58', 97, '2015-05-05 09:21:58', '2015-05-05 09:21:58'),
	(10, 3, 1, '2015-05-05 10:53:19', 97, '2015-05-05 10:53:19', '2015-05-05 10:53:19'),
	(11, 3, 3, '2015-05-05 10:55:27', 97, '2015-05-05 10:55:27', '2015-05-05 10:55:27'),
	(12, 1, 1, '2015-05-05 13:36:16', 97, '2015-05-05 13:36:16', '2015-05-05 13:36:16'),
	(13, 1, 3, '2015-05-05 13:39:41', 97, '2015-05-05 13:39:41', '2015-05-05 13:39:41'),
	(14, 1, 6, '2015-05-05 13:42:21', 97, '2015-05-05 13:42:21', '2015-05-05 13:42:21');
/*!40000 ALTER TABLE `vacancy_timeline` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_type
DROP TABLE IF EXISTS `vacancy_type`;
CREATE TABLE IF NOT EXISTS `vacancy_type` (
  `vacancy_type` varchar(50) DEFAULT NULL,
  `vacancy_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
