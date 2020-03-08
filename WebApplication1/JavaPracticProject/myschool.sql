-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2019 at 12:49 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myschool`
--
CREATE DATABASE IF NOT EXISTS `myschool` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `myschool`;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TEXT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`ID`, `NAME`, `TEXT`) VALUES
(1, '1', 'ужас'),
(2, '2', 'плохо'),
(3, '3', 'удовлетворительно'),
(4, '4', 'хорошо'),
(5, '5', 'отлично');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `ID` bigint(20) NOT NULL,
  `RECORD` datetime DEFAULT NULL,
  `GRADE_ID` bigint(20) DEFAULT NULL,
  `PERSON_ID` bigint(20) DEFAULT NULL,
  `SUBJECT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`ID`, `RECORD`, `GRADE_ID`, `PERSON_ID`, `SUBJECT_ID`) VALUES
(1, '2019-10-29 13:47:32', 3, 4, 1),
(2, '2019-10-29 13:47:54', 4, 5, 1),
(3, '2019-10-29 13:48:06', 2, 4, 2),
(4, '2019-10-29 13:48:14', 5, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`ID`, `NAME`) VALUES
(1, 'John Doe'),
(2, 'Ivan Ivanoff'),
(3, 'Petr Petrovich'),
(4, 'Vova Sidorov'),
(5, 'Misha Steinwurtzel');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TEACHER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`ID`, `NAME`, `TEACHER`) VALUES
(1, 'Математика', 'Иван Иванофф'),
(2, 'История', 'Петр Петрович');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SALTS` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `PERSON_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `LOGIN`, `PASSWORD`, `SALTS`, `STATUS`, `PERSON_ID`) VALUES
(1, 'admin', 'e3c37ee7190cdea0a2b11b5109732c229213eff0997be6141b67a9b7177381a1', 'f74a2a44ac3e2ef1113d53912b1825ff', 'administrator', 1),
(2, 'ivan', 'd67ad44b4c47ccc83b5d363b27c9a51cba43073494a9106914a338ab5703e507', '3d47e8606bb610ec0e4b07ea8197621', 'teacher', 2),
(3, 'petr', '905288a7ad3a361df9f086c09ef946429d4c8a0062113187537db7bf7053b999', 'a6850a12a059b01d5a81e501ba4eea7', 'teacher', 3),
(4, 'vovka', 'f4ead697d37c6680750b8bdd9ab33bdd3e8fd6f469722e76d1819532d8ca4822', '40b463870c20dd0b15cc1d6a9f5ef731', 'pupil', 4),
(5, 'misha', '4b16c6f09976eb79dff2eca77d6dcd6c558c6df4ea6a92a22a62aedc7de5486f', 'b061c9b5d2341a781b7161736395ecc', 'pupil', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HISTORY_GRADE_ID` (`GRADE_ID`),
  ADD KEY `FK_HISTORY_PERSON_ID` (`PERSON_ID`),
  ADD KEY `FK_HISTORY_SUBJECT_ID` (`SUBJECT_ID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `LOGIN` (`LOGIN`),
  ADD KEY `FK_USER_PERSON_ID` (`PERSON_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_HISTORY_GRADE_ID` FOREIGN KEY (`GRADE_ID`) REFERENCES `grade` (`ID`),
  ADD CONSTRAINT `FK_HISTORY_PERSON_ID` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID`),
  ADD CONSTRAINT `FK_HISTORY_SUBJECT_ID` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`ID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_PERSON_ID` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
