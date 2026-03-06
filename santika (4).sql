-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2026 at 06:16 AM
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
-- Database: `santika`
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
(2, 'Bidang'),
(3, 'Lainnya\r\n');

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
  `ID_OPD` int NOT NULL,
  `JML_PESERTA` int NOT NULL,
  `STS` int NOT NULL,
  `SERTIFIKAT` int NOT NULL,
  `JAM_PELAJARAN` varchar(255) NOT NULL,
  `qr_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_kegiatan`
--

INSERT INTO `tbl_kegiatan` (`ID_KEGIATAN`, `NAMA`, `TEMPAT`, `JAM`, `TANGGAL`, `SKPD_PENYELENGGARA`, `PIMPINAN_RAPAT`, `ID_OPD`, `JML_PESERTA`, `STS`, `SERTIFIKAT`, `JAM_PELAJARAN`, `qr_token`) VALUES
(18, 'COBA QR CODE', 'MALANG', '09.00', '2026-03-06', 'COBA', 'COBaaaaa', 2, 13, 0, 0, '09.00', 'e65da088b8a305dd4028'),
(19, 'DIKLAT STATISTIK SEKTORAL TAHUN 2026 - HARI 2', 'Malang', '09.00-12.00', '2026-03-06', 'Dinas', 'Pimpinan', 2, 12, 0, 0, '', '8500a451b8a3b877c794');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_opd`
--

CREATE TABLE `tbl_opd` (
  `ID_OPD` int NOT NULL,
  `ID_J-OPD` int NOT NULL,
  `NAMA_OPD` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_opd`
--

INSERT INTO `tbl_opd` (`ID_OPD`, `ID_J-OPD`, `NAMA_OPD`) VALUES
(1, 1, 'Dinas Sosial'),
(2, 2, 'Bidang Aplikasi Informatika'),
(3, 3, 'DIskominfo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_presensi`
--

CREATE TABLE `tbl_presensi` (
  `ID_LOGIN` int NOT NULL,
  `ID_KEGIATAN` int NOT NULL,
  `NAMA` varchar(225) NOT NULL,
  `JEN_KEL` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NO_HP` varchar(15) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ID_OPD` int NOT NULL,
  `JABATAN` varchar(255) NOT NULL,
  `TTD` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_presensi`
--

INSERT INTO `tbl_presensi` (`ID_LOGIN`, `ID_KEGIATAN`, `NAMA`, `JEN_KEL`, `NO_HP`, `EMAIL`, `ID_OPD`, `JABATAN`, `TTD`) VALUES
(7, 18, 'Nur fitria Rahmadani putri', 'P', '0856323254', 'nurfitriarput35@gmail.com', 1, 'Mahasiswa', 'd'),
(8, 18, 'Salsa', 'P', '24352', 'salsa@gmail.com', 1, 'Mahasiswa', ''),
(9, 19, 'Nur Fitria Rahmadani Putri', 'P', '082335285564', 'nurfitriarput35@gmail.com', 2, 'Mahasiswa', '');

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
  `TTD` text NOT NULL,
  `DATE_TIME` datetime NOT NULL,
  `JABATAN` varchar(255) NOT NULL,
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
  `PERANGKAT DAERAH` varchar(255) NOT NULL,
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

INSERT INTO `tbl_user` (`ID`, `NAMA`, `PERANGKAT DAERAH`, `BIDANG`, `USERNAME`, `PASSWORD`, `ROLE`, `GAMBAR`, `created_at`, `updated_at`) VALUES
(3, 'Nurfitriarp', 'PD', 'Bidang', 'nurfitriarp', 'nurfitriarp', 'admin', NULL, '2026-03-05 22:12:03', '2026-03-05 22:12:03'),
(7, 'nurfitria', 'mahasiswa', 'atika', 'nurfitria', 'nurfitria', 'super_admin', NULL, '2026-03-06 04:53:23', '2026-03-06 04:53:23');

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
-- Indexes for table `tbl_jenis_opd`
--
ALTER TABLE `tbl_jenis_opd`
  ADD PRIMARY KEY (`ID_J-OPD`);

--
-- Indexes for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD PRIMARY KEY (`ID_KEGIATAN`),
  ADD UNIQUE KEY `qr_token` (`qr_token`),
  ADD KEY `ID_OPD` (`ID_OPD`);

--
-- Indexes for table `tbl_opd`
--
ALTER TABLE `tbl_opd`
  ADD PRIMARY KEY (`ID_OPD`),
  ADD UNIQUE KEY `ID_J-OPD` (`ID_J-OPD`);

--
-- Indexes for table `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  ADD PRIMARY KEY (`ID_LOGIN`),
  ADD KEY `ID_KEGIATAN` (`ID_KEGIATAN`),
  ADD KEY `ID_OPD` (`ID_OPD`);

--
-- Indexes for table `tbl_tanda_tangan`
--
ALTER TABLE `tbl_tanda_tangan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_KEGIATAN` (`ID_KEGIATAN`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  MODIFY `ID_KEGIATAN` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  MODIFY `ID_LOGIN` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD CONSTRAINT `tbl_kegiatan_ibfk_1` FOREIGN KEY (`ID_OPD`) REFERENCES `tbl_opd` (`ID_OPD`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_opd`
--
ALTER TABLE `tbl_opd`
  ADD CONSTRAINT `tbl_opd_ibfk_1` FOREIGN KEY (`ID_J-OPD`) REFERENCES `tbl_jenis_opd` (`ID_J-OPD`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  ADD CONSTRAINT `tbl_presensi_ibfk_2` FOREIGN KEY (`ID_OPD`) REFERENCES `tbl_opd` (`ID_OPD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_presensi_ibfk_3` FOREIGN KEY (`ID_KEGIATAN`) REFERENCES `tbl_kegiatan` (`ID_KEGIATAN`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
