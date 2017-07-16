-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2017 at 09:46 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `socialnetwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

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

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `poster_id` int(11) NOT NULL,
  `visibility` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `post_info` varchar(140) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `poster_id`, `visibility`, `date`, `post_info`) VALUES
(1, 2117356, 'public', '2017-07-16', 'hgfhkjnkhbgcvfh'),
(2, 2117356, 'public', '2017-07-16', 'testing'),
(3, 2117356, 'public', '2017-07-16', 'scsdcs'),
(4, 2117356, 'public', '2017-07-16', 'ouch'),
(5, 2132287, 'public', '2017-07-16', 'wasaaaaaap!'),
(6, 1234567, 'public', '2017-07-16', 'ako si cacas! pogi ako!'),
(7, 765421, 'public', '2017-07-16', 'check test'),
(8, 765421, 'public', '2017-07-17', 'blablablablalbalbalbla'),
(9, 1231231, 'public', '2017-07-17', 'test'),
(10, 765421, 'public', '2017-07-17', '');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `reqID` int(11) NOT NULL AUTO_INCREMENT,
  `fromID` varchar(11) NOT NULL,
  `toID` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`reqID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`reqID`, `fromID`, `toID`, `date`, `status`) VALUES
(1, '1234567', '765421', '2017-07-17', 'pending'),
(2, '765421', '1234567', '2017-07-17', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE IF NOT EXISTS `upload` (
  `uploadID` int(11) NOT NULL AUTO_INCREMENT,
  `uploader` int(11) NOT NULL,
  `file` blob NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`uploadID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `idno` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` char(45) DEFAULT NULL,
  `lastname` char(20) DEFAULT NULL,
  `status` enum('pending','approved') NOT NULL DEFAULT 'pending',
  `type` enum('user') NOT NULL,
  PRIMARY KEY (`idno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idno`, `username`, `password`, `firstname`, `lastname`, `status`, `type`) VALUES
(765421, 'sam', '123123', 'Samie', 'Dacanay', 'approved', 'user'),
(1231231, 'uwak', '123123', 'uwak', 'uwak', 'approved', 'user'),
(1234567, 'cacas', 'cacas', 'francisco', 'cacas', 'approved', 'user'),
(2117356, 'kenneth', '12345', 'kenneth', 'castro', 'approved', ''),
(2132287, 'evrian', 'webtekis', 'Evrian', 'Diano', 'approved', 'user');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `f1` FOREIGN KEY (`f1`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `f2` FOREIGN KEY (`f2`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
