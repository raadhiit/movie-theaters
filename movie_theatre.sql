-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2025 at 11:13 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_theatre`
--

-- --------------------------------------------------------

--
-- Table structure for table `auditoriums`
--

CREATE TABLE `auditoriums` (
  `id` bigint UNSIGNED NOT NULL,
  `theater_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auditoriums`
--

INSERT INTO `auditoriums` (`id`, `theater_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Auditorium 1', '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(2, 1, 'Auditorium 2', '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(3, 2, 'Auditorium 3', '2025-08-15 15:39:41', '2025-08-15 15:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Alex', 'Alex@gmail.com', '2025-08-15 12:27:36', '2025-08-15 15:51:18'),
(2, 'Kevin', 'kevin@gmail.com', '2025-08-15 15:50:47', '2025-08-15 15:50:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_15_153326_create_theaters_table', 1),
(5, '2025_08_15_153344_create_auditoriums_table', 1),
(6, '2025_08_15_153348_create_movies_table', 1),
(7, '2025_08_15_153354_create_screenings_table', 1),
(8, '2025_08_15_153403_create_seats_table', 1),
(9, '2025_08_15_153408_create_customers_table', 1),
(10, '2025_08_15_153413_create_orders_table', 1),
(11, '2025_08_15_153418_create_payments_table', 1),
(12, '2025_08_15_153423_create_order_item_tickets_table', 1),
(13, '2025_08_15_153426_create_tickets_table', 1),
(14, '2025_08_15_183016_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration_min` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `duration_min`, `created_at`, `updated_at`) VALUES
(1, 'The Great Escape', 120, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(2, 'The Batman Begins', 95, '2025-08-15 12:27:36', '2025-08-15 15:29:33'),
(3, 'Inception', 188, '2025-08-15 15:02:32', '2025-08-15 15:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'paid', '2025-08-15 15:22:00', '2025-08-15 15:25:55'),
(2, 2, 'paid', '2025-08-15 15:53:37', '2025-08-15 15:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_item_tickets`
--

CREATE TABLE `order_item_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `screening_id` bigint UNSIGNED NOT NULL,
  `seat_id` bigint UNSIGNED NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_item_tickets`
--

INSERT INTO `order_item_tickets` (`id`, `order_id`, `screening_id`, `seat_id`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, '50000.00', '2025-08-15 15:25:15', '2025-08-15 15:25:15'),
(2, 2, 2, 3, '20000.00', '2025-08-15 15:56:21', '2025-08-15 15:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `method`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'cash', '50000.00', '2025-08-15 15:25:55', '2025-08-15 15:25:55'),
(2, 2, 'cash', '50000.00', '2025-08-15 15:57:55', '2025-08-15 15:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api', 'b714a02ee90c7db1659826259e6ba43905b6bea44bed20188e7d6886c300c7a7', '[\"*\"]', NULL, NULL, '2025-08-15 13:36:26', '2025-08-15 13:36:26'),
(2, 'App\\Models\\User', 2, 'api', '7855a7768e8a6fe75945023303d68770211864011eabeddcca3d4d3973bcdd08', '[\"*\"]', NULL, NULL, '2025-08-15 13:43:04', '2025-08-15 13:43:04'),
(3, 'App\\Models\\User', 2, 'api', 'b16a76ddbaeab209feb515361d956573ee07d2540823567ccf224a45aafded5c', '[\"*\"]', NULL, NULL, '2025-08-15 13:47:20', '2025-08-15 13:47:20'),
(4, 'App\\Models\\User', 2, 'api', '3ff1744c613abe1237c155946e1836ff1e02e5b38cbef68b2c687504ead06a1f', '[\"*\"]', NULL, NULL, '2025-08-15 13:48:24', '2025-08-15 13:48:24'),
(5, 'App\\Models\\User', 2, 'api', '8798402e98dc2078fc119f059d18241e4efcc10dde729c87a6dfde6ea8f36bd1', '[\"*\"]', NULL, NULL, '2025-08-15 13:49:59', '2025-08-15 13:49:59'),
(6, 'App\\Models\\User', 2, 'api', 'bb958125974622e2317a4114531d7a4cce358c1965218b619ef2ae4ca6a038a7', '[\"*\"]', NULL, NULL, '2025-08-15 13:54:32', '2025-08-15 13:54:32'),
(7, 'App\\Models\\User', 2, 'api', '4e16e8ecb505a378d679e908699ec55183f261299abdca7805001a0bf17f9bc6', '[\"*\"]', NULL, NULL, '2025-08-15 13:56:12', '2025-08-15 13:56:12'),
(8, 'App\\Models\\User', 2, 'api', '14039e2856923761abff340b7dd478a3ab40b913762d86dc997cbeb15d3494c4', '[\"*\"]', NULL, NULL, '2025-08-15 14:02:51', '2025-08-15 14:02:51'),
(9, 'App\\Models\\User', 2, 'api', '440a63906a859f4e801968495f62eb6931f91ae7b0e80c50e97251d54be311f8', '[\"*\"]', NULL, NULL, '2025-08-15 14:05:20', '2025-08-15 14:05:20'),
(10, 'App\\Models\\User', 2, 'api', 'aa39b8a34eacd3de18eff467570b17d55682f596bcf95513dd265bb90c10a9e3', '[\"*\"]', NULL, NULL, '2025-08-15 14:20:40', '2025-08-15 14:20:40'),
(11, 'App\\Models\\User', 2, 'api', 'ce64bd2f6a6e8c8ce3e69ee18c922fed481e3e38714ae62df4651d8971959669', '[\"*\"]', '2025-08-15 14:26:17', NULL, '2025-08-15 14:25:47', '2025-08-15 14:26:17'),
(15, 'App\\Models\\User', 2, 'api', '312d46c076dc451f048071290597d6db5c28ae00bfd7a66176e5453d3d9f9cdf', '[\"*\"]', NULL, NULL, '2025-08-15 14:41:22', '2025-08-15 14:41:22'),
(16, 'App\\Models\\User', 1, 'api', 'ccddb2b09c3432d4bc5cd9411ba184d297c130619740dc2e3ee3263f11e977fd', '[\"*\"]', '2025-08-15 15:58:33', NULL, '2025-08-15 14:41:52', '2025-08-15 15:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `screenings`
--

CREATE TABLE `screenings` (
  `id` bigint UNSIGNED NOT NULL,
  `movie_id` bigint UNSIGNED NOT NULL,
  `auditorium_id` bigint UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `screenings`
--

INSERT INTO `screenings` (`id`, `movie_id`, `auditorium_id`, `start_time`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-08-15 22:27:00', '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(2, 2, 1, '2025-08-16 19:30:00', '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(3, 1, 2, '2025-08-15 22:27:00', '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(4, 2, 2, '2025-08-16 19:30:00', '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(5, 2, 2, '2025-08-20 19:00:00', '2025-08-15 15:04:10', '2025-08-15 15:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint UNSIGNED NOT NULL,
  `auditorium_id` bigint UNSIGNED NOT NULL,
  `row_label` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seat_number` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `auditorium_id`, `row_label`, `seat_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'A', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(2, 1, 'A', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(3, 1, 'A', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(4, 1, 'A', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(5, 1, 'A', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(6, 1, 'A', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(7, 1, 'A', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(8, 1, 'A', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(9, 1, 'A', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(10, 1, 'A', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(11, 1, 'B', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(12, 1, 'B', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(13, 1, 'B', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(14, 1, 'B', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(15, 1, 'B', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(16, 1, 'B', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(17, 1, 'B', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(18, 1, 'B', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(19, 1, 'B', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(20, 1, 'B', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(21, 1, 'C', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(22, 1, 'C', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(23, 1, 'C', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(24, 1, 'C', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(25, 1, 'C', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(26, 1, 'C', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(27, 1, 'C', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(28, 1, 'C', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(29, 1, 'C', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(30, 1, 'C', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(31, 1, 'D', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(32, 1, 'D', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(33, 1, 'D', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(34, 1, 'D', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(35, 1, 'D', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(36, 1, 'D', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(37, 1, 'D', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(38, 1, 'D', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(39, 1, 'D', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(40, 1, 'D', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(41, 1, 'E', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(42, 1, 'E', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(43, 1, 'E', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(44, 1, 'E', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(45, 1, 'E', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(46, 1, 'E', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(47, 1, 'E', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(48, 1, 'E', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(49, 1, 'E', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(50, 1, 'E', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(51, 1, 'F', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(52, 1, 'F', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(53, 1, 'F', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(54, 1, 'F', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(55, 1, 'F', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(56, 1, 'F', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(57, 1, 'F', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(58, 1, 'F', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(59, 1, 'F', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(60, 1, 'F', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(61, 1, 'G', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(62, 1, 'G', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(63, 1, 'G', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(64, 1, 'G', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(65, 1, 'G', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(66, 1, 'G', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(67, 1, 'G', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(68, 1, 'G', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(69, 1, 'G', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(70, 1, 'G', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(71, 1, 'H', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(72, 1, 'H', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(73, 1, 'H', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(74, 1, 'H', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(75, 1, 'H', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(76, 1, 'H', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(77, 1, 'H', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(78, 1, 'H', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(79, 1, 'H', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(80, 1, 'H', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(81, 1, 'I', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(82, 1, 'I', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(83, 1, 'I', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(84, 1, 'I', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(85, 1, 'I', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(86, 1, 'I', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(87, 1, 'I', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(88, 1, 'I', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(89, 1, 'I', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(90, 1, 'I', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(91, 1, 'J', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(92, 1, 'J', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(93, 1, 'J', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(94, 1, 'J', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(95, 1, 'J', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(96, 1, 'J', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(97, 1, 'J', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(98, 1, 'J', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(99, 1, 'J', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(100, 1, 'J', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(101, 2, 'A', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(102, 2, 'A', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(103, 2, 'A', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(104, 2, 'A', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(105, 2, 'A', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(106, 2, 'A', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(107, 2, 'A', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(108, 2, 'A', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(109, 2, 'A', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(110, 2, 'A', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(111, 2, 'B', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(112, 2, 'B', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(113, 2, 'B', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(114, 2, 'B', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(115, 2, 'B', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(116, 2, 'B', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(117, 2, 'B', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(118, 2, 'B', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(119, 2, 'B', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(120, 2, 'B', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(121, 2, 'C', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(122, 2, 'C', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(123, 2, 'C', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(124, 2, 'C', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(125, 2, 'C', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(126, 2, 'C', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(127, 2, 'C', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(128, 2, 'C', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(129, 2, 'C', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(130, 2, 'C', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(131, 2, 'D', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(132, 2, 'D', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(133, 2, 'D', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(134, 2, 'D', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(135, 2, 'D', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(136, 2, 'D', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(137, 2, 'D', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(138, 2, 'D', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(139, 2, 'D', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(140, 2, 'D', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(141, 2, 'E', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(142, 2, 'E', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(143, 2, 'E', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(144, 2, 'E', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(145, 2, 'E', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(146, 2, 'E', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(147, 2, 'E', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(148, 2, 'E', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(149, 2, 'E', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(150, 2, 'E', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(151, 2, 'F', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(152, 2, 'F', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(153, 2, 'F', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(154, 2, 'F', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(155, 2, 'F', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(156, 2, 'F', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(157, 2, 'F', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(158, 2, 'F', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(159, 2, 'F', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(160, 2, 'F', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(161, 2, 'G', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(162, 2, 'G', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(163, 2, 'G', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(164, 2, 'G', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(165, 2, 'G', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(166, 2, 'G', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(167, 2, 'G', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(168, 2, 'G', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(169, 2, 'G', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(170, 2, 'G', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(171, 2, 'H', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(172, 2, 'H', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(173, 2, 'H', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(174, 2, 'H', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(175, 2, 'H', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(176, 2, 'H', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(177, 2, 'H', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(178, 2, 'H', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(179, 2, 'H', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(180, 2, 'H', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(181, 2, 'I', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(182, 2, 'I', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(183, 2, 'I', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(184, 2, 'I', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(185, 2, 'I', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(186, 2, 'I', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(187, 2, 'I', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(188, 2, 'I', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(189, 2, 'I', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(190, 2, 'I', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(191, 2, 'J', 1, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(192, 2, 'J', 2, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(193, 2, 'J', 3, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(194, 2, 'J', 4, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(195, 2, 'J', 5, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(196, 2, 'J', 6, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(197, 2, 'J', 7, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(198, 2, 'J', 8, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(199, 2, 'J', 9, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(200, 2, 'J', 10, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(201, 1, 'K', 1, '2025-08-15 15:46:05', '2025-08-15 15:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CGV', '2025-08-15 12:27:36', '2025-08-15 15:35:34'),
(2, 'XXI', '2025-08-15 15:34:27', '2025-08-15 15:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `order_item_ticket_id` bigint UNSIGNED NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `order_item_ticket_id`, `barcode`, `created_at`, `updated_at`) VALUES
(1, 1, 'TIX-000001-MKBJBL', '2025-08-15 15:25:55', '2025-08-15 15:25:55'),
(2, 2, 'TIX-000002-XBWJRV', '2025-08-15 15:57:55', '2025-08-15 15:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$Yygrccxe4sJFdb3gPgbt8Od9Nc7Nzbk9UG.N16fJsvXNC3CHTWCB2', NULL, '2025-08-15 12:27:36', '2025-08-15 12:27:36'),
(2, 'Tes', 'Tes@example.com', NULL, '$2y$12$OsoMFRIYCVeyFQp9Bb9QRuFB.FzxONri2DqMfM0SoJVZcfGaZPlb6', NULL, '2025-08-15 13:42:26', '2025-08-15 13:42:26'),
(3, 'Tis', 'Tis@example.com', NULL, '$2y$12$s0lFa/jCIpGvX03MB2pJAelNUAVGHXShIOdCOTB0Hr2TqXpAR9sYS', NULL, '2025-08-15 13:47:44', '2025-08-15 13:47:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditoriums`
--
ALTER TABLE `auditoriums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auditoriums_theater_id_foreign` (`theater_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_item_tickets`
--
ALTER TABLE `order_item_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_item_tickets_screening_id_seat_id_unique` (`screening_id`,`seat_id`),
  ADD KEY `order_item_tickets_order_id_foreign` (`order_id`),
  ADD KEY `order_item_tickets_seat_id_foreign` (`seat_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `screenings`
--
ALTER TABLE `screenings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screenings_movie_id_foreign` (`movie_id`),
  ADD KEY `screenings_auditorium_id_start_time_index` (`auditorium_id`,`start_time`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seats_auditorium_id_row_label_seat_number_unique` (`auditorium_id`,`row_label`,`seat_number`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_barcode_unique` (`barcode`),
  ADD KEY `tickets_order_item_ticket_id_foreign` (`order_item_ticket_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auditoriums`
--
ALTER TABLE `auditoriums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_item_tickets`
--
ALTER TABLE `order_item_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `screenings`
--
ALTER TABLE `screenings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auditoriums`
--
ALTER TABLE `auditoriums`
  ADD CONSTRAINT `auditoriums_theater_id_foreign` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_item_tickets`
--
ALTER TABLE `order_item_tickets`
  ADD CONSTRAINT `order_item_tickets_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_tickets_screening_id_foreign` FOREIGN KEY (`screening_id`) REFERENCES `screenings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_tickets_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `screenings`
--
ALTER TABLE `screenings`
  ADD CONSTRAINT `screenings_auditorium_id_foreign` FOREIGN KEY (`auditorium_id`) REFERENCES `auditoriums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `screenings_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_auditorium_id_foreign` FOREIGN KEY (`auditorium_id`) REFERENCES `auditoriums` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_order_item_ticket_id_foreign` FOREIGN KEY (`order_item_ticket_id`) REFERENCES `order_item_tickets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
