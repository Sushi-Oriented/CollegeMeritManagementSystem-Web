-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2021 at 05:00 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `merit`
--

CREATE TABLE `merit` (
  `name` varchar(225) NOT NULL,
  `pk` int(11) NOT NULL,
  `progid` int(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `matricNum` varchar(255) NOT NULL,
  `IcNum` bigint(255) NOT NULL,
  `merit` int(17) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `progavailable`
--

CREATE TABLE `progavailable` (
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `progavailable`
--

INSERT INTO `progavailable` (`status`) VALUES
('Enable');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `firstemail` varchar(255) NOT NULL,
  `progId` int(13) NOT NULL,
  `progName` varchar(255) NOT NULL,
  `progLocation` varchar(255) NOT NULL,
  `progStartDate` date NOT NULL,
  `progEndDate` date NOT NULL,
  `progOrganizer` varchar(255) NOT NULL,
  `progCategory` varchar(255) NOT NULL,
  `progDescription` varchar(255) NOT NULL,
  `progStatus` varchar(255) NOT NULL,
  `dateSubmit` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `fullname` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `firstemail` varchar(50) NOT NULL,
  `staffID` varchar(50) NOT NULL,
  `staffphoneno` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`fullname`, `nickname`, `firstemail`, `staffID`, `staffphoneno`, `password`) VALUES
('Faizul Azli', 'Faizul AA', 'faizul.kl@utm.my', 'F001', '012-3456789', 'faizulazli');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fullname` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `firstemail` varchar(50) NOT NULL,
  `studentID` varchar(50) NOT NULL,
  `studphoneno` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`fullname`, `nickname`, `firstemail`, `studentID`, `studphoneno`, `password`) VALUES
('Alifah Ilyana', 'Alifah', 'ailyana2@graduate.utm.my', 'B19EC0003', '017-2722334', 'abc123abc'),
('Harris Fadhillah', 'Harris F', 'harris@gmail.com', 'H001', '017-272233', 'abc123abc'),
('Puteri Ledang', 'Ledang', 'iklilkrozz@gmail.com', 'B19EC0042', '0123995729', 'ledang1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `merit`
--
ALTER TABLE `merit`
  ADD PRIMARY KEY (`pk`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`progId`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`firstemail`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`firstemail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `merit`
--
ALTER TABLE `merit`
  MODIFY `pk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `progId` int(13) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
