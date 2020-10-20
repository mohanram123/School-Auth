<<<<<<< HEAD
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: school_management_system
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `exam_table`
--

DROP TABLE IF EXISTS `exam_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_table` (
  `ExamID` int(10) NOT NULL,
  `SubjectID` int(10) NOT NULL,
  `section` char(1) NOT NULL,
  `ExamDate` datetime NOT NULL,
  `type` char(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `exam_table_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subject_master` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_table`
--

LOCK TABLES `exam_table` WRITE;
/*!40000 ALTER TABLE `exam_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results_table`
--

DROP TABLE IF EXISTS `results_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results_table` (
  `ResultID` int(10) NOT NULL,
  `StudID` int(3) NOT NULL,
  `ExamID` int(10) NOT NULL,
  `marks` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ResultID`),
  KEY `StudID` (`StudID`),
  KEY `ExamID` (`ExamID`),
  CONSTRAINT `results_table_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `student_table` (`StudentID`),
  CONSTRAINT `results_table_ibfk_2` FOREIGN KEY (`ExamID`) REFERENCES `exam_table` (`ExamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results_table`
--

LOCK TABLES `results_table` WRITE;
/*!40000 ALTER TABLE `results_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `results_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_master`
--

DROP TABLE IF EXISTS `standard_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standard_master` (
  `StdID` int(3) NOT NULL,
  `StdName` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`StdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_master`
--

LOCK TABLES `standard_master` WRITE;
/*!40000 ALTER TABLE `standard_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `standard_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_table`
--

DROP TABLE IF EXISTS `student_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_table` (
  `StudentID` int(10) NOT NULL,
  `StdID` int(3) NOT NULL,
  `section` char(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `StdID` (`StdID`),
  CONSTRAINT `student_table_ibfk_1` FOREIGN KEY (`StdID`) REFERENCES `standard_master` (`StdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_table`
--

LOCK TABLES `student_table` WRITE;
/*!40000 ALTER TABLE `student_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_master`
--

DROP TABLE IF EXISTS `subject_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_master` (
  `SubjectID` int(10) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `StdID` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `StdID` (`StdID`),
  CONSTRAINT `subject_master_ibfk_1` FOREIGN KEY (`StdID`) REFERENCES `standard_master` (`StdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_master`
--

LOCK TABLES `subject_master` WRITE;
/*!40000 ALTER TABLE `subject_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_table`
--

DROP TABLE IF EXISTS `teacher_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_table` (
  `TeacherID` int(10) NOT NULL,
  `StdID` int(3) NOT NULL,
  `section` char(1) NOT NULL,
  `SubjectID` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`TeacherID`),
  KEY `StdID` (`StdID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `teacher_table_ibfk_1` FOREIGN KEY (`StdID`) REFERENCES `standard_master` (`StdID`),
  CONSTRAINT `teacher_table_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject_master` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_table`
--

LOCK TABLES `teacher_table` WRITE;
/*!40000 ALTER TABLE `teacher_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_master`
--

DROP TABLE IF EXISTS `user_role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_master` (
  `UserRoleID` int(4) NOT NULL,
  `UserRoleName` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_master`
--

LOCK TABLES `user_role_master` WRITE;
/*!40000 ALTER TABLE `user_role_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `user_table` (
--   `UserID` int(30) NOT NULL,
--   `UserName` varchar(100) NOT NULL,
--   `UserRole` int(4) NOT NULL,
--   `LoginName` varchar(100) DEFAULT NULL,
--   `password` varchar(100) NOT NULL,
--   `status` tinyint(1) NOT NULL,
--   PRIMARY KEY (`UserID`),
--   UNIQUE KEY `password` (`password`),
--   UNIQUE KEY `UserName` (`UserName`),
--   UNIQUE KEY `LoginName` (`LoginName`),
--   KEY `UserRole` (`UserRole`),
--   CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `user_role_master` (`UserRoleID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_table` (
  `UserID` int(30) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `UserRole` int(4) NOT NULL,
  `LoginName` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `password` (`password`),
  -- UNIQUE KEY `UserName` (`FirstName`),
  -- UNIQUE KEY `UserName` (`LastName`),
  UNIQUE KEY `LoginName` (`LoginName`),
  KEY `UserRole` (`UserRole`),
  CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `user_role_master` (`UserRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 21:20:55
=======
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: school_management_system
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `exam_table`
--

DROP TABLE IF EXISTS `exam_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_table` (
  `ExamID` int(10) NOT NULL,
  `SubjectID` int(10) NOT NULL,
  `section` char(1) NOT NULL,
  `ExamDate` datetime NOT NULL,
  `type` char(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `exam_table_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subject_master` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_table`
--

LOCK TABLES `exam_table` WRITE;
/*!40000 ALTER TABLE `exam_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results_table`
--

DROP TABLE IF EXISTS `results_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results_table` (
  `ResultID` int(10) NOT NULL,
  `StudID` int(3) NOT NULL,
  `ExamID` int(10) NOT NULL,
  `marks` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ResultID`),
  KEY `StudID` (`StudID`),
  KEY `ExamID` (`ExamID`),
  CONSTRAINT `results_table_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `student_table` (`StudentID`),
  CONSTRAINT `results_table_ibfk_2` FOREIGN KEY (`ExamID`) REFERENCES `exam_table` (`ExamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results_table`
--

LOCK TABLES `results_table` WRITE;
/*!40000 ALTER TABLE `results_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `results_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_master`
--

DROP TABLE IF EXISTS `standard_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standard_master` (
  `StdID` int(3) NOT NULL,
  `StdName` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`StdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_master`
--

LOCK TABLES `standard_master` WRITE;
/*!40000 ALTER TABLE `standard_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `standard_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_table`
--

DROP TABLE IF EXISTS `student_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_table` (
  `StudentID` int(10) NOT NULL,
  `StdID` int(3) NOT NULL,
  `section` char(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `StdID` (`StdID`),
  CONSTRAINT `student_table_ibfk_1` FOREIGN KEY (`StdID`) REFERENCES `standard_master` (`StdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_table`
--

LOCK TABLES `student_table` WRITE;
/*!40000 ALTER TABLE `student_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_master`
--

DROP TABLE IF EXISTS `subject_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_master` (
  `SubjectID` int(10) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `StdID` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `StdID` (`StdID`),
  CONSTRAINT `subject_master_ibfk_1` FOREIGN KEY (`StdID`) REFERENCES `standard_master` (`StdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_master`
--

LOCK TABLES `subject_master` WRITE;
/*!40000 ALTER TABLE `subject_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_table`
--

DROP TABLE IF EXISTS `teacher_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_table` (
  `TeacherID` int(10) NOT NULL,
  `StdID` int(3) NOT NULL,
  `section` char(1) NOT NULL,
  `SubjectID` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`TeacherID`),
  KEY `StdID` (`StdID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `teacher_table_ibfk_1` FOREIGN KEY (`StdID`) REFERENCES `standard_master` (`StdID`),
  CONSTRAINT `teacher_table_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject_master` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_table`
--

LOCK TABLES `teacher_table` WRITE;
/*!40000 ALTER TABLE `teacher_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_master`
--

DROP TABLE IF EXISTS `user_role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_master` (
  `UserRoleID` int(4) NOT NULL,
  `UserRoleName` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_master`
--

LOCK TABLES `user_role_master` WRITE;
/*!40000 ALTER TABLE `user_role_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `user_table` (
--   `UserID` int(30) NOT NULL,
--   `UserName` varchar(100) NOT NULL,
--   `UserRole` int(4) NOT NULL,
--   `LoginName` varchar(100) DEFAULT NULL,
--   `password` varchar(100) NOT NULL,
--   `status` tinyint(1) NOT NULL,
--   PRIMARY KEY (`UserID`),
--   UNIQUE KEY `password` (`password`),
--   UNIQUE KEY `UserName` (`UserName`),
--   UNIQUE KEY `LoginName` (`LoginName`),
--   KEY `UserRole` (`UserRole`),
--   CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `user_role_master` (`UserRoleID`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_table` (
  `UserID` int(30) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `UserRole` int(4) NOT NULL,
  `LoginName` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `password` (`password`),
  -- UNIQUE KEY `UserName` (`FirstName`),
  -- UNIQUE KEY `UserName` (`LastName`),
  UNIQUE KEY `LoginName` (`LoginName`),
  KEY `UserRole` (`UserRole`),
  CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `user_role_master` (`UserRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 21:20:55
>>>>>>> updates.20.10
