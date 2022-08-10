-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: businesstracker
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
-- Table structure for table `cart`
--
--
-- Wise Team
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `email` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `transactionid` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('fowaz@mailinator.com','10',1,389,389,'Esse dolorem quo ear','Kaseses','Online Payment','TIS-3452','cancel'),('fowaz@mailinator.com','11',1,999,999,'Esse dolorem quo ear','Kaseses','Online Payment','TIS-3452','delivered'),('fowaz@mailinator.com','10',1,389,389,'Esse dolorem quo ear','Kasesesgg','Online Payment','TIS-3452777','cancel'),('fowaz@mailinator.com','11',1,999,999,'Esse dolorem quo ear','Kaseses','Online Payment','TIS-3452','delivered'),('fowaz@mailinator.com','13',1,671,671,'Esse dolorem quo ear','mbarar','Online Payment','TIS-345277788','cancel'),('fowaz@mailinator.com','13',1,671,671,'Esse dolorem quo ear','kamapal','Online Payment','TIS-3452777888','cancel'),('fowaz@mailinator.com','11',1,999,999,'Esse dolorem quo ear','mbarar','Online Payment','TIS-3452777','delivered'),('fowaz@mailinator.com','10',2,389,778,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `staff` int DEFAULT NULL,
  `active` varchar(50) DEFAULT NULL,
  `liked` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('10','Renee Walsh','Short-term',389,5,'Yes',5),('11','Alfreda Gill','Long-term',999,68,'Yes',3),('12','Judah Bright','Short-term',414,83,'No',0),('13','Elton Garrison','Long-term',671,31,'Yes',2),('14','Holmes Valencia','Short-term',775,34,'Yes',1),('15','shirt','Long-term',777,6,'Yes',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specification`
--

DROP TABLE IF EXISTS `specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specification` (
  `shorttermproducts` int DEFAULT NULL,
  `midtermproducts` int DEFAULT NULL,
  `longtermproducts` int DEFAULT NULL,
  `shortstafft` int DEFAULT NULL,
  `midtermstaff` int DEFAULT NULL,
  `longtermstaff` int DEFAULT NULL,
  `currentdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specification`
--

LOCK TABLES `specification` WRITE;
/*!40000 ALTER TABLE `specification` DISABLE KEYS */;
INSERT INTO `specification` VALUES (20,4,2,0,8,8,'2022-08-07'),(40,8,4,0,8,12,'2022-08-07'),(20,4,2,2,8,8,'2022-08-07');
/*!40000 ALTER TABLE `specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `preference` varchar(100) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Camden Marks','fowaz@mailinator.com','Male','1234','Mid-term-products','Esse dolorem quo ear',NULL),('Sarah Rich','modojicen@mailinator.com','Female','Ea a minim ut sed vo','long-term-products','Beatae eius nobis in',NULL),('Stephen Bruce','rihefaxy@mailinator.com','Male','Officiis cum in erro','Short-term-products','Enim veritatis offic',NULL),('Wang Ortiz','sisyda@mailinator.com','Male','Ipsum consectetur id','Mid-term-products','Perspiciatis odio i',NULL),('Sydney Hammond','xoqecabagy@mailinator.com','Male','Autem eiusmod repell','long-term-products','Commodo sit velit ',NULL);
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

-- Dump completed on 2022-08-09 10:30:05
