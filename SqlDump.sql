CREATE DATABASE  IF NOT EXISTS `finaldump` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `finaldump`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: finaldump
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addr_id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street_name` varchar(20) NOT NULL,
  `zip` varchar(5) NOT NULL,
  PRIMARY KEY (`addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (25,'USA','MA','Boston','Turquoise Gali','2120'),(26,'USA','NY','NYC','Hudson St','9284'),(27,'USA','NY','NYC','Hudson St','9284'),(28,'usa','MA','boston','fenway','2215'),(29,'USA','MA','boston','newbury st','9876'),(30,'USA','MA','Boston','Fenway','2124'),(31,'USA','MA','Boston','Smith street','2129'),(32,'USA','MA','Boston','Mission Main','1234'),(33,'USA','MA','Boston','Ward street ','2123'),(34,'USA','MA','Boston','Boylston St','3482'),(35,'USA','MA','Boston','Huntington Ave','2385'),(36,'USA','MA','Boston','McGreevy Street','21234'),(37,'USA','MA','Boston','Allston','2345'),(38,'United States','Massachusetts','Boston','1163 Boylston Street','2215'),(39,'India','KA','Bangalore','Yelhanka','2953'),(40,'USA','MA','Boston','Queens street','54543'),(41,'Singapore','Singapore','Singapore','Orchard Road','96879'),(42,'USA','MA','Boston','Newbury ','34567'),(44,'India','KA','Bangalroe','Rajajinagar','98345'),(45,'USA','MA','Boston','Bolyston','23456'),(46,'India','KA','Bangalore','Hebbal','23865'),(47,'India','KA','Mysore','MG Road','84783'),(48,'USA','MA','Boston','Common street','2123'),(49,'France','France','Paris','Paris St','38742'),(50,'USA','MA','Boston','Park Street','1234'),(51,'London','London','London','Carnaby St','83754'),(52,'USA','MA','Boston','Fallway','12345'),(53,'UAE','Dubai','Dubai','Dubai Road','93485'),(54,'USA','MA','Boston','King Street','2345'),(55,'USA','MA','Boston','Prince Street','2345'),(58,'Thailand','Bangkok','Bangkok','Beach Road','45876'),(59,'USA','MA','Boston','Beacon Hill','2872'),(60,'USA','Miami','Florida','Disneyland','94852'),(61,'United States','MA','BOSTON','Northeastern','2215'),(62,'United States ','MA','Boston','Boylston','2256');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminstaff`
--

DROP TABLE IF EXISTS `adminstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminstaff` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `admin_first_name` varchar(20) NOT NULL,
  `admin_last_name` varchar(20) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `addr_id` int NOT NULL,
  `dob` date NOT NULL,
  `sex` char(1) NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `ssn` varchar(9) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`adminId`),
  KEY `addr_id` (`addr_id`),
  KEY `email` (`email`),
  CONSTRAINT `adminstaff_ibfk_1` FOREIGN KEY (`addr_id`) REFERENCES `address` (`addr_id`),
  CONSTRAINT `adminstaff_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminstaff`
--

LOCK TABLES `adminstaff` WRITE;
/*!40000 ALTER TABLE `adminstaff` DISABLE KEYS */;
INSERT INTO `adminstaff` VALUES (3,'Tejal','Patel','8576876424',25,'1999-01-11','F','A+','123456567','tejal.admin@gmail.com'),(4,'prathiksha','urs','9874536218',28,'1998-04-14','f','o+','298365489','padmin@gmail.com'),(5,'Pranove','Basavarajappa','8572027039',38,'1999-06-23','M','A+','998234765','pranove.admin@gmail.com'),(6,'Admin1','AdminLname','9856773232',61,'1987-05-22','M','A+','123458743','admin.1@gmail.com');
/*!40000 ALTER TABLE `adminstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `app_id` int NOT NULL AUTO_INCREMENT,
  `doc_id` int,
  `patient_id` int DEFAULT NULL,
  `date_time_app` timestamp NOT NULL,
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `date_time_app` (`date_time_app`),
  KEY `patient_id` (`patient_id`),
  KEY `doc_id` (`doc_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`mrn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (8,1012,1000005,'2022-12-09 15:20:00'),(9,1020,1000005,'2022-12-14 15:30:00'),(10,1024,1000005,'2022-12-16 16:40:00'),(13,1019,1000019,'2022-12-28 02:26:00'),(15,1023,1000005,'2022-12-11 14:26:00'),(16,1024,1000009,'2022-12-26 14:27:00'),(17,1018,1000013,'2022-12-24 14:29:00'),(18,1020,1000017,'2022-12-20 14:31:00'),(19,1019,1000005,'2022-12-16 15:20:00'),(20,1017,1000005,'2022-12-14 15:00:00'),(21,1018,1000008,'2022-12-26 14:40:00');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `bill_date` date NOT NULL,
  `total_cost` float NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (10,'2022-12-06',500.00),(11,'2022-12-14',230.00),(12,'2022-12-08',100.00),(13,'2022-12-04',1987.00),(14,'2022-12-06',6540.00),(15,'2022-12-02',1000.00);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosisandtreatment`
--

DROP TABLE IF EXISTS `diagnosisandtreatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosisandtreatment` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `treat_name` varchar(10) NOT NULL,
  `treat_desc` varchar(50) NOT NULL,
  `diag_desc` varchar(50) NOT NULL,
  `patient_mrn` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `diagnosisandtreatment_ibfk_2` (`patient_mrn`),
  CONSTRAINT `diagnosisandtreatment_ibfk_2` FOREIGN KEY (`patient_mrn`) REFERENCES `patient` (`mrn`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosisandtreatment`
--

LOCK TABLES `diagnosisandtreatment` WRITE;
/*!40000 ALTER TABLE `diagnosisandtreatment` DISABLE KEYS */;
INSERT INTO `diagnosisandtreatment` VALUES (3,'Tablets','4 times a week','Fever',1000005),(4,'Eye drops','put eye drops','Dry eyes',1000006),(5,'No junk fo','Deiting','Cholestrol',1000020),(6,'Sleep ther','less caffine','Sleep sickness',1000007),(7,'tablets','daily once','cold',1000009);
/*!40000 ALTER TABLE `diagnosisandtreatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doc_id` int NOT NULL AUTO_INCREMENT,
  `specialization` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `addr_id` int,
  `joining_date` date NOT NULL,
  `dob` date NOT NULL,
  `sex` char(1) NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `ssn` varchar(9) NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `addr_id` (`addr_id`),
  KEY `email` (`email`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`addr_id`) REFERENCES `address` (`addr_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1012,'General Surgeon','Meredith','Grey','mer.doc@gmail.com','8576876421',30,'2019-06-04','1978-01-10','F','AB+','646568673'),(1013,'General Surgeon','Mirinda ','Bailey','mir.doc@gmail.com','8576876422',31,'1999-02-18','1966-02-09','F','A+','456678789'),(1014,'Cardiologist','Derek','Shepherd','der.doc@gmail.com','8576876423',33,'2002-07-18','1972-07-19','M','B+','234567898'),(1015,'Pediatrician','Alex','Karev','al.doc@gmail.com','8576876425',36,'2008-10-24','1972-07-05','M','A+','987654334'),(1016,'Cardiologist','Cristina','Yang','cri.doc@gmail.com','8576876426',37,'2006-06-26','1993-06-09','F','AB+','987654345'),(1017,'Oncologist','Izzie','Stevens','izz.doc@gmail.com','8576876427',40,'2016-06-06','1960-07-01','F','O+','765434756'),(1018,'Head of Surgery','Richard','Webber','rc.doc@gmail.com','8576876426',42,'1966-07-12','1909-01-28','M','AB+','234567898'),(1019,'Head of ER','Owen','Hunt','ow.doc@gmail.com','8576876429',45,'2004-07-08','1974-06-13','M','O+','456789876'),(1020,'Plastic Surgeon','Jackson','Avery','ja.doc@gmail.com','8576876429',48,'1986-06-26','1957-07-10','M','AB-','987654339'),(1021,'ENT','George','O\'Malley','ge.doc@gmail.com','3465668794',50,'1954-07-19','1950-06-13','M','A+','244579764'),(1022,'Orthologist','Callie','Torres','ca.doc@gmail.com','8576876428',52,'1964-06-25','1951-06-29','F','AB+','987654349'),(1023,'Orthopeditian','Mark','Sloan','ma.doc@gmail.com','8576876420',54,'2020-01-28','1912-06-18','M','A+','987654339'),(1024,'Allergist','April','Kepner','ap.doc@gmail.com','8576876426',55,'2018-07-12','2009-06-09','F','O+','234567876');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalinsurance`
--

DROP TABLE IF EXISTS `medicalinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalinsurance` (
  `insurance_id` int NOT NULL AUTO_INCREMENT,
  `policy_no` int NOT NULL,
  `company_name` varchar(20) NOT NULL,
  `sum_insured` float NOT NULL,
  `policy_start_date` date NOT NULL,
  `policy_end_date` date NOT NULL,
  PRIMARY KEY (`insurance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalinsurance`
--

LOCK TABLES `medicalinsurance` WRITE;
/*!40000 ALTER TABLE `medicalinsurance` DISABLE KEYS */;
INSERT INTO `medicalinsurance` VALUES (7,2364523,'NextInsurance',40223,'2021-11-11','2024-12-12'),(8,87456023,'Insurance B',5000,'2022-09-20','2023-07-21'),(9,94728305,'Company C',8500,'2022-11-16','2023-07-24'),(10,45726474,'Company Z',10000,'2022-10-12','2023-05-12'),(11,86729567,'Company E',9548,'2022-09-01','2023-09-25'),(12,64381274,'Company F',9999.99,'2022-11-19','2023-05-09'),(14,67482362,'Company G',9999.99,'2022-12-02','2023-02-02'),(15,94385712,'Company H',8758,'2022-11-10','2023-05-18'),(16,93462486,'Company I',9999.99,'2022-11-12','2023-10-31'),(17,32874612,'Company J',9999.99,'2022-08-20','2023-10-21'),(18,43587123,'Company K',9999.99,'2022-07-06','2023-06-06'),(19,98234124,'Company L',9999.99,'2022-11-05','2023-04-14'),(20,23456789,'Company Z',9999.99,'2022-12-01','2023-01-30'),(21,73462348,'Company X',5698,'2022-11-26','2023-04-28'),(22,82734573,'Company Y',9999.99,'2022-11-01','2023-09-19'),(23,456332,'SBI',20000,'2022-12-09','2023-10-09');
/*!40000 ALTER TABLE `medicalinsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalrecord`
--

DROP TABLE IF EXISTS `medicalrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecord` (
  `med_record_id` int NOT NULL AUTO_INCREMENT,
  `Med_rec_des` varchar(1000) NOT NULL,
  `allergy` varchar(100) NOT NULL,
  `follow_up` date DEFAULT NULL,
  PRIMARY KEY (`med_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecord`
--

LOCK TABLES `medicalrecord` WRITE;
/*!40000 ALTER TABLE `medicalrecord` DISABLE KEYS */;
INSERT INTO `medicalrecord` VALUES (7,'fever\r\ncold','dust','2022-12-23'),(8,'Asthma','Pollen',NULL),(9,'Insomnia','Dust',NULL),(10,'Diabetes','Pollen',NULL),(11,'Conjunctivitis','Lactose Intolerant','2022-12-30'),(12,'Flu','Animal Fur',NULL),(14,'Blood Pressure','Peanut',NULL),(15,'Flu','Eggs',NULL),(16,'Stomach ache','Animal fur',NULL),(17,'Cough','Insect stings',NULL),(18,'Diabetes','Dust',NULL),(19,'Fracture','Peanut',NULL),(20,'Migraine','Pollen',NULL),(21,'Fever','Lactose intolerant',NULL),(22,'Cholesterol','Dust',NULL),(23,'Fever','None',NULL);
/*!40000 ALTER TABLE `medicalrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `medicineId` int NOT NULL AUTO_INCREMENT,
  `med_description` varchar(20) NOT NULL,
  `dosage` varchar(10) NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `refill` int NOT NULL,
  `med_cost` float NOT NULL,
  `patient_mrn` int DEFAULT NULL,
  PRIMARY KEY (`medicineId`),
  KEY `medication_ibfk_1` (`patient_mrn`),
  CONSTRAINT `medication_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patient` (`mrn`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (3,'Anxit','5 mg','weekly twice','1 month',2,100.00,1000005),(4,'Nextane','0.1%','twice a day','6 months',10,200.00,1000006),(5,'fluvastatine','10mg','once a day','5 days',1,40.00,1000020),(6,'Sleeping pills','20 mg','once in two days','1 month',3,600.00,1000007),(7,'zyrcold','20 mg','once a day','1 week',1,40.00,1000009);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `mrn` int NOT NULL AUTO_INCREMENT,
  `patient_first_name` varchar(20) NOT NULL,
  `patient_last_name` varchar(20) NOT NULL,
  `patient_phone` varchar(10) NOT NULL,
  `patient_email` varchar(20) DEFAULT NULL,
  `patient_dob` varchar(10) NOT NULL,
  `sex` char(1) NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `addr_id` int NOT NULL,
  `med_record_id` int,
  `insurance_id` int,
  PRIMARY KEY (`mrn`),
  KEY `med_record_id` (`med_record_id`),
  KEY `insurance_id` (`insurance_id`),
  KEY `addr_id` (`addr_id`),
  KEY `patient_email` (`patient_email`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`med_record_id`) REFERENCES `medicalrecord` (`med_record_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`insurance_id`) REFERENCES `medicalinsurance` (`insurance_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`addr_id`) REFERENCES `address` (`addr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_ibfk_4` FOREIGN KEY (`patient_email`) REFERENCES `user` (`userName`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1000023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1000005,'ross','geller','9826573859','ross@gmail.com','1987-12-18','m','o-',29,7,7),(1000006,'Rachel','Green','3748592817','rachel@gmail.com','2013-10-18','F','B-',32,8,8),(1000007,'Monica','Geller','9572847562','monica@gmail.com','2000-11-28','F','A-',34,9,9),(1000008,'Chandler','Bing','9562758472','chandler@gmail.com','1998-11-04','M','B+',35,10,10),(1000009,'Phoebe','Buffay','3647183647','phoebe@gmail.com','2005-10-16','F','O+',39,11,11),(1000010,'Joey','Tribbiani','387546456','jory@gmail.com','2004-10-30','M','AB+',41,12,12),(1000012,'Gunther','Gunther','7568125789','gunther@gmail.com','2022-11-09','M','O-',44,14,14),(1000013,'Tony','Stark','2348971234','tony@gmail.com','2022-09-08','M','A+',46,15,15),(1000014,'Jake','Peralta','9854612345','jake@gmail.com','2022-08-02','M','B-',47,16,16),(1000015,'Emily','Cooper','3467186937','emily@gmail.com','1996-07-24','F','B+',49,17,17),(1000016,'Hermione','Granger','8467591846','hermione@gmail.com','1988-06-28','F','A-',51,18,18),(1000017,'Wonder','Woman','9845672375','wonder@gmail.com','2003-10-28','F','O-',53,19,19),(1000018,'Carie','Bradshaw','4567823490','carie@gmail.com','1982-10-17','F','A-',58,20,20),(1000019,'Richard','Castle','8563729184','richard@gmail.com','2022-11-08','M','A+',59,21,21),(1000020,'Minnie','Mouse','8347514853','minnie@gmail.com','2000-06-21','F','AB-',60,22,22),(1000021,'Patient1','PatientL','8572332425','patient1@gmail.com','1998-02-24','M','A+',62,23,23);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientbill`
--

DROP TABLE IF EXISTS `patientbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientbill` (
  `patient_num` int NOT NULL,
  `bill_no` int DEFAULT NULL,
  KEY `patient_num` (`patient_num`),
  KEY `bill_no` (`bill_no`),
  CONSTRAINT `patientbill_ibfk_1` FOREIGN KEY (`patient_num`) REFERENCES `patient` (`mrn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patientbill_ibfk_2` FOREIGN KEY (`bill_no`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientbill`
--

LOCK TABLES `patientbill` WRITE;
/*!40000 ALTER TABLE `patientbill` DISABLE KEYS */;
INSERT INTO `patientbill` VALUES (1000005,10),(1000007,11),(1000009,12),(1000017,13),(1000013,14),(1000019,15);
/*!40000 ALTER TABLE `patientbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_date` date NOT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `bill_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2022-12-07','Paid','Card',10),(2,'2022-12-14','Pending','Credit Card',11),(3,'2022-12-10','Paid','Card',12),(4,'2022-12-06','Paid','Insurance',13),(5,'2022-12-08','Paid','Card',14),(6,'2022-12-04','Paid','Card',15);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userName` varchar(30) NOT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `user_role` varchar(10) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin.1@gmail.com','$5$rounds=535000$WVzfVlWV/Mzy0j97$zeuQ.DCJfMHQ87UJknXdXQKQWgyqVkKin.j/T2GkQ01','admin'),('al.doc@gmail.com','$5$rounds=535000$nu6zG2xIsMvxzd0F$5NdrK1T7Fgmmn/bW7muAccfYa6K/sPcQpdOF.URkPx4','doctor'),('ap.doc@gmail.com','$5$rounds=535000$kx64P5uhWGZyUBXi$LU1zlI5iluC70z8WDFmEe9u6kMVOtBYLzizBEc2GYR0','doctor'),('ca.doc@gmail.com','$5$rounds=535000$H3H2NaY4heyIqmVE$x6juV3D2.aR9RUKBKJSfnENPp8fWaHSmYCreNmpEsc.','doctor'),('carie@gmail.com','$5$rounds=535000$XoaCOOXuBxtpovDq$cjNLkWl.0lG8.RVjlTE37w4w7OE7OLSjh/q0A0VDKw6','patient'),('chandler@gmail.com','$5$rounds=535000$HBmWQEmJyxIojQKb$G7GNcfld62C8UL14sbZ5mfoXx8BUx1KNIvXFWtrpoR5','patient'),('cri.doc@gmail.com','$5$rounds=535000$kqvUyVv8eBB9RVjH$Ts9MEwBpzl.qGruCkmniqpoGG7RIOD2e5wih5DmaTTB','doctor'),('der.doc@gmail.com','$5$rounds=535000$Y.y2wdY1KAkOu1YT$UqeqhDDScoBxLIfS0LVkTAtNrMP9VEWW3.bGVjvZSS8','doctor'),('emily@gmail.com','$5$rounds=535000$E3qB7qMKE4pUwhN7$M72UiZXWIS3fT.4jAtjpZQTVdRwrOau48uqTQUgLB04','patient'),('ge.doc@gmail.com','$5$rounds=535000$KD.eGBGtDplfWYvq$FpPDDfMewkF68GdLn2b9So4q4bkloKtpCuu.IxST1J/','doctor'),('gunther@gmail.com','$5$rounds=535000$2wHwrbBjJFq.SXOj$nnGc9OoVmHQ9u8WyU7FN5IEbUPsxJbX3.vRNCR5XqA1','patient'),('hermione@gmail.com','$5$rounds=535000$.7SNXASnHrjdqOsV$8i2X7ed58Yz6clq57cjXH.A8PwH88Acnvh20krCfEs8','patient'),('izz.doc@gmail.com','$5$rounds=535000$bLs6Yj9a2orRbWLO$h6w3zoh4qkKBImmyb435IUADxReDaG2CTnT4tj3Z2n3','doctor'),('ja.doc@gmail.com','$5$rounds=535000$Nj8vGBDGrprV3xII$yWEeXMdNf9bt9fjbONXa38cg1ePPNAvNSTw06wJid.D','doctor'),('jake@gmail.com','$5$rounds=535000$OYwhz1GY1aisBRqq$yeSsCL3KqyWB1cdgGLLtZxO.a2GoK3eAf0UE1l2H2d8','patient'),('jory@gmail.com','$5$rounds=535000$dk2D8Xve6zRrz7GA$Wl772khG766rvuR/cTJD1380YuBVzSjDrS/JqlFR9B7','patient'),('ma.doc@gmail.com','$5$rounds=535000$VJ7fDTGv4ZSpqXNQ$oPCUZQvY94omJLA2k3nXYnvmtj4IYhtVfa1TI5uVKB8','doctor'),('mer.doc@gmail.com','$5$rounds=535000$4pKzfc.D7ucCuY1A$iFcPSynWkGLaBSQ08kwVlmHdEo0akzepEy4ul6JL3a9','doctor'),('minnie@gmail.com','$5$rounds=535000$6PNAbSiRhy0X2peP$XmDZ3EDyvxXSfiv/RsE.EBDgzU1zQ4Gk0iPDexYP5kA','patient'),('mir.doc@gmail.com','$5$rounds=535000$USIXM.c./7eZ5spj$oUtU3MNnTkpFt7RVeSiYxOzAnLUp3tllUR2q9.3xYL/','doctor'),('monica@gmail.com','$5$rounds=535000$9GmJwUKVKq6N8O3z$GES8PN3TnsPmsgFd5ZANkYlHEycHK391DwNXEOYBuC2','patient'),('ow.doc@gmail.com','$5$rounds=535000$auOIeosjH9KKnvOS$g/WnXQ07bLyLDRi..XiTbK1n9Z3V5C9dT2mySNkJo96','doctor'),('padmin@gmail.com','$5$rounds=535000$HzyJmGWaUQYmMHYw$alPvRashvd8YgBnlIvNlKal4hiprB4qqwsId7TFvGh/','admin'),('patient1@gmail.com','$5$rounds=535000$ZWW7/9NT7rqqMYun$YB8139.hQlIQVV1g28s6m82v2SDZTa626jJ7c8kjCh2','patient'),('phoebe@gmail.com','$5$rounds=535000$OScEEmWpczARTyLC$EtTQ0HforZe3FdQ86d7AYHncQbmbQ7DvgC8qSQhrpb6','patient'),('pranove.admin@gmail.com','$5$rounds=535000$f14R3GYk5Q.7yL8K$VV4bBNhq86OftsRneA0NRx9KJjcepH/ixvD5JlKE.e/','admin'),('rachel@gmail.com','$5$rounds=535000$yQuqorBY612qbNhY$6r05rg9p3zEgZxgSuRf3KfqOZJWuA64FnEwq0iSqzMC','patient'),('rc.doc@gmail.com','$5$rounds=535000$N.e.W49fUFJfOS0C$9iAYNkB5om6Do0Y1ryxV6zIZ3yW/VwTgtm0ue7nO5F6','doctor'),('richard@gmail.com','$5$rounds=535000$uwHGuIATP.2enadK$Hzxd4LDg0XFUBZQNJuO0DRByXkoUOrXV1NiO1OLDvCD','patient'),('ross@gmail.com','$5$rounds=535000$54mTlBK5i4yLMiK7$YH.KBenuOL9pZrpTNBjsuln3RO/82wiOpD4t6JwonQ3','patient'),('tejal.admin@gmail.com','$5$rounds=535000$C/dFQaIn3Nz2KNoo$sfLkpP.8shkShGUM19AAF/4nyFBTWEQqZxn/Bjto7iD','admin'),('tony@gmail.com','$5$rounds=535000$16kzd0I7z7luLpQk$tJWhCgtZ9AQpBX34ersHh7mmAJrhF4WTrUuWUTPntj8','patient'),('wonder@gmail.com','$5$rounds=535000$NX/ms.wBQJfvpnw.$9LfVOJbDUZzrV7.SUpFU4V9ozajwI2gQdk5EVOmJ0TA','patient');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'finaldump'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAdmin`(
    fname VARCHAR(20),
    lname VARCHAR(20),
    phone VARCHAR(10),
    email VARCHAR(30),
    dob DATE,
    sex CHAR(1),
    blood_group VARCHAR(3),
    ssn VARCHAR(9),
    country VARCHAR(20),
    state VARCHAR(20),
    city VARCHAR(20),
    street_name VARCHAR(20),
    zip VARCHAR(5),
    password varchar(100),
    userRole VARCHAR(10)
)
BEGIN
INSERT INTO Address(country,state,city,street_name,zip) VALUES(country,state,city,street_name,zip);
INSERT INTO user(userName, pwd,user_role) VALUES(email,password,userRole);
INSERT INTO adminstaff(admin_first_name,admin_last_name,phone,addr_id,dob,sex,blood_group,ssn,email) values(fname,lname,phone,(SELECT addr_id FROM Address ORDER BY addr_id DESC LIMIT 1),dob,sex,blood_group,ssn,email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAppointment`(
    pat_email varchar(20),
    doc_fname varchar(20),
    doc_lname varchar(20),
    app_date_time timestamp
   )
BEGIN
    INSERT INTO Appointment (doc_id, patient_id, date_time_app) VALUES ((select doc_id from Doctor where first_name = doc_fname and 
    last_name = doc_lname),(select mrn from patient where patient_email = pat_email),app_date_time);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddDoctor`(
    specialization VARCHAR(20),
    first_name VARCHAR(20) ,
    last_name VARCHAR(20),
    email varchar(30),
    phone VARCHAR(10),
    joining_date DATE,
    dob DATE,
    sex CHAR(1),
    blood_group VARCHAR(3),
    ssn varchar(9),
	country VARCHAR(20),
    state VARCHAR(20),
    city VARCHAR(20),
    street_name VARCHAR(20),
    zip VARCHAR(5),
    pwd varchar(100),
    user_role VARCHAR(10)
    )
BEGIN
    INSERT INTO Address(country, state, city, street_name, zip) VALUES (country, state, city, street_name, zip);
    INSERT INTO User(userName, pwd, user_role) VALUES (email, pwd, user_role);
    INSERT INTO doctor(addr_id, specialization, first_name, last_name, email, phone, joining_date, dob, sex, blood_group, ssn) VALUES ((SELECT addr_id FROM Address ORDER BY addr_id DESC LIMIT 1), specialization, first_name, last_name, email, phone, joining_date, dob,sex, blood_group, ssn);
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPatient`(
    first_name VARCHAR(20) ,
    last_name VARCHAR(20),
    phone VARCHAR(10),
    email VARCHAR(20),
    dob VARCHAR(10),
    patient_sex CHAR(1),
    patient_blood_group VARCHAR(3),
    patient_country VARCHAR(20),
    patient_state VARCHAR(20),
    patient_city VARCHAR(20),
    patient_street_name VARCHAR(20),
    patient_zip VARCHAR(5),
    patient_allergy VARCHAR(100),
    patient_med_rec_des VARCHAR(1000),
    insurance_policy_no INT,
    insurance_company_name VARCHAR(20),
    insurance_sum_insured FLOAT,
    insurance_policy_start_date DATE,
    insurance_policy_end_date DATE,
	patient_pwd varchar(100),
    patient_user_role VARCHAR(10)
)
BEGIN
	INSERT INTO Address(country, state, city, street_name, zip) VALUES (patient_country, patient_state, patient_city, patient_street_name, patient_zip);
    INSERT INTO MedicalRecord( Med_rec_des, allergy) VALUES (patient_med_rec_des, patient_allergy);
    INSERT INTO MedicalInsurance ( policy_no, company_name, sum_insured, policy_start_date, policy_end_date) VALUES (insurance_policy_no, insurance_company_name, insurance_sum_insured, insurance_policy_start_date, insurance_policy_end_date);
    INSERT INTO User(userName, pwd, user_role) VALUES (email,patient_pwd,patient_user_role);
    INSERT INTO patient(addr_id, med_record_id, insurance_id, patient_first_name, patient_last_name, patient_phone, patient_email, patient_dob, sex, blood_group) VALUES ((SELECT addr_id FROM Address ORDER BY addr_id DESC LIMIT 1),(SELECT med_record_id FROM MedicalRecord ORDER BY med_record_id DESC LIMIT 1), (SELECT insurance_id FROM MedicalInsurance ORDER BY insurance_id DESC LIMIT 1),first_name, last_name, phone, email,dob, patient_sex, patient_blood_group);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPatientBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPatientBill`(
    patientId INT,
    billDate DATE,
    total_amt FLOAT
)
BEGIN
    insert into bill(bill_date,total_cost) values(billDate,total_amt);
    insert into patientbill(bill_no,patient_num) values((select bill_id from bill where bill_date = billDate and total_cost = total_amt),patientId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDoctor`(
   doctor_id int
)
BEGIN
	declare adress_id INT;
    declare doc_email varchar(30);
    set @address_id = (SELECT addr_id FROM doctor where doc_id = doctor_id) ;
    set @doc_email = (SELECT email FROM doctor where doc_id= doctor_id);
    delete from appointment where doc_id = doctor_id;
    delete from doctor where doc_id = doctor_id;
    delete from address where addr_id = @address_id;
    delete from user where userName = @doc_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePatient`(
   p_mrn int
   )
BEGIN
    declare adress_id INT;
    declare pat_email varchar(30);
    declare MedicalRecordId INT;
    declare MedicalInsuranceID INT; 
    declare paymentId INT;
    declare billId INT;
    SET @paymentId = (SELECT payment_id FROM payment where bill_id = (SELECT bill_id FROM bill b JOIN patientbill pb on b.bill_id = pb.bill_no where pb.patient_num = p_mrn));
    set @billId =  (SELECT bill_no from patientbill pb JOIN bill b on b.bill_id = pb.patient_num where pb.patient_num = p_mrn);
    set @address_id = (SELECT addr_id FROM patient where mrn = p_mrn);
    set @pat_email = (SELECT patient_email FROM patient where mrn = p_mrn);
    set @MedicalRecordId = (SELECT med_record_id FROM patient where mrn = p_mrn);
    set @MedicalInsuranceID = (SELECT insurance_id FROM patient where mrn = p_mrn);
    delete from address where addr_id = @address_id;
    delete from payment where payment_id = @paymentId;
    delete from bill where bill_id = @billId;
    delete from patientbill where patient_num = p_mrn;
    delete from user where userName = @pat_email;
    delete from MedicalRecord where med_record_id = @MedicalRecordId;
    delete from MedicalInsurance where insurance_id = @MedicalInsuranceID;
    delete from diagnosisandtreatment where patient_mrn = p_mrn;
    delete from medication where patient_mrn = p_mrn;
    delete from appointment where patient_id = p_mrn;
    delete from patient where mrn = p_mrn;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 17:34:06
