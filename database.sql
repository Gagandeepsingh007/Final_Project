-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 01:09 AM
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
-- Database: `rkg_computers`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `order_date`, `status`) VALUES
(1, 2, 1300.00, '2025-12-02 04:43:33', 'processing'),
(2, 2, 1300.00, '2025-12-02 23:57:51', 'pending'),
(3, 2, 3950.00, '2025-12-03 00:01:02', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 3, 1, 1300.00),
(2, 2, 3, 1, 1300.00),
(3, 3, 3, 3, 1300.00),
(4, 3, 13, 1, 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `image_url` text DEFAULT NULL,
  `category` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image_url`, `category`, `stock`, `created_at`) VALUES
(1, 'MacBook Pro M4 Max 14\"', 'Apple M4 Max Chip 14-Core CPU, 32-Core GPU, 36GB Unified Memory, 1TB SSD Storage - Space Black', 4000, 'https://www.notebookcheck.nl/fileadmin/Notebooks/Apple/MacBook_Pro_14_2024_M4/IMG_7747.JPG', 'laptops', 3, '2025-12-02 03:22:11'),
(2, 'iPhone 16 Pro 256GB', 'Apple A18 Pro Chip, 6.3-inch Display, Titanium Build, 256GB Storage - Natural Titanium', 1200, 'https://th.bing.com/th/id/OIP.2uFsTZ7lfQvBTYQfmTx82wHaEK?w=304&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'phones', 10, '2025-12-02 04:20:29'),
(3, 'Samsung Galaxy S24 Ultra', 'Snapdragon 8 Gen 3, 6.8-inch AMOLED, 12GB RAM, 256GB Storage - Titanium Gray', 1300, 'https://tse4.mm.bing.net/th/id/OIP.hQVUtnziJeAuUtTx-BKDHQHaFj?rs=1&pid=ImgDetMain&o=7&rm=3', 'phones', 3, '2025-12-02 04:20:29'),
(4, 'Dell XPS 15', 'Intel Core i9-14900H, RTX 4070, 32GB RAM, 1TB SSD, 15.6-inch OLED Display', 2500, 'https://th.bing.com/th/id/OIP.gJU7K0cumScePGJ8ynPbngHaEL?w=312&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'laptops', 5, '2025-12-02 04:20:29'),
(5, 'iPad Pro 13-inch M4', 'Apple M4 Chip, 256GB Storage, Ultra Retina XDR Display - Silver', 1300, 'https://th.bing.com/th/id/OIP.1DG4Vx2yd-94Yexyp57sgAHaEK?w=321&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'tablets', 12, '2025-12-02 04:20:29'),
(6, 'Apple Magic Keyboard', 'Wireless Magic Keyboard with Touch ID for Mac computers', 150, 'https://th.bing.com/th/id/OIP.6fiOiMAym1GFugMjOgcslAHaD4?w=317&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'accessories', 20, '2025-12-02 04:20:29'),
(7, 'Sony WH-1000XM5', 'Wireless Noise-Canceling Over-Ear Headphones - Black', 350, 'https://th.bing.com/th/id/OIP.RA0C4sj6UGzMhbPcMn1Z4wHaE8?w=296&h=197&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'headphones', 15, '2025-12-02 04:20:29'),
(8, 'Samsung 27-Inch Curved Monitor', '1080p FHD, 75Hz Refresh Rate, Ultra-Slim Design', 170, 'https://th.bing.com/th/id/OIP.dKAmJAhz_tKiSw379Cy56wHaFj?w=266&h=200&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'monitors', 18, '2025-12-02 04:20:29'),
(9, 'Logitech MX Master 3S', 'Advanced Wireless Mouse with Quiet Clicks, USB-C Fast Charging', 100, 'https://th.bing.com/th/id/OIP.FX71Oykj6Hy3pW9nhYBdSQHaE7?w=240&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'accessories', 25, '2025-12-02 04:20:29'),
(10, 'Apple Watch Series 10 GPS 45mm', 'Fitness & Health Tracker with Always-On Display', 500, 'https://th.bing.com/th/id/OIP.OQlbAfgfSH6PmMTn6ADlygHaHa?w=178&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'wearables', 10, '2025-12-02 04:20:29'),
(11, 'Lenovo Legion 7', 'AMD Ryzen 9 7945HX, RTX 4080, 32GB RAM, 1TB SSD, 16-inch QHD+ Display', 2900, 'https://th.bing.com/th/id/OIP.lGkgY-HEPfpPPCI2InohVwHaFk?w=219&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'laptops', 4, '2025-12-02 04:20:29'),
(12, 'AirPods Pro 2', 'Active Noise Cancellation, USB-C Charging Case', 250, 'https://th.bing.com/th/id/OIP.hgyIiIr5-muzN3IqRUE2wgHaFP?w=229&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'headphones', 30, '2025-12-02 04:20:29'),
(13, 'Anker PowerCore 20000mAh', 'High-Capacity Portable Charger with USB-C', 50, 'https://th.bing.com/th/id/OIP.3j0aDrlEYlxf36yXpzDtKwHaHa?w=170&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'accessories', 39, '2025-12-02 04:20:29'),
(14, 'Razer BlackWidow V4', 'Mechanical Gaming Keyboard with RGB Lighting', 180, 'https://th.bing.com/th/id/OIP.dupVgsFhhBfZ0WJn2EigvQHaCs?w=280&h=127&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'keyboards', 14, '2025-12-02 04:20:29'),
(15, 'Google Pixel 9 Pro', 'Google Tensor G4, LTPO OLED, 256GB Storage - Obsidian', 1100, 'https://th.bing.com/th/id/OIP.ELfYSFAOZXkuZg1z4VsU7wHaHa?w=224&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'phones', 9, '2025-12-02 04:20:29'),
(16, 'ASUS ROG Strix G18', 'Intel i9-14900HX, RTX 4090, 32GB RAM, 2TB SSD, 240Hz Display', 3500, 'https://th.bing.com/th/id/OIP.uSmhxN-mS9TVbBWGcTut6gHaFc?w=196&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'laptops', 3, '2025-12-02 04:20:29'),
(17, 'Samsung Galaxy Tab S9 WiFi', '11-inch Dynamic AMOLED, 256GB Storage - Beige', 800, 'https://th.bing.com/th/id/OIP.GUVSH0OLKOOXhnkaQWJ_CgHaFN?w=244&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'tablets', 11, '2025-12-02 04:20:29'),
(18, 'JBL Charge 5', 'Waterproof Portable Bluetooth Speaker with Deep Bass', 130, 'https://th.bing.com/th/id/OIP.mwRXGl0NrssXu-bH6HQWcgHaHa?w=189&h=187&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'audio', 22, '2025-12-02 04:20:29'),
(19, 'Apple USB-C to HDMI Adapter', 'Connect USB-C devices to HDMI displays', 70, 'https://th.bing.com/th/id/OIP.ocHH6kg-Ih48J9DX2s-nNQHaGv?w=194&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'accessories', 35, '2025-12-02 04:20:29'),
(20, 'HyperX Cloud II', '7.1 Surround Sound Gaming Headset with Memory Foam Ear Pads', 100, 'https://th.bing.com/th/id/OIP.2cGTJosx12DWLL7rvwDfDwHaHa?w=191&h=191&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'headphones', 17, '2025-12-02 04:20:29'),
(21, 'MSI Optix 34-Inch Ultrawide', 'UWQHD Resolution, 144Hz Curved Gaming Monitor', 500, 'https://th.bing.com/th/id/OIP.6ndAQLfLMvoPJIBXPwyiYgHaHa?w=174&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', 'monitors', 100, '2025-12-02 04:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `title` varchar(200) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `title`, `comment`, `created_at`) VALUES
(23, 1, 2, 5, 'Fantastic Laptop', 'Extremely fast and handles heavy workloads with ease.', '2025-12-02 05:42:45'),
(25, 1, 4, 5, 'Worth Every Dollar', 'Perfect for productivity and creative work.', '2025-12-02 05:42:45'),
(26, 2, 2, 4, 'Solid Phone', 'Smooth performance and great camera quality.', '2025-12-02 05:42:45'),
(27, 2, 4, 5, 'Amazing Device', 'Fast, lightweight, and very premium feeling.', '2025-12-02 05:42:45'),
(28, 3, 2, 5, 'Top Tier Phone', 'Display is bright and the zoom camera is outstanding.', '2025-12-02 05:42:45'),
(31, 4, 4, 4, 'Good Choice', 'Amazing screen quality and very responsive.', '2025-12-02 05:42:45'),
(32, 5, 2, 5, 'Super Fast Tablet', 'The screen is beautiful and everything feels instant.', '2025-12-02 05:42:45'),
(33, 5, 4, 4, 'Very Smooth', 'Perfect for media and productivity. A bit pricey, though.', '2025-12-02 05:42:45'),
(35, 6, 2, 5, 'Great Accessory', 'Perfect companion for my Mac setup.', '2025-12-02 05:42:45'),
(36, 7, 4, 5, 'Excellent Sound', 'Noise canceling is impressive and very comfortable.', '2025-12-02 05:42:45'),
(37, 7, 2, 4, 'Great Headphones', 'Sound is clear and battery lasts long.', '2025-12-02 05:42:45'),
(39, 8, 4, 5, 'Perfect for Work', 'Very easy on the eyes and great for multitasking.', '2025-12-02 05:42:45'),
(40, 9, 2, 5, 'Amazing Mouse', 'Super comfortable with great battery life.', '2025-12-02 05:42:45'),
(42, 10, 2, 5, 'Very Useful Watch', 'Tracks everything accurately and looks sleek.', '2025-12-02 05:42:45'),
(43, 10, 4, 4, 'Great Features', 'Battery is okay, but overall excellent smartwatch.', '2025-12-02 05:42:45'),
(45, 11, 4, 4, 'Premium Build', 'Fast, beautiful screen, and excellent keyboard.', '2025-12-02 05:42:45'),
(47, 12, 2, 5, 'Perfect for Daily Use', 'Noise cancellation works great for commuting.', '2025-12-02 05:42:45'),
(48, 13, 4, 5, 'Great Power Bank', 'Charges fast and lasts a long time.', '2025-12-02 05:42:45'),
(50, 14, 2, 5, 'Fantastic Keyboard', 'Typing feels great and RGB effects look amazing.', '2025-12-02 05:42:45'),
(51, 14, 4, 4, 'Responsive Keys', 'Excellent for gaming sessions.', '2025-12-02 05:42:45'),
(52, 15, 2, 5, 'Excellent Flagship', 'Very smooth and clean Android experience.', '2025-12-02 05:42:45'),
(54, 16, 4, 5, 'Extreme Performance', 'Runs everything maxed out with no trouble.', '2025-12-02 05:42:45'),
(55, 16, 2, 5, 'Beast Machine', 'Perfect for gaming and heavy workloads.', '2025-12-02 05:42:45'),
(57, 17, 4, 5, 'Very Portable', 'Great for reading and watching videos.', '2025-12-02 05:42:45'),
(58, 18, 2, 5, 'Amazing Speaker', 'Loud, clear, and perfect for outdoor use.', '2025-12-02 05:42:45'),
(60, 19, 4, 4, 'Useful Adapter', 'Works perfectly and feels durable.', '2025-12-02 05:42:45'),
(61, 19, 2, 5, 'Great Quality', 'Plug and play with no issues at all.', '2025-12-02 05:42:45'),
(63, 20, 2, 4, 'Solid Build', 'Mic quality is good and audio is clear.', '2025-12-02 05:42:45'),
(64, 21, 4, 5, 'Excellent Ultrawide', 'Huge workspace and very sharp image.', '2025-12-02 05:42:45'),
(66, 3, 5, 5, 'Excellent flagship phone', 'Super smooth performance and the camera is outstanding.', '2025-12-02 23:55:27'),
(67, 6, 5, 4, 'Nice typing feel', 'Very comfortable to type on and Touch ID works perfectly.', '2025-12-02 23:55:27'),
(68, 9, 5, 5, 'Perfect productivity mouse', 'Accurate, quiet, and the battery lasts forever.', '2025-12-02 23:55:27'),
(69, 12, 5, 4, 'Solid noise cancellation', 'Great sound quality and fits well in the ears.', '2025-12-02 23:55:27'),
(70, 14, 5, 4, 'Great gaming keyboard', 'Responsive keys and bright RGB lighting.', '2025-12-02 23:55:27'),
(71, 17, 5, 5, 'Amazing display quality', 'The AMOLED screen is bright and sharp. Perfect for media.', '2025-12-02 23:55:27'),
(72, 19, 5, 4, 'Works without issues', 'Simple, reliable adapter that does exactly what it should.', '2025-12-02 23:55:27'),
(73, 1, 5, 5, 'Super powerful laptop', 'Runs heavy apps smoothly and has excellent build quality.', '2025-12-02 23:55:27'),
(74, 7, 5, 5, 'Best noise-canceling headphones', 'Fantastic comfort and impressive sound performance.', '2025-12-02 23:55:27'),
(75, 15, 5, 5, 'Fast and reliable phone', 'Battery is strong and the camera performs great in low light.', '2025-12-02 23:55:27'),
(76, 21, 5, 4, 'Immersive ultrawide monitor', 'Great refresh rate and color accuracy for multitasking.', '2025-12-02 23:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_admin`, `created_at`) VALUES
(1, 'Admin User', 'admin@rkgcomputers.ca', '$2y$10$stY1sbIIt0jXXFfr4qZSqu1EgZZNbPNdNfLGEnm2o/KUI1.mtph2O', 1, '2025-12-02 03:30:55'),
(2, 'Gagandeep Singh', 'gsingh@yahoo.ca', '$2y$10$71y5wcfybEl76KhgBXcIDubzJQ4cEcRAjH3LCl7FT2NyxmG2Xql7G', 0, '2025-12-02 04:39:42'),
(4, 'Kavya', 'K@hotmail.com', '$2y$10$tBjabHb7ySQWuU6kmzJ6wulv5/g6lVKgpeEK4206iJ0Yru2xMZpoW', 0, '2025-12-02 05:40:15'),
(5, 'Rahul Malik', 'RMalik@gamil.com', '$2y$10$3w.SV/3BdmR.bxoWzTK7m.zFJwJZSdmk8wUqV/TLLdEuY/cdTY8Zm', 0, '2025-12-02 23:52:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_product_review` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
