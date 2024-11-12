CREATE DATABASE  IF NOT EXISTS `schedulepal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schedulepal`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: schedulepal
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fakultas`
--

DROP TABLE IF EXISTS `fakultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fakultas` (
  `id_fakultas` int NOT NULL,
  `nama_fakultas` varchar(50) NOT NULL,
  PRIMARY KEY (`id_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakultas`
--

LOCK TABLES `fakultas` WRITE;
/*!40000 ALTER TABLE `fakultas` DISABLE KEYS */;
INSERT INTO `fakultas` VALUES (1,'Fakultas Teknik'),(2,'Fakultas Ilmu Komputer'),(3,'Fakultas Ekonomi dan Bisnis'),(4,'Fakultas Hukum'),(5,'Fakultas Kedokteran'),(6,'Fakultas Psikologi'),(7,'Fakultas Ilmu Sosial dan Politik'),(8,'Fakultas Seni Rupa dan Desain'),(9,'Fakultas Matematika dan Ilmu Pengetahuan Alam'),(10,'Fakultas Pertanian'),(11,'Fakultas Admin');
/*!40000 ALTER TABLE `fakultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id_acara` int NOT NULL,
  `judul_acara` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `waktu` time NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `status` enum('true','false','pending') DEFAULT NULL,
  `NIM` bigint DEFAULT NULL,
  PRIMARY KEY (`id_acara`),
  KEY `NIM` (`NIM`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `users` (`NIM`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'Workshop AI','Belajar dasar AI dan Machine Learning','09:00:00','2024-11-15','Ruang 101','true',12345678901),(2,'Seminar Teknologi','Seminar teknologi terbaru di industri','10:30:00','2024-11-16','Aula Utama','pending',12345678902),(3,'Pelatihan Manajemen','Pelatihan manajemen untuk mahasiswa baru','13:00:00','2024-11-17','Ruang 201','true',12345678903),(4,'Kuliah Umum Akuntansi','Kuliah umum tentang akuntansi modern','15:00:00','2024-11-18','Ruang 305','false',12345678904),(5,'Lomba Konstruksi','Lomba konstruksi antar mahasiswa teknik sipil','08:00:00','2024-11-19','Lapangan Kampus','true',12345678905);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `NIM` bigint NOT NULL,
  `username` varchar(20) NOT NULL,
  `fakultas` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`NIM`),
  KEY `fakultas` (`fakultas`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`fakultas`) REFERENCES `fakultas` (`id_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (999,'admin',11,'$2y$10$9h3plJhS6R.nBD8d0AiCkuGW9AGaq0kmxT49.ZCC34p3R0oEYUm.y','admin'),(12345678901,'johndoe',1,'password123','user'),(12345678902,'janedoe',2,'password456','user'),(12345678903,'alice',3,'password789','admin'),(12345678904,'bob',1,'password321','user'),(12345678905,'charlie',4,'password654','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 13:18:52
