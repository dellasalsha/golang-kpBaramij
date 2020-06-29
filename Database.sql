/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.6.21 : Database - db_testing
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_testing` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_testing`;

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(20) DEFAULT NULL,
  `FirstName` varchar(10) DEFAULT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) NOT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Notes` text,
  `ReportsTo` int(11) DEFAULT NULL,
  `ProvinceName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `LastName` (`LastName`),
  KEY `PostalCode` (`PostalCode`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `employees` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(6) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `cancellable` tinyint(1) NOT NULL DEFAULT '0',
  `check_avail` tinyint(1) NOT NULL DEFAULT '0',
  `currency` varchar(3) DEFAULT '0',
  `price_start` double NOT NULL,
  `price_end` double NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `goods` */

/*Table structure for table `m_dosen` */

DROP TABLE IF EXISTS `m_dosen`;

CREATE TABLE `m_dosen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(20) DEFAULT NULL,
  `KodeID` varchar(10) NOT NULL DEFAULT 'UMT',
  `IDFINGER` varchar(10) DEFAULT NULL,
  `NIDN` varchar(50) DEFAULT NULL,
  `HomebaseInduk` varchar(15) DEFAULT NULL,
  `NIPPNS` varchar(30) DEFAULT NULL,
  `NPWP` varchar(30) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Struktural` enum('Y','N') DEFAULT 'N',
  `Jenis_Kelamin` varchar(1) DEFAULT NULL,
  `TempatLahir` varchar(50) DEFAULT NULL,
  `TanggalLahir` date DEFAULT '0000-00-00',
  `LevelID` int(10) DEFAULT '12',
  `KTP` varchar(50) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `Handphone` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Alamat` mediumtext,
  `Kota` varchar(50) DEFAULT NULL,
  `KodePos` varchar(50) DEFAULT NULL,
  `Propinsi` varchar(50) DEFAULT NULL,
  `Negara` varchar(50) DEFAULT NULL,
  `NA` enum('Y','N') DEFAULT 'N',
  `Homebase` varchar(50) DEFAULT NULL,
  `ProdiID` varchar(255) DEFAULT NULL,
  `Gelar` varchar(100) DEFAULT NULL,
  `JenjangID` varchar(5) DEFAULT NULL,
  `Keilmuan` varchar(255) DEFAULT NULL,
  `LulusanPT` varchar(255) DEFAULT NULL,
  `AgamaID` char(3) DEFAULT NULL,
  `KelaminID` char(3) DEFAULT NULL,
  `GolonganID` int(10) DEFAULT NULL,
  `fotoktp` varchar(255) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `KategoriID` varchar(10) DEFAULT NULL,
  `IkatanID` varchar(10) DEFAULT NULL,
  `JabatanID` varchar(10) DEFAULT NULL,
  `JabatanDiktiID` varchar(5) DEFAULT NULL,
  `InstitusiInduk` varchar(10) DEFAULT NULL,
  `StatusDosenID` varchar(5) DEFAULT NULL,
  `StatusKerjaID` varchar(5) DEFAULT NULL,
  `TglBekerja` datetime DEFAULT NULL,
  `NamaBank` varchar(50) DEFAULT NULL,
  `NamaAkun` varchar(50) DEFAULT NULL,
  `NomerAkun` varchar(50) DEFAULT NULL,
  `LoginBuat` varchar(50) DEFAULT NULL,
  `TanggalBuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LoginEdit` varchar(50) DEFAULT NULL,
  `TanggalEdit` datetime DEFAULT NULL,
  `TransReg` int(3) unsigned DEFAULT '0',
  `TransKhus` int(3) unsigned DEFAULT '0',
  `SKSKhus` int(3) unsigned DEFAULT '0',
  `SKSReg` int(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `m_dosen` */

/*Table structure for table `m_haji` */

DROP TABLE IF EXISTS `m_haji`;

CREATE TABLE `m_haji` (
  `HajID` int(11) NOT NULL AUTO_INCREMENT,
  `namalengkap` varchar(125) DEFAULT NULL,
  `jeniskelamin` int(11) DEFAULT NULL,
  `noktp` varchar(125) DEFAULT NULL,
  `tempatlahir` varchar(125) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `namaibukandung` varchar(125) DEFAULT NULL,
  `nopaspor` varchar(75) DEFAULT NULL,
  `berlakupaspor` date DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `alamatemail` varchar(75) DEFAULT NULL,
  `statusperkawinan` int(11) DEFAULT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `mktime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`HajID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `m_haji` */

/*Table structure for table `m_lembaga` */

DROP TABLE IF EXISTS `m_lembaga`;

CREATE TABLE `m_lembaga` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `XKodeSekolah` varchar(4) DEFAULT NULL,
  `Yayasan` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(50) DEFAULT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Ketua` varchar(50) NOT NULL,
  `Puket1` varchar(50) NOT NULL,
  `Puket2` varchar(50) NOT NULL,
  `Puket3` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(100) DEFAULT NULL,
  `Kab_kota` varchar(100) DEFAULT NULL,
  `Kecamatan` varchar(100) DEFAULT NULL,
  `Kelurahan` varchar(100) DEFAULT NULL,
  `Kodepos` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 ROW_FORMAT=COMPACT COMMENT='InnoDB free: 56320 kB';

/*Data for the table `m_lembaga` */

/*Table structure for table `m_travel` */

DROP TABLE IF EXISTS `m_travel`;

CREATE TABLE `m_travel` (
  `TravelID` int(11) NOT NULL AUTO_INCREMENT,
  `TravelName` varchar(100) DEFAULT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `LicenseNumber` varchar(100) DEFAULT NULL,
  `LicenseNumberHaj` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ProvinceID` int(11) DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL,
  `ContactPerson` varchar(100) DEFAULT NULL,
  `MobileNumber` varchar(15) DEFAULT NULL,
  `OfficeNumber` varchar(25) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `OfficeEmail` varchar(75) DEFAULT NULL,
  `Website` varchar(75) DEFAULT NULL,
  `TravelStatus` varchar(25) DEFAULT NULL,
  `Rating` varchar(5) NOT NULL DEFAULT '0',
  `UsrName` varchar(75) DEFAULT NULL,
  `Psword` varchar(100) DEFAULT NULL,
  `Logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TravelID`),
  KEY `CityID` (`CityID`),
  KEY `ProvinceID` (`ProvinceID`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

/*Data for the table `m_travel` */

/*Table structure for table `m_trips` */

DROP TABLE IF EXISTS `m_trips`;

CREATE TABLE `m_trips` (
  `TripID` int(11) NOT NULL AUTO_INCREMENT,
  `TravelType` int(11) DEFAULT NULL,
  `TravelID` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DepartureDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Origin` varchar(3) DEFAULT NULL,
  `Destination` varchar(3) DEFAULT NULL,
  `Transit` varchar(3) DEFAULT NULL,
  `DetailTransit` varchar(125) DEFAULT NULL,
  `HotelName` varchar(75) DEFAULT NULL,
  `HotelRating` int(11) DEFAULT NULL,
  `Detail Hotel` text,
  `Currency` varchar(3) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `PromoCode` varchar(125) DEFAULT NULL,
  `PromoDescription` text,
  `AirlinesID` int(11) DEFAULT NULL,
  `Goods` text,
  `TermCondition` text,
  `TripType` int(11) DEFAULT NULL,
  `Quota` int(11) DEFAULT NULL,
  `TripStatus` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT '1',
  `Lat` varchar(25) DEFAULT NULL,
  `Long` varchar(25) DEFAULT NULL,
  `DoubleType` int(11) DEFAULT NULL,
  `TripleType` int(11) DEFAULT NULL,
  `QuadType` int(11) DEFAULT NULL,
  `PromoStatus` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`TripID`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1;

/*Data for the table `m_trips` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL AUTO_INCREMENT,
  `CardID` varchar(12) DEFAULT NULL,
  `LastName` varchar(75) DEFAULT NULL,
  `FirstName` varchar(75) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Notes` text,
  `ReportsTo` int(11) DEFAULT NULL,
  `AdmisionFee` int(11) DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `LastName` (`LastName`),
  KEY `PostalCode` (`PostalCode`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

/*Table structure for table `mst_tb_pegawai` */

DROP TABLE IF EXISTS `mst_tb_pegawai`;

CREATE TABLE `mst_tb_pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sekolah` varchar(25) NOT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `Inisial` varchar(1) DEFAULT NULL,
  `NIP` varchar(30) DEFAULT NULL,
  `NIY` varchar(35) DEFAULT NULL,
  `NUPTK` varchar(35) DEFAULT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Jenis_Kelamin` varchar(1) DEFAULT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `Telp` varchar(50) DEFAULT NULL,
  `HP` varchar(50) DEFAULT NULL,
  `imageType` varchar(25) DEFAULT NULL,
  `imageData` longblob,
  `Tempat_Lahir` varchar(50) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Pendidikan` varchar(50) DEFAULT NULL,
  `Status_Guru` varchar(15) DEFAULT NULL,
  `MKTime` varchar(25) DEFAULT NULL,
  `userid` varchar(25) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `grup` varchar(25) DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  `skin` int(11) DEFAULT NULL,
  `menu` varchar(25) DEFAULT NULL,
  `Kost` int(11) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `Status_Mengajar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

/*Data for the table `mst_tb_pegawai` */

/*Table structure for table `prodi` */

DROP TABLE IF EXISTS `prodi`;

CREATE TABLE `prodi` (
  `ProdiID` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `KodeID` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT 'UMT',
  `FakultasID` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Nama` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `kodevir` varchar(4) COLLATE latin1_general_ci DEFAULT NULL,
  `KodeExplode` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `NoRekening` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `Nama_en` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `SINGKATAN` varchar(7) COLLATE latin1_general_ci DEFAULT NULL,
  `JenjangID` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Gelar` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ProdiDiktiID` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `NamaSesi` varchar(50) COLLATE latin1_general_ci DEFAULT 'Semester',
  `Akreditasi` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `NoSKDikti` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TglSKDikti` date DEFAULT NULL,
  `NoSKBAN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TglSKBAN` date DEFAULT NULL,
  `PajakHonorDosen` int(11) NOT NULL DEFAULT '10',
  `Pejabat` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Jabatan` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `FormatNIM` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `DapatPindahProdi` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `DefSKS` int(11) NOT NULL DEFAULT '0',
  `TotalSKS` int(11) NOT NULL DEFAULT '0',
  `DefKehadiran` int(11) NOT NULL DEFAULT '16',
  `BatasStudi` int(11) NOT NULL DEFAULT '0',
  `JumlahSesi` int(11) NOT NULL DEFAULT '0',
  `CekPrasyarat` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `LoginBuat` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TanggalBuat` date DEFAULT NULL,
  `LoginEdit` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TanggalEdit` date DEFAULT NULL,
  `Keterangan` text COLLATE latin1_general_ci,
  `StartNoProdi` bigint(20) NOT NULL DEFAULT '0',
  `NoProdi` bigint(20) NOT NULL DEFAULT '0',
  `Denda1` int(11) NOT NULL DEFAULT '0',
  `Denda2` int(11) NOT NULL DEFAULT '0',
  `NA` enum('Y','N') COLLATE latin1_general_ci DEFAULT 'N',
  PRIMARY KEY (`ProdiID`),
  UNIQUE KEY `ProdiID` (`ProdiID`),
  KEY `KodeID` (`KodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Program Studi';

/*Data for the table `prodi` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(40) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `QuantityPerUnit` varchar(20) DEFAULT NULL,
  `UnitPrice` decimal(19,4) DEFAULT '0.0000',
  `UnitsInStock` int(11) DEFAULT '0',
  `UnitsOnOrder` int(11) DEFAULT '0',
  `ReorderLevel` int(11) DEFAULT '0',
  `Discontinued` tinyint(4) DEFAULT '0',
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `ProductName` (`ProductName`),
  KEY `SupplierID` (`SupplierID`)
) ENGINE=MyISAM AUTO_INCREMENT=453 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

/*Table structure for table `publisher` */

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `publisher_name` (`publisher_name`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `publisher` */

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `origin_host` varchar(255) NOT NULL,
  `public_key` varchar(1024) NOT NULL,
  `notif_url` varchar(255) NOT NULL,
  `success_url` varchar(255) NOT NULL,
  `failed_url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `invoice_pfx` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_idx1` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `store` */

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `HomePage` text,
  PRIMARY KEY (`SupplierID`),
  KEY `CompanyName` (`CompanyName`),
  KEY `PostalCode` (`PostalCode`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `suppliers` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
