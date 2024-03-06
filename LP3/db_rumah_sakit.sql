/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_rumah_sakit

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-03-06 19:27:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `departmen`
-- ----------------------------
DROP TABLE IF EXISTS `departmen`;
CREATE TABLE `departmen` (
  `Id_Departmen` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Departmen` varchar(255) NOT NULL,
  `Lokasi` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_Departmen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of departmen
-- ----------------------------

-- ----------------------------
-- Table structure for `dokter`
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter` (
  `Id_Dokter` int(10) NOT NULL AUTO_INCREMENT,
  `Nama_Dokter` varchar(255) NOT NULL,
  `Spesialisasi` varchar(255) NOT NULL,
  `Jenis_Kelamin_Dokter` varchar(255) NOT NULL,
  `Alamat_Dokter` varchar(255) NOT NULL,
  `Telefon_Dokter` varchar(255) NOT NULL,
  `Id_Departmen` int(10) NOT NULL,
  PRIMARY KEY (`Id_Dokter`),
  KEY `Id_Departmen` (`Id_Departmen`),
  CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`Id_Departmen`) REFERENCES `departmen` (`Id_Departmen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of dokter
-- ----------------------------

-- ----------------------------
-- Table structure for `jadwal_praktek`
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_praktek`;
CREATE TABLE `jadwal_praktek` (
  `ID_Jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Dokter` int(11) NOT NULL,
  `ID_Poliklinik` int(11) NOT NULL,
  `Hari_Praktek` char(7) DEFAULT NULL,
  `Jam_Mulai` time DEFAULT NULL,
  `Jam_Selesai` time DEFAULT NULL,
  PRIMARY KEY (`ID_Jadwal`),
  KEY `ID_Dokter` (`ID_Dokter`),
  KEY `ID_Poliklinik` (`ID_Poliklinik`),
  CONSTRAINT `jadwal_praktek_ibfk_1` FOREIGN KEY (`ID_Dokter`) REFERENCES `dokter` (`id_dokter`),
  CONSTRAINT `jadwal_praktek_ibfk_2` FOREIGN KEY (`ID_Poliklinik`) REFERENCES `poliklinik` (`ID_Poliklinik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of jadwal_praktek
-- ----------------------------

-- ----------------------------
-- Table structure for `kamar`
-- ----------------------------
DROP TABLE IF EXISTS `kamar`;
CREATE TABLE `kamar` (
  `ID_Kamar` int(11) NOT NULL AUTO_INCREMENT,
  `Nomor_Kamar` varchar(10) NOT NULL,
  `Tipe_Kamar` varchar(50) NOT NULL,
  `Status_Kamar` char(7) DEFAULT NULL,
  PRIMARY KEY (`ID_Kamar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of kamar
-- ----------------------------

-- ----------------------------
-- Table structure for `obat`
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat` (
  `ID_Obat` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Obat` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Obat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of obat
-- ----------------------------

-- ----------------------------
-- Table structure for `pasien`
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien` (
  `ID_Pasien` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` char(1) NOT NULL,
  `Kontak` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of pasien
-- ----------------------------

-- ----------------------------
-- Table structure for `poliklinik`
-- ----------------------------
DROP TABLE IF EXISTS `poliklinik`;
CREATE TABLE `poliklinik` (
  `ID_Poliklinik` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  PRIMARY KEY (`ID_Poliklinik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of poliklinik
-- ----------------------------

-- ----------------------------
-- Table structure for `rawat_inap`
-- ----------------------------
DROP TABLE IF EXISTS `rawat_inap`;
CREATE TABLE `rawat_inap` (
  `ID_Rawat_Inap` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pasien` int(11) NOT NULL,
  `ID_Kamar` int(11) NOT NULL,
  `Tanggal_Masuk` date NOT NULL,
  `Tanggal_Keluar` date NOT NULL,
  PRIMARY KEY (`ID_Rawat_Inap`),
  KEY `ID_Pasien` (`ID_Pasien`),
  KEY `ID_Kamar` (`ID_Kamar`),
  CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`ID_Pasien`) REFERENCES `pasien` (`ID_Pasien`),
  CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`ID_Kamar`) REFERENCES `kamar` (`ID_Kamar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of rawat_inap
-- ----------------------------

-- ----------------------------
-- Table structure for `rekam_medis`
-- ----------------------------
DROP TABLE IF EXISTS `rekam_medis`;
CREATE TABLE `rekam_medis` (
  `ID_Rekam_Medis` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pasien` int(11) NOT NULL,
  `ID_Dokter` int(11) NOT NULL,
  `Tanggal` date NOT NULL,
  `Diagnosa` text NOT NULL,
  `Catatan` text NOT NULL,
  PRIMARY KEY (`ID_Rekam_Medis`),
  KEY `ID_Pasien` (`ID_Pasien`),
  KEY `ID_Dokter` (`ID_Dokter`),
  CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`ID_Pasien`) REFERENCES `pasien` (`ID_Pasien`),
  CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`ID_Dokter`) REFERENCES `dokter` (`id_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of rekam_medis
-- ----------------------------

-- ----------------------------
-- Table structure for `resep`
-- ----------------------------
DROP TABLE IF EXISTS `resep`;
CREATE TABLE `resep` (
  `ID_Resep` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Rekam_Medis` int(11) NOT NULL,
  `ID_Obat` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Instruksi` text NOT NULL,
  PRIMARY KEY (`ID_Resep`),
  KEY `ID_Rekam_Medis` (`ID_Rekam_Medis`),
  KEY `ID_Obat` (`ID_Obat`),
  CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`ID_Rekam_Medis`) REFERENCES `rekam_medis` (`ID_Rekam_Medis`),
  CONSTRAINT `resep_ibfk_2` FOREIGN KEY (`ID_Obat`) REFERENCES `obat` (`ID_Obat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of resep
-- ----------------------------
