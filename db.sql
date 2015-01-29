-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.28a-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2015-01-29 09:16:06
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
  `country_name` varchar(50) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `letter` varchar(100) DEFAULT NULL,
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
  PRIMARY KEY (`applicants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.applicants: ~11 rows (approximately)
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` (`first_name`, `last_name`, `place_of_birth`, `gender`, `nationality`, `address`, `country`, `province`, `city`, `post_code`, `phone1`, `phone2`, `giz_staff`, `computer_skills`, `professional_skills`, `applicants_id`, `user_id`, `date_of_birth`, `country_name`, `cv`, `letter`, `applicant_status`, `nationality_val`, `contract1_start_date`, `contract1_end_date`, `am1_start_date`, `am1_end_date`, `contract2_start_date`, `contract2_end_date`, `am2_start_date`, `am2_end_date`) VALUES
	('admin', 'a', NULL, 'Female', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, '1930-12-04 21:31:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;


-- Dumping structure for table hrms.applicants_answer
DROP TABLE IF EXISTS `applicants_answer`;
CREATE TABLE IF NOT EXISTS `applicants_answer` (
  `applicant_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_applied_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `choice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`applicant_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;


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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;


-- Dumping structure for table hrms.applicants_language
DROP TABLE IF EXISTS `applicants_language`;
CREATE TABLE IF NOT EXISTS `applicants_language` (
  `applicants_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(50) DEFAULT NULL,
  `language_skill_id` int(50) DEFAULT NULL,
  `language_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`applicants_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;



-- Dumping structure for table hrms.applicants_other_language
DROP TABLE IF EXISTS `applicants_other_language`;
CREATE TABLE IF NOT EXISTS `applicants_other_language` (
  `applicants_other_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_skill_id` int(50) DEFAULT NULL,
  `language_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`applicants_other_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;



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
  PRIMARY KEY (`applicants_other_reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`applicants_reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


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
  PRIMARY KEY (`applicants_working_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


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
  `choice_val` varchar(1000) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

-- Dumping structure for table hrms.city
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `city_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.city: ~397 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`city_id`, `province_id`, `city_val`) VALUES
	(1, 11, 'Simeulue'),
	(2, 11, 'Aceh Singkil'),
	(3, 11, 'Aceh Selatan'),
	(4, 11, 'Aceh Tenggara'),
	(5, 11, 'Aceh Timur'),
	(6, 11, 'Aceh Tengah'),
	(7, 11, 'Aceh Barat'),
	(8, 11, 'Aceh Besar'),
	(9, 11, 'Pidie'),
	(10, 11, 'Bireuen'),
	(11, 11, 'Aceh Utara'),
	(12, 11, 'Aceh Barat Daya'),
	(13, 11, 'Gayo Lues'),
	(14, 11, 'Aceh Tamiang'),
	(15, 11, 'Nagan Raya'),
	(16, 11, 'Aceh Jaya'),
	(17, 11, 'Bener Meriah'),
	(18, 11, 'Pidie Jaya'),
	(19, 11, 'Banda Aceh'),
	(20, 11, 'Sabang'),
	(21, 11, 'Langsa'),
	(22, 11, 'Lhokseumawe'),
	(23, 11, 'Subulussalam'),
	(24, 12, 'Nias'),
	(25, 12, 'Mandailing Natal'),
	(26, 12, 'Tapanuli Selatan'),
	(27, 12, 'Tapanuli Tengah'),
	(28, 12, 'Tapanuli Utara'),
	(29, 12, 'Toba Samosir'),
	(30, 12, 'Labuhan Batu'),
	(31, 12, 'Asahan'),
	(32, 12, 'Simalungun'),
	(33, 12, 'Dairi'),
	(34, 12, 'Karo'),
	(35, 12, 'Deli Serdang'),
	(36, 12, 'Langkat'),
	(37, 12, 'Nias Selatan'),
	(38, 12, 'Humbang Hasundutan'),
	(39, 12, 'Pakpak Bharat'),
	(40, 12, 'Samosir'),
	(41, 12, 'Serdang Bedagai'),
	(42, 12, 'Batu Bara'),
	(43, 12, 'Padang Lawas Utara'),
	(44, 12, 'Padang Lawas'),
	(45, 12, 'Labuhan Batu Selatan'),
	(46, 12, 'Labuhan Batu Utara'),
	(47, 12, 'Nias Utara'),
	(48, 12, 'Nias Barat'),
	(49, 12, 'Sibolga'),
	(50, 12, 'Tanjung Balai'),
	(51, 12, 'Pematang Siantar'),
	(52, 12, 'Tebing Tinggi'),
	(53, 12, 'Medan'),
	(54, 12, 'Binjai'),
	(55, 12, 'Padangsidimpuan'),
	(56, 12, 'Gunungsitoli'),
	(57, 13, 'Kepulauan Mentawai'),
	(58, 13, 'Pesisir Selatan'),
	(59, 13, 'Solok'),
	(60, 13, 'Sijunjung'),
	(61, 13, 'Tanah Datar'),
	(62, 13, 'Padang Pariaman'),
	(63, 13, 'Agam'),
	(64, 13, 'Lima Puluh Kota'),
	(65, 13, 'Pasaman'),
	(66, 13, 'Solok Selatan'),
	(67, 13, 'Dharmasraya'),
	(68, 13, 'Pasaman Barat'),
	(69, 13, 'Padang'),
	(70, 13, 'Sawah Lunto'),
	(71, 13, 'Padang Panjang'),
	(72, 13, 'Bukittinggi'),
	(73, 13, 'Payakumbuh'),
	(74, 13, 'Pariaman'),
	(75, 14, 'Kuantan Singingi'),
	(76, 14, 'Indragiri Hulu'),
	(77, 14, 'Indragiri Hilir'),
	(78, 14, 'Pelalawan'),
	(79, 14, 'S I A K'),
	(80, 14, 'Kampar'),
	(81, 14, 'Rokan Hulu'),
	(82, 14, 'Bengkalis'),
	(83, 14, 'Rokan Hilir'),
	(84, 14, 'Kepulauan Meranti'),
	(85, 14, 'Pekanbaru'),
	(86, 14, 'D U M A I'),
	(87, 15, 'Kerinci'),
	(88, 15, 'Merangin'),
	(89, 15, 'Sarolangun'),
	(90, 15, 'Batang Hari'),
	(91, 15, 'Muaro Jambi'),
	(92, 15, 'Tanjung Jabung Timur'),
	(93, 15, 'Tanjung Jabung Barat'),
	(94, 15, 'Tebo'),
	(95, 15, 'Bungo'),
	(96, 15, 'Jambi'),
	(97, 15, 'Sungai Penuh'),
	(98, 16, 'Ogan Komering Ulu'),
	(99, 16, 'Ogan Komering Ilir'),
	(100, 16, 'Muara Enim'),
	(101, 16, 'Lahat'),
	(102, 16, 'Musi Rawas'),
	(103, 16, 'Musi Banyuasin'),
	(104, 16, 'Banyu Asin'),
	(105, 16, 'Ogan Komering Ulu Selatan'),
	(106, 16, 'Ogan Komering Ulu Timur'),
	(107, 16, 'Ogan Ilir'),
	(108, 16, 'Empat Lawang'),
	(109, 16, 'Palembang'),
	(110, 16, 'Prabumulih'),
	(111, 16, 'Pagar Alam'),
	(112, 16, 'Lubuklinggau'),
	(113, 17, 'Bengkulu Selatan'),
	(114, 17, 'Rejang Lebong'),
	(115, 17, 'Bengkulu Utara'),
	(116, 17, 'Kaur'),
	(117, 17, 'Seluma'),
	(118, 17, 'Mukomuko'),
	(119, 17, 'Lebong'),
	(120, 17, 'Kepahiang'),
	(121, 17, 'Bengkulu Tengah'),
	(122, 17, 'Bengkulu'),
	(123, 18, 'Lampung Barat'),
	(124, 18, 'Tanggamus'),
	(125, 18, 'Lampung Selatan'),
	(126, 18, 'Lampung Timur'),
	(127, 18, 'Lampung Tengah'),
	(128, 18, 'Lampung Utara'),
	(129, 18, 'Way Kanan'),
	(130, 18, 'Tulangbawang'),
	(131, 18, 'Pesawaran'),
	(132, 18, 'Pringsewu'),
	(133, 18, 'Mesuji'),
	(134, 18, 'Tulang Bawang Barat'),
	(135, 18, 'Pesisir Barat'),
	(136, 18, 'Bandar Lampung'),
	(137, 18, 'Metro'),
	(138, 19, 'Bangka'),
	(139, 19, 'Belitung'),
	(140, 19, 'Bangka Barat'),
	(141, 19, 'Bangka Tengah'),
	(142, 19, 'Bangka Selatan'),
	(143, 19, 'Belitung Timur'),
	(144, 19, 'Pangkal Pinang'),
	(145, 21, 'Karimun'),
	(146, 21, 'Bintan'),
	(147, 21, 'Natuna'),
	(148, 21, 'Lingga'),
	(149, 21, 'Kepulauan Anambas'),
	(150, 21, 'B A T A M'),
	(151, 21, 'Tanjung Pinang'),
	(152, 31, 'Kepulauan Seribu'),
	(153, 31, 'Jakarta Selatan'),
	(154, 31, 'Jakarta Timur'),
	(155, 31, 'Jakarta Pusat'),
	(156, 31, 'Jakarta Barat'),
	(157, 31, 'Jakarta Utara'),
	(158, 32, 'Bogor'),
	(159, 32, 'Sukabumi'),
	(160, 32, 'Cianjur'),
	(161, 32, 'Bandung'),
	(162, 32, 'Garut'),
	(163, 32, 'Tasikmalaya'),
	(164, 32, 'Ciamis'),
	(165, 32, 'Kuningan'),
	(166, 32, 'Cirebon'),
	(167, 32, 'Majalengka'),
	(168, 32, 'Sumedang'),
	(169, 32, 'Indramayu'),
	(170, 32, 'Subang'),
	(171, 32, 'Purwakarta'),
	(172, 32, 'Karawang'),
	(173, 32, 'Bekasi'),
	(174, 32, 'Bandung Barat'),
	(175, 32, 'Pangandaran'),
	(176, 32, 'Depok'),
	(177, 32, 'Cimahi'),
	(178, 32, 'Banjar'),
	(179, 33, 'Cilacap'),
	(180, 33, 'Banyumas'),
	(181, 33, 'Purbalingga'),
	(182, 33, 'Banjarnegara'),
	(183, 33, 'Kebumen'),
	(184, 33, 'Purworejo'),
	(185, 33, 'Wonosobo'),
	(186, 33, 'Magelang'),
	(187, 33, 'Boyolali'),
	(188, 33, 'Klaten'),
	(189, 33, 'Sukoharjo'),
	(190, 33, 'Wonogiri'),
	(191, 33, 'Karanganyar'),
	(192, 33, 'Sragen'),
	(193, 33, 'Grobogan'),
	(194, 33, 'Blora'),
	(195, 33, 'Rembang'),
	(196, 33, 'Pati'),
	(197, 33, 'Kudus'),
	(198, 33, 'Jepara'),
	(199, 33, 'Demak'),
	(200, 33, 'Semarang'),
	(201, 33, 'Temanggung'),
	(202, 33, 'Kendal'),
	(203, 33, 'Batang'),
	(204, 33, 'Pekalongan'),
	(205, 33, 'Pemalang'),
	(206, 33, 'Tegal'),
	(207, 33, 'Brebes'),
	(208, 33, 'Surakarta'),
	(209, 33, 'Salatiga'),
	(210, 34, 'Kulon Progo'),
	(211, 34, 'Bantul'),
	(212, 34, 'Gunung Kidul'),
	(213, 34, 'Sleman'),
	(214, 34, 'Yogyakarta'),
	(215, 35, 'Pacitan'),
	(216, 35, 'Ponorogo'),
	(217, 35, 'Trenggalek'),
	(218, 35, 'Tulungagung'),
	(219, 35, 'Blitar'),
	(220, 35, 'Kediri'),
	(221, 35, 'Malang'),
	(222, 35, 'Lumajang'),
	(223, 35, 'Jember'),
	(224, 35, 'Banyuwangi'),
	(225, 35, 'Bondowoso'),
	(226, 35, 'Situbondo'),
	(227, 35, 'Probolinggo'),
	(228, 35, 'Pasuruan'),
	(229, 35, 'Sidoarjo'),
	(230, 35, 'Mojokerto'),
	(231, 35, 'Jombang'),
	(232, 35, 'Nganjuk'),
	(233, 35, 'Madiun'),
	(234, 35, 'Magetan'),
	(235, 35, 'Ngawi'),
	(236, 35, 'Bojonegoro'),
	(237, 35, 'Tuban'),
	(238, 35, 'Lamongan'),
	(239, 35, 'Gresik'),
	(240, 35, 'Bangkalan'),
	(241, 35, 'Sampang'),
	(242, 35, 'Pamekasan'),
	(243, 35, 'Sumenep'),
	(244, 35, 'Surabaya'),
	(245, 35, 'Batu'),
	(246, 36, 'Pandeglang'),
	(247, 36, 'Lebak'),
	(248, 36, 'Tangerang'),
	(249, 36, 'Serang'),
	(250, 36, 'Cilegon'),
	(251, 36, 'Tangerang Selatan'),
	(252, 51, 'Jembrana'),
	(253, 51, 'Tabanan'),
	(254, 51, 'Badung'),
	(255, 51, 'Gianyar'),
	(256, 51, 'Klungkung'),
	(257, 51, 'Bangli'),
	(258, 51, 'Karang Asem'),
	(259, 51, 'Buleleng'),
	(260, 51, 'Denpasar'),
	(261, 52, 'Lombok Barat'),
	(262, 52, 'Lombok Tengah'),
	(263, 52, 'Lombok Timur'),
	(264, 52, 'Sumbawa'),
	(265, 52, 'Dompu'),
	(266, 52, 'Bima'),
	(267, 52, 'Sumbawa Barat'),
	(268, 52, 'Lombok Utara'),
	(269, 52, 'Mataram'),
	(270, 53, 'Sumba Barat'),
	(271, 53, 'Sumba Timur'),
	(272, 53, 'Kupang'),
	(273, 53, 'Timor Tengah Selatan'),
	(274, 53, 'Timor Tengah Utara'),
	(275, 53, 'Belu'),
	(276, 53, 'Alor'),
	(277, 53, 'Lembata'),
	(278, 53, 'Flores Timur'),
	(279, 53, 'Sikka'),
	(280, 53, 'Ende'),
	(281, 53, 'Ngada'),
	(282, 53, 'Manggarai'),
	(283, 53, 'Rote Ndao'),
	(284, 53, 'Manggarai Barat'),
	(285, 53, 'Sumba Tengah'),
	(286, 53, 'Sumba Barat Daya'),
	(287, 53, 'Nagekeo'),
	(288, 53, 'Manggarai Timur'),
	(289, 53, 'Sabu Raijua'),
	(290, 61, 'Sambas'),
	(291, 61, 'Bengkayang'),
	(292, 61, 'Landak'),
	(293, 61, 'Pontianak'),
	(294, 61, 'Sanggau'),
	(295, 61, 'Ketapang'),
	(296, 61, 'Sintang'),
	(297, 61, 'Kapuas Hulu'),
	(298, 61, 'Sekadau'),
	(299, 61, 'Melawi'),
	(300, 61, 'Kayong Utara'),
	(301, 61, 'Kubu Raya'),
	(302, 61, 'Singkawang'),
	(303, 62, 'Kotawaringin Barat'),
	(304, 62, 'Kotawaringin Timur'),
	(305, 62, 'Kapuas'),
	(306, 62, 'Barito Selatan'),
	(307, 62, 'Barito Utara'),
	(308, 62, 'Sukamara'),
	(309, 62, 'Lamandau'),
	(310, 62, 'Seruyan'),
	(311, 62, 'Katingan'),
	(312, 62, 'Pulang Pisau'),
	(313, 62, 'Gunung Mas'),
	(314, 62, 'Barito Timur'),
	(315, 62, 'Murung Raya'),
	(316, 62, 'Palangka Raya'),
	(317, 63, 'Tanah Laut'),
	(318, 63, 'Baru'),
	(319, 63, 'Banjar'),
	(320, 63, 'Barito Kuala'),
	(321, 63, 'Tapin'),
	(322, 63, 'Hulu Sungai Selatan'),
	(323, 63, 'Hulu Sungai Tengah'),
	(324, 63, 'Hulu Sungai Utara'),
	(325, 63, 'Tabalong'),
	(326, 63, 'Tanah Bumbu'),
	(327, 63, 'Balangan'),
	(328, 63, 'Banjarmasin'),
	(329, 63, 'Banjar Baru'),
	(330, 64, 'Paser'),
	(331, 64, 'Kutai Barat'),
	(332, 64, 'Kutai Kartanegara'),
	(333, 64, 'Kutai Timur'),
	(334, 64, 'Berau'),
	(335, 64, 'Penajam Paser Utara'),
	(336, 64, 'Balikpapan'),
	(337, 64, 'Samarinda'),
	(338, 64, 'Bontang'),
	(339, 65, 'Malinau'),
	(340, 65, 'Bulungan'),
	(341, 65, 'Tana Tidung'),
	(342, 65, 'Nunukan'),
	(343, 65, 'Tarakan'),
	(344, 71, 'Bolaang Mongondow'),
	(345, 71, 'Minahasa'),
	(346, 71, 'Kepulauan Sangihe'),
	(347, 71, 'Kepulauan Talaud'),
	(348, 71, 'Minahasa Selatan'),
	(349, 71, 'Minahasa Utara'),
	(350, 71, 'Bolaang Mongondow Utara'),
	(351, 71, 'Siau Tagulandang Biaro'),
	(352, 71, 'Minahasa Tenggara'),
	(353, 71, 'Bolaang Mongondow Selatan'),
	(354, 71, 'Bolaang Mongondow Timur'),
	(355, 71, 'Manado'),
	(356, 71, 'Bitung'),
	(357, 71, 'Tomohon'),
	(358, 71, 'Kotamobagu'),
	(359, 72, 'Banggai Kepulauan'),
	(360, 72, 'Banggai'),
	(361, 72, 'Morowali'),
	(362, 72, 'Poso'),
	(363, 72, 'Donggala'),
	(364, 72, 'Toli-toli'),
	(365, 72, 'Buol'),
	(366, 72, 'Parigi Moutong'),
	(367, 72, 'Tojo Una-una'),
	(368, 72, 'Sigi'),
	(369, 72, 'Palu'),
	(370, 73, 'Kepulauan Selayar'),
	(371, 73, 'Bulukumba'),
	(372, 73, 'Bantaeng'),
	(373, 73, 'Jeneponto'),
	(374, 73, 'Takalar'),
	(375, 73, 'Gowa'),
	(376, 73, 'Sinjai'),
	(377, 73, 'Maros'),
	(378, 73, 'Pangkajene Dan Kepulauan'),
	(379, 73, 'Barru'),
	(380, 73, 'Bone'),
	(381, 73, 'Soppeng'),
	(382, 73, 'Wajo'),
	(383, 73, 'Sidenreng Rappang'),
	(384, 73, 'Pinrang'),
	(385, 73, 'Enrekang'),
	(386, 73, 'Luwu'),
	(387, 73, 'Tana Toraja'),
	(388, 73, 'Luwu Utara'),
	(389, 73, 'Luwu Timur'),
	(390, 73, 'Toraja Utara'),
	(391, 73, 'Makassar'),
	(392, 73, 'Parepare'),
	(393, 73, 'Palopo'),
	(394, 74, 'Buton'),
	(395, 74, 'Muna'),
	(396, 74, 'Konawe'),
	(397, 74, 'Kolaka'),
	(398, 74, 'Konawe Selatan'),
	(399, 74, 'Bombana'),
	(400, 74, 'Wakatobi'),
	(401, 74, 'Kolaka Utara'),
	(402, 74, 'Buton Utara'),
	(403, 74, 'Konawe Utara'),
	(404, 74, 'Kendari'),
	(405, 74, 'Baubau'),
	(406, 75, 'Boalemo'),
	(407, 75, 'Gorontalo'),
	(408, 75, 'Pohuwato'),
	(409, 75, 'Bone Bolango'),
	(410, 75, 'Gorontalo Utara'),
	(411, 76, 'Majene'),
	(412, 76, 'Polewali Mandar'),
	(413, 76, 'Mamasa'),
	(414, 76, 'Mamuju'),
	(415, 76, 'Mamuju Utara'),
	(416, 81, 'Maluku Tenggara Barat'),
	(417, 81, 'Maluku Tenggara'),
	(418, 81, 'Maluku Tengah'),
	(419, 81, 'Buru'),
	(420, 81, 'Kepulauan Aru'),
	(421, 81, 'Seram Bagian Barat'),
	(422, 81, 'Seram Bagian Timur'),
	(423, 81, 'Maluku Barat Daya'),
	(424, 81, 'Buru Selatan'),
	(425, 81, 'Ambon'),
	(426, 81, 'Tual'),
	(427, 82, 'Halmahera Barat'),
	(428, 82, 'Halmahera Tengah'),
	(429, 82, 'Kepulauan Sula'),
	(430, 82, 'Halmahera Selatan'),
	(431, 82, 'Halmahera Utara'),
	(432, 82, 'Halmahera Timur'),
	(433, 82, 'Pulau Morotai'),
	(434, 82, 'Ternate'),
	(435, 82, 'Tidore Kepulauan'),
	(436, 91, 'Fakfak'),
	(437, 91, 'Kaimana'),
	(438, 91, 'Teluk Wondama'),
	(439, 91, 'Teluk Bintuni'),
	(440, 91, 'Manokwari'),
	(441, 91, 'Sorong Selatan'),
	(442, 91, 'Sorong'),
	(443, 91, 'Raja Ampat'),
	(444, 91, 'Tambrauw'),
	(445, 91, 'Maybrat'),
	(446, 94, 'Merauke'),
	(447, 94, 'Jayawijaya'),
	(448, 94, 'Jayapura'),
	(449, 94, 'Nabire'),
	(450, 94, 'Kepulauan Yapen'),
	(451, 94, 'Biak Numfor'),
	(452, 94, 'Paniai'),
	(453, 94, 'Puncak Jaya'),
	(454, 94, 'Mimika'),
	(455, 94, 'Boven Digoel'),
	(456, 94, 'Mappi'),
	(457, 94, 'Asmat'),
	(458, 94, 'Yahukimo'),
	(459, 94, 'Pegunungan Bintang'),
	(460, 94, 'Tolikara'),
	(461, 94, 'Sarmi'),
	(462, 94, 'Keerom'),
	(463, 94, 'Waropen'),
	(464, 94, 'Supiori'),
	(465, 94, 'Mamberamo Raya'),
	(466, 94, 'Nduga'),
	(467, 94, 'Lanny Jaya'),
	(468, 94, 'Mamberamo Tengah'),
	(469, 94, 'Yalimo'),
	(470, 94, 'Puncak'),
	(471, 94, 'Dogiyai'),
	(472, 94, 'Intan Jaya'),
	(473, 94, 'Deiyai');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


-- Dumping structure for table hrms.contract_history
DROP TABLE IF EXISTS `contract_history`;
CREATE TABLE IF NOT EXISTS `contract_history` (
  `contract_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `contract_status` int(11) DEFAULT '0',
  `salary_band` varchar(50) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `project_number` varchar(50) DEFAULT NULL,
  `principal_advisor` varchar(50) DEFAULT NULL,
  `team_leader` varchar(50) DEFAULT NULL,
  `project_location` varchar(50) DEFAULT NULL,
  `responsible_superior` varchar(50) DEFAULT NULL,
  `SAP_No` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`contract_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;


-- Dumping structure for table hrms.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_val` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.country: ~1 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`country_id`, `country_val`) VALUES
	(1, 'Indonesia');
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
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;



-- Dumping structure for table hrms.email_setup
DROP TABLE IF EXISTS `email_setup`;
CREATE TABLE IF NOT EXISTS `email_setup` (
  `email_type` varchar(50) NOT NULL,
  `email_from` varchar(50) DEFAULT NULL,
  `email_to` varchar(50) DEFAULT NULL,
  `email_cc` varchar(50) DEFAULT NULL,
  `email_bcc` varchar(50) DEFAULT NULL,
  `email_subject` varchar(50) DEFAULT NULL,
  `email_content` varchar(5000) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `email_setup_id` int(11) NOT NULL AUTO_INCREMENT,
  `params` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`email_setup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.email_setup: ~8 rows (approximately)
/*!40000 ALTER TABLE `email_setup` DISABLE KEYS */;
INSERT INTO `email_setup` (`email_type`, `email_from`, `email_to`, `email_cc`, `email_bcc`, `email_subject`, `email_content`, `updatetime`, `email_setup_id`, `params`) VALUES
	('forgot_password', NULL, '@email', NULL, NULL, '[GIZ e-recruitment] Forgot Password', 'Your password is resetted to @password', NULL, 1, NULL),
	('register', 'iskandar.tio@gmail.com', '@email', NULL, NULL, 'Account Activation', 'Your password is: @password\r\nPlease activate by clicking this link: <br/>\r\nhttp://localhost:8081/gizhrms/activate.php?link=@link', NULL, 2, NULL),
	('invitation_5', NULL, 'idjsaioj', NULL, NULL, 'dsjaio', '<p>s<strong>s</strong></p>', NULL, 3, NULL),
	('rejection_5', NULL, 'jidosa', NULL, NULL, 'djsio', '<p>jfdsiofjds jfiods</p>', NULL, 4, NULL),
	('invitation_1', NULL, '@applicant_email', NULL, NULL, 'First Interview', '<p>Thank you for applying.&nbsp;<br></p><p>You are selected for interview</p><p>Place: @interview_date</p><p>Time: @interview_time</p><p>Location: @interview_location</p><p>Regards,</p><p><br data-mce-bogus="1"></p>', NULL, 5, '@applicant_email, @applicant_name, @vacancy_name, @interview_date, @interview_time, @interview_location, @interviewer'),
	('rejection_2', NULL, 'iskandar.tio@gmail.com', NULL, NULL, '[GIZ] @vacancy_name', '<div><strong>Dear @applicant_name,</strong></div><div><strong>&nbsp;</strong></div><div><strong>Thank you very much for taking the time to interview with us for the @vacancy_name&nbsp;position in our organization. We appreciate your interest in PAKLIM and the job.</strong></div><div><strong>&nbsp;</strong></div><div><strong>I am writing to inform you that we have selected the candidate whom we believe most closely matches the job requirements of the position.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We do appreciate you taking the time to interview with us.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Again, thank you for your time.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%207186&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%207186&quot;&quot;&quot;&quot;">+62 21 851 7186</a></strong></div><div><strong>F <a href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%206110&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;tel:%2B62%2021%20851%206110&quot;&quot;&quot;&quot;">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="&quot;&quot;&quot;&quot;mailto:fitri.kusumayanti@giz.de&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;mailto:fitri.kusumayanti@giz.de&quot;&quot;&quot;&quot;">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="&quot;&quot;&quot;&quot;http://www.paklim.or.id/&quot;&quot;&quot;&quot;" data-mce-href="&quot;&quot;&quot;&quot;http://www.paklim.or.id/&quot;&quot;&quot;&quot;">www.paklim.org</a></strong></div>', NULL, 6, '@applicant_email, @vacancy_name, @applicant_name'),
	('invitation_2', NULL, 'iskandar.tio@gmail.com', NULL, NULL, '[GIZ] Interview Invitation', '<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>We </strong><strong>would like to invite you to attend an interview </strong><strong>for @vacancy_name&nbsp;position as attached job description </strong><strong>o</strong><strong>n @interview_date</strong><strong>&nbsp;</strong><strong>a</strong><strong>t @interview_time.</strong></div><div><strong>&nbsp;</strong></div><div><strong>@interview_location</strong><br></div><div><strong>&nbsp;</strong></div><div><strong>You will have the interview with @interviewer.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Please confirm your availability for the interview.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong><br>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></strong></div><div><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></strong></div><div>&nbsp;</div>', NULL, 7, '@applicant_email, @applicant_name, @vacancy_name, @interview_date, @interview_time, @interview_location, @interviewer'),
	('invitation_3', NULL, 'iskandar.tio@gmail.com', NULL, NULL, '[GIZ] Interview Invitation @vacancy_name', '<div><strong>Dear @applicant_name,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></div><div><strong>We </strong><strong>would like to invite you to attend an interview </strong><strong>for @vacancy_name&nbsp;position as attached job description </strong><strong>o</strong><strong>n @interview_date</strong><strong>&nbsp;</strong><strong>a</strong><strong>t @interview_time.</strong></div><div><strong>&nbsp;</strong></div><div><strong>@interview_location</strong><br></div><div><strong>&nbsp;</strong></div><div><strong>You will have the interview with @interviewer.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Please confirm your availability for the interview.</strong></div><div><strong>&nbsp;</strong></div><div><strong>We look forward to meeting you.</strong></div><div><strong>&nbsp;</strong></div><div><strong>Best Regards,</strong></div><div><strong>&nbsp;</strong></div><div><strong><br>Fitri Kusumayanti</strong></div><div><strong>HR Professional</strong></div><div><strong>PAKLIM - </strong><strong>Policy Advice for Environment and Climate Change</strong></div><div><strong>Program Advis Kebijakan untuk Lingkungan Hidup dan Perubahan Iklim</strong></div><div><strong>&nbsp;</strong></div><div><strong>Deutsche Gesellschaft fÃ¼r</strong></div><div><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></div><div><strong>c/o Kementerian Negara Lingkungan Hidup (KLH)</strong></div><div><strong>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</strong></div><div><strong>13410 Jakarta, Indonesia</strong></div><div><strong>T <a href="tel:%2B62%2021%20851%207186" data-mce-href="tel:%2B62%2021%20851%207186">+62 21 851 7186</a></strong></div><div><strong>F <a href="tel:%2B62%2021%20851%206110" data-mce-href="tel:%2B62%2021%20851%206110">+62 21 851 6110</a></strong></div><div><strong>M +62 8129 5346 045</strong></div><div><strong>E </strong><strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de">fitri.kusumayanti@giz.de</a></strong></div><div><strong><a href="http://www.paklim.or.id/" data-mce-href="http://www.paklim.or.id/">www.paklim.org</a></strong></div><div>&nbsp;</div>', NULL, 8, NULL),
	('interviewer_1', NULL, '@interviewer_email', NULL, NULL, 'Interview', '<p>Here is the list:</p><p>@list</p><p>Regards</p><p>&nbsp;<br></p>', NULL, 9, '@interviewer_email, @interviewer_name, @list'),
	('reference_1', NULL, '@reference_email', NULL, NULL, 'Asking for reference', '<p>Dear @reference_name,&nbsp;</p><p>&nbsp;</p><p>I hope this email finds you well.</p><p>&nbsp;</p><p>First of all I would like to introduce myself as HR Professional of Environment and Climate Change Programme of Deutsche Gesellschaft fuer Internationale Zusammenarbeit (GIZ) â€“ a German international cooperation for sustainable development in its Jakarta Office, Indonesia.</p><p>&nbsp;</p><p>I am writing you regarding @applicant_name, who considered to become Accounting/Finance Professional in GE-LAMA-I project.&nbsp;</p><p>As part of our recruitment process, we should conduct reference check for @applicant_name, as he has putting your name as his referee.</p><p>&nbsp;</p><p>It would be great if &nbsp;you could share your comments and impressions regarding @applicant_nameâ€™s qualifications and skills in @vacancy_criteria, as well as your connection with him.</p><p>&nbsp;</p><p>We do really hope that we could receive your recommendation by Tuesday, 27th January 2015.</p><p>&nbsp;&nbsp;</p><p>Many thanks for your kind assistance and I am looking forward to hearing from you.</p><p>&nbsp;</p><p>Best Regards,</p><p>Fitri Kusumayanti</p><p>HR Professional for Environment and Climate Change Programme</p><p>(PAKLIM, BMUB ICCTF and GE-LAMA-I Projects)</p><p><strong>&nbsp;</strong></p><p><strong>Deutsche Gesellschaft fÃ¼r </strong></p><p><strong>Internationale Zusammenarbeit&nbsp;(GIZ) GmbH</strong></p><p>c/o Kementerian Negara Lingkungan Hidup (KLH)</p><p>Gedung B Lt.5, Jl. DI Panjaitan Kav 24</p><p>13410 Jakarta, Indonesia</p><p>T +62 21 851 7186</p><p>F +62 21 851 6110</p><p>M <strong>+62 8179 838467 </strong></p><p><strong>E </strong><a href="mailto:fitri.kusumayanti@giz.de" data-mce-href="mailto:fitri.kusumayanti@giz.de"><strong>fitri.kusumayanti@giz.de</strong></a></p><p>&nbsp;</p><p>&nbsp;</p>', NULL, 10, '@reference_name, @reference_email, @applicant_name, @vacancy_criteria');
/*!40000 ALTER TABLE `email_setup` ENABLE KEYS */;




-- Dumping structure for table hrms.gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.gender: ~2 rows (approximately)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`gender_id`, `gender_val`, `sort_id`) VALUES
	(1, 'Male', 1),
	(2, 'Female', 2);
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
  PRIMARY KEY (`job_applied_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;



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


-- Dumping structure for table hrms.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(50) DEFAULT NULL,
  `location_val` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.location: ~2 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`location_id`, `location_code`, `location_val`) VALUES
	(2, 'Wisma Bakrie2', '<p>Location: </p><p>Jalan Jend. Sudirman Kav.60</p>'),
	(3, 'KLH', '<p>Kementrian Lingkungan Hidup</p><p>Gedung Otorita Batam</p>');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_role: ~3 rows (approximately)
/*!40000 ALTER TABLE `m_role` DISABLE KEYS */;
INSERT INTO `m_role` (`role_id`, `role_name`, `role_description`) VALUES
	(1, 'applicant', NULL),
	(2, 'admin', NULL),
	(3, 'employee', NULL);
/*!40000 ALTER TABLE `m_role` ENABLE KEYS */;


-- Dumping structure for table hrms.m_user
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE IF NOT EXISTS `m_user` (
  `pwd` blob,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `activation_code` varchar(50) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- Dumping data for table hrms.m_user: ~12 rows (approximately)
/*!40000 ALTER TABLE `m_user` DISABLE KEYS */;
INSERT INTO `m_user` (`pwd`, `user_id`, `user_name`, `activation_code`, `status_id`) VALUES
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 1, 'Sarah', NULL, 1),
	(_binary 0x6339326636666232653063333063663038623637653161633361306134653431313664663762373865386537383865616234343132343237376262653737363666356339353337343334356535386132646662323463613862343230373163636263303565323566343939366635343662393939626532333261633164616334, 2, 'bla', 'sfvvmnzfxmyw3n6sy7rnddshz2m53s', 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 3, 'Aulia', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 4, 'admin', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 5, 'Rio', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 6, 'Bella', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 7, 'Aditya', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 8, 'Maria', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 9, 'Ahmad', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 10, 'Susan', NULL, 1),
	(_binary 0x3166343066633932646132343136393437353039373965653663663538326632643564376432386531383333356465303561626335346430353630653066353330323836306336353262663038643536303235326161356537343231303534366633363966626262636538633132636663373935376232363532666539613735, 29, 'Jason', 'r6ktb2xz8vbmtyy64xmjffnjk6k57z', 1),
	(_binary 0x3566313932343764363765383163393735373963373138643238333639333561383161613436373866343533636261636162323333353761396437623231306437383331343833616135656633626236623463323539333264313166363837333930386164653961356566323131663133646139333634313331383964376135, 51, 'iskandar.tio@gmail.com', 'pnpr4hmm2h5yjvf6jp7fjyvhsv2fhf', NULL);
/*!40000 ALTER TABLE `m_user` ENABLE KEYS */;


-- Dumping structure for table hrms.m_user_role
DROP TABLE IF EXISTS `m_user_role`;
CREATE TABLE IF NOT EXISTS `m_user_role` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.m_user_role: ~44 rows (approximately)
/*!40000 ALTER TABLE `m_user_role` DISABLE KEYS */;
INSERT INTO `m_user_role` (`role_id`, `user_id`) VALUES
	(3, 1),
	(3, 2),
	(1, 3),
	(2, 4),
	(1, 5),
	(3, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 38),
	(1, 39),
	(1, 40),
	(1, 41),
	(1, 42),
	(1, 43),
	(1, 44),
	(1, 45),
	(1, 46),
	(1, 2),
	(1, 2),
	(1, 2),
	(1, 2),
	(1, 2),
	(1, 2),
	(1, 2),
	(1, 2),
	(1, 47),
	(1, 48),
	(1, 49),
	(1, 50),
	(1, 51);
/*!40000 ALTER TABLE `m_user_role` ENABLE KEYS */;


-- Dumping structure for table hrms.nationality
DROP TABLE IF EXISTS `nationality`;
CREATE TABLE IF NOT EXISTS `nationality` (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.nationality: ~11 rows (approximately)
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` (`nationality_id`, `nationality_val`, `sort_id`) VALUES
	(1, 'Indonesia', 4),
	(2, 'Germany', 3),
	(3, 'Singapore', 9),
	(4, 'Malaysia', 6),
	(5, 'Brunei Darussalam', 1),
	(8, 'Myanmar', 7),
	(9, 'Philippines', 8),
	(10, 'Thailand', 10),
	(11, 'Vietnam', 11),
	(12, 'Laos', 5),
	(13, 'Cambodia', 2);
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;


-- Dumping structure for table hrms.province
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_val` varchar(50) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.province: ~34 rows (approximately)
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` (`province_id`, `province_val`, `region_id`, `sort_id`) VALUES
	(11, 'Aceh', 1, 1),
	(12, 'Sumatera Utara', 1, 2),
	(13, 'Sumatera Barat', 1, 3),
	(14, 'Riau', 1, 4),
	(15, 'Jambi', 1, 5),
	(16, 'Sumatera Selatan', 1, 6),
	(17, 'Bengkulu', 1, 7),
	(18, 'Lampung', 1, 8),
	(19, 'Kepulauan Bangka Belitung', 1, 9),
	(21, 'Kepulauan Riau', 1, 10),
	(31, 'Dki Jakarta', 7, 1),
	(32, 'Jawa Barat', 7, 2),
	(33, 'Jawa Tengah', 7, 3),
	(34, 'Di Yogyakarta', 7, 4),
	(35, 'Jawa Timur', 7, 5),
	(36, 'Banten', 7, 6),
	(51, 'Bali', 3, 1),
	(52, 'Nusa Tenggara Barat', 3, 2),
	(53, 'Nusa Tenggara Timur', 3, 3),
	(61, 'Kalimantan Barat', 4, 1),
	(62, 'Kalimantan Tengah', 4, 2),
	(63, 'Kalimantan Selatan', 4, 3),
	(64, 'Kalimantan Timur', 4, 4),
	(65, 'Kalimantan Utara', 4, 5),
	(71, 'Sulawesi Utara', 5, 1),
	(72, 'Sulawesi Tengah', 5, 2),
	(73, 'Sulawesi Selatan', 5, 3),
	(74, 'Sulawesi Tenggara', 5, 4),
	(75, 'Gorontalo', 5, 5),
	(76, 'Sulawesi Barat', 5, 6),
	(81, 'Maluku', 6, 1),
	(82, 'Maluku Utara', 6, 2),
	(91, 'Papua Barat', 6, 3),
	(94, 'Papua', 6, 4);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;


-- Dumping structure for table hrms.question
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_val` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.question: ~3 rows (approximately)
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`question_id`, `question_val`) VALUES
	(1, 'Manage the team'),
	(2, 'Experiences on Capacity Building'),
	(5, 'Experiences in accounting'),
	(9, 'Experiences in finance'),
	(15, ' Experiences in general administration'),
	(16, 'Experiences in inventory');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Dumping structure for table hrms.ranking
DROP TABLE IF EXISTS `ranking`;
CREATE TABLE IF NOT EXISTS `ranking` (
  `ranking_id` int(11) NOT NULL AUTO_INCREMENT,
  `ranking_val` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ranking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.ranking: ~3 rows (approximately)
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
INSERT INTO `ranking` (`ranking_id`, `ranking_val`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;


-- Dumping structure for table hrms.region
DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.region: ~6 rows (approximately)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`region_id`, `region_val`, `sort_id`) VALUES
	(1, 'Sumatera', 1),
	(3, 'Kalimantan', 6),
	(4, 'Bali dan Nusa Tenggara', 4),
	(5, 'Sulawesi', 5),
	(6, 'Maluku dan Papua', 7),
	(7, 'Jawa', 3);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;


-- Dumping structure for table hrms.salary_band
DROP TABLE IF EXISTS `salary_band`;
CREATE TABLE IF NOT EXISTS `salary_band` (
  `salary_band` varchar(50) NOT NULL,
  PRIMARY KEY (`salary_band`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.salary_band: ~3 rows (approximately)
/*!40000 ALTER TABLE `salary_band` DISABLE KEYS */;
INSERT INTO `salary_band` (`salary_band`) VALUES
	('Level 1'),
	('Level 2'),
	('Level 3');
/*!40000 ALTER TABLE `salary_band` ENABLE KEYS */;


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


-- Dumping structure for table hrms.user_ranking
DROP TABLE IF EXISTS `user_ranking`;
CREATE TABLE IF NOT EXISTS `user_ranking` (
  `user_ranking_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_employee_id` int(11) DEFAULT NULL,
  `ranking_id` int(11) DEFAULT NULL,
  `user_comment` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_ranking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;


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
  PRIMARY KEY (`vacancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;


-- Dumping structure for table hrms.vacancy_employee
DROP TABLE IF EXISTS `vacancy_employee`;
CREATE TABLE IF NOT EXISTS `vacancy_employee` (
  `vacancy_employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` varchar(50) DEFAULT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vacancy_employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;



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
  PRIMARY KEY (`vacancy_interview_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


-- Dumping structure for table hrms.vacancy_progress
DROP TABLE IF EXISTS `vacancy_progress`;
CREATE TABLE IF NOT EXISTS `vacancy_progress` (
  `vacancy_progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_progress_val` varchar(50) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `process_name` varchar(50) DEFAULT NULL,
  `required` bit(1) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`vacancy_progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_progress: ~6 rows (approximately)
/*!40000 ALTER TABLE `vacancy_progress` DISABLE KEYS */;
INSERT INTO `vacancy_progress` (`vacancy_progress_id`, `vacancy_progress_val`, `sort_id`, `process_name`, `required`, `active`) VALUES
	(1, 'First Interview', 3, 'First Interview', b'00000000', 1),
	(2, 'Second Interview', 5, 'Second Interview', b'00000000', 1),
	(3, 'Negotiation', 6, 'Negotiation', b'10000000', 1),
	(4, 'Closing', 7, 'Accept as Employee', b'10000000', 1),
	(5, 'Shortlist', 1, 'Shortlist', b'00000000', 1),
	(6, 'Written Test', 2, 'Written Test', NULL, 1);
/*!40000 ALTER TABLE `vacancy_progress` ENABLE KEYS */;


-- Dumping structure for table hrms.vacancy_question
DROP TABLE IF EXISTS `vacancy_question`;
CREATE TABLE IF NOT EXISTS `vacancy_question` (
  `vacancy_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `vacancy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vacancy_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;



-- Dumping structure for table hrms.vacancy_timeline
DROP TABLE IF EXISTS `vacancy_timeline`;
CREATE TABLE IF NOT EXISTS `vacancy_timeline` (
  `vacancy_timeline_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_id` int(11) DEFAULT NULL,
  `vacancy_progress_id` int(11) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `interview_date` datetime DEFAULT NULL,
  `interview_time` varchar(10) DEFAULT NULL,
  `interview_place` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`vacancy_timeline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;



-- Dumping structure for table hrms.vacancy_type
DROP TABLE IF EXISTS `vacancy_type`;
CREATE TABLE IF NOT EXISTS `vacancy_type` (
  `vacancy_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hrms.vacancy_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `vacancy_type` DISABLE KEYS */;
INSERT INTO `vacancy_type` (`vacancy_type`) VALUES
	('Intern'),
	('National Personell');
/*!40000 ALTER TABLE `vacancy_type` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
