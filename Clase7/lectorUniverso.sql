CREATE DATABASE  IF NOT EXISTS `lectoruniverso` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lectoruniverso`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: lectoruniverso
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(50) NOT NULL,
  `nro_telefono` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `editorial_ideditorial` int NOT NULL,
  `autor_idautor` int NOT NULL,
  `isbn` char(13) NOT NULL,
  `titulo` varchar(25) NOT NULL,
  `anio_escritura` year NOT NULL,
  `anio_edicion` year NOT NULL,
  PRIMARY KEY (`id`,`editorial_ideditorial`,`autor_idautor`),
  KEY `fk_libro_autor1_idx` (`autor_idautor`),
  KEY `fk_libro_editorial1_idx` (`editorial_ideditorial`),
  CONSTRAINT `fk_libro_autor1` FOREIGN KEY (`autor_idautor`) REFERENCES `autor` (`id`),
  CONSTRAINT `fk_libro_editorial1` FOREIGN KEY (`editorial_ideditorial`) REFERENCES `editorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socio_id` int NOT NULL,
  `fecha` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `fecha_tope` date NOT NULL,
  PRIMARY KEY (`id`,`socio_id`),
  KEY `fk_prestamo_socio1_idx` (`socio_id`),
  CONSTRAINT `fk_prestamo_socio1` FOREIGN KEY (`socio_id`) REFERENCES `socio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamoxvolumen`
--

DROP TABLE IF EXISTS `prestamoxvolumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamoxvolumen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prestamo_idprestamo` int NOT NULL,
  `volumen_idvvolumen` int NOT NULL,
  PRIMARY KEY (`id`,`prestamo_idprestamo`,`volumen_idvvolumen`),
  KEY `fk_prestamo_x_volumen_prestamo1_idx` (`prestamo_idprestamo`),
  KEY `fk_prestamo_x_volumen_volumen1_idx` (`volumen_idvvolumen`),
  CONSTRAINT `fk_prestamo_x_volumen_prestamo1` FOREIGN KEY (`prestamo_idprestamo`) REFERENCES `prestamo` (`id`),
  CONSTRAINT `fk_prestamo_x_volumen_volumen1` FOREIGN KEY (`volumen_idvvolumen`) REFERENCES `volumen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamoxvolumen`
--

LOCK TABLES `prestamoxvolumen` WRITE;
/*!40000 ALTER TABLE `prestamoxvolumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamoxvolumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DNI` char(10) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonoxsocio`
--

DROP TABLE IF EXISTS `telefonoxsocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonoxsocio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socio_idsocio` int NOT NULL,
  `nroTelefono` char(10) NOT NULL,
  PRIMARY KEY (`id`,`socio_idsocio`),
  KEY `fk_telefono_x_socio_socio_idx` (`socio_idsocio`),
  CONSTRAINT `fk_telefono_x_socio_socio` FOREIGN KEY (`socio_idsocio`) REFERENCES `socio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonoxsocio`
--

LOCK TABLES `telefonoxsocio` WRITE;
/*!40000 ALTER TABLE `telefonoxsocio` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonoxsocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumen`
--

DROP TABLE IF EXISTS `volumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libro_idlibro` int NOT NULL,
  `deteriorado` int NOT NULL,
  PRIMARY KEY (`id`,`libro_idlibro`),
  KEY `fk_volumen_libro1_idx` (`libro_idlibro`),
  CONSTRAINT `fk_volumen_libro1` FOREIGN KEY (`libro_idlibro`) REFERENCES `libro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumen`
--

LOCK TABLES `volumen` WRITE;
/*!40000 ALTER TABLE `volumen` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-05 10:59:09
