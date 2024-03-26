-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 09:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poojablog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(2, 'first post', '123456789', 'first post', '2024-03-20 12:29:41', 'firstpost@gmail.com'),
(3, 'mera', '1234567891', 'dfgtyhuiop werty7u8iol rtyu', NULL, 'pooj@gmail.com'),
(4, 'mera', '1234567891', 'dfgtyhuiop werty7u8iol rtyu', NULL, 'pooj@gmail.com'),
(5, 'mera', '1234567891', 'dfgtyhuiop werty7u8iol rtyu', NULL, 'pooj@gmail.com'),
(6, 'my2nd', '1234567899', 'my 2nd one success', NULL, '2nd@gmail.com'),
(7, 'date', '123456789', 'date time', '2024-03-21 09:42:12', 'date@email.com'),
(8, 'date', '123456789', 'date time', '2024-03-21 09:42:54', 'date@email.com'),
(9, 'nir', '12345', 'nirma', '2024-03-21 14:06:56', 'nir@gmail.com'),
(10, 'sa', '1234', 'sa', '2024-03-21 14:08:25', 'sa@gmail.com'),
(11, 'ece', '3456789', 'eve', '2024-03-21 18:19:01', 'eve'),
(12, 'qie', '123456789', 'qwertyui sdfghjkl sdfghj', '2024-03-22 00:25:27', 'qie@gmail.com'),
(13, '678', '6789', '567890', '2024-03-22 00:35:08', '567890'),
(14, 'sabzi', '1234567891', 'sabzi wala aajao', '2024-03-22 00:37:22', 'sabzi@gmail.com'),
(15, 'poiu', '1234567891', 'asdfghjkl sdfghyjuiko ', '2024-03-22 00:48:02', 'pooj@gmail.com'),
(16, '56789', '234567890', 'ertyuio rtyuiop fghjkl', '2024-03-22 00:50:16', 'pooj@gmail.com'),
(17, 'puma', '123456789', 'qwertyuiop asdfghjk', '2024-03-22 00:56:18', 'puma@gmail.com'),
(18, '12345', '12345', '1234r567', '2024-03-22 01:17:35', '12345t6y'),
(19, '12345', '12345', '12345', '2024-03-22 01:19:03', '1234'),
(20, 'pirk', '234567890', 'succesfully deleted', '2024-03-22 01:34:17', 'pirk@gmail.com'),
(21, 'shiva', '9912345678', 'this is your dady', '2024-03-22 10:36:14', 'shiva@gmail.com'),
(22, 'gir', '123456789', 'gir gur gar gear', '2024-03-23 14:36:09', 'gir@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(50) NOT NULL,
  `title` text NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tag_line`, `slug`, `content`, `date`) VALUES
(1, 'Post  #1', 'Stock-Markets', 'first-post', 'In financial markets, stock is the partial ownership of a company. Shareholders bear the financial (but not legal) risk of the corporation, and receive dividends, which are a piece of the net income.[1]A person or organization which holds shares of stocks is called a shareholder. The value of the stock multiplied by the shares outstanding is the market capitalization. This is the most common metric for valuing a publicly traded company.Stocks can be bought and sold privately or on stock exchanges. Someone who buys and sells stock on the behalf of another individual is called a stockbroker.', '2024-03-26 03:13:45'),
(2, 'Post \n #2', 'Environment post', 'second-post', 'Last year, over 4,10,000 hours were given to our planet by supporters in over 190 countries and territories. This year, join us in making the #BiggestHourForEarth even bigger by spending 60 minutes doing good for the planet while doing something you love!” WWF said in a statement.', '2024-03-23 17:02:04'),
(3, 'post #3 ', 'The new AI disruption tool: Devin\r\n\r\n', 'third-post', 'While explosive growth in artificial intelligence (AI) is augmenting capacities in several sectors, there are also concerns over how it can affect humans. Firms have invested heavily in AI, leaving economists striving to understand the impact on the labour market and driving fears among the wider public for the future of their jobs. The rapid adoption of AI so far is creating and not destroying jobs, especially for the young and highly-skilled, but could reduce wages, research published last yea ..\r\n\r\n', '2024-03-23 18:14:35'),
(4, 'post #4 ', 'Embracing organic farming', 'fourth-post', 'The need to embrace organic farming methods has become more urgent in recent years. According to Statista, the area under organic farming in the country was about 9.12 million hectares in fiscal year 2022. As a realistic solution to concerns about climate change, soil degradation, and food safety, organic farming promotes biodiversity, protects ecosystems, and upholds the health and well-being of both customers and farmers. Since realising the significance of organic farming, the Indian government has aggressively promoted and supported it through a number of projects.', '2024-03-23 18:14:35'),
(5, 'post #5 ', 'Elon Musk\'s Neuralink ', 'fifth-post', 'All About Elon Musk\'s Neuralink And Its First Human Brain Implant\r\nNeuralink is a startup founded by Elon Musk in 2017.\r\n\r\n\r\nElon Musk\'s Neuralink Corp. has performed its first brain implant on a human - a major step toward the billionaire\'s goal of one day enabling people to control computers with their minds. And for the first time Musk has given the implant device a name. ', '2024-03-23 18:14:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
