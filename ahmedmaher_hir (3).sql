-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 18, 2021 at 03:06 AM
-- Server version: 5.7.34-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ahmedmaher_hir`
--

-- --------------------------------------------------------

--
-- Table structure for table `avmeetings`
--

CREATE TABLE `avmeetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL COMMENT '0->available 1->book',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `avmeetings`
--

INSERT INTO `avmeetings` (`id`, `job_id`, `time_from`, `time_to`, `available`, `created_at`, `updated_at`) VALUES
(3, 2, '11:30:00', '11:45:00', 1, '2021-09-03 20:44:16', '2021-09-03 22:50:08'),
(4, 2, '11:45:00', '12:00:00', 1, '2021-09-03 20:44:16', '2021-09-10 20:37:15'),
(7, 3, '11:30:00', '11:45:00', 0, '2021-09-03 20:47:09', '2021-09-11 17:59:12'),
(8, 3, '11:45:00', '12:00:00', 1, '2021-09-03 20:47:09', '2021-09-11 17:59:12'),
(32, 4, '11:30:00', '11:45:00', 1, '2021-09-05 19:03:27', '2021-09-11 17:17:42'),
(33, 4, '11:45:00', '12:00:00', 0, '2021-09-05 19:03:27', '2021-09-11 17:17:42'),
(34, 4, '12:00:00', '12:15:00', 1, '2021-09-05 19:03:27', '2021-09-08 21:49:11'),
(35, 4, '12:15:00', '12:30:00', 1, '2021-09-05 19:03:27', '2021-09-08 20:45:58'),
(44, 5, '11:30:00', '12:00:00', 0, '2021-09-05 20:42:45', '2021-09-05 20:42:45'),
(45, 5, '12:00:00', '12:30:00', 0, '2021-09-05 20:42:45', '2021-09-05 20:42:45'),
(46, 6, '17:13:00', '17:28:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(47, 6, '17:28:00', '17:43:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(48, 6, '17:43:00', '17:58:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(49, 6, '17:58:00', '18:13:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(50, 6, '18:13:00', '18:28:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(51, 6, '18:28:00', '18:43:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(52, 6, '18:43:00', '18:58:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(53, 6, '18:58:00', '19:13:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(54, 6, '19:13:00', '19:28:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(55, 6, '19:28:00', '19:43:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(56, 6, '19:43:00', '19:58:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(57, 6, '19:58:00', '20:13:00', 0, '2021-09-06 22:15:14', '2021-09-06 22:15:14'),
(58, 7, '10:00:00', '10:10:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(59, 7, '10:10:00', '10:20:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(60, 7, '10:20:00', '10:30:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(61, 7, '10:30:00', '10:40:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(62, 7, '10:40:00', '10:50:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(63, 7, '10:50:00', '11:00:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(64, 7, '11:00:00', '11:10:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(65, 7, '11:10:00', '11:20:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(66, 7, '11:20:00', '11:30:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(67, 7, '11:30:00', '11:40:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(68, 7, '11:40:00', '11:50:00', 0, '2021-09-07 04:22:54', '2021-09-07 04:22:54'),
(69, 7, '11:50:00', '12:00:00', 0, '2021-09-07 04:22:54', '2021-09-07 05:34:03'),
(70, 8, '10:00:00', '10:10:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(71, 8, '10:10:00', '10:20:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(72, 8, '10:20:00', '10:30:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(73, 8, '10:30:00', '10:40:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(74, 8, '10:40:00', '10:50:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(75, 8, '10:50:00', '11:00:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(76, 8, '11:00:00', '11:10:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(77, 8, '11:10:00', '11:20:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(78, 8, '11:20:00', '11:30:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(79, 8, '11:30:00', '11:40:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(80, 8, '11:40:00', '11:50:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(81, 8, '11:50:00', '12:00:00', 0, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(82, 9, '10:00:00', '10:10:00', 1, '2021-09-07 16:03:28', '2021-09-07 16:05:44'),
(83, 9, '10:10:00', '10:20:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(84, 9, '10:20:00', '10:30:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(85, 9, '10:30:00', '10:40:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(86, 9, '10:40:00', '10:50:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(87, 9, '10:50:00', '11:00:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(88, 9, '11:00:00', '11:10:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(89, 9, '11:10:00', '11:20:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(90, 9, '11:20:00', '11:30:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(91, 9, '11:30:00', '11:40:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(92, 9, '11:40:00', '11:50:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(93, 9, '11:50:00', '12:00:00', 0, '2021-09-07 16:03:28', '2021-09-07 16:03:28'),
(94, 10, '10:00:00', '10:10:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(95, 10, '10:10:00', '10:20:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(96, 10, '10:20:00', '10:30:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(97, 10, '10:30:00', '10:40:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(98, 10, '10:40:00', '10:50:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(99, 10, '10:50:00', '11:00:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(100, 10, '11:00:00', '11:10:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(101, 10, '11:10:00', '11:20:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(102, 10, '11:20:00', '11:30:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(103, 10, '11:30:00', '11:40:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(104, 10, '11:40:00', '11:50:00', 0, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(105, 10, '11:50:00', '12:00:00', 1, '2021-09-07 16:03:29', '2021-09-07 16:11:21'),
(106, 11, '10:00:00', '10:10:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(107, 11, '10:10:00', '10:20:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(108, 11, '10:20:00', '10:30:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(109, 11, '10:30:00', '10:40:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(110, 11, '10:40:00', '10:50:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(111, 11, '10:50:00', '11:00:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(112, 11, '11:00:00', '11:10:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(113, 11, '11:10:00', '11:20:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(114, 11, '11:20:00', '11:30:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(115, 11, '11:30:00', '11:40:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(116, 11, '11:40:00', '11:50:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(117, 11, '11:50:00', '12:00:00', 0, '2021-09-07 16:03:30', '2021-09-07 16:03:30'),
(118, 12, '10:00:00', '10:10:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(119, 12, '10:10:00', '10:20:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(120, 12, '10:20:00', '10:30:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(121, 12, '10:30:00', '10:40:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(122, 12, '10:40:00', '10:50:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(123, 12, '10:50:00', '11:00:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(124, 12, '11:00:00', '11:10:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(125, 12, '11:10:00', '11:20:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(126, 12, '11:20:00', '11:30:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(127, 12, '11:30:00', '11:40:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(128, 12, '11:40:00', '11:50:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(129, 12, '11:50:00', '12:00:00', 0, '2021-09-07 16:03:31', '2021-09-07 16:03:31'),
(130, 13, '10:00:00', '10:10:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(131, 13, '10:10:00', '10:20:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(132, 13, '10:20:00', '10:30:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(133, 13, '10:30:00', '10:40:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(134, 13, '10:40:00', '10:50:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(135, 13, '10:50:00', '11:00:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(136, 13, '11:00:00', '11:10:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(137, 13, '11:10:00', '11:20:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(138, 13, '11:20:00', '11:30:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(139, 13, '11:30:00', '11:40:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(140, 13, '11:40:00', '11:50:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(141, 13, '11:50:00', '12:00:00', 0, '2021-09-07 16:38:44', '2021-09-07 16:38:44'),
(178, 14, '11:30:00', '11:50:00', 1, '2021-09-07 19:32:04', '2021-09-07 19:32:04'),
(179, 14, '11:50:00', '12:10:00', 0, '2021-09-07 19:32:04', '2021-09-07 19:32:04'),
(180, 14, '12:10:00', '12:30:00', 1, '2021-09-07 19:32:04', '2021-09-08 20:39:44'),
(181, 15, '16:20:00', '16:30:00', 0, '2021-09-10 20:38:28', '2021-09-11 01:06:33'),
(182, 15, '14:20:00', '14:30:00', 0, '2021-09-10 20:38:28', '2021-09-11 17:19:45'),
(183, 15, '11:00:00', '11:30:00', 1, '2021-09-10 20:38:28', '2021-09-11 17:19:45'),
(184, 15, '11:30:00', '12:00:00', 0, '2021-09-10 20:38:28', '2021-09-11 16:57:54'),
(185, 16, '10:00:00', '10:30:00', 0, '2021-09-10 20:42:24', '2021-09-11 17:11:00'),
(186, 16, '10:30:00', '11:00:00', 0, '2021-09-10 20:42:24', '2021-09-10 20:42:24'),
(187, 16, '11:00:00', '11:30:00', 1, '2021-09-10 20:42:24', '2021-09-11 17:59:24'),
(188, 16, '11:30:00', '12:00:00', 0, '2021-09-10 20:42:24', '2021-09-11 17:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'null', NULL, NULL),
(2, 'null', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `name`, `description`) VALUES
(1, 1, 'en', 'ahmed', 'very good'),
(2, 1, 'ar', 'احمد', 'جيد جدا'),
(3, 2, 'en', 'maher', 'sadkjhf '),
(4, 2, 'ar', 'ماهر', 'ثثث');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `employee_content` text COLLATE utf8mb4_unicode_ci,
  `employer_content` text COLLATE utf8mb4_unicode_ci,
  `seen` tinyint(4) DEFAULT NULL COMMENT '0->not seen, 1->seen',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `employee_id`, `employer_id`, `employee_content`, `employer_content`, `seen`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, 'me', 0, NULL, NULL),
(2, 2, 1, 'you', NULL, 0, NULL, NULL),
(3, 2, 1, 'you', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employeechats`
--

CREATE TABLE `employeechats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employeechats`
--

INSERT INTO `employeechats` (`id`, `employee_id`, `employer_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2021-09-14 07:01:02', '2021-09-14 19:13:04'),
(2, 1, 2, '2021-09-14 07:01:02', '2021-09-14 19:13:04'),
(4, 2, 2, '2021-09-14 07:01:02', '2021-09-14 07:01:02'),
(9, 2, 1, '2021-09-14 16:27:54', '2021-09-14 16:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `employeenotifications`
--

CREATE TABLE `employeenotifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL COMMENT '1->, 2->, 3->',
  `employee_id` bigint(20) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `candate_id` bigint(20) DEFAULT NULL,
  `viedo_channel_name` text COLLATE utf8mb4_unicode_ci,
  `viedo_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employeenotifications`
--

INSERT INTO `employeenotifications` (`id`, `type`, `employee_id`, `title`, `body`, `candate_id`, `viedo_channel_name`, `viedo_token`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'title', 'body', 10, NULL, NULL, '2021-09-16 18:34:26', '2021-09-16 18:34:26'),
(4, 2, 2, 'title', 'body', NULL, 'jadhkjs', 'jadhkjs', '2021-09-16 23:55:59', '2021-09-16 23:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `fullName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `university` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `study_field` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deriving_licence` tinyint(4) DEFAULT NULL,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `languages` text COLLATE utf8mb4_unicode_ci,
  `cv` text COLLATE utf8mb4_unicode_ci,
  `audio` text COLLATE utf8mb4_unicode_ci,
  `video` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `block` tinyint(4) DEFAULT NULL COMMENT 'null->not bloked, 1->bloked',
  `socialite_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `category_id`, `fullName`, `email`, `password`, `country`, `city`, `title`, `qualification`, `university`, `graduation_year`, `experience`, `study_field`, `deriving_licence`, `skills`, `languages`, `cv`, `audio`, `video`, `image`, `birth`, `gender`, `block`, `socialite_id`, `token`, `failed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ahmed maher1', 'ahmed101@gmail.com', '$2y$10$ZBYWBWixR.QevMKj3i8MyuowxIMl6g6h8bFyqRL8lP4EQRA3/T0..', 'eg', 'ad', 'asd', 'as', 'asjh', 2005, 4, 'asdas', 1, '[\"asd, asd\"]', '[\"ar\",\"en\"]', NULL, NULL, NULL, '6063781630671264.jpg', '2005', 0, NULL, NULL, NULL, '2021-09-03 12:14:24', '2021-09-03 19:14:24', '2021-09-03 19:14:24'),
(2, 1, 'ahmed maher2', 'ahmed1@gmail.com', '$2y$10$MZPCmg7kgacJYMwv85.x1O84hlsjykYLr6nerUAhLihmKIJhv7nie', 'eg', 'ad', NULL, 'as', 'asjh', 2006, 2, 'asdas', 1, '[\"ar\",\"en\"]', '[\"ar\",\"en\"]', NULL, NULL, NULL, '3429021630683205.jpg', '2000', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-03 12:14:51', '2021-09-03 19:14:51', '2021-09-18 16:06:36'),
(3, 1, 'ahmed maher3', 'aaaaaa1@gmail.com', '$2y$10$ZBYWBWixR.QevMKj3i8MyuowxIMl6g6h8bFyqRL8lP4EQRA3/T0..', 'eg', 'asd', 'asd', 'asd', 'asd', 1999, 3, 'sad', 1, '[\"php\",\"laravel\"]', '[\"ar\",\"en\"]', NULL, NULL, NULL, NULL, '1990', 0, NULL, '110784859353789236039', NULL, '2021-09-03 12:22:15', '2021-09-03 19:22:15', '2021-09-03 19:22:15'),
(4, 1, 'ahmed maher4', 'ahmedmaher1792001@gmail.com', '$2y$10$mtyWQ7jsLhHQcXa5Bu6rdeT7D7JtVRgFnCM6e6jyHTCX8ZjMxFww2', 'eg', 'asd', 'asd', 'sada', 'asd', 2001, 7, 'asdwq', 1, '[\"php1\",\"laravel2\"]', '[\"ar1\",\"en2\"]', '5669891631889422.pdf', NULL, NULL, NULL, '1999', 0, NULL, '110784859353789236039', NULL, '2021-09-03 12:50:20', '2021-09-03 19:50:20', '2021-09-17 21:37:02'),
(5, 1, 'ahmed maher', 'ahmed103@gmail.com', '$2y$10$zsSJPfnZx9V5I2zSi.1on.F3zLsau1QVTlSZoBDCksI5Lk8eQc3WG', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 12, 'asdas', 1, '[\"asd, asd\"]', '[\"en, ar\"]', NULL, NULL, NULL, NULL, '2001', 0, NULL, NULL, 'shdaf sdfhk sdjkfh asjkdhf', '2021-09-15 15:27:12', '2021-09-15 13:27:12', '2021-09-15 13:27:12'),
(6, 1, 'ahmed maher', 'ahmed22@gmail.com', '$2y$10$HD/OXGj/ul9T5g36PBHGjui3ciub2.ayKdPfhDJ8luGLS9Q4fac0K', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 1, 'asdas', 1, '[\"asd\",\"asd2\"]', '[\"en\",\"ar\"]', NULL, NULL, NULL, NULL, '2000', 1, NULL, NULL, '21', '2021-09-16 09:55:08', '2021-09-16 16:55:08', '2021-09-16 16:55:08'),
(7, 1, 'ahmed maher', 'ahmed23@gmail.com', '$2y$10$y5SV8utcCjcDAQafuSowM.uWih9PdXmebDjZhc4WyQQs.LJij6I8a', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwq', '2021-09-16 10:26:25', '2021-09-16 17:26:25', '2021-09-16 17:26:25'),
(8, 1, 'sa', 'a@gmail.com', '$2y$10$XZh77Jkh9.fstP/QnrBuxOW7FA084ONKHSDJOhlfF8R9a4GDxv4q6', 'Egypt', 'Cairo', ';kk', 'jj', 'Ain Shams', 2020, 2, 'CS', 1, NULL, NULL, '8810301631788404.pdf', NULL, NULL, '4815901631788404.jpg', '16-09-2021', 0, NULL, NULL, 'ceXqsV-lRI2IGTIzXLgM15:APA91bF-6uryBQ0rlwMzSWPHJLupAufn2LETwnwydpIRrgikCC33TOnK8iZEAlS_jrvaoOOHYYLnRnsgTA3BFslBZyTWO8ZhqW4PauglcQwKgkPS1AJZUuvcLjoGimI6D7mIKCy0g-7j', '2021-09-16 10:33:24', '2021-09-16 17:33:24', '2021-09-16 17:33:24'),
(9, 1, 'ds', 'aa@gmail.com', '$2y$10$g/RkdTGQ9FGc64d.c7hl9.zOMfUFvHeXjQwT5b1eLiq22ftaMxaVm', 'Egypt', 'Cairo', 'hh', 'hh', 'Ain Shams', 2020, 2, 'CS', 1, NULL, NULL, '6522861631788632.pdf', NULL, NULL, '2277301631788632.jpg', '16-09-2021', 1, NULL, NULL, 'ceXqsV-lRI2IGTIzXLgM15:APA91bF-6uryBQ0rlwMzSWPHJLupAufn2LETwnwydpIRrgikCC33TOnK8iZEAlS_jrvaoOOHYYLnRnsgTA3BFslBZyTWO8ZhqW4PauglcQwKgkPS1AJZUuvcLjoGimI6D7mIKCy0g-7j', '2021-09-16 10:37:12', '2021-09-16 17:37:12', '2021-09-16 17:37:12'),
(10, 1, 'ahmed maher', 'ahmed24@gmail.com', '$2y$10$H5/JAlvJH6DwHMkQ1Jv8BOfcO3Mc/ZPGKEJ/2m0pg2ztctbbQ/QBu', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwq', '2021-09-17 09:56:07', '2021-09-17 16:56:07', '2021-09-17 16:56:07'),
(11, 1, 'ah', 'jj@gmail.com', '$2y$10$4byFEEBy9hPq5rXPn94/K./a7j2Wa7yPtVnmlol/4Too2TNK30UFy', 'Egypt', 'Cairo', 'hh', 'hh', 'Cairo', 2020, 2, 'Enginnering', 1, NULL, NULL, '3145241631876290.pdf', NULL, NULL, '955581631876290.jpg', '17-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-17 10:58:10', '2021-09-17 17:58:10', '2021-09-17 17:58:10'),
(12, 1, 'ahmed maher', 'ahmed25@gmail.com', '$2y$10$EPHw9etBR13sk8h0Y5hT1.d4btDC2pEsV/MBCWf7r70cK0oh6nb0C', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwq', '2021-09-17 11:00:41', '2021-09-17 18:00:41', '2021-09-17 18:00:41'),
(13, 1, 'ahmd', 'ahmed99@gmail.com', '$2y$10$uOfwuR.Zvx/78oyOSpwhCuz22xZ/vI2zVQwBlWfb0Kf/Q0qT/dYpi', 'Egypt', 'Cairo', 'devops', 'MB', 'Ain Shams', 2022, 2, 'Enginnering', 1, NULL, NULL, '8297481631882442.pdf', NULL, NULL, '2063571631882442.jpg', '17-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-17 12:40:42', '2021-09-17 19:40:42', '2021-09-17 19:40:42'),
(14, 1, 'ahmed maher', 'ahmed29@gmail.com', '$2y$10$dqcxGqmWLJEkKuinKH4VTefikitC7JX/kX/xyYkrO/c1yEtNCMJ/K', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwq', '2021-09-17 12:43:31', '2021-09-17 19:43:31', '2021-09-17 19:43:31'),
(15, 1, 'ahmd', 'ahmed990@gmail.com', '$2y$10$KMOpaGbxcasi0qoW2/vtjOcqOFmzbGxwlAmKDuNwJJlr9rMXrFAMq', 'Egypt', 'Cairo', 'ahed', 'Rirm', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '6924071631883242.jpg', '17-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-17 12:54:02', '2021-09-17 19:54:02', '2021-09-17 19:54:02'),
(16, 1, 'ahmed', 'ah99@gmail.com', '$2y$10$maWWkvxq2vpVmQDxWXjL/uYax1JOiZvdP4W5ojHVSkT8MVXiR3QqK', 'Egypt', 'Cairo', 'Shifoo', 'MM', 'Ain Shams', 2020, 2, 'Computer Science', 1, NULL, NULL, '5982321631888188.pdf', NULL, NULL, '9506731631888188.jpg', '17-09-2021', 0, NULL, NULL, 'sssssssggggggr', '2021-09-17 14:16:28', '2021-09-17 21:16:28', '2021-09-17 21:16:28'),
(17, 1, 'ahmed', 'ah999@gmail.com', '$2y$10$d50Sb/TWFyYv4JXqjpnJGu2V3VbeEfuT.X2FVeEQmslslDtmIH5wS', 'Egypt', 'Cairo', 'amcc', 'MMV', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, '8310551631888340.pdf', NULL, NULL, '3033261631888340.jpg', '17-09-2021', 0, NULL, NULL, 'sssssskksggggggr', '2021-09-17 14:19:00', '2021-09-17 21:19:00', '2021-09-17 21:19:00'),
(18, 1, 'ahmed', 'add@gmail.com', '$2y$10$KB45or9lhOZEc9uEWzVdQ.lI3OV3VBOse4LKErsgPsKZUomwgV9N2', 'Egypt', 'Cairo', 'amcc', 'MMV', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, '4947271631888432.pdf', NULL, NULL, '7850371631888432.jpg', '17-09-2021', 0, NULL, NULL, 'sssssssskksggggggrse', '2021-09-17 14:20:32', '2021-09-17 21:20:32', '2021-09-17 21:20:32'),
(19, 1, 'ahmed', 'add1@gmail.com', '$2y$10$pqGdzHs7QAZAOpDfK4PSPOZMmk3WhniFNkOO018FmqDi8C6a9AzgS', 'Egypt', 'Cairo', 'amcc', 'MMV', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, '9535431631888463.pdf', NULL, NULL, '7842441631888463.jpg', '17-09-2021', 0, NULL, NULL, 'sssssssskksersggggggrse', '2021-09-17 14:21:03', '2021-09-17 21:21:03', '2021-09-17 21:21:03'),
(20, 1, 'ahmed', 'add112@gmail.com', '$2y$10$iT3sob91RcnZHHHnvnGh6eRmxtIussZ.jd/sG73IocaIUKMDkpahy', 'Egypt', 'Cairo', 'amcc', 'MMV', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '4534081631888536.jpg', '17-09-2021', 0, NULL, NULL, 'sssssssskksersggggxggrsed', '2021-09-17 14:22:16', '2021-09-17 21:22:16', '2021-09-17 21:22:16'),
(21, 1, 'ahmed', 'add1122@gmail.com', '$2y$10$LD7G3EBI0TOUqaCpNRLVrOKKL4mGPLOKVcULo1ZSLcHEcj6J527c.', 'Egypt', 'Cairo', 'amcc', 'MMV', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '678311631888563.jpg', '17-09-2021', 0, NULL, NULL, 'sssssssskksersggggxggrewsedd', '2021-09-17 14:22:43', '2021-09-17 21:22:43', '2021-09-17 21:22:43'),
(22, 1, 'ahmed', 'add11225@gmail.com', '$2y$10$mpxhJGmdU9t/tGhY4/dYOeRtnEMq7Aemiy5HfZA7wUHKnyKkEFsba', 'Egypt', 'Cairo', 'amcc', 'MMV', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '9722001631888661.jpg', '17-09-2021', 0, NULL, NULL, 'sssssssskksersklggggxggrewseddxx', '2021-09-17 14:24:21', '2021-09-17 21:24:21', '2021-09-17 21:24:21'),
(23, 1, 'ahmed maher', 'ahmed30@gmail.com', '$2y$10$qqj8T5f2.JBiZVaowFfOxOdtDNOjkxEArjbbRFNerAKdk95OAlhNW', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwqm,', '2021-09-17 14:25:37', '2021-09-17 21:25:37', '2021-09-17 21:25:37'),
(24, 1, 'ahmed', 'add112295@gmail.com', '$2y$10$9Ye6Iv9P84Ejzik33T0y4.GbuejWlDMDpYwfZWpdD3E651q2901Zu', 'Egypt', 'Cairo', 'amcc', 'MMV', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '6634371631888944.jpg', '17-09-2021', 0, NULL, NULL, 'sssssssskksersklgggokogxggrewseddxx', '2021-09-17 14:29:04', '2021-09-17 21:29:04', '2021-09-17 21:29:04'),
(25, 1, 'ahmed maher', 'ahmed301@gmail.com', '$2y$10$uxeTxdlO4T9MCmus1R/oIOaqLpFKyMjBK8bC6.QBbT6thBMYJwq7i', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, '459791631889539.pdf', NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwq', '2021-09-17 14:38:59', '2021-09-17 21:38:59', '2021-09-17 21:38:59'),
(26, 1, 'ahmed maher', 'ahmed31@gmail.com', '$2y$10$.rXhN6BVuvxRQiDh64dZqeVt8Jp1iDPATXf5NUrqkUKkX0kDENHLa', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwqm,kk', '2021-09-18 07:51:36', '2021-09-18 14:51:36', '2021-09-18 14:51:36'),
(27, 1, 'ahmed maher', 'ahmed32@gmail.com', '$2y$10$Jffc4QgJ39uWEBld19sOTeFNt6bXck40GowMhoSTpRKMqSPpoHNsG', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, '287381631951512.pdf', NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwqm,kk', '2021-09-18 07:51:52', '2021-09-18 14:51:52', '2021-09-18 14:51:52'),
(28, 1, 'ahmed', 'add1122995@gmail.com', '$2y$10$ART5IzAxL8zORzuGOR5eDuzAI/I7u/P6bXm87/L5ZuQnUyv9zgipe', 'Egypt', 'Cairo', 'tttt', 'MNW', 'Ain Shams', 2020, 2, 'Computer Science', 1, NULL, NULL, '1316141631952101.pdf', NULL, NULL, '4328141631952101.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklgggok00ogxggrews99eddxx', '2021-09-18 08:01:41', '2021-09-18 15:01:41', '2021-09-18 15:01:41'),
(29, 1, 'kas', 'add10122995@gmail.com', '$2y$10$8IiS9gzIDcgkZ5lMkRaQ4epJZaUpsRT0534RDlHp7EFPBsFN07.qi', 'Egypt', 'Cairo', 'sdjdk', 'MBB', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, '9508541631952333.pdf', NULL, NULL, '6311501631952333.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklggg3ok00ogxggrews99eddxx', '2021-09-18 08:05:33', '2021-09-18 15:05:33', '2021-09-18 15:05:33'),
(30, 1, 'kas', 'add101229956@gmail.com', '$2y$10$5Qq9E3m.bf9gQCq3vgIOUe8BBWHE5O3lT2PmbPc5Qu8dJY6z2YcLC', 'Egypt', 'Cairo', 'sdjdk', 'MBB', 'Ain Shams', 2022, 2, 'Computer Science', 1, NULL, NULL, '148641631952903.pdf', NULL, NULL, '9803521631952903.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklggg3ok00ogxggrews99edd0xx', '2021-09-18 08:15:03', '2021-09-18 15:15:03', '2021-09-18 15:15:03'),
(31, 1, 'kas', 'add1012209956@gmail.com', '$2y$10$vHzZH6Eudh3I/rRJy8hccuQMHU7WZPiCdZLe0csLrdfQrxDj6YM3m', 'Egypt', 'Cairo', 'sdjdk', 'MBB', 'Ain Shams', 2022, 2, 'Computer Science', 1, '[\"ui\"]', '[\"Arabic\"]', NULL, NULL, NULL, '5684521631953358.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklggg3ok00ogxggrews99edd0xx', '2021-09-18 08:22:38', '2021-09-18 15:22:38', '2021-09-18 15:22:38'),
(32, 1, 'kas', 'add10122099560@gmail.com', '$2y$10$jujZxQ1BI3OjbQc6xub2jeDpHcUWOr4OpdToT2iDXx/L6yWpev5ta', 'Egypt', 'Cairo', 'sdjdk', 'MBB', 'Ain Shams', 2022, 2, 'Computer Science', 1, '[\"ui\"]', '[\"Arabic\"]', NULL, NULL, NULL, '4416761631953396.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklggg3ok00og00xggrews99edd0xx', '2021-09-18 08:23:16', '2021-09-18 15:23:16', '2021-09-18 15:23:16'),
(33, 1, 'ahmed maher', 'ahmed34@gmail.com', '$2y$10$xWE5AhvfiPQ5xzuf2s/R9O7.EwxW/FlM7FKPPf6jQ2eEVK3RX8QXa', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, '6994731631953410.pdf', NULL, NULL, NULL, '2000', 1, NULL, NULL, 'asdwqm,kk', '2021-09-18 08:23:30', '2021-09-18 15:23:30', '2021-09-18 15:23:30'),
(34, 1, 'dsds', 'add1012209009560@gmail.com', '$2y$10$bm39pyqTi1yFBdIE4pLyde4k91yjctNhNteILPRLUCcQ4zMX2UwaK', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, '[\"ui\"]', '[\"English\"]', NULL, NULL, NULL, '4076831631954054.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklggg3ok00og00xggrews99edd0xx', '2021-09-18 08:34:14', '2021-09-18 15:34:14', '2021-09-18 15:34:14'),
(35, 1, 'dsds', 'add101220900349560@gmail.com', '$2y$10$6227exvYMotdr3wV05tURu0wEwakm1i4Y6CeqxY8jGMx819tQrrWm', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, '[\"ui\"]', '[\"English\"]', NULL, NULL, NULL, '7920891631954404.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklggg3ok00og00xggrews99edd0xx', '2021-09-18 08:40:04', '2021-09-18 15:40:04', '2021-09-18 15:40:04'),
(36, 1, 'dsds', 'add1012209003409560@gmail.com', '$2y$10$SnK5dk/5s4riZiJcZa8h4OXKPVcSmA2v5i3GeiPkJww71iC.CixGO', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, '[\"ui\"]', '[\"English\"]', NULL, NULL, NULL, '8712421631954467.jpg', '18-09-2021', 0, NULL, NULL, 'sssssssskksersklggg3ok0s9340og00xggrews99edd0xx', '2021-09-18 08:41:07', '2021-09-18 15:41:07', '2021-09-18 15:41:07'),
(37, 1, 'ahmed maher', 'ahmed35@gmail.com', '$2y$10$EZKurbYKNGLuwlkufpTkkeUh7RnDbBAqAJGN498g/qQKQoWrHrU1O', 'eg', 'ad', 'asd', 'as', 'asjh', 2000, 5, 'asdas', 1, NULL, NULL, '1473291631954760.pdf', NULL, NULL, NULL, '2000', 1, NULL, NULL, 'sssssssskksersklggg3ok0s9340og00xggrews99edd0xx', '2021-09-18 08:46:00', '2021-09-18 15:46:00', '2021-09-18 15:46:00'),
(38, 1, 'dsds', 'add10122090034095260@gmail.com', '$2y$10$bAMb78GEZ.bC3/30PCmGIe9FhBK3NjM8YFmf9BBSnzqsaIi4/Q8JK', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '1770671631954827.jpg', '18-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-18 08:47:07', '2021-09-18 15:47:07', '2021-09-18 15:47:07'),
(39, 1, 'dsds', 'add101220290034095260@gmail.com', '$2y$10$Th2uoSaRRnsMEo5Nw7qYguShIZW7fz6HZ0j39vYMj.lk1XAY.ZteO', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '5502081631954910.jpg', '18-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-18 08:48:30', '2021-09-18 15:48:30', '2021-09-18 15:48:30'),
(40, 1, 'dsds', 'add1012202900340995260@gmail.com', '$2y$10$9YZwza5P2hAjalcSL1qMW.WNt8HNauoeBE8NJR6xJ5ItsyIRTVLHC', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '9610311631954980.jpg', '18-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-18 08:49:40', '2021-09-18 15:49:40', '2021-09-18 15:49:40'),
(41, 1, 'dsds', 'add1012202900340s995260@gmail.com', '$2y$10$LA05.6yhU.PhalVDE9sRHe3OtOGNQpqGi6eUYGLeavI.E53KT1Jf.', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '7143451631955106.jpg', '18-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-18 08:51:46', '2021-09-18 15:51:46', '2021-09-18 15:51:46'),
(42, 1, 'dsds', 'add1012202900340s9952603@gmail.com', '$2y$10$Po7EySu1UKr2NJ3J40oowe2gAETbGUoQnAuFpj2T/sJBB5rHV9y5u', 'Egypt', 'Cairo', 'dsd', 'cxx', 'Ain Shams', 2020, 2, 'Computer Science', 1, NULL, NULL, NULL, NULL, NULL, '7814701631955422.jpg', '18-09-2021', 0, NULL, NULL, 'cuFUcMK9TxqSQr6ROwwBmf:APA91bGrvqoBkScIc3f0q9a9216GuLY6PjzuXt6GJb0ts3Ynz5bH6BBnBEa6mqtezJSwlRviMtBxO0rXHNnRemhQGMH8KwJAFPnQueNhZcbJv6t9boY8AlYTvo7F5y9aNjrwp5IGLJD9', '2021-09-18 08:57:02', '2021-09-18 15:57:02', '2021-09-18 15:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `employee_active`
--

CREATE TABLE `employee_active` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_job`
--

CREATE TABLE `employee_job` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `candat_applay_status` tinyint(4) DEFAULT NULL COMMENT '0->reject 1->accept 2->shoertlist',
  `avmeeting_id` bigint(20) DEFAULT NULL,
  `meeting_time_status` tinyint(4) DEFAULT NULL COMMENT '0->reject 1->accept the candit who determine this',
  `note` text COLLATE utf8mb4_unicode_ci,
  `candat_status` tinyint(4) DEFAULT NULL COMMENT '0->reject 1->accept 2->underreview employer who detemine this',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_job`
--

INSERT INTO `employee_job` (`id`, `job_id`, `employee_id`, `candat_applay_status`, `avmeeting_id`, `meeting_time_status`, `note`, `candat_status`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 1, 8, 1, NULL, 1, '2021-09-04 05:43:18', '2021-09-11 17:59:12'),
(4, 4, 3, 1, 34, NULL, NULL, NULL, '2021-09-04 05:43:10', '2021-09-08 21:49:11'),
(6, 7, 3, NULL, NULL, NULL, NULL, 0, '2021-09-07 04:28:52', '2021-09-07 15:50:47'),
(7, 9, 3, 1, 82, NULL, NULL, NULL, '2021-09-07 16:03:54', '2021-09-07 16:05:44'),
(8, 10, 3, 1, 105, NULL, NULL, NULL, '2021-09-07 16:09:44', '2021-09-07 16:11:21'),
(9, 14, 3, 1, 180, NULL, NULL, NULL, '2021-09-08 16:01:22', '2021-09-08 20:39:44'),
(10, 14, 2, 1, 178, 1, NULL, NULL, '2021-09-08 22:17:38', '2021-09-16 19:48:15'),
(11, 10, 2, NULL, NULL, NULL, NULL, NULL, '2021-09-08 22:30:12', '2021-09-08 22:30:12'),
(12, 3, 2, NULL, NULL, NULL, NULL, NULL, '2021-09-08 22:34:49', '2021-09-08 22:34:49'),
(14, 8, 2, NULL, NULL, NULL, NULL, NULL, '2021-09-09 16:34:05', '2021-09-09 16:34:05'),
(15, 4, 2, 1, 32, 1, NULL, NULL, '2021-09-09 17:22:05', '2021-09-11 17:59:17'),
(16, 2, 3, NULL, NULL, NULL, NULL, NULL, '2021-09-10 20:35:17', '2021-09-10 20:35:17'),
(17, 15, 2, 1, 183, 1, NULL, NULL, '2021-09-10 20:42:04', '2021-09-11 17:19:45'),
(18, 16, 2, 1, 187, 1, NULL, 2, '2021-09-10 20:42:57', '2021-09-11 17:59:24'),
(19, 2, 2, NULL, NULL, NULL, NULL, NULL, '2021-09-17 20:16:23', '2021-09-17 20:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `employee_password_resets`
--

CREATE TABLE `employee_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_password_resets`
--

INSERT INTO `employee_password_resets` (`email`, `token`, `created_at`) VALUES
('ahmedmaher1792001@gmail.com', 'Su6tetVNWSnitvQuzXWkcDIqd9RI01cGrn2Wp3q4', '2021-09-03 19:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `employerchats`
--

CREATE TABLE `employerchats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employerchats`
--

INSERT INTO `employerchats` (`id`, `employee_id`, `employer_id`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '2021-09-14 06:55:22', '2021-09-14 06:55:22'),
(7, 2, 1, '2021-09-14 16:28:21', '2021-09-14 16:28:21'),
(8, 3, 1, '2021-09-14 16:28:32', '2021-09-14 16:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `employers`
--

CREATE TABLE `employers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullName` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business` bigint(20) DEFAULT NULL,
  `established_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employers`
--

INSERT INTO `employers` (`id`, `fullName`, `title`, `email`, `password`, `mobile_number1`, `mobile_number2`, `company_name`, `country`, `city`, `business`, `established_at`, `website`, `image`, `active`, `token`, `created_at`, `updated_at`) VALUES
(1, 'ahmed maher', 'asd asd asd', 'ahmed1@gmail.com', '$2y$10$wVMQP06wa7n2Xez0M5zi5uilEYLxc.Mk9qJ4ACgQMbsYwm6gwwhgq', '12345676', '013132312312', 'asd', 'eg', 'ai', 1, '2000', 'sjhafdkdgs.com', '7935811630683281.jpg', NULL, NULL, '2021-09-03 20:22:07', '2021-09-17 16:54:35'),
(2, 'ahmed maher', 'asd asd asd', 'ahmed2@gmail.com', '$2y$10$iCoJcibkwpry4QJvn0YlduLOf52c1MQHS6vo9.PO5C6TjIni4AG4u', '12345676', '013132312312', 'asd', 'eg', 'ai', 1, '200', 'sjhafdkdgs.com', NULL, NULL, NULL, '2021-09-03 22:36:52', '2021-09-03 22:36:52'),
(3, 'ahmed maher', 'asd asd asd', 'ahmed3@gmail.com', '$2y$10$yGJpTR.dJnkLJAZws/k6i.8yToV5fv7mBL94bLSOjy8DnX5lIU3x6', '12345676', NULL, 'asd', 'eg', 'ai', 1, '200', 'sjhafdkdgs.com', NULL, NULL, NULL, '2021-09-07 14:59:15', '2021-09-07 14:59:15'),
(4, 'ahmed maher', 'asd asd asd', 'ahmed4@gmail.com', '$2y$10$EpxLN01hW8KIT2fU.zHlWuz2jEFJvkbnjK9Uyvq2OI9ttNgxrFQd.', '12345676', NULL, 'asd', 'eg', 'ai', 1, '200', 'sjhafdkdgs.com', NULL, NULL, NULL, '2021-09-14 16:42:23', '2021-09-14 16:42:23'),
(5, 'ahmed maher', 'asd asd asd', 'ahmed5@gmail.com', '$2y$10$vColm4U1ljMC1oGTMU8/U.F4rOGCWISjlBATbnIyJ2R9X5bPIMoee', '12345676', NULL, 'asd', 'eg', 'ai', 1, '200', 'sjhafdkdgs.com', NULL, NULL, NULL, '2021-09-14 18:52:54', '2021-09-14 18:52:54'),
(6, 'ahmed maher', 'asd asd asd', 'ahmed7@gmail.com', '$2y$10$yPQLE12ZKJ1B/XDferPhkueUwvT0rVcY8uulnHnvajM/STUbb83se', '12345676', NULL, 'asd', 'eg', 'ai', 1, '200', 'sjhafdkdgs.com', NULL, NULL, NULL, '2021-09-15 12:48:46', '2021-09-15 12:48:46'),
(7, 'ahmed maher', 'asd asd asd', 'ahmed100@gmail.com', '$2y$10$tdEPXeJHa2qaYhOe4Mz8ceDp0wDSirwKA4zJ15yP/NT3W98.SWhEC', '12345676', '013132312312', 'asd', 'eg', 'ai', 1, '200', 'sjhafdkdgs.com', NULL, NULL, 'sjkfhakj sdjfh sdj hfsdfj', '2021-09-15 13:27:33', '2021-09-15 13:27:33'),
(8, 'ahmed maher', 'asd asd asd', 'ahmed33@gmail.com', '$2y$10$.9S5tscLl0Uc7KdDDU4Buel.4fxxbFrnVNZV3uicPHkWR0FKwgA86', '12345676', NULL, 'asd', 'eg', 'ai', 1, '200', 'sjhafdkdgs.com', NULL, NULL, NULL, '2021-09-17 18:36:58', '2021-09-17 18:36:58'),
(9, 'ahmed', 'asdd', 'as@gmail.com', '$2y$10$dbTpBl/Ejue5PXfpeOApg.Kyw/KDi1gh5M07PlTAUbpnUqeYe24u.', '01069826459', '213121221', 'ahhhh', 'Egg', 'g', 1, '2010-01-01', 'www.g.com', '8132571631879542.jpg', NULL, NULL, '2021-09-17 18:52:22', '2021-09-17 18:52:22'),
(10, 'ahmd', 'ahhc', 'ac@gmail.com', '$2y$10$zf086ZcW5hJbEU3XrNGLRe2eo5QmnMYxVv2lB5OMlDYksjU9.G7ge', '01069826459', '213121221', 'Salam', 'Egy', 'City', 1, '2010-01-01', 'www.g.com', '223981631880370.jpg', NULL, NULL, '2021-09-17 19:06:10', '2021-09-17 19:06:10'),
(11, 'hhm', 'ssss', 'as2a@gmail.com', '$2y$10$3epmyXVD.HuWonfyxFXiuebO2OftLb/Zo0YY4fTbtWQPE9fC2NAR6', '01069825459', '213121221', 'fitness', 'EG', 'C', 1, '2010-01-01', 'www.gv.com', '5069361631881406.jpg', NULL, NULL, '2021-09-17 19:23:26', '2021-09-17 19:23:26'),
(12, 'ahxas', 'asaa', 'amx@gmail.com', '$2y$10$k4EafErTSu2ducxO2LvE9.0hVxZjoThNrthe8WL90QbpmgL7r7592', '01069826459', '213121221', 'Fitness', 'Eg', 'C', 1, '2010-01-01', 'www.ccc.com', '1548431631881734.jpg', NULL, NULL, '2021-09-17 19:28:54', '2021-09-17 19:28:54'),
(13, 'ahmed ashaf', 'deveoper', 'ahcxz@gmail.com', '$2y$10$1NqLjR6VdwRC4j7Kzso/2ORwfpdGPUzMilfxLltGgQKMvfMefW6AW', '01069826458', '213121221', 'Fitness Club', 'Egypt', 'Cairo', 1, '2010-01-01', 'www.ggm.com', '5110731631882033.jpg', NULL, NULL, '2021-09-17 19:33:53', '2021-09-17 19:33:53'),
(14, 'Hany Khalaf', 'engineer', 'eng.hany.khalaf@gmail.com', '$2y$10$5uljnJBHihnM7NjSoLMaTeyBWooYJcXBVpOiQlHxsFZ6ZAdCoHCOG', '01140256883', '213121221', 'Algorithm', 'Egypt', 'Cairo', 1, '2021-01-10', 'www.algorithmltd.com', '6238371631901065.jpg', NULL, NULL, '2021-09-18 00:51:05', '2021-09-18 00:51:05'),
(15, 'arafa', 'owner', 'gm@trustgroup-egy.com', '$2y$10$EIB5YeoE412YU1tXp2RgxOrB3o71QY24HjK8/MzqO6dU8SoJw5uoy', '01111336553', '213121221', 'trust group recruitment', 'egypt', 'giza', 2, '2010-01-01', 'www.trustgroup-egy.com', '4440331631911494.jpg', NULL, NULL, '2021-09-18 03:44:54', '2021-09-18 03:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `employer_active`
--

CREATE TABLE `employer_active` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employer_password_resets`
--

CREATE TABLE `employer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL COMMENT 'job field',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `salary` double(8,2) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '0->male  1->female 2->other',
  `experience` int(11) DEFAULT NULL,
  `qualification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interviewer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interviewer_role` text COLLATE utf8mb4_unicode_ci,
  `meeting_date` date DEFAULT NULL,
  `meeting_from` time DEFAULT NULL,
  `meeting_to` time DEFAULT NULL,
  `meeting_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0->cancel 1->active 2->closed',
  `applies` int(11) DEFAULT '10',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `employer_id`, `category_id`, `title`, `details`, `note`, `salary`, `gender`, `experience`, `qualification`, `interviewer_name`, `interviewer_role`, `meeting_date`, `meeting_from`, `meeting_to`, `meeting_time`, `status`, `applies`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'asd', 'aaaaaaaaa', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '11:30:00', '12:00:00', 15, 1, 10, '2021-09-03 20:44:16', '2021-09-07 19:33:56'),
(3, 2, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-10', '11:30:00', '12:00:00', 15, 1, 10, '2021-09-03 20:47:09', '2021-09-03 20:47:09'),
(4, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '11:30:00', '12:30:00', 15, 1, 11, '2021-09-03 21:08:10', '2021-09-05 19:03:27'),
(5, 1, 1, 'flutter developer', 'flutter is cross plateform', 'hello', 500.00, 0, 5, 'CS', 'ali', 'HR', '2021-09-15', '11:30:00', '12:30:00', 30, 0, 12, '2021-09-04 21:39:57', '2021-09-07 15:50:01'),
(6, 1, 1, 'Ios Developer', 'this job for juniors', 'hello', 5000.00, 1, 5, 'CS', 'Amr', 'HR', '2021-09-15', '17:13:00', '20:13:00', 15, 0, 12, '2021-09-06 22:15:14', '2021-09-07 12:54:37'),
(7, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '10:00:00', '12:00:00', 10, 0, 11, '2021-09-07 04:22:54', '2021-09-07 15:50:47'),
(8, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '10:00:00', '12:00:00', 10, 1, 11, '2021-09-07 14:56:53', '2021-09-07 14:56:53'),
(9, 1, 1, 'asd', 'aaaaaaaaa', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '10:00:00', '12:00:00', 10, 1, 11, '2021-09-07 16:03:28', '2021-09-07 16:48:11'),
(10, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '10:00:00', '12:00:00', 10, 1, 11, '2021-09-07 16:03:29', '2021-09-07 16:03:29'),
(11, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '10:00:00', '12:00:00', 10, 0, 11, '2021-09-07 16:03:30', '2021-09-07 16:26:16'),
(12, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '10:00:00', '12:00:00', 10, 0, 11, '2021-09-07 16:03:31', '2021-09-07 16:27:05'),
(13, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-15', '10:00:00', '12:00:00', 10, 0, 11, '2021-09-07 16:38:44', '2021-09-07 16:50:04'),
(14, 1, 1, 'Flutter developer', 'aaaaaaaaa', 'hello', 5100.00, 0, 7, 'asdhasjkgg', 'ahmed aa', 'HR', '2021-09-15', '11:30:00', '12:30:00', 20, 1, 12, '2021-09-07 16:38:48', '2021-09-07 19:32:04'),
(15, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-14', '10:00:00', '12:00:00', 30, 1, 11, '2021-09-10 20:38:28', '2021-09-10 20:38:28'),
(16, 1, 1, 'asd', 'asd', 'asd', 1000.00, 1, 5, 'asdhasjkgg', 'ahmed aa', 'ajksdhuk', '2021-09-04', '10:00:00', '12:00:00', 30, 1, 11, '2021-09-10 20:42:24', '2021-09-10 20:42:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_resets_table', 1),
(24, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(25, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(26, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(27, '2016_06_01_000004_create_oauth_clients_table', 1),
(28, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(29, '2019_08_19_000000_create_failed_jobs_table', 1),
(30, '2021_03_01_074238_create_categories_table', 1),
(31, '2021_03_01_074318_create_category_translations_table', 1),
(32, '2021_03_22_191340_laratrust_setup_tables', 1),
(33, '2021_08_03_112429_employees', 1),
(34, '2021_08_03_120647_employers', 1),
(35, '2021_08_04_102801_employee_password_resets', 1),
(36, '2021_08_04_102819_employer_password_resets', 1),
(37, '2021_08_05_110349_employee_active', 1),
(38, '2021_08_05_110415_employer_active', 1),
(39, '2021_08_18_093643_jobs', 1),
(40, '2021_08_18_101453_employee_job', 1),
(41, '2021_08_19_082241_reports', 1),
(42, '2021_08_27_063950_create_avmeetings_table', 1),
(43, '2021_09_13_091131_chat', 2),
(45, '2021_09_13_091845_chats', 3),
(46, '2021_09_14_075849_employer_chats', 4),
(47, '2021_09_14_075855_employee_chats', 4),
(48, '2021_09_15_135813_employee_notifications', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1=> admin 2=>student',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `image`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'suber', 'super@eg.com', NULL, NULL, NULL, '$2y$10$ZMErjG72.E9hE/MWiz0yr.SSZmKeeXZN8PXTc7repYgMY9dAMJ5bi', NULL, 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avmeetings`
--
ALTER TABLE `avmeetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  ADD KEY `category_translations_locale_index` (`locale`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeechats`
--
ALTER TABLE `employeechats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeenotifications`
--
ALTER TABLE `employeenotifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_active`
--
ALTER TABLE `employee_active`
  ADD KEY `employee_active_email_index` (`email`);

--
-- Indexes for table `employee_job`
--
ALTER TABLE `employee_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_password_resets`
--
ALTER TABLE `employee_password_resets`
  ADD KEY `employee_password_resets_email_index` (`email`);

--
-- Indexes for table `employerchats`
--
ALTER TABLE `employerchats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employers`
--
ALTER TABLE `employers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer_active`
--
ALTER TABLE `employer_active`
  ADD KEY `employer_active_email_index` (`email`);

--
-- Indexes for table `employer_password_resets`
--
ALTER TABLE `employer_password_resets`
  ADD KEY `employer_password_resets_email_index` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avmeetings`
--
ALTER TABLE `avmeetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employeechats`
--
ALTER TABLE `employeechats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employeenotifications`
--
ALTER TABLE `employeenotifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `employee_job`
--
ALTER TABLE `employee_job`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employerchats`
--
ALTER TABLE `employerchats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE `employers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
