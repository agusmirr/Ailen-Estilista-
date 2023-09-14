-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ailen_estilista
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `nombre` tinytext,
  `apellido` tinytext,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'PATRICIA','SANCHES',1123902034,'BAHIA BLANCA 34','PASANCHES@GMAIL.COM'),(6,'MARISA','LOZANO',1137830353,'MARCOS SASTRE 2353','MARIRSA786@GMAIL.COM'),(7,'PABLO','GARCIA',1190456789,'CHIVILCOY 4567','GARCIA_PABLO83@GMAIL.COM'),(8,'LISA','VERA',1128945603,'LINCOL 88','VERA_LISA@GMAIL.COM'),(9,'MARTA','PEREZ',1123489504,'SIVRI 678','PEREZ_MARTA99@GMAIL.COM'),(10,'GRABRIELA','SANCHES',1123933674,'BAHIA BLANCA 3023','GABRIELAANCHES@GMAIL.COM');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_clientes` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_producto` int NOT NULL,
  `CANTIDAD` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_clientes` (`id_clientes`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (7,9,'2022-07-12',10,1),(8,8,'2022-02-01',16,2),(9,7,'2022-05-25',25,1),(10,1,'2022-03-29',4,1),(11,6,'2021-04-12',8,5);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` tinytext,
  `categoria` tinytext,
  `marca` varchar(50) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'AGUA MICELAR BIOBELLUS','CUIDADO FACIAL','BIOBELLUS',200),(2,'AQUASHOT GEL EXFOLIANTE','CUIDADO FACIAL','LIDHERMA',500),(3,'BRUMA FACIAL','CUIDADO FACIAL','BIOBELLUS',70),(4,'CONTORNO DE OJOS','CUIDADO FACIAL','LIDHERMA',90),(5,'DOR BALSAMO LABIAL','CUIDADO FACIAL','BIOBELLUS',13),(6,'ESPONJA FACIAL KONJAC','CUIDADO FACIAL','KONJAC',9),(7,'	MASCARILLA DE ARCILLA','CUIDADO FACIAL','CONNY',22),(8,'GEL OIL AURILL','CUIDADO CAPILAR','AURILL',90),(9,'SHAMPOO SOLIDO','CUIDADO CAPILAR','SENTIDA BOTANICA',90),(10,'AMPOLLA ANTI FRIZZ','CUIDADO CAPILAR','SYSTEM 3',50),(11,'AMPOLLA ANTI HIDRATACION','CUIDADO CAPILAR','SYSTEM 3',50),(12,'AMPOLLA ANTI REECONSTRUCCION','CUIDADO CAPILAR','SYSTEM 3',50),(13,'CREMA CAPILAR SKALA','CUIDADO CAPILAR','SKALA',52),(14,'GELATINA AMARILLA SALON','CUIDADO CAPILAR','LINE',3),(15,'DESODORANTE NATURAL','CUIDADO CORPORAL','SENTIDA BOTANICA',10),(16,'ACEITE PARA CUTICULAS','CUIDADO CORPORAL','CONNY',12),(17,'JABON VEGETAL','CUIDADO CORPORAL','SENTIDA BOTANICA',2),(18,'PROTECTOR SOLAS FPS50','CUIDADO CORPORAL','EXEL',33),(19,'JABON EXFOLIANTE','CUIDADO CORPORAL','SENTIDA BOTANICA',22),(20,'CORRECTOR LIQUIDO','MAQUILLAJE','MIMIKA',9),(21,'BASE LIQUIDA','MAQUILLAJE','MIMIKA',12),(22,'DELINEADOR DE OJOS LAPIZ','MAQUILLAJE','MIMIKA',5),(23,'DELINEADOR DE OJOS EN GEL','MAQUILLAJE','MIMIKA',3),(24,'DELINEADOR DE OJOS LIQUIDO','MAQUILLAJE','MIMIKA',9),(25,'SOMBRA PARA OJOS','MAQUILLAJE','MIMIKA',4),(26,'RUBOR COMPACTO POWDER BLUSH','MAQUILLAJE','MIMIKA',5);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `tipo_de_servicio` tinytext,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'CORTE DE CABELLO',800.00),(2,'CORTE DE FLEQUILLO',200.00),(3,'SHOCK DE KERATINA',2500.00),(4,'ALISADO',4000.00),(5,'BAÑO DE CREMA',800.00),(6,'MANICURIA SOFT GEL',2000.00),(7,'MANTENIMIENTO SOFT GEL',1700.00),(8,'SEMIPERMANENTE',1100.00),(9,'SEMIPERMANENTE PIES',1300.00),(10,'BELLEZA DE MANOS',900.00),(11,'BELLEZA DE PIES',800.00),(12,'NAIL ART',300.00),(13,'PERMANENTE DE PESTAÑAS',2500.00),(14,'LIFTING DE PESTAÑAS',2500.00),(15,'alisado de cejar',900.00),(16,'limpieza de cutis',1600.00),(17,'brushing y planchita',1500.00),(18,'peinado sencillo',2700.00),(19,'peinado elavorado',3800.00),(20,'maquillaje sencillo',3100.00),(21,'maquillaje elavorado',4200.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_por_producto`
--

DROP TABLE IF EXISTS `venta_por_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_por_producto` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `venta_por_producto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `venta_por_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_por_producto`
--

LOCK TABLES `venta_por_producto` WRITE;
/*!40000 ALTER TABLE `venta_por_producto` DISABLE KEYS */;
INSERT INTO `venta_por_producto` VALUES (1,7,10,1),(2,8,16,2),(3,7,10,1),(4,8,16,2),(5,7,10,1),(6,8,16,2),(7,9,25,1),(8,10,4,1),(9,11,8,5);
/*!40000 ALTER TABLE `venta_por_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-12  0:18:41
