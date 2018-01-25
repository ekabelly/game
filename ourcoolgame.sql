-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2018 at 08:55 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ourcoolgame`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`) VALUES
(5, 'warrior'),
(6, 'archer'),
(7, 'mage'),
(8, 'rogue'),
(9, 'monk');

-- --------------------------------------------------------

--
-- Table structure for table `effects`
--

CREATE TABLE `effects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `effects`
--

INSERT INTO `effects` (`id`, `name`) VALUES
(1, 'dot'),
(2, 'damage'),
(3, 'heal'),
(4, 'hot');

-- --------------------------------------------------------

--
-- Table structure for table `itemeffects`
--

CREATE TABLE `itemeffects` (
  `effect_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemeffects`
--

INSERT INTO `itemeffects` (`effect_id`, `item_id`, `value`) VALUES
(2, 2, 0),
(1, 3, 0),
(2, 3, 0),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`) VALUES
(1, 'wooden shield'),
(2, 'iron sword'),
(3, 'fire wand'),
(4, 'spikey iron shield of fortitude');

-- --------------------------------------------------------

--
-- Table structure for table `itemstats`
--

CREATE TABLE `itemstats` (
  `item_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemstats`
--

INSERT INTO `itemstats` (`item_id`, `stat_id`, `value`) VALUES
(1, 5, 3),
(4, 2, 5),
(4, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `reqxp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `reqxp`) VALUES
(1, 100),
(2, 300),
(3, 800),
(4, 1200);

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `xp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `user`, `name`, `class`, `level`, `xp`) VALUES
(1, 1, 'ido', 5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `characterstats`
--

CREATE TABLE `characterstats` (
  `player_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characterstats`
--

INSERT INTO `characterstats` (`player_id`, `stat_id`, `value`) VALUES
(1, 2, 10),
(1, 1, 1),
(1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`) VALUES
(1, 'strike'),
(2, 'fire arrow'),
(3, 'fire ball'),
(4, 'heal other');

-- --------------------------------------------------------

--
-- Table structure for table `skillseffects`
--

CREATE TABLE `skillseffects` (
  `id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `effect_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skillseffects`
--

INSERT INTO `skillseffects` (`id`, `skill_id`, `effect_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`id`, `name`) VALUES
(1, 'attack'),
(2, 'hp'),
(3, 'mana'),
(4, 'stamina'),
(5, 'defense');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `pass`, `picture`) VALUES
(1, 'ido', 'kab', 'ekabelly@gmail.com', '1234', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `effects`
--
ALTER TABLE `effects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemeffects`
--
ALTER TABLE `itemeffects`
  ADD KEY `effect_id` (`effect_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemstats`
--
ALTER TABLE `itemstats`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `stat_id` (`stat_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `class` (`class`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `characterstats`
--
ALTER TABLE `characterstats`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `stat_id` (`stat_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skillseffects`
--
ALTER TABLE `skillseffects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skill_id` (`skill_id`),
  ADD KEY `effect_id` (`effect_id`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `effects`
--
ALTER TABLE `effects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `skillseffects`
--
ALTER TABLE `skillseffects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `itemeffects`
--
ALTER TABLE `itemeffects`
  ADD CONSTRAINT `itemeffects_ibfk_1` FOREIGN KEY (`effect_id`) REFERENCES `effects` (`id`),
  ADD CONSTRAINT `itemeffects_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `itemstats`
--
ALTER TABLE `itemstats`
  ADD CONSTRAINT `itemstats_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `itemstats_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`);

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`level`) REFERENCES `levels` (`id`);

--
-- Constraints for table `characterstats`
--
ALTER TABLE `characterstats`
  ADD CONSTRAINT `characterstats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `characterstats_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`);

--
-- Constraints for table `skillseffects`
--
ALTER TABLE `skillseffects`
  ADD CONSTRAINT `skillseffects_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`),
  ADD CONSTRAINT `skillseffects_ibfk_2` FOREIGN KEY (`effect_id`) REFERENCES `effects` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
