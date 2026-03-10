-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `idorder_in_menu` int NOT NULL,
  `item` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `Orders_idOrders` int NOT NULL,
  `Menu_idMenu` int NOT NULL,
  PRIMARY KEY (`Orders_idOrders`,`Menu_idMenu`),
  KEY `fk_Bills_Orders1_idx` (`Orders_idOrders`),
  KEY `fk_Bills_Menu1_idx` (`Menu_idMenu`),
  CONSTRAINT `fk_Bills_Menu1` FOREIGN KEY (`Menu_idMenu`) REFERENCES `menu` (`idMenu`),
  CONSTRAINT `fk_Bills_Orders1` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `idbooking` int NOT NULL AUTO_INCREMENT,
  `emp_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_time` date DEFAULT NULL,
  PRIMARY KEY (`idbooking`),
  KEY `emp_idx` (`customer_id`),
  KEY `emp_idx1` (`emp_id`),
  CONSTRAINT `cus` FOREIGN KEY (`customer_id`) REFERENCES `customer details` (`idCustomer`),
  CONSTRAINT `emp_booking` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`idemployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer details`
--

DROP TABLE IF EXISTS `customer details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer details` (
  `idCustomer` int NOT NULL AUTO_INCREMENT,
  `first name` varchar(100) DEFAULT NULL,
  `last name` varchar(100) DEFAULT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `isalergic` tinyint NOT NULL,
  `date_of_registery` date NOT NULL,
  `birth_date` date NOT NULL,
  `phone_number` int DEFAULT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE KEY `first name_UNIQUE` (`first name`),
  UNIQUE KEY `last name_UNIQUE` (`last name`),
  UNIQUE KEY `adress_UNIQUE` (`adress`),
  KEY `customer_number_idx` (`phone_number`),
  CONSTRAINT `customer_number` FOREIGN KEY (`phone_number`) REFERENCES `customer number` (`idCustomer_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer details`
--

LOCK TABLES `customer details` WRITE;
/*!40000 ALTER TABLE `customer details` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer number`
--

DROP TABLE IF EXISTS `customer number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer number` (
  `idCustomer_Number` int NOT NULL AUTO_INCREMENT,
  `phone_1` varchar(100) NOT NULL,
  `phone_2` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `ingridients` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idCustomer_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer number`
--

LOCK TABLES `customer number` WRITE;
/*!40000 ALTER TABLE `customer number` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `idemployee` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `salary` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idemployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `idMenu` int NOT NULL,
  `plate_name` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `ingredients` varchar(250) NOT NULL,
  `note` varchar(250) DEFAULT NULL,
  `Classification` varchar(100) NOT NULL,
  `Menucol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_state`
--

DROP TABLE IF EXISTS `order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_state` (
  `idorder_state` int NOT NULL AUTO_INCREMENT,
  `state` varchar(45) DEFAULT NULL,
  `ent_time` date DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`idorder_state`),
  KEY `order_idx` (`order_id`),
  CONSTRAINT `order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`idOrders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_state`
--

LOCK TABLES `order_state` WRITE;
/*!40000 ALTER TABLE `order_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL AUTO_INCREMENT,
  `custumers_id` varchar(45) DEFAULT NULL,
  `table_number` varchar(45) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `total_cost` varchar(45) DEFAULT NULL,
  `orde_time` time DEFAULT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `customer_idx` (`custumers_id`),
  KEY `emp_idx` (`employee_id`),
  CONSTRAINT `customer` FOREIGN KEY (`custumers_id`) REFERENCES `customer details` (`first name`),
  CONSTRAINT `emp` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`idemployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-04 13:55:32
