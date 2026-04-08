-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2026 at 11:07 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dahar`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `activity_type` varchar(50) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jabatan`
--

CREATE TABLE `tbl_jabatan` (
  `ID_JABATAN` int NOT NULL,
  `NAMA_JABATAN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_jabatan`
--

INSERT INTO `tbl_jabatan` (`ID_JABATAN`, `NAMA_JABATAN`) VALUES
(1, 'SEKRETARIS DAERAH'),
(2, 'ASISTEN PEMERINTAHAN DAN KESEJAHTERAAN RAKYAT SETDA'),
(3, 'ASISTEN PEREKONOMIAN DAN PEMBANGUNAN SETDA'),
(4, 'ASISTEN ADMINISTRASI SETDA'),
(5, 'STAFF AHLI'),
(6, 'KEPALA DINAS'),
(7, 'KEPALA BAGIAN'),
(8, 'KEPALA BADAN'),
(9, 'CAMAT'),
(10, 'SEKRETARIS DESA'),
(11, 'KABID'),
(12, 'KASUBAG'),
(13, 'KASI'),
(14, 'FUNGSIONAL'),
(15, 'STAF/OPERATOR'),
(16, 'PEMATERI/NARASUMBER'),
(17, 'VENDOR/KONSULTAS'),
(18, 'AKADEMISI');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis_opd`
--

CREATE TABLE `tbl_jenis_opd` (
  `ID_J-OPD` int NOT NULL,
  `NAMA_OPD` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_jenis_opd`
--

INSERT INTO `tbl_jenis_opd` (`ID_J-OPD`, `NAMA_OPD`) VALUES
(1, 'Dinas'),
(2, 'Bagian'),
(3, 'Kecamatan'),
(4, 'Organisasi Lain'),
(5, 'Badan'),
(6, 'Kelurahan'),
(7, 'Puskesmas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kegiatan`
--

CREATE TABLE `tbl_kegiatan` (
  `ID_KEGIATAN` int NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `TEMPAT` varchar(255) NOT NULL,
  `JAM` varchar(255) NOT NULL,
  `TANGGAL` date NOT NULL,
  `SKPD_PENYELENGGARA` varchar(255) NOT NULL,
  `PIMPINAN_RAPAT` varchar(255) NOT NULL,
  `ID_OPD` text,
  `JML_PESERTA` int NOT NULL,
  `STS` int NOT NULL,
  `SERTIFIKAT` int NOT NULL,
  `qr_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_opd`
--

CREATE TABLE `tbl_opd` (
  `ID_OPD` int NOT NULL,
  `NAMA_OPD` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ID_J-OPD` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_opd`
--

INSERT INTO `tbl_opd` (`ID_OPD`, `NAMA_OPD`, `ID_J-OPD`) VALUES
(1, 'Dinas Komunikasi dan Informatika', 1),
(2, 'Bagian Pengadaan Barang/Jasa', 2),
(3, 'Bagian Administrasi Perekonomian', 2),
(4, 'Bagian Administrasi Kerjasama', 2),
(5, 'RSUD Lawang', 4),
(6, 'Badan Perencanaan Pembangunan Daerah', 5),
(9, 'Dinas Pertanahan', 1),
(10, 'Bagian Administrasi Kesejahteraan Rakyat', 2),
(11, 'Bagian Organisasi', 2),
(12, 'Bagian Protokol dan Komunikasi Pimpinan', 2),
(13, 'Bagian Tata Usaha', 2),
(14, 'Bagian Umum ', 2),
(15, 'Bagian Administrasi Tata Pemerintahan ', 2),
(16, 'Bagian Hukum', 2),
(17, 'Bagian Administrasi Kemasyarakatan dan Pembinaan Mental', 2),
(18, 'Badan Kepegawaian dan Pengembangan Sumber Daya Manusia', 5),
(25, 'Dinas Kependudukan dan Catatan Sipil', 1),
(28, 'Dinas Tenaga Kerja', 1),
(30, 'Dinas Perindustrian dan Perdagangan', 1),
(32, 'Dinas Ketahanan Pangan', 1),
(37, 'Kecamatan Poncokusumo', 3),
(38, 'Dinas Koperasi', 1),
(40, 'Kecamatan Kasembon', 3),
(41, 'Kecamatan Wajak', 3),
(42, 'Dinas Sosial', 1),
(46, 'Bagian Administrasi Sumber Daya Alam', 2),
(49, 'DINAS PETERNAKAN DAN KESEHATAN HEWAN', 1),
(53, 'Kecamatan Wonosari', 3),
(54, 'Inspektorat', 4),
(56, 'Kelurahan Lawang', 6),
(57, 'Dinas Pariwisata dan Kebudayaan', 1),
(58, 'Dinas Perpustakaan dan Arsip', 1),
(59, 'Dinas Pemberdayaan Masyarakat dan Desa', 1),
(60, 'Satpol PP', 4),
(61, 'Badan Kesatuan Bangsa dan Politik', 5),
(63, 'Sekretariat DPRD', 4),
(64, 'Kelurahan Pagentan', 6),
(65, 'Badan Keuangan dan Aset Daerah', 5),
(67, 'Dinas PU Sumber Daya Air', 1),
(68, 'Dinas Pendidikan', 1),
(69, 'Dinas Pemuda dan Olahraga', 1),
(70, 'Dinas Kesehatan', 1),
(71, 'Dinas Perhubungan', 1),
(72, 'Kelurahan Candirenggo', 6),
(73, 'Kelurahan Sedayu', 6),
(74, 'Kelurahan Adirejo', 6),
(75, 'Kelurahan Penarukan', 6),
(76, 'Kelurahan Cepokomulyo', 6),
(77, 'Dinas Pengedalian Penduduk dan Keluarga Berencana', 1),
(78, 'Badan Pendapatan Daerah', 5),
(79, 'Kelurahan Kalirejo', 6),
(80, 'Kelurahan Losari', 6),
(81, 'RSUD Kanjuruhan', 4),
(82, 'Dinas Perikanan', 1),
(83, 'Dinas Pemberdayaan Perempuan dan Perlindungan Anak', 1),
(84, 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu', 1),
(85, 'Dinas Pekerjaan Umum Bina Marga', 1),
(86, 'DINAS PERUMAHAN,  KAWASAN PERMUKIMAN DAN CIPTA KARYA', 1),
(87, 'Badan Penanggulangan Bencana Daerah', 5),
(88, 'Kecamatan Ampelgading', 3),
(89, 'Kecamatan Tirtoyudo', 3),
(90, 'Kecamatan Dampit', 3),
(91, 'Kecamatan Turen', 3),
(92, 'Kecamatan Bantur', 3),
(93, 'Kecamatan Sumawe', 3),
(94, 'Kecamatan Gedangan', 3),
(95, 'Kecamatan Pagak', 3),
(96, 'Kecamatan Dau', 3),
(97, 'Kecamatan Karangploso', 3),
(98, 'Kecamatan Tajinan', 3),
(99, 'Kecamatan Singosari', 3),
(100, 'Kecamatan Lawang', 3),
(101, 'Kecamatan Pakis', 3),
(102, 'Kecamatan Jabung', 3),
(103, 'Kecamatan Pakisaji', 3),
(104, 'Kelurahan Turen', 6),
(105, 'Kecamatan Wagir', 3),
(106, 'Kecamatan Tumpang', 3),
(107, 'Kecamatan Donomulyo', 3),
(108, 'Kecamatan Kalipare', 3),
(109, 'Kecamatan Kromengan', 3),
(110, 'Kecamatan Ngantang', 3),
(111, 'Kecamatan Pujon', 3),
(112, 'Kecamatan Sumberpucung', 3),
(114, 'Kecamatan Bululawang', 3),
(115, 'Kecamatan Ngajum', 3),
(116, 'Kecamatan Kepanjen', 3),
(117, 'Kecamatan Gondanglegi', 3),
(118, 'Kecamatan Pagelaran', 3),
(119, 'DINAS LINGKUNGAN HIDUP', 1),
(120, 'Badan Penelitian dan Pengembangan', 5),
(121, 'Dinas Tanaman Pangan Hortikultura dan Perkebunan', 1),
(122, 'Kelurahan Kepanjen', 6),
(123, 'Kelurahan Dampit', 6),
(124, 'puskesmas kalipare', 7),
(125, 'puskesmas pagak', 7),
(126, 'puskesmas sumbermanjing kulon', 7),
(127, 'puskesmas bantur', 7),
(128, 'puskesmas wonokerto', 7),
(129, 'puskesmas gedangan', 7),
(130, 'puskesmas sitiarjo', 7),
(131, 'puskesmas sumbermanjing wetan', 7),
(132, 'puskesmas dampit', 7),
(133, 'puskesmas pamotan', 7),
(134, 'puskesmas tirtoyudo', 7),
(135, 'puskesmas ampelgading', 7),
(136, 'puskesmas poncokusumo', 7),
(137, 'puskesmas wajak', 7),
(138, 'puskesmas turen', 7),
(139, 'puskesmas bululawang', 7),
(140, 'puskesmas gondanglegi', 7),
(141, 'puskesmas ketawang', 7),
(142, 'puskesmas pagelaran', 7),
(143, 'puskesmas kepanjen', 7),
(144, 'puskesmas sumberpucung', 7),
(145, 'puskesmas kromengan', 7),
(146, 'puskesmas ngajum', 7),
(147, 'puskesmas wonosari', 7),
(148, 'puskesmas wagir', 7),
(149, 'puskesmas pakisaji', 7),
(150, 'puskesmas tajinan', 7),
(151, 'puskesmas tumpang', 7),
(152, 'puskesmas pakis', 7),
(153, 'puskesmas jabung', 7),
(154, 'puskesmas lawang', 7),
(155, 'puskesmas singosari', 7),
(156, 'puskesmas ardimulyo', 7),
(157, 'puskesmas karangploso', 7),
(158, 'puskesmas dau', 7),
(159, 'puskesmas pujon', 7),
(160, 'puskesmas ngantang', 7),
(161, 'puskesmas kasembon', 7),
(162, 'puskesmas donomulyo', 7),
(163, 'PALANG MERAH INDONESIA', NULL),
(164, 'PD JASA YASA', 4),
(165, 'BPR ARTHA KANJURUHAN', 4),
(166, 'PERUMDA TIRTA KANJURUHAN', 4),
(167, 'DHARMA WANITA PERSATUAN', NULL),
(174, 'Bululawang - kasri', NULL),
(175, 'Bululawang - krebet', NULL),
(176, 'Bululawang - krebetsenggrong', NULL),
(177, 'Bululawang - kuwolo', NULL),
(178, 'Bululawang - lumbangsari', NULL),
(179, 'Bululawang - pringu', NULL),
(180, 'Bululawang - sempalwadak', NULL),
(181, 'Bululawang - sudimoro', NULL),
(182, 'Bululawang - sukonolo', NULL),
(183, 'Bululawang - wadanpuro', NULL),
(184, 'Dau - gadingkulon', NULL),
(185, 'Dau - kalisongo', NULL),
(186, 'Dau - karangwidoro', NULL),
(187, 'Dau - kucur', NULL),
(188, 'Dau - landungsari', NULL),
(189, 'Dau - mulyoagung', NULL),
(190, 'Dau - petungsewu', NULL),
(191, 'Dau - selorejo', NULL),
(192, 'Dau - sumbersekar', NULL),
(193, 'Dau - tegalweru', NULL),
(194, 'Gondanglegi - bulupitu', NULL),
(195, 'Gondanglegi - ganjaran', NULL),
(196, 'Gondanglegi - gondanglegikulon', NULL),
(197, 'Gondanglegi - gondanglegiwetan', NULL),
(198, 'Gondanglegi - ketawang', NULL),
(199, 'Gondanglegi - panggungrejo', NULL),
(200, 'Gondanglegi - putatkidul', NULL),
(201, 'Gondanglegi - putatlor', NULL),
(202, 'Gondanglegi - putukrejo', NULL),
(203, 'Gondanglegi - sepanjang', NULL),
(204, 'Gondanglegi - sukorejo', NULL),
(205, 'Gondanglegi - sukosari', NULL),
(206, 'Gondanglegi - sumberjaya', NULL),
(207, 'Gondanglegi - urekurek', NULL),
(208, 'Karangploso - ampeldento', NULL),
(209, 'Karangploso - bocek', NULL),
(210, 'Karangploso - donowarih', NULL),
(211, 'Karangploso - girimoyo', NULL),
(212, 'Karangploso - kepuharjo', NULL),
(213, 'Karangploso - ngenep', NULL),
(214, 'Karangploso - ngijo', NULL),
(215, 'Karangploso - tawangargo', NULL),
(216, 'Karangploso - tegalgondo', NULL),
(217, 'Kepanjen - curungrejo', NULL),
(218, 'Kepanjen - dilem', NULL),
(219, 'Kepanjen - jatirejoyoso', NULL),
(220, 'Kepanjen - jenggolo', NULL),
(221, 'Kepanjen - kedungpendaringan', NULL),
(222, 'Kepanjen - kemiri', NULL),
(223, 'Kepanjen - mangunrejo', NULL),
(224, 'Kepanjen - mojosari', NULL),
(225, 'Kepanjen - ngadilangkung', NULL),
(226, 'Kepanjen - panggungrejo', NULL),
(227, 'Kepanjen - sengguruh', NULL),
(228, 'Kepanjen - sukoraharjo', NULL),
(229, 'Kepanjen - talangagung', NULL),
(230, 'Kepanjen - tegalsari', NULL),
(231, 'Lawang - bedali', NULL),
(232, 'Lawang - ketindan', NULL),
(233, 'Lawang - mulyoarjo', NULL),
(234, 'Lawang - sidodadi', NULL),
(235, 'Lawang - sidoluhur', NULL),
(236, 'Lawang - srigading', NULL),
(237, 'Lawang - sumberngepoh', NULL),
(238, 'Lawang - sumberporong', NULL),
(239, 'Lawang - turirejo', NULL),
(240, 'Lawang - wonorejo', NULL),
(241, 'Ngajum - balesari', NULL),
(242, 'Ngajum - banjarsari', NULL),
(243, 'Ngajum - kesamben', NULL),
(244, 'Ngajum - kranggan', NULL),
(245, 'Ngajum - maguan', NULL),
(246, 'Ngajum - ngajum', NULL),
(247, 'Ngajum - ngasem', NULL),
(248, 'Ngajum - palaan', NULL),
(249, 'Ngajum - babadan', NULL),
(250, 'Pagelaran - balearjo', NULL),
(251, 'Pagelaran - banjarejo', NULL),
(252, 'Pagelaran - brongkal', NULL),
(253, 'Pagelaran - clumprit', NULL),
(254, 'Pagelaran - kademangan', NULL),
(255, 'Pagelaran - kanigoro', NULL),
(256, 'Pagelaran - karangsuko', NULL),
(257, 'Pagelaran - pagelaran', NULL),
(258, 'Pagelaran - sewaru', NULL),
(259, 'Pagelaran - sidorejo', NULL),
(260, 'Pakis - ampeldento', NULL),
(261, 'Pakis - asrikaton', NULL),
(262, 'Pakis - banjarejo', NULL),
(263, 'Pakis - bunutwetan', NULL),
(264, 'Pakis - kedungrejo', NULL),
(265, 'Pakis - mangliawan', NULL),
(266, 'Pakis - pakisjajar', NULL),
(267, 'Pakis - pakiskembar', NULL),
(268, 'Pakis - pucangsongo', NULL),
(269, 'Pakis - saptorenggo', NULL),
(270, 'Pakis - sekarpuro', NULL),
(271, 'Pakis - sukoanyar', NULL),
(272, 'Pakis - sumberkradenan', NULL),
(273, 'Pakis - sumberpasir', NULL),
(274, 'Pakis - tirtomoyo', NULL),
(275, 'Pakisaji - genengan', NULL),
(276, 'Pakisaji - glanggang', NULL),
(277, 'Pakisaji - jatisari', NULL),
(278, 'Pakisaji - karangduren', NULL),
(279, 'Pakisaji - karangpandan', NULL),
(280, 'Pakisaji - kebonagung', NULL),
(281, 'Pakisaji - kendalpayak', NULL),
(282, 'Pakisaji - pakisaji', NULL),
(283, 'Pakisaji - permanu', NULL),
(284, 'Pakisaji - sutojayan', NULL),
(285, 'Pakisaji - wadung', NULL),
(286, 'Pakisaji - wonokerso', NULL),
(287, 'Singosari - ardimulyo', NULL),
(288, 'Singosari - banjararum', NULL),
(289, 'Singosari - baturetno', NULL),
(290, 'Singosari - dengkol', NULL),
(291, 'Singosari - gunungrejo', NULL),
(292, 'Singosari - klampok', NULL),
(293, 'Singosari - langlang', NULL),
(294, 'Singosari - purwoasri', NULL),
(295, 'Singosari - randuagung', NULL),
(296, 'Singosari - tamanharjo', NULL),
(297, 'Singosari - toyomarto', NULL),
(298, 'Singosari - tunjungtirto', NULL),
(299, 'Singosari - watugede', NULL),
(300, 'Singosari - wonorejo', NULL),
(301, 'Tajinan - gunungronggo', NULL),
(302, 'Tajinan - gunungsari', NULL),
(303, 'Tajinan - jambearjo', NULL),
(304, 'Tajinan - jatisari', NULL),
(305, 'Tajinan - ngawonggo', NULL),
(306, 'Tajinan - pandanmulyo', NULL),
(307, 'Tajinan - purwosekar', NULL),
(308, 'Tajinan - randugading', NULL),
(309, 'Tajinan - sumbersuko', NULL),
(310, 'Tajinan - tajinan', NULL),
(311, 'Tajinan - tambakasri', NULL),
(312, 'Tajinan - tangkilsari', NULL),
(313, 'Turen - gedogkulon', NULL),
(314, 'Turen - gedogwetan', NULL),
(315, 'Turen - jeru', NULL),
(316, 'Turen - kedok', NULL),
(317, 'Turen - kemulan', NULL),
(318, 'Turen - pagedangan', NULL),
(319, 'Turen - sanankerto', NULL),
(320, 'Turen - sananrejo', NULL),
(321, 'Turen - sawahan', NULL),
(322, 'Turen - talangsuko', NULL),
(323, 'Turen - talok', NULL),
(324, 'Turen - tanggung', NULL),
(325, 'Turen - tawangrejeni', NULL),
(326, 'Turen - tumpukrenteng', NULL),
(327, 'Turen - undaan', NULL),
(328, 'Wagir - dalisodo', NULL),
(329, 'Wagir - gondowangi', NULL),
(330, 'Wagir - jedong', NULL),
(331, 'Wagir - mendalanwangi', NULL),
(332, 'Wagir - pandanlandung', NULL),
(333, 'Wagir - pandanrejo', NULL),
(334, 'Wagir - parangargo', NULL),
(335, 'Wagir - petungsewu', NULL),
(336, 'Wagir - sidorahayu', NULL),
(337, 'Wagir - sitirejo', NULL),
(338, 'Wagir - sukodadi', NULL),
(339, 'Wagir - sumbersuko', NULL),
(340, 'Wajak - bambang', NULL),
(341, 'Wajak - blayu', NULL),
(342, 'Wajak - bringin', NULL),
(343, 'Wajak - codo', NULL),
(344, 'Wajak - dadapan', NULL),
(345, 'Wajak - kidangbang', NULL),
(346, 'Wajak - ngembal', NULL),
(347, 'Wajak - patokpicis', NULL),
(348, 'Wajak - sukoanyar', NULL),
(349, 'Wajak - sukolilo', NULL),
(350, 'Wajak - sumberputih', NULL),
(351, 'Wajak - wajak', NULL),
(352, 'Wajak - wonoayu', NULL),
(353, 'Asisten III', NULL),
(354, 'Asisten I', NULL),
(355, 'Asisten II', NULL),
(356, ' SEKRETARIS DAERAH', NULL),
(375, 'MEDIA', NULL),
(376, 'PEMBERDAYAAN KESEJAHTERAAN KELUARGA (PKK)', NULL),
(377, 'Dampit - Amadanom', NULL),
(378, 'Dampit - Baturetno', NULL),
(379, 'Dampit - Bumirejo', NULL),
(380, 'Dampit - Jambangan', NULL),
(381, 'Dampit - Majangtengah', NULL),
(382, 'Dampit - Pojok', NULL),
(383, 'Dampit - Rembun', NULL),
(384, 'Dampit - Srimulyo', NULL),
(385, 'Dampit - Sukodono', NULL),
(386, 'Dampit - Sumbersuko', NULL),
(387, 'Dampit - Pamotan ', NULL),
(388, 'Dampit - Dampit', NULL),
(389, 'Kalipare - Kaliasri', NULL),
(390, 'Kalipare - Kalirejo', NULL),
(391, 'Kalipare - Arjosari', NULL),
(392, 'Kalipare - Sumberpetung', NULL),
(393, 'Kalipare - Putukrejo', NULL),
(394, 'Kalipare - Tumpakrejo', NULL),
(395, 'Kalipare - Sukowilangun', NULL),
(396, 'Kalipare - Kalipare', NULL),
(397, 'Kalipare - Arjowilangun', NULL),
(398, 'Gedangan - Gajahrejo', NULL),
(399, 'Gedangan - Gedangan', NULL),
(400, 'Gedangan - Girimulyo', NULL),
(401, 'Gedangan - Sumberejo', NULL),
(402, 'Gedangan - Sidodadi', NULL),
(403, 'Gedangan - Sindurejo', NULL),
(404, 'Gedangan - Tumpakrejo', NULL),
(405, 'Gedangan - Segaran', NULL),
(406, 'Kromengan - Jambuwer', NULL),
(407, 'Kromengan - Jatikerto', NULL),
(408, 'Kromengan - Karangrejo', NULL),
(409, 'Kromengan - Kromengan', NULL),
(410, 'Kromengan - Ngadirejo', NULL),
(411, 'Kromengan - Peniwen', NULL),
(412, 'Kromengan - Slorok', NULL),
(435, 'Sumberpucung - Jatiguwi', NULL),
(436, 'Sumberpucung - Karangkates', NULL),
(437, 'Sumberpucung - Ngebruk', NULL),
(438, 'Sumberpucung - Sambigede', NULL),
(439, 'Sumberpucung - Sumberpucung', NULL),
(440, 'Sumberpucung - Senggreng', NULL),
(441, 'Sumberpucung - Ternyang', NULL),
(442, 'Poncokusumo - Argosuko', NULL),
(443, 'Poncokusumo - Belung', NULL),
(444, 'Poncokusumo - Dawuhan', NULL),
(445, 'Poncokusumo - Gubugklakah', NULL),
(446, 'Poncokusumo - Jambesari', NULL),
(447, 'Poncokusumo - Karanganyar', NULL),
(448, 'Poncokusumo - Karangnongko', NULL),
(449, 'Poncokusumo - Ngadas', NULL),
(450, 'Poncokusumo - Ngadireso', NULL),
(451, 'Poncokusumo - Ngebruk', NULL),
(452, 'Poncokusumo - Pajaran', NULL),
(453, 'Poncokusumo - Pandansari', NULL),
(454, 'Poncokusumo - Poncokusumo', NULL),
(455, 'Poncokusumo - Sumberejo', NULL),
(456, 'Poncokusumo - Wonomulyo', NULL),
(457, 'Poncokusumo - Wonorejo', NULL),
(458, 'Poncokusumo - Wringinanom', NULL),
(459, 'Pagak - Sumbermanjingkulon', NULL),
(460, 'Pagak - Pagak', NULL),
(461, 'Pagak - Pandanrejo', NULL),
(462, 'Pagak - Sempol', NULL),
(463, 'Pagak - Sumberkerto', NULL),
(464, 'Pagak - Tlogorejo', NULL),
(465, 'Pagak - Sumberejo', NULL),
(466, 'Pagak - Gampingan', NULL),
(467, 'Kasembon - Bayem', NULL),
(468, 'Kasembon - Kasembon', NULL),
(469, 'Kasembon - Pait', NULL),
(470, 'Kasembon - Pondokagung', NULL),
(471, 'Kasembon - Sukosari', NULL),
(472, 'Kasembon - Wonoagung', NULL),
(473, 'Ngantang - Banjarejo', NULL),
(474, 'Ngantang - Banturejo', NULL),
(475, 'Ngantang - Jombok', NULL),
(476, 'Ngantang - Kaumrejo', NULL),
(477, 'Ngantang - Mulyorejo', NULL),
(478, 'Ngantang - Ngantru', NULL),
(479, 'Ngantang - Pagersari', NULL),
(480, 'Ngantang - Pandansari', NULL),
(481, 'Ngantang - Sidodadi', NULL),
(482, 'Ngantang - Sumberagung', NULL),
(483, 'Ngantang - Tulungrejo', NULL),
(484, 'Ngantang - Waturejo', NULL),
(485, 'Ngantang - Purworejo', NULL),
(486, 'Pujon - Bendosari', NULL),
(487, 'Pujon - Sukomulyo', NULL),
(488, 'Pujon - Pujonkidul', NULL),
(489, 'Pujon - Pandesari', NULL),
(490, 'Pujon - Pujonlor', NULL),
(491, 'Pujon - Ngroto', NULL),
(492, 'Pujon - Ngabab', NULL),
(493, 'Pujon - Tawangsari', NULL),
(494, 'Pujon - Madiredo', NULL),
(495, 'Pujon - Wiyurejo', NULL),
(496, 'Donomulyo - Banjarejo', NULL),
(497, 'Donomulyo - Donomulyo', NULL),
(498, 'Donomulyo - Kedungsalam', NULL),
(499, 'Donomulyo - Mentaram', NULL),
(500, 'Donomulyo - Purwodadi', NULL),
(501, 'Donomulyo - Purworejo', NULL),
(502, 'Donomulyo - Sumberoto', NULL),
(503, 'Donomulyo - Tempursari', NULL),
(504, 'Donomulyo - Tlogosari', NULL),
(505, 'Donomulyo - Tulungrejo', NULL),
(506, 'Bantur - Wonokerto', NULL),
(507, 'Bantur - Karangsari', NULL),
(508, 'Bantur - Wonorejo', NULL),
(509, 'Bantur - Bantur', NULL),
(510, 'Bantur - Pringgodani', NULL),
(511, 'Bantur - Bandungrejo', NULL),
(512, 'Bantur - Srigonco', NULL),
(513, 'Bantur - Sumberbening', NULL),
(514, 'Bantur - Rejoyoso', NULL),
(515, 'Bantur - Rejosari', NULL),
(516, 'Wonosari - Plandi', NULL),
(517, 'Wonosari - Wonosari', NULL),
(518, 'Wonosari - Bangelan', NULL),
(519, 'Wonosari - Kebobang', NULL),
(520, 'Wonosari - Kluwut', NULL),
(521, 'Wonosari - Plaosan', NULL),
(522, 'Wonosari - Sumberdem', NULL),
(523, 'Wonosari - Sumbertempur', NULL),
(524, 'Ampelgading - Argoyuwono', NULL),
(525, 'Ampelgading - Lebakharjo', NULL),
(526, 'Ampelgading - Mulyoasri', NULL),
(527, 'Ampelgading - Purwoharjo', NULL),
(528, 'Ampelgading - Sidorenggo', NULL),
(529, 'Ampelgading - Simojayan', NULL),
(530, 'Ampelgading - Sonowangi', NULL),
(531, 'Ampelgading - Tamanasri', NULL),
(532, 'Ampelgading - Tamansari', NULL),
(533, 'Ampelgading - Tawangagung', NULL),
(534, 'Ampelgading - Tirtomarto', NULL),
(535, 'Ampelgading - Tirtomoyo', NULL),
(536, 'Ampelgading - Wirotaman', NULL),
(537, 'Tirtoyudo - Ampelgading', NULL),
(538, 'Tirtoyudo - Gadungsari', NULL),
(539, 'Tirtoyudo - Jogomulyan', NULL),
(540, 'Tirtoyudo - Kepatihan', NULL),
(541, 'Tirtoyudo - Pujiharjo', NULL),
(542, 'Tirtoyudo - Sumbertangkil', NULL),
(543, 'Tirtoyudo - Taman Kuncaran', NULL),
(544, 'Tirtoyudo - Taman Satriyan', NULL),
(545, 'Tirtoyudo - Tlogosari', NULL),
(546, 'Tirtoyudo - Wonoagung ', NULL),
(547, 'Tirtoyudo - Tirtoyudo', NULL),
(548, 'Tirtoyudo - Sukorejo', NULL),
(549, 'Tirtoyudo - Purwodadi', NULL),
(550, 'Sumbermanjing Wetan - Argotirto', NULL),
(551, 'Sumbermanjing Wetan - Druju', NULL),
(552, 'Sumbermanjing Wetan - Harjokuncaran', NULL),
(553, 'Sumbermanjing Wetan - Kedungbanteng', NULL),
(554, 'Sumbermanjing Wetan - Klepu', NULL),
(555, 'Sumbermanjing Wetan - Ringinkembar', NULL),
(556, 'Sumbermanjing Wetan - Ringinsari', NULL),
(557, 'Sumbermanjing Wetan - Sekarbanyu', NULL),
(558, 'Sumbermanjing Wetan - Sidoasri', NULL),
(559, 'Sumbermanjing Wetan - Sitiarjo', NULL),
(560, 'Sumbermanjing Wetan - Sumberagung', NULL),
(561, 'Sumbermanjing Wetan - Sumbermanjing Wetan', NULL),
(562, 'Sumbermanjing Wetan - Tambaksari', NULL),
(563, 'Sumbermanjing Wetan - Tambakrejo', NULL),
(564, 'Sumbermanjing Wetan - Tegalrejo', NULL),
(565, 'Jabung - Argosari', NULL),
(566, 'Jabung - Gading Kembar', NULL),
(567, 'Jabung - Gunungjati', NULL),
(568, 'Jabung - Jabung', NULL),
(569, 'Jabung - Kemantren', NULL),
(570, 'Jabung - Kemiri', NULL),
(571, 'Jabung - Kenongo', NULL),
(572, 'Jabung - Ngadirejo', NULL),
(573, 'Jabung - Pandansari Lor', NULL),
(574, 'Jabung - Sidomulyo', NULL),
(575, 'Jabung - Sidorejo', NULL),
(576, 'Jabung - Slamparejo', NULL),
(577, 'Jabung - Sukolilo', NULL),
(578, 'Jabung - Sukopuro', NULL),
(579, 'Jabung - Taji', NULL),
(580, 'Bululawang - Bululawang', NULL),
(581, 'Bululawang - Kasembon', NULL),
(582, 'Komisi Informasi Provinsi Jawa Timur', NULL),
(583, 'Tumpang - Ngingit', NULL),
(584, 'Tumpang - Benjor', NULL),
(585, 'Tumpang - Bokor', NULL),
(586, 'Tumpang - Duwet', NULL),
(587, 'Tumpang - Duwet Krajan', NULL),
(588, 'Tumpang - Jeru', NULL),
(589, 'Tumpang - Kambingan', NULL),
(590, 'Tumpang - Kidal', NULL),
(591, 'Tumpang - Malangsuko', NULL),
(592, 'Tumpang - Pandanajeng', NULL),
(593, 'Tumpang - Pulungdowo', NULL),
(594, 'Tumpang - Slamet', NULL),
(595, 'Tumpang - Tulusbesar', NULL),
(596, 'Tumpang - Tumpang', NULL),
(597, 'Tumpang - Wringinsongo', NULL),
(599, 'Turen - Sedayu', NULL),
(600, 'Turen - Turen', NULL),
(601, 'Singosari - Candirenggo', NULL),
(602, 'Singosari - Pagentan', NULL),
(603, 'Singosari - Losari', NULL),
(604, 'Lawang - Kalirejo', NULL),
(605, 'Lawang - Lawang', NULL),
(606, 'Kepanjen - Ardirejo', NULL),
(607, 'Kepanjen - Cempokomulyo', NULL),
(608, 'Kepanjen - Kepanjen', NULL),
(609, 'Kepanjen - Panarukan', NULL),
(610, 'Bululawang - Bakalan', NULL),
(611, 'Bululawang - Gading', NULL),
(612, 'Badan Pusat Statistik Kabupaten Malang', NULL),
(613, 'Immortal', NULL),
(614, 'Indiekraf Indonesia Digital', NULL),
(615, 'Inixindo', NULL),
(616, 'RSUD Ngantang', NULL),
(617, 'Bagian Perencanaan dan Keuangan', NULL),
(618, 'Bagian Administrasi Pembangunan', NULL),
(619, 'Universitas Ma Chung', NULL),
(620, 'Telkom', NULL),
(621, 'Cabang Dinas Pendidikan Wilayah Kabupaten Malang', NULL),
(622, 'Universitas Brawijaya', NULL),
(623, 'Universitas PGRI Kanjuruhan Malang', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_presensi`
--

CREATE TABLE `tbl_presensi` (
  `ID_LOGIN` int NOT NULL,
  `ID_KEGIATAN` int NOT NULL,
  `SKPD` varchar(255) NOT NULL,
  `NAMA` varchar(225) NOT NULL,
  `JEN_KEL` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ID_OPD` int NOT NULL,
  `TTD` longtext,
  `DATE_TIME` datetime NOT NULL,
  `ID_JABATAN` int DEFAULT NULL,
  `NO_HP` varchar(15) NOT NULL,
  `URUT_CETAK` int NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `STS` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tanda_tangan`
--

CREATE TABLE `tbl_tanda_tangan` (
  `ID` int NOT NULL,
  `ID_KEGIATAN` int NOT NULL,
  `SKPD` varchar(255) NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `JEN_KEL` enum('L','P') DEFAULT NULL,
  `TTD` longtext,
  `DATE_TIME` datetime NOT NULL,
  `ID_JABATAN` int DEFAULT NULL,
  `NO_HP` varchar(15) NOT NULL,
  `URUT_CETAK` int NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `STS` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `ID` bigint NOT NULL,
  `NAMA` varchar(255) NOT NULL,
  `PERANGKAT_DAERAH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BIDANG` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `ROLE` enum('super_admin','admin') DEFAULT NULL,
  `GAMBAR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`ID`, `NAMA`, `PERANGKAT_DAERAH`, `BIDANG`, `USERNAME`, `PASSWORD`, `ROLE`, `GAMBAR`, `created_at`, `updated_at`) VALUES
(1, 'Nur Fitria Rahmadani Putri', 'Mahasiswa', 'Aptika', 'nurfitria', 'nurfitria', 'super_admin', NULL, '2026-04-07 08:46:06', '2026-04-07 08:46:06'),
(2, 'Salsa Nabillah Ramadhany', 'Mahasiswa', 'Aptika', 'salsa', 'salsa', 'super_admin', NULL, '2026-04-07 08:46:06', '2026-04-07 08:46:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_jabatan`
--
ALTER TABLE `tbl_jabatan`
  ADD PRIMARY KEY (`ID_JABATAN`);

--
-- Indexes for table `tbl_jenis_opd`
--
ALTER TABLE `tbl_jenis_opd`
  ADD PRIMARY KEY (`ID_J-OPD`);

--
-- Indexes for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD PRIMARY KEY (`ID_KEGIATAN`),
  ADD UNIQUE KEY `qr_token` (`qr_token`);

--
-- Indexes for table `tbl_opd`
--
ALTER TABLE `tbl_opd`
  ADD PRIMARY KEY (`ID_OPD`) USING BTREE,
  ADD KEY `ID_OPD` (`ID_J-OPD`);

--
-- Indexes for table `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  ADD PRIMARY KEY (`ID_LOGIN`),
  ADD KEY `ID_KEGIATAN` (`ID_KEGIATAN`),
  ADD KEY `ID_OPD` (`ID_OPD`),
  ADD KEY `ID_JABATAN` (`ID_JABATAN`);

--
-- Indexes for table `tbl_tanda_tangan`
--
ALTER TABLE `tbl_tanda_tangan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_KEGIATAN` (`ID_KEGIATAN`),
  ADD KEY `ID_JABATAN` (`ID_JABATAN`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `tbl_jabatan`
--
ALTER TABLE `tbl_jabatan`
  MODIFY `ID_JABATAN` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  MODIFY `ID_KEGIATAN` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tbl_opd`
--
ALTER TABLE `tbl_opd`
  MODIFY `ID_OPD` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=624;

--
-- AUTO_INCREMENT for table `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  MODIFY `ID_LOGIN` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tanda_tangan`
--
ALTER TABLE `tbl_tanda_tangan`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD CONSTRAINT `tbl_kegiatan_ibfk_1` FOREIGN KEY (`ID_KEGIATAN`) REFERENCES `tbl_presensi` (`ID_KEGIATAN`);

--
-- Constraints for table `tbl_opd`
--
ALTER TABLE `tbl_opd`
  ADD CONSTRAINT `fk_satkerja_jenis` FOREIGN KEY (`ID_J-OPD`) REFERENCES `tbl_jenis_opd` (`ID_J-OPD`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  ADD CONSTRAINT `tbl_presensi_ibfk_1` FOREIGN KEY (`ID_JABATAN`) REFERENCES `tbl_jabatan` (`ID_JABATAN`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_tanda_tangan`
--
ALTER TABLE `tbl_tanda_tangan`
  ADD CONSTRAINT `tbl_tanda_tangan_ibfk_1` FOREIGN KEY (`ID_KEGIATAN`) REFERENCES `tbl_kegiatan` (`ID_KEGIATAN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_tanda_tangan_ibfk_2` FOREIGN KEY (`ID_JABATAN`) REFERENCES `tbl_jabatan` (`ID_JABATAN`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
