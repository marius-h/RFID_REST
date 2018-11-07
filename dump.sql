-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 07, 2018 at 07:44 PM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keyless`
--

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `idgroup` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`idgroup`, `name`, `desc`) VALUES
(1, 'IT-Abteilung', 'Alle Lehrer der IT'),
(2, 'Reinigung', 'Alle Reinigungskräfte');

-- --------------------------------------------------------

--
-- Table structure for table `lock`
--

CREATE TABLE `lock` (
  `idlock` int(11) NOT NULL,
  `key` varchar(32) NOT NULL,
  `room` varchar(20) DEFAULT NULL,
  `failed_counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lock`
--

INSERT INTO `lock` (`idlock`, `key`, `room`, `failed_counter`) VALUES
(1, 'lck123', '101', 0),
(2, 'lck234', '209', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lock_has_group`
--

CREATE TABLE `lock_has_group` (
  `lock` int(11) NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lock_has_group`
--

INSERT INTO `lock_has_group` (`lock`, `group`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lock_has_user`
--

CREATE TABLE `lock_has_user` (
  `lock` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lock_has_user`
--

INSERT INTO `lock_has_user` (`lock`, `user`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `firstname` varchar(45) CHARACTER SET latin1 COLLATE latin1_german1_ci DEFAULT NULL,
  `lastname` varchar(45) CHARACTER SET latin1 COLLATE latin1_german1_ci DEFAULT NULL,
  `mail` varchar(45) NOT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `firstname`, `lastname`, `mail`, `password`) VALUES
(1, 'Martin', 'L', 'l@door.de', '1af37c18-e2b8-11e8-9f32-f2801f1b9fd1'),
(2, 'Michael', 'S', 's@door.de', '1af37eac-e2b8-11e8-9f32-f2801f1b9fd1'),
(3, 'Gerdlinde', 'M', 'm@door.de', '1af38000-e2b8-11e8-9f32-f2801f1b9fd1');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_group`
--

CREATE TABLE `user_has_group` (
  `user` int(11) NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_group`
--

INSERT INTO `user_has_group` (`user`, `group`) VALUES
(1, 1),
(2, 1),
(3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`idgroup`);

--
-- Indexes for table `lock`
--
ALTER TABLE `lock`
  ADD PRIMARY KEY (`idlock`),
  ADD UNIQUE KEY `key_UNIQUE` (`key`);

--
-- Indexes for table `lock_has_group`
--
ALTER TABLE `lock_has_group`
  ADD PRIMARY KEY (`lock`,`group`),
  ADD KEY `fk_group_has_lock_lock1_idx` (`lock`),
  ADD KEY `fk_group_has_lock_group1_idx` (`group`);

--
-- Indexes for table `lock_has_user`
--
ALTER TABLE `lock_has_user`
  ADD PRIMARY KEY (`lock`,`user`),
  ADD KEY `fk_lock_has_user_user1_idx` (`user`),
  ADD KEY `fk_lock_has_user_lock_idx` (`lock`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `user_has_group`
--
ALTER TABLE `user_has_group`
  ADD PRIMARY KEY (`user`,`group`),
  ADD KEY `fk_user_has_group_group1_idx` (`group`),
  ADD KEY `fk_user_has_group_user1_idx` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `idgroup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lock`
--
ALTER TABLE `lock`
  MODIFY `idlock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `lock_has_group`
--
ALTER TABLE `lock_has_group`
  ADD CONSTRAINT `fk_group_has_lock_group1` FOREIGN KEY (`group`) REFERENCES `group` (`idgroup`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_group_has_lock_lock1` FOREIGN KEY (`lock`) REFERENCES `lock` (`idlock`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lock_has_user`
--
ALTER TABLE `lock_has_user`
  ADD CONSTRAINT `fk_lock_has_user_lock` FOREIGN KEY (`lock`) REFERENCES `lock` (`idlock`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_lock_has_user_user1` FOREIGN KEY (`user`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_group`
--
ALTER TABLE `user_has_group`
  ADD CONSTRAINT `fk_user_has_group_group1` FOREIGN KEY (`group`) REFERENCES `group` (`idgroup`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_group_user1` FOREIGN KEY (`user`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;