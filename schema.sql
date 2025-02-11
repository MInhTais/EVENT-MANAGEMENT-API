-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: event_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `event_registrations`
--

DROP TABLE IF EXISTS `event_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_registrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `registered_at` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `event_registrations_event_id_events_id_fk` (`event_id`),
  CONSTRAINT `event_registrations_event_id_events_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_registrations`
--

LOCK TABLES `event_registrations` WRITE;
/*!40000 ALTER TABLE `event_registrations` DISABLE KEYS */;
INSERT INTO `event_registrations` VALUES (4,4,'Phạm Thị D','female','phamthid@example.com','0945678901','2025-02-18 00:45:00'),(5,5,'Ngô Minh E','male','gnominhe@example.com','0956789012','2025-02-20 02:00:00'),(6,6,'Đặng Hoàng F','other','danghoangf@example.com','0967890123','2025-02-22 05:10:00'),(8,4,'Minh Anh','male','minhtai2019cb2@gmail.com','0987654321','2025-02-05 10:39:29'),(9,5,'Minh Tại','male','minhtai2019cb2@gmail.com','0987654321','2025-02-05 10:43:36'),(14,10,'Nguyễn Minh Tại','male','minhtai2019cb2@gmail.com','0987654321','2025-02-11 09:35:36');
/*!40000 ALTER TABLE `event_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `event_date` timestamp NOT NULL,
  `location` varchar(255) NOT NULL,
  `current_participants` int DEFAULT '0',
  `max_participants` int NOT NULL,
  `status` enum('active','canceled') NOT NULL DEFAULT 'active',
  `created_by_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (4,'Khóa học Lập trình Web miễn phí','Chuỗi bài giảng dành cho người mới bắt đầu, hướng dẫn từ HTML, CSS đến JavaScript.','2025-06-05 00:00:00','Học viện Công nghệ BKACAD, Hà Nội',2,150,'active','Nguyễn Minh Tại','minhtai2019cb2@gmail.com'),(5,'Hội chợ ẩm thực Việt Nam 2025','Cơ hội khám phá và thưởng thức những món ăn đặc sắc từ khắp mọi miền đất nước.','2025-07-15 04:00:00','Phố đi bộ Nguyễn Huệ, TP. HCM',2,500,'active','Nguyễn Minh Tại','minhtai2019cb2@gmail.com'),(6,'Gala ca nhạc gây quỹ từ thiện','Đêm nhạc quy tụ nhiều nghệ sĩ nổi tiếng, gây quỹ giúp đỡ trẻ em nghèo vượt khó.','2025-08-22 05:30:00','Nhà hát Lớn Hà Nội',1,400,'canceled','Nguyễn Minh Anh','minhanh@gmail.com'),(10,'Làm bài test','Làm bài test nodejs/reactjs','2025-02-10 19:34:00','Tại nhà',1,2,'active','Minh Hà','minhha@gmail.com'),(11,'Đi ăn với bạn vào tối nay','đi ăn với bạn','2025-02-10 20:08:00','cần thơ',0,3,'active','Nguyễn Minh Tại','minhtaia2@gmail.com');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
INSERT INTO `refresh_tokens` VALUES (1,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxNzYwNiwiZXhwIjoxNzM5NTIyNDA2fQ.bRYpUgpx5DyaggEgHPkZjQbVl5u68hzhXyac2D-UlnkXYXJ_nLrT154GeHjzgLA_U6m-l1G-NrvwzWCXBm4upA'),(2,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxODQxNywiZXhwIjoxNzM5NTIzMjE3fQ.dch2ZCJNAQqHbav3lcgnZW4qO37iVnupdsQ3DU3wO5hgJAI8Fj9PrEzXv-XheEFjej_ZG5FsxTGlMxZ6TeFjhA'),(3,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxODYxNSwiZXhwIjoxNzM5NTIzNDE1fQ.5qmKKZ_nfU6v4tMl3mLFEY94bOkUuKcOs-9YpONPKV3AV3vxDPj91l7gV2-k60qU9MgUbTh2wYHgMr7dTPSuYQ'),(4,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxODc2MCwiZXhwIjoxNzM5NTIzNTYwfQ.hLQh5F-_SgqCDM19exQrtugdIFL80qrd8nkht_kNp6jqHxo3HQoeEGRyP7A8iQQrNA9O2iwJWYGEF4pa5-FT9w'),(5,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxODg0NywiZXhwIjoxNzM5NTIzNjQ3fQ.yXgEQyIFaQG2WfGhIWWgdTpzt4Zmr8SQPx6Ioin-f_IXC5GLNKl6aANgl__D51HpouqCORLlJfmRnZmpIUtYMA'),(6,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxOTA4OSwiZXhwIjoxNzM5NTIzODg5fQ.ucHVRMFrpWaVujnfxu0fCxVb2uzttY-kImIEdhjjpYtIe9MqpeVG-naruKPXmtP5sAvZiYbLhD4zrdRhB-YrXQ'),(7,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxOTQyNywiZXhwIjoxNzM5NTI0MjI3fQ.Mou0ER-KKthYUUHY8CUPcRPItaPDrzfFagoEXJGn_1pDZWXWAGANZvmI4nkydi3flZbeL4HJC3HkfQxEvqyf7g'),(8,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxOTc5OCwiZXhwIjoxNzM5NTI0NTk4fQ.vzVl6uES9lFnECLodr7j4pWYpgwS9J1uCPlbf4j293eRCvEYeLLmouMdw_mz30rgs8kbZoqiuUm40C3NjRDp9Q'),(9,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkxOTk0OSwiZXhwIjoxNzM5NTI0NzQ5fQ.YWIuTA38ofY6G-03UBznFTphJFF0jDPmV_jYuKhABGwSk5J-02czAFknEebC69klWKyMW2E8mo8EWEATjfIC6Q'),(10,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyMDA0MywiZXhwIjoxNzM5NTI0ODQzfQ.8gcprVB-LxmbmiGxQbaUR4wBRV4uYSZd2BXXyK9jovlBAMBJ8_Gl4wUiOEE0DvlMtTkDwTshLdCtaF1QDKgi2Q'),(11,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyMDE5MiwiZXhwIjoxNzM5NTI0OTkyfQ.w9SdOMCGwcam_fiTC7ba_yChcCKZnBwllUSbr7_f0iOn7uizD4UMtgG-RZ3qSsyFXlBVtCJZZdDDkb7QhHCyXQ'),(12,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyMDIxMiwiZXhwIjoxNzM5NTI1MDEyfQ.SGqAc1YlHaxLzndAs-m_35SGLU75exZOuCyc6LAvHR7Y_4X33CTX-TqktEtmruq1q8He9bynEzEFB9WcriT3xg'),(13,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyMDI0OCwiZXhwIjoxNzM5NTI1MDQ4fQ.sWaD1mSKrBTNxD0mGC3PYDxHzrFZbLm8pO5CHU_iWECRp41niSibuwf2By8wTUPduipG6qGuUR4L7huBgw1AKw'),(14,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyMDI2MiwiZXhwIjoxNzM5NTI1MDYyfQ.YA-UAkQ9CGztbBvrvusOUVd7bLgeS5YwfLr_lrV3v0m4hrMhLYqlQ4CxNtQCT8_MGFasN_mmdMejT9Gtb3MkDA'),(15,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyMjIxNSwiZXhwIjoxNzM5NTI3MDE1fQ.vHv1e9oIWFehhdPgKcFn4pTblrylqTPh9l0sgi7A6s5fNruvk4GIXCRqwXVShBw-eoSu-hP-RHjGzj0UfOG-vQ'),(16,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyNjM5OSwiZXhwIjoxNzM5NTMxMTk5fQ.z65ziPNYnPLEke52CxlhveLhtN3ZoHtc7IeIH81oedQ8lKHMhP3SkDh2r3_baJTCpIhimIpj3bbY32SVGSTzLA'),(17,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTA2MCwiZXhwIjoxNzM5NTMzODYwfQ.oinSAVqr1CGdH2RFuLMJy-m3mxZX3uSAfDtz8NAfC-QlYrCehQ2Y0-yvJo_T9vlbQxe7OPgiZlGgxeadBhSJsw'),(18,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTE3MiwiZXhwIjoxNzM5NTMzOTcyfQ.E464K1vOrbea2cWgkskM0z3GiCLx9LoGqWGbGqBWXVstWjBuVcgBcs_uvoAjEdLhh7qM1cRJSq0y2O0innU1yA'),(19,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTcwMCwiZXhwIjoxNzM5NTM0NTAwfQ.HwFPeXM_Qmsmx-GOgqk1iAvdtO4x6f60IjiT_L_-7dI0ZirxJqgMeW0J4oIzJioZ7gAU3IaTY5Xe-xlzhADnrA'),(20,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTcwOSwiZXhwIjoxNzM5NTM0NTA5fQ.tQH-9cRpWb5s1ctXx3Pje2o93MXipS4cbVBlhAAu56DEiKDGXIegNItOct5JUHcz0IWCcYZhsTkeBpeC5MMVpQ'),(21,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTczNiwiZXhwIjoxNzM5NTM0NTM2fQ.h1e6wGocchblo1oezkec__3G_xuISNPzJr0lflgwAQq5YwIJ01SUKebiPO9SrNKdIAAjiZc6rNELRSNg5T-NkA'),(22,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTc5NiwiZXhwIjoxNzM5NTM0NTk2fQ.9odIj19iCN_LgZf87-PQ1NIRpCo4z6sl7NXo73BGIkRfQC8VKsAAqQVKPHTGNayjnll9TJABi_kqP6IaPnDe5g'),(23,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTg0NCwiZXhwIjoxNzM5NTM0NjQ0fQ.6Z4WG_zhUW7G9-wh4pm_5ijRSyDUSrIm2Z1m7XWf1YX5Sm5bfc7FOH_7tUoqFndcAwwj5PtTNyUO7fidLV4VLw'),(24,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkyOTg1NiwiZXhwIjoxNzM5NTM0NjU2fQ.R4IzwouWH_7SrV82cjV0_hHExUadLLqsoxYy3dUbq8Ys8hZKVJJRigYii8TBPu-fyQ4CPgqBGVKh7m8kZoQLEw'),(25,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkzMTY0OSwiZXhwIjoxNzM5NTM2NDQ5fQ.qUFkXPJrUhTE0b-Uaju6Kr6Hn5UDtqmMlepxApgCrh0M2K98aco4EFUaFsyUqL3fN2hC4nRiAbcXO53g2Jaa_A'),(26,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczODkzMTgwMiwiZXhwIjoxNzM5NTM2NjAyfQ.KoxBOfQyQ65XpvFdeVQL71DiBcSfBsaFvQ61jPcNTeEKRWcuNfQxrLumAdMFwUQUncw7TjVgiZQTzJyRryCjxw'),(27,'minhtai2019c2b2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5YzJiMkBnbWFpbC5jb20iLCJuYW1lIjoiTWluaCBIw6AiLCJpYXQiOjE3Mzg5MzI4ODYsImV4cCI6MTczOTUzNzY4Nn0.EZ1C0tTAviqPii9ZUS_VJ_wvu5SaT87JinMl-RDDJJ8eSW2vugBoLc7P9jyY_CuSEHUgWEBTgnQ7Wi_Gd3c4WA'),(28,'minhtai2019c2b2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5YzJiMkBnbWFpbC5jb20iLCJuYW1lIjoiTWluaCBIw6AiLCJpYXQiOjE3Mzg5MzMwMjksImV4cCI6MTczOTUzNzgyOX0.HmwnZLdSrgK7-gAX5ZkIHFeYk1mjhTCH5s_sLAk2Ff351hmp98X80ehjT5JmUsesYHEfVWXszJn90tbO40HFqg'),(29,'an@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFuQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIEFuIiwiaWF0IjoxNzM5MjY1NDAwLCJleHAiOjE3Mzk4NzAyMDB9.s7E9ikK4_MjvfXnqfm8qpSs7Qz_8mG7mP1mzjhj-WQlbnrQdXHN6Kvg3XaLUMrgifzLJz7zNfE6DqiLLUFYVNw'),(30,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczOTI2NTU0MiwiZXhwIjoxNzM5ODcwMzQyfQ.sxtLOOoOuwRSOrpODMfInAtjRQJjTlPj6plND5uQmuN3xUNK8RlkgMzsvdfKKL0wtn7ZDH9jZ3C9vtGWhnquSA'),(31,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczOTI2NjAwOSwiZXhwIjoxNzM5ODcwODA5fQ.qyKgP6sSWNHk7P7k3svGqYLi1mAo7lP3rmFwImBeLiHn4naAtSSIjtcsWjg0xJgHKDEPB9Wo6t3BKu2Nk5gRsw'),(32,'minhha@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmhoYUBnbWFpbC5jb20iLCJuYW1lIjoiTWluaCBIw6AiLCJpYXQiOjE3MzkyNjYyOTMsImV4cCI6MTczOTg3MTA5M30.E_YqZ-xUcgn1QLQIOjR_pvnGmvO_tzMY4sMGjvmzPCblTrfybO5MYAjCjVet_1TmOUDG9XZ0SlxKsDeAY-u2Gg'),(33,'minhtai2019cb2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkyMDE5Y2IyQGdtYWlsLmNvbSIsIm5hbWUiOiJOZ3V54buFbiBNaW5oIFRhaSIsImlhdCI6MTczOTI2NjY1MSwiZXhwIjoxNzM5ODcxNDUxfQ.M6KvzCjtIpA58yFbCDSsFvCwlcy7ocO8LEC3BBzTplbNc-ojsXBwbrsLE9A-nfHqPAjcUL9KLY_Q-zurNu3Xmw'),(34,'minhtai12@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWkxMkBnbWFpbC5jb20iLCJuYW1lIjoiTmd1eeG7hW4gTWluaCBU4bqhaSIsImlhdCI6MTczOTI2NzM2NiwiZXhwIjoxNzM5ODcyMTY2fQ.-pTVvLP7BLP-XVZdvVbDrywsgYScSC37Q0gIBJdBKgI0Xx-1Bb3rNc7l0q41CSqkWEoQaHFPjgEZ0AS-KaiKwg'),(35,'minhtaia2@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1pbmh0YWlhMkBnbWFpbC5jb20iLCJuYW1lIjoiTmd1eeG7hW4gTWluaCBU4bqhaSIsImlhdCI6MTczOTI2ODQyOSwiZXhwIjoxNzM5ODczMjI5fQ.SSVkJUx1svrHrWSPCvbUWNlmJbPbaij1UDEb63KvdOPKvm1vmBflG9osGuQLQ8cN_9aQO4WvrxUX5tYpGvTROQ'),(36,'thuha@gmail.com','eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRodWhhQGdtYWlsLmNvbSIsIm5hbWUiOiLEkOG6t25nIFRodSBIw6AiLCJpYXQiOjE3MzkyNjk0NjcsImV4cCI6MTczOTg3NDI2N30.NSsE1KMtRzWcx-laYZ5BeV2kAa_fvjLeULGJTvPNo42_7HYx-2CY2x5CvGYhGRBoi5hvnhaBIDjCB2poNo5hJg');
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT (now()),
  `updated_at` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('an@gmail.com','$2a$10$jKYNg8uwZF.5xai8Q993.uNypV.Z2nJ2a6Z5Hk0kuq8Qk0jGl7VpW','Nguyễn Minh An',1,'2025-02-11 09:16:11','2025-02-11 09:16:11'),('huynh65b2@gmail.com','$2a$10$LswriYwbojxAN4QIOU0Yxu8XK2eDRG4UbGZeO0XW/kEGQE.blJbjy','Minh Hà',1,'2025-02-07 12:53:00','2025-02-07 12:53:00'),('minhanh@gmail.com','$2a$10$2vJdG7.fMmFVGTCbQrXI.eolGUPxn6s/ffP6c8J8rlvTSCBHZOo4K','Nguyễn Minh Anh',1,'2025-02-04 22:25:09','2025-02-05 05:25:09'),('minhha@gmail.com','$2a$10$KOQpa6apbDqjr64dlNX84OJYdyUi/MUmi4Tj8/J.UwqfK9kBE78kC','Minh Hà',1,'2025-02-11 09:31:01','2025-02-11 09:31:01'),('minhtai12@gmail.com','$2a$10$YY1inaUKBRGpxdxv/r8pSujm0QjtwpjCOEFpRt7qYP046/nNiq5xK','Nguyễn Minh Tại',1,'2025-02-11 09:49:15','2025-02-11 09:49:15'),('minhtai2019c2b2@gmail.com','$2a$10$D/VGe4dK39v9l.G6ja9deO9RpWG5mzrqorlHxXelofcObjmhpQpRS','Minh Hà',1,'2025-02-07 12:53:47','2025-02-07 12:53:47'),('minhtai2019cb2@gmail.com','$2a$10$2vJdG7.fMmFVGTCbQrXI.eolGUPxn6s/ffP6c8J8rlvTSCBHZOo4K','Nguyễn Minh Tai',1,'2025-02-04 22:25:09','2025-02-05 05:25:09'),('minhtai2019cb21@gmail.com','minhtai12345','Nguyễn',1,'2025-02-07 12:41:15','2025-02-07 12:41:15'),('minhtaia2@gmail.com','$2a$10$wOBK5KajxvbzwP3hz26VNuonLrkEwJLkU1uhXAQ5hso03jk7CYIP2','Nguyễn Minh Tại',1,'2025-02-11 10:06:53','2025-02-11 10:06:53'),('studen1t@cit.ctu.edu.vn','$2a$10$./c2itU3U2g6VjWfIuXKheh/odRxFRJuiQ5dlj0L0sYQCotaKwy8q','Minh Hà',1,'2025-02-07 12:52:01','2025-02-07 12:52:01'),('student@cit.ctu.edu.vn','$2a$10$Jl6elIp6MCDrn9CtJZnnW.pas7BMgfufOKFTYYgE39E4KmhZd9cwG','Minh Hà',1,'2025-02-07 12:50:57','2025-02-07 12:50:57'),('student11@cit.ctu.edu.vn','$2a$10$789WezZJKL3Kq7fcn./YkO78O3On0dDvRKHyvj1vrdUufU4XK.ya2','Minh Hà',1,'2025-02-07 12:52:22','2025-02-07 12:52:22'),('thuha@gmail.com','$2a$10$Pc.leJauGmBh0XibT36EQuTi9EobF1hgr1U67YK7mwCIAOgTEij7G','Đặng Thu Hà',1,'2025-02-11 10:24:02','2025-02-11 10:24:02');
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

-- Dump completed on 2025-02-11 17:44:36
