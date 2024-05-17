-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: desis_db
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `desis_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `desis_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `desis_db`;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (1,'Sebastian Guerrero'),(2,'Juan Perez'),(3,'Jose Miguel'),(4,'Marcos Andres');
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comuna_region_FK` (`id_region`),
  CONSTRAINT `comuna_region_FK` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuna`
--

LOCK TABLES `comuna` WRITE;
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
INSERT INTO `comuna` VALUES (1,'Arica',1),(2,'Camarones',1),(3,'Putre',1),(4,'General Lagos',1),(5,'Iquique',2),(6,'Alto Hospicio',2),(7,'Pozo Almonte',2),(8,'Camiña',2),(9,'Colchane',2),(10,'Huara',2),(11,'Pica',2),(12,'Antofagasta',3),(13,'Mejillones',3),(14,'Sierra Gorda',3),(15,'Taltal',3),(16,'Calama',3),(17,'Ollagüe',3),(18,'San Pedro de Atacama',3),(19,'Tocopilla',3),(20,'María Elena',3),(21,'Copiapó',4),(22,'Caldera',4),(23,'Tierra Amarilla',4),(24,'Chañaral',4),(25,'Diego de Almagro',4),(26,'Vallenar',4),(27,'Alto del Carmen',4),(28,'Freirina',4),(29,'Huasco',4),(30,'La Serena',5),(31,'Coquimbo',5),(32,'Andacollo',5),(33,'La Higuera',5),(34,'Paiguano',5),(35,'Vicuña',5),(36,'Illapel',5),(37,'Canela',5),(38,'Los Vilos',5),(39,'Salamanca',5),(40,'Ovalle',5),(41,'Combarbalá',5),(42,'Monte Patria',5),(43,'Punitaqui',5),(44,'Río Hurtado',5),(45,'Valparaiso',6),(46,'Casablanca',6),(47,'Concón',6),(48,'Juan Fernández',6),(49,'Puchuncaví',6),(50,'Quintero',6),(51,'Viña del Mar',6),(52,'Isla de Pascua',6),(53,'Los Andes',6),(54,'Calle Larga',6),(55,'Rinconada',6),(56,'San Esteban',6),(57,'La Ligua',6),(58,'Cabildo',6),(59,'Papudo',6),(60,'Petorca',6),(61,'Zapallar',6),(62,'Quillota',6),(63,'Calera',6),(64,'Hijuelas',6),(65,'La Cruz',6),(66,'Nogales',6),(67,'San Antonio',6),(68,'Algarrobo',6),(69,'Cartagena',6),(70,'El Quisco',6),(71,'El Tabo',6),(72,'Santo Domingo',6),(73,'San Felipe',6),(74,'Catemu',6),(75,'Llaillay',6),(76,'Panquehue',6),(77,'Putaendo',6),(78,'Santa María',6),(79,'Quilpué',6),(80,'Limache',6),(81,'Olmué',6),(82,'Villa Alemana',6),(83,'Rancagua',7),(84,'Codegua',7),(85,'Coinco',7),(86,'Coltauco',7),(87,'Doñihue',7),(88,'Graneros',7),(89,'Las Cabras',7),(90,'Machalí',7),(91,'Malloa',7),(92,'Mostazal',7),(93,'Olivar',7),(94,'Peumo',7),(95,'Pichidegua',7),(96,'Quinta de Tilcoco',7),(97,'Rengo',7),(98,'Requínoa',7),(99,'San Vicente',7),(100,'Pichilemu',7),(101,'La Estrella',7),(102,'Litueche',7),(103,'Marchihue',7),(104,'Navidad',7),(105,'Paredones',7),(106,'San Fernando',7),(107,'Chépica',7),(108,'Chimbarongo',7),(109,'Lolol',7),(110,'Nancagua',7),(111,'Palmilla',7),(112,'Peralillo',7),(113,'Placilla',7),(114,'Pumanque',7),(115,'Santa Cruz',7),(116,'Talca',8),(117,'Constitución',8),(118,'Curepto',8),(119,'Empedrado',8),(120,'Maule',8),(121,'Pelarco',8),(122,'Pencahue',8),(123,'Río Claro',8),(124,'San Clemente',8),(125,'San Rafael',8),(126,'Cauquenes',8),(127,'Chanco',8),(128,'Pelluhue',8),(129,'Curicó',8),(130,'Hualañé',8),(131,'Licantén',8),(132,'Molina',8),(133,'Rauco',8),(134,'Romeral',8),(135,'Sagrada Familia',8),(136,'Teno',8),(137,'Vichuquén',8),(138,'Linares',8),(139,'Colbún',8),(140,'Longaví',8),(141,'Parral',8),(142,'Retiro',8),(143,'San Javier',8),(144,'Villa Alegre',8),(145,'Yerbas Buenas',8),(146,'Cobquecura',9),(147,'Coelemu',9),(148,'Ninhue',9),(149,'Portezuelo',9),(150,'Quirihue',9),(151,'Ránquil',9),(152,'Treguaco',9),(153,'Bulnes',9),(154,'Chillán Viejo',9),(155,'Chillán',9),(156,'El Carmen',9),(157,'Pemuco',9),(158,'Pinto',9),(159,'Quillón',9),(160,'San Ignacio',9),(161,'Yungay',9),(162,'Coihueco',9),(163,'Ñiquén',9),(164,'San Carlos',9),(165,'San Fabián',9),(166,'San Nicolás',9),(167,'Concepción',10),(168,'Coronel',10),(169,'Chiguayante',10),(170,'Florida',10),(171,'Hualqui',10),(172,'Lota',10),(173,'Penco',10),(174,'San Pedro de la Paz',10),(175,'Santa Juana',10),(176,'Talcahuano',10),(177,'Tomé',10),(178,'Hualpén',10),(179,'Lebu',10),(180,'Arauco',10),(181,'Cañete',10),(182,'Contulmo',10),(183,'Curanilahue',10),(184,'Los Álamos',10),(185,'Tirúa',10),(186,'Los Ángeles',10),(187,'Antuco',10),(188,'Cabrero',10),(189,'Laja',10),(190,'Mulchén',10),(191,'Nacimiento',10),(192,'Negrete',10),(193,'Quilaco',10),(194,'Quilleco',10),(195,'San Rosendo',10),(196,'Santa Bárbara',10),(197,'Tucapel',10),(198,'Yumbel',10),(199,'Alto Biobío',10),(200,'Temuco',11),(201,'Carahue',11),(202,'Cunco',11),(203,'Curarrehue',11),(204,'Freire',11),(205,'Galvarino',11),(206,'Gorbea',11),(207,'Lautaro',11),(208,'Loncoche',11),(209,'Melipeuco',11),(210,'Nueva Imperial',11),(211,'Padre las Casas',11),(212,'Perquenco',11),(213,'Pitrufquén',11),(214,'Pucón',11),(215,'Saavedra',11),(216,'Teodoro Schmidt',11),(217,'Toltén',11),(218,'Vilcún',11),(219,'Villarrica',11),(220,'Cholchol',11),(221,'Angol',11),(222,'Collipulli',11),(223,'Curacautín',11),(224,'Ercilla',11),(225,'Lonquimay',11),(226,'Los Sauces',11),(227,'Lumaco',11),(228,'Purén',11),(229,'Renaico',11),(230,'Traiguén',11),(231,'Victoria',11),(232,'Valdivia',12),(233,'Corral',12),(234,'Lanco',12),(235,'Los Lagos',12),(236,'Máfil',12),(237,'Mariquina',12),(238,'Paillaco',12),(239,'Panguipulli',12),(240,'La Unión',12),(241,'Futrono',12),(242,'Lago Ranco',12),(243,'Río Bueno',12),(244,'Puerto Montt',13),(245,'Calbuco',13),(246,'Cochamó',13),(247,'Fresia',13),(248,'Frutillar',13),(249,'Los Muermos',13),(250,'Llanquihue',13),(251,'Maullín',13),(252,'Puerto Varas',13),(253,'Castro',13),(254,'Ancud',13),(255,'Chonchi',13),(256,'Curaco de Vélez',13),(257,'Dalcahue',13),(258,'Puqueldón',13),(259,'Queilén',13),(260,'Quellón',13),(261,'Quemchi',13),(262,'Quinchao',13),(263,'Osorno',13),(264,'Puerto Octay',13),(265,'Purranque',13),(266,'Puyehue',13),(267,'Río Negro',13),(268,'San Juan de la Costa',13),(269,'San Pablo',13),(270,'Chaitén',13),(271,'Futaleufú',13),(272,'Hualaihué',13),(273,'Palena',13),(274,'Coihaique',14),(275,'Lago Verde',14),(276,'Aisén',14),(277,'Cisnes',14),(278,'Guaitecas',14),(279,'Cochrane',14),(280,'O’Higgins',14),(281,'Tortel',14),(282,'Chile Chico',14),(283,'Río Ibáñez',14),(284,'Punta Arenas',15),(285,'Laguna Blanca',15),(286,'Río Verde',15),(287,'San Gregorio',15),(288,'Cabo de Hornos (Ex Navarino)',15),(289,'Antártica',15),(290,'Porvenir',15),(291,'Primavera',15),(292,'Timaukel',15),(293,'Natales',15),(294,'Torres del Paine',15),(295,'Cerrillos',16),(296,'Cerro Navia',16),(297,'Conchalí',16),(298,'El Bosque',16),(299,'Estación Central',16),(300,'Huechuraba',16),(301,'Independencia',16),(302,'La Cisterna',16),(303,'La Florida',16),(304,'La Granja',16),(305,'La Pintana',16),(306,'La Reina',16),(307,'Las Condes',16),(308,'Lo Barnechea',16),(309,'Lo Espejo',16),(310,'Lo Prado',16),(311,'Macul',16),(312,'Maipú',16),(313,'Ñuñoa',16),(314,'Pedro Aguirre Cerda',16),(315,'Peñalolén',16),(316,'Providencia',16),(317,'Pudahuel',16),(318,'Quilicura',16),(319,'Quinta Normal',16),(320,'Recoleta',16),(321,'Renca',16),(322,'Santiago',16),(323,'San Joaquín',16),(324,'San Miguel',16),(325,'San Ramón',16),(326,'Vitacura',16),(327,'Puente Alto',16),(328,'Pirque',16),(329,'San José de Maipo',16),(330,'Colina',16),(331,'Lampa',16),(332,'Tiltil',16),(333,'San Bernardo',16),(334,'Buin',16),(335,'Calera de Tango',16),(336,'Paine',16),(337,'Melipilla',16),(338,'Alhué',16),(339,'Curacaví',16),(340,'María Pinto',16),(341,'San Pedro',16),(342,'Talagante',16),(343,'El Monte',16),(344,'Isla de Maipo',16),(345,'Padre Hurtado',16),(346,'Peñaflor',16);
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nosotros`
--

DROP TABLE IF EXISTS `nosotros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nosotros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nosotros`
--

LOCK TABLES `nosotros` WRITE;
/*!40000 ALTER TABLE `nosotros` DISABLE KEYS */;
INSERT INTO `nosotros` VALUES (1,'Web'),(2,'TV'),(3,'Redes Sociales'),(4,'Amigo');
/*!40000 ALTER TABLE `nosotros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Arica y Parinacota'),(2,'Tarapacá'),(3,'Antofagasta'),(4,'Atacama'),(5,'Coquimbo'),(6,'Valparaiso'),(7,'Del Libertador Gral. Bernardo O’Higgins'),(8,'Del Maule'),(9,'Ñuble'),(10,'Del Biobío'),(11,'De la Araucania'),(12,'De los Rios'),(13,'De los Lagos'),(14,'De Aisén del Gral. Carlos Ibáñez del Campo'),(15,'De Magallanes y de la Antártica Chilena'),(16,'Metropolitana de Santiago');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votante`
--

DROP TABLE IF EXISTS `votante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nomb_apell` varchar(200) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `votante_unique` (`rut`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votante`
--

LOCK TABLES `votante` WRITE;
/*!40000 ALTER TABLE `votante` DISABLE KEYS */;
/*!40000 ALTER TABLE `votante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voto`
--

DROP TABLE IF EXISTS `voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_votante` int(11) NOT NULL,
  `id_region` int(11) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `id_candidato` int(11) NOT NULL,
  `fecha_voto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `voto_comuna_FK` (`id_comuna`),
  KEY `voto_cargo_FK` (`id_candidato`),
  KEY `voto_region_FK` (`id_region`),
  KEY `voto_votante_FK` (`id_votante`),
  CONSTRAINT `voto_cargo_FK` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id`),
  CONSTRAINT `voto_comuna_FK` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id`),
  CONSTRAINT `voto_region_FK` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`),
  CONSTRAINT `voto_votante_FK` FOREIGN KEY (`id_votante`) REFERENCES `votante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voto`
--

LOCK TABLES `voto` WRITE;
/*!40000 ALTER TABLE `voto` DISABLE KEYS */;
/*!40000 ALTER TABLE `voto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voto_nosotros`
--

DROP TABLE IF EXISTS `voto_nosotros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voto_nosotros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_voto` int(11) NOT NULL,
  `id_nosotros` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voto_nosotros_voto_FK` (`id_voto`),
  KEY `voto_nosotros_nosotros_FK` (`id_nosotros`),
  CONSTRAINT `voto_nosotros_nosotros_FK` FOREIGN KEY (`id_nosotros`) REFERENCES `nosotros` (`id`),
  CONSTRAINT `voto_nosotros_voto_FK` FOREIGN KEY (`id_voto`) REFERENCES `voto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voto_nosotros`
--

LOCK TABLES `voto_nosotros` WRITE;
/*!40000 ALTER TABLE `voto_nosotros` DISABLE KEYS */;
/*!40000 ALTER TABLE `voto_nosotros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 13:38:59
