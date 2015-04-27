-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.28a-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2015-04-28 00:38:32
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for hrms
DROP DATABASE IF EXISTS `hrms`;
CREATE DATABASE IF NOT EXISTS `hrms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hrms`;


-- Dumping structure for table hrms.m_category
DROP TABLE IF EXISTS `m_category`;
CREATE TABLE IF NOT EXISTS `m_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_category: ~7 rows (approximately)
/*!40000 ALTER TABLE `m_category` DISABLE KEYS */;
INSERT INTO `m_category` (`category_id`, `category_name`, `sort_id`) VALUES
	(1, 'Administration', 2),
	(2, 'Master Data', 1),
	(3, 'Statistics', 6),
	(4, 'Recruitment', 3),
	(5, 'Self Service', 4),
	(6, 'Applicant Data', 5),
	(7, 'Medical', 7);
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
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_module: ~45 rows (approximately)
/*!40000 ALTER TABLE `m_module` DISABLE KEYS */;
INSERT INTO `m_module` (`module_id`, `module_name`, `module_description`, `status_id`, `category_id`, `sort_id`, `sub_module`) VALUES
	(1, 'employee', 'Employee List', 1, 1, 1, ''),
	(3, 'accept_employee', 'Accept Employee', 1, 4, 26, NULL),
	(4, 'call_interview', 'Call Interview', 1, 4, 25, NULL),
	(5, 'self_data', 'Self Data', 1, 5, 5, NULL),
	(6, 'superadmin', 'Super Admin', 1, 1, 6, NULL),
	(7, 'applicant', 'Personal Data', 1, 6, 7, NULL),
	(8, 'contract_expiring', 'Contract Expiring', 1, 1, 8, ''),
	(9, 'education', 'Education', 1, 6, 9, ''),
	(10, 'employee_statistics', 'Employee Statistics', 1, 3, 10, ''),
	(11, 'eyeglasses', 'Eye Glasses', 1, 7, 15, ''),
	(12, 'filter_applicant', 'Filter Applicant', 1, 4, 24, ''),
	(13, 'former_employee', 'Former Employee', 1, 1, 13, ''),
	(14, 'language', 'Language', 1, 6, 14, ''),
	(15, 'location', 'Interview Location', 1, 2, 18, ''),
	(16, 'medical_checkup', 'Medical Checkup', 1, 7, 17, ''),
	(17, 'medical_summary', 'Medical Summary', 1, 7, 20, ''),
	(18, 'others', 'Others', 1, 2, 23, ''),
	(19, 'outpatient', 'Outpatient', 1, 7, 11, ''),
	(20, 'pay_medical', 'Pay Medical', 1, 7, 19, ''),
	(21, 'position_applied', 'Position Applied', 1, 6, 21, ''),
	(23, 'project', 'Project', 1, 2, 2, ''),
	(24, 'question', 'Questions', 1, 4, 4, ''),
	(25, 'recruitment', 'Recruitment', 1, 4, 27, ''),
	(26, 'recruitment_report', 'Recruitment Report', 1, 4, 34, ''),
	(27, 'recruitment_summary', 'Recruitment Summary', 1, 4, 35, ''),
	(28, 'references', 'References', 1, 6, 28, ''),
	(29, 'region', 'Region', 1, 2, 29, ''),
	(30, 'salary', 'Salary Adjustment', 1, 1, 30, ''),
	(31, 'settings', 'Settings', 1, 2, 31, ''),
	(32, 'statistics', 'Recruitment Statistics', 1, 3, 32, ''),
	(33, 'uploadcv', 'Upload CV+Cover Letter', 1, 6, 33, ''),
	(34, 'vacancy', 'Vacancy', 1, 4, 12, ''),
	(35, 'vacancy_progress', 'Recruitment Progress', 1, 4, 3, ''),
	(36, 'working', 'Working Experiences', 1, 6, 37, ''),
	(37, 'email_setting', 'Email Setting', 1, 2, 38, ''),
	(38, 'change_password', 'Change Password', 1, 5, 39, ''),
	(40, 'pregnancy', 'Pregnancy', 1, 7, 16, ''),
	(41, 'change_project_data', 'Change Project Data', 1, 1, 40, '1'),
	(42, 'employee_detail', 'Employee Detail', 1, 1, 41, '1'),
	(43, 'print_recruitment_summary', 'Print Recruitment Summary', 1, 4, 42, '1'),
	(44, 'employee_om', 'Employee for OM', 1, 1, 43, ''),
	(45, 'employee_detail_om', 'Employee Detail for OM', 1, 1, 44, '1'),
	(46, 'print_hrsr', 'Print HRSR', 1, 1, 45, '1'),
	(47, 'downloadcv', 'Download CV', 1, 6, 46, '1'),
	(48, 'upload', 'Upload Photo and Pictures', 1, 1, 47, '1');
/*!40000 ALTER TABLE `m_module` ENABLE KEYS */;


-- Dumping structure for table hrms.m_role
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE IF NOT EXISTS `m_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_description` varchar(100) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_role: ~6 rows (approximately)
/*!40000 ALTER TABLE `m_role` DISABLE KEYS */;
INSERT INTO `m_role` (`role_id`, `role_name`, `role_description`, `status_id`) VALUES
	(1, 'applicant', 'Applicant', 1),
	(2, 'admin', 'Admin', 1),
	(3, 'employee', 'Employee', 1),
	(6, 'superadmin', 'Super Admin', 1),
	(7, 'office manager', 'Office Manager', 1),
	(8, 'finance', 'Finance', 1);
/*!40000 ALTER TABLE `m_role` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
