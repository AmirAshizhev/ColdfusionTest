-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: get_test_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action` (
  `id_action` int NOT NULL,
  `action` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'Ввод'),(2,'Открытие'),(3,'Решение'),(4,'Закрытие');
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criticality`
--

DROP TABLE IF EXISTS `criticality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criticality` (
  `id_criticality` int NOT NULL,
  `criticality` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_criticality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticality`
--

LOCK TABLES `criticality` WRITE;
/*!40000 ALTER TABLE `criticality` DISABLE KEYS */;
INSERT INTO `criticality` VALUES (1,'Авария'),(2,'Критичная'),(3,'Некритичная'),(4,'Запрос на изменение');
/*!40000 ALTER TABLE `criticality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error` (
  `id_error` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `discription` varchar(1000) DEFAULT NULL,
  `id_user` int NOT NULL,
  `id_status` int NOT NULL,
  `id_urgency` int NOT NULL,
  `id_criticality` int NOT NULL,
  PRIMARY KEY (`id_error`,`id_user`,`id_status`,`id_urgency`,`id_criticality`),
  KEY `fk_error_user1_idx` (`id_user`),
  KEY `fk_error_status1_idx` (`id_status`),
  KEY `fk_error_urgency1_idx` (`id_urgency`),
  KEY `fk_error_criticality1_idx` (`id_criticality`),
  CONSTRAINT `fk_error_criticality1` FOREIGN KEY (`id_criticality`) REFERENCES `criticality` (`id_criticality`),
  CONSTRAINT `fk_error_status1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_error_urgency1` FOREIGN KEY (`id_urgency`) REFERENCES `urgency` (`id_urgency`),
  CONSTRAINT `fk_error_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
INSERT INTO `error` VALUES (1,'2023-02-08 00:00:00','ошибка','ошибочка',1,1,1,1),(2,'2023-02-12 00:00:00','мистейка ','мистика',1,1,1,2),(3,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(4,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(5,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(6,'2023-02-12 00:00:00','мистейник ','мистика',1,4,2,3),(7,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(22,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(23,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(24,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(25,'2023-02-12 00:00:00','мистейник ','мистика',1,2,2,3),(55,'2023-02-12 20:29:15','11','22',1,2,3,1),(56,'2023-02-12 20:29:20','11','22',1,4,3,1),(57,'2023-02-12 21:17:08','11','22',1,4,3,1),(60,'2023-02-12 21:35:56','счс','чсчс',1,4,3,4),(61,'2023-02-12 21:36:04','счс','чсчс',1,4,3,4),(62,'2023-02-12 21:36:57','лось','зверье',1,4,1,4),(63,'2023-02-12 21:39:42','d','dd',1,4,3,1),(64,'2023-02-12 21:40:10','привет ','как твои дела?',1,4,3,1),(65,'2023-02-12 21:55:58','11','чсмиячсми',1,4,3,1),(66,'2023-02-19 19:17:02','дурацкая ошибка','при проверке данных ломается вся система',1,1,4,2),(67,'2023-02-19 19:17:31','дурацкая ошибка','при проверке данных ломается вся система',1,1,4,2),(68,'2023-02-25 13:05:59','второй узер','тест лоя второго пользователя',2,1,3,2);
/*!40000 ALTER TABLE `error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_history`
--

DROP TABLE IF EXISTS `error_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_history` (
  `id_error_history` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_error` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `id_action` int NOT NULL,
  PRIMARY KEY (`id_error_history`,`id_user`,`id_error`,`id_action`),
  UNIQUE KEY `id_error_history_UNIQUE` (`id_error_history`),
  KEY `fk_user_has_error_error1_idx` (`id_error`),
  KEY `fk_user_has_error_user_idx` (`id_user`),
  KEY `fk_error_history_action1_idx` (`id_action`),
  CONSTRAINT `fk_error_history_action1` FOREIGN KEY (`id_action`) REFERENCES `action` (`id_action`),
  CONSTRAINT `fk_user_has_error_error1` FOREIGN KEY (`id_error`) REFERENCES `error` (`id_error`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_history`
--

LOCK TABLES `error_history` WRITE;
/*!40000 ALTER TABLE `error_history` DISABLE KEYS */;
INSERT INTO `error_history` VALUES (1,1,1,'2023-02-08 00:00:00','да что с этим не так',1),(2,1,1,'2023-02-18 00:00:00','тест для второй ошибки',2),(3,2,2,'2023-02-18 00:00:00','первая история второй ошибки',2),(4,3,3,'2023-02-26 12:43:59','первый коммент для 3 ошибки',2),(5,3,5,'2023-02-26 12:38:07','йцук',1),(6,3,6,'2023-02-26 12:51:02','шестая ошибка',1),(7,2,6,'2023-02-26 12:52:29','другой пользователь',2),(8,2,6,'2023-02-26 12:54:18','кобра',3),(9,2,6,'2023-02-26 12:57:55','тест',4),(11,2,6,'2023-02-26 13:02:35','трест',3),(12,2,6,'2023-02-26 13:05:57','новый тест',1),(13,2,6,'2023-02-26 13:10:25','решеие',3),(14,2,63,'2023-02-26 13:12:53','новое начялао',3),(15,3,6,'2023-02-26 17:39:26','123',1),(16,3,55,'2023-02-26 17:40:15','Интересно',2);
/*!40000 ALTER TABLE `error_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Новая'),(2,'Открытая'),(3,'Решенная'),(4,'Закрытая');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urgency`
--

DROP TABLE IF EXISTS `urgency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urgency` (
  `id_urgency` int NOT NULL,
  `urgency` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_urgency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urgency`
--

LOCK TABLES `urgency` WRITE;
/*!40000 ALTER TABLE `urgency` DISABLE KEYS */;
INSERT INTO `urgency` VALUES (1,'Очень срочно'),(2,'Срочно'),(3,'Несрочно'),(4,'Совсем несрочно');
/*!40000 ALTER TABLE `urgency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Amir','Ashizhev','1234'),(2,'Жак-Ив Кусто','Кусто','123'),(3,'Амирп','Ашижев','1111'),(4,'Жак-Ив Куст','Ашижев','11111'),(5,'Андрей','Инвокер','1234'),(6,'Иван','Петров','123'),(7,'Петр','Иванов','123'),(8,'Дмитрий','Пок','123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-26 19:27:54
