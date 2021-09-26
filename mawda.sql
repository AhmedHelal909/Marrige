-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2021 at 05:09 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mawda`
--

-- --------------------------------------------------------

--
-- Table structure for table `blacks`
--

CREATE TABLE `blacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `black_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cares`
--

CREATE TABLE `cares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `care_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `husbands`
--

CREATE TABLE `husbands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `marrige_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `child_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `physique` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religiosity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pray` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smoke` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beard` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_equal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `health_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_income` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_specification` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `self_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_firebase` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `husbands`
--

INSERT INTO `husbands` (`id`, `user_name`, `password`, `email`, `nationality`, `country_id`, `marrige_type`, `social_status`, `age`, `child_no`, `weight`, `height`, `skin_color`, `physique`, `religiosity`, `pray`, `smoke`, `beard`, `educational_equal`, `financial_status`, `work`, `job`, `health_status`, `monthly_income`, `partner_specification`, `self_description`, `fullname`, `phone`, `image`, `token_firebase`, `created_at`, `updated_at`) VALUES
(11, 'ahmedhelal334', '$2y$10$FgieglCeN.bJWLsm/RHg9uNRFKS042czVWIND6MZbpm2Z51nxbFWS', 'kddddr@gmail.com', 'مصر', 1, 'زوجة اولى', 'اعزب', '15', '5', '80', '160', 'ابيض', 'سمين', 'متدين', 'أصلي دائما', 'لا', 'لا', 'دكتوراه', 'متوسط', 'سكرتارية', 'مهندس', 'سليم', 'لاأحب انا أقول', 'اي صفات', 'انا مهندس', 'أحمد هلال', '01208982815', '8947651632658971.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjMyNjU4OTcxLCJuYmYiOjE2MzI2NTg5NzEsImp0aSI6InhYVlRxVmt4aXVQWDNsc1oiLCJzdWIiOjExLCJwcnYiOiI3OGIzZDYwNzc1ZDA4ZWQ2YTQ1OGViM2ZjMWRhNzk1YjM1ZDM4NjdhIn0.fC', '2021-09-26 10:22:51', '2021-09-26 10:30:00'),
(12, 'ahmedhelal3345', '$2y$10$WR62kP8Vacr5rznLz95GGuK5cWXjMT7.LTtmRvtvslTSl6cyXmii6', 'kdddggdr@gmail.com', 'مصر', 1, 'زوجة اولى', 'اعزب', '15', '5', '80', '160', 'ابيض', 'سمين', 'متدين', 'أصلي دائما', 'لا', 'لا', 'دكتوراه', 'متوسط', 'سكرتارية', 'مهندس', 'سليم', 'لاأحب انا أقول', 'اي صفات', 'انا مهندس', 'أحمد هلال', '01208982815', '2540951632667153.jpg', '1215487', '2021-09-26 12:39:13', '2021-09-26 12:39:13');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2021_03_22_191340_laratrust_setup_tables', 1),
(9, '2021_06_23_091032_create_husbands_table', 1),
(10, '2021_06_23_091103_create_wives_table', 1),
(11, '2021_09_23_091155_create_cares_table', 1),
(12, '2021_09_23_091218_create_countries_table', 1),
(13, '2021_09_23_092016_create_cities_table', 1),
(14, '2021_09_23_092511_create_blacks_table', 1),
(15, '2021_09_23_092620_create_visits_table', 1),
(16, '2021_09_23_092646_create_successes_table', 1),
(17, '2021_09_23_092923_create_partner_wives_table', 1),
(18, '2021_09_23_092943_create_partner_husbands_table', 1),
(19, '2021_09_23_093104_create_packages_table', 1),
(20, '2021_09_23_093133_create_settings_table', 1),
(21, '2021_09_23_093222_create_user_packages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_husbands`
--

CREATE TABLE `partner_husbands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `marrige_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `physique` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_equal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_income` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religiosity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pray` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smoke` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beard` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `husband_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_wives`
--

CREATE TABLE `partner_wives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `marrige_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `physique` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_equal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_income` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religiosity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pray` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smoke` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hijab` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `husband_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create-users', 'Create Users', 'Create Users', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(2, 'read-users', 'Read Users', 'Read Users', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(3, 'update-users', 'Update Users', 'Update Users', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(4, 'delete-users', 'Delete Users', 'Delete Users', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(5, 'create-roles', 'Create Roles', 'Create Roles', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(6, 'read-roles', 'Read Roles', 'Read Roles', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(7, 'update-roles', 'Update Roles', 'Update Roles', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(8, 'delete-roles', 'Delete Roles', 'Delete Roles', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(9, 'create-husbands', 'Create Husbands', 'Create Husbands', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(10, 'read-husbands', 'Read Husbands', 'Read Husbands', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(11, 'update-husbands', 'Update Husbands', 'Update Husbands', '2021-09-26 08:29:23', '2021-09-26 08:29:23'),
(12, 'delete-husbands', 'Delete Husbands', 'Delete Husbands', '2021-09-26 08:29:23', '2021-09-26 08:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1);

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

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super', 'Super', 'Super', '2021-09-26 08:29:23', '2021-09-26 08:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nat_send` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nat_same` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acco_send` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acco_same` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added` tinyint(1) NOT NULL,
  `visited` tinyint(1) NOT NULL,
  `added_block` tinyint(1) NOT NULL,
  `deleted_block` tinyint(1) NOT NULL,
  `new_message` tinyint(1) NOT NULL,
  `image_permission` tinyint(1) NOT NULL,
  `success_story` tinyint(1) NOT NULL,
  `email_notification` tinyint(1) NOT NULL,
  `husband_id` bigint(20) NOT NULL,
  `wife_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `successes`
--

CREATE TABLE `successes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `husband_id` bigint(20) NOT NULL,
  `wife_id` bigint(20) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super', 'super@eg.com', NULL, NULL, NULL, '$2y$10$4cQm.bGvvABwfgGrFDj.Qu4NE5riCLbFpra5NIaY1zk7Ptnn5GFGC', NULL, NULL, '2021-09-26 08:29:23', '2021-09-26 08:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_packages`
--

CREATE TABLE `user_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) NOT NULL,
  `husband_id` bigint(20) NOT NULL,
  `wife_id` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visit_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wives`
--

CREATE TABLE `wives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `marrige_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `child_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `physique` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religiosity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pray` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smoke` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hijab` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_equal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `health_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_income` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_specification` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `self_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_firebase` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wives`
--

INSERT INTO `wives` (`id`, `user_name`, `password`, `email`, `nationality`, `country_id`, `marrige_type`, `social_status`, `age`, `child_no`, `weight`, `height`, `skin_color`, `physique`, `religiosity`, `pray`, `smoke`, `hijab`, `educational_equal`, `financial_status`, `work`, `job`, `health_status`, `monthly_income`, `partner_specification`, `self_description`, `fullname`, `phone`, `image`, `token_firebase`, `created_at`, `updated_at`) VALUES
(1, 'ahmedhelal', '$2y$10$fn/oVGWecEH9QmOyN2R8gOqAa3sgMz28kPl76RHWYCgwt338fOjGS', 'ker@gmail.com', 'مصر', 1, 'زوجة اولى', 'اعزب', '15', '5', '80', '160', 'ابيض', 'سمين', 'متدين', 'أصلي دائما', 'لا', 'لا', 'دكتوراه', 'متوسط', 'سكرتارية', 'مهندس', 'سليم', 'لاأحب انا أقول', 'اي صفات', 'انا مهندس', 'أحمد هلال', '01208982815', '3782771632657072.jpg', '1215487', '2021-09-26 09:51:12', '2021-09-26 09:51:12'),
(2, 'ahmedhelal', '$2y$10$4yhUY1qLEZc6xNNiT1BvNOTA41D8RenxAFpwM5BcQ9l/wSb5lTd.S', 'kedr@gmail.com', 'مصر', 1, 'زوجة اولى', 'اعزب', '15', '5', '80', '160', 'ابيض', 'سمين', 'متدين', 'أصلي دائما', 'لا', 'لا', 'دكتوراه', 'متوسط', 'سكرتارية', 'مهندس', 'سليم', 'لاأحب انا أقول', 'اي صفات', 'انا مهندس', 'أحمد هلال', '01208982815', '3642391632657119.jpg', '1215487', '2021-09-26 09:51:59', '2021-09-26 09:51:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blacks`
--
ALTER TABLE `blacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cares`
--
ALTER TABLE `cares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `husbands`
--
ALTER TABLE `husbands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `husbands_email_unique` (`email`);

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
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_husbands`
--
ALTER TABLE `partner_husbands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_wives`
--
ALTER TABLE `partner_wives`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `successes`
--
ALTER TABLE `successes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wives`
--
ALTER TABLE `wives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wives_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blacks`
--
ALTER TABLE `blacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cares`
--
ALTER TABLE `cares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `husbands`
--
ALTER TABLE `husbands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_husbands`
--
ALTER TABLE `partner_husbands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_wives`
--
ALTER TABLE `partner_wives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `successes`
--
ALTER TABLE `successes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_packages`
--
ALTER TABLE `user_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wives`
--
ALTER TABLE `wives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

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
