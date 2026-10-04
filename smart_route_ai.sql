-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2026 at 11:42 PM
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
-- Database: `smart_route_ai`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangays`
--

CREATE TABLE `barangays` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `population` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangays`
--

INSERT INTO `barangays` (`id`, `name`, `zone`, `population`) VALUES
(1, 'Bacayao Norte', 'North', 0),
(2, 'Bacayao Sur', 'North', 0),
(3, 'Barangay I (T. Bugallon)', 'Poblacion', 0),
(4, 'Barangay II (Nueva)', 'Poblacion', 0),
(5, 'Barangay III (Tambacan)', 'Poblacion', 0),
(6, 'Barangay IV (Zamora)', 'Poblacion', 0),
(7, 'Bonuan Binloc', 'East', 0),
(8, 'Bonuan Boquig', 'East', 0),
(9, 'Bonuan Gueset', 'East', 0),
(10, 'Calmay', 'West', 0),
(11, 'Carael', 'West', 0),
(12, 'Caranglaan', 'Central', 0),
(13, 'Herrero', 'Central', 0),
(14, 'Lasip Chico', 'Central', 0),
(15, 'Lasip Grande', 'Central', 0),
(16, 'Lomboy', 'Central', 0),
(17, 'Lucao', 'Central', 0),
(18, 'Malued', 'North', 0),
(19, 'Mamalingling', 'North', 0),
(20, 'Mangin', 'West', 0),
(21, 'Mayombo', 'Central', 0),
(22, 'Pantal', 'North', 0),
(23, 'Poblacion Oeste', 'Poblacion', 0),
(24, 'Pogo Chico', 'North', 0),
(25, 'Pogo Grande', 'North', 0),
(26, 'Pugaro Suit', 'East', 0),
(27, 'Salapingao', 'West', 0),
(28, 'Salisay', 'Central', 0),
(29, 'Tapuac', 'Central', 0),
(30, 'Tebeng', 'Central', 0),
(31, 'Tambac', 'West', 0);

-- --------------------------------------------------------

--
-- Table structure for table `flood_zones`
--

CREATE TABLE `flood_zones` (
  `id` int(11) NOT NULL,
  `location_name` varchar(150) NOT NULL,
  `barangay_id` int(11) DEFAULT NULL,
  `severity` enum('low','medium','high') DEFAULT 'medium',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flood_zones`
--

INSERT INTO `flood_zones` (`id`, `location_name`, `barangay_id`, `severity`, `notes`, `created_at`) VALUES
(1, 'Downtown to Lucao corridor', 17, 'high', 'Frequent flooding during monsoon', '2026-10-02 18:07:21'),
(2, 'Tondaligan Baywalk area', 7, 'medium', 'Coastal flooding', '2026-10-02 18:07:21'),
(3, 'Mayombo-Caranglaan', 21, 'high', 'Low-lying area near river', '2026-10-02 18:07:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_number` varchar(50) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `status` enum('pending','in_transit','delivered','failed') DEFAULT 'pending',
  `assigned_rider_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `route_name` varchar(100) NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `rider_id` int(11) DEFAULT NULL,
  `route_date` date NOT NULL,
  `total_orders` int(11) DEFAULT 0,
  `total_distance` decimal(10,2) DEFAULT 0.00,
  `status` enum('planned','in_progress','completed') DEFAULT 'planned',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','rider') NOT NULL DEFAULT 'rider',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@smartroute.com', '$2y$10$Zg95H42rinfllAgeqm3POu/VXOE31ptl2Hnu7.yTPfVVsesALAyRm', 'admin', '2026-10-01 23:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `plate_number` varchar(20) NOT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` enum('available','in_use','maintenance') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `plate_number`, `vehicle_type`, `capacity`, `status`) VALUES
(1, 'ABC-1234', 'Van', 50, 'available'),
(2, 'XYZ-5678', 'Truck', 100, 'available'),
(3, 'DEF-9012', 'Motorcycle', 10, 'available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangays`
--
ALTER TABLE `barangays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `flood_zones`
--
ALTER TABLE `flood_zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barangay_id` (`barangay_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_number` (`tracking_number`),
  ADD KEY `assigned_rider_id` (`assigned_rider_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `rider_id` (`rider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate_number` (`plate_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangays`
--
ALTER TABLE `barangays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `flood_zones`
--
ALTER TABLE `flood_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flood_zones`
--
ALTER TABLE `flood_zones`
  ADD CONSTRAINT `flood_zones_ibfk_1` FOREIGN KEY (`barangay_id`) REFERENCES `barangays` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`assigned_rider_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
