-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2021 at 04:32 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `house_rental`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getbooking`()
SELECT booking_date from booking$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `t_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`t_id`, `h_id`, `booking_date`, `period`, `price`) VALUES
(2, 1, '2021-04-10', 10, 5000),
(2, 5, '2021-02-20', 6, 5000),
(3, 2, '2021-01-23', 5, 8000),
(4, 4, '2020-07-08', 12, 6000),
(5, 2, '2018-10-02', 10, 10000),
(5, 5, '2019-12-25', 10, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE IF NOT EXISTS `house` (
`id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `no_of_rooms` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`id`, `owner_id`, `no_of_rooms`, `rate`, `country`, `state`, `city`, `address`) VALUES
(1, 1, 3, 10000, 'Australia', 'Tazmania', 'Hobart', '96 B Street');
INSERT INTO `house` (`id`, `owner_id`, `no_of_rooms`, `rate`, `country`, `state`, `city`, `address`) VALUES
(3, 1, 5, 15000, 'USA', 'MA', 'Winchester', '2696 Romano Street');
INSERT INTO `house` (`id`, `owner_id`, `no_of_rooms`, `rate`, `country`, `state`, `city`, `address`) VALUES
(4, 2, 3, 5000, 'India', 'Tamil Nadu', 'Chennai', '4962 Nuewporrt Lane'),
(5, 2, 3, 20000, 'USA', 'Orr', 'Becertond', '1569 Godfrey St');

--
-- Triggers `house`
--
DELIMITER //
CREATE TRIGGER `deletelog` BEFORE DELETE ON `house`
 FOR EACH ROW INSERT INTO logs VALUES(null,old.id,"deleted",now())
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `insertlog` AFTER INSERT ON `house`
 FOR EACH ROW INSERT INTO logs VALUES(null,new.id,"inserted",now())
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `updateLog` AFTER UPDATE ON `house`
 FOR EACH ROW INSERT INTO logs VALUES(null,new.id,"updated",now())
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
`id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `house_id`, `action`, `date`) VALUES
(1, 6, 'deleted', '2019-11-30'),
(2, 7, 'inserted', '2019-11-30'),
(3, 2, 'updated', '2019-11-30'),
(4, 2, 'updated', '2019-11-30'),
(5, 8, 'inserted', '2019-11-30'),
(6, 9, 'inserted', '2019-12-01'),
(7, 8, 'deleted', '2019-12-01'),
(8, 9, 'deleted', '2019-12-01'),
(9, 7, 'deleted', '2019-12-01'),
(10, 10, 'inserted', '2019-12-01'),
(11, 11, 'inserted', '2019-12-01'),
(12, 5, 'updated', '2019-12-01'),
(13, 11, 'deleted', '2019-12-01'),
(14, 5, 'updated', '2019-12-01'),
(15, 12, 'inserted', '2019-12-01'),
(16, 12, 'deleted', '2019-12-01'),
(17, 6, 'inserted', '2019-12-02'),
(18, 6, 'updated', '2019-12-02'),
(19, 6, 'deleted', '2019-12-02'),
(20, 2, 'updated', '2021-04-01'),
(21, 2, 'updated', '2021-04-01'),
(22, 2, 'updated', '2021-04-01'),
(23, 2, 'updated', '2021-04-01'),
(24, 2, 'updated', '2021-04-01'),
(25, 3, 'updated', '2021-04-01'),
(26, 3, 'updated', '2021-04-01'),
(27, 3, 'updated', '2021-04-01'),
(28, 3, 'updated', '2021-04-01'),
(29, 3, 'updated', '2021-04-01'),
(30, 4, 'updated', '2021-04-01'),
(31, 5, 'updated', '2021-04-01'),
(32, 1, 'updated', '2021-04-01'),
(33, 4, 'updated', '2021-04-01'),
(34, 4, 'updated', '2021-04-01'),
(35, 4, 'updated', '2021-04-01'),
(36, 4, 'updated', '2021-04-01'),
(37, 5, 'updated', '2021-04-01'),
(38, 5, 'updated', '2021-04-01'),
(39, 5, 'updated', '2021-04-01'),
(40, 5, 'updated', '2021-04-01'),
(41, 1, 'updated', '2021-04-01'),
(42, 1, 'updated', '2021-04-01'),
(43, 1, 'updated', '2021-04-01'),
(44, 1, 'updated', '2021-04-01');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `t_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `relationship` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`t_id`, `fname`, `lname`, `occupation`, `gender`, `dob`, `relationship`) VALUES
(1, 'Anna R.', 'Desilvaa', 'Stereotyper', 'female', '1990-03-20', 'Sister'),
(3, 'James', 'Speer', 'Marketing manager', 'male', '1985-11-29', 'Friend'),
(3, 'Mary F.', 'Talbott', 'Assistant property manager', 'female', '1990-12-11', 'Step-Sister'),
(4, 'Joshua', 'Jenkins', 'Photojournalist', 'male', '1987-12-16', 'Brother');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE IF NOT EXISTS `owner` (
`o_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `no_of_houses` int(11) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`o_id`, `name`, `email`, `pwd`, `mobile_no`, `occupation`, `no_of_houses`, `country`, `state`, `city`, `address`) VALUES
(1, 'Rajkaran Shukla', 'rajkaran@gmail.com', 'password', 124579669, 'Web Developer', 3, 'India', 'Maharashtra', 'Mumbai', 'Dadar'),
(2, 'Adheesh Salian', 'adheesh@gmail.com', 'password', 258520006, 'Physician', 2, 'USA', 'Bilzen', 'Homenickshire', '97221 Hills Walks'),
(3, 'Bhavya Gor', 'bhavya@gmail.com', 'password', 1973469696, 'Civil Engineer', 0, 'New Zealand', 'Odal', 'Marcelinoville', '48 Mills Heights'),
(4, 'Tanya Mistry', 'tanya@gmail.com', 'password', 9876541100, 'Photographer', 0, 'USA', 'FL', 'Cape Coral', '2655 Pine Tree Lae'),
(5, 'Jose Mefford', 'jose@gmail.com', 'password', 258741036, 'Teacher', 0, 'Australia', 'Tazmania', 'Hobart', '69 Boundary Street');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `t_id`, `rating`, `comment`) VALUES
(1, 1, 5, 'good'),
(2, 5, 5, 'cool'),
(3, 1, 5, 'good'),
(4, 4, 3, 'ok ok'),
(5, 2, 2, 'bad');

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE IF NOT EXISTS `tenant` (
`t_id` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`t_id`, `fname`, `lname`, `email`, `pwd`, `mobile_no`, `occupation`) VALUES
(1, 'Ramesh', 'Gupta', 'ramesh@gmail.com', 'password', 7415554580, 'Student'),
(2, 'Lynn', 'Bishop', 'lynnb@gmail.com', 'password', 1234567890, 'Range conservationist'),
(3, 'Jo D.', 'Ryan', 'ryaandi@gmail.com', 'password', 7850000069, 'Physician assistant'),
(4, 'Jonathan', 'Rhoades', 'jonr@gmail.com', 'password', 6969696960, 'IT Professional'),
(5, 'Daniel', 'Hamadaa', 'dandaniels@gmail.com', 'password', 6470000012, 'Front-End Developer'),
(6, 'Joyce', 'Jones', 'jonesj@gmail.com', 'password', 7531597530, 'Businessman');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vacanthouses`
--
CREATE TABLE IF NOT EXISTS `vacanthouses` (
`id` int(11)
,`owner_id` int(11)
,`no_of_rooms` int(11)
,`rate` int(11)
,`pics` blob
,`country` varchar(20)
,`state` varchar(20)
,`city` varchar(30)
,`address` varchar(50)
,`description` varchar(300)
);
-- --------------------------------------------------------

--
-- Structure for view `vacanthouses`
--
DROP TABLE IF EXISTS `vacanthouses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vacanthouses` AS select `house`.`id` AS `id`,`house`.`owner_id` AS `owner_id`,`house`.`no_of_rooms` AS `no_of_rooms`,`house`.`rate` AS `rate`,`house`.`country` AS `country`,`house`.`state` AS `state`,`house`.`city` AS `city`,`house`.`address` AS `address` from `house` where (not(`house`.`id` in (select `booking`.`h_id` from `booking`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
 ADD PRIMARY KEY (`t_id`,`h_id`), ADD KEY `h_id` (`h_id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
 ADD PRIMARY KEY (`id`), ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`t_id`,`fname`,`lname`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
 ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
 ADD PRIMARY KEY (`id`,`t_id`), ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
 ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`h_id`) REFERENCES `house` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE;

--
-- Constraints for table `house`
--
ALTER TABLE `house`
ADD CONSTRAINT `house_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`o_id`) ON DELETE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`id`) REFERENCES `house` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `rating_ibfk_4` FOREIGN KEY (`t_id`) REFERENCES `tenant` (`t_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
