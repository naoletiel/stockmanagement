-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2022 at 07:13 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stockdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `email`) VALUES
(2, 'yotod', '776776', 'yotod776@gmail.com'),
(8, '[value-2]', 'password', 'abebe'),
(9, '[value-2]', 'password', 'abebe'),
(10, '[value-2]', 'password', 'abebe'),
(11, '[value-2]', 'password', 'abebe'),
(12, '[value-2]', 'password', 'abebe'),
(13, '[value-2]', 'password', 'abebe'),
(14, '[value-2]', 'password', 'abebe'),
(15, '[value-2]', 'password', 'abebe'),
(16, '[value-2]', 'password', 'abebe'),
(17, '[value-2]', 'password', 'abebe'),
(18, '[value-2]', 'password', 'abebe'),
(19, '[value-2]', 'password', 'abebe');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(1000) NOT NULL,
  `catagory` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiered_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` int(11) NOT NULL,
  `store_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `catagory`, `quantity`, `expiered_date`, `price`, `store_id`) VALUES
(42, 'pen', 'school material', 50, '0000-00-00 00:00:00', 400, '2'),
(43, 'pencil', 'school material', 50, '0000-00-00 00:00:00', 400, '2'),
(44, 'book', 'school material', 50, '0000-00-00 00:00:00', 400, '1'),
(46, 'biscuit', 'food', 100, '0000-00-00 00:00:00', 500, '2'),
(51, 't-shirt', 'cloth', 50, '2022-07-28 21:00:00', 500, '2'),
(52, 'candy', 'food', 4, '2023-01-13 22:00:00', 50, '2'),
(53, 'candy', 'food', 49, '2023-01-13 22:00:00', 50, '1'),
(54, 'candy', 'food', 49, '2024-06-10 21:00:00', 500, '1');

-- --------------------------------------------------------

--
-- Table structure for table `selled_items`
--

CREATE TABLE `selled_items` (
  `id` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `selling_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `selled_quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `selled_items`
--

INSERT INTO `selled_items` (`id`, `selling_price`, `selling_date`, `selled_quantity`, `product_id`) VALUES
(1, 9000, '2023-07-28 06:48:13', 3, 3),
(2, 0, '0000-00-00 00:00:00', 1, 25),
(3, 0, '0000-00-00 00:00:00', 1, 10),
(4, 0, '0000-00-00 00:00:00', 1, 10),
(5, 0, '0000-00-00 00:00:00', 1, 10),
(6, 0, '2022-07-10 21:00:00', 1, 25),
(7, 0, '2022-07-10 21:00:00', 46, 52),
(8, 0, '2022-07-10 21:00:00', 1, 54),
(9, 0, '2022-07-20 21:00:00', 1, 53);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `store_name`, `address`) VALUES
(3, 'store 1', 'adiss'),
(4, 'store 2', 'adama');

-- --------------------------------------------------------

--
-- Table structure for table `transferd_items`
--

CREATE TABLE `transferd_items` (
  `id` int(11) NOT NULL,
  `tdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transferd_items`
--

INSERT INTO `transferd_items` (`id`, `tdate`, `from`, `to`, `product_id`) VALUES
(1, '2022-07-01 13:11:15', '1', '2', '2'),
(2, '2022-07-01 13:13:02', '2', '2', '100'),
(3, '2022-07-01 13:13:23', '2', '2', '100'),
(4, '2022-07-01 13:14:04', '1', '2', '1'),
(5, '0000-00-00 00:00:00', '2', '1', '40'),
(6, '0000-00-00 00:00:00', '[value-3]', '[value-4]', '[value-5]'),
(7, '0000-00-00 00:00:00', '[value-3]', '[value-4]', '[value-5]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selled_items`
--
ALTER TABLE `selled_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transferd_items`
--
ALTER TABLE `transferd_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `selled_items`
--
ALTER TABLE `selled_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transferd_items`
--
ALTER TABLE `transferd_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
