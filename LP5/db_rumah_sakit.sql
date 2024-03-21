/*
Navicat MySQL Data Transfer

Source Server         : coba01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_rumah_sakit

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-03-20 13:32:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `departmen`
-- ----------------------------
DROP TABLE IF EXISTS `departmen`;
CREATE TABLE `departmen` (
  `id_departmen` int(12) NOT NULL AUTO_INCREMENT,
  `nama_departmen` varchar(225) NOT NULL,
  `lokasi` varchar(225) NOT NULL,
  PRIMARY KEY (`id_departmen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of departmen
-- ----------------------------
INSERT INTO `departmen` VALUES ('1', 'Radiology', 'Hospital Building, 2nd Floor');
INSERT INTO `departmen` VALUES ('2', 'Emergency', 'Emergency Ward');
INSERT INTO `departmen` VALUES ('3', 'Surgery', 'Operating Room 1');
INSERT INTO `departmen` VALUES ('4', 'Cardiology', 'Heart Wing');
INSERT INTO `departmen` VALUES ('5', 'Pediatrics', 'Children Ward');
INSERT INTO `departmen` VALUES ('6', 'Neurology', 'Neurological Center');
INSERT INTO `departmen` VALUES ('7', 'Orthopedics', 'Orthopedic Wing');
INSERT INTO `departmen` VALUES ('8', 'Radiology', 'Hospital Building, 2nd Floor');

-- ----------------------------
-- Table structure for `dokter`
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter` (
  `id_dokter` int(12) NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(225) NOT NULL,
  `spesialisasi` varchar(225) NOT NULL,
  `jenis_kelamin_dokter` char(1) NOT NULL,
  `alamat_dokter` varchar(225) NOT NULL,
  `telefon_dokter` int(13) NOT NULL,
  `id_departmen` int(12) NOT NULL,
  PRIMARY KEY (`id_dokter`),
  KEY `id_departmen` (`id_departmen`),
  CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_departmen`) REFERENCES `departmen` (`id_departmen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES ('2', 'Kurisu Makise', 'Neurologist', 'P', 'Akihabara, Japan', '081234567890', '6');
INSERT INTO `dokter` VALUES ('3', 'Lelouch Lamperouge', 'Psychiatrist', 'L', 'Britannia, Holy Britannian Empire', '081234567891', '2');
INSERT INTO `dokter` VALUES ('4', 'Spike Spiegel', 'Orthopedic Surgeon', 'L', 'Mars, Tijuana, Earth', '081234567892', '7');
INSERT INTO `dokter` VALUES ('5', 'C.C.', 'Cardiologist', 'P', 'Area 11, Holy Britannian Empire', '081234567893', '4');
INSERT INTO `dokter` VALUES ('6', 'Faye Valentine', 'Ophthalmologist', 'P', 'Ganymede, Solar System', '081234567894', '5');
INSERT INTO `dokter` VALUES ('7', 'Jet Black', 'Dermatologist', 'L', 'Ganymede, Solar System', '081234567895', '3');
INSERT INTO `dokter` VALUES ('8', 'Mayuri Shiina', 'Pediatrician', 'P', 'Akihabara, Japan', '081234567892', '5');
INSERT INTO `dokter` VALUES ('9', 'Jotaro Kujo', 'Heart Surgeon', 'L', 'Morioh Town', '08912345678', '1');

-- ----------------------------
-- Table structure for `jadwal_praktek`
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_praktek`;
CREATE TABLE `jadwal_praktek` (
  `id_jadwal` int(12) NOT NULL AUTO_INCREMENT,
  `hari_praktek` varchar(20) DEFAULT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `id_dokter` int(12) NOT NULL,
  `id_poliklinik` int(12) NOT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `id_dokter` (`id_dokter`),
  KEY `id_poliklinik` (`id_poliklinik`),
  CONSTRAINT `jadwal_praktek_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  CONSTRAINT `jadwal_praktek_ibfk_2` FOREIGN KEY (`id_poliklinik`) REFERENCES `poliklinik` (`id_poliklinik`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of jadwal_praktek
-- ----------------------------
INSERT INTO `jadwal_praktek` VALUES ('1', 'Senin', '08:00:00', '15:00:00', '1', '1');
INSERT INTO `jadwal_praktek` VALUES ('2', 'Jumat', '09:00:00', '17:00:00', '2', '2');
INSERT INTO `jadwal_praktek` VALUES ('3', 'Sabtu', '08:00:00', '14:00:00', '3', '3');

-- ----------------------------
-- Table structure for `kamar`
-- ----------------------------
DROP TABLE IF EXISTS `kamar`;
CREATE TABLE `kamar` (
  `id_kamar` int(12) NOT NULL AUTO_INCREMENT,
  `nomor_kamar` int(5) NOT NULL,
  `tipe_kamar` varchar(225) NOT NULL,
  `status_kamar` varchar(225) NOT NULL,
  PRIMARY KEY (`id_kamar`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of kamar
-- ----------------------------
INSERT INTO `kamar` VALUES ('1', '203', 'premium', 'ada');
INSERT INTO `kamar` VALUES ('2', '303', 'limited', 'kosong');
INSERT INTO `kamar` VALUES ('3', '204', 'premium', 'kosong');
INSERT INTO `kamar` VALUES ('4', '205', 'premium', 'ada');
INSERT INTO `kamar` VALUES ('5', '304', 'limited', 'ada');
INSERT INTO `kamar` VALUES ('6', '305', 'limited', 'ada');

-- ----------------------------
-- Table structure for `obat`
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat` (
  `id_obat` int(12) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(225) NOT NULL,
  `deskripsi` varchar(225) NOT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of obat
-- ----------------------------
INSERT INTO `obat` VALUES ('1', 'Parasetamol', 'Untuk mengatasi demam dan sakit', '20000.00');
INSERT INTO `obat` VALUES ('2', 'Ibuprofen', 'Untuk mengatasi rasa sakit, peradangan, dan demam', '40000.00');
INSERT INTO `obat` VALUES ('3', 'Omeprazol', 'Untuk meredakan sakit maag dan asam lambung', '99000.00');
INSERT INTO `obat` VALUES ('4', 'Amoksisilin', 'Antibiotik untuk infeksi bakteri', '119900.00');
INSERT INTO `obat` VALUES ('5', 'Loratadin', 'Untuk alergi dan demam hay', '599900.00');
INSERT INTO `obat` VALUES ('6', 'Aspirin', 'Untuk meredakan rasa sakit dan melancarkan peredaran darah', '499000.00');
INSERT INTO `obat` VALUES ('7', 'Simvastatin', 'Untuk menurunkan kadar kolesterol', '299900.00');

-- ----------------------------
-- Table structure for `pasien`
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien` (
  `id_pasien` int(12) NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(225) NOT NULL,
  `alamat_pasien` varchar(225) NOT NULL,
  `tanggal_lahir_pasien` date NOT NULL,
  `jenis_kelamin_pasien` char(1) NOT NULL,
  `kontak_pasien` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES ('1', 'stepen', 'rumah stepen', '2024-06-27', 'L', '085634566690');
INSERT INTO `pasien` VALUES ('2', 'vikir van B', 'rumah vikir', '2020-07-20', 'L', '081233221168');
INSERT INTO `pasien` VALUES ('3', 'su jin wo', 'rumah sujinwo', '2009-12-25', 'L', '086574839265');
INSERT INTO `pasien` VALUES ('4', 'emilia', 'rumah emilia', '2022-11-20', 'P', '086263849263');
INSERT INTO `pasien` VALUES ('5', 'erika', 'rumah erika', '2019-07-30', 'P', '084352718395');
INSERT INTO `pasien` VALUES ('6', 'elsa', 'rumah elsa', '2018-06-26', 'P', '085465738264');

-- ----------------------------
-- Table structure for `poliklinik`
-- ----------------------------
DROP TABLE IF EXISTS `poliklinik`;
CREATE TABLE `poliklinik` (
  `id_poliklinik` int(12) NOT NULL AUTO_INCREMENT,
  `nama_poliklinik` varchar(225) NOT NULL,
  `deskripsi` varchar(225) NOT NULL,
  PRIMARY KEY (`id_poliklinik`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of poliklinik
-- ----------------------------
INSERT INTO `poliklinik` VALUES ('1', 'Poliklinik Penyakit Dalam', 'nyembuhin penyakit dalam');
INSERT INTO `poliklinik` VALUES ('2', 'Poliklinik Bedah Umum', 'bedah bedah tubuh manusia');
INSERT INTO `poliklinik` VALUES ('3', 'Poliklinik Anak', 'ngerawat anak biar sembuh');
INSERT INTO `poliklinik` VALUES ('4', 'Poliklinik THT', 'sakit telinga hidung tenggorokan disini tempatnya');
INSERT INTO `poliklinik` VALUES ('5', 'Poliklinik Kandungan dan Kebidanan', 'buat bumil dan bayi disini');

-- ----------------------------
-- Table structure for `rawat_inap`
-- ----------------------------
DROP TABLE IF EXISTS `rawat_inap`;
CREATE TABLE `rawat_inap` (
  `id_rawat_inap` int(12) NOT NULL AUTO_INCREMENT,
  `tanggal_masuk` datetime NOT NULL,
  `tanggal_keluar` datetime NOT NULL,
  `id_pasien` int(12) NOT NULL,
  `id_kamar` int(12) NOT NULL,
  PRIMARY KEY (`id_rawat_inap`),
  KEY `id_pasien` (`id_pasien`),
  KEY `id_kamar` (`id_kamar`),
  CONSTRAINT `rawat_inap_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  CONSTRAINT `rawat_inap_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of rawat_inap
-- ----------------------------
INSERT INTO `rawat_inap` VALUES ('1', '2023-03-11 08:30:00', '2023-03-14 14:01:00', '2', '2');
INSERT INTO `rawat_inap` VALUES ('2', '2023-03-11 08:30:00', '2023-03-14 13:25:00', '1', '2');
INSERT INTO `rawat_inap` VALUES ('3', '2023-03-16 09:30:00', '2023-03-17 10:25:00', '3', '1');

-- ----------------------------
-- Table structure for `rekam_medis`
-- ----------------------------
DROP TABLE IF EXISTS `rekam_medis`;
CREATE TABLE `rekam_medis` (
  `id_rekam_medis` int(12) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `diagnosa` varchar(225) NOT NULL,
  `catatan` varchar(225) NOT NULL,
  `id_dokter` int(12) NOT NULL,
  `id_pasien` int(12) NOT NULL,
  PRIMARY KEY (`id_rekam_medis`),
  KEY `id_dokter` (`id_dokter`),
  KEY `id_pasien` (`id_pasien`),
  CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of rekam_medis
-- ----------------------------
INSERT INTO `rekam_medis` VALUES ('1', '2023-03-11 08:00:00', 'Osteoartritis', 'Rutin untuk terapi dan jangan lupa untuk meminum obat yang di berikan', '1', '1');
INSERT INTO `rekam_medis` VALUES ('2', '2023-03-11 08:20:00', 'Rinitis Akut', 'Istirahat yang cukup dan banyak minum air putih', '1', '2');
INSERT INTO `rekam_medis` VALUES ('3', '2023-03-16 09:12:00', 'Hipersensitivitas Dentin', 'Jangan mengkonsumsi makanan atau minuman yang terlalu panas dan dingin atau rasa yang kuat', '2', '3');

-- ----------------------------
-- Table structure for `resep_obat`
-- ----------------------------
DROP TABLE IF EXISTS `resep_obat`;
CREATE TABLE `resep_obat` (
  `id_resep_obat` int(12) NOT NULL AUTO_INCREMENT,
  `jumlah` int(5) NOT NULL,
  `intruksi` varchar(225) NOT NULL,
  `id_rekam_medis` int(12) NOT NULL,
  `id_obat` int(12) NOT NULL,
  PRIMARY KEY (`id_resep_obat`),
  KEY `id_rekam_medis` (`id_rekam_medis`),
  KEY `id_obat` (`id_obat`),
  CONSTRAINT `resep_obat_ibfk_1` FOREIGN KEY (`id_rekam_medis`) REFERENCES `rekam_medis` (`id_rekam_medis`),
  CONSTRAINT `resep_obat_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of resep_obat
-- ----------------------------
INSERT INTO `resep_obat` VALUES ('1', '12', '3x sehari', '1', '4');
INSERT INTO `resep_obat` VALUES ('2', '6', '2x sehari', '2', '1');
INSERT INTO `resep_obat` VALUES ('3', '15', '3x sehari', '3', '2');

