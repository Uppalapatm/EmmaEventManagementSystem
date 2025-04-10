-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2025 at 01:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emma_event_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `date`, `location`, `description`, `type`) VALUES
(1, 'Tech Innovation Conference', '2025-04-10', 'London', 'A conference on emerging tech trends.', 'Conference'),
(2, 'AI & ML Workshop', '2025-05-15', 'Manchester', 'Hands-on workshop on AI & ML applications.', 'Conference'),
(3, 'John & Emily Wedding', '2025-06-20', 'Birmingham', 'Wedding ceremony for John & Emily.', 'Wedding'),
(4, 'Annual Business Conference', '2025-07-12', 'Edinburgh', 'Discussing business growth strategies.', 'Conference'),
(5, 'Startup Pitch Party', '2025-08-05', 'London', 'Networking event for startup founders.', 'Party'),
(6, 'Cybersecurity Workshop', '2025-09-25', 'Manchester', 'Workshop on latest cybersecurity threats.', 'Workshop'),
(7, 'Michael & Sarah Wedding', '2025-10-18', 'Birmingham', 'Wedding celebration for Michael & Sarah.', 'Wedding'),
(14, 'The Masons\' wedding', '2025-03-28', 'Sydney Station Hall', 'Glorious wedding gala of the Masons\'', 'Wedding');

-- --------------------------------------------------------

--
-- Table structure for table `event_rsvp`
--

CREATE TABLE `event_rsvp` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `status` enum('Attending','Not Attending') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_rsvp`
--

INSERT INTO `event_rsvp` (`id`, `event_id`, `user_name`, `status`) VALUES
(1, 1, 'Kelly Johnson', 'Attending'),
(2, 1, 'John Smith', 'Not Attending'),
(3, 1, 'Bobby Brown', 'Attending'),
(4, 2, 'Roy Wilson', 'Attending'),
(5, 2, 'Emy Adams', 'Not Attending'),
(6, 3, 'Frank Taylor', 'Attending'),
(7, 3, 'Grace Lee', 'Attending'),
(8, 4, 'Hannah White', 'Not Attending'),
(9, 4, 'Ian Thompson', 'Attending'),
(10, 5, 'Jack Martinez', 'Attending'),
(11, 5, 'Karen Davis', 'Not Attending'),
(12, 6, 'Leo Anderson', 'Attending'),
(13, 6, 'Mia Hernandez', 'Attending'),
(14, 7, 'Noah Scott', 'Not Attending'),
(15, 7, 'Kluivert Lewis', 'Attending'),
(16, 14, 'Roy', 'Attending'),
(17, 14, 'Kelly', 'Attending'),
(18, 14, 'Jason', 'Not Attending'),
(19, 14, 'Billy', 'Attending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_rsvp`
--
ALTER TABLE `event_rsvp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rsvps_ibfk_1` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `event_rsvp`
--
ALTER TABLE `event_rsvp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_rsvp`
--
ALTER TABLE `event_rsvp`
  ADD CONSTRAINT `event_rsvp_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
