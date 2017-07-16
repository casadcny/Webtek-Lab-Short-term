-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2017 at 07:38 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialnetwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `f1` int(11) NOT NULL,
  `f2` int(11) NOT NULL,
  `since` date DEFAULT NULL,
  PRIMARY KEY (`f2`,`f1`),
  KEY `f1_idx` (`f1`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL,
  `id_poster` int(11) NOT NULL,
  `date` date NOT NULL,
  `visibility` enum('public','private','only me') NOT NULL DEFAULT 'public',
  `post_info` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='			\n	';

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `from` varchar(45) NOT NULL,
  `to` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `status` enum('pending','approved') DEFAULT 'pending',
  PRIMARY KEY (`from`,`to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idno` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` char(45) DEFAULT NULL,
  `lastname` char(20) DEFAULT NULL,
  `status` enum('pending','approved') NOT NULL DEFAULT 'pending',
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idno`, `username`, `password`, `firstname`, `lastname`, `status`, `type`) VALUES
(2117170, 'cacas', 'cacas', 'francisco', 'cacas', 'pending', 'admin'),
(2117356, 'kenneth', '12345', 'kenneth', 'castro', 'pending', 'admin'),
(2132287, 'evrian', 'webtekis', 'Evrian', 'Diano', 'pending', 'admin'),
(2153143, 'endrei08', 'maypisoako', 'Jaren', 'Nebab', 'pending', NULL),
(2154780, 'sam', 'ginataan', 'Samantha', 'Dacanay', 'pending', 'admin'),
(2158498, 'iyar', 'elvemage88', 'Iyar', 'Benitez', 'pending', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `f1` FOREIGN KEY (`f1`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `f2` FOREIGN KEY (`f2`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `poster_id` FOREIGN KEY (`id`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
