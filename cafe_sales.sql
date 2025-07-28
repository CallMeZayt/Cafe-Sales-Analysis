-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 28, 2025 at 02:02 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe_sales`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_location` ()   BEGIN
SELECT l.name AS location, SUM(t.total_spent) AS total_revenue
FROM transactions t
JOIN locations l ON t.id_location = l.id
GROUP BY l.name
ORDER BY total_revenue DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_monthly_income` (IN `start_date` DATE, IN `end_date` DATE)   BEGIN
  SELECT 
    DATE_FORMAT(t.transaction_date, '%Y-%m') AS month,
    SUM(t.total_spent) AS revenue
  FROM transactions t
  WHERE t.transaction_date BETWEEN start_date AND end_date
  GROUP BY month
  ORDER BY month;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_payment_method` ()   BEGIN
SELECT pm.name AS payment_method, COUNT(*) AS transaction_count, ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM transactions), 2) AS percentage
FROM transactions t
JOIN payment_methods pm ON t.id_payment_method = pm.id
GROUP BY pm.name
ORDER BY transaction_count DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_selling` ()   BEGIN
SELECT i.name AS item, SUM(t.quantity) AS total_quantity_sold, SUM(t.total_spent) AS total_revenue
FROM transactions t
JOIN items i ON t.id_item = i.id
GROUP BY i.name
ORDER BY total_quantity_sold DESC, total_revenue DESC
LIMIT 10;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price_per_unit` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price_per_unit`) VALUES
(1, 'Coffee', 2),
(2, 'Cake', 3),
(3, 'Cookie', 1),
(4, 'Salad', 5),
(5, 'Sandwich', 4),
(6, 'Juice', 3),
(7, 'Smoothie', 4),
(8, 'Tea', 1.5);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`) VALUES
(1, 'Takeaway'),
(2, 'In-Store');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`) VALUES
(1, 'Credit Card'),
(2, 'Cash'),
(3, 'Digital Wallet');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `id_item` int DEFAULT NULL,
  `total_spent` float NOT NULL,
  `id_location` int DEFAULT NULL,
  `id_payment_method` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_date`, `quantity`, `id_item`, `total_spent`, `id_location`, `id_payment_method`) VALUES
('TXN_1080432', '2023-04-29', 2, 4, 10, 2, 1),
('TXN_1150033', '2023-04-18', 5, 6, 15, 2, 2),
('TXN_1928241', '2023-04-30', 3, 1, 6, 2, 2),
('TXN_1961373', '2023-09-08', 2, 1, 4, 1, 1),
('TXN_2080895', '2023-04-19', 1, 2, 3, 2, 3),
('TXN_2181545', '2023-07-14', 4, 6, 12, 1, 1),
('TXN_2548360', '2023-11-07', 5, 4, 25, 1, 2),
('TXN_2621580', '2023-03-22', 2, 8, 3, 2, 2),
('TXN_2847255', '2023-11-15', 3, 4, 15, 2, 1),
('TXN_3068204', '2023-10-03', 1, 3, 1, 1, 1),
('TXN_3085509', '2023-04-15', 4, 1, 8, 2, 3),
('TXN_3160411', '2023-06-11', 2, 1, 4, 2, 3),
('TXN_3407169', '2023-03-11', 2, 5, 8, 2, 2),
('TXN_3522028', '2023-04-04', 5, 7, 20, 2, 2),
('TXN_3567645', '2023-03-30', 4, 7, 16, 1, 1),
('TXN_3709394', '2023-01-15', 4, 6, 12, 1, 2),
('TXN_3748616', '2023-12-09', 2, 1, 4, 2, 1),
('TXN_3808639', '2023-12-15', 2, 6, 6, 1, 3),
('TXN_3829165', '2023-06-15', 4, 6, 12, 2, 2),
('TXN_4271903', '2023-07-19', 4, 3, 4, 2, 1),
('TXN_4358673', '2023-12-28', 5, 3, 5, 1, 3),
('TXN_4368416', '2023-02-24', 2, 4, 10, 1, 1),
('TXN_4685453', '2023-09-14', 4, 8, 6, 2, 2),
('TXN_4726376', '2023-01-31', 2, 2, 6, 2, 1),
('TXN_4885518', '2023-06-10', 3, 4, 15, 2, 1),
('TXN_4977031', '2023-05-16', 4, 2, 12, 2, 2),
('TXN_5072031', '2023-03-23', 2, 2, 6, 1, 2),
('TXN_5132361', '2023-12-01', 3, 5, 12, 1, 3),
('TXN_5183041', '2023-04-20', 5, 3, 5, 2, 1),
('TXN_5220895', '2023-06-10', 5, 4, 25, 2, 2),
('TXN_5266394', '2023-10-28', 3, 2, 9, 2, 2),
('TXN_5522862', '2023-03-19', 2, 3, 2, 1, 1),
('TXN_5695074', '2023-04-10', 4, 6, 12, 1, 1),
('TXN_5916991', '2023-02-06', 2, 6, 6, 1, 3),
('TXN_6258471', '2023-09-23', 5, 1, 10, 2, 3),
('TXN_6289610', '2023-08-07', 3, 6, 9, 1, 2),
('TXN_6380550', '2023-01-05', 5, 1, 10, 2, 2),
('TXN_6420335', '2023-07-16', 1, 1, 2, 1, 2),
('TXN_6421134', '2023-11-03', 4, 5, 16, 1, 2),
('TXN_6769710', '2023-02-24', 2, 6, 6, 2, 2),
('TXN_7619095', '2023-05-03', 2, 5, 8, 2, 2),
('TXN_8078640', '2023-11-03', 4, 6, 12, 2, 3),
('TXN_8614868', '2023-12-05', 5, 7, 20, 1, 3),
('TXN_8700451', '2023-12-12', 5, 8, 7.5, 1, 1),
('TXN_8779771', '2023-07-25', 4, 1, 8, 2, 2),
('TXN_8853997', '2023-10-09', 2, 7, 8, 1, 3),
('TXN_8976658', '2023-08-16', 2, 8, 3, 2, 1),
('TXN_9096052', '2023-12-28', 4, 7, 16, 1, 1),
('TXN_9336980', '2023-06-06', 4, 4, 20, 2, 2),
('TXN_9400181', '2023-06-03', 5, 5, 20, 2, 2),
('TXN_9999113', '2023-05-27', 4, 6, 12, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_location` (`id_location`),
  ADD KEY `id_payment_method` (`id_payment_method`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`id_payment_method`) REFERENCES `payment_methods` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
