-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2021 at 02:10 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bidding_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `bid_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=bid,2=confirmed,3=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `status`, `date_created`) VALUES
(2, 5, 1, 7500, 1, '2021-05-07 14:18:50'),
(4, 5, 3, 155000, 1, '2021-05-07 16:37:29'),
(5, 6, 4, 600, 1, '2021-05-15 14:49:43'),
(6, 7, 4, 1e15, 1, '2021-05-15 14:53:35'),
(7, 8, 4, 5e18, 1, '2021-05-15 14:55:40'),
(8, 1, 23, 1000, 1, '2021-05-24 14:12:26'),
(9, 6, 22, 300, 1, '2021-05-24 14:20:03'),
(10, 1, 22, 500, 1, '2021-05-24 14:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Oil Painting'),
(2, 'Sketch'),
(3, 'Drawing');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `start_bid` float NOT NULL,
  `regular_price` float NOT NULL,
  `bid_end_datetime` datetime NOT NULL,
  `img_fname` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `start_bid`, `regular_price`, `bid_end_datetime`, `img_fname`, `date_created`) VALUES
(5, 1, 'the church', 'oil painting on canvas', 500, 1000, '2021-05-22 11:00:00', '5.jpeg', '2021-05-22 10:12:20'),
(6, 1, 'Sunrise', 'amazing, relaxing scene', 100, 500, '2021-05-16 20:00:00', '6.jpeg', '2021-05-23 21:10:26'),
(7, 3, 'Simple House', 'simple yet beautiful house', 100, 300, '2021-05-15 18:00:00', '7.jpeg', '2021-05-23 21:14:29'),
(8, 2, 'Zayn Malik', 'artist, singer', 500, 1000, '2021-05-15 18:00:00', '8.jpeg', '2021-05-23 21:19:52'),
(9, 2, 'The Eiffel Tower', 'the design was inspired by the bridge, famous symbol of Paris', 150, 700, '2021-05-15 18:00:00', '9.jpeg', '2021-05-23 21:28:28'),
(10, 1, 'Iron Man', 'superhero in the comic books', 100, 1000, '2021-05-15 18:00:00', '10.jpeg', '2021-05-23 21:32:13'),
(11, 1, 'Luffy of One Piece', 'luffy also known as \"straw hat\", fictional character and a main protagonist in one piece', 300, 1000, '2021-05-27 21:00:00', '11.jpeg', '2021-05-23 21:37:07'),
(12, 3, 'The Girl', 'beautiful', 100, 500, '2021-05-15 18:00:00', '12.jpeg', '2021-05-23 21:38:27'),
(13, 3, 'The Man', 'with authority, symbol', 100, 300, '2021-05-28 13:00:00', '13.jpeg', '2021-05-23 21:43:17'),
(14, 2, 'The Soldier', 'the man with uniform, army', 600, 1000, '2021-05-28 18:00:00', '14.jpeg', '2021-05-23 21:52:23'),
(15, 1, 'Haf Paradise', 'beautiful garden paradise', 100, 600, '2021-05-29 13:00:00', '15.jpg', '2021-05-24 13:32:37'),
(16, 3, 'Batman and Joker', 'the protagonist and antagonist if the comic book \"BATMAN\"', 100, 500, '2021-06-01 06:00:00', '16.jpg', '2021-05-24 13:35:49'),
(17, 2, 'The Candid Smile', 'they capture the perfect smile of the child', 100, 300, '2021-05-28 19:00:00', '17.jpg', '2021-05-24 13:37:44'),
(18, 3, 'The Mask', 'the mask that hide the true self, hidden', 100, 400, '2021-05-31 17:00:00', '18.jpg', '2021-05-24 13:41:45'),
(19, 3, 'Enrique Bernal Florescent', 'beautiful, lovely lady', 100, 500, '2021-05-30 13:43:00', '19.jpg', '2021-05-24 13:44:01'),
(20, 2, 'The Nurse', 'the person who give first aid, the one who take cares of the sick, workers', 100, 400, '2021-05-27 13:48:00', '20.jpg', '2021-05-24 13:48:34'),
(21, 2, 'The Gaze', 'stare, glance, close observation ', 100, 700, '2021-05-29 17:00:00', '21.jpg', '2021-05-24 13:52:19'),
(22, 1, 'The Sunflower Painting', 'painting, beautiful', 100, 1000, '2021-05-27 13:54:00', '22.jpg', '2021-05-24 13:55:12'),
(23, 1, '.Webp', 'amazing painting of a girl', 100, 800, '2021-05-26 13:58:00', '23.Webp', '2021-05-24 13:58:30'),
(24, 1, 'Green Leaves', 'beautiful in eyes, relax, nature', 100, 500, '2021-06-01 18:00:00', '24.webp', '2021-05-24 14:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`) VALUES
(1, 'EXELerate ART UNLIMITED', 'EXELerate@gmail.com', '09461795444');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=User',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 'admin@admin.com', '0999999999', '', 1, '2021-04-13 09:19:59'),
(6, 'Hazel Uba', 'uba123', 'e545001ae0fb57b97a15ae3cd71702e5', 'ubahazel06@gmail.com', '09277388982', 'Purok 5/Rosal  St.', 2, '2021-05-15 14:49:27'),
(7, 'Rinalyn Panday', 'rinbi', 'd7cbf21ae34c3ac92a79359234a6b842', 'rinalynjp@gmail.com', '09461795444', 'libon, albay', 2, '2021-05-15 14:53:08'),
(8, 'Shaina Refran', 'shainafran', 'e98afe4915646f32850801ce66c5f6cb', 'shainarefran@gmail.com', '099991234', 'Centro Polangui, Albay', 2, '2021-05-15 14:55:11'),
(9, 'Jason Ramos', 'jasonramos143', 'eb223b346add7fe4b0e5e794213ac476', '', '', '', 2, '2021-05-22 10:52:44'),
(10, 'Iah Maybel Charm Arnoco', 'iah123', '662fd8ab2717c8ea981545ab84a69fdf', '', '', '', 2, '2021-05-22 10:53:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
