-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.28a-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2014-10-23 09:15:13
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table hrms.applicants
DROP TABLE IF EXISTS `applicants`;
CREATE TABLE IF NOT EXISTS `applicants` (
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `place_of_birth` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `giz_staff` tinyint(1) DEFAULT NULL,
  `computer_skills` varchar(500) DEFAULT NULL,
  `professional_skills` varchar(500) DEFAULT NULL,
  `applicants_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  PRIMARY KEY (`applicants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` (`first_name`, `last_name`, `place_of_birth`, `gender`, `nationality`, `address`, `country`, `province`, `city`, `post_code`, `phone1`, `phone2`, `giz_staff`, `computer_skills`, `professional_skills`, `applicants_id`, `user_id`, `date_of_birth`) VALUES
	('Iskandar', 'Tio', 'Jambi', 'Male', '1', 'Duri Utara 4 no.34', '1', '31', '3174', '11270', '08888341165', '0216394594', NULL, NULL, NULL, 1, 5, '1981-07-14 00:00:00');
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_answer
DROP TABLE IF EXISTS `applicants_answer`;
CREATE TABLE IF NOT EXISTS `applicants_answer` (
  `applicant_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_applied_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `choice_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`applicant_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_answer: ~35 rows (approximately)
/*!40000 ALTER TABLE `applicants_answer` DISABLE KEYS */;
INSERT INTO `applicants_answer` (`applicant_answer_id`, `job_applied_id`, `question_id`, `choice_id`, `user_id`) VALUES
	(1, 1, 2, 5, NULL),
	(2, 2, 1, 2, NULL),
	(3, 2, 2, 5, NULL),
	(4, 3, 1, 1, NULL),
	(5, 3, 2, 6, NULL),
	(6, 4, 1, 2, NULL),
	(7, 4, 2, 7, NULL),
	(8, 5, 1, 3, NULL),
	(9, 5, 2, 7, NULL),
	(10, 6, 2, 6, NULL),
	(11, 7, 2, 5, NULL),
	(12, 8, 1, 1, NULL),
	(13, 8, 2, 5, NULL),
	(14, 9, 2, 6, NULL),
	(15, 10, 2, 6, NULL),
	(16, 11, 2, 7, NULL),
	(17, 12, 1, 2, NULL),
	(18, 12, 2, 7, NULL),
	(19, 13, 1, 2, NULL),
	(20, 13, 2, 6, NULL),
	(21, 14, 2, 5, NULL),
	(22, 15, 2, 6, NULL),
	(23, 16, 1, 1, NULL),
	(24, 16, 2, 6, NULL),
	(25, 17, 2, 6, NULL),
	(26, 18, 2, 5, NULL),
	(27, 19, 2, 6, NULL),
	(28, 20, 2, 6, NULL),
	(29, 21, 2, 5, NULL),
	(30, 22, 2, 6, NULL),
	(31, 23, 2, 5, NULL),
	(32, 24, 2, 6, NULL),
	(33, 25, 2, 7, NULL),
	(34, 26, 1, 1, NULL),
	(35, 26, 2, 6, NULL);
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
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`applicants_education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_education: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants_education` DISABLE KEYS */;
INSERT INTO `applicants_education` (`applicants_education_id`, `user_id`, `education_id`, `major`, `place`, `year_from`, `year_to`, `country`) VALUES
	(5, 5, 5, 'Information Technology', 'Binus', 1999, 2004, 'Indonesia');
/*!40000 ALTER TABLE `applicants_education` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_language
DROP TABLE IF EXISTS `applicants_language`;
CREATE TABLE IF NOT EXISTS `applicants_language` (
  `applicants_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(50) DEFAULT NULL,
  `language_skill_id` int(50) DEFAULT NULL,
  `language_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`applicants_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_language: ~3 rows (approximately)
/*!40000 ALTER TABLE `applicants_language` DISABLE KEYS */;
INSERT INTO `applicants_language` (`applicants_language_id`, `user_id`, `language_id`, `language_skill_id`, `language_val`) VALUES
	(1, 5, 1, 1, NULL),
	(3, 5, 3, 5, NULL),
	(4, 5, 2, 1, NULL);
/*!40000 ALTER TABLE `applicants_language` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_other_language
DROP TABLE IF EXISTS `applicants_other_language`;
CREATE TABLE IF NOT EXISTS `applicants_other_language` (
  `applicants_other_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_skill_id` int(50) DEFAULT NULL,
  `language_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`applicants_other_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_other_language: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants_other_language` DISABLE KEYS */;
INSERT INTO `applicants_other_language` (`applicants_other_language_id`, `user_id`, `language_skill_id`, `language_val`) VALUES
	(6, 5, 3, 'Japanese');
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
  PRIMARY KEY (`applicants_other_reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_other_reference: ~0 rows (approximately)
/*!40000 ALTER TABLE `applicants_other_reference` DISABLE KEYS */;
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
  PRIMARY KEY (`applicants_reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_reference: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants_reference` DISABLE KEYS */;
INSERT INTO `applicants_reference` (`applicants_reference_id`, `job_title`, `reference_name`, `email`, `phone`, `user_id`) VALUES
	(1, 'Manager', 'Indra', 'iskandar.tio@gmail.com', '432543543', 5);
/*!40000 ALTER TABLE `applicants_reference` ENABLE KEYS */;


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
  PRIMARY KEY (`applicants_working_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants_working: ~1 rows (approximately)
/*!40000 ALTER TABLE `applicants_working` DISABLE KEYS */;
INSERT INTO `applicants_working` (`applicants_working_id`, `user_id`, `month_from`, `year_from`, `month_to`, `year_to`, `employer`, `job_title`, `business_id`, `may_contact`, `leave_reason`) VALUES
	(44, 5, 2, 1999, 4, 2000, 'PT Angin Ribut', 'Idiospa', 2, 1, 'f');
/*!40000 ALTER TABLE `applicants_working` ENABLE KEYS */;


-- Dumping structure for table hrms.business
DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.business: ~7 rows (approximately)
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` (`business_id`, `business_val`, `sort_id`) VALUES
	(1, 'NGO', 1),
	(2, 'Private Sector', 2),
	(3, 'Government', 3),
	(4, 'International Organization', 4),
	(5, 'University', 5),
	(6, 'Self-Employed', 6),
	(7, 'Others', 7);
/*!40000 ALTER TABLE `business` ENABLE KEYS */;


-- Dumping structure for table hrms.choice
DROP TABLE IF EXISTS `choice`;
CREATE TABLE IF NOT EXISTS `choice` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `choice` varchar(1000) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.choice: ~8 rows (approximately)
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` (`choice_id`, `question_id`, `choice`, `sort_id`) VALUES
	(1, 1, '5-10 people', 1),
	(2, 1, '10-20 people', 2),
	(3, 1, '>20 people', 3),
	(4, 1, 'N/A', 4),
	(5, 2, '1-3 years', 1),
	(6, 2, '3-5 years', 2),
	(7, 2, '5-7 years', 3),
	(8, 2, 'N/A', 4);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;


-- Dumping structure for table hrms.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `city_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9472 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.city: ~499 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`city_id`, `province_id`, `city_val`) VALUES
	(1101, 11, 'Kab. Simeulue'),
	(1102, 11, 'Kab. Aceh Singkil'),
	(1103, 11, 'Kab. Aceh Selatan'),
	(1104, 11, 'Kab. Aceh Tenggara'),
	(1105, 11, 'Kab. Aceh Timur'),
	(1106, 11, 'Kab. Aceh Tengah'),
	(1107, 11, 'Kab. Aceh Barat'),
	(1108, 11, 'Kab. Aceh Besar'),
	(1109, 11, 'Kab. Pidie'),
	(1110, 11, 'Kab. Bireuen'),
	(1111, 11, 'Kab. Aceh Utara'),
	(1112, 11, 'Kab. Aceh Barat Daya'),
	(1113, 11, 'Kab. Gayo Lues'),
	(1114, 11, 'Kab. Aceh Tamiang'),
	(1115, 11, 'Kab. Nagan Raya'),
	(1116, 11, 'Kab. Aceh Jaya'),
	(1117, 11, 'Kab. Bener Meriah'),
	(1118, 11, 'Kab. Pidie Jaya'),
	(1171, 11, 'Kota Banda Aceh'),
	(1172, 11, 'Kota Sabang'),
	(1173, 11, 'Kota Langsa'),
	(1174, 11, 'Kota Lhokseumawe'),
	(1175, 11, 'Kota Subulussalam'),
	(1201, 12, 'Kab. Nias'),
	(1202, 12, 'Kab. Mandailing Natal'),
	(1203, 12, 'Kab. Tapanuli Selatan'),
	(1204, 12, 'Kab. Tapanuli Tengah'),
	(1205, 12, 'Kab. Tapanuli Utara'),
	(1206, 12, 'Kab. Toba Samosir'),
	(1207, 12, 'Kab. Labuhan Batu'),
	(1208, 12, 'Kab. Asahan'),
	(1209, 12, 'Kab. Simalungun'),
	(1210, 12, 'Kab. Dairi'),
	(1211, 12, 'Kab. Karo'),
	(1212, 12, 'Kab. Deli Serdang'),
	(1213, 12, 'Kab. Langkat'),
	(1214, 12, 'Kab. Nias Selatan'),
	(1215, 12, 'Kab. Humbang Hasundutan'),
	(1216, 12, 'Kab. Pakpak Bharat'),
	(1217, 12, 'Kab. Samosir'),
	(1218, 12, 'Kab. Serdang Bedagai'),
	(1219, 12, 'Kab. Batu Bara'),
	(1220, 12, 'Kab. Padang Lawas Utara'),
	(1221, 12, 'Kab. Padang Lawas'),
	(1222, 12, 'Kab. Labuhan Batu Selatan'),
	(1223, 12, 'Kab. Labuhan Batu Utara'),
	(1224, 12, 'Kab. Nias Utara'),
	(1225, 12, 'Kab. Nias Barat'),
	(1271, 12, 'Kota Sibolga'),
	(1272, 12, 'Kota Tanjung Balai'),
	(1273, 12, 'Kota Pematang Siantar'),
	(1274, 12, 'Kota Tebing Tinggi'),
	(1275, 12, 'Kota Medan'),
	(1276, 12, 'Kota Binjai'),
	(1277, 12, 'Kota Padangsidimpuan'),
	(1278, 12, 'Kota Gunungsitoli'),
	(1301, 13, 'Kab. Kepulauan Mentawai'),
	(1302, 13, 'Kab. Pesisir Selatan'),
	(1303, 13, 'Kab. Solok'),
	(1304, 13, 'Kab. Sijunjung'),
	(1305, 13, 'Kab. Tanah Datar'),
	(1306, 13, 'Kab. Padang Pariaman'),
	(1307, 13, 'Kab. Agam'),
	(1308, 13, 'Kab. Lima Puluh Kota'),
	(1309, 13, 'Kab. Pasaman'),
	(1310, 13, 'Kab. Solok Selatan'),
	(1311, 13, 'Kab. Dharmasraya'),
	(1312, 13, 'Kab. Pasaman Barat'),
	(1371, 13, 'Kota Padang'),
	(1372, 13, 'Kota Solok'),
	(1373, 13, 'Kota Sawah Lunto'),
	(1374, 13, 'Kota Padang Panjang'),
	(1375, 13, 'Kota Bukittinggi'),
	(1376, 13, 'Kota Payakumbuh'),
	(1377, 13, 'Kota Pariaman'),
	(1401, 14, 'Kab. Kuantan Singingi'),
	(1402, 14, 'Kab. Indragiri Hulu'),
	(1403, 14, 'Kab. Indragiri Hilir'),
	(1404, 14, 'Kab. Pelalawan'),
	(1405, 14, 'Kab. S I A K'),
	(1406, 14, 'Kab. Kampar'),
	(1407, 14, 'Kab. Rokan Hulu'),
	(1408, 14, 'Kab. Bengkalis'),
	(1409, 14, 'Kab. Rokan Hilir'),
	(1410, 14, 'Kab. Kepulauan Meranti'),
	(1471, 14, 'Kota Pekanbaru'),
	(1473, 14, 'Kota D U M A I'),
	(1501, 15, 'Kab. Kerinci'),
	(1502, 15, 'Kab. Merangin'),
	(1503, 15, 'Kab. Sarolangun'),
	(1504, 15, 'Kab. Batang Hari'),
	(1505, 15, 'Kab. Muaro Jambi'),
	(1506, 15, 'Kab. Tanjung Jabung Timur'),
	(1507, 15, 'Kab. Tanjung Jabung Barat'),
	(1508, 15, 'Kab. Tebo'),
	(1509, 15, 'Kab. Bungo'),
	(1571, 15, 'Kota Jambi'),
	(1572, 15, 'Kota Sungai Penuh'),
	(1601, 16, 'Kab. Ogan Komering Ulu'),
	(1602, 16, 'Kab. Ogan Komering Ilir'),
	(1603, 16, 'Kab. Muara Enim'),
	(1604, 16, 'Kab. Lahat'),
	(1605, 16, 'Kab. Musi Rawas'),
	(1606, 16, 'Kab. Musi Banyuasin'),
	(1607, 16, 'Kab. Banyu Asin'),
	(1608, 16, 'Kab. Ogan Komering Ulu Selatan'),
	(1609, 16, 'Kab. Ogan Komering Ulu Timur'),
	(1610, 16, 'Kab. Ogan Ilir'),
	(1611, 16, 'Kab. Empat Lawang'),
	(1671, 16, 'Kota Palembang'),
	(1672, 16, 'Kota Prabumulih'),
	(1673, 16, 'Kota Pagar Alam'),
	(1674, 16, 'Kota Lubuklinggau'),
	(1701, 17, 'Kab. Bengkulu Selatan'),
	(1702, 17, 'Kab. Rejang Lebong'),
	(1703, 17, 'Kab. Bengkulu Utara'),
	(1704, 17, 'Kab. Kaur'),
	(1705, 17, 'Kab. Seluma'),
	(1706, 17, 'Kab. Mukomuko'),
	(1707, 17, 'Kab. Lebong'),
	(1708, 17, 'Kab. Kepahiang'),
	(1709, 17, 'Kab. Bengkulu Tengah'),
	(1771, 17, 'Kota Bengkulu'),
	(1801, 18, 'Kab. Lampung Barat'),
	(1802, 18, 'Kab. Tanggamus'),
	(1803, 18, 'Kab. Lampung Selatan'),
	(1804, 18, 'Kab. Lampung Timur'),
	(1805, 18, 'Kab. Lampung Tengah'),
	(1806, 18, 'Kab. Lampung Utara'),
	(1807, 18, 'Kab. Way Kanan'),
	(1808, 18, 'Kab. Tulangbawang'),
	(1809, 18, 'Kab. Pesawaran'),
	(1810, 18, 'Kab. Pringsewu'),
	(1811, 18, 'Kab. Mesuji'),
	(1812, 18, 'Kab. Tulang Bawang Barat'),
	(1813, 18, 'Kab. Pesisir Barat'),
	(1871, 18, 'Kota Bandar Lampung'),
	(1872, 18, 'Kota Metro'),
	(1901, 19, 'Kab. Bangka'),
	(1902, 19, 'Kab. Belitung'),
	(1903, 19, 'Kab. Bangka Barat'),
	(1904, 19, 'Kab. Bangka Tengah'),
	(1905, 19, 'Kab. Bangka Selatan'),
	(1906, 19, 'Kab. Belitung Timur'),
	(1971, 19, 'Kota Pangkal Pinang'),
	(2101, 21, 'Kab. Karimun'),
	(2102, 21, 'Kab. Bintan'),
	(2103, 21, 'Kab. Natuna'),
	(2104, 21, 'Kab. Lingga'),
	(2105, 21, 'Kab. Kepulauan Anambas'),
	(2171, 21, 'Kota B A T A M'),
	(2172, 21, 'Kota Tanjung Pinang'),
	(3101, 31, 'Kab. Kepulauan Seribu'),
	(3171, 31, 'Kota Jakarta Selatan'),
	(3172, 31, 'Kota Jakarta Timur'),
	(3173, 31, 'Kota Jakarta Pusat'),
	(3174, 31, 'Kota Jakarta Barat'),
	(3175, 31, 'Kota Jakarta Utara'),
	(3201, 32, 'Kab. Bogor'),
	(3202, 32, 'Kab. Sukabumi'),
	(3203, 32, 'Kab. Cianjur'),
	(3204, 32, 'Kab. Bandung'),
	(3205, 32, 'Kab. Garut'),
	(3206, 32, 'Kab. Tasikmalaya'),
	(3207, 32, 'Kab. Ciamis'),
	(3208, 32, 'Kab. Kuningan'),
	(3209, 32, 'Kab. Cirebon'),
	(3210, 32, 'Kab. Majalengka'),
	(3211, 32, 'Kab. Sumedang'),
	(3212, 32, 'Kab. Indramayu'),
	(3213, 32, 'Kab. Subang'),
	(3214, 32, 'Kab. Purwakarta'),
	(3215, 32, 'Kab. Karawang'),
	(3216, 32, 'Kab. Bekasi'),
	(3217, 32, 'Kab. Bandung Barat'),
	(3218, 32, 'Kab. Pangandaran'),
	(3271, 32, 'Kota Bogor'),
	(3272, 32, 'Kota Sukabumi'),
	(3273, 32, 'Kota Bandung'),
	(3274, 32, 'Kota Cirebon'),
	(3275, 32, 'Kota Bekasi'),
	(3276, 32, 'Kota Depok'),
	(3277, 32, 'Kota Cimahi'),
	(3278, 32, 'Kota Tasikmalaya'),
	(3279, 32, 'Kota Banjar'),
	(3301, 33, 'Kab. Cilacap'),
	(3302, 33, 'Kab. Banyumas'),
	(3303, 33, 'Kab. Purbalingga'),
	(3304, 33, 'Kab. Banjarnegara'),
	(3305, 33, 'Kab. Kebumen'),
	(3306, 33, 'Kab. Purworejo'),
	(3307, 33, 'Kab. Wonosobo'),
	(3308, 33, 'Kab. Magelang'),
	(3309, 33, 'Kab. Boyolali'),
	(3310, 33, 'Kab. Klaten'),
	(3311, 33, 'Kab. Sukoharjo'),
	(3312, 33, 'Kab. Wonogiri'),
	(3313, 33, 'Kab. Karanganyar'),
	(3314, 33, 'Kab. Sragen'),
	(3315, 33, 'Kab. Grobogan'),
	(3316, 33, 'Kab. Blora'),
	(3317, 33, 'Kab. Rembang'),
	(3318, 33, 'Kab. Pati'),
	(3319, 33, 'Kab. Kudus'),
	(3320, 33, 'Kab. Jepara'),
	(3321, 33, 'Kab. Demak'),
	(3322, 33, 'Kab. Semarang'),
	(3323, 33, 'Kab. Temanggung'),
	(3324, 33, 'Kab. Kendal'),
	(3325, 33, 'Kab. Batang'),
	(3326, 33, 'Kab. Pekalongan'),
	(3327, 33, 'Kab. Pemalang'),
	(3328, 33, 'Kab. Tegal'),
	(3329, 33, 'Kab. Brebes'),
	(3371, 33, 'Kota Magelang'),
	(3372, 33, 'Kota Surakarta'),
	(3373, 33, 'Kota Salatiga'),
	(3374, 33, 'Kota Semarang'),
	(3375, 33, 'Kota Pekalongan'),
	(3376, 33, 'Kota Tegal'),
	(3401, 34, 'Kab. Kulon Progo'),
	(3402, 34, 'Kab. Bantul'),
	(3403, 34, 'Kab. Gunung Kidul'),
	(3404, 34, 'Kab. Sleman'),
	(3471, 34, 'Kota Yogyakarta'),
	(3501, 35, 'Kab. Pacitan'),
	(3502, 35, 'Kab. Ponorogo'),
	(3503, 35, 'Kab. Trenggalek'),
	(3504, 35, 'Kab. Tulungagung'),
	(3505, 35, 'Kab. Blitar'),
	(3506, 35, 'Kab. Kediri'),
	(3507, 35, 'Kab. Malang'),
	(3508, 35, 'Kab. Lumajang'),
	(3509, 35, 'Kab. Jember'),
	(3510, 35, 'Kab. Banyuwangi'),
	(3511, 35, 'Kab. Bondowoso'),
	(3512, 35, 'Kab. Situbondo'),
	(3513, 35, 'Kab. Probolinggo'),
	(3514, 35, 'Kab. Pasuruan'),
	(3515, 35, 'Kab. Sidoarjo'),
	(3516, 35, 'Kab. Mojokerto'),
	(3517, 35, 'Kab. Jombang'),
	(3518, 35, 'Kab. Nganjuk'),
	(3519, 35, 'Kab. Madiun'),
	(3520, 35, 'Kab. Magetan'),
	(3521, 35, 'Kab. Ngawi'),
	(3522, 35, 'Kab. Bojonegoro'),
	(3523, 35, 'Kab. Tuban'),
	(3524, 35, 'Kab. Lamongan'),
	(3525, 35, 'Kab. Gresik'),
	(3526, 35, 'Kab. Bangkalan'),
	(3527, 35, 'Kab. Sampang'),
	(3528, 35, 'Kab. Pamekasan'),
	(3529, 35, 'Kab. Sumenep'),
	(3571, 35, 'Kota Kediri'),
	(3572, 35, 'Kota Blitar'),
	(3573, 35, 'Kota Malang'),
	(3574, 35, 'Kota Probolinggo'),
	(3575, 35, 'Kota Pasuruan'),
	(3576, 35, 'Kota Mojokerto'),
	(3577, 35, 'Kota Madiun'),
	(3578, 35, 'Kota Surabaya'),
	(3579, 35, 'Kota Batu'),
	(3601, 36, 'Kab. Pandeglang'),
	(3602, 36, 'Kab. Lebak'),
	(3603, 36, 'Kab. Tangerang'),
	(3604, 36, 'Kab. Serang'),
	(3671, 36, 'Kota Tangerang'),
	(3672, 36, 'Kota Cilegon'),
	(3673, 36, 'Kota Serang'),
	(3674, 36, 'Kota Tangerang Selatan'),
	(5101, 51, 'Kab. Jembrana'),
	(5102, 51, 'Kab. Tabanan'),
	(5103, 51, 'Kab. Badung'),
	(5104, 51, 'Kab. Gianyar'),
	(5105, 51, 'Kab. Klungkung'),
	(5106, 51, 'Kab. Bangli'),
	(5107, 51, 'Kab. Karang Asem'),
	(5108, 51, 'Kab. Buleleng'),
	(5171, 51, 'Kota Denpasar'),
	(5201, 52, 'Kab. Lombok Barat'),
	(5202, 52, 'Kab. Lombok Tengah'),
	(5203, 52, 'Kab. Lombok Timur'),
	(5204, 52, 'Kab. Sumbawa'),
	(5205, 52, 'Kab. Dompu'),
	(5206, 52, 'Kab. Bima'),
	(5207, 52, 'Kab. Sumbawa Barat'),
	(5208, 52, 'Kab. Lombok Utara'),
	(5271, 52, 'Kota Mataram'),
	(5272, 52, 'Kota Bima'),
	(5301, 53, 'Kab. Sumba Barat'),
	(5302, 53, 'Kab. Sumba Timur'),
	(5303, 53, 'Kab. Kupang'),
	(5304, 53, 'Kab. Timor Tengah Selatan'),
	(5305, 53, 'Kab. Timor Tengah Utara'),
	(5306, 53, 'Kab. Belu'),
	(5307, 53, 'Kab. Alor'),
	(5308, 53, 'Kab. Lembata'),
	(5309, 53, 'Kab. Flores Timur'),
	(5310, 53, 'Kab. Sikka'),
	(5311, 53, 'Kab. Ende'),
	(5312, 53, 'Kab. Ngada'),
	(5313, 53, 'Kab. Manggarai'),
	(5314, 53, 'Kab. Rote Ndao'),
	(5315, 53, 'Kab. Manggarai Barat'),
	(5316, 53, 'Kab. Sumba Tengah'),
	(5317, 53, 'Kab. Sumba Barat Daya'),
	(5318, 53, 'Kab. Nagekeo'),
	(5319, 53, 'Kab. Manggarai Timur'),
	(5320, 53, 'Kab. Sabu Raijua'),
	(5371, 53, 'Kota Kupang'),
	(6101, 61, 'Kab. Sambas'),
	(6102, 61, 'Kab. Bengkayang'),
	(6103, 61, 'Kab. Landak'),
	(6104, 61, 'Kab. Pontianak'),
	(6105, 61, 'Kab. Sanggau'),
	(6106, 61, 'Kab. Ketapang'),
	(6107, 61, 'Kab. Sintang'),
	(6108, 61, 'Kab. Kapuas Hulu'),
	(6109, 61, 'Kab. Sekadau'),
	(6110, 61, 'Kab. Melawi'),
	(6111, 61, 'Kab. Kayong Utara'),
	(6112, 61, 'Kab. Kubu Raya'),
	(6171, 61, 'Kota Pontianak'),
	(6172, 61, 'Kota Singkawang'),
	(6201, 62, 'Kab. Kotawaringin Barat'),
	(6202, 62, 'Kab. Kotawaringin Timur'),
	(6203, 62, 'Kab. Kapuas'),
	(6204, 62, 'Kab. Barito Selatan'),
	(6205, 62, 'Kab. Barito Utara'),
	(6206, 62, 'Kab. Sukamara'),
	(6207, 62, 'Kab. Lamandau'),
	(6208, 62, 'Kab. Seruyan'),
	(6209, 62, 'Kab. Katingan'),
	(6210, 62, 'Kab. Pulang Pisau'),
	(6211, 62, 'Kab. Gunung Mas'),
	(6212, 62, 'Kab. Barito Timur'),
	(6213, 62, 'Kab. Murung Raya'),
	(6271, 62, 'Kota Palangka Raya'),
	(6301, 63, 'Kab. Tanah Laut'),
	(6302, 63, 'Kab. Kota Baru'),
	(6303, 63, 'Kab. Banjar'),
	(6304, 63, 'Kab. Barito Kuala'),
	(6305, 63, 'Kab. Tapin'),
	(6306, 63, 'Kab. Hulu Sungai Selatan'),
	(6307, 63, 'Kab. Hulu Sungai Tengah'),
	(6308, 63, 'Kab. Hulu Sungai Utara'),
	(6309, 63, 'Kab. Tabalong'),
	(6310, 63, 'Kab. Tanah Bumbu'),
	(6311, 63, 'Kab. Balangan'),
	(6371, 63, 'Kota Banjarmasin'),
	(6372, 63, 'Kota Banjar Baru'),
	(6401, 64, 'Kab. Paser'),
	(6402, 64, 'Kab. Kutai Barat'),
	(6403, 64, 'Kab. Kutai Kartanegara'),
	(6404, 64, 'Kab. Kutai Timur'),
	(6405, 64, 'Kab. Berau'),
	(6409, 64, 'Kab. Penajam Paser Utara'),
	(6471, 64, 'Kota Balikpapan'),
	(6472, 64, 'Kota Samarinda'),
	(6474, 64, 'Kota Bontang'),
	(6501, 65, 'Kab. Malinau'),
	(6502, 65, 'Kab. Bulungan'),
	(6503, 65, 'Kab. Tana Tidung'),
	(6504, 65, 'Kab. Nunukan'),
	(6571, 65, 'Kota Tarakan'),
	(7101, 71, 'Kab. Bolaang Mongondow'),
	(7102, 71, 'Kab. Minahasa'),
	(7103, 71, 'Kab. Kepulauan Sangihe'),
	(7104, 71, 'Kab. Kepulauan Talaud'),
	(7105, 71, 'Kab. Minahasa Selatan'),
	(7106, 71, 'Kab. Minahasa Utara'),
	(7107, 71, 'Kab. Bolaang Mongondow Utara'),
	(7108, 71, 'Kab. Siau Tagulandang Biaro'),
	(7109, 71, 'Kab. Minahasa Tenggara'),
	(7110, 71, 'Kab. Bolaang Mongondow Selatan'),
	(7111, 71, 'Kab. Bolaang Mongondow Timur'),
	(7171, 71, 'Kota Manado'),
	(7172, 71, 'Kota Bitung'),
	(7173, 71, 'Kota Tomohon'),
	(7174, 71, 'Kota Kotamobagu'),
	(7201, 72, 'Kab. Banggai Kepulauan'),
	(7202, 72, 'Kab. Banggai'),
	(7203, 72, 'Kab. Morowali'),
	(7204, 72, 'Kab. Poso'),
	(7205, 72, 'Kab. Donggala'),
	(7206, 72, 'Kab. Toli-toli'),
	(7207, 72, 'Kab. Buol'),
	(7208, 72, 'Kab. Parigi Moutong'),
	(7209, 72, 'Kab. Tojo Una-una'),
	(7210, 72, 'Kab. Sigi'),
	(7271, 72, 'Kota Palu'),
	(7301, 73, 'Kab. Kepulauan Selayar'),
	(7302, 73, 'Kab. Bulukumba'),
	(7303, 73, 'Kab. Bantaeng'),
	(7304, 73, 'Kab. Jeneponto'),
	(7305, 73, 'Kab. Takalar'),
	(7306, 73, 'Kab. Gowa'),
	(7307, 73, 'Kab. Sinjai'),
	(7308, 73, 'Kab. Maros'),
	(7309, 73, 'Kab. Pangkajene Dan Kepulauan'),
	(7310, 73, 'Kab. Barru'),
	(7311, 73, 'Kab. Bone'),
	(7312, 73, 'Kab. Soppeng'),
	(7313, 73, 'Kab. Wajo'),
	(7314, 73, 'Kab. Sidenreng Rappang'),
	(7315, 73, 'Kab. Pinrang'),
	(7316, 73, 'Kab. Enrekang'),
	(7317, 73, 'Kab. Luwu'),
	(7318, 73, 'Kab. Tana Toraja'),
	(7322, 73, 'Kab. Luwu Utara'),
	(7325, 73, 'Kab. Luwu Timur'),
	(7326, 73, 'Kab. Toraja Utara'),
	(7371, 73, 'Kota Makassar'),
	(7372, 73, 'Kota Parepare'),
	(7373, 73, 'Kota Palopo'),
	(7401, 74, 'Kab. Buton'),
	(7402, 74, 'Kab. Muna'),
	(7403, 74, 'Kab. Konawe'),
	(7404, 74, 'Kab. Kolaka'),
	(7405, 74, 'Kab. Konawe Selatan'),
	(7406, 74, 'Kab. Bombana'),
	(7407, 74, 'Kab. Wakatobi'),
	(7408, 74, 'Kab. Kolaka Utara'),
	(7409, 74, 'Kab. Buton Utara'),
	(7410, 74, 'Kab. Konawe Utara'),
	(7471, 74, 'Kota Kendari'),
	(7472, 74, 'Kota Baubau'),
	(7501, 75, 'Kab. Boalemo'),
	(7502, 75, 'Kab. Gorontalo'),
	(7503, 75, 'Kab. Pohuwato'),
	(7504, 75, 'Kab. Bone Bolango'),
	(7505, 75, 'Kab. Gorontalo Utara'),
	(7571, 75, 'Kota Gorontalo'),
	(7601, 76, 'Kab. Majene'),
	(7602, 76, 'Kab. Polewali Mandar'),
	(7603, 76, 'Kab. Mamasa'),
	(7604, 76, 'Kab. Mamuju'),
	(7605, 76, 'Kab. Mamuju Utara'),
	(8101, 81, 'Kab. Maluku Tenggara Barat'),
	(8102, 81, 'Kab. Maluku Tenggara'),
	(8103, 81, 'Kab. Maluku Tengah'),
	(8104, 81, 'Kab. Buru'),
	(8105, 81, 'Kab. Kepulauan Aru'),
	(8106, 81, 'Kab. Seram Bagian Barat'),
	(8107, 81, 'Kab. Seram Bagian Timur'),
	(8108, 81, 'Kab. Maluku Barat Daya'),
	(8109, 81, 'Kab. Buru Selatan'),
	(8171, 81, 'Kota Ambon'),
	(8172, 81, 'Kota Tual'),
	(8201, 82, 'Kab. Halmahera Barat'),
	(8202, 82, 'Kab. Halmahera Tengah'),
	(8203, 82, 'Kab. Kepulauan Sula'),
	(8204, 82, 'Kab. Halmahera Selatan'),
	(8205, 82, 'Kab. Halmahera Utara'),
	(8206, 82, 'Kab. Halmahera Timur'),
	(8207, 82, 'Kab. Pulau Morotai'),
	(8271, 82, 'Kota Ternate'),
	(8272, 82, 'Kota Tidore Kepulauan'),
	(9101, 91, 'Kab. Fakfak'),
	(9102, 91, 'Kab. Kaimana'),
	(9103, 91, 'Kab. Teluk Wondama'),
	(9104, 91, 'Kab. Teluk Bintuni'),
	(9105, 91, 'Kab. Manokwari'),
	(9106, 91, 'Kab. Sorong Selatan'),
	(9107, 91, 'Kab. Sorong'),
	(9108, 91, 'Kab. Raja Ampat'),
	(9109, 91, 'Kab. Tambrauw'),
	(9110, 91, 'Kab. Maybrat'),
	(9171, 91, 'Kota Sorong'),
	(9401, 94, 'Kab. Merauke'),
	(9402, 94, 'Kab. Jayawijaya'),
	(9403, 94, 'Kab. Jayapura'),
	(9404, 94, 'Kab. Nabire'),
	(9408, 94, 'Kab. Kepulauan Yapen'),
	(9409, 94, 'Kab. Biak Numfor'),
	(9410, 94, 'Kab. Paniai'),
	(9411, 94, 'Kab. Puncak Jaya'),
	(9412, 94, 'Kab. Mimika'),
	(9413, 94, 'Kab. Boven Digoel'),
	(9414, 94, 'Kab. Mappi'),
	(9415, 94, 'Kab. Asmat'),
	(9416, 94, 'Kab. Yahukimo'),
	(9417, 94, 'Kab. Pegunungan Bintang'),
	(9418, 94, 'Kab. Tolikara'),
	(9419, 94, 'Kab. Sarmi'),
	(9420, 94, 'Kab. Keerom'),
	(9426, 94, 'Kab. Waropen'),
	(9427, 94, 'Kab. Supiori'),
	(9428, 94, 'Kab. Mamberamo Raya'),
	(9429, 94, 'Kab. Nduga'),
	(9430, 94, 'Kab. Lanny Jaya'),
	(9431, 94, 'Kab. Mamberamo Tengah'),
	(9432, 94, 'Kab. Yalimo'),
	(9433, 94, 'Kab. Puncak'),
	(9434, 94, 'Kab. Dogiyai'),
	(9435, 94, 'Kab. Intan Jaya'),
	(9436, 94, 'Kab. Deiyai'),
	(9471, 94, 'Kota Jayapura');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


-- Dumping structure for table hrms.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.country: ~2 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`country_id`, `country_val`) VALUES
	(1, 'Indonesia'),
	(2, 'Germany');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


-- Dumping structure for table hrms.education
DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `education_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.education: ~5 rows (approximately)
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` (`education_id`, `education_val`, `sort_id`) VALUES
	(1, 'Senior High School', 1),
	(2, 'College', 2),
	(3, 'Master', 4),
	(4, 'Ph.D', 5),
	(5, 'University', 3);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;


-- Dumping structure for table hrms.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) DEFAULT NULL,
  `employee_birthdate` date DEFAULT NULL,
  `employee_birthplace` varchar(50) DEFAULT NULL,
  `first_from` datetime DEFAULT NULL,
  `first_to` datetime DEFAULT NULL,
  `first_a_from` datetime DEFAULT NULL,
  `first_a_to` datetime DEFAULT NULL,
  `second_from` datetime DEFAULT NULL,
  `second_to` datetime DEFAULT NULL,
  `second_a_from` datetime DEFAULT NULL,
  `second_a_to` datetime DEFAULT NULL,
  `severance` varchar(50) DEFAULT NULL,
  `first_salary` decimal(10,0) DEFAULT NULL,
  `first_increment` decimal(10,0) DEFAULT NULL,
  `second_increment` decimal(10,0) DEFAULT NULL,
  `first_increment_date` datetime DEFAULT NULL,
  `second_increment_date` datetime DEFAULT NULL,
  `first_salary_date` datetime DEFAULT NULL,
  `first_increment_reason` datetime DEFAULT NULL,
  `second_increment_reason` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee: ~7 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`, `employee_name`, `employee_birthdate`, `employee_birthplace`, `first_from`, `first_to`, `first_a_from`, `first_a_to`, `second_from`, `second_to`, `second_a_from`, `second_a_to`, `severance`, `first_salary`, `first_increment`, `second_increment`, `first_increment_date`, `second_increment_date`, `first_salary_date`, `first_increment_reason`, `second_increment_reason`) VALUES
	(10, 'Amir', '2014-08-20', '', '2000-01-01 00:00:00', '2009-01-09 00:00:00', '2014-08-01 00:00:00', '2016-08-31 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'Meiyer', '2014-08-20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'Gail', '2014-08-20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'Raymond', '2014-08-20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'Kenneth', '2014-08-20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'Bruce', '2014-08-20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'Barry', '2014-08-20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_appraisal
DROP TABLE IF EXISTS `employee_appraisal`;
CREATE TABLE IF NOT EXISTS `employee_appraisal` (
  `employee_appraisal_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_name` varchar(100) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`employee_appraisal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_appraisal: ~0 rows (approximately)
/*!40000 ALTER TABLE `employee_appraisal` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_appraisal` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_diciplinary
DROP TABLE IF EXISTS `employee_diciplinary`;
CREATE TABLE IF NOT EXISTS `employee_diciplinary` (
  `employee_diciplinary_id` int(11) NOT NULL AUTO_INCREMENT,
  `diciplinary_name` varchar(100) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`employee_diciplinary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_diciplinary: ~0 rows (approximately)
/*!40000 ALTER TABLE `employee_diciplinary` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_diciplinary` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_history
DROP TABLE IF EXISTS `employee_history`;
CREATE TABLE IF NOT EXISTS `employee_history` (
  `employee_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_name` varchar(100) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`employee_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_history: ~13 rows (approximately)
/*!40000 ALTER TABLE `employee_history` DISABLE KEYS */;
INSERT INTO `employee_history` (`employee_history_id`, `history_name`, `employee_id`, `date_from`, `date_to`) VALUES
	(1, 'a', 10, '2014-08-20', '2014-08-20'),
	(2, 'a', 11, '2014-08-20', '2014-08-20'),
	(3, 'b', 11, '2014-08-20', '2014-08-20'),
	(4, 'a', 12, '2014-08-20', '2014-08-20'),
	(5, 'b', 12, '2014-08-20', '2014-08-20'),
	(6, 'a', 13, '2014-08-20', '2014-08-20'),
	(7, 'b', 13, '2014-08-20', '2014-08-20'),
	(8, 'a', 14, '2014-08-20', '2014-08-20'),
	(9, 'b', 14, '2014-08-20', '2014-08-20'),
	(10, 'a', 15, '2014-08-20', '2014-08-20'),
	(11, 'b', 15, '2014-08-20', '2014-08-20'),
	(12, 'a', 16, '2014-08-20', '2014-08-20'),
	(13, 'b', 16, '2014-08-01', '2014-08-20');
/*!40000 ALTER TABLE `employee_history` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_qualification
DROP TABLE IF EXISTS `employee_qualification`;
CREATE TABLE IF NOT EXISTS `employee_qualification` (
  `employee_qualification_id` int(11) NOT NULL AUTO_INCREMENT,
  `qualification_name` varchar(100) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`employee_qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_qualification: ~0 rows (approximately)
/*!40000 ALTER TABLE `employee_qualification` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_qualification` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_skill
DROP TABLE IF EXISTS `employee_skill`;
CREATE TABLE IF NOT EXISTS `employee_skill` (
  `employee_skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`employee_skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_skill: ~0 rows (approximately)
/*!40000 ALTER TABLE `employee_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_skill` ENABLE KEYS */;


-- Dumping structure for table hrms.employee_training
DROP TABLE IF EXISTS `employee_training`;
CREATE TABLE IF NOT EXISTS `employee_training` (
  `employee_training_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`employee_training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.employee_training: ~0 rows (approximately)
/*!40000 ALTER TABLE `employee_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_training` ENABLE KEYS */;


-- Dumping structure for table hrms.gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.gender: ~2 rows (approximately)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`gender_id`, `gender_val`) VALUES
	(1, 'Male'),
	(2, 'Female');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;


-- Dumping structure for table hrms.job_applied
DROP TABLE IF EXISTS `job_applied`;
CREATE TABLE IF NOT EXISTS `job_applied` (
  `job_applied_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_applied` datetime DEFAULT NULL,
  PRIMARY KEY (`job_applied_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.job_applied: ~2 rows (approximately)
/*!40000 ALTER TABLE `job_applied` DISABLE KEYS */;
INSERT INTO `job_applied` (`job_applied_id`, `vacancy_id`, `user_id`, `date_applied`) VALUES
	(25, 2, 5, '2014-10-23 00:25:09'),
	(26, 1, 5, '2014-10-23 00:25:20');
/*!40000 ALTER TABLE `job_applied` ENABLE KEYS */;


-- Dumping structure for table hrms.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.language: ~3 rows (approximately)
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`language_id`, `language_val`, `sort_id`) VALUES
	(1, 'Indonesian', 1),
	(2, 'English', 2),
	(3, 'German', 3);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;


-- Dumping structure for table hrms.language_skill
DROP TABLE IF EXISTS `language_skill`;
CREATE TABLE IF NOT EXISTS `language_skill` (
  `language_skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_skill_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`language_skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.language_skill: ~5 rows (approximately)
/*!40000 ALTER TABLE `language_skill` DISABLE KEYS */;
INSERT INTO `language_skill` (`language_skill_id`, `language_skill_val`, `sort_id`) VALUES
	(1, 'Mother Tongue', 1),
	(2, 'Advanced', 2),
	(3, 'Intermediate', 3),
	(4, 'Basic', 4),
	(5, 'None', 5);
/*!40000 ALTER TABLE `language_skill` ENABLE KEYS */;


-- Dumping structure for table hrms.month_options
DROP TABLE IF EXISTS `month_options`;
CREATE TABLE IF NOT EXISTS `month_options` (
  `month_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_id` int(11) DEFAULT NULL,
  `month_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`month_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.month_options: ~0 rows (approximately)
/*!40000 ALTER TABLE `month_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `month_options` ENABLE KEYS */;


-- Dumping structure for table hrms.m_role
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE IF NOT EXISTS `m_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_role: ~1 rows (approximately)
/*!40000 ALTER TABLE `m_role` DISABLE KEYS */;
INSERT INTO `m_role` (`role_id`, `role_name`, `role_description`) VALUES
	(1, 'applicant', NULL);
/*!40000 ALTER TABLE `m_role` ENABLE KEYS */;


-- Dumping structure for table hrms.m_user
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE IF NOT EXISTS `m_user` (
  `pwd` blob,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table hrms.m_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `m_user` DISABLE KEYS */;
INSERT INTO `m_user` (`pwd`, `user_id`, `user_name`) VALUES
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 5, 'a'),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 7, 'iskandar.tio@gmail.com');
/*!40000 ALTER TABLE `m_user` ENABLE KEYS */;


-- Dumping structure for table hrms.m_user_role
DROP TABLE IF EXISTS `m_user_role`;
CREATE TABLE IF NOT EXISTS `m_user_role` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_user_role: ~1 rows (approximately)
/*!40000 ALTER TABLE `m_user_role` DISABLE KEYS */;
INSERT INTO `m_user_role` (`role_id`, `user_id`) VALUES
	(1, 7);
/*!40000 ALTER TABLE `m_user_role` ENABLE KEYS */;


-- Dumping structure for table hrms.nationality
DROP TABLE IF EXISTS `nationality`;
CREATE TABLE IF NOT EXISTS `nationality` (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.nationality: ~2 rows (approximately)
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` (`nationality_id`, `nationality_val`) VALUES
	(1, 'Indonesia'),
	(2, 'Germany');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;


-- Dumping structure for table hrms.province
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.province: ~34 rows (approximately)
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` (`province_id`, `province_val`) VALUES
	(11, 'Aceh'),
	(12, 'Sumatera Utara'),
	(13, 'Sumatera Barat'),
	(14, 'Riau'),
	(15, 'Jambi'),
	(16, 'Sumatera Selatan'),
	(17, 'Bengkulu'),
	(18, 'Lampung'),
	(19, 'Kepulauan Bangka Belitung'),
	(21, 'Kepulauan Riau'),
	(31, 'Dki Jakarta'),
	(32, 'Jawa Barat'),
	(33, 'Jawa Tengah'),
	(34, 'Di Yogyakarta'),
	(35, 'Jawa Timur'),
	(36, 'Banten'),
	(51, 'Bali'),
	(52, 'Nusa Tenggara Barat'),
	(53, 'Nusa Tenggara Timur'),
	(61, 'Kalimantan Barat'),
	(62, 'Kalimantan Tengah'),
	(63, 'Kalimantan Selatan'),
	(64, 'Kalimantan Timur'),
	(65, 'Kalimantan Utara'),
	(71, 'Sulawesi Utara'),
	(72, 'Sulawesi Tengah'),
	(73, 'Sulawesi Selatan'),
	(74, 'Sulawesi Tenggara'),
	(75, 'Gorontalo'),
	(76, 'Sulawesi Barat'),
	(81, 'Maluku'),
	(82, 'Maluku Utara'),
	(91, 'Papua Barat'),
	(94, 'Papua');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;


-- Dumping structure for table hrms.question
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.question: ~2 rows (approximately)
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`question_id`, `question`) VALUES
	(1, 'Manage the team'),
	(2, 'Experiences on Capacity Building');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Dumping structure for table hrms.test
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `a` int(11) NOT NULL AUTO_INCREMENT,
  `b` int(11) DEFAULT NULL,
  PRIMARY KEY (`a`)
) ENGINE=InnoDB AUTO_INCREMENT=2457563 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.test: ~2,076,414 rows (approximately)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;


-- Dumping structure for table hrms.test2
DROP TABLE IF EXISTS `test2`;
IF NOT EXISTS ;

-- Dumping data for table hrms.test2: ~2,097,538 rows (approximately)
/*!40000 ALTER TABLE `test2` DISABLE KEYS */;


-- Dumping structure for table hrms.training
DROP TABLE IF EXISTS `training`;
CREATE TABLE IF NOT EXISTS `training` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.training: ~0 rows (approximately)
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
/*!40000 ALTER TABLE `training` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy
DROP TABLE IF EXISTS `vacancy`;
CREATE TABLE IF NOT EXISTS `vacancy` (
  `vacancy_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_code` varchar(50) DEFAULT NULL,
  `vacancy_name` varchar(50) DEFAULT NULL,
  `vacancy_start` datetime DEFAULT NULL,
  `vacancy_end` datetime DEFAULT NULL,
  `vacancy_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`vacancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy: ~2 rows (approximately)
/*!40000 ALTER TABLE `vacancy` DISABLE KEYS */;
INSERT INTO `vacancy` (`vacancy_id`, `vacancy_code`, `vacancy_name`, `vacancy_start`, `vacancy_end`, `vacancy_description`) VALUES
	(1, 'IT', 'IT Programmer', '2014-10-01 00:00:00', '2014-10-31 00:00:00', NULL),
	(2, 'ACT', 'Accounting', '2014-10-01 00:00:00', '2014-10-31 00:00:00', NULL);
/*!40000 ALTER TABLE `vacancy` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_question
DROP TABLE IF EXISTS `vacancy_question`;
CREATE TABLE IF NOT EXISTS `vacancy_question` (
  `vacancy_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `vacancy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vacancy_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_question: ~3 rows (approximately)
/*!40000 ALTER TABLE `vacancy_question` DISABLE KEYS */;
INSERT INTO `vacancy_question` (`vacancy_question_id`, `question_id`, `vacancy_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 2, 2);
/*!40000 ALTER TABLE `vacancy_question` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
