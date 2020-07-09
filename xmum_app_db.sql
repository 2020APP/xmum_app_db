-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2020 at 04:05 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xmum_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` varchar(12) NOT NULL,
  `course_name` varchar(72) NOT NULL,
  `credit` int(11) NOT NULL,
  `lecturer_id` varchar(10) NOT NULL,
  `student_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `credit`, `lecturer_id`, `student_no`) VALUES
('swe308', 'Information Security', 4, 'testing123', 1),
('swe311', 'Mobile Application System Design', 4, 'testing123', 0),
('testing123', 'testing123', 4, 'testing123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_history`
--

CREATE TABLE `enrollment_history` (
  `course_id` varchar(12) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `gpa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollment_history`
--

INSERT INTO `enrollment_history` (`course_id`, `student_id`, `gpa`) VALUES
('swe308', 'swe1709864', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` varchar(10) NOT NULL,
  `full_name` varchar(72) NOT NULL,
  `role` varchar(10) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `e_mail_addr` varchar(72) NOT NULL,
  `password_hash` varchar(72) NOT NULL,
  `salt` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `full_name`, `role`, `phone_num`, `e_mail_addr`, `password_hash`, `salt`) VALUES
('swe1709864', 'Wong Ting Sen', 'Student', '0183231959', 'maplewong1998@gmail.com', '$2y$10$TfAkfAgT6o6ePeyLa2VUIuRKYdfazprvS4xHhZNsXE3DAAlun0j82', '0499562b849ec926e43a19ead1adc5e1f7a38116af7a852fe36e46f257eedb3d'),
('swe1808080', 'Wong Teng Jong', 'Student', '0132389754', 'wtj@gmail.com', '$2y$10$zTgBwcDWBxIZDO4fQbizLOH4kuMsCjpLOqzVIf6awt6RUpLoXT.4.', '98841974ffbfcdb9ab2aeb820c447bc34af7117d8d3324dd342c645da44a8802'),
('testing123', 'testing123', 'Staff', '01010101010', 'testing123@gmail.com', '$2y$10$Lm7i9s40Lrx9oFEcdQlEOOTtVbIH0dJFt72X1J0fSXarqE.snopk6', 'a054c2f1cd312c8ee44b10ab11897ecb5931dfbc0366dab1b546100b2c2110c7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `courses_lecturer_id_member_id` (`lecturer_id`);

--
-- Indexes for table `enrollment_history`
--
ALTER TABLE `enrollment_history`
  ADD PRIMARY KEY (`course_id`,`student_id`),
  ADD KEY `eh_student_id_member_id` (`student_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `password_hash` (`password_hash`),
  ADD UNIQUE KEY `salt` (`salt`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_lecturer_id_member_id` FOREIGN KEY (`lecturer_id`) REFERENCES `member` (`id`);

--
-- Constraints for table `enrollment_history`
--
ALTER TABLE `enrollment_history`
  ADD CONSTRAINT `eh_course_id_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `eh_student_id_member_id` FOREIGN KEY (`student_id`) REFERENCES `member` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
