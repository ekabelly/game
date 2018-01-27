-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2018 at 03:15 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game`
--

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
(1, 1, 'ido', 5, 1, 0),
(2, 1, 'key', 7, 2, 223),
(3, 1, 'jo', 9, 3, 66);

-- --------------------------------------------------------

--
-- Table structure for table `characterstats`
--

CREATE TABLE `characterstats` (
  `character_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characterstats`
--

INSERT INTO `characterstats` (`character_id`, `stat_id`, `value`) VALUES
(1, 2, 10),
(1, 1, 1),
(1, 5, 1),
(2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `character_items`
--

CREATE TABLE `character_items` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `character_items`
--

INSERT INTO `character_items` (`id`, `character_id`, `item_id`, `used`) VALUES
(1, 1, 4, 1),
(2, 1, 2, 1),
(3, 2, 2, 0),
(4, 3, 2, 1),
(5, 3, 1, 1),
(6, 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `picture`) VALUES
(5, 'warrior', 'https://pre00.deviantart.net/5bfd/th/pre/f/2013/074/5/6/warrior_by_kingkostas-d5y35ge.jpg'),
(6, 'archer', '0'),
(7, 'mage', 'https://vignette1.wikia.nocookie.net/elderscrolls/images/1/16/Mage_Robes_Male_1.jpg/revision/latest/scale-to-width-down/2000?cb=20131112230959'),
(8, 'rogue', '0'),
(9, 'monk', 'https://cdn2.bigcommerce.com/n-d57o0b/i9yiyyy/products/3128/images/11118/dark_monk_costume_for_men_UR-29321__52826.1501621440.350.350.jpg?c=2');

-- --------------------------------------------------------

--
-- Table structure for table `classes_skills`
--

CREATE TABLE `classes_skills` (
  `class_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes_skills`
--

INSERT INTO `classes_skills` (`class_id`, `skill_id`) VALUES
(5, 1),
(9, 1);

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
  `id` int(11) NOT NULL,
  `effect_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemeffects`
--

INSERT INTO `itemeffects` (`id`, `effect_id`, `item_id`, `value`) VALUES
(1, 2, 2, 0),
(2, 1, 3, 0),
(3, 2, 3, 0),
(4, 2, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `picture`) VALUES
(1, 'wooden shield', ''),
(2, 'iron sword', ''),
(3, 'fire wand', ''),
(4, 'spikey iron shield of fortitude', '');

-- --------------------------------------------------------

--
-- Table structure for table `item_stats`
--

CREATE TABLE `item_stats` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_stats`
--

INSERT INTO `item_stats` (`id`, `item_id`, `stat_id`, `value`) VALUES
(1, 1, 5, 3),
(2, 4, 2, 5),
(3, 4, 5, 2);

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
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `description`, `picture`) VALUES
(1, 'strike', '', ''),
(2, 'fire arrow', '', ''),
(3, 'fire ball', '', ''),
(4, 'heal other', '', '');

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
(1, 1, 2),
(3, 1, 1);

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
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `pass`, `picture`) VALUES
(1, 'ekabelly@gmail.com', '1234', '');

--
-- Indexes for dumped tables
--

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
  ADD KEY `player_id` (`character_id`),
  ADD KEY `stat_id` (`stat_id`);

--
-- Indexes for table `character_items`
--
ALTER TABLE `character_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `classes_skills`
--
ALTER TABLE `classes_skills`
  ADD KEY `class_id` (`class_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `effects`
--
ALTER TABLE `effects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemeffects`
--
ALTER TABLE `itemeffects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `effect_id` (`effect_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_stats`
--
ALTER TABLE `item_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `stat_id` (`stat_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `character_items`
--
ALTER TABLE `character_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `effects`
--
ALTER TABLE `effects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `itemeffects`
--
ALTER TABLE `itemeffects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `item_stats`
--
ALTER TABLE `item_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `skillseffects`
--
ALTER TABLE `skillseffects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`level`) REFERENCES `levels` (`id`);

--
-- Constraints for table `characterstats`
--
ALTER TABLE `characterstats`
  ADD CONSTRAINT `characterstats_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `characterstats_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`);

--
-- Constraints for table `character_items`
--
ALTER TABLE `character_items`
  ADD CONSTRAINT `character_items_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  ADD CONSTRAINT `character_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `classes_skills`
--
ALTER TABLE `classes_skills`
  ADD CONSTRAINT `classes_skills_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `classes_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`);

--
-- Constraints for table `itemeffects`
--
ALTER TABLE `itemeffects`
  ADD CONSTRAINT `itemeffects_ibfk_1` FOREIGN KEY (`effect_id`) REFERENCES `effects` (`id`),
  ADD CONSTRAINT `itemeffects_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `item_stats`
--
ALTER TABLE `item_stats`
  ADD CONSTRAINT `item_stats_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_stats_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`);

--
-- Constraints for table `skillseffects`
--
ALTER TABLE `skillseffects`
  ADD CONSTRAINT `skillseffects_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`),
  ADD CONSTRAINT `skillseffects_ibfk_2` FOREIGN KEY (`effect_id`) REFERENCES `effects` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
