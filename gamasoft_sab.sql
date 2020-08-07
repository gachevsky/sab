CREATE DATABASE  IF NOT EXISTS `gamasoft_sab` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gamasoft_sab`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: gamasoft_sab
-- ------------------------------------------------------
-- Server version	5.6.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `nit` int(25) NOT NULL,
  `digitoChequeo` int(1) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` int(25) NOT NULL,
  `extension` int(4) DEFAULT NULL,
  `celular` varchar(25) DEFAULT NULL,
  `regimen_id` int(11) DEFAULT NULL,
  `nombreRepresentante` varchar(40) DEFAULT NULL,
  `documentoRepresentante` varchar(40) DEFAULT NULL,
  `nombreDueno` varchar(40) DEFAULT NULL,
  `documentoDueno` varchar(40) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nit` (`nit`),
  KEY `fk_cliente_regimen_idx` (`regimen_id`),
  KEY `fk_cliente_grupo_idx` (`grupo_id`),
  CONSTRAINT `fk_cliente_grupo_idx` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente_regimen_idx` FOREIGN KEY (`regimen_id`) REFERENCES `regimen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `nombre`, `nit`, `digitoChequeo`, `direccion`, `telefono`, `extension`, `celular`, `regimen_id`, `nombreRepresentante`, `documentoRepresentante`, `nombreDueno`, `documentoDueno`, `grupo_id`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`, `Activo`) VALUES (3,'el chango reloaded',900254235,1,'Kr 70H # 122-22',7152697,114,'3002508310',1,'william','80242138','william','80242138',NULL,NULL,NULL,NULL,NULL,0),(8,'el chango1',900254233,1,'kr 70 H # 122-22',787878787,110,'3002508310',1,'WILLIAM','78787878','WILLIAM','878787878',NULL,NULL,NULL,NULL,NULL,0),(11,'el chango2',900254231,1,'kr 70 H # 122-22',787878787,110,'3002508310',1,'WILLIAM','78787878','WILLIAM','878787878',NULL,NULL,NULL,NULL,NULL,0),(13,'juan camilo2',111111111,1,'calle 129#49-4',1234567,114,'3101234567',1,'Jairo Nieto','111111111','Carlo narino','222222222',NULL,NULL,NULL,NULL,NULL,0),(14,'cesar',78787878,1,'asdalshdjashd',465465465,112,'8798987987',1,'sakjdfasdf','21245454','aksjdkjahsdka','54546546',NULL,NULL,NULL,NULL,NULL,1),(16,'cesar 2',900254221,1,'Kr 70H # 122-22',7152697,114,'3002508310',1,'william','80242138','william','80242138',NULL,NULL,NULL,NULL,NULL,1),(17,'abskjhdkasd',900022554,1,'aklsjdalsdla',54654654,100,'546546546',1,'asljhaskjdh','465465465','ñkhakljsf','54654654',NULL,NULL,NULL,NULL,NULL,1),(20,'prueba',90000000,1,'kr 70 H # 122-22',78787878,110,'3112255336',1,'WILLIAM','4444444','WILLIAM','4777777',NULL,NULL,NULL,NULL,NULL,1),(23,'Cesar gil',546546541,1,'lakhfkjdhfkjadhf',2269296,112,'3122506598',1,'dkfjsdfskdj','45446546','lsafdaskjdhals','654654654',NULL,NULL,NULL,NULL,NULL,0),(25,'prueba220',41256322,1,'Dg 11 # 25-63',523644,111,'3125645126',1,'prueba220','10201030','Prueba220','96589658',NULL,NULL,NULL,NULL,NULL,0),(26,'Cesar gill',111111112,1,'calle 129#49-4',1234567,987,'3101234567',1,'Jairo Niño','111111111','Carlo Mariño','222222222',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `codigo_dane` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nombre` (`nombre`),
  KEY `fk_departamento_pais` (`pais_id`),
  CONSTRAINT `fk_departamento_pais` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`id`, `nombre`, `pais_id`, `codigo_dane`) VALUES (1,'Amazonas',42,'91'),(2,'Antioquia',42,'5'),(3,'Arauca',42,'81'),(4,'Archipiélago De San Andrés, Providencia Y Santa Catalina',42,'88'),(5,'Atlántico',42,'8'),(6,'Bogotá, D.C.',42,'11'),(7,'Bolívar',42,'13'),(8,'Boyacá',42,'15'),(9,'Caldas',42,'17'),(10,'Caquetá',42,'18'),(11,'Casanare',42,'85'),(12,'Cauca',42,'19'),(13,'Cesar',42,'20'),(14,'Chocó',42,'27'),(15,'Córdoba',42,'23'),(16,'Cundinamarca',42,'25'),(17,'Guainía',42,'94'),(18,'Guaviare',42,'95'),(19,'Huila',42,'41'),(20,'La Guajira',42,'44'),(21,'Magdalena',42,'47'),(22,'Meta',42,'50'),(23,'Nariño',42,'52'),(24,'Norte De Santander',42,'54'),(25,'Putumayo',42,'86'),(26,'Quindio',42,'63'),(27,'Risaralda',42,'66'),(28,'Santander',42,'68'),(29,'Sucre',42,'70'),(30,'Tolima',42,'73'),(31,'Valle Del Cauca',42,'76'),(32,'Vaupés',42,'97'),(33,'Vichada',42,'99');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `codigo_dane` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipio_departamento` (`departamento_id`),
  CONSTRAINT `fk_municipio_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` (`id`, `nombre`, `departamento_id`, `codigo_dane`) VALUES (1,'El Encanto_',1,'91263'),(2,'La Chorrera',1,'91405'),(3,'La Pedrera',1,'91407'),(4,'La Victoria',1,'91430'),(5,'Leticia',1,'91001'),(6,'Mirití - Paraná',1,'91460'),(7,'Puerto Alegría',1,'91530'),(8,'Puerto Arica',1,'91536'),(9,'Puerto Nariño',1,'91540'),(10,'Puerto Santander',1,'91669'),(11,'Tarapacá',1,'91798'),(12,'Abejorral',2,'5002'),(13,'Abriaquí',2,'5004'),(14,'Alejandría',2,'5021'),(15,'Amagá',2,'5030'),(16,'Amalfi',2,'5031'),(17,'Andes',2,'5034'),(18,'Angelópolis',2,'5036'),(19,'Angostura',2,'5038'),(20,'Anorí',2,'5040'),(21,'Anzá',2,'5044'),(22,'Apartadó',2,'5045'),(23,'Arboletes',2,'5051'),(24,'Argelia',2,'5055'),(25,'Armenia',2,'5059'),(26,'Barbosa',2,'5079'),(27,'Bello',2,'5088'),(28,'Belmira',2,'5086'),(29,'Betania',2,'5091'),(30,'Betulia',2,'5093'),(31,'Briceño',2,'5107'),(32,'Buriticá',2,'5113'),(33,'Cáceres',2,'5120'),(34,'Caicedo',2,'5125'),(35,'Caldas',2,'5129'),(36,'Campamento',2,'5134'),(37,'Cañasgordas',2,'5138'),(38,'Caracolí',2,'5142'),(39,'Caramanta',2,'5145'),(40,'Carepa',2,'5147'),(41,'Carolina',2,'5150'),(42,'Caucasia',2,'5154'),(43,'Chigorodó',2,'5172'),(44,'Cisneros',2,'5190'),(45,'Ciudad Bolívar',2,'5101'),(46,'Cocorná',2,'5197'),(47,'Concepción',2,'5206'),(48,'Concordia',2,'5209'),(49,'Copacabana',2,'5212'),(50,'Dabeiba',2,'5234'),(51,'Donmatías',2,'5237'),(52,'Ebéjico',2,'5240'),(53,'El Bagre',2,'5250'),(54,'El Carmen De Viboral',2,'5148'),(55,'El Santuario',2,'5697'),(56,'Entrerríos',2,'5264'),(57,'Envigado',2,'5266'),(58,'Fredonia',2,'5282'),(59,'Frontino',2,'5284'),(60,'Giraldo',2,'5306'),(61,'Girardota',2,'5308'),(62,'Gómez Plata',2,'5310'),(63,'Granada',2,'5313'),(64,'Guadalupe',2,'5315'),(65,'Guarne',2,'5318'),(66,'Guatapé',2,'5321'),(67,'Heliconia',2,'5347'),(68,'Hispania',2,'5353'),(69,'Itagüí',2,'5360'),(70,'Ituango',2,'5361'),(71,'Jardín',2,'5364'),(72,'Jericó',2,'5368'),(73,'La Ceja',2,'5376'),(74,'La Estrella',2,'5380'),(75,'La Pintada',2,'5390'),(76,'La Unión',2,'5400'),(77,'Liborina',2,'5411'),(78,'Maceo',2,'5425'),(79,'Marinilla',2,'5440'),(80,'Medellín',2,'5001'),(81,'Montebello',2,'5467'),(82,'Murindó',2,'5475'),(83,'Mutatá',2,'5480'),(84,'Nariño',2,'5483'),(85,'Nechí',2,'5495'),(86,'Necoclí',2,'5490'),(87,'Olaya',2,'5501'),(88,'Peñol',2,'5541'),(89,'Peque',2,'5543'),(90,'Pueblorrico',2,'5576'),(91,'Puerto Berrío',2,'5579'),(92,'Puerto Nare',2,'5585'),(93,'Puerto Triunfo',2,'5591'),(94,'Remedios',2,'5604'),(95,'Retiro',2,'5607'),(96,'Rionegro',2,'5615'),(97,'Sabanalarga',2,'5628'),(98,'Sabaneta',2,'5631'),(99,'Salgar',2,'5642'),(100,'San Andrés De Cuerquía',2,'5647'),(101,'San Carlos',2,'5649'),(102,'San Francisco',2,'5652'),(103,'San Jerónimo',2,'5656'),(104,'San José De La Montaña',2,'5658'),(105,'San Juan De Urabá',2,'5659'),(106,'San Luis',2,'5660'),(107,'San Pedro De Los Milagros',2,'5664'),(108,'San Pedro De Urabá',2,'5665'),(109,'San Rafael',2,'5667'),(110,'San Roque',2,'5670'),(111,'San Vicente Ferrer',2,'5674'),(112,'Santa Bárbara',2,'5679'),(113,'Santa Fé De Antioquia',2,'5042'),(114,'Santa Rosa De Osos',2,'5686'),(115,'Santo Domingo',2,'5690'),(116,'Segovia',2,'5736'),(117,'Sonsón',2,'5756'),(118,'Sopetrán',2,'5761'),(119,'Támesis',2,'5789'),(120,'Tarazá',2,'5790'),(121,'Tarso',2,'5792'),(122,'Titiribí',2,'5809'),(123,'Toledo',2,'5819'),(124,'Turbo',2,'5837'),(125,'Uramita',2,'5842'),(126,'Urrao',2,'5847'),(127,'Valdivia',2,'5854'),(128,'Valparaíso',2,'5856'),(129,'Vegachí',2,'5858'),(130,'Venecia',2,'5861'),(131,'Vigía Del Fuerte',2,'5873'),(132,'Yalí',2,'5885'),(133,'Yarumal',2,'5887'),(134,'Yolombó',2,'5890'),(135,'Yondó',2,'5893'),(136,'Zaragoza',2,'5895'),(137,'Arauca',3,'81001'),(138,'Arauquita',3,'81065'),(139,'Cravo Norte',3,'81220'),(140,'Fortul',3,'81300'),(141,'Puerto Rondón',3,'81591'),(142,'Saravena',3,'81736'),(143,'Tame',3,'81794'),(144,'Providencia',4,'88564'),(145,'San Andrés',4,'88001'),(146,'Baranoa',5,'8078'),(147,'Barranquilla',5,'8001'),(148,'Campo De La Cruz',5,'8137'),(149,'Candelaria',5,'8141'),(150,'Galapa',5,'8296'),(151,'Juan De Acosta',5,'8372'),(152,'Luruaco',5,'8421'),(153,'Malambo',5,'8433'),(154,'Manatí',5,'8436'),(155,'Palmar De Varela',5,'8520'),(156,'Piojó',5,'8549'),(157,'Polonuevo',5,'8558'),(158,'Ponedera',5,'8560'),(159,'Puerto Colombia',5,'8573'),(160,'Repelón',5,'8606'),(161,'Sabanagrande',5,'8634'),(162,'Sabanalarga.',5,'8638'),(163,'Santa Lucía',5,'8675'),(164,'Santo Tomás',5,'8685'),(165,'Soledad',5,'8758'),(166,'Suan',5,'8770'),(167,'Tubará',5,'8832'),(168,'Usiacurí',5,'8849'),(169,'Bogotá, D.C.',6,'11001'),(170,'Achí',7,'13006'),(171,'Altos Del Rosario',7,'13030'),(172,'Arenal',7,'13042'),(173,'Arjona',7,'13052'),(174,'Arroyohondo',7,'13062'),(175,'Barranco De Loba',7,'13074'),(176,'Calamar',7,'13140'),(177,'Cantagallo',7,'13160'),(178,'Cartagena De Indias',7,'13001'),(179,'Cicuco',7,'13188'),(180,'Clemencia',7,'13222'),(181,'Córdoba',7,'13212'),(182,'El Carmen De Bolívar',7,'13244'),(183,'El Guamo',7,'13248'),(184,'El Peñón',7,'13268'),(185,'Hatillo De Loba',7,'13300'),(186,'Magangué',7,'13430'),(187,'Mahates',7,'13433'),(188,'Margarita',7,'13440'),(189,'María La Baja',7,'13442'),(190,'Mompós',7,'13468'),(191,'Montecristo',7,'13458'),(192,'Morales',7,'13473'),(193,'Norosí',7,'13490'),(194,'Pinillos',7,'13549'),(195,'Regidor',7,'13580'),(196,'Río Viejo',7,'13600'),(197,'San Cristóbal',7,'13620'),(198,'San Estanislao',7,'13647'),(199,'San Fernando',7,'13650'),(200,'San Jacinto',7,'13654'),(201,'San Jacinto Del Cauca',7,'13655'),(202,'San Juan Nepomuceno',7,'13657'),(203,'San Martín De Loba',7,'13667'),(204,'San Pablo',7,'13670'),(205,'Santa Catalina',7,'13673'),(206,'Santa Rosa',7,'13683'),(207,'Santa Rosa Del Sur',7,'13688'),(208,'Simití',7,'13744'),(209,'Soplaviento',7,'13760'),(210,'Talaigua Nuevo',7,'13780'),(211,'Tiquisio',7,'13810'),(212,'Turbaco',7,'13836'),(213,'Turbaná',7,'13838'),(214,'Villanueva',7,'13873'),(215,'Zambrano',7,'13894'),(216,'Almeida',8,'15022'),(217,'Aquitania',8,'15047'),(218,'Arcabuco',8,'15051'),(219,'Belén',8,'15087'),(220,'Berbeo',8,'15090'),(221,'Betéitiva',8,'15092'),(222,'Boavita',8,'15097'),(223,'Boyacá',8,'15104'),(224,'Briceño.',8,'15106'),(225,'Buenavista',8,'15109'),(226,'Busbanzá',8,'15114'),(227,'Caldas.',8,'15131'),(228,'Campohermoso',8,'15135'),(229,'Cerinza',8,'15162'),(230,'Chinavita',8,'15172'),(231,'Chiquinquirá',8,'15176'),(232,'Chíquiza',8,'15232'),(233,'Chiscas',8,'15180'),(234,'Chita',8,'15183'),(235,'Chitaraque',8,'15185'),(236,'Chivatá',8,'15187'),(237,'Chivor',8,'15236'),(238,'Ciénega',8,'15189'),(239,'Cómbita',8,'15204'),(240,'Coper',8,'15212'),(241,'Corrales',8,'15215'),(242,'Covarachía',8,'15218'),(243,'Cubará',8,'15223'),(244,'Cucaita',8,'15224'),(245,'Cuítiva',8,'15226'),(246,'Duitama',8,'15238'),(247,'El Cocuy',8,'15244'),(248,'El Espino',8,'15248'),(249,'Firavitoba',8,'15272'),(250,'Floresta',8,'15276'),(251,'Gachantivá',8,'15293'),(252,'Gámeza',8,'15296'),(253,'Garagoa',8,'15299'),(254,'Guacamayas',8,'15317'),(255,'Guateque',8,'15322'),(256,'Guayatá',8,'15325'),(257,'Güicán',8,'15332'),(258,'Iza',8,'15362'),(259,'Jenesano',8,'15367'),(260,'Jericó.',8,'15368'),(261,'La Capilla',8,'15380'),(262,'La Uvita',8,'15403'),(263,'La Victoria.',8,'15401'),(264,'Labranzagrande',8,'15377'),(265,'Macanal',8,'15425'),(266,'Maripí',8,'15442'),(267,'Miraflores',8,'15455'),(268,'Mongua',8,'15464'),(269,'Monguí',8,'15466'),(270,'Moniquirá',8,'15469'),(271,'Motavita',8,'15476'),(272,'Muzo',8,'15480'),(273,'Nobsa',8,'15491'),(274,'Nuevo Colón',8,'15494'),(275,'Oicatá',8,'15500'),(276,'Otanche',8,'15507'),(277,'Pachavita',8,'15511'),(278,'Páez',8,'15514'),(279,'Paipa',8,'15516'),(280,'Pajarito',8,'15518'),(281,'Panqueba',8,'15522'),(282,'Pauna',8,'15531'),(283,'Paya',8,'15533'),(284,'Paz De Río',8,'15537'),(285,'Pesca',8,'15542'),(286,'Pisba',8,'15550'),(287,'Puerto Boyacá',8,'15572'),(288,'Quípama',8,'15580'),(289,'Ramiriquí',8,'15599'),(290,'Ráquira',8,'15600'),(291,'Rondón',8,'15621'),(292,'Saboyá',8,'15632'),(293,'Sáchica',8,'15638'),(294,'Samacá',8,'15646'),(295,'San Eduardo',8,'15660'),(296,'San José De Pare',8,'15664'),(297,'San Luis De Gaceno',8,'15667'),(298,'San Mateo',8,'15673'),(299,'San Miguel De Sema',8,'15676'),(300,'San Pablo De Borbur',8,'15681'),(301,'Santa María',8,'15690'),(302,'Santa Rosa De Viterbo',8,'15693'),(303,'Santa Sofía',8,'15696'),(304,'Santana',8,'15686'),(305,'Sativanorte',8,'15720'),(306,'Sativasur',8,'15723'),(307,'Siachoque',8,'15740'),(308,'Soatá',8,'15753'),(309,'Socha',8,'15757'),(310,'Socotá',8,'15755'),(311,'Sogamoso',8,'15759'),(312,'Somondoco',8,'15761'),(313,'Sora',8,'15762'),(314,'Soracá',8,'15764'),(315,'Sotaquirá',8,'15763'),(316,'Susacón',8,'15774'),(317,'Sutamarchán',8,'15776'),(318,'Sutatenza',8,'15778'),(319,'Tasco',8,'15790'),(320,'Tenza',8,'15798'),(321,'Tibaná',8,'15804'),(322,'Tibasosa',8,'15806'),(323,'Tinjacá',8,'15808'),(324,'Tipacoque',8,'15810'),(325,'Toca',8,'15814'),(326,'Togüí',8,'15816'),(327,'Tópaga',8,'15820'),(328,'Tota',8,'15822'),(329,'Tunja',8,'15001'),(330,'Tununguá',8,'15832'),(331,'Turmequé',8,'15835'),(332,'Tuta',8,'15837'),(333,'Tutazá',8,'15839'),(334,'Úmbita',8,'15842'),(335,'Ventaquemada',8,'15861'),(336,'Villa De Leyva',8,'15407'),(337,'Viracachá',8,'15879'),(338,'Zetaquira',8,'15897'),(339,'Aguadas',9,'17013'),(340,'Anserma',9,'17042'),(341,'Aranzazu',9,'17050'),(342,'Belalcázar',9,'17088'),(343,'Chinchiná',9,'17174'),(344,'Filadelfia',9,'17272'),(345,'La Dorada',9,'17380'),(346,'La Merced',9,'17388'),(347,'Manizales',9,'17001'),(348,'Manzanares',9,'17433'),(349,'Marmato',9,'17442'),(350,'Marquetalia',9,'17444'),(351,'Marulanda',9,'17446'),(352,'Neira',9,'17486'),(353,'Norcasia',9,'17495'),(354,'Pácora',9,'17513'),(355,'Palestina',9,'17524'),(356,'Pensilvania',9,'17541'),(357,'Riosucio',9,'17614'),(358,'Risaralda',9,'17616'),(359,'Salamina',9,'17653'),(360,'Samaná',9,'17662'),(361,'San José',9,'17665'),(362,'Supía',9,'17777'),(363,'Victoria',9,'17867'),(364,'Villamaría',9,'17873'),(365,'Viterbo',9,'17877'),(366,'Albania',10,'18029'),(367,'Belén De Los Andaquíes',10,'18094'),(368,'Cartagena Del Chairá',10,'18150'),(369,'Curillo',10,'18205'),(370,'El Doncello',10,'18247'),(371,'El Paujíl',10,'18256'),(372,'Florencia',10,'18001'),(373,'La Montañita',10,'18410'),(374,'Milán',10,'18460'),(375,'Morelia',10,'18479'),(376,'Puerto Rico',10,'18592'),(377,'San José Del Fragua',10,'18610'),(378,'San Vicente Del Caguán',10,'18753'),(379,'Solano',10,'18756'),(380,'Solita',10,'18785'),(381,'Valparaíso',10,'18860'),(382,'Aguazul',11,'85010'),(383,'Chámeza',11,'85015'),(384,'Hato Corozal',11,'85125'),(385,'La Salina',11,'85136'),(386,'Maní',11,'85139'),(387,'Monterrey',11,'85162'),(388,'Nunchía',11,'85225'),(389,'Orocué',11,'85230'),(390,'Paz De Ariporo',11,'85250'),(391,'Pore',11,'85263'),(392,'Recetor',11,'85279'),(393,'Sabanalarga',11,'85300'),(394,'Sácama',11,'85315'),(395,'San Luis De Palenque',11,'85325'),(396,'Támara',11,'85400'),(397,'Tauramena',11,'85410'),(398,'Trinidad',11,'85430'),(399,'Villanueva',11,'85440'),(400,'Yopal',11,'85001'),(401,'Almaguer',12,'19022'),(402,'Argelia',12,'19050'),(403,'Balboa',12,'19075'),(404,'Bolívar',12,'19100'),(405,'Buenos Aires',12,'19110'),(406,'Cajibío',12,'19130'),(407,'Caldono',12,'19137'),(408,'Caloto',12,'19142'),(409,'Corinto',12,'19212'),(410,'El Tambo',12,'19256'),(411,'Florencia',12,'19290'),(412,'Guachené',12,'19300'),(413,'Guapí',12,'19318'),(414,'Inzá',12,'19355'),(415,'Jambaló',12,'19364'),(416,'La Sierra',12,'19392'),(417,'La Vega',12,'19397'),(418,'López De Micay',12,'19418'),(419,'Mercaderes',12,'19450'),(420,'Miranda',12,'19455'),(421,'Morales',12,'19473'),(422,'Padilla',12,'19513'),(423,'Páez',12,'19517'),(424,'Patía',12,'19532'),(425,'Piamonte',12,'19533'),(426,'Piendamó',12,'19548'),(427,'Popayán',12,'19001'),(428,'Puerto Tejada',12,'19573'),(429,'Puracé',12,'19585'),(430,'Rosas',12,'19622'),(431,'San Sebastián',12,'19693'),(432,'Santa Rosa',12,'19701'),(433,'Santander De Quilichao',12,'19698'),(434,'Silvia',12,'19743'),(435,'Sotara',12,'19760'),(436,'Suárez',12,'19780'),(437,'Sucre',12,'19785'),(438,'Timbío',12,'19807'),(439,'Timbiquí',12,'19809'),(440,'Toribío',12,'19821'),(441,'Totoró',12,'19824'),(442,'Villa Rica',12,'19845'),(443,'Aguachica',13,'20011'),(444,'Agustín Codazzi',13,'20013'),(445,'Astrea',13,'20032'),(446,'Becerril',13,'20045'),(447,'Bosconia',13,'20060'),(448,'Chimichagua',13,'20175'),(449,'Chiriguaná',13,'20178'),(450,'Curumaní',13,'20228'),(451,'El Copey',13,'20238'),(452,'El Paso',13,'20250'),(453,'Gamarra',13,'20295'),(454,'González',13,'20310'),(455,'La Gloria',13,'20383'),(456,'La Jagua De Ibirico',13,'20400'),(457,'La Paz',13,'20621'),(458,'Manaure Balcón Del Cesar',13,'20443'),(459,'Pailitas',13,'20517'),(460,'Pelaya',13,'20550'),(461,'Pueblo Bello',13,'20570'),(462,'Río De Oro',13,'20614'),(463,'San Alberto',13,'20710'),(464,'San Diego',13,'20750'),(465,'San Martín',13,'20770'),(466,'Tamalameque',13,'20787'),(467,'Valledupar',13,'20001'),(468,'Acandí',14,'27006'),(469,'Alto Baudó',14,'27025'),(470,'Atrato',14,'27050'),(471,'Bagadó',14,'27073'),(472,'Bahía Solano',14,'27075'),(473,'Bajo Baudó',14,'27077'),(474,'Bojayá',14,'27099'),(475,'Carmen Del Darién',14,'27150'),(476,'Cértegui',14,'27160'),(477,'Condoto',14,'27205'),(478,'El Cantón Del San Pablo',14,'27135'),(479,'El Carmen De Atrato',14,'27245'),(480,'El Litoral Del San Juan',14,'27250'),(481,'Istmina',14,'27361'),(482,'Juradó',14,'27372'),(483,'Lloró',14,'27413'),(484,'Medio Atrato',14,'27425'),(485,'Medio Baudó',14,'27430'),(486,'Medio San Juan',14,'27450'),(487,'Nóvita',14,'27491'),(488,'Nuquí',14,'27495'),(489,'Quibdó',14,'27001'),(490,'Río Iró',14,'27580'),(491,'Río Quito',14,'27600'),(492,'Riosucio',14,'27615'),(493,'San José Del Palmar',14,'27660'),(494,'Sipí',14,'27745'),(495,'Tadó',14,'27787'),(496,'Unguía',14,'27800'),(497,'Unión Panamericana',14,'27810'),(498,'Ayapel',15,'23068'),(499,'Buenavista',15,'23079'),(500,'Canalete',15,'23090'),(501,'Cereté',15,'23162'),(502,'Chimá',15,'23168'),(503,'Chinú',15,'23182'),(504,'Ciénaga De Oro',15,'23189'),(505,'Cotorra',15,'23300'),(506,'La Apartada',15,'23350'),(507,'Lorica',15,'23417'),(508,'Los Córdobas',15,'23419'),(509,'Momil',15,'23464'),(510,'Montelíbano',15,'23466'),(511,'Montería',15,'23001'),(512,'Moñitos',15,'23500'),(513,'Planeta Rica',15,'23555'),(514,'Pueblo Nuevo',15,'23570'),(515,'Puerto Escondido',15,'23574'),(516,'Puerto Libertador',15,'23580'),(517,'Purísima De La Concepción',15,'23586'),(518,'Sahagún',15,'23660'),(519,'San Andrés De Sotavento',15,'23670'),(520,'San Antero',15,'23672'),(521,'San Bernardo Del Viento',15,'23675'),(522,'San Carlos',15,'23678'),(523,'San José De Uré',15,'23682'),(524,'San Pelayo',15,'23686'),(525,'Tierralta',15,'23807'),(526,'Tuchín',15,'23815'),(527,'Valencia',15,'23855'),(528,'Agua De Dios',16,'25001'),(529,'Albán',16,'25019'),(530,'Anapoima',16,'25035'),(531,'Anolaima',16,'25040'),(532,'Apulo',16,'25599'),(533,'Arbeláez',16,'25053'),(534,'Beltrán',16,'25086'),(535,'Bituima',16,'25095'),(536,'Bojacá',16,'25099'),(537,'Cabrera',16,'25120'),(538,'Cachipay',16,'25123'),(539,'Cajicá',16,'25126'),(540,'Caparrapí',16,'25148'),(541,'Cáqueza',16,'25151'),(542,'Carmen De Carupa',16,'25154'),(543,'Chaguaní',16,'25168'),(544,'Chía',16,'25175'),(545,'Chipaque',16,'25178'),(546,'Choachí',16,'25181'),(547,'Chocontá',16,'25183'),(548,'Cogua',16,'25200'),(549,'Cota',16,'25214'),(550,'Cucunubá',16,'25224'),(551,'El Colegio',16,'25245'),(552,'El Peñón',16,'25258'),(553,'El Rosal',16,'25260'),(554,'Facatativá',16,'25269'),(555,'Fómeque',16,'25279'),(556,'Fosca',16,'25281'),(557,'Funza',16,'25286'),(558,'Fúquene',16,'25288'),(559,'Fusagasugá',16,'25290'),(560,'Gachalá',16,'25293'),(561,'Gachancipá',16,'25295'),(562,'Gachetá',16,'25297'),(563,'Gama',16,'25299'),(564,'Girardot',16,'25307'),(565,'Granada',16,'25312'),(566,'Guachetá',16,'25317'),(567,'Guaduas',16,'25320'),(568,'Guasca',16,'25322'),(569,'Guataquí',16,'25324'),(570,'Guatavita',16,'25326'),(571,'Guayabal De Síquima',16,'25328'),(572,'Guayabetal',16,'25335'),(573,'Gutiérrez',16,'25339'),(574,'Jerusalén',16,'25368'),(575,'Junín',16,'25372'),(576,'La Calera',16,'25377'),(577,'La Mesa',16,'25386'),(578,'La Palma',16,'25394'),(579,'La Peña',16,'25398'),(580,'La Vega',16,'25402'),(581,'Lenguazaque',16,'25407'),(582,'Machetá',16,'25426'),(583,'Madrid',16,'25430'),(584,'Manta',16,'25436'),(585,'Medina',16,'25438'),(586,'Mosquera',16,'25473'),(587,'Nariño',16,'25483'),(588,'Nemocón',16,'25486'),(589,'Nilo',16,'25488'),(590,'Nimaima',16,'25489'),(591,'Nocaima',16,'25491'),(592,'Pacho',16,'25513'),(593,'Paime',16,'25518'),(594,'Pandi',16,'25524'),(595,'Paratebueno',16,'25530'),(596,'Pasca',16,'25535'),(597,'Puerto Salgar',16,'25572'),(598,'Pulí',16,'25580'),(599,'Quebradanegra',16,'25592'),(600,'Quetame',16,'25594'),(601,'Quipile',16,'25596'),(602,'Ricaurte',16,'25612'),(603,'San Antonio Del Tequendama',16,'25645'),(604,'San Bernardo',16,'25649'),(605,'San Cayetano',16,'25653'),(606,'San Francisco',16,'25658'),(607,'San Juan De Rioseco',16,'25662'),(608,'Sasaima',16,'25718'),(609,'Sesquilé',16,'25736'),(610,'Sibaté',16,'25740'),(611,'Silvania',16,'25743'),(612,'Simijaca',16,'25745'),(613,'Soacha',16,'25754'),(614,'Sopó',16,'25758'),(615,'Subachoque',16,'25769'),(616,'Suesca',16,'25772'),(617,'Supatá',16,'25777'),(618,'Susa',16,'25779'),(619,'Sutatausa',16,'25781'),(620,'Tabio',16,'25785'),(621,'Tausa',16,'25793'),(622,'Tena',16,'25797'),(623,'Tenjo',16,'25799'),(624,'Tibacuy',16,'25805'),(625,'Tibirita',16,'25807'),(626,'Tocaima',16,'25815'),(627,'Tocancipá',16,'25817'),(628,'Topaipí',16,'25823'),(629,'Ubalá',16,'25839'),(630,'Ubaque',16,'25841'),(631,'Une',16,'25845'),(632,'Útica',16,'25851'),(633,'Venecia',16,'25506'),(634,'Vergara',16,'25862'),(635,'Vianí',16,'25867'),(636,'Villa De San Diego De Ubaté',16,'25843'),(637,'Villagómez',16,'25871'),(638,'Villapinzón',16,'25873'),(639,'Villeta',16,'25875'),(640,'Viotá',16,'25878'),(641,'Yacopí',16,'25885'),(642,'Zipacón',16,'25898'),(643,'Zipaquirá',16,'25899'),(644,'Barranco Minas',17,'94343'),(645,'Cacahual',17,'94886'),(646,'Inírida',17,'94001'),(647,'La Guadalupe',17,'94885'),(648,'Mapiripana',17,'94663'),(649,'Morichal',17,'94888'),(650,'Pana Pana',17,'94887'),(651,'Puerto Colombia',17,'94884'),(652,'San Felipe',17,'94883'),(653,'Calamar',18,'95015'),(654,'El Retorno',18,'95025'),(655,'Miraflores',18,'95200'),(656,'San José Del Guaviare',18,'95001'),(657,'Acevedo',19,'41006'),(658,'Agrado',19,'41013'),(659,'Aipe',19,'41016'),(660,'Algeciras',19,'41020'),(661,'Altamira',19,'41026'),(662,'Baraya',19,'41078'),(663,'Campoalegre',19,'41132'),(664,'Colombia',19,'41206'),(665,'Elías',19,'41244'),(666,'Garzón',19,'41298'),(667,'Gigante',19,'41306'),(668,'Guadalupe',19,'41319'),(669,'Hobo',19,'41349'),(670,'Íquira',19,'41357'),(671,'Isnos',19,'41359'),(672,'La Argentina',19,'41378'),(673,'La Plata',19,'41396'),(674,'Nátaga',19,'41483'),(675,'Neiva',19,'41001'),(676,'Oporapa',19,'41503'),(677,'Paicol',19,'41518'),(678,'Palermo',19,'41524'),(679,'Palestina',19,'41530'),(680,'Pital',19,'41548'),(681,'Pitalito',19,'41551'),(682,'Rivera',19,'41615'),(683,'Saladoblanco',19,'41660'),(684,'San Agustín',19,'41668'),(685,'Santa María',19,'41676'),(686,'Suaza',19,'41770'),(687,'Tarqui',19,'41791'),(688,'Tello',19,'41799'),(689,'Teruel',19,'41801'),(690,'Tesalia',19,'41797'),(691,'Timaná',19,'41807'),(692,'Villavieja',19,'41872'),(693,'Yaguará',19,'41885'),(694,'Albania',20,'44035'),(695,'Barrancas',20,'44078'),(696,'Dibulla',20,'44090'),(697,'Distracción',20,'44098'),(698,'El Molino',20,'44110'),(699,'Fonseca',20,'44279'),(700,'Hatonuevo',20,'44378'),(701,'La Jagua Del Pilar',20,'44420'),(702,'Maicao',20,'44430'),(703,'Manaure',20,'44560'),(704,'Riohacha',20,'44001'),(705,'San Juan Del Cesar',20,'44650'),(706,'Uribia',20,'44847'),(707,'Urumita',20,'44855'),(708,'Villanueva',20,'44874'),(709,'Algarrobo',21,'47030'),(710,'Aracataca',21,'47053'),(711,'Ariguaní',21,'47058'),(712,'Cerro De San Antonio',21,'47161'),(713,'Chivolo',21,'47170'),(714,'Ciénaga',21,'47189'),(715,'Concordia',21,'47205'),(716,'El Banco',21,'47245'),(717,'El Piñón',21,'47258'),(718,'El Retén',21,'47268'),(719,'Fundación',21,'47288'),(720,'Guamal',21,'47318'),(721,'Nueva Granada',21,'47460'),(722,'Pedraza',21,'47541'),(723,'Pijiño Del Carmen',21,'47545'),(724,'Pivijay',21,'47551'),(725,'Plato',21,'47555'),(726,'Puebloviejo',21,'47570'),(727,'Remolino',21,'47605'),(728,'Sabanas De San Ángel',21,'47660'),(729,'Salamina',21,'47675'),(730,'San Sebastián De Buenavista',21,'47692'),(731,'San Zenón',21,'47703'),(732,'Santa Ana',21,'47707'),(733,'Santa Bárbara De Pinto',21,'47720'),(734,'Santa Marta',21,'47001'),(735,'Sitionuevo',21,'47745'),(736,'Tenerife',21,'47798'),(737,'Zapayán',21,'47960'),(738,'Zona Bananera',21,'47980'),(739,'Acacías',22,'50006'),(740,'Barranca De Upía',22,'50110'),(741,'Cabuyaro',22,'50124'),(742,'Castilla La Nueva',22,'50150'),(743,'Cumaral',22,'50226'),(744,'El Calvario',22,'50245'),(745,'El Castillo',22,'50251'),(746,'El Dorado',22,'50270'),(747,'Fuente De Oro',22,'50287'),(748,'Granada',22,'50313'),(749,'Guamal',22,'50318'),(750,'La Macarena',22,'50350'),(751,'Lejanías',22,'50400'),(752,'Mapiripán',22,'50325'),(753,'Mesetas',22,'50330'),(754,'Puerto Concordia',22,'50450'),(755,'Puerto Gaitán',22,'50568'),(756,'Puerto Lleras',22,'50577'),(757,'Puerto López',22,'50573'),(758,'Puerto Rico',22,'50590'),(759,'Restrepo',22,'50606'),(760,'San Carlos De Guaroa',22,'50680'),(761,'San Juan De Arama',22,'50683'),(762,'San Juanito',22,'50686'),(763,'San Luis De Cubarral',22,'50223'),(764,'San Martín',22,'50689'),(765,'Uribe',22,'50370'),(766,'Villavicencio',22,'50001'),(767,'Vistahermosa',22,'50711'),(768,'Albán',23,'52019'),(769,'Aldana',23,'52022'),(770,'Ancuyá',23,'52036'),(771,'Arboleda',23,'52051'),(772,'Barbacoas',23,'52079'),(773,'Belén',23,'52083'),(774,'Buesaco',23,'52110'),(775,'Chachagüí',23,'52240'),(776,'Colón',23,'52203'),(777,'Consacá',23,'52207'),(778,'Contadero',23,'52210'),(779,'Córdoba',23,'52215'),(780,'Cuaspúd',23,'52224'),(781,'Cumbal',23,'52227'),(782,'Cumbitara',23,'52233'),(783,'El Charco',23,'52250'),(784,'El Peñol',23,'52254'),(785,'El Rosario',23,'52256'),(786,'El Tablón De Gómez',23,'52258'),(787,'El Tambo',23,'52260'),(788,'Francisco Pizarro',23,'52520'),(789,'Funes',23,'52287'),(790,'Guachucal',23,'52317'),(791,'Guaitarilla',23,'52320'),(792,'Gualmatán',23,'52323'),(793,'Iles',23,'52352'),(794,'Imués',23,'52354'),(795,'Ipiales',23,'52356'),(796,'La Cruz',23,'52378'),(797,'La Florida',23,'52381'),(798,'La Llanada',23,'52385'),(799,'La Tola',23,'52390'),(800,'La Unión',23,'52399'),(801,'Leiva',23,'52405'),(802,'Linares',23,'52411'),(803,'Los Andes',23,'52418'),(804,'Magüí',23,'52427'),(805,'Mallama',23,'52435'),(806,'Mosquera',23,'52473'),(807,'Nariño',23,'52480'),(808,'Olaya Herrera',23,'52490'),(809,'Ospina',23,'52506'),(810,'Pasto',23,'52001'),(811,'Policarpa',23,'52540'),(812,'Potosí',23,'52560'),(813,'Providencia',23,'52565'),(814,'Puerres',23,'52573'),(815,'Pupiales',23,'52585'),(816,'Ricaurte',23,'52612'),(817,'Roberto Payán',23,'52621'),(818,'Samaniego',23,'52678'),(819,'San Andrés De Tumaco',23,'52835'),(820,'San Bernardo',23,'52685'),(821,'San Lorenzo',23,'52687'),(822,'San Pablo',23,'52693'),(823,'San Pedro De Cartago',23,'52694'),(824,'Sandoná',23,'52683'),(825,'Santa Bárbara',23,'52696'),(826,'Santacruz',23,'52699'),(827,'Sapuyes',23,'52720'),(828,'Taminango',23,'52786'),(829,'Tangua',23,'52788'),(830,'Túquerres',23,'52838'),(831,'Yacuanquer',23,'52885'),(832,'Ábrego',24,'54003'),(833,'Arboledas',24,'54051'),(834,'Bochalema',24,'54099'),(835,'Bucarasica',24,'54109'),(836,'Cáchira',24,'54128'),(837,'Cácota',24,'54125'),(838,'Chinácota',24,'54172'),(839,'Chitagá',24,'54174'),(840,'Convención',24,'54206'),(841,'Cúcuta',24,'54001'),(842,'Cucutilla',24,'54223'),(843,'Durania',24,'54239'),(844,'El Carmen',24,'54245'),(845,'El Tarra',24,'54250'),(846,'El Zulia',24,'54261'),(847,'Gramalote',24,'54313'),(848,'Hacarí',24,'54344'),(849,'Herrán',24,'54347'),(850,'La Esperanza',24,'54385'),(851,'La Playa',24,'54398'),(852,'Labateca',24,'54377'),(853,'Los Patios',24,'54405'),(854,'Lourdes',24,'54418'),(855,'Mutiscua',24,'54480'),(856,'Ocaña',24,'54498'),(857,'Pamplona',24,'54518'),(858,'Pamplonita',24,'54520'),(859,'Puerto Santander',24,'54553'),(860,'Ragonvalia',24,'54599'),(861,'Salazar',24,'54660'),(862,'San Calixto',24,'54670'),(863,'San Cayetano',24,'54673'),(864,'Santiago',24,'54680'),(865,'Sardinata',24,'54720'),(866,'Silos',24,'54743'),(867,'Teorama',24,'54800'),(868,'Tibú',24,'54810'),(869,'Toledo',24,'54820'),(870,'Villa Caro',24,'54871'),(871,'Villa Del Rosario',24,'54874'),(872,'Colón',25,'86219'),(873,'Mocoa',25,'86001'),(874,'Orito',25,'86320'),(875,'Puerto Asís',25,'86568'),(876,'Puerto Caicedo',25,'86569'),(877,'Puerto Guzmán',25,'86571'),(878,'Puerto Leguízamo',25,'86573'),(879,'San Francisco',25,'86755'),(880,'San Miguel',25,'86757'),(881,'Santiago',25,'86760'),(882,'Sibundoy',25,'86749'),(883,'Valle Del Guamuez',25,'86865'),(884,'Villagarzón',25,'86885'),(885,'Armenia',26,'63001'),(886,'Buenavista',26,'63111'),(887,'Calarcá',26,'63130'),(888,'Circasia',26,'63190'),(889,'Córdoba',26,'63212'),(890,'Filandia',26,'63272'),(891,'Génova',26,'63302'),(892,'La Tebaida',26,'63401'),(893,'Montenegro',26,'63470'),(894,'Pijao',26,'63548'),(895,'Quimbaya',26,'63594'),(896,'Salento',26,'63690'),(897,'Apía',27,'66045'),(898,'Balboa',27,'66075'),(899,'Belén De Umbría',27,'66088'),(900,'Dosquebradas',27,'66170'),(901,'Guática',27,'66318'),(902,'La Celia',27,'66383'),(903,'La Virginia',27,'66400'),(904,'Marsella',27,'66440'),(905,'Mistrató',27,'66456'),(906,'Pereira',27,'66001'),(907,'Pueblo Rico',27,'66572'),(908,'Quinchía',27,'66594'),(909,'Santa Rosa De Cabal',27,'66682'),(910,'Santuario',27,'66687'),(911,'Aguada',28,'68013'),(912,'Albania',28,'68020'),(913,'Aratoca',28,'68051'),(914,'Barbosa',28,'68077'),(915,'Barichara',28,'68079'),(916,'Barrancabermeja',28,'68081'),(917,'Betulia',28,'68092'),(918,'Bolívar',28,'68101'),(919,'Bucaramanga',28,'68001'),(920,'Cabrera',28,'68121'),(921,'California',28,'68132'),(922,'Capitanejo',28,'68147'),(923,'Carcasí',28,'68152'),(924,'Cepitá',28,'68160'),(925,'Cerrito',28,'68162'),(926,'Charalá',28,'68167'),(927,'Charta',28,'68169'),(928,'Chima',28,'68176'),(929,'Chipatá',28,'68179'),(930,'Cimitarra',28,'68190'),(931,'Concepción',28,'68207'),(932,'Confines',28,'68209'),(933,'Contratación',28,'68211'),(934,'Coromoro',28,'68217'),(935,'Curití',28,'68229'),(936,'El Carmen De Chucurí',28,'68235'),(937,'El Guacamayo',28,'68245'),(938,'El Peñón',28,'68250'),(939,'El Playón',28,'68255'),(940,'Encino',28,'68264'),(941,'Enciso',28,'68266'),(942,'Florián',28,'68271'),(943,'Floridablanca',28,'68276'),(944,'Galán',28,'68296'),(945,'Gámbita',28,'68298'),(946,'Girón',28,'68307'),(947,'Guaca',28,'68318'),(948,'Guadalupe',28,'68320'),(949,'Guapotá',28,'68322'),(950,'Guavatá',28,'68324'),(951,'Güepsa',28,'68327'),(952,'Hato',28,'68344'),(953,'Jesús María',28,'68368'),(954,'Jordán',28,'68370'),(955,'La Belleza',28,'68377'),(956,'La Paz',28,'68397'),(957,'Landázuri',28,'68385'),(958,'Lebrija',28,'68406'),(959,'Los Santos',28,'68418'),(960,'Macaravita',28,'68425'),(961,'Málaga',28,'68432'),(962,'Matanza',28,'68444'),(963,'Mogotes',28,'68464'),(964,'Molagavita',28,'68468'),(965,'Ocamonte',28,'68498'),(966,'Oiba',28,'68500'),(967,'Onzaga',28,'68502'),(968,'Palmar',28,'68522'),(969,'Palmas Del Socorro',28,'68524'),(970,'Páramo',28,'68533'),(971,'Piedecuesta',28,'68547'),(972,'Pinchote',28,'68549'),(973,'Puente Nacional',28,'68572'),(974,'Puerto Parra',28,'68573'),(975,'Puerto Wilches',28,'68575'),(976,'Rionegro',28,'68615'),(977,'Sabana De Torres',28,'68655'),(978,'San Andrés',28,'68669'),(979,'San Benito',28,'68673'),(980,'San Gil',28,'68679'),(981,'San Joaquín',28,'68682'),(982,'San José De Miranda',28,'68684'),(983,'San Miguel',28,'68686'),(984,'San Vicente De Chucurí',28,'68689'),(985,'Santa Bárbara',28,'68705'),(986,'Santa Helena Del Opón',28,'68720'),(987,'Simacota',28,'68745'),(988,'Socorro',28,'68755'),(989,'Suaita',28,'68770'),(990,'Sucre',28,'68773'),(991,'Suratá',28,'68780'),(992,'Tona',28,'68820'),(993,'Valle De San José',28,'68855'),(994,'Vélez',28,'68861'),(995,'Vetas',28,'68867'),(996,'Villanueva',28,'68872'),(997,'Zapatoca',28,'68895'),(998,'Buenavista',29,'70110'),(999,'Caimito',29,'70124'),(1000,'Chalán',29,'70230'),(1001,'Coloso',29,'70204'),(1002,'Corozal',29,'70215'),(1003,'Coveñas',29,'70221'),(1004,'El Roble',29,'70233'),(1005,'Galeras',29,'70235'),(1006,'Guaranda',29,'70265'),(1007,'La Unión',29,'70400'),(1008,'Los Palmitos',29,'70418'),(1009,'Majagual',29,'70429'),(1010,'Morroa',29,'70473'),(1011,'Ovejas',29,'70508'),(1012,'Palmito',29,'70523'),(1013,'Sampués',29,'70670'),(1014,'San Benito Abad',29,'70678'),(1015,'San Juan De Betulia',29,'70702'),(1016,'San Luis De Sincé',29,'70742'),(1017,'San Marcos',29,'70708'),(1018,'San Onofre',29,'70713'),(1019,'San Pedro',29,'70717'),(1020,'Santiago De Tolú',29,'70820'),(1021,'Sincelejo',29,'70001'),(1022,'Sucre',29,'70771'),(1023,'Tolú Viejo',29,'70823'),(1024,'Alpujarra',30,'73024'),(1025,'Alvarado',30,'73026'),(1026,'Ambalema',30,'73030'),(1027,'Anzoátegui',30,'73043'),(1028,'Armero Guayabal',30,'73055'),(1029,'Ataco',30,'73067'),(1030,'Cajamarca',30,'73124'),(1031,'Carmen De Apicalá',30,'73148'),(1032,'Casabianca',30,'73152'),(1033,'Chaparral',30,'73168'),(1034,'Coello',30,'73200'),(1035,'Coyaima',30,'73217'),(1036,'Cunday',30,'73226'),(1037,'Dolores',30,'73236'),(1038,'Espinal',30,'73268'),(1039,'Falan',30,'73270'),(1040,'Flandes',30,'73275'),(1041,'Fresno',30,'73283'),(1042,'Guamo',30,'73319'),(1043,'Herveo',30,'73347'),(1044,'Honda',30,'73349'),(1045,'Ibagué',30,'73001'),(1046,'Icononzo',30,'73352'),(1047,'Lérida',30,'73408'),(1048,'Líbano',30,'73411'),(1049,'Melgar',30,'73449'),(1050,'Murillo',30,'73461'),(1051,'Natagaima',30,'73483'),(1052,'Ortega',30,'73504'),(1053,'Palocabildo',30,'73520'),(1054,'Piedras',30,'73547'),(1055,'Planadas',30,'73555'),(1056,'Prado',30,'73563'),(1057,'Purificación',30,'73585'),(1058,'Rioblanco',30,'73616'),(1059,'Roncesvalles',30,'73622'),(1060,'Rovira',30,'73624'),(1061,'Saldaña',30,'73671'),(1062,'San Antonio',30,'73675'),(1063,'San Luis',30,'73678'),(1064,'San Sebastián De Mariquita',30,'73443'),(1065,'Santa Isabel',30,'73686'),(1066,'Suárez',30,'73770'),(1067,'Valle De San Juan',30,'73854'),(1068,'Venadillo',30,'73861'),(1069,'Villahermosa',30,'73870'),(1070,'Villarrica',30,'73873'),(1071,'Alcalá',31,'76020'),(1072,'Andalucía',31,'76036'),(1073,'Ansermanuevo',31,'76041'),(1074,'Argelia',31,'76054'),(1075,'Bolívar',31,'76100'),(1076,'Buenaventura',31,'76109'),(1077,'Bugalagrande',31,'76113'),(1078,'Caicedonia',31,'76122'),(1079,'Cali',31,'76001'),(1080,'Calima',31,'76126'),(1081,'Candelaria',31,'76130'),(1082,'Cartago',31,'76147'),(1083,'Dagua',31,'76233'),(1084,'El Águila',31,'76243'),(1085,'El Cairo',31,'76246'),(1086,'El Cerrito',31,'76248'),(1087,'El Dovio',31,'76250'),(1088,'Florida',31,'76275'),(1089,'Ginebra',31,'76306'),(1090,'Guacarí',31,'76318'),(1091,'Guadalajara De Buga',31,'76111'),(1092,'Jamundí',31,'76364'),(1093,'La Cumbre',31,'76377'),(1094,'La Unión',31,'76400'),(1095,'La Victoria',31,'76403'),(1096,'Obando',31,'76497'),(1097,'Palmira',31,'76520'),(1098,'Pradera',31,'76563'),(1099,'Restrepo',31,'76606'),(1100,'Riofrío',31,'76616'),(1101,'Roldanillo',31,'76622'),(1102,'San Pedro',31,'76670'),(1103,'Sevilla',31,'76736'),(1104,'Toro',31,'76823'),(1105,'Trujillo',31,'76828'),(1106,'Tuluá',31,'76834'),(1107,'Ulloa',31,'76845'),(1108,'Versalles',31,'76863'),(1109,'Vijes',31,'76869'),(1110,'Yotoco',31,'76890'),(1111,'Yumbo',31,'76892'),(1112,'Zarzal',31,'76895'),(1113,'Carurú',32,'97161'),(1114,'Mitú',32,'97001'),(1115,'Pacoa',32,'97511'),(1116,'Papunaua',32,'97777'),(1117,'Taraira',32,'97666'),(1118,'Yavaraté',32,'97889'),(1119,'Cumaribo',33,'99773'),(1120,'La Primavera',33,'99524'),(1121,'Puerto Carreño',33,'99001'),(1122,'Santa Rosalía',33,'99624');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` (`id`, `nombre`) VALUES (1,'Afganistán'),(2,'Albania'),(3,'Alemania'),(4,'Andorra'),(5,'Angola'),(6,'Antigua y Barbuda'),(7,'Arabia Saudita'),(8,'Argelia'),(9,'Argentina'),(10,'Armenia'),(11,'Australia'),(12,'Austria'),(13,'Azerbaiyán'),(14,'Bahamas'),(15,'Bangladés'),(16,'Barbados'),(17,'Baréin'),(18,'Bélgica'),(19,'Belice'),(20,'Benín'),(21,'Bielorrusia'),(22,'Birmania'),(23,'Bolivia'),(24,'Bosnia y Herzegovina'),(25,'Botsuana'),(26,'Brasil'),(27,'Brunéi'),(28,'Bulgaria'),(29,'Burkina Faso'),(30,'Burundi'),(31,'Bután'),(32,'Cabo Verde'),(33,'Camboya'),(34,'Camerún'),(35,'Canadá'),(36,'Catar'),(37,'Chad'),(38,'Chile'),(39,'China'),(40,'Chipre'),(41,'Ciudad del Vaticano'),(42,'Colombia'),(43,'Comoras'),(44,'Corea del Norte'),(45,'Corea del Sur'),(46,'Costa de Marfil'),(47,'Costa Rica'),(48,'Croacia'),(49,'Cuba'),(50,'Dinamarca'),(51,'Dominica'),(52,'Ecuador'),(53,'Egipto'),(54,'El Salvador'),(55,'Emiratos Árabes Unidos'),(56,'Eritrea'),(57,'Eslovaquia'),(58,'Eslovenia'),(59,'España'),(60,'Estados Unidos'),(61,'Estonia'),(62,'Etiopía'),(63,'Filipinas'),(64,'Finlandia'),(65,'Fiyi'),(66,'Francia'),(67,'Gabón'),(68,'Gambia'),(69,'Georgia'),(70,'Ghana'),(71,'Granada'),(72,'Grecia'),(73,'Guatemala'),(74,'Guayana'),(75,'Guinea'),(76,'Guinea ecuatorial'),(77,'Guinea-Bisáu'),(78,'Haití'),(79,'Honduras'),(80,'Hungría'),(81,'India'),(82,'Indonesia'),(83,'Irak'),(84,'Irán'),(85,'Irlanda'),(86,'Islandia'),(87,'Islas Marshall'),(88,'Islas Salomón'),(89,'Israel'),(90,'Italia'),(91,'Jamaica'),(92,'Japón'),(93,'Jordania'),(94,'Kazajistán'),(95,'Kenia'),(96,'Kirguistán'),(97,'Kiribati'),(98,'Kuwait'),(99,'Laos'),(100,'Lesoto'),(101,'Letonia'),(102,'Líbano'),(103,'Liberia'),(104,'Libia'),(105,'Liechtenstein'),(106,'Lituania'),(107,'Luxemburgo'),(108,'Madagascar'),(109,'Malasia'),(110,'Malaui'),(111,'Maldivas'),(112,'Malí'),(113,'Malta'),(114,'Marruecos'),(115,'Mauricio'),(116,'Mauritania'),(117,'México'),(118,'Micronesia'),(119,'Moldavia'),(120,'Mónaco'),(121,'Mongolia'),(122,'Montenegro'),(123,'Mozambique'),(124,'Namibia'),(125,'Nauru'),(126,'Nepal'),(127,'Nicaragua'),(128,'Níger'),(129,'Nigeria'),(130,'Noruega'),(131,'Nueva Zelanda'),(132,'Omán'),(133,'Países Bajos'),(134,'Pakistán'),(135,'Palaos'),(136,'Panamá'),(137,'Papúa Nueva Guinea'),(138,'Paraguay'),(139,'Perú'),(140,'Polonia'),(141,'Portugal'),(142,'Reino Unido'),(143,'República Centroafricana'),(144,'República Checa'),(145,'República de Macedonia'),(146,'República del Congo'),(147,'República Democrática del Congo'),(148,'República Dominicana'),(149,'República Sudafricana'),(150,'Ruanda'),(151,'Rumanía'),(152,'Rusia'),(153,'Samoa'),(154,'San Cristóbal y Nieves'),(155,'San Marino'),(156,'San Vicente y las Granadinas'),(157,'Santa Lucía'),(158,'Santo Tomé y Príncipe'),(159,'Senegal'),(160,'Serbia'),(161,'Seychelles'),(162,'Sierra Leona'),(163,'Singapur'),(164,'Siria'),(165,'Somalia'),(166,'Sri Lanka'),(167,'Suazilandia'),(168,'Sudán'),(169,'Sudán del Sur'),(170,'Suecia'),(171,'Suiza'),(172,'Surinam'),(173,'Tailandia'),(174,'Tanzania'),(175,'Tayikistán'),(176,'Timor Oriental'),(177,'Togo'),(178,'Tonga'),(179,'Trinidad y Tobago'),(180,'Túnez'),(181,'Turkmenistán'),(182,'Turquía'),(183,'Tuvalu'),(184,'Ucrania'),(185,'Uganda'),(186,'Uruguay'),(187,'Uzbekistán'),(188,'Vanuatu'),(189,'Venezuela'),(190,'Vietnam'),(191,'Yemen'),(192,'Yibuti'),(193,'Zambia'),(194,'Zimbabue');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punto`
--

DROP TABLE IF EXISTS `punto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `extension` varchar(4) DEFAULT NULL,
  `telefono2` varchar(10) DEFAULT NULL,
  `extension2` varchar(4) DEFAULT NULL,
  `municipio_id` int(11) NOT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `tipo_negocio_id` int(11) NOT NULL,
  `centro_costo_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nombre` (`nombre`),
  KEY `fk_punto_municipio` (`municipio_id`),
  KEY `fk_punto_tipo_negocio` (`tipo_negocio_id`),
  KEY `fk_punto_cliente` (`cliente_id`),
  CONSTRAINT `fk_punto_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_punto_municipio` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_punto_tipo_negocio` FOREIGN KEY (`tipo_negocio_id`) REFERENCES `tiponegocio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto`
--

LOCK TABLES `punto` WRITE;
/*!40000 ALTER TABLE `punto` DISABLE KEYS */;
INSERT INTO `punto` (`id`, `nombre`, `direccion`, `telefono`, `extension`, `telefono2`, `extension2`, `municipio_id`, `marca_id`, `tipo_negocio_id`, `centro_costo_id`, `cliente_id`, `Activo`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES (1,'chapinero','kr 15 # 63-08','2058963','112','2257845','114',868,1,1,1,3,1,NULL,NULL,NULL,NULL),(2,'Cortijo','kr 90 # 63-08','2058963','112','2257845','114',868,1,1,1,3,0,NULL,NULL,NULL,NULL),(4,'chapinero2','kr 15 # 63-08','2058963','112','2257845','114',868,1,1,1,3,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `punto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regimen`
--

DROP TABLE IF EXISTS `regimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regimen`
--

LOCK TABLES `regimen` WRITE;
/*!40000 ALTER TABLE `regimen` DISABLE KEYS */;
INSERT INTO `regimen` (`id`, `nombre`, `createdOn`, `updatedBy`, `updatedOn`) VALUES (1,'Simplificado','0000-00-00 00:00:00','false','0000-00-00 00:00:00'),(2,'Comun','0000-00-00 00:00:00','false','0000-00-00 00:00:00'),(3,'Especial','0000-00-00 00:00:00','false','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `regimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES (1,'ADMIN',NULL,NULL,NULL,NULL),(2,'USER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiponegocio`
--

DROP TABLE IF EXISTS `tiponegocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiponegocio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiponegocio`
--

LOCK TABLES `tiponegocio` WRITE;
/*!40000 ALTER TABLE `tiponegocio` DISABLE KEYS */;
INSERT INTO `tiponegocio` (`id`, `nombre`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES (1,'Restaurante',NULL,NULL,NULL,NULL),(2,'Bar',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tiponegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(512) NOT NULL,
  `email` varchar(100) NOT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedBy` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `fullname`, `username`, `password`, `email`, `createdBy`, `createdOn`, `updatedBy`, `updatedOn`) VALUES (1,'Test User','user','33275a8aa48ea918bd53a9181aa975f15ab0d0645398f5918a006d08675c1cb27d5c645dbd084eee56e675e25ba4019f2ecea37ca9e2995b49fcb12c096a032e','user@none.com',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_roles1_idx` (`role_id`),
  KEY `fk_user_role_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_role_roles1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES (1,1,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gamasoft_sab'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-21 15:15:28
