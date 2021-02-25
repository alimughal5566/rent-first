-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2021 at 01:32 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentfirst`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

CREATE TABLE `advertising` (
  `id` int(10) UNSIGNED NOT NULL,
  `integration` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unitSlot or autoFit',
  `is_responsive` tinyint(1) DEFAULT '0',
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `provider_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Translated in the languages files',
  `tracking_code_large` mediumtext COLLATE utf8_unicode_ci,
  `tracking_code_medium` mediumtext COLLATE utf8_unicode_ci,
  `tracking_code_small` mediumtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`id`, `integration`, `is_responsive`, `slug`, `provider_name`, `description`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'unitSlot', 0, 'top', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 1),
(2, 'unitSlot', 0, 'bottom', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 1),
(3, 'autoFit', 1, 'auto', 'Google AdSense', 'advertising_autoFit_hint', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `logo`, `created_at`, `updated_at`) VALUES
(7, 'banner.jpg', '2021-02-24 01:38:07', '2021-02-24 01:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `is_for_permanent` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `translation_lang`, `translation_of`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `is_for_permanent`, `active`) VALUES
(1, 'en', 1, NULL, 'Rent Automobiles', 'automobiles', NULL, 'app/categories/skin-green/car.png', NULL, 984, 993, 0, 'classified', 0, 1),
(2, 'en', 2, 1, 'Cars', 'cars', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 2, 3, 1, 'classified', 0, 1),
(3, 'en', 3, 1, 'Buses & Minibus', 'buses-and-minibus', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 3, 4, 1, 'classified', 0, 1),
(4, 'en', 4, 1, 'Heavy Equipment', 'heavy-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 16, 17, 2, 'classified', 0, 1),
(5, 'en', 5, 1, 'Motorcycles & Scooters', 'motorcycles-and-scooters', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 5, 6, 1, 'classified', 0, 1),
(6, 'en', 6, 1, 'Trucks & Trailers', 'trucks-and-trailers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 6, 7, 1, 'classified', 0, 1),
(7, 'en', 7, 1, 'Vehicle Parts & Accessories', 'car-parts-and-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 18, 19, 2, 'classified', 0, 1),
(8, 'en', 8, 1, 'Watercraft & Boats', 'watercraft-and-boats', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 20, 21, 2, 'classified', 0, 1),
(9, 'en', 9, NULL, 'Phones & Tablets', 'phones-and-tablets', NULL, 'app/categories/skin-green/mobile-alt.png', 'icon-laptop', 775, 781, 0, 'classified', 0, 0),
(10, 'en', 10, 9, 'Mobile Phones', 'mobile-phones', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 29, 30, 1, 'classified', 0, 0),
(11, 'en', 11, 9, 'Accessories for Mobile Phones & Tablets', 'mobile-phones-tablets-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 31, 32, 1, 'classified', 0, 0),
(12, 'en', 12, 9, 'Smart Watches & Trackers', 'smart-watches-and-trackers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 33, 34, 1, 'classified', 0, 0),
(13, 'en', 13, 9, 'Tablets', 'tablets', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 35, 36, 1, 'classified', 0, 0),
(14, 'en', 14, NULL, 'Electronics', 'electronics', NULL, 'app/categories/skin-green/fa-laptop.png', 'icon-theatre', 782, 799, 0, 'classified', 0, 0),
(15, 'en', 15, 14, 'Accessories & Supplies for Electronics', 'accessories-supplies for Electronics', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 55, 56, 1, 'classified', 0, 0),
(16, 'en', 16, 14, 'Laptops & Computers', 'laptops-and-computers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 57, 58, 1, 'classified', 0, 0),
(17, 'en', 17, 14, 'TV & DVD Equipment', 'tv-dvd-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 59, 60, 1, 'classified', 0, 0),
(18, 'en', 18, 14, 'Audio & Music Equipment', 'audio-music-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 61, 62, 1, 'classified', 0, 0),
(19, 'en', 19, 14, 'Computer Accessories', 'computer-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 63, 64, 1, 'classified', 0, 0),
(20, 'en', 20, 14, 'Computer Hardware', 'computer-hardware', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 65, 66, 1, 'classified', 0, 0),
(21, 'en', 21, 14, 'Computer Monitors', 'computer-monitors', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 67, 68, 1, 'classified', 0, 0),
(22, 'en', 22, 14, 'Headphones', 'headphones', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 69, 70, 1, 'classified', 0, 0),
(23, 'en', 23, 14, 'Networking Products', 'networking-products', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 71, 72, 1, 'classified', 0, 0),
(24, 'en', 24, 14, 'Photo & Video Cameras', 'photo-video-cameras', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 73, 74, 1, 'classified', 0, 0),
(25, 'en', 25, 14, 'Printers & Scanners', 'printers-and-scanners', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 75, 76, 1, 'classified', 0, 0),
(26, 'en', 26, 14, 'Security & Surveillance', 'security-and-surveillance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 77, 78, 1, 'classified', 0, 0),
(27, 'en', 27, 14, 'Software', 'software', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 79, 80, 1, 'classified', 0, 0),
(28, 'en', 28, 14, 'Video Games', 'video-games', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 81, 82, 1, 'classified', 0, 0),
(29, 'en', 29, 14, 'Game Consoles', 'video-game-consoles', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 83, 84, 1, 'classified', 0, 0),
(30, 'en', 30, NULL, 'Furniture & Appliances', 'furniture-appliances', NULL, 'app/categories/skin-green/couch.png', 'icon-basket-1', 800, 808, 0, 'classified', 0, 0),
(31, 'en', 31, 30, 'Furniture - Tableware', 'furniture-tableware', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 94, 95, 1, 'classified', 0, 0),
(32, 'en', 32, 30, 'Antiques - Art - Decoration', 'antiques-art-decoration', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 96, 97, 1, 'classified', 0, 0),
(33, 'en', 33, 30, 'Appliances', 'appliances', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 98, 99, 1, 'classified', 0, 0),
(34, 'en', 34, 30, 'Garden', 'garden', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 100, 101, 1, 'classified', 0, 0),
(35, 'en', 35, 30, 'Toys - Games - Figurines', 'toys-games-figurines', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 102, 103, 1, 'classified', 0, 0),
(36, 'en', 36, 30, 'Wine & Gourmet - Recipes', 'wine-gourmet-recipes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 104, 105, 1, 'classified', 0, 0),
(37, 'en', 37, NULL, 'Rent Real Estate', 'real-estate', NULL, 'app/categories/skin-green/fa-home.png', 'icon-home', 994, 1004, 0, 'classified', 0, 1),
(38, 'en', 38, 37, 'Houses & Apartments For Rent', 'houses-apartments-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 108, 109, 1, 'classified', 0, 1),
(39, 'en', 39, 37, 'Houses & Apartments For Sale', 'houses-apartments-for-sale', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 123, 124, 2, 'classified', 0, 1),
(40, 'en', 40, 37, 'Land & Plots for Rent', 'land-and-plots-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 110, 111, 1, 'classified', 0, 1),
(41, 'en', 41, 37, 'Land & Plots For Sale', 'land-and-plots-for-sale', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 125, 126, 2, 'classified', 0, 1),
(42, 'en', 42, 37, 'Commercial Property For Rent', 'commercial-property-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 112, 113, 1, 'classified', 0, 1),
(43, 'en', 43, 37, 'Commercial Property For Sale', 'commercial-properties', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 127, 128, 2, 'classified', 0, 1),
(44, 'en', 44, 37, 'Event centres, Venues and Workstations', 'event-centers-and-venues', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 114, 115, 1, 'classified', 0, 1),
(45, 'en', 45, 37, 'Short Rental', 'temporary-and-vacation-rentals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 115, 116, 1, 'classified', 0, 1),
(46, 'en', 46, NULL, 'Animals & Pets', 'animals-and-pets', NULL, 'app/categories/skin-green/paw.png', 'icon-guidedog', 809, 818, 0, 'classified', 0, 0),
(47, 'en', 47, 46, 'Birds', 'birds', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 139, 140, 1, 'classified', 0, 0),
(48, 'en', 48, 46, 'Cats & Kittens', 'cats-and-kittens', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 141, 142, 1, 'classified', 0, 0),
(49, 'en', 49, 46, 'Dogs', 'dogs-and-puppies', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 143, 144, 1, 'classified', 0, 0),
(50, 'en', 50, 46, 'Fish', 'fish', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 145, 146, 1, 'classified', 0, 0),
(51, 'en', 51, 46, 'Pet\'s Accessories', 'pets-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 147, 148, 1, 'classified', 0, 0),
(52, 'en', 52, 46, 'Reptiles', 'reptiles', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 149, 150, 1, 'classified', 0, 0),
(53, 'en', 53, 46, 'Other Animals', 'other-animals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 151, 152, 1, 'classified', 0, 0),
(54, 'en', 54, NULL, 'Fashion', 'fashion', NULL, 'app/categories/skin-green/tshirt.png', 'icon-heart', 819, 828, 0, 'classified', 0, 0),
(55, 'en', 55, 54, 'Bags', 'bags', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 163, 164, 1, 'classified', 0, 0),
(56, 'en', 56, 54, 'Clothing', 'clothing', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 165, 166, 1, 'classified', 0, 0),
(57, 'en', 57, 54, 'Clothing Accessories', 'clothing-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 167, 168, 1, 'classified', 0, 0),
(58, 'en', 58, 54, 'Jewelry', 'jewelry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 169, 170, 1, 'classified', 0, 0),
(59, 'en', 59, 54, 'Shoes', 'shoes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 171, 172, 1, 'classified', 0, 0),
(60, 'en', 60, 54, 'Watches', 'watches', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 173, 174, 1, 'classified', 0, 0),
(61, 'en', 61, 54, 'Wedding Wear & Accessories', 'wedding-wear-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 175, 176, 1, 'classified', 0, 0),
(62, 'en', 62, NULL, 'Beauty & Well being', 'beauty-well-being', NULL, 'app/categories/skin-green/spa.png', 'icon-search', 829, 841, 0, 'classified', 0, 0),
(63, 'en', 63, 62, 'Bath & Body', 'bath-and-body', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 190, 191, 1, 'classified', 0, 0),
(64, 'en', 64, 62, 'Fragrance', 'fragrance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 192, 193, 1, 'classified', 0, 0),
(65, 'en', 65, 62, 'Hair Beauty', 'hair-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 194, 195, 1, 'classified', 0, 0),
(66, 'en', 66, 62, 'Makeup', 'makeup', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 196, 197, 1, 'classified', 0, 0),
(67, 'en', 67, 62, 'Sexual Wellness', 'sexual-wellness', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 198, 199, 1, 'classified', 0, 0),
(68, 'en', 68, 62, 'Skin Care', 'skin-care', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 200, 201, 1, 'classified', 0, 0),
(69, 'en', 69, 62, 'Tobacco Accessories', 'tobacco-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 202, 203, 1, 'classified', 0, 0),
(70, 'en', 70, 62, 'Tools & Accessories', 'tools-and-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 204, 205, 1, 'classified', 0, 0),
(71, 'en', 71, 62, 'Vitamins & Supplements', 'vitamins-and-supplements', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 206, 207, 1, 'classified', 0, 0),
(72, 'en', 72, 62, 'Pro Massage', 'pro-massage', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 208, 209, 1, 'classified', 0, 0),
(73, 'en', 73, NULL, 'Jobs', 'jobs', NULL, 'app/categories/skin-green/mfglabs-users.png', 'icon-megaphone-1', 842, 867, 0, 'job-offer', 0, 0),
(74, 'en', 74, 73, 'Agriculture - Environment', 'agriculture-environment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 236, 237, 1, 'job-offer', 0, 0),
(75, 'en', 75, 73, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 238, 239, 1, 'job-offer', 0, 0),
(76, 'en', 76, 73, 'Automotive - Mechanic', 'automotive-mechanic', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 240, 241, 1, 'job-offer', 0, 0),
(77, 'en', 77, 73, 'BTP - Construction - Building', 'btp-construction-building', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 242, 243, 1, 'job-offer', 0, 0),
(78, 'en', 78, 73, 'Trade - Business Services', 'trade-business-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 244, 245, 1, 'job-offer', 0, 0),
(79, 'en', 79, 73, 'Commercial - Sale Jobs', 'commercial-sale-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 246, 247, 1, 'job-offer', 0, 0),
(80, 'en', 80, 73, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 248, 249, 1, 'job-offer', 0, 0),
(81, 'en', 81, 73, 'Steering - Manager', 'steering-manager', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 250, 251, 1, 'job-offer', 0, 0),
(82, 'en', 82, 73, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 252, 253, 1, 'job-offer', 0, 0),
(83, 'en', 83, 73, 'Public Service Jobs', 'public-service-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 254, 255, 1, 'job-offer', 0, 0),
(84, 'en', 84, 73, 'Real Estate Jobs', 'real-estate-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 256, 257, 1, 'job-offer', 0, 0),
(85, 'en', 85, 73, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 258, 259, 1, 'job-offer', 0, 0),
(86, 'en', 86, 73, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 260, 261, 1, 'job-offer', 0, 0),
(87, 'en', 87, 73, 'Industry, Production & engineering', 'industry-production-engineering', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 262, 263, 1, 'job-offer', 0, 0),
(88, 'en', 88, 73, 'Marketing - Communication', 'marketing-communication', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 264, 265, 1, 'job-offer', 0, 0),
(89, 'en', 89, 73, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 266, 267, 1, 'job-offer', 0, 0),
(90, 'en', 90, 73, 'HR - Training - Education', 'hr-training-education', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 268, 269, 1, 'job-offer', 0, 0),
(91, 'en', 91, 73, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 270, 271, 1, 'job-offer', 0, 0),
(92, 'en', 92, 73, 'Security - Guarding', 'security-guarding', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 272, 273, 1, 'job-offer', 0, 0),
(93, 'en', 93, 73, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 274, 275, 1, 'job-offer', 0, 0),
(94, 'en', 94, 73, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 276, 277, 1, 'job-offer', 0, 0),
(95, 'en', 95, 73, 'Transportation - Logistics', 'transportation-logistics', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 278, 279, 1, 'job-offer', 0, 0),
(96, 'en', 96, 73, 'Others Jobs Offer', 'others-jobs-offer', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 280, 281, 1, 'job-offer', 0, 0),
(97, 'en', 97, NULL, 'Services', 'services', NULL, 'app/categories/skin-green/ion-clipboard.png', 'fa fa-briefcase', 868, 886, 0, 'classified', 0, 0),
(98, 'en', 98, 97, 'Casting, Model, Photographer', 'casting-model-photographer', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 301, 302, 1, 'classified', 0, 0),
(99, 'en', 99, 97, 'Carpooling', 'carpooling', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 303, 304, 1, 'classified', 0, 0),
(100, 'en', 100, 97, 'Moving, Furniture Guard', 'moving-furniture-guard', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 305, 306, 1, 'classified', 0, 0),
(101, 'en', 101, 97, 'Destocking - Commercial', 'destocking-commercial', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 307, 308, 1, 'classified', 0, 0),
(102, 'en', 102, 97, 'Industrial Equipment', 'industrial-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 309, 310, 1, 'classified', 0, 0),
(103, 'en', 103, 97, 'Aesthetics, Hairstyling', 'aesthetics-hairstyling', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 311, 312, 1, 'classified', 0, 0),
(104, 'en', 104, 97, 'Materials and Equipment Pro', 'materials-and-equipment-pro', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 313, 314, 1, 'classified', 0, 0),
(105, 'en', 105, 97, 'Event Organization Services', 'event-organization-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 315, 316, 1, 'classified', 0, 0),
(106, 'en', 106, 97, 'Service Provision', 'service-provision', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 317, 318, 1, 'classified', 0, 0),
(107, 'en', 107, 97, 'Health, Beauty', 'health-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 319, 320, 1, 'classified', 0, 0),
(108, 'en', 108, 97, 'Artisan, Troubleshooting, Handyman', 'artisan-troubleshooting-handyman', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 321, 322, 1, 'classified', 0, 0),
(109, 'en', 109, 97, 'Computing Services', 'computing-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 323, 324, 1, 'classified', 0, 0),
(110, 'en', 110, 97, 'Tourism and Travel Services', 'tourism-and-travel-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 325, 326, 1, 'classified', 0, 0),
(111, 'en', 111, 97, 'Translation, Writing', 'translation-writing', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 327, 328, 1, 'classified', 0, 0),
(112, 'en', 112, 97, 'Construction - Renovation - Carpentry', 'construction-renovation-carpentry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 329, 330, 1, 'classified', 0, 0),
(113, 'en', 113, 97, 'Other services', 'other-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 331, 332, 1, 'classified', 0, 0),
(114, 'en', 114, NULL, 'Learning', 'learning', NULL, 'app/categories/skin-green/fa-graduation-cap.png', 'icon-book-open', 887, 896, 0, 'classified', 0, 0),
(115, 'en', 115, 114, 'Language Classes', 'language-classes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 343, 344, 1, 'classified', 0, 0),
(116, 'en', 116, 114, 'Computer Courses', 'computer-courses', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 345, 346, 1, 'classified', 0, 0),
(117, 'en', 117, 114, 'Tutoring, Private Lessons', 'tutoring-private-lessons', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 347, 348, 1, 'classified', 0, 0),
(118, 'en', 118, 114, 'Vocational Training', 'vocational-training', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 349, 350, 1, 'classified', 0, 0),
(119, 'en', 119, 114, 'Maths, Physics, Chemistry', 'maths-physics-chemistry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 351, 352, 1, 'classified', 0, 0),
(120, 'en', 120, 114, 'Music, Theatre, Dance', 'music-theatre-dance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 353, 354, 1, 'classified', 0, 0),
(121, 'en', 121, 114, 'School support', 'school-support', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 355, 356, 1, 'classified', 0, 0),
(122, 'en', 122, NULL, 'Local Events', 'local-events', NULL, 'app/categories/skin-green/calendar-alt.png', 'icon-megaphone-1', 897, 911, 0, 'classified', 0, 0),
(123, 'en', 123, 122, 'Concerts & Festivals', 'concerts-and-festivals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 372, 373, 1, 'classified', 0, 0),
(124, 'en', 124, 122, 'Networking & Meetups', 'networking-and-meetups', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 374, 375, 1, 'classified', 0, 0),
(125, 'en', 125, 122, 'Sports & Outdoors', 'sports-and-outdoors', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 376, 377, 1, 'classified', 0, 0),
(126, 'en', 126, 122, 'Trade Shows & Conventions', 'trade-shows-conventions', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 378, 379, 1, 'classified', 0, 0),
(127, 'en', 127, 122, 'Training & Seminars', 'training-and-seminars', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 380, 381, 1, 'classified', 0, 0),
(128, 'en', 128, 122, 'Ceremonies', 'ceremonies', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 382, 383, 1, 'classified', 0, 0),
(129, 'en', 129, 122, 'Conferences', 'conferences', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 384, 385, 1, 'classified', 0, 0),
(130, 'en', 130, 122, 'Weddings', 'weddings', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 386, 387, 1, 'classified', 0, 0),
(131, 'en', 131, 122, 'Birthdays', 'birthdays', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 388, 389, 1, 'classified', 0, 0),
(132, 'en', 132, 122, 'Family Events', 'family-events', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 390, 391, 1, 'classified', 0, 0),
(133, 'en', 133, 122, 'Nightlife', 'nightlife', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 392, 393, 1, 'classified', 0, 0),
(134, 'en', 134, 122, 'All others events', 'all-others-events', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 394, 395, 1, 'classified', 0, 0),
(135, 'en', 135, NULL, 'For Rent', 'for-rent', NULL, 'app/categories/custom/305f3f8ff0ed61b5808d9507c1406983.png', NULL, 961, 983, 0, 'classified', 0, 0),
(136, 'en', 136, NULL, 'For Sale', 'for-sale', NULL, 'app/categories/custom/cd484ca4798a2c0da96127f74b04e354.png', NULL, 912, 939, 0, 'classified', 0, 0),
(137, 'en', 137, 136, 'Automobiles', 'automobiles-1', NULL, 'app/categories/custom/bb36da8df727677db0c2944b7db22f10.png', NULL, 611, 626, 1, NULL, 0, 0),
(138, 'en', 138, 137, 'Cars', 'cars-1', NULL, NULL, NULL, 586, 587, 2, NULL, 0, 1),
(139, 'en', 139, 137, 'Buses & Minibus', 'buses-minibus', NULL, NULL, NULL, 588, 589, 2, NULL, 0, 1),
(140, 'en', 140, 137, 'Motorcycles & Scooters', 'motorcycles-scooters', NULL, NULL, NULL, 590, 591, 2, NULL, 0, 1),
(141, 'en', 141, 137, 'Trucks & Trailers', 'trucks-trailers', NULL, NULL, NULL, 592, 593, 2, NULL, 0, 1),
(142, 'en', 142, 137, 'Heavy Equipment', 'heavy-equipment-1', NULL, NULL, NULL, 594, 595, 2, NULL, 0, 1),
(143, 'en', 143, 137, 'Vehicle Parts & Accessories', 'vehicle-parts-accessories', NULL, NULL, NULL, 596, 597, 2, NULL, 0, 1),
(144, 'en', 144, 137, 'Watercraft & Boats', 'watercraft-boats', NULL, NULL, NULL, 598, 599, 2, NULL, 0, 1),
(145, 'en', 145, 136, 'Real estate', 'real-estate-1', NULL, NULL, NULL, 627, 636, 1, NULL, 0, 0),
(146, 'en', 146, 145, 'Houses & Apartments For Sale', 'houses-apartments-for-sale-1', NULL, NULL, NULL, 602, 603, 2, NULL, 0, 1),
(147, 'en', 147, 145, 'Land & Plots For Sale', 'land-plots-for-sale', NULL, NULL, NULL, 604, 605, 2, NULL, 0, 1),
(148, 'en', 148, 145, 'Commercial Property For Sale', 'commercial-property-for-sale', NULL, NULL, NULL, 606, 607, 2, NULL, 0, 1),
(149, 'en', 149, 145, 'Event centres, Venues and Workstations', 'event-centres-venues-and-workstations', NULL, NULL, NULL, 608, 609, 2, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_field`
--

CREATE TABLE `category_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `disabled_in_subcategories` tinyint(1) UNSIGNED DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_field`
--

INSERT INTO `category_field` (`id`, `category_id`, `field_id`, `disabled_in_subcategories`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 1, 0, NULL, 2, 3, 1),
(2, 1, 2, 0, NULL, 4, 5, 1),
(3, 1, 3, 0, NULL, 6, 7, 1),
(4, 1, 4, 0, NULL, 14, 15, 1),
(5, 1, 5, 0, NULL, 8, 9, 1),
(6, 1, 6, 0, NULL, 16, 17, 1),
(7, 1, 7, 0, NULL, 10, 11, 1),
(8, 1, 8, 0, NULL, 12, 13, 1),
(9, 9, 14, 0, NULL, 4, 5, 1),
(10, 9, 15, 0, NULL, 2, 3, 1),
(11, 14, 16, 0, NULL, 4, 5, 1),
(12, 14, 17, 0, NULL, 2, 3, 1),
(13, 30, 8, 0, NULL, NULL, NULL, NULL),
(15, 37, 10, 0, NULL, 4, 5, 1),
(16, 37, 11, 0, NULL, 8, 9, 1),
(17, 37, 12, 0, NULL, 10, 11, 1),
(18, 37, 13, 0, NULL, 6, 7, 1),
(19, 54, 8, 0, NULL, NULL, NULL, NULL),
(20, 73, 18, 0, NULL, NULL, NULL, NULL),
(21, 73, 19, 0, NULL, NULL, NULL, NULL),
(22, 73, 20, 0, NULL, NULL, NULL, NULL),
(23, 122, 21, 0, NULL, NULL, NULL, NULL),
(24, 122, 22, 0, NULL, NULL, NULL, NULL),
(25, 122, 23, 0, NULL, NULL, NULL, NULL),
(26, 1, 27, 0, NULL, NULL, NULL, NULL),
(27, 137, 1, 0, NULL, NULL, NULL, NULL),
(28, 137, 2, 0, NULL, NULL, NULL, NULL),
(29, 137, 3, 0, NULL, NULL, NULL, NULL),
(30, 137, 5, 0, NULL, NULL, NULL, NULL),
(31, 137, 7, 0, NULL, NULL, NULL, NULL),
(32, 137, 8, 0, NULL, NULL, NULL, NULL),
(33, 137, 4, 0, NULL, NULL, NULL, NULL),
(34, 137, 6, 0, NULL, NULL, NULL, NULL),
(36, 145, 10, 0, NULL, NULL, NULL, NULL),
(37, 145, 13, 0, NULL, NULL, NULL, NULL),
(38, 145, 11, 0, NULL, NULL, NULL, NULL),
(39, 145, 12, 0, NULL, NULL, NULL, NULL),
(40, 37, 27, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `latitude` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin2_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `time_zone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `longitude`, `latitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1, 'PK', 'Chuhar Jamali', 'Chuhar Jamali', 67.99, 24.39, 'P', 'PPL', 'PK.05', 'PK.05.10300608', 15781, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(2, 'PK', 'Rawala Kot', 'Rawala Kot', 73.76, 33.86, 'P', 'PPLA2', 'PK.06', 'PK.06.1167717', 50000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(3, 'PK', 'Pir Jo Goth', 'Pir Jo Goth', 68.62, 27.59, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 35537, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(4, 'PK', 'Khairpur Mir’s', 'Khairpur Mir\'s', 68.76, 27.53, 'P', 'PPLA2', 'PK.05', 'PK.05.1174349', 124602, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(5, 'PK', 'Adilpur', 'Adilpur', 69.32, 27.94, 'P', 'PPL', 'PK.05', 'PK.05.7418822', 8247, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(6, 'PK', 'Zhob', 'Zhob', 69.45, 31.34, 'P', 'PPLA2', 'PK.02', 'PK.02.1162104', 50537, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(7, 'PK', 'Zaida', 'Zaida', 72.47, 34.06, 'P', 'PPL', 'PK.03', 'PK.03.7419055', 26787, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(8, 'PK', 'Zahir Pir', 'Zahir Pir', 70.52, 28.81, 'P', 'PPL', 'PK.04', 'PK.04.1167458', 34121, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(9, 'PK', 'Zafarwal', 'Zafarwal', 74.90, 32.34, 'P', 'PPL', 'PK.04', 'PK.04.7418968', 23078, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(10, 'PK', 'Yazman', 'Yazman', 71.74, 29.12, 'P', 'PPL', 'PK.04', 'PK.04.1183876', 24580, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(11, 'PK', 'Wazirabad', 'Wazirabad', 74.12, 32.44, 'P', 'PPL', 'PK.04', 'PK.04.1177658', 102444, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(12, 'PK', 'Chak Five Hundred Seventy-five', 'Chak Five Hundred Seventy-five', 73.83, 31.55, 'P', 'PPL', 'PK.04', 'PK.04.7419159', 24295, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(13, 'PK', 'Warah', 'Warah', 67.80, 27.45, 'P', 'PPL', 'PK.05', 'PK.05.9034783', 18724, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(14, 'PK', 'Vihari', 'Vihari', 72.36, 30.04, 'P', 'PPLA2', 'PK.04', 'PK.04.10344547', 112840, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(15, 'PK', 'Utmanzai', 'Utmanzai', 71.76, 34.19, 'P', 'PPL', 'PK.03', 'PK.03.7419051', 29423, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(16, 'PK', 'Uthal', 'Uthal', 66.62, 25.81, 'P', 'PPLA2', 'PK.02', 'PK.02.1172115', 16483, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(17, 'PK', 'Usta Muhammad', 'Usta Muhammad', 68.04, 28.18, 'P', 'PPL', 'PK.02', 'PK.02.6641922', 43983, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(18, 'PK', 'Umarkot', 'Umarkot', 69.74, 25.36, 'P', 'PPLA2', 'PK.05', 'PK.05.9072726', 42074, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(19, 'PK', 'Ubauro', 'Ubauro', 69.73, 28.16, 'P', 'PPL', 'PK.05', 'PK.05.7418822', 23462, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(20, 'PK', 'Turbat', 'Turbat', 63.05, 26.00, 'P', 'PPLA2', 'PK.02', 'PK.02.1163052', 75694, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(21, 'PK', 'Tordher', 'Tordher', 72.29, 33.99, 'P', 'PPL', 'PK.03', 'PK.03.7419055', 150000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(22, 'PK', 'Topi', 'Topi', 72.62, 34.07, 'P', 'PPL', 'PK.03', 'PK.03.7419055', 36340, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(23, 'PK', 'Toba Tek Singh', 'Toba Tek Singh', 72.48, 30.97, 'P', 'PPLA2', 'PK.04', 'PK.04.7331706', 69064, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(24, 'PK', 'Thul', 'Thul', 68.78, 28.24, 'P', 'PPL', 'PK.05', 'PK.05.1176514', 34472, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(25, 'PK', 'Thatta', 'Thatta', 67.92, 24.75, 'P', 'PPLA2', 'PK.05', 'PK.05.1163570', 44302, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(26, 'PK', 'Tharu Shah', 'Tharu Shah', 68.12, 26.94, 'P', 'PPL', 'PK.05', 'PK.05.7352189', 17698, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(27, 'PK', 'Taunsa', 'Taunsa', 70.65, 30.70, 'P', 'PPL', 'PK.04', 'PK.04.1180287', 44869, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(28, 'PK', 'Tank', 'Tank', 70.38, 32.22, 'P', 'PPLA2', 'PK.03', 'PK.03.7419040', 38488, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(29, 'PK', 'Tangwani', 'Tangwani', 69.00, 28.28, 'P', 'PPL', 'PK.05', 'PK.05.9035095', 9255, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(30, 'PK', 'Tangi', 'Tangi', 71.65, 34.30, 'P', 'PPL', 'PK.03', 'PK.03.7419051', 29444, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(31, 'PK', 'Tando Muhammad Khan', 'Tando Muhammad Khan', 68.54, 25.12, 'P', 'PPLA2', 'PK.05', 'PK.05.9625902', 72659, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(32, 'PK', 'Tando Jam', 'Tando Jam', 68.53, 25.43, 'P', 'PPL', 'PK.05', 'PK.05.1176733', 31612, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(33, 'PK', 'Tando Bago', 'Tando Bago', 68.97, 24.79, 'P', 'PPL', 'PK.05', 'PK.05.1184051', 14095, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(34, 'PK', 'Tando Allahyar', 'Tando Allahyar', 68.72, 25.46, 'P', 'PPLA2', 'PK.05', 'PK.05.9625763', 127202, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(35, 'PK', 'Tando Adam', 'Tando Adam', 68.66, 25.77, 'P', 'PPL', 'PK.05', 'PK.05.1166162', 125598, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(36, 'PK', 'Tandlianwala', 'Tandlianwala', 73.13, 31.03, 'P', 'PPL', 'PK.04', 'PK.04.1179399', 38285, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(37, 'PK', 'Talhar', 'Talhar', 68.81, 24.88, 'P', 'PPL', 'PK.05', 'PK.05.9625902', 21154, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(38, 'PK', 'Talamba', 'Talamba', 72.24, 30.53, 'P', 'PPL', 'PK.04', 'PK.04.7418890', 28151, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(39, 'PK', 'Talagang', 'Talagang', 72.42, 32.93, 'P', 'PPL', 'PK.04', 'PK.04.7418964', 44960, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(40, 'PK', 'Thal', 'Thal', 72.24, 35.48, 'P', 'PPL', 'PK.03', 'PK.03.1179754', 29331, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(41, 'PK', 'Swabi', 'Swabi', 72.47, 34.12, 'P', 'PPLA2', 'PK.03', 'PK.03.7419055', 97363, 'Asia/Karachi', 1, '2019-12-19 23:00:00', '2019-12-19 23:00:00'),
(42, 'PK', 'Surkhpur', 'Surkhpur', 74.45, 32.72, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 20000, 'Asia/Karachi', 1, '2018-09-03 23:00:00', '2018-09-03 23:00:00'),
(43, 'PK', 'Surab', 'Surab', 66.26, 28.49, 'P', 'PPL', 'PK.02', 'PK.02.1175293', 13104, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(44, 'PK', 'Sukkur', 'Sukkur', 68.86, 27.70, 'P', 'PPLA2', 'PK.05', 'PK.05.1164407', 417767, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(45, 'PK', 'Sukheke Mandi', 'Sukheke Mandi', 73.51, 31.87, 'P', 'PPL', 'PK.04', 'PK.04.7418962', 32836, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(46, 'PK', 'Sohbatpur', 'Sohbatpur', 68.54, 28.52, 'P', 'PPL', 'PK.02', 'PK.02.11744842', 8940, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(47, 'PK', 'Sodhri', 'Sodhri', 74.18, 32.46, 'P', 'PPL', 'PK.04', 'PK.04.1177658', 15977, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(48, 'PK', 'Sobhodero', 'Sobhodero', 68.40, 27.30, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 14623, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(49, 'PK', 'Sīta Road', 'Sita Road', 67.85, 27.03, 'P', 'PPL', 'PK.05', 'PK.05.1180802', 27587, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(50, 'PK', 'Sinjhoro', 'Sinjhoro', 68.81, 26.03, 'P', 'PPL', 'PK.05', 'PK.05.1166162', 15970, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(51, 'PK', 'Sillanwali', 'Sillanwali', 72.54, 31.83, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 27023, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(52, 'PK', 'Sibi', 'Sibi', 67.88, 29.54, 'P', 'PPLA2', 'PK.02', 'PK.02.1164895', 64069, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(53, 'PK', 'Sialkot', 'Sialkot', 74.53, 32.49, 'P', 'PPLA2', 'PK.04', 'PK.04.1164908', 477396, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(54, 'PK', 'Shujaabad', 'Shujaabad', 71.29, 29.88, 'P', 'PPL', 'PK.04', 'PK.04.1169821', 65952, 'Asia/Karachi', 1, '2019-12-08 23:00:00', '2019-12-08 23:00:00'),
(55, 'PK', 'Shorkot', 'Shorkot', 70.88, 31.91, 'P', 'PPL', 'PK.03', 'PK.03.1180282', 67439, 'Asia/Karachi', 1, '2019-12-15 23:00:00', '2019-12-15 23:00:00'),
(56, 'PK', 'Shikarpur', 'Shikarpur', 68.64, 27.96, 'P', 'PPLA2', 'PK.05', 'PK.05.1165106', 156901, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(57, 'PK', 'Shekhupura', 'Shekhupura', 73.99, 31.71, 'P', 'PPLA2', 'PK.04', 'PK.04.1165218', 361303, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(58, 'PK', 'Sharqpur Sharif', 'Sharqpur Sharif', 74.10, 31.46, 'P', 'PPL', 'PK.04', 'PK.04.1165218', 31855, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(59, 'PK', 'Shakargarh', 'Shakargarh', 75.16, 32.26, 'P', 'PPL', 'PK.04', 'PK.04.7418968', 64304, 'Asia/Karachi', 1, '2019-12-08 23:00:00', '2019-12-08 23:00:00'),
(60, 'PK', 'Shahr Sultan', 'Shahr Sultan', 71.02, 29.58, 'P', 'PPL', 'PK.04', 'PK.04.1169603', 16166, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(61, 'PK', 'Shahpur Chakar', 'Shahpur Chakar', 68.65, 26.15, 'P', 'PPL', 'PK.05', 'PK.05.1166162', 21446, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(62, 'PK', 'Shahpur', 'Shahpur', 72.47, 32.27, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 14153, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(63, 'PK', 'Shahkot', 'Shahkot', 73.49, 31.57, 'P', 'PPL', 'PK.04', 'PK.04.7419159', 200000, 'Asia/Karachi', 1, '2012-07-30 23:00:00', '2012-07-30 23:00:00'),
(64, 'PK', 'Shahdadpur', 'Shahdadpur', 68.62, 25.93, 'P', 'PPL', 'PK.05', 'PK.05.1166162', 67249, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(65, 'PK', 'Shahdad Kot', 'Shahdad Kot', 67.91, 27.85, 'P', 'PPLA2', 'PK.05', 'PK.05.9034783', 75411, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(66, 'PK', 'Shabqadar', 'Shabqadar', 71.55, 34.22, 'P', 'PPL', 'PK.03', 'PK.03.7419051', 66541, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(67, 'PK', 'Sehwan', 'Sehwan', 67.86, 26.42, 'P', 'PPL', 'PK.05', 'PK.05.7419156', 41150, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(68, 'PK', 'Sargodha', 'Sargodha', 72.67, 32.09, 'P', 'PPLA2', 'PK.04', 'PK.04.1165999', 542603, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(69, 'PK', 'Sarai Sidhu', 'Sarai Sidhu', 71.97, 30.59, 'P', 'PPL', 'PK.04', 'PK.04.7418890', 15632, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(70, 'PK', 'Sarai Naurang', 'Sarai Naurang', 70.78, 32.83, 'P', 'PPL', 'PK.03', 'PK.03.7419039', 19694, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(71, 'PK', 'Sarai Alamgir', 'Sarai Alamgir', 73.76, 32.90, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 44120, 'Asia/Karachi', 1, '2018-05-07 23:00:00', '2018-05-07 23:00:00'),
(72, 'PK', 'Sann', 'Sann', 68.14, 26.04, 'P', 'PPL', 'PK.05', 'PK.05.7419156', 8834, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(73, 'PK', 'Sanjwal', 'Sanjwal', 72.43, 33.76, 'P', 'PPL', 'PK.04', 'PK.04.1184248', 10657, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(74, 'PK', 'Sangla Hill', 'Sangla Hill', 73.38, 31.72, 'P', 'PPL', 'PK.04', 'PK.04.7419159', 57002, 'Asia/Karachi', 1, '2014-10-07 23:00:00', '2014-10-07 23:00:00'),
(75, 'PK', 'Sanghar', 'Sanghar', 68.95, 26.05, 'P', 'PPLA2', 'PK.05', 'PK.05.1166162', 62033, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(76, 'PK', 'Sambrial', 'Sambrial', 74.35, 32.48, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 62874, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(77, 'PK', 'Samaro', 'Samaro', 69.40, 25.28, 'P', 'PPL', 'PK.05', 'PK.05.9072726', 8784, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(78, 'PK', 'Sakrand', 'Sakrand', 68.27, 26.14, 'P', 'PPL', 'PK.05', 'PK.05.1169115', 31630, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(79, 'PK', 'Sahiwal', 'Sahiwal', 72.33, 31.97, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 37186, 'Asia/Karachi', 1, '2019-12-09 23:00:00', '2019-12-09 23:00:00'),
(80, 'PK', 'Sahiwal', 'Sahiwal', 73.10, 30.67, 'P', 'PPLA2', 'PK.04', 'PK.04.1166545', 235695, 'Asia/Karachi', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(81, 'PK', 'Saddiqabad', 'Saddiqabad', 70.13, 28.31, 'P', 'PPL', 'PK.04', 'PK.04.1167458', 189876, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(82, 'PK', 'Rustam', 'Rustam', 68.80, 27.97, 'P', 'PPL', 'PK.05', 'PK.05.1165106', 9048, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(83, 'PK', 'Rojhan', 'Rojhan', 69.95, 28.69, 'P', 'PPL', 'PK.04', 'PK.04.8309731', 13031, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(84, 'PK', 'Rohri', 'Rohri', 68.89, 27.69, 'P', 'PPL', 'PK.05', 'PK.05.1164407', 50649, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(85, 'PK', 'Renala Khurd', 'Renala Khurd', 73.60, 30.88, 'P', 'PPL', 'PK.04', 'PK.04.7418888', 37111, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(86, 'PK', 'Rawalpindi', 'Rawalpindi', 73.05, 33.60, 'P', 'PPLA2', 'PK.04', 'PK.04.1166991', 1743101, 'Asia/Karachi', 1, '2018-08-18 23:00:00', '2018-08-18 23:00:00'),
(87, 'PK', 'Ratodero', 'Ratodero', 68.29, 27.80, 'P', 'PPL', 'PK.05', 'PK.05.1172127', 47819, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(88, 'PK', 'Rasulnagar', 'Rasulnagar', 73.78, 32.33, 'P', 'PPL', 'PK.04', 'PK.04.1177658', 14392, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(89, 'PK', 'Ranipur', 'Ranipur', 68.51, 27.29, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 22495, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(90, 'PK', 'Rajo Khanani', 'Rajo Khanani', 68.85, 24.98, 'P', 'PPL', 'PK.05', 'PK.05.1184051', 7683, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(91, 'PK', 'Rajanpur', 'Rajanpur', 70.33, 29.10, 'P', 'PPLA2', 'PK.04', 'PK.04.8309731', 50682, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(92, 'PK', 'Raja Jang', 'Raja Jang', 74.25, 31.22, 'P', 'PPL', 'PK.04', 'PK.04.1174623', 24407, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(93, 'PK', 'Raiwind', 'Raiwind', 74.22, 31.25, 'P', 'PPL', 'PK.04', 'PK.04.1174623', 31592, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(94, 'PK', 'Rahim Yar Khan', 'Rahim Yar Khan', 70.30, 28.42, 'P', 'PPLA2', 'PK.04', 'PK.04.1167458', 788915, 'Asia/Karachi', 1, '2017-09-25 23:00:00', '2017-09-25 23:00:00'),
(95, 'PK', 'Goth Radhan', 'Goth Radhan', 67.95, 27.20, 'P', 'PPL', 'PK.05', 'PK.05.1172127', 16786, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(96, 'PK', 'Chenab Nagar', 'Chenab Nagar', 72.91, 31.76, 'P', 'PPL', 'PK.04', 'PK.04.11886901', 70000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(97, 'PK', 'Quetta', 'Quetta', 67.00, 30.18, 'P', 'PPLA', 'PK.02', 'PK.02.1167527', 733675, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(98, 'PK', 'Kambar', 'Kambar', 68.00, 27.59, 'P', 'PPL', 'PK.05', 'PK.05.9034783', 77481, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(99, 'PK', 'Qadirpur Ran', 'Qadirpur Ran', 71.67, 30.29, 'P', 'PPL', 'PK.04', 'PK.04.1169821', 20407, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(100, 'PK', 'Pithoro', 'Pithoro', 69.38, 25.51, 'P', 'PPL', 'PK.05', 'PK.05.9072726', 6440, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(101, 'PK', 'Pishin', 'Pishin', 66.99, 30.58, 'P', 'PPLA2', 'PK.02', 'PK.02.1167820', 24239, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(102, 'PK', 'Pir Mahal', 'Pir Mahal', 72.43, 30.77, 'P', 'PPL', 'PK.04', 'PK.04.7331706', 35343, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(103, 'PK', 'Pindi Gheb', 'Pindi Gheb', 72.26, 33.24, 'P', 'PPL', 'PK.04', 'PK.04.1184248', 34301, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(104, 'PK', 'Pindi Bhattian', 'Pindi Bhattian', 73.27, 31.90, 'P', 'PPL', 'PK.04', 'PK.04.7418962', 35088, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(105, 'PK', 'Pind Dadan Khan', 'Pind Dadan Khan', 73.04, 32.59, 'P', 'PPL', 'PK.04', 'PK.04.1175862', 22001, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(106, 'PK', 'Goth Phulji', 'Goth Phulji', 67.68, 26.88, 'P', 'PPL', 'PK.05', 'PK.05.1180802', 7877, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(107, 'PK', 'Phalia', 'Phalia', 73.58, 32.43, 'P', 'PPL', 'PK.04', 'PK.04.7418963', 24789, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(108, 'PK', 'Peshawar', 'Peshawar', 71.58, 34.01, 'P', 'PPLA', 'PK.03', 'PK.03.1168195', 1218773, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(109, 'PK', 'Pattoki', 'Pattoki', 73.85, 31.02, 'P', 'PPL', 'PK.04', 'PK.04.1174623', 70436, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(110, 'PK', 'Pasrur', 'Pasrur', 74.66, 32.26, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 53364, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(111, 'PK', 'Pasni', 'Pasni', 63.47, 25.26, 'P', 'PPL', 'PK.02', 'PK.02.1177445', 33110, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(112, 'PK', 'Pano Aqil', 'Pano Aqil', 69.11, 27.86, 'P', 'PPL', 'PK.05', 'PK.05.1164407', 72881, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(113, 'PK', 'Pakpattan', 'Pakpattan', 73.39, 30.34, 'P', 'PPLA2', 'PK.04', 'PK.04.7418850', 126706, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(114, 'PK', 'Paharpur', 'Paharpur', 70.97, 32.10, 'P', 'PPL', 'PK.03', 'PK.03.1180282', 17294, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(115, 'PK', 'Pad Idan', 'Pad Idan', 68.30, 26.77, 'P', 'PPL', 'PK.05', 'PK.05.7352189', 20919, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(116, 'PK', 'Pabbi', 'Pabbi', 71.79, 34.01, 'P', 'PPL', 'PK.03', 'PK.03.7419052', 37307, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(117, 'PK', 'Ormara', 'Ormara', 64.64, 25.21, 'P', 'PPL', 'PK.02', 'PK.02.1177445', 13026, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(118, 'PK', 'Okara', 'Okara', 73.45, 30.81, 'P', 'PPLA2', 'PK.04', 'PK.04.7418888', 223648, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(119, 'PK', 'Nushki', 'Nushki', 66.02, 29.55, 'P', 'PPL', 'PK.02', 'PK.02.6641960', 27680, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(120, 'PK', 'New Mirpur', 'New Mirpur', 73.75, 33.15, 'P', 'PPLA2', 'PK.06', 'PK.06.1170297', 124352, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(121, 'PK', 'Nawabshah', 'Nawabshah', 68.40, 26.24, 'P', 'PPLA2', 'PK.05', 'PK.05.1169115', 229504, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(122, 'PK', 'Naushahro Firoz', 'Naushahro Firoz', 68.12, 26.84, 'P', 'PPLA2', 'PK.05', 'PK.05.7352189', 17631, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(123, 'PK', 'Naushahra Virkan', 'Naushahra Virkan', 73.97, 31.96, 'P', 'PPL', 'PK.04', 'PK.04.1177658', 40853, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(124, 'PK', 'Naudero', 'Naudero', 68.36, 27.67, 'P', 'PPL', 'PK.05', 'PK.05.1172127', 33455, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(125, 'PK', 'Nasirabad', 'Nasirabad', 67.92, 27.38, 'P', 'PPL', 'PK.05', 'PK.05.9034783', 27809, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(126, 'PK', 'Narowal', 'Narowal', 74.87, 32.10, 'P', 'PPLA2', 'PK.04', 'PK.04.7418968', 68291, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(127, 'PK', 'Narang Mandi', 'Narang Mandi', 74.52, 31.90, 'P', 'PPL', 'PK.04', 'PK.04.1165218', 34778, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(128, 'PK', 'Naukot', 'Naukot', 69.40, 24.86, 'P', 'PPL', 'PK.05', 'PK.05.1376894', 22081, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(129, 'PK', 'Nankana Sahib', 'Nankana Sahib', 73.71, 31.45, 'P', 'PPL', 'PK.04', 'PK.04.7419159', 56366, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(130, 'PK', 'Nabisar', 'Nabisar', 69.64, 25.07, 'P', 'PPL', 'PK.05', 'PK.05.9072726', 6256, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(131, 'PK', 'Muzaffargarh', 'Muzaffargarh', 71.19, 30.07, 'P', 'PPLA2', 'PK.04', 'PK.04.1169603', 165192, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(132, 'PK', 'Muzaffarābād', 'Muzaffarabad', 73.47, 34.37, 'P', 'PPLA', 'PK.06', 'PK.06.1169606', 725000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(133, 'PK', 'Mustafābād', 'Mustafabad', 73.50, 30.89, 'P', 'PPL', 'PK.04', 'PK.04.7418888', 45795, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(134, 'PK', 'Murree', 'Murree', 73.39, 33.91, 'P', 'PPL', 'PK.04', 'PK.04.1166991', 25247, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(135, 'PK', 'Muridke', 'Muridke', 74.26, 31.80, 'P', 'PPL', 'PK.04', 'PK.04.1165218', 164246, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(136, 'PK', 'Multan', 'Multan', 71.48, 30.20, 'P', 'PPLA2', 'PK.04', 'PK.04.1169821', 1437230, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(137, 'PK', 'Moro', 'Moro', 68.00, 26.66, 'P', 'PPL', 'PK.05', 'PK.05.7352189', 76765, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(138, 'PK', 'Mithi', 'Mithi', 69.80, 24.74, 'P', 'PPL', 'PK.05', 'PK.05.1163602', 23431, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(139, 'PK', 'Mitha Tiwana', 'Mitha Tiwana', 72.11, 32.25, 'P', 'PPL', 'PK.04', 'PK.04.7418965', 26390, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(140, 'PK', 'Mirwah Gorchani', 'Mirwah Gorchani', 69.05, 25.31, 'P', 'PPL', 'PK.05', 'PK.05.1376894', 12139, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(141, 'PK', 'Mirpur Sakro', 'Mirpur Sakro', 67.63, 24.55, 'P', 'PPL', 'PK.05', 'PK.05.1163570', 8371, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(142, 'PK', 'Mirpur Mathelo', 'Mirpur Mathelo', 69.55, 28.02, 'P', 'PPL', 'PK.05', 'PK.05.7418822', 49311, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(143, 'PK', 'Mirpur Khas', 'Mirpur Khas', 69.01, 25.53, 'P', 'PPLA2', 'PK.05', 'PK.05.1376894', 215657, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(144, 'PK', 'Mirpur Bhtoro', 'Mirpur Bhtoro', 68.26, 24.73, 'P', 'PPL', 'PK.05', 'PK.05.10300608', 8866, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(145, 'PK', 'Miro Khan', 'Miro Khan', 68.09, 27.76, 'P', 'PPL', 'PK.05', 'PK.05.9034783', 10590, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(146, 'PK', 'Mingora', 'Mingora', 72.36, 34.78, 'P', 'PPL', 'PK.03', 'PK.03.1164211', 279914, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(147, 'PK', 'Minchianabad', 'Minchianabad', 73.57, 30.16, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 29253, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(148, 'PK', 'Mianwali', 'Mianwali', 71.53, 32.58, 'P', 'PPLA2', 'PK.04', 'PK.04.1170424', 89570, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(149, 'PK', 'Mian Channun', 'Mian Channun', 72.36, 30.44, 'P', 'PPL', 'PK.04', 'PK.04.7418890', 76226, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(150, 'PK', 'Mehrabpur', 'Mehrabpur', 68.03, 28.11, 'P', 'PPL', 'PK.02', 'PK.02.6641922', 35263, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(151, 'PK', 'Mehar', 'Mehar', 67.82, 27.18, 'P', 'PPL', 'PK.05', 'PK.05.1180802', 30429, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(152, 'PK', 'Matli', 'Matli', 68.66, 25.04, 'P', 'PPL', 'PK.05', 'PK.05.1184051', 50398, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(153, 'PK', 'Matiari', 'Matiari', 68.45, 25.60, 'P', 'PPLA2', 'PK.05', 'PK.05.7419157', 18929, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(154, 'PK', 'Mastung', 'Mastung', 66.85, 29.80, 'P', 'PPLA2', 'PK.02', 'PK.02.6641952', 29082, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(155, 'PK', 'Mardan', 'Mardan', 72.05, 34.20, 'P', 'PPLA2', 'PK.03', 'PK.03.1170875', 300424, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(156, 'PK', 'Mansehra', 'Mansehra', 73.20, 34.33, 'P', 'PPLA2', 'PK.03', 'PK.03.1170950', 66486, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(157, 'PK', 'Mankera', 'Mankera', 71.44, 31.39, 'P', 'PPL', 'PK.04', 'PK.04.7418966', 10819, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(158, 'PK', 'Mangla', 'Mangla', 72.38, 31.89, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 16264, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(159, 'PK', 'Mandi Bahauddin', 'Mandi Bahauddin', 73.49, 32.59, 'P', 'PPLA2', 'PK.04', 'PK.04.7418963', 129733, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(160, 'PK', 'Mananwala', 'Mananwala', 73.69, 31.59, 'P', 'PPL', 'PK.04', 'PK.04.1165218', 28432, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(161, 'PK', 'Mamu Kanjan', 'Mamu Kanjan', 72.80, 30.83, 'P', 'PPL', 'PK.04', 'PK.04.1179399', 31914, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(162, 'PK', 'Malir Cantonment', 'Malir Cantonment', 67.21, 24.94, 'P', 'PPLX', 'PK.05', NULL, 300000, 'Asia/Karachi', 1, '2018-02-05 23:00:00', '2018-02-05 23:00:00'),
(163, 'PK', 'Malakwal', 'Malakwal', 73.21, 32.55, 'P', 'PPL', 'PK.04', 'PK.04.7418963', 34589, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(164, 'PK', 'Mailsi', 'Mailsi', 72.17, 29.80, 'P', 'PPL', 'PK.04', 'PK.04.10344547', 64545, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(165, 'PK', 'Madeji', 'Madeji', 68.45, 27.75, 'P', 'PPL', 'PK.05', 'PK.05.1165106', 14802, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(166, 'PK', 'Mach', 'Mach', 67.33, 29.86, 'P', 'PPL', 'PK.02', 'PK.02.1175527', 16930, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(167, 'PK', 'Loralai', 'Loralai', 68.60, 30.37, 'P', 'PPLA2', 'PK.02', 'PK.02.1171867', 37787, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(168, 'PK', 'Lodhran', 'Lodhran', 71.63, 29.53, 'P', 'PPLA2', 'PK.04', 'PK.04.7418846', 97249, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(169, 'PK', 'Liliani', 'Liliani', 72.95, 32.20, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 12211, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(170, 'PK', 'Layyah', 'Layyah', 70.94, 30.96, 'P', 'PPLA2', 'PK.04', 'PK.04.7418967', 78954, 'Asia/Karachi', 1, '2016-01-31 23:00:00', '2016-01-31 23:00:00'),
(171, 'PK', 'Larkana', 'Larkana', 68.21, 27.56, 'P', 'PPLA2', 'PK.05', 'PK.05.1172127', 364033, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(172, 'PK', 'Lalian', 'Lalian', 72.80, 31.82, 'P', 'PPL', 'PK.04', 'PK.04.11886901', 31355, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(173, 'PK', 'Lala Musa', 'Lala Musa', 73.96, 32.70, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 65197, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(174, 'PK', 'Lakki', 'Lakki', 70.91, 32.61, 'P', 'PPLA2', 'PK.03', 'PK.03.7419039', 36391, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(175, 'PK', 'Lakhi', 'Lakhi', 68.70, 27.85, 'P', 'PPL', 'PK.05', 'PK.05.1165106', 13600, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(176, 'PK', 'Lahore', 'Lahore', 74.35, 31.56, 'P', 'PPLA', 'PK.04', 'PK.04.1172449', 6310888, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(177, 'PK', 'Ladhewala Waraich', 'Ladhewala Waraich', 74.12, 32.16, 'P', 'PPLX', 'PK.04', 'PK.04.1177658', 39757, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(178, 'PK', 'Lachi', 'Lachi', 71.34, 33.38, 'P', 'PPL', 'PK.03', 'PK.03.1173489', 18537, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(179, 'PK', 'Kunri', 'Kunri', 69.57, 25.18, 'P', 'PPL', 'PK.05', 'PK.05.9072726', 26773, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(180, 'PK', 'Kunjah', 'Kunjah', 73.97, 32.53, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 28103, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(181, 'PK', 'Kundian', 'Kundian', 71.48, 32.46, 'P', 'PPL', 'PK.04', 'PK.04.1170424', 35406, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(182, 'PK', 'Kulachi', 'Kulachi', 70.46, 31.93, 'P', 'PPL', 'PK.03', 'PK.03.1180282', 22376, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(183, 'PK', 'Kot Sultan', 'Kot Sultan', 70.93, 30.77, 'P', 'PPL', 'PK.04', 'PK.04.7418967', 10000, 'Asia/Karachi', 1, '2016-01-18 23:00:00', '2016-01-18 23:00:00'),
(184, 'PK', 'Kot Samaba', 'Kot Samaba', 70.47, 28.55, 'P', 'PPL', 'PK.04', 'PK.04.1167458', 22953, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(185, 'PK', 'Kotri', 'Kotri', 68.31, 25.37, 'P', 'PPL', 'PK.05', 'PK.05.7419156', 72672, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(186, 'PK', 'Kot Radha Kishan', 'Kot Radha Kishan', 74.10, 31.17, 'P', 'PPL', 'PK.04', 'PK.04.1174623', 45938, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(187, 'PK', 'Kot Mumin', 'Kot Mumin', 73.03, 32.19, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 38355, 'Asia/Karachi', 1, '2019-12-09 23:00:00', '2019-12-09 23:00:00'),
(188, 'PK', 'Kot Malik Barkhurdar', 'Kot Malik Barkhurdar', 66.99, 30.20, 'P', 'PPLX', 'PK.02', 'PK.02.1167527', 69359, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(189, 'PK', 'Kotli Loharan', 'Kotli Loharan', 74.49, 32.59, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 21463, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(190, 'PK', 'Kotli', 'Kotli', 73.90, 33.52, 'P', 'PPLA2', 'PK.06', 'PK.06.1173037', 640000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(191, 'PK', 'Kot Ghulam Muhammad', 'Kot Ghulam Muhammad', 74.55, 32.33, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 20897, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(192, 'PK', 'Kot Diji', 'Kot Diji', 68.71, 27.34, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 25616, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(193, 'PK', 'Kot Addu', 'Kot Addu', 70.97, 30.47, 'P', 'PPL', 'PK.04', 'PK.04.1169603', 104217, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(194, 'PK', 'Kohlu', 'Kohlu', 69.25, 29.90, 'P', 'PPLA2', 'PK.02', 'PK.02.1173463', 11089, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(195, 'PK', 'Kohat', 'Kohat', 71.45, 33.58, 'P', 'PPLA2', 'PK.03', 'PK.03.1173489', 151427, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(196, 'PK', 'Khuzdar', 'Khuzdar', 66.61, 27.81, 'P', 'PPL', 'PK.02', 'PK.02.1173663', 141227, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(197, 'PK', 'Khushāb', 'Khushab', 72.35, 32.30, 'P', 'PPLA3', 'PK.04', 'PK.04.7418965', 102793, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(198, 'PK', 'Khurrianwala', 'Khurrianwala', 73.27, 31.50, 'P', 'PPL', 'PK.04', 'PK.04.1179399', 35292, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(199, 'PK', 'Khewra', 'Khewra', 73.01, 32.65, 'P', 'PPL', 'PK.04', 'PK.04.1175862', 32620, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(200, 'PK', 'Kharian', 'Kharian', 73.89, 32.82, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 81435, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(201, 'PK', 'Kharan', 'Kharan', 65.42, 28.58, 'P', 'PPLA2', 'PK.02', 'PK.02.1174059', 30841, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(202, 'PK', 'Karak', 'Karak', 71.09, 33.12, 'P', 'PPLA2', 'PK.03', 'PK.03.7419047', 13679, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(203, 'PK', 'Khanpur', 'Khanpur', 70.66, 28.65, 'P', 'PPL', 'PK.04', 'PK.04.1167458', 142426, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(204, 'PK', 'Khanpur Mahar', 'Khanpur Mahar', 69.41, 27.84, 'P', 'PPL', 'PK.05', 'PK.05.7418822', 22273, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(205, 'PK', 'Khangarh', 'Khangarh', 71.16, 29.91, 'P', 'PPL', 'PK.04', 'PK.04.1169603', 19698, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(206, 'PK', 'Khangah Dogran', 'Khangah Dogran', 73.62, 31.83, 'P', 'PPL', 'PK.04', 'PK.04.7419159', 30314, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(207, 'PK', 'Khalabat', 'Khalabat', 72.89, 34.06, 'P', 'PPLW', 'PK.03', 'PK.03.7419054', 39148, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(208, 'PK', 'Khairpur Nathan Shah', 'Khairpur Nathan Shah', 67.73, 27.09, 'P', 'PPL', 'PK.05', 'PK.05.1180802', 30286, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(209, 'PK', 'Khairpur Tamewah', 'Khairpur Tamewah', 72.24, 29.58, 'P', 'PPL', 'PK.04', 'PK.04.1183876', 30967, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(210, 'PK', 'Khairpur', 'Khairpur', 69.70, 28.06, 'P', 'PPL', 'PK.05', 'PK.05.7418822', 40083, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(211, 'PK', 'Khadro', 'Khadro', 68.72, 26.15, 'P', 'PPL', 'PK.05', 'PK.05.1166162', 9997, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(212, 'PK', 'Kasur', 'Kasur', 74.45, 31.12, 'P', 'PPLA2', 'PK.04', 'PK.04.1174623', 290643, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(213, 'PK', 'Kashmor', 'Kashmor', 69.58, 28.43, 'P', 'PPL', 'PK.05', 'PK.05.9035095', 33732, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(214, 'PK', 'Karor', 'Karor', 70.95, 31.22, 'P', 'PPL', 'PK.04', 'PK.04.7418967', 25634, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(215, 'PK', 'Kario Ghanwar', 'Kario Ghanwar', 68.60, 24.81, 'P', 'PPL', 'PK.05', 'PK.05.1184051', 5685, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(216, 'PK', 'Karaundi', 'Karaundi', 68.41, 26.90, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 8604, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(217, 'PK', 'Karachi', 'Karachi', 67.01, 24.86, 'P', 'PPLA', 'PK.05', NULL, 11624219, 'Asia/Karachi', 1, '2019-12-29 23:00:00', '2019-12-29 23:00:00'),
(218, 'PK', 'Kanganpur', 'Kanganpur', 74.12, 30.76, 'P', 'PPL', 'PK.04', 'PK.04.1174623', 21788, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(219, 'PK', 'Kandiaro', 'Kandiaro', 68.21, 27.06, 'P', 'PPL', 'PK.05', 'PK.05.7352189', 26807, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(220, 'PK', 'Kandiari', 'Kandiari', 68.52, 26.92, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 6861, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(221, 'PK', 'Kandhkot', 'Kandhkot', 69.18, 28.25, 'P', 'PPL', 'PK.05', 'PK.05.9035095', 88468, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(222, 'PK', 'Kamra', 'Kamra', 73.51, 33.75, 'P', 'PPL', 'PK.04', 'PK.04.1166991', 43779, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(223, 'PK', 'Kamoke', 'Kamoke', 74.22, 31.98, 'P', 'PPL', 'PK.04', 'PK.04.1177658', 199531, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(224, 'PK', 'Chak One Hundred Twenty Nine Left', 'Chak One Hundred Twenty Nine Left', 73.05, 30.43, 'P', 'PPL', 'PK.04', 'PK.04.1166545', 24053, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(225, 'PK', 'Kamar Mushani', 'Kamar Mushani', 71.36, 32.84, 'P', 'PPL', 'PK.04', 'PK.04.1170424', 15867, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(226, 'PK', 'Kamalia', 'Kamalia', 72.65, 30.73, 'P', 'PPL', 'PK.04', 'PK.04.7331706', 112426, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(227, 'PK', 'Kalur Kot', 'Kalur Kot', 71.27, 32.16, 'P', 'PPL', 'PK.04', 'PK.04.7418966', 25574, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(228, 'PK', 'Kallar Kahar', 'Kallar Kahar', 72.70, 32.78, 'P', 'PPL', 'PK.04', 'PK.04.7418964', 15800, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(229, 'PK', 'Kaleke Mandi', 'Kaleke Mandi', 73.60, 31.98, 'P', 'PPL', 'PK.04', 'PK.04.7418962', 16361, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(230, 'PK', 'Kalat', 'Kalat', 66.59, 29.03, 'P', 'PPLA2', 'PK.02', 'PK.02.1175293', 26701, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(231, 'PK', 'Kalaswala', 'Kalaswala', 74.65, 32.20, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 12576, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(232, 'PK', 'Kalabagh', 'Kalabagh', 71.55, 32.96, 'P', 'PPL', 'PK.04', 'PK.04.1170424', 15976, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(233, 'PK', 'Kahuta', 'Kahuta', 73.39, 33.59, 'P', 'PPL', 'PK.04', 'PK.04.1166991', 22551, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(234, 'PK', 'Kahror Pakka', 'Kahror Pakka', 71.91, 29.62, 'P', 'PPL', 'PK.04', 'PK.04.7418846', 69743, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(235, 'PK', 'Kahna Nau', 'Kahna Nau', 74.37, 31.37, 'P', 'PPL', 'PK.04', 'PK.04.1172449', 45888, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(236, 'PK', 'Kadhan', 'Kadhan', 68.99, 24.48, 'P', 'PPL', 'PK.05', 'PK.05.1184051', 6854, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(237, 'PK', 'Kabirwala', 'Kabirwala', 71.86, 30.40, 'P', 'PPL', 'PK.04', 'PK.04.7418890', 60782, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(238, 'PK', 'Johi', 'Johi', 67.61, 26.69, 'P', 'PPL', 'PK.05', 'PK.05.1180802', 16311, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(239, 'PK', 'Jiwani', 'Jiwani', 61.75, 25.05, 'P', 'PPL', 'PK.02', 'PK.02.1177445', 16322, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(240, 'PK', 'Chak Jhumra', 'Chak Jhumra', 73.18, 31.57, 'P', 'PPL', 'PK.04', 'PK.04.1179399', 37214, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(241, 'PK', 'Jhol', 'Jhol', 68.89, 25.96, 'P', 'PPL', 'PK.05', 'PK.05.1166162', 16067, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(242, 'PK', 'Jhelum', 'Jhelum', 73.73, 32.93, 'P', 'PPLA2', 'PK.04', 'PK.04.1175862', 145000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(243, 'PK', 'Jhawarian', 'Jhawarian', 72.62, 32.36, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 27893, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(244, 'PK', 'Jhang Sadr', 'Jhang Sadr', 72.32, 31.27, 'P', 'PPL', 'PK.04', 'PK.04.1175906', 341210, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(245, 'PK', 'Jauharabad', 'Jauharabad', 72.28, 32.29, 'P', 'PPL', 'PK.04', 'PK.04.7418965', 46545, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(246, 'PK', 'Jatoi Shimali', 'Jatoi Shimali', 70.84, 29.52, 'P', 'PPL', 'PK.04', 'PK.04.1169603', 47144, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(247, 'PK', 'Jati', 'Jati', 68.27, 24.35, 'P', 'PPL', 'PK.05', 'PK.05.10300608', 9152, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(248, 'PK', 'Jaranwala', 'Jaranwala', 73.42, 31.33, 'P', 'PPL', 'PK.04', 'PK.04.1179399', 119785, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(249, 'PK', 'Jandiala Sher Khan', 'Jandiala Sher Khan', 73.92, 31.82, 'P', 'PPL', 'PK.04', 'PK.04.1165218', 10985, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(250, 'PK', 'Jand', 'Jand', 72.02, 33.43, 'P', 'PPL', 'PK.04', 'PK.04.1184248', 18170, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(251, 'PK', 'Jampur', 'Jampur', 70.60, 29.64, 'P', 'PPL', 'PK.04', 'PK.04.8309731', 63791, 'Asia/Karachi', 1, '2019-12-08 23:00:00', '2019-12-08 23:00:00'),
(252, 'PK', 'Jalalpur Pirwala', 'Jalalpur Pirwala', 71.22, 29.51, 'P', 'PPL', 'PK.04', 'PK.04.1169821', 37393, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(253, 'PK', 'Jalalpur Jattan', 'Jalalpur Jattan', 74.21, 32.64, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 93883, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(254, 'PK', 'Jahanian Shah', 'Jahanian Shah', 72.28, 31.81, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 29095, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(255, 'PK', 'Jacobabad', 'Jacobabad', 68.44, 28.28, 'P', 'PPLA2', 'PK.05', 'PK.05.1176514', 170588, 'Asia/Karachi', 1, '2018-03-05 23:00:00', '2018-03-05 23:00:00'),
(256, 'PK', 'Islamkot', 'Islamkot', 70.18, 24.70, 'P', 'PPL', 'PK.05', 'PK.05.1163602', 12426, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(257, 'PK', 'Islamabad', 'Islamabad', 73.04, 33.72, 'P', 'PPLC', 'PK.08', NULL, 601600, 'Asia/Karachi', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(258, 'PK', 'Hyderabad', 'Hyderabad', 68.37, 25.39, 'P', 'PPLA2', 'PK.05', 'PK.05.1176733', 1386330, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(259, 'PK', 'Hujra Shah Muqim', 'Hujra Shah Muqim', 73.82, 30.74, 'P', 'PPL', 'PK.04', 'PK.04.7418888', 61546, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(260, 'PK', 'Hingorja', 'Hingorja', 68.42, 27.21, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 22263, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(261, 'PK', 'Hazro City', 'Hazro City', 72.49, 33.91, 'P', 'PPL', 'PK.04', 'PK.04.1184248', 26309, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(262, 'PK', 'Havelian', 'Havelian', 73.16, 34.05, 'P', 'PPL', 'PK.03', 'PK.03.1185055', 40481, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(263, 'PK', 'Haveli Lakha', 'Haveli Lakha', 73.69, 30.45, 'P', 'PPL', 'PK.04', 'PK.04.7418888', 65289, 'Asia/Karachi', 1, '2019-12-08 23:00:00', '2019-12-08 23:00:00'),
(264, 'PK', 'Hasilpur', 'Hasilpur', 72.55, 29.69, 'P', 'PPL', 'PK.04', 'PK.04.1183876', 88031, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(265, 'PK', 'Chak Thirty-one -Eleven Left', 'Chak Thirty-one -Eleven Left', 72.70, 30.42, 'P', 'PPL', 'PK.04', 'PK.04.1166545', 45665, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(266, 'PK', 'Harunabad', 'Harunabad', 73.14, 29.61, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 72432, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(267, 'PK', 'Harnoli', 'Harnoli', 71.55, 32.28, 'P', 'PPL', 'PK.04', 'PK.04.1170424', 15669, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(268, 'PK', 'Harnai', 'Harnai', 67.94, 30.10, 'P', 'PPL', 'PK.02', 'PK.02.8309758', 11066, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(269, 'PK', 'Haripur', 'Haripur', 72.93, 34.00, 'P', 'PPLA2', 'PK.03', 'PK.03.7419054', 56977, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(270, 'PK', 'Hangu', 'Hangu', 71.06, 33.53, 'P', 'PPLA2', 'PK.03', 'PK.03.7419048', 36150, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(271, 'PK', 'Hala', 'Hala', 68.42, 25.81, 'P', 'PPL', 'PK.05', 'PK.05.7419157', 47915, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(272, 'PK', 'Hafizabad', 'Hafizabad', 73.69, 32.07, 'P', 'PPLA2', 'PK.04', 'PK.04.7418962', 153656, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(273, 'PK', 'Hadali', 'Hadali', 74.57, 32.64, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 49663, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(274, 'PK', 'Gwadar', 'Gwadar', 62.33, 25.12, 'P', 'PPLA2', 'PK.02', 'PK.02.1177445', 51901, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(275, 'PK', 'Gujrat', 'Gujrat', 74.08, 32.57, 'P', 'PPLA2', 'PK.04', 'PK.04.1177651', 301506, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(276, 'PK', 'Gujranwala', 'Gujranwala', 74.19, 32.16, 'P', 'PPLA2', 'PK.04', 'PK.04.1177658', 1384471, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(277, 'PK', 'Gujar Khan', 'Gujar Khan', 73.30, 33.25, 'P', 'PPL', 'PK.04', 'PK.04.1166991', 69374, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(278, 'PK', 'Gojra', 'Gojra', 72.68, 31.15, 'P', 'PPL', 'PK.04', 'PK.04.7331706', 139726, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(279, 'PK', 'Gilgit', 'Gilgit', 74.31, 35.92, 'P', 'PPLA', 'PK.07', 'PK.07.8358419', 10414, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(280, 'PK', 'Ghotki', 'Ghotki', 69.32, 28.00, 'P', 'PPLA2', 'PK.05', 'PK.05.7418822', 64295, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(281, 'PK', 'Ghauspur', 'Ghauspur', 69.08, 28.14, 'P', 'PPL', 'PK.05', 'PK.05.9035095', 29767, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(282, 'PK', 'Gharo', 'Gharo', 67.59, 24.74, 'P', 'PPL', 'PK.05', 'PK.05.1163570', 19524, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(283, 'PK', 'Garh Maharaja', 'Garh Maharaja', 71.90, 30.83, 'P', 'PPL', 'PK.04', 'PK.04.1175906', 29153, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(284, 'PK', 'Garhiyasin', 'Garhiyasin', 68.51, 27.91, 'P', 'PPL', 'PK.05', 'PK.05.1165106', 14810, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(285, 'PK', 'Garhi Khairo', 'Garhi Khairo', 67.98, 28.06, 'P', 'PPL', 'PK.02', NULL, 13666, 'Asia/Karachi', 1, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(286, 'PK', 'Goth Garelo', 'Goth Garelo', 68.08, 27.44, 'P', 'PPL', 'PK.05', 'PK.05.1172127', 6853, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(287, 'PK', 'Gambat', 'Gambat', 68.52, 27.35, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 34005, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(288, 'PK', 'Gadani', 'Gadani', 66.73, 25.12, 'P', 'PPL', 'PK.02', 'PK.02.1172115', 13427, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(289, 'PK', 'Fort Abbas', 'Fort Abbas', 72.86, 29.19, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 40626, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(290, 'PK', 'Fazilpur', 'Fazilpur', 75.07, 32.18, 'P', 'PPL', 'PK.04', 'PK.04.7418968', 28213, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(291, 'PK', 'Chak Two Hundred Forty-nine Thal Development Authority', 'Chak Two Hundred Forty-nine Thal Development Authority', 71.20, 31.18, 'P', 'PPL', 'PK.04', 'PK.04.7418967', 18126, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(292, 'PK', 'Faruka', 'Faruka', 72.41, 31.89, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 21747, 'Asia/Karachi', 1, '2019-12-09 23:00:00', '2019-12-09 23:00:00'),
(293, 'PK', 'Faqirwali', 'Faqirwali', 73.03, 29.47, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 25186, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(294, 'PK', 'Faisalabad', 'Faisalabad', 73.09, 31.42, 'P', 'PPLA2', 'PK.04', 'PK.04.1179399', 2506595, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(295, 'PK', 'Eminabad', 'Eminabad', 74.26, 32.04, 'P', 'PPL', 'PK.04', 'PK.04.1177658', 22679, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(296, 'PK', 'Dunyapur', 'Dunyapur', 71.74, 29.80, 'P', 'PPL', 'PK.04', 'PK.04.7418846', 34044, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(297, 'PK', 'Dunga Bunga', 'Dunga Bunga', 73.24, 29.75, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 25893, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(298, 'PK', 'Dullewala', 'Dullewala', 71.44, 31.83, 'P', 'PPL', 'PK.04', 'PK.04.7418966', 48682, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(299, 'PK', 'Duki', 'Duki', 68.57, 30.15, 'P', 'PPL', 'PK.02', 'PK.02.1171867', 6384, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(300, 'PK', 'Dokri', 'Dokri', 68.10, 27.37, 'P', 'PPL', 'PK.05', 'PK.05.1172127', 14800, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(301, 'PK', 'Doaba', 'Doaba', 70.74, 33.42, 'P', 'PPL', 'PK.03', 'PK.03.7419048', 8893, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(302, 'PK', 'Upper Dir', 'Upper Dir', 71.88, 35.21, 'P', 'PPLA2', 'PK.03', 'PK.03.1179754', 29869, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(303, 'PK', 'Diplo', 'Diplo', 69.58, 24.47, 'P', 'PPL', 'PK.05', 'PK.05.1163602', 11575, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(304, 'PK', 'Dipalpur', 'Dipalpur', 73.65, 30.67, 'P', 'PPL', 'PK.04', 'PK.04.7418888', 74640, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(305, 'PK', 'Dinan Bashnoian Wala', 'Dinan Bashnoian Wala', 73.27, 29.77, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 7500, 'Asia/Karachi', 1, '2016-04-14 23:00:00', '2016-04-14 23:00:00'),
(306, 'PK', 'Dinga', 'Dinga', 73.72, 32.64, 'P', 'PPL', 'PK.04', 'PK.04.1177651', 39784, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(307, 'PK', 'Dijkot', 'Dijkot', 73.00, 31.22, 'P', 'PPL', 'PK.04', 'PK.04.1179399', 27469, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(308, 'PK', 'Digri', 'Digri', 69.11, 25.16, 'P', 'PPL', 'PK.05', 'PK.05.1376894', 31842, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(309, 'PK', 'Dhoro Naro', 'Dhoro Naro', 69.57, 25.50, 'P', 'PPL', 'PK.05', 'PK.05.9072726', 19907, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00');
INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `longitude`, `latitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(310, 'PK', 'Dhaunkal', 'Dhaunkal', 74.14, 32.41, 'P', 'PPL', 'PK.04', 'PK.04.1177658', 12117, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(311, 'PK', 'Dhanot', 'Dhanot', 71.75, 29.58, 'P', 'PPL', 'PK.04', 'PK.04.7418846', 18729, 'Asia/Karachi', 1, '2019-12-10 23:00:00', '2019-12-10 23:00:00'),
(312, 'PK', 'Dera Ismail Khan', 'Dera Ismail Khan', 70.90, 31.83, 'P', 'PPLA2', 'PK.03', 'PK.03.1180282', 101616, 'Asia/Karachi', 1, '2019-07-10 23:00:00', '2019-07-10 23:00:00'),
(313, 'PK', 'Dera Ghazi Khan', 'Dera Ghazi Khan', 70.64, 30.05, 'P', 'PPLA2', 'PK.04', 'PK.04.1180287', 236093, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(314, 'PK', 'Dera Bugti', 'Dera Bugti', 69.16, 29.04, 'P', 'PPLA2', 'PK.02', 'PK.02.6641919', 18120, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(315, 'PK', 'Daur', 'Daur', 68.32, 26.46, 'P', 'PPL', 'PK.05', 'PK.05.1169115', 17577, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(316, 'PK', 'Daultala', 'Daultala', 73.14, 33.19, 'P', 'PPL', 'PK.04', 'PK.04.1166991', 11814, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(317, 'PK', 'Daulatpur', 'Daulatpur', 67.97, 26.50, 'P', 'PPL', 'PK.05', 'PK.05.1169115', 14574, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(318, 'PK', 'Daud Khel', 'Daud Khel', 71.57, 32.88, 'P', 'PPL', 'PK.04', 'PK.04.1170424', 26395, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(319, 'PK', 'Daska Kalan', 'Daska Kalan', 74.35, 32.32, 'P', 'PPLX', 'PK.04', 'PK.04.1164908', 126924, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(320, 'PK', 'Darya Khan Marri', 'Darya Khan Marri', 68.29, 26.68, 'P', 'PPL', 'PK.05', 'PK.05.7352189', 8973, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(321, 'PK', 'Darya Khan', 'Darya Khan', 71.10, 31.78, 'P', 'PPL', 'PK.04', 'PK.04.7418966', 15048, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(322, 'PK', 'Daromehar', 'Daromehar', 68.18, 24.79, 'P', 'PPL', 'PK.05', 'PK.05.10300608', 10869, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(323, 'PK', 'Dalbandin', 'Dalbandin', 64.41, 28.89, 'P', 'PPLA2', 'PK.02', 'PK.02.1181950', 14621, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(324, 'PK', 'Dajal', 'Dajal', 70.38, 29.56, 'P', 'PPL', 'PK.04', 'PK.04.8309731', 17630, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(325, 'PK', 'Daira Din Panah', 'Daira Din Panah', 70.94, 30.57, 'P', 'PPL', 'PK.04', 'PK.04.1169603', 14878, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(326, 'PK', 'Dadu', 'Dadu', 67.78, 26.73, 'P', 'PPLA2', 'PK.05', 'PK.05.1180802', 139784, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(327, 'PK', 'Dadhar', 'Dadhar', 67.65, 29.47, 'P', 'PPL', 'PK.02', 'PK.02.1175527', 15090, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(328, 'PK', 'Chunian', 'Chunian', 73.98, 30.97, 'P', 'PPL', 'PK.04', 'PK.04.1174623', 57312, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(329, 'PK', 'Chuchar-kana Mandi', 'Chuchar-kana Mandi', 73.80, 31.75, 'P', 'PPL', 'PK.04', 'PK.04.1165218', 69321, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(330, 'PK', 'Chhor', 'Chhor', 69.78, 25.51, 'P', 'PPL', 'PK.05', 'PK.05.9072726', 16301, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(331, 'PK', 'Choa Saidan Shah', 'Choa Saidan Shah', 72.99, 32.72, 'P', 'PPL', 'PK.04', 'PK.04.7418964', 15344, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(332, 'PK', 'Chishtian', 'Chishtian', 72.86, 29.80, 'P', 'PPL', 'PK.04', 'PK.04.1183882', 122199, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(333, 'PK', 'Chiniot', 'Chiniot', 72.98, 31.72, 'P', 'PPLA2', 'PK.04', 'PK.04.11886901', 201781, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(334, 'PK', 'Chichawatni', 'Chichawatni', 72.69, 30.53, 'P', 'PPL', 'PK.04', 'PK.04.1166545', 82762, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(335, 'PK', 'Chawinda', 'Chawinda', 74.71, 32.34, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 23599, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(336, 'PK', 'Charsadda', 'Charsadda', 71.74, 34.15, 'P', 'PPLA2', 'PK.03', 'PK.03.7419051', 95319, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(337, 'PK', 'Chamber', 'Chamber', 68.81, 25.29, 'P', 'PPL', 'PK.05', 'PK.05.9625763', 12746, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(338, 'PK', 'Chaman', 'Chaman', 66.45, 30.92, 'P', 'PPL', 'PK.02', 'PK.02.6641961', 88568, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(339, 'PK', 'Chakwal', 'Chakwal', 72.85, 32.93, 'P', 'PPLA2', 'PK.04', 'PK.04.7418964', 101200, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(340, 'PK', 'Chak Azam Sahu', 'Chak Azam Sahu', 73.03, 30.75, 'P', 'PPL', 'PK.04', 'PK.04.1166545', 38216, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(341, 'PK', 'Chak', 'Chak', 68.83, 27.86, 'P', 'PPL', 'PK.05', 'PK.05.1165106', 14275, 'Asia/Karachi', 1, '2019-12-23 23:00:00', '2019-12-23 23:00:00'),
(342, 'PK', 'Būrewāla', 'Burewala', 72.65, 30.17, 'P', 'PPL', 'PK.04', 'PK.04.10344547', 183915, 'Asia/Karachi', 1, '2019-12-10 23:00:00', '2019-12-10 23:00:00'),
(343, 'PK', 'Bozdar Wada', 'Bozdar Wada', 68.64, 27.18, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 9175, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(344, 'PK', 'Bhopalwala', 'Bhopalwala', 74.36, 32.43, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 17341, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(345, 'PK', 'Bhit Shah', 'Bhit Shah', 68.49, 25.81, 'P', 'PPL', 'PK.05', 'PK.05.7419157', 19325, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(346, 'PK', 'Bhiria', 'Bhiria', 68.19, 26.91, 'P', 'PPL', 'PK.05', 'PK.05.7352189', 12186, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(347, 'PK', 'Bhimbar', 'Bhimbar', 74.08, 32.97, 'P', 'PPL', 'PK.06', 'PK.06.7536187', 342900, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(348, 'PK', 'Bhera', 'Bhera', 72.91, 32.48, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 31781, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(349, 'PK', 'Bhawana', 'Bhawana', 72.65, 31.57, 'P', 'PPL', 'PK.04', 'PK.04.11886901', 16218, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(350, 'PK', 'Bhan', 'Bhan', 67.72, 26.56, 'P', 'PPL', 'PK.05', 'PK.05.7419156', 16961, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(351, 'PK', 'Bhalwal', 'Bhalwal', 72.90, 32.27, 'P', 'PPL', 'PK.04', 'PK.04.1165999', 74744, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(352, 'PK', 'Bhakkar', 'Bhakkar', 71.06, 31.63, 'P', 'PPLA2', 'PK.04', 'PK.04.7418966', 81950, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(353, 'PK', 'Mianke Mor', 'Mianke Mor', 73.95, 31.20, 'P', 'PPL', 'PK.04', 'PK.04.1174623', 86900, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(354, 'PK', 'Bhag', 'Bhag', 67.82, 29.04, 'P', 'PPL', 'PK.02', 'PK.02.11744836', 14555, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(355, 'PK', 'Berani', 'Berani', 68.81, 25.79, 'P', 'PPL', 'PK.05', 'PK.05.1166162', 9975, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(356, 'PK', 'Bela', 'Bela', 66.31, 26.23, 'P', 'PPL', 'PK.02', 'PK.02.1172115', 20119, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(357, 'PK', 'Begowala', 'Begowala', 74.27, 32.44, 'P', 'PPL', 'PK.04', 'PK.04.1164908', 9259, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(358, 'PK', 'Bat Khela', 'Bat Khela', 71.97, 34.62, 'P', 'PPL', 'PK.03', 'PK.03.1171388', 46079, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(359, 'PK', 'Battagram', 'Battagram', 73.02, 34.68, 'P', 'PPLA2', 'PK.03', 'PK.03.8224052', 700000, 'Asia/Karachi', 1, '2016-12-14 23:00:00', '2016-12-14 23:00:00'),
(360, 'PK', 'Basirpur', 'Basirpur', 73.84, 30.58, 'P', 'PPL', 'PK.04', 'PK.04.7418888', 41617, 'Asia/Karachi', 1, '2020-01-07 23:00:00', '2020-01-07 23:00:00'),
(361, 'PK', 'Barkhan', 'Barkhan', 69.53, 29.90, 'P', 'PPLA2', 'PK.02', 'PK.02.6641912', 8760, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(362, 'PK', 'Bannu', 'Bannu', 70.60, 32.99, 'P', 'PPLA2', 'PK.03', 'PK.03.1183459', 49008, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(363, 'PK', 'Bandhi', 'Bandhi', 68.30, 26.59, 'P', 'PPL', 'PK.05', 'PK.05.1169115', 8608, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(364, 'PK', 'Bahawalpur', 'Bahawalpur', 71.68, 29.40, 'P', 'PPLA2', 'PK.04', 'PK.04.1183876', 552607, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(365, 'PK', 'Bahawalnagar', 'Bahawalnagar', 73.25, 30.00, 'P', 'PPLA2', 'PK.04', 'PK.04.1183882', 126617, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(366, 'PK', 'Bagarji', 'Bagarji', 68.76, 27.75, 'P', 'PPL', 'PK.05', 'PK.05.1164407', 8005, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(367, 'PK', 'Baffa', 'Baffa', 73.22, 34.44, 'P', 'PPL', 'PK.03', 'PK.03.1170950', 14047, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(368, 'PK', 'Badin', 'Badin', 68.84, 24.66, 'P', 'PPLA2', 'PK.05', 'PK.05.1184051', 73569, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(369, 'PK', 'Baddomalhi', 'Baddomalhi', 74.66, 31.99, 'P', 'PPL', 'PK.04', 'PK.04.7418968', 18435, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(370, 'PK', 'Attock City', 'Attock City', 72.36, 33.77, 'P', 'PPLA2', 'PK.04', 'PK.04.1184248', 85479, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(371, 'PK', 'Arifwala', 'Arifwala', 73.07, 30.29, 'P', 'PPL', 'PK.04', 'PK.04.7418850', 87360, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(372, 'PK', 'Aman Garh', 'Aman Garh', 71.93, 34.01, 'P', 'PPL', 'PK.03', 'PK.03.7419052', 25723, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(373, 'PK', 'Alipur', 'Alipur', 70.91, 29.38, 'P', 'PPL', 'PK.04', 'PK.04.1169603', 33601, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(374, 'PK', 'Akora', 'Akora', 72.13, 34.00, 'P', 'PPL', 'PK.03', 'PK.03.7419052', 23288, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(375, 'PK', 'Ahmadpur East', 'Ahmadpur East', 71.26, 29.14, 'P', 'PPL', 'PK.04', 'PK.04.1183876', 116579, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(376, 'PK', 'Abbottabad', 'Abbottabad', 73.21, 34.15, 'P', 'PPLA2', 'PK.03', 'PK.03.1185055', 120000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(377, 'PK', 'Bahawalnagar', 'Bahawalnagar', 73.39, 30.55, 'P', 'PPL', 'PK.04', 'PK.04.7418888', 126700, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(378, 'PK', 'Nowshera Cantonment', 'Nowshera Cantonment', 72.00, 34.00, 'P', 'PPL', 'PK.03', 'PK.03.7419052', 96766, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(379, 'PK', 'Alik Ghund', 'Alik Ghund', 67.52, 30.49, 'P', 'PPL', 'PK.02', 'PK.02.6641972', 7630, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(380, 'PK', 'Khadan Khak', 'Khadan Khak', 67.71, 30.75, 'P', 'PPL', 'PK.02', 'PK.02.6641963', 6622, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(381, 'PK', 'Ahmadpur Sial', 'Ahmadpur Sial', 71.74, 30.68, 'P', 'PPL', 'PK.04', 'PK.04.1175906', 24889, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(382, 'PK', 'New Bādāh', 'New Badah', 68.03, 27.34, 'P', 'PPL', 'PK.05', 'PK.05.1172127', 38855, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(383, 'PK', 'Jām Sāhib', 'Jam Sahib', 68.63, 26.30, 'P', 'PPL', 'PK.05', 'PK.05.1169115', 6869, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(384, 'PK', 'Setharja Old', 'Setharja Old', 68.47, 27.21, 'P', 'PPL', 'PK.05', 'PK.05.1174349', 32651, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(385, 'PK', 'Risalpur Cantonment', 'Risalpur Cantonment', 71.99, 34.06, 'P', 'PPL', 'PK.03', 'PK.03.7419052', 37084, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(386, 'PK', 'Malakwal City', 'Malakwal City', 73.21, 32.55, 'P', 'PPL', 'PK.04', 'PK.04.7418963', 35000, 'Asia/Karachi', 1, '2019-12-05 23:00:00', '2019-12-05 23:00:00'),
(387, 'PK', 'Nazir Town', 'Nazir Town', 73.48, 33.31, 'P', 'PPL', 'PK.04', 'PK.04.1180287', 6750, 'Asia/Karachi', 1, '2011-02-07 23:00:00', '2011-02-07 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` int(10) UNSIGNED DEFAULT NULL,
  `population` int(10) UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_zone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_format` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime_format` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_field_active` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `time_zone`, `date_format`, `datetime_format`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'AND', 20, 'AN', 'Andorra', 'Andorra', 'Andorra la Vella', 468, 84000, 'EU', '.ad', 'EUR', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 'ES,FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(2, 'AE', 'ARE', 784, 'AE', 'al-Imārāt', 'United Arab Emirates', 'Abu Dhabi', 82880, 4975593, 'AS', '.ae', 'AED', '971', '', '', 'ar-AE,fa,en,hi,ur', 'SA,OM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(3, 'AF', 'AFG', 4, 'AF', 'Afġānistān', 'Afghanistan', 'Kabul', 647500, 29121286, 'AS', '.af', 'AFN', '93', '', '', 'fa-AF,ps,uz-AF,tk', 'TM,CN,IR,TJ,PK,UZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(4, 'AG', 'ATG', 28, 'AC', 'Antigua and Barbuda', 'Antigua and Barbuda', 'St. John\'s', 443, 86754, 'NA', '.ag', 'XCD', '+1-268', '', '', 'en-AG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(5, 'AI', 'AIA', 660, 'AV', 'Anguilla', 'Anguilla', 'The Valley', 102, 13254, 'NA', '.ai', 'XCD', '+1-264', '', '', 'en-AI', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(6, 'AL', 'ALB', 8, 'AL', 'Shqipëria', 'Albania', 'Tirana', 28748, 2986952, 'EU', '.al', 'ALL', '355', '', '', 'sq,el', 'MK,GR,ME,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(7, 'AM', 'ARM', 51, 'AM', 'Hayastan', 'Armenia', 'Yerevan', 29800, 2968000, 'AS', '.am', 'AMD', '374', '######', '^(d{6})$', 'hy', 'GE,IR,AZ,TR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(8, 'AN', 'ANT', 530, 'NT', 'Netherlands Antilles', 'Netherlands Antilles', 'Willemstad', 960, 136197, 'NA', '.an', 'ANG', '599', '', '', 'nl-AN,en,es', 'GP', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(9, 'AO', 'AGO', 24, 'AO', 'Angola', 'Angola', 'Luanda', 1246700, 13068161, 'AF', '.ao', 'AOA', '244', '', '', 'pt-AO', 'CD,NA,ZM,CG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(10, 'AQ', 'ATA', 10, 'AY', 'Antarctica', 'Antarctica', '', 14000000, 0, 'AN', '.aq', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(11, 'AR', 'ARG', 32, 'AR', 'Argentina', 'Argentina', 'Buenos Aires', 2766890, 41343201, 'SA', '.ar', 'ARS', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 'CL,BO,UY,PY,BR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(12, 'AS', 'ASM', 16, 'AQ', 'American Samoa', 'American Samoa', 'Pago Pago', 199, 57881, 'OC', '.as', 'USD', '+1-684', '', '', 'en-AS,sm,to', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(13, 'AT', 'AUT', 40, 'AU', 'Österreich', 'Austria', 'Vienna', 83858, 8205000, 'EU', '.at', 'EUR', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 'CH,DE,HU,SK,CZ,IT,SI,LI', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(14, 'AU', 'AUS', 36, 'AS', 'Australia', 'Australia', 'Canberra', 7686850, 21515754, 'OC', '.au', 'AUD', '61', '####', '^(d{4})$', 'en-AU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(15, 'AW', 'ABW', 533, 'AA', 'Aruba', 'Aruba', 'Oranjestad', 193, 71566, 'NA', '.aw', 'AWG', '297', '', '', 'nl-AW,es,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(16, 'AX', 'ALA', 248, '', 'Aland Islands', 'Aland Islands', 'Mariehamn', 1580, 26711, 'EU', '.ax', 'EUR', '+358-18', '#####', '^(?:FI)*(d{5})$', 'sv-AX', '', 'FI', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(17, 'AZ', 'AZE', 31, 'AJ', 'Azərbaycan', 'Azerbaijan', 'Baku', 86600, 8303512, 'AS', '.az', 'AZN', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 'GE,IR,AM,TR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(18, 'BA', 'BIH', 70, 'BK', 'Bosna i Hercegovina', 'Bosnia and Herzegovina', 'Sarajevo', 51129, 4590000, 'EU', '.ba', 'BAM', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 'HR,ME,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(19, 'BB', 'BRB', 52, 'BB', 'Barbados', 'Barbados', 'Bridgetown', 431, 285653, 'NA', '.bb', 'BBD', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(20, 'BD', 'BGD', 50, 'BG', 'Bāṅlādēś', 'Bangladesh', 'Dhaka', 144000, 156118464, 'AS', '.bd', 'BDT', '880', '####', '^(d{4})$', 'bn-BD,en', 'MM,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(21, 'BE', 'BEL', 56, 'BE', 'Belgique', 'Belgium', 'Brussels', 30510, 10403000, 'EU', '.be', 'EUR', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 'DE,NL,LU,FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(22, 'BF', 'BFA', 854, 'UV', 'Burkina Faso', 'Burkina Faso', 'Ouagadougou', 274200, 16241811, 'AF', '.bf', 'XOF', '226', '', '', 'fr-BF', 'NE,BJ,GH,CI,TG,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(23, 'BG', 'BGR', 100, 'BU', 'Bŭlgarija', 'Bulgaria', 'Sofia', 110910, 7148785, 'EU', '.bg', 'BGN', '359', '####', '^(d{4})$', 'bg,tr-BG,rom', 'MK,GR,RO,TR,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(24, 'BH', 'BHR', 48, 'BA', 'al-Baḥrayn', 'Bahrain', 'Manama', 665, 738004, 'AS', '.bh', 'BHD', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(25, 'BI', 'BDI', 108, 'BY', 'Burundi', 'Burundi', 'Bujumbura', 27830, 9863117, 'AF', '.bi', 'BIF', '257', '', '', 'fr-BI,rn', 'TZ,CD,RW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(26, 'BJ', 'BEN', 204, 'BN', 'Bénin', 'Benin', 'Porto-Novo', 112620, 9056010, 'AF', '.bj', 'XOF', '+229', '', '', 'fr-BJ', 'NE,TG,BF,NG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(27, 'BL', 'BLM', 652, 'TB', 'Saint Barthelemy', 'Saint Barthelemy', 'Gustavia', 21, 8450, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(28, 'BM', 'BMU', 60, 'BD', 'Bermuda', 'Bermuda', 'Hamilton', 53, 65365, 'NA', '.bm', 'BMD', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(29, 'BN', 'BRN', 96, 'BX', 'Brunei Darussalam', 'Brunei', 'Bandar Seri Begawan', 5770, 395027, 'AS', '.bn', 'BND', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 'MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(30, 'BO', 'BOL', 68, 'BL', 'Bolivia', 'Bolivia', 'Sucre', 1098580, 9947418, 'SA', '.bo', 'BOB', '591', '', '', 'es-BO,qu,ay', 'PE,CL,PY,BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(31, 'BQ', 'BES', 535, '', 'Bonaire, Saint Eustatius and Saba ', 'Bonaire, Saint Eustatius and Saba ', '', 328, 18012, 'NA', '.bq', 'USD', '599', '', '', 'nl,pap,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(32, 'BR', 'BRA', 76, 'BR', 'Brasil', 'Brazil', 'Brasilia', 8511965, 201103330, 'SA', '.br', 'BRL', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(33, 'BS', 'BHS', 44, 'BF', 'Bahamas', 'Bahamas', 'Nassau', 13940, 301790, 'NA', '.bs', 'BSD', '+1-242', '', '', 'en-BS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(34, 'BT', 'BTN', 64, 'BT', 'Druk-yul', 'Bhutan', 'Thimphu', 47000, 699847, 'AS', '.bt', 'BTN', '975', '', '', 'dz', 'CN,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(35, 'BV', 'BVT', 74, 'BV', 'Bouvet Island', 'Bouvet Island', '', 49, 0, 'AN', '.bv', 'NOK', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(36, 'BW', 'BWA', 72, 'BC', 'Botswana', 'Botswana', 'Gaborone', 600370, 2029307, 'AF', '.bw', 'BWP', '267', '', '', 'en-BW,tn-BW', 'ZW,ZA,NA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(37, 'BY', 'BLR', 112, 'BO', 'Biełaruś', 'Belarus', 'Minsk', 207600, 9685000, 'EU', '.by', 'BYR', '375', '######', '^(d{6})$', 'be,ru', 'PL,LT,UA,RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(38, 'BZ', 'BLZ', 84, 'BH', 'Belize', 'Belize', 'Belmopan', 22966, 314522, 'NA', '.bz', 'BZD', '501', '', '', 'en-BZ,es', 'GT,MX', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(39, 'CA', 'CAN', 124, 'CA', 'Canada', 'Canada', 'Ottawa', 9984670, 33679000, 'NA', '.ca', 'CAD', '1', '@#@ #@#', '^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ', 'en-CA,fr-CA,iu', 'US', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(40, 'CC', 'CCK', 166, 'CK', 'Cocos Islands', 'Cocos Islands', 'West Island', 14, 628, 'AS', '.cc', 'AUD', '61', '', '', 'ms-CC,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(41, 'CD', 'COD', 180, 'CG', 'RDC', 'Democratic Republic of the Congo', 'Kinshasa', 2345410, 70916439, 'AF', '.cd', 'CDF', '243', '', '', 'fr-CD,ln,kg', 'TZ,CF,SS,RW,ZM,BI,UG,CG,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(42, 'CF', 'CAF', 140, 'CT', 'Centrafrique', 'Central African Republic', 'Bangui', 622984, 4844927, 'AF', '.cf', 'XAF', '236', '', '', 'fr-CF,sg,ln,kg', 'TD,SD,CD,SS,CM,CG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(43, 'CG', 'COG', 178, 'CF', 'Congo', 'Republic of the Congo', 'Brazzaville', 342000, 3039126, 'AF', '.cg', 'XAF', '242', '', '', 'fr-CG,kg,ln-CG', 'CF,GA,CD,CM,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(44, 'CH', 'CHE', 756, 'SZ', 'Switzerland', 'Switzerland', 'Berne', 41290, 7581000, 'EU', '.ch', 'CHF', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 'DE,IT,LI,FR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(45, 'CI', 'CIV', 384, 'IV', 'Côte d\'Ivoire', 'Ivory Coast', 'Yamoussoukro', 322460, 21058798, 'AF', '.ci', 'XOF', '225', '', '', 'fr-CI', 'LR,GH,GN,BF,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(46, 'CK', 'COK', 184, 'CW', 'Cook Islands', 'Cook Islands', 'Avarua', 240, 21388, 'OC', '.ck', 'NZD', '682', '', '', 'en-CK,mi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(47, 'CL', 'CHL', 152, 'CI', 'Chile', 'Chile', 'Santiago', 756950, 16746491, 'SA', '.cl', 'CLP', '56', '#######', '^(d{7})$', 'es-CL', 'PE,BO,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(48, 'CM', 'CMR', 120, 'CM', 'Cameroun', 'Cameroon', 'Yaounde', 475440, 19294149, 'AF', '.cm', 'XAF', '237', '', '', 'fr-CM,en-CM', 'TD,CF,GA,GQ,CG,NG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(49, 'CN', 'CHN', 156, 'CH', 'Zhōngguó', 'China', 'Beijing', 9596960, 1330044000, 'AS', '.cn', 'CNY', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(50, 'CO', 'COL', 170, 'CO', 'Colombia', 'Colombia', 'Bogota', 1138910, 47790000, 'SA', '.co', 'COP', '57', '', '', 'es-CO', 'EC,PE,PA,BR,VE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(51, 'CR', 'CRI', 188, 'CS', 'Costa Rica', 'Costa Rica', 'San Jose', 51100, 4516220, 'NA', '.cr', 'CRC', '506', '####', '^(d{4})$', 'es-CR,en', 'PA,NI', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(52, 'CS', 'SCG', 891, 'YI', 'Serbia and Montenegro', 'Serbia and Montenegro', 'Belgrade', 102350, 10829175, 'EU', '.cs', 'RSD', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 'AL,HU,MK,RO,HR,BA,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(53, 'CU', 'CUB', 192, 'CU', 'Cuba', 'Cuba', 'Havana', 110860, 11423000, 'NA', '.cu', 'CUP', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 'US', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(54, 'CV', 'CPV', 132, 'CV', 'Cabo Verde', 'Cape Verde', 'Praia', 4033, 508659, 'AF', '.cv', 'CVE', '238', '####', '^(d{4})$', 'pt-CV', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(55, 'CW', 'CUW', 531, 'UC', 'Curacao', 'Curacao', ' Willemstad', 444, 141766, 'NA', '.cw', 'ANG', '599', '', '', 'nl,pap', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(56, 'CX', 'CXR', 162, 'KT', 'Christmas Island', 'Christmas Island', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(57, 'CY', 'CYP', 196, 'CY', 'Kýpros (Kıbrıs)', 'Cyprus', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(58, 'CZ', 'CZE', 203, 'EZ', 'Česko', 'Czech Republic', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(59, 'DE', 'DEU', 276, 'GM', 'Deutschland', 'Germany', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(60, 'DJ', 'DJI', 262, 'DJ', 'Djibouti', 'Djibouti', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(61, 'DK', 'DNK', 208, 'DA', 'Danmark', 'Denmark', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(62, 'DM', 'DMA', 212, 'DO', 'Dominica', 'Dominica', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(63, 'DO', 'DOM', 214, 'DR', 'República Dominicana', 'Dominican Republic', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(64, 'DZ', 'DZA', 12, 'AG', 'Algérie', 'Algeria', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(65, 'EC', 'ECU', 218, 'EC', 'Ecuador', 'Ecuador', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(66, 'EE', 'EST', 233, 'EN', 'Eesti', 'Estonia', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(67, 'EG', 'EGY', 818, 'EG', 'Egypt', 'Egypt', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(68, 'EH', 'ESH', 732, 'WI', 'aṣ-Ṣaḥrāwīyâ al-ʿArabīyâ', 'Western Sahara', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(69, 'ER', 'ERI', 232, 'ER', 'Ertrā', 'Eritrea', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(70, 'ES', 'ESP', 724, 'SP', 'España', 'Spain', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(71, 'ET', 'ETH', 231, 'ET', 'Ityoṗya', 'Ethiopia', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(72, 'FI', 'FIN', 246, 'FI', 'Suomi (Finland)', 'Finland', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(73, 'FJ', 'FJI', 242, 'FJ', 'Viti', 'Fiji', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(74, 'FK', 'FLK', 238, 'FK', 'Falkland Islands', 'Falkland Islands', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(75, 'FM', 'FSM', 583, 'FM', 'Micronesia', 'Micronesia', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(76, 'FO', 'FRO', 234, 'FO', 'Føroyar', 'Faroe Islands', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(77, 'FR', 'FRA', 250, 'FR', 'France', 'France', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(78, 'GA', 'GAB', 266, 'GB', 'Gabon', 'Gabon', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(79, 'GD', 'GRD', 308, 'GJ', 'Grenada', 'Grenada', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(80, 'GE', 'GEO', 268, 'GG', 'Sak\'art\'velo', 'Georgia', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(81, 'GF', 'GUF', 254, 'FG', 'Guyane', 'French Guiana', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(82, 'GG', 'GGY', 831, 'GK', 'Guernsey', 'Guernsey', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(83, 'GH', 'GHA', 288, 'GH', 'Ghana', 'Ghana', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(84, 'GI', 'GIB', 292, 'GI', 'Gibraltar', 'Gibraltar', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(85, 'GL', 'GRL', 304, 'GL', 'Grønland', 'Greenland', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(86, 'GM', 'GMB', 270, 'GA', 'Gambia', 'Gambia', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(87, 'GN', 'GIN', 324, 'GV', 'Guinée', 'Guinea', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(88, 'GP', 'GLP', 312, 'GP', 'Guadeloupe', 'Guadeloupe', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(89, 'GQ', 'GNQ', 226, 'EK', 'Guinée Equatoriale', 'Equatorial Guinea', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(90, 'GR', 'GRC', 300, 'GR', 'Elláda', 'Greece', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(91, 'GS', 'SGS', 239, 'SX', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(92, 'GT', 'GTM', 320, 'GT', 'Guatemala', 'Guatemala', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(93, 'GU', 'GUM', 316, 'GQ', 'Guam', 'Guam', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(94, 'GW', 'GNB', 624, 'PU', 'Guiné-Bissau', 'Guinea-Bissau', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(95, 'GY', 'GUY', 328, 'GY', 'Guyana', 'Guyana', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(96, 'HK', 'HKG', 344, 'HK', 'Hèunggóng', 'Hong Kong', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(97, 'HM', 'HMD', 334, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(98, 'HN', 'HND', 340, 'HO', 'Honduras', 'Honduras', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(99, 'HR', 'HRV', 191, 'HR', 'Hrvatska', 'Croatia', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(100, 'HT', 'HTI', 332, 'HA', 'Haïti', 'Haiti', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(101, 'HU', 'HUN', 348, 'HU', 'Magyarország', 'Hungary', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(102, 'ID', 'IDN', 360, 'ID', 'Indonesia', 'Indonesia', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(103, 'IE', 'IRL', 372, 'EI', 'Ireland', 'Ireland', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(104, 'IL', 'ISR', 376, 'IS', 'Yiśrā\'ēl', 'Israel', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(105, 'IM', 'IMN', 833, 'IM', 'Isle of Man', 'Isle of Man', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(106, 'IN', 'IND', 356, 'IN', 'Bhārat', 'India', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(107, 'IO', 'IOT', 86, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(108, 'IQ', 'IRQ', 368, 'IZ', 'al-ʿIrāq', 'Iraq', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(109, 'IR', 'IRN', 364, 'IR', 'Īrān', 'Iran', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(110, 'IS', 'ISL', 352, 'IC', 'Ísland', 'Iceland', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(111, 'IT', 'ITA', 380, 'IT', 'Italia', 'Italy', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(112, 'JE', 'JEY', 832, 'JE', 'Jersey', 'Jersey', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(113, 'JM', 'JAM', 388, 'JM', 'Jamaica', 'Jamaica', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(114, 'JO', 'JOR', 400, 'JO', 'al-Urdun', 'Jordan', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(115, 'JP', 'JPN', 392, 'JA', 'Nihon', 'Japan', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(116, 'KE', 'KEN', 404, 'KE', 'Kenya', 'Kenya', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(117, 'KG', 'KGZ', 417, 'KG', 'Kyrgyzstan', 'Kyrgyzstan', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(118, 'KH', 'KHM', 116, 'CB', 'Kambucā', 'Cambodia', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(119, 'KI', 'KIR', 296, 'KR', 'Kiribati', 'Kiribati', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(120, 'KM', 'COM', 174, 'CN', 'Comores', 'Comoros', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(121, 'KN', 'KNA', 659, 'SC', 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(122, 'KP', 'PRK', 408, 'KN', 'Joseon', 'North Korea', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(123, 'KR', 'KOR', 410, 'KS', 'Hanguk', 'South Korea', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(124, 'KW', 'KWT', 414, 'KU', 'al-Kuwayt', 'Kuwait', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(125, 'KY', 'CYM', 136, 'CJ', 'Cayman Islands', 'Cayman Islands', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(126, 'KZ', 'KAZ', 398, 'KZ', 'Ķazaķstan', 'Kazakhstan', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(127, 'LA', 'LAO', 418, 'LA', 'Lāw', 'Laos', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(128, 'LB', 'LBN', 422, 'LE', 'Lubnān', 'Lebanon', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(129, 'LC', 'LCA', 662, 'ST', 'Saint Lucia', 'Saint Lucia', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(130, 'LI', 'LIE', 438, 'LS', 'Liechtenstein', 'Liechtenstein', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(131, 'LK', 'LKA', 144, 'CE', 'Šrī Laṁkā', 'Sri Lanka', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(132, 'LR', 'LBR', 430, 'LI', 'Liberia', 'Liberia', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(133, 'LS', 'LSO', 426, 'LT', 'Lesotho', 'Lesotho', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(134, 'LT', 'LTU', 440, 'LH', 'Lietuva', 'Lithuania', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(135, 'LU', 'LUX', 442, 'LU', 'Lëtzebuerg', 'Luxembourg', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(136, 'LV', 'LVA', 428, 'LG', 'Latvija', 'Latvia', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(137, 'LY', 'LBY', 434, 'LY', 'Lībiyā', 'Libya', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(138, 'MA', 'MAR', 504, 'MO', 'Maroc', 'Morocco', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(139, 'MC', 'MCO', 492, 'MN', 'Monaco', 'Monaco', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(140, 'MD', 'MDA', 498, 'MD', 'Moldova', 'Moldova', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(141, 'ME', 'MNE', 499, 'MJ', 'Crna Gora', 'Montenegro', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(142, 'MF', 'MAF', 663, 'RN', 'Saint Martin', 'Saint Martin', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(143, 'MG', 'MDG', 450, 'MA', 'Madagascar', 'Madagascar', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(144, 'MH', 'MHL', 584, 'RM', 'Marshall Islands', 'Marshall Islands', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(145, 'MK', 'MKD', 807, 'MK', 'Makedonija', 'Macedonia', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(146, 'ML', 'MLI', 466, 'ML', 'Mali', 'Mali', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(147, 'MM', 'MMR', 104, 'BM', 'Mẏanmā', 'Myanmar', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(148, 'MN', 'MNG', 496, 'MG', 'Mongol Uls', 'Mongolia', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(149, 'MO', 'MAC', 446, 'MC', 'Ngoumún', 'Macao', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(150, 'MP', 'MNP', 580, 'CQ', 'Northern Mariana Islands', 'Northern Mariana Islands', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(151, 'MQ', 'MTQ', 474, 'MB', 'Martinique', 'Martinique', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(152, 'MR', 'MRT', 478, 'MR', 'Mauritanie', 'Mauritania', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(153, 'MS', 'MSR', 500, 'MH', 'Montserrat', 'Montserrat', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(154, 'MT', 'MLT', 470, 'MT', 'Malta', 'Malta', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(155, 'MU', 'MUS', 480, 'MP', 'Mauritius', 'Mauritius', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(156, 'MV', 'MDV', 462, 'MV', 'Dhivehi', 'Maldives', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(157, 'MW', 'MWI', 454, 'MI', 'Malawi', 'Malawi', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(158, 'MX', 'MEX', 484, 'MX', 'México', 'Mexico', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(159, 'MY', 'MYS', 458, 'MY', 'Malaysia', 'Malaysia', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(160, 'MZ', 'MOZ', 508, 'MZ', 'Moçambique', 'Mozambique', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(161, 'NA', 'NAM', 516, 'WA', 'Namibia', 'Namibia', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(162, 'NC', 'NCL', 540, 'NC', 'Nouvelle Calédonie', 'New Caledonia', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(163, 'NE', 'NER', 562, 'NG', 'Niger', 'Niger', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(164, 'NF', 'NFK', 574, 'NF', 'Norfolk Island', 'Norfolk Island', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(165, 'NG', 'NGA', 566, 'NI', 'Nigeria', 'Nigeria', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(166, 'NI', 'NIC', 558, 'NU', 'Nicaragua', 'Nicaragua', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(167, 'NL', 'NLD', 528, 'NL', 'Nederland', 'Netherlands', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(168, 'NO', 'NOR', 578, 'NO', 'Norge (Noreg)', 'Norway', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(169, 'NP', 'NPL', 524, 'NP', 'Nēpāl', 'Nepal', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(170, 'NR', 'NRU', 520, 'NR', 'Naoero', 'Nauru', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(171, 'NU', 'NIU', 570, 'NE', 'Niue', 'Niue', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(172, 'NZ', 'NZL', 554, 'NZ', 'New Zealand', 'New Zealand', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(173, 'OM', 'OMN', 512, 'MU', 'ʿUmān', 'Oman', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(174, 'PA', 'PAN', 591, 'PM', 'Panamá', 'Panama', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(175, 'PE', 'PER', 604, 'PE', 'Perú', 'Peru', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(176, 'PF', 'PYF', 258, 'FP', 'Polinésie Française', 'French Polynesia', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(177, 'PG', 'PNG', 598, 'PP', 'Papua New Guinea', 'Papua New Guinea', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(178, 'PH', 'PHL', 608, 'RP', 'Pilipinas', 'Philippines', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(179, 'PK', 'PAK', 586, 'PK', 'Pākistān', 'Pakistan', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', 'Asia/Karachi', NULL, NULL, NULL, '0', 0, 1, '2021-02-16 08:48:26', '2021-02-16 08:48:36'),
(180, 'PL', 'POL', 616, 'PL', 'Polska', 'Poland', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(181, 'PM', 'SPM', 666, 'SB', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(182, 'PN', 'PCN', 612, 'PC', 'Pitcairn', 'Pitcairn', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(183, 'PR', 'PRI', 630, 'RQ', 'Puerto Rico', 'Puerto Rico', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(184, 'PS', 'PSE', 275, 'WE', 'Filasṭīn', 'Palestinian Territory', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(185, 'PT', 'PRT', 620, 'PO', 'Portugal', 'Portugal', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(186, 'PW', 'PLW', 585, 'PS', 'Palau', 'Palau', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(187, 'PY', 'PRY', 600, 'PA', 'Paraguay', 'Paraguay', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(188, 'QA', 'QAT', 634, 'QA', 'Qaṭar', 'Qatar', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(189, 'RE', 'REU', 638, 'RE', 'Réunion', 'Reunion', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(190, 'RO', 'ROU', 642, 'RO', 'România', 'Romania', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(191, 'RS', 'SRB', 688, 'RI', 'Srbija', 'Serbia', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(192, 'RU', 'RUS', 643, 'RS', 'Rossija', 'Russia', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(193, 'RW', 'RWA', 646, 'RW', 'Rwanda', 'Rwanda', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(194, 'SA', 'SAU', 682, 'SA', 'as-Saʿūdīyâ', 'Saudi Arabia', 'Riyadh', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(195, 'SB', 'SLB', 90, 'BP', 'Solomon Islands', 'Solomon Islands', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(196, 'SC', 'SYC', 690, 'SE', 'Seychelles', 'Seychelles', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(197, 'SD', 'SDN', 729, 'SU', 'Sudan', 'Sudan', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(198, 'SE', 'SWE', 752, 'SW', 'Sverige', 'Sweden', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(199, 'SG', 'SGP', 702, 'SN', 'xīnjiāpō', 'Singapore', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(200, 'SH', 'SHN', 654, 'SH', 'Saint Helena', 'Saint Helena', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(201, 'SI', 'SVN', 705, 'SI', 'Slovenija', 'Slovenia', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(202, 'SJ', 'SJM', 744, 'SV', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(203, 'SK', 'SVK', 703, 'LO', 'Slovensko', 'Slovakia', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(204, 'SL', 'SLE', 694, 'SL', 'Sierra Leone', 'Sierra Leone', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(205, 'SM', 'SMR', 674, 'SM', 'San Marino', 'San Marino', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26');
INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `time_zone`, `date_format`, `datetime_format`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(206, 'SN', 'SEN', 686, 'SG', 'Sénégal', 'Senegal', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(207, 'SO', 'SOM', 706, 'SO', 'Soomaaliya', 'Somalia', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(208, 'SR', 'SUR', 740, 'NS', 'Suriname', 'Suriname', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(209, 'SS', 'SSD', 728, 'OD', 'South Sudan', 'South Sudan', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(210, 'ST', 'STP', 678, 'TP', 'São Tomé e Príncipe', 'Sao Tome and Principe', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(211, 'SV', 'SLV', 222, 'ES', 'El Salvador', 'El Salvador', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(212, 'SX', 'SXM', 534, 'NN', 'Sint Maarten', 'Sint Maarten', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(213, 'SY', 'SYR', 760, 'SY', 'Sūrīyâ', 'Syria', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(214, 'SZ', 'SWZ', 748, 'WZ', 'Swaziland', 'Swaziland', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(215, 'TC', 'TCA', 796, 'TK', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(216, 'TD', 'TCD', 148, 'CD', 'Tchad', 'Chad', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(217, 'TF', 'ATF', 260, 'FS', 'French Southern Territories', 'French Southern Territories', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(218, 'TG', 'TGO', 768, 'TO', 'Togo', 'Togo', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(219, 'TH', 'THA', 764, 'TH', 'Prathēt tai', 'Thailand', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(220, 'TJ', 'TJK', 762, 'TI', 'Tojikiston', 'Tajikistan', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(221, 'TK', 'TKL', 772, 'TL', 'Tokelau', 'Tokelau', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(222, 'TL', 'TLS', 626, 'TT', 'Timór Lorosa\'e', 'East Timor', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(223, 'TM', 'TKM', 795, 'TX', 'Turkmenistan', 'Turkmenistan', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(224, 'TN', 'TUN', 788, 'TS', 'Tunisie', 'Tunisia', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(225, 'TO', 'TON', 776, 'TN', 'Tonga', 'Tonga', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(226, 'TR', 'TUR', 792, 'TU', 'Türkiye', 'Turkey', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(227, 'TT', 'TTO', 780, 'TD', 'Trinidad and Tobago', 'Trinidad and Tobago', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(228, 'TV', 'TUV', 798, 'TV', 'Tuvalu', 'Tuvalu', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(229, 'TW', 'TWN', 158, 'TW', 'T\'ai2-wan1', 'Taiwan', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(230, 'TZ', 'TZA', 834, 'TZ', 'Tanzania', 'Tanzania', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(231, 'UA', 'UKR', 804, 'UP', 'Ukrajina', 'Ukraine', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(232, 'UG', 'UGA', 800, 'UG', 'Uganda', 'Uganda', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(233, 'UK', 'GBR', 826, 'UK', 'United Kingdom', 'United Kingdom', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(234, 'UM', 'UMI', 581, '', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(235, 'US', 'USA', 840, 'US', 'USA', 'United States', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(236, 'UY', 'URY', 858, 'UY', 'Uruguay', 'Uruguay', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(237, 'UZ', 'UZB', 860, 'UZ', 'O\'zbekiston', 'Uzbekistan', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(238, 'VA', 'VAT', 336, 'VT', 'Vaticanum', 'Vatican', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(239, 'VC', 'VCT', 670, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(240, 'VE', 'VEN', 862, 'VE', 'Venezuela', 'Venezuela', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(241, 'VG', 'VGB', 92, 'VI', 'British Virgin Islands', 'British Virgin Islands', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(242, 'VI', 'VIR', 850, 'VQ', 'U.S. Virgin Islands', 'U.S. Virgin Islands', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(243, 'VN', 'VNM', 704, 'VM', 'Việt Nam', 'Vietnam', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(244, 'VU', 'VUT', 548, 'NH', 'Vanuatu', 'Vanuatu', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(245, 'WF', 'WLF', 876, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(246, 'WS', 'WSM', 882, 'WS', 'Samoa', 'Samoa', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(247, 'XK', 'XKX', 0, 'KV', 'Kosovo', 'Kosovo', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(248, 'YE', 'YEM', 887, 'YM', 'al-Yaman', 'Yemen', 'Sanaa', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(249, 'YT', 'MYT', 175, 'MF', 'Mayotte', 'Mayotte', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(250, 'ZA', 'ZAF', 710, 'SF', 'South Africa', 'South Africa', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(251, 'ZM', 'ZMB', 894, 'ZA', 'Zambia', 'Zambia', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(252, 'ZW', 'ZWE', 716, 'ZI', 'Zimbabwe', 'Zimbabwe', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-02-16 08:48:26', '2021-02-16 08:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_entities` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'HTML Entities of Symbols: https://gist.github.com/Gibbs/3920259',
  `in_left` tinyint(1) UNSIGNED DEFAULT '0',
  `decimal_places` int(10) UNSIGNED DEFAULT '0' COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `html_entities`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(1, 'AED', 'United Arab Emirates Dirham', 'د.إ', '&#1583;.&#1573;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(2, 'AFN', 'Afghanistan Afghani', '؋', '&#65;&#102;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(3, 'ALL', 'Albania Lek', 'Lek', '&#76;&#101;&#107;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(4, 'AMD', 'Armenia Dram', NULL, '', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(5, 'ANG', 'Netherlands Antilles Guilder', 'ƒ', '&#402;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(6, 'AOA', 'Angola Kwanza', 'Kz', '&#75;&#122;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(7, 'ARS', 'Argentina Peso', '$', '&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(8, 'AUD', 'Australia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(9, 'AWG', 'Aruba Guilder', 'ƒ', '&#402;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(10, 'AZN', 'Azerbaijan New Manat', 'ман', '&#1084;&#1072;&#1085;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(11, 'BAM', 'Bosnia and Herzegovina Convertible Marka', 'KM', '&#75;&#77;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(12, 'BBD', 'Barbados Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(13, 'BDT', 'Bangladesh Taka', '৳', '&#2547;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(14, 'BGN', 'Bulgaria Lev', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(15, 'BHD', 'Bahrain Dinar', NULL, '.&#1583;.&#1576;', 0, 3, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(16, 'BIF', 'Burundi Franc', 'FBu', '&#70;&#66;&#117;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(17, 'BMD', 'Bermuda Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(18, 'BND', 'Brunei Darussalam Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(19, 'BOB', 'Bolivia Boliviano', '$b', '&#36;&#98;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(20, 'BRL', 'Brazil Real', 'R$', '&#82;&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(21, 'BSD', 'Bahamas Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(22, 'BTN', 'Bhutan Ngultrum', NULL, '&#78;&#117;&#46;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(23, 'BWP', 'Botswana Pula', 'P', '&#80;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(24, 'BYR', 'Belarus Ruble', 'p.', '&#112;&#46;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(25, 'BZD', 'Belize Dollar', 'BZ$', '&#66;&#90;&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(26, 'CAD', 'Canada Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(27, 'CDF', 'Congo/Kinshasa Franc', 'Fr', '&#70;&#67;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(28, 'CHF', 'Switzerland Franc', 'Fr', '&#67;&#72;&#70;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(29, 'CLP', 'Chile Peso', '$', '&#36;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(30, 'CNY', 'China Yuan Renminbi', '¥', '&#165;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(31, 'COP', 'Colombia Peso', '$', '&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(32, 'CRC', 'Costa Rica Colon', '₡', '&#8353;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(33, 'CUC', 'Cuba Convertible Peso', NULL, NULL, 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(34, 'CUP', 'Cuba Peso', '₱', '&#8396;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(35, 'CVE', 'Cape Verde Escudo', '$', '&#x24;', 1, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(36, 'CZK', 'Czech Republic Koruna', 'Kč', '&#75;&#269;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(37, 'DJF', 'Djibouti Franc', 'Fr', '&#70;&#100;&#106;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(38, 'DKK', 'Denmark Krone', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(39, 'DOP', 'Dominican Republic Peso', 'RD$', '&#82;&#68;&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(40, 'DZD', 'Algeria Dinar', 'DA', '&#1583;&#1580;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(41, 'EEK', 'Estonia Kroon', 'kr', NULL, 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(42, 'EGP', 'Egypt Pound', '£', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(43, 'ERN', 'Eritrea Nakfa', 'Nfk', '&#x4E;&#x66;&#x6B;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(44, 'ETB', 'Ethiopia Birr', 'Br', '&#66;&#114;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(45, 'EUR', 'Euro Member Countries', '€', '€', 0, 2, ',', ' ', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(46, 'FJD', 'Fiji Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(47, 'FKP', 'Falkland Islands (Malvinas) Pound', '£', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(48, 'GBP', 'United Kingdom Pound', '£', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(49, 'GEL', 'Georgia Lari', NULL, '&#4314;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(50, 'GGP', 'Guernsey Pound', '£', NULL, 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(51, 'GHC', 'Ghana Cedi', 'GH¢', '&#x47;&#x48;&#xA2;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(52, 'GHS', 'Ghana Cedi', 'GH¢', '&#x47;&#x48;&#xA2;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(53, 'GIP', 'Gibraltar Pound', '£', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(54, 'GMD', 'Gambia Dalasi', 'D', '&#68;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(55, 'GNF', 'Guinea Franc', 'Fr', '&#70;&#71;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(56, 'GTQ', 'Guatemala Quetzal', 'Q', '&#81;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(57, 'GYD', 'Guyana Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(58, 'HKD', 'Hong Kong Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(59, 'HNL', 'Honduras Lempira', 'L', '&#76;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(60, 'HRK', 'Croatia Kuna', 'kn', '&#107;&#110;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(61, 'HTG', 'Haiti Gourde', NULL, '&#71;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(62, 'HUF', 'Hungary Forint', 'Ft', '&#70;&#116;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(63, 'IDR', 'Indonesia Rupiah', 'Rp', '&#82;&#112;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(64, 'ILS', 'Israel Shekel', '₪', '&#8362;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(65, 'IMP', 'Isle of Man Pound', '£', NULL, 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(66, 'INR', 'India Rupee', '₨', '&#8377;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(67, 'IQD', 'Iraq Dinar', 'د.ع;', '&#1593;.&#1583;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(68, 'IRR', 'Iran Rial', '﷼', '&#65020;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(69, 'ISK', 'Iceland Krona', 'kr', '&#107;&#114;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(70, 'JEP', 'Jersey Pound', '£', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(71, 'JMD', 'Jamaica Dollar', 'J$', '&#74;&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(72, 'JOD', 'Jordan Dinar', NULL, '&#74;&#68;', 0, 3, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(73, 'JPY', 'Japan Yen', '¥', '&#165;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(74, 'KES', 'Kenya Shilling', 'KSh', '&#x4B;&#x53;&#x68;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(75, 'KGS', 'Kyrgyzstan Som', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(76, 'KHR', 'Cambodia Riel', '៛', '&#6107;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(77, 'KMF', 'Comoros Franc', 'Fr', '&#67;&#70;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(78, 'KPW', 'Korea (North) Won', '₩', '&#8361;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(79, 'KRW', 'Korea (South) Won', '₩', '&#8361;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(80, 'KWD', 'Kuwait Dinar', 'د.ك', '&#1583;.&#1603;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(81, 'KYD', 'Cayman Islands Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(82, 'KZT', 'Kazakhstan Tenge', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(83, 'LAK', 'Laos Kip', '₭', '&#8365;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(84, 'LBP', 'Lebanon Pound', '£', '&#163;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(85, 'LKR', 'Sri Lanka Rupee', '₨', '&#8360;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(86, 'LRD', 'Liberia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(87, 'LSL', 'Lesotho Loti', 'M', '&#76;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(88, 'LTL', 'Lithuania Litas', 'Lt', '&#76;&#116;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(89, 'LVL', 'Latvia Lat', 'Ls', '&#76;&#115;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(90, 'LYD', 'Libya Dinar', 'DL', '&#1604;.&#1583;', 0, 3, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(91, 'MAD', 'Morocco Dirham', 'Dhs', '&#1583;.&#1605;.', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(92, 'MDL', 'Moldova Leu', NULL, '&#76;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(93, 'MGA', 'Madagascar Ariary', 'Ar', '&#65;&#114;', 0, 5, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(94, 'MKD', 'Macedonia Denar', 'ден', '&#1076;&#1077;&#1085;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(95, 'MMK', 'Myanmar (Burma) Kyat', NULL, '&#75;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(96, 'MNT', 'Mongolia Tughrik', '₮', '&#8366;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(97, 'MOP', 'Macau Pataca', NULL, '&#77;&#79;&#80;&#36;', 0, 1, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(98, 'MRO', 'Mauritania Ouguiya', 'UM', '&#85;&#77;', 0, 5, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(99, 'MUR', 'Mauritius Rupee', '₨', '&#8360;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(100, 'MVR', 'Maldives (Maldive Islands) Rufiyaa', NULL, '.&#1923;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(101, 'MWK', 'Malawi Kwacha', 'MK', '&#77;&#75;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(102, 'MXN', 'Mexico Peso', '$', '&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(103, 'MYR', 'Malaysia Ringgit', 'RM', '&#82;&#77;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(104, 'MZN', 'Mozambique Metical', 'MT', '&#77;&#84;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(105, 'NAD', 'Namibia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(106, 'NGN', 'Nigeria Naira', '₦', '&#8358;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(107, 'NIO', 'Nicaragua Cordoba', 'C$', '&#67;&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(108, 'NOK', 'Norway Krone', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(109, 'NPR', 'Nepal Rupee', '₨', '&#8360;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(110, 'NZD', 'New Zealand Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(111, 'OMR', 'Omani Rial', 'ر.ع.', '', 0, 3, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(112, 'PAB', 'Panama Balboa', 'B/.', '&#66;&#47;&#46;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(113, 'PEN', 'Peru Nuevo Sol', 'S/.', '&#83;&#47;&#46;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(114, 'PGK', 'Papua New Guinea Kina', NULL, '&#75;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(115, 'PHP', 'Philippines Peso', '₱', '&#8369;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(116, 'PKR', 'Pakistan Rupee', '₨', '&#8360;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(117, 'PLN', 'Poland Zloty', 'zł', '&#122;&#322;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(118, 'PYG', 'Paraguay Guarani', 'Gs', '&#71;&#115;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(119, 'QAR', 'Qatar Riyal', '﷼', '&#65020;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(120, 'RON', 'Romania New Leu', 'lei', '&#108;&#101;&#105;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(121, 'RSD', 'Serbia Dinar', 'Дин.', '&#1044;&#1080;&#1085;&#46;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(122, 'RUB', 'Russia Ruble', '₽', '&#8381;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(123, 'RWF', 'Rwanda Franc', 'FRw', '&#1585;.&#1587;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(124, 'SAR', 'Saudi Arabia Riyal', '﷼', '&#65020;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(125, 'SBD', 'Solomon Islands Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(126, 'SCR', 'Seychelles Rupee', '₨', '&#8360;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(127, 'SDG', 'Sudan Pound', 'DS', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(128, 'SEK', 'Sweden Krona', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(129, 'SGD', 'Singapore Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(130, 'SHP', 'Saint Helena Pound', '£', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(131, 'SLL', 'Sierra Leone Leone', 'Le', '&#76;&#101;', 1, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(132, 'SOS', 'Somalia Shilling', 'S', '&#83;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(133, 'SPL', 'Seborga Luigino', NULL, NULL, 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(134, 'SRD', 'Suriname Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(135, 'SSP', 'South Sudanese Pound', '£', '&#xA3;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(136, 'STD', 'São Tomé and Príncipe Dobra', 'Db', '&#68;&#98;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(137, 'SVC', 'El Salvador Colon', '$', '&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(138, 'SYP', 'Syria Pound', '£', '&#163;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(139, 'SZL', 'Swaziland Lilangeni', 'E', '&#76;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(140, 'THB', 'Thailand Baht', '฿', '&#3647;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(141, 'TJS', 'Tajikistan Somoni', NULL, '&#84;&#74;&#83;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(142, 'TMT', 'Turkmenistan Manat', NULL, '&#109;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(143, 'TND', 'Tunisia Dinar', 'DT', '&#1583;.&#1578;', 1, 3, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(144, 'TOP', 'Tonga Pa\'anga', NULL, '&#84;&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(145, 'TRL', 'Turkey Lira', '₤', NULL, 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(146, 'TRY', 'Turkey Lira', '₺', '&#x20BA;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(147, 'TTD', 'Trinidad and Tobago Dollar', 'TT$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(148, 'TVD', 'Tuvalu Dollar', '$', NULL, 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(149, 'TWD', 'Taiwan New Dollar', 'NT$', '&#78;&#84;&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(150, 'TZS', 'Tanzania Shilling', 'TSh', '&#x54;&#x53;&#x68;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(151, 'UAH', 'Ukraine Hryvnia', '₴', '&#8372;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(152, 'UGX', 'Uganda Shilling', 'USh', '&#85;&#83;&#104;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(153, 'USD', 'United States Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(154, 'UYU', 'Uruguay Peso', '$U', '&#36;&#85;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(155, 'UZS', 'Uzbekistan Som', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(156, 'VEF', 'Venezuela Bolivar', 'Bs', '&#66;&#115;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(157, 'VND', 'Viet Nam Dong', '₫', '&#8363;', 1, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(158, 'VUV', 'Vanuatu Vatu', NULL, '&#86;&#84;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(159, 'WST', 'Samoa Tala', NULL, '&#87;&#83;&#36;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(160, 'XAF', 'Communauté Financière Africaine (BEAC) CFA Franc B', 'F', '&#70;&#67;&#70;&#65;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(161, 'XCD', 'East Caribbean Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(162, 'XDR', 'International Monetary Fund (IMF) Special Drawing ', NULL, '', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(163, 'XOF', 'Communauté Financière Africaine (BCEAO) Franc', 'F', '&#70;&#67;&#70;&#65;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(164, 'XPF', 'Comptoirs Français du Pacifique (CFP) Franc', 'F', '&#70;', 0, 0, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(165, 'YER', 'Yemen Rial', '﷼', '&#65020;', 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(166, 'ZAR', 'South Africa Rand', 'R', '&#82;', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(167, 'ZMW', 'Zambia Kwacha', 'ZK', NULL, 0, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(168, 'ZWD', 'Zimbabwe Dollar', 'Z$', NULL, 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(169, 'ZWL', 'Zimbabwe Dollar', 'Z$', NULL, 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25'),
(170, 'XBT', 'Bitcoin', '฿', '฿', 1, 2, '.', ',', '2021-02-16 08:48:25', '2021-02-16 08:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `belongs_to` enum('posts','users') COLLATE utf8_unicode_ci NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `max` int(10) UNSIGNED DEFAULT '255',
  `default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) UNSIGNED DEFAULT NULL,
  `use_as_filter` tinyint(1) DEFAULT '0',
  `help` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `belongs_to`, `translation_lang`, `translation_of`, `name`, `type`, `max`, `default`, `required`, `use_as_filter`, `help`, `active`) VALUES
(1, 'posts', 'en', 1, 'Car Brand', 'select', NULL, NULL, 1, 1, NULL, 1),
(2, 'posts', 'en', 2, 'Car Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(3, 'posts', 'en', 3, 'Year of registration', 'number', NULL, NULL, 0, 0, NULL, 1),
(4, 'posts', 'en', 4, 'Mileage', 'text', NULL, NULL, 0, 0, NULL, 1),
(5, 'posts', 'en', 5, 'Fuel Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(6, 'posts', 'en', 6, 'Features', 'checkbox_multiple', NULL, NULL, 0, 1, NULL, 1),
(7, 'posts', 'en', 7, 'Transmission', 'radio', NULL, NULL, 0, 1, NULL, 1),
(8, 'posts', 'en', 8, 'Condition', 'select', NULL, NULL, 0, 1, NULL, 1),
(9, 'posts', 'en', 9, 'Size', 'number', 50, NULL, 1, 1, NULL, 1),
(10, 'posts', 'en', 10, 'Rooms', 'select', NULL, NULL, 1, 1, NULL, 1),
(11, 'posts', 'en', 11, 'Building Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(12, 'posts', 'en', 12, 'Parking', 'checkbox', NULL, NULL, 0, 1, NULL, 1),
(13, 'posts', 'en', 13, 'Furnished', 'radio', NULL, NULL, 0, 1, NULL, 1),
(14, 'posts', 'en', 14, 'Mobile Brand', 'select', NULL, NULL, 0, 1, NULL, 1),
(15, 'posts', 'en', 15, 'Mobile Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(16, 'posts', 'en', 16, 'Electronic Brand', 'select', NULL, NULL, 0, 1, NULL, 1),
(17, 'posts', 'en', 17, 'Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(18, 'posts', 'en', 18, 'Start Date', 'date', 50, NULL, 0, 1, NULL, 1),
(19, 'posts', 'en', 19, 'Company', 'text', 100, NULL, 1, 0, NULL, 1),
(20, 'posts', 'en', 20, 'Work Type', 'select', NULL, NULL, 1, 1, NULL, 1),
(21, 'posts', 'en', 21, 'Start date', 'date', 50, NULL, 1, 1, NULL, 1),
(22, 'posts', 'en', 22, 'End date', 'date', 50, NULL, 1, 1, NULL, 1),
(23, 'posts', 'en', 23, 'Event Address', 'text', 200, NULL, 1, 0, NULL, 1),
(24, 'posts', 'en', 24, 'Website', 'url', 100, NULL, 0, 0, NULL, 1),
(25, 'posts', 'en', 25, 'Video', 'video', 100, NULL, 0, 0, NULL, 1),
(26, 'posts', 'en', 26, 'Date Range', 'date_range', 100, NULL, 0, 1, NULL, 1),
(27, 'posts', 'en', 27, 'Rent Duration', 'select', NULL, NULL, 1, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fields_options`
--

CREATE TABLE `fields_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields_options`
--

INSERT INTO `fields_options` (`id`, `field_id`, `translation_lang`, `translation_of`, `value`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 'en', 1, 'Toyota', NULL, 1, 2, NULL),
(2, 1, 'en', 2, 'BMW', NULL, 3, 4, NULL),
(3, 1, 'en', 3, 'Mercedes', NULL, 5, 6, NULL),
(4, 1, 'en', 4, 'Chevrolet', NULL, 7, 8, NULL),
(5, 1, 'en', 5, 'Cadillac', NULL, 9, 10, NULL),
(6, 1, 'en', 6, 'Buick', NULL, 11, 12, NULL),
(7, 1, 'en', 7, 'GMC', NULL, 13, 14, NULL),
(8, 1, 'en', 8, 'Ford', NULL, 15, 16, NULL),
(9, 1, 'en', 9, 'Chrysler', NULL, 17, 18, NULL),
(10, 1, 'en', 10, 'Dodge', NULL, 19, 20, NULL),
(11, 1, 'en', 11, 'Jeep', NULL, 21, 22, NULL),
(12, 1, 'en', 12, 'Tesla', NULL, 23, 24, NULL),
(13, 1, 'en', 13, 'Lexus', NULL, 25, 26, NULL),
(14, 1, 'en', 14, 'Suzuki', NULL, 27, 28, NULL),
(15, 1, 'en', 15, 'Mazda', NULL, 29, 30, NULL),
(16, 1, 'en', 16, 'Honda', NULL, 31, 32, NULL),
(17, 1, 'en', 17, 'Acura', NULL, 33, 34, NULL),
(18, 1, 'en', 18, 'Mitsubishi', NULL, 35, 36, NULL),
(19, 1, 'en', 19, 'Nissan', NULL, 37, 38, NULL),
(20, 1, 'en', 20, 'Infiniti', NULL, 39, 40, NULL),
(21, 1, 'en', 21, 'Audi', NULL, 41, 42, NULL),
(22, 1, 'en', 22, 'Volkswagen', NULL, 43, 44, NULL),
(23, 1, 'en', 23, 'Porsche', NULL, 45, 46, NULL),
(24, 1, 'en', 24, 'Opel', NULL, 47, 48, NULL),
(25, 1, 'en', 25, 'Jaguar', NULL, 49, 50, NULL),
(26, 1, 'en', 26, 'Land Rover', NULL, 51, 52, NULL),
(27, 1, 'en', 27, 'Mini', NULL, 53, 54, NULL),
(28, 1, 'en', 28, 'Aston Martin', NULL, 55, 56, NULL),
(29, 1, 'en', 29, 'Bentley', NULL, 57, 58, NULL),
(30, 1, 'en', 30, 'Rolls Royce', NULL, 59, 60, NULL),
(31, 1, 'en', 31, 'McLaren', NULL, 61, 62, NULL),
(32, 1, 'en', 32, 'Fiat', NULL, 63, 64, NULL),
(33, 1, 'en', 33, 'Alfa Romeo', NULL, 65, 66, NULL),
(34, 1, 'en', 34, 'Maserati', NULL, 67, 68, NULL),
(35, 1, 'en', 35, 'Ferrari', NULL, 69, 70, NULL),
(36, 1, 'en', 36, 'Lamborghini', NULL, 71, 72, NULL),
(37, 1, 'en', 37, 'Pagani', NULL, 73, 74, NULL),
(38, 1, 'en', 38, 'Lancia', NULL, 75, 76, NULL),
(39, 1, 'en', 39, 'Renault', NULL, 77, 78, NULL),
(40, 1, 'en', 40, 'Peugeot', NULL, 79, 80, NULL),
(41, 1, 'en', 41, 'Citroen', NULL, 81, 82, NULL),
(42, 1, 'en', 42, 'Bugatti', NULL, 83, 84, NULL),
(43, 1, 'en', 43, 'Tata', NULL, 85, 86, NULL),
(44, 1, 'en', 44, 'Hyundai', NULL, 87, 88, NULL),
(45, 1, 'en', 45, 'Kia', NULL, 89, 90, NULL),
(46, 1, 'en', 46, 'Daewoo', NULL, 91, 92, NULL),
(47, 1, 'en', 47, 'Volvo', NULL, 93, 94, NULL),
(48, 1, 'en', 48, 'Saab', NULL, 95, 96, NULL),
(49, 1, 'en', 49, 'Lada', NULL, 97, 98, NULL),
(50, 1, 'en', 50, 'Volga', NULL, 99, 100, NULL),
(51, 1, 'en', 51, 'Zil', NULL, 101, 102, NULL),
(52, 1, 'en', 52, 'GAZ', NULL, 103, 104, NULL),
(53, 1, 'en', 53, 'Geely', NULL, 105, 106, NULL),
(54, 1, 'en', 54, 'Chery', NULL, 107, 108, NULL),
(55, 1, 'en', 55, 'Hongqi', NULL, 109, 110, NULL),
(56, 1, 'en', 56, 'Other', NULL, 111, 112, NULL),
(57, 5, 'en', 57, 'Essence', NULL, 113, 114, NULL),
(58, 5, 'en', 58, 'Diesel', NULL, 115, 116, NULL),
(59, 6, 'en', 59, 'Air Conditioner', NULL, 117, 118, NULL),
(60, 6, 'en', 60, 'GPS', NULL, 119, 120, NULL),
(61, 6, 'en', 61, 'Security System', NULL, 121, 122, NULL),
(62, 6, 'en', 62, 'Spare Tire', NULL, 123, 124, NULL),
(63, 7, 'en', 63, 'Automatic', NULL, 125, 126, NULL),
(64, 7, 'en', 64, 'Manual', NULL, 127, 128, NULL),
(65, 8, 'en', 65, 'New', NULL, 129, 130, NULL),
(66, 8, 'en', 66, 'Used', NULL, 131, 132, NULL),
(67, 10, 'en', 67, '0', NULL, 133, 134, 1),
(68, 10, 'en', 68, '1', NULL, 135, 136, 1),
(69, 10, 'en', 69, '2', NULL, 137, 138, 1),
(70, 10, 'en', 70, '3', NULL, 139, 140, 1),
(71, 10, 'en', 71, '4', NULL, 141, 142, 1),
(72, 10, 'en', 72, '5', NULL, 143, 144, 1),
(73, 10, 'en', 73, '6', NULL, 145, 146, 1),
(74, 10, 'en', 74, '7', NULL, 147, 148, 1),
(75, 10, 'en', 75, '8', NULL, 149, 150, 1),
(76, 10, 'en', 76, '9', NULL, 151, 152, 1),
(77, 10, 'en', 77, '10', NULL, 153, 154, 1),
(78, 10, 'en', 78, '> 10', NULL, 155, 156, 1),
(79, 11, 'en', 79, 'Apartment', NULL, 157, 158, NULL),
(80, 11, 'en', 80, 'House', NULL, 159, 160, NULL),
(81, 11, 'en', 81, 'Office', NULL, 161, 162, NULL),
(82, 11, 'en', 82, 'Store', NULL, 163, 164, NULL),
(83, 11, 'en', 83, 'Plot of land', NULL, 165, 166, NULL),
(84, 13, 'en', 84, 'Yes', NULL, 167, 168, NULL),
(85, 13, 'en', 85, 'No', NULL, 169, 170, NULL),
(86, 14, 'en', 86, 'Huawei', NULL, 171, 172, NULL),
(87, 14, 'en', 87, 'Sony', NULL, 173, 174, NULL),
(88, 14, 'en', 88, 'LG', NULL, 175, 176, NULL),
(89, 14, 'en', 89, 'Samsung', NULL, 177, 178, NULL),
(90, 14, 'en', 90, 'Nokia', NULL, 179, 180, NULL),
(91, 14, 'en', 91, 'Alcatel-Lucent', NULL, 181, 182, NULL),
(92, 14, 'en', 92, 'Siemens', NULL, 183, 184, NULL),
(93, 14, 'en', 93, 'BlackBerry', NULL, 185, 186, NULL),
(94, 14, 'en', 94, 'Apple', NULL, 187, 188, NULL),
(95, 14, 'en', 95, 'Google', NULL, 189, 190, NULL),
(96, 14, 'en', 96, 'Microsoft', NULL, 191, 192, NULL),
(97, 14, 'en', 97, 'Motorola', NULL, 193, 194, NULL),
(98, 14, 'en', 98, 'Other', NULL, 195, 196, NULL),
(99, 16, 'en', 99, 'Huawei', NULL, 197, 198, NULL),
(100, 16, 'en', 100, 'Lenovo', NULL, 199, 200, NULL),
(101, 16, 'en', 101, 'TP-Link', NULL, 201, 202, NULL),
(102, 16, 'en', 102, 'Xiaomi', NULL, 203, 204, NULL),
(103, 16, 'en', 103, 'Canon', NULL, 205, 206, NULL),
(104, 16, 'en', 104, 'Casio', NULL, 207, 208, NULL),
(105, 16, 'en', 105, 'Epson', NULL, 209, 210, NULL),
(106, 16, 'en', 106, 'Fuji', NULL, 211, 212, NULL),
(107, 16, 'en', 107, 'Funai', NULL, 213, 214, NULL),
(108, 16, 'en', 108, 'JVC', NULL, 215, 216, NULL),
(109, 16, 'en', 109, 'Nikon', NULL, 217, 218, NULL),
(110, 16, 'en', 110, 'Nintendo', NULL, 219, 220, NULL),
(111, 16, 'en', 111, 'Olympus', NULL, 221, 222, NULL),
(112, 16, 'en', 112, 'Panasonic', NULL, 223, 224, NULL),
(113, 16, 'en', 113, 'Pentax', NULL, 225, 226, NULL),
(114, 16, 'en', 114, 'Pioneer', NULL, 227, 228, NULL),
(115, 16, 'en', 115, 'Sega', NULL, 229, 230, NULL),
(116, 16, 'en', 116, 'Sharp', NULL, 231, 232, NULL),
(117, 16, 'en', 117, 'Sony', NULL, 233, 234, NULL),
(118, 16, 'en', 118, 'Toshiba', NULL, 235, 236, NULL),
(119, 16, 'en', 119, 'Daewoo', NULL, 237, 238, NULL),
(120, 16, 'en', 120, 'LG', NULL, 239, 240, NULL),
(121, 16, 'en', 121, 'Samsung', NULL, 241, 242, NULL),
(122, 16, 'en', 122, 'Acer', NULL, 243, 244, NULL),
(123, 16, 'en', 123, 'Asus', NULL, 245, 246, NULL),
(124, 16, 'en', 124, 'D-Link', NULL, 247, 248, NULL),
(125, 16, 'en', 125, 'Gigabyte', NULL, 249, 250, NULL),
(126, 16, 'en', 126, 'Beko', NULL, 251, 252, NULL),
(127, 16, 'en', 127, 'Nokia', NULL, 253, 254, NULL),
(128, 16, 'en', 128, 'Alcatel-Lucent', NULL, 255, 256, NULL),
(129, 16, 'en', 129, 'Bosch', NULL, 257, 258, NULL),
(130, 16, 'en', 130, 'Siemens', NULL, 259, 260, NULL),
(131, 16, 'en', 131, 'Sennheiser', NULL, 261, 262, NULL),
(132, 16, 'en', 132, 'Telefunken', NULL, 263, 264, NULL),
(133, 16, 'en', 133, 'Philips', NULL, 265, 266, NULL),
(134, 16, 'en', 134, 'Electrolux', NULL, 267, 268, NULL),
(135, 16, 'en', 135, 'Russell Hobbs', NULL, 269, 270, NULL),
(136, 16, 'en', 136, 'BlackBerry', NULL, 271, 272, NULL),
(137, 16, 'en', 137, 'Thomson', NULL, 273, 274, NULL),
(138, 16, 'en', 138, 'Amazon', NULL, 275, 276, NULL),
(139, 16, 'en', 139, 'Apple', NULL, 277, 278, NULL),
(140, 16, 'en', 140, 'Bose', NULL, 279, 280, NULL),
(141, 16, 'en', 141, 'Cisco Systems', NULL, 281, 282, NULL),
(142, 16, 'en', 142, 'Dell', NULL, 283, 284, NULL),
(143, 16, 'en', 143, 'Gateway', NULL, 285, 286, NULL),
(144, 16, 'en', 144, 'Google', NULL, 287, 288, NULL),
(145, 16, 'en', 145, 'Hewlett-Packard', NULL, 289, 290, NULL),
(146, 16, 'en', 146, 'IBM', NULL, 291, 292, NULL),
(147, 16, 'en', 147, 'Intel', NULL, 293, 294, NULL),
(148, 16, 'en', 148, 'Microsoft', NULL, 295, 296, NULL),
(149, 16, 'en', 149, 'Motorola', NULL, 297, 298, NULL),
(150, 16, 'en', 150, 'NVIDIA', NULL, 299, 300, NULL),
(151, 16, 'en', 151, 'Packard Bell', NULL, 301, 302, NULL),
(152, 16, 'en', 152, 'Qualcomm', NULL, 303, 304, NULL),
(153, 16, 'en', 153, 'Seagate', NULL, 305, 306, NULL),
(154, 16, 'en', 154, 'Sun Microsystems', NULL, 307, 308, NULL),
(155, 16, 'en', 155, 'Vizio', NULL, 309, 310, NULL),
(156, 16, 'en', 156, 'Western Digital', NULL, 311, 312, NULL),
(157, 16, 'en', 157, 'Xerox', NULL, 313, 314, NULL),
(158, 16, 'en', 158, 'Other', NULL, 315, 316, NULL),
(159, 20, 'en', 159, 'Full-time', NULL, 317, 318, NULL),
(160, 20, 'en', 160, 'Part-time', NULL, 319, 320, NULL),
(161, 20, 'en', 161, 'Temporary', NULL, 321, 322, NULL),
(162, 20, 'en', 162, 'Internship', NULL, 323, 324, NULL),
(163, 20, 'en', 163, 'Permanent', NULL, 325, 326, NULL),
(164, 27, 'en', 164, '1 Day', NULL, NULL, NULL, NULL),
(165, 27, 'en', 165, '7 Days', NULL, NULL, NULL, NULL),
(166, 27, 'en', 166, '30 Days', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Mr'),
(2, 'en', 2, 'Mrs');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `view` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `field` mediumtext COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', '{\"enable_form_area_customization\":\"1\",\"background_color\":\"#CE7E7E\",\"background_image\":null,\"height\":null,\"parallax\":\"0\",\"hide_form\":\"0\",\"form_border_color\":null,\"form_border_width\":null,\"form_btn_background_color\":null,\"form_btn_text_color\":null,\"hide_titles\":\"0\",\"title_en\":\"Sell \\/ Buy & Rent Near you\",\"sub_title_en\":null,\"big_title_color\":null,\"sub_title_color\":null,\"hide_on_mobile\":\"0\",\"active\":\"1\"}', 'home.inc.search', NULL, 0, 2, 3, 1, 1),
(2, 'getLocations', 'Locations & Country Map', NULL, 'home.inc.locations', NULL, 0, 10, 11, 1, 1),
(3, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, 0, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', NULL, 'home.inc.categories', NULL, 0, 6, 7, 1, 0),
(5, 'getLatestPosts', 'Latest Ads', NULL, 'home.inc.latest', NULL, 0, 8, 9, 1, 1),
(6, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, 0, 12, 13, 1, 1),
(7, 'getTopAdvertising', 'Advertising #1', '{\"active\":\"1\"}', 'layouts.inc.advertising.top', NULL, 0, 14, 15, 1, 0),
(8, 'getBottomAdvertising', 'Advertising #2', NULL, 'layouts.inc.advertising.bottom', NULL, 0, 16, 17, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8_unicode_ci DEFAULT 'ltr',
  `russian_pluralization` tinyint(1) UNSIGNED DEFAULT '0',
  `date_format` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime_format` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `default` tinyint(1) DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `date_format`, `datetime_format`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'en', 'en_US', 'English', 'English', NULL, 'english', 'Latn', 'ltr', 0, 'MMM Do, YYYY', 'MMM Do, YYYY [at] HH:mm', 1, 1, NULL, 2, 3, 1, NULL, '2021-02-16 08:48:25', '2021-02-16 08:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `page` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `translation_lang`, `translation_of`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'en', 1, 'home', '{app_name} - Geo Classified Ads CMS', 'Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(2, 'en', 2, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(3, 'en', 3, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(4, 'en', 4, 'create', 'Post Free Ads', 'Post Free Ads - {country}.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(5, 'en', 5, 'countries', 'Free Local Classified Ads in the World', 'Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(6, 'en', 6, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(7, 'en', 7, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. 100% Free Ads Classified', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(8, 'en', 8, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(9, 'en', 9, 'pricing', 'Pricing - {app_name}', 'Pricing - {app_name}', '{app_name}, {country}, pricing, free ads, classified, ads, script, app, premium ads', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_10_12_160714_create_languages_table', 1),
(2, '2020_10_12_160715_create_advertising_table', 1),
(3, '2020_10_12_160715_create_blacklist_table', 1),
(4, '2020_10_12_160715_create_cache_table', 1),
(5, '2020_10_12_160715_create_categories_table', 1),
(6, '2020_10_12_160715_create_continents_table', 1),
(7, '2020_10_12_160715_create_currencies_table', 1),
(8, '2020_10_12_160715_create_fields_table', 1),
(9, '2020_10_12_160715_create_gender_table', 1),
(10, '2020_10_12_160715_create_home_sections_table', 1),
(11, '2020_10_12_160715_create_meta_tags_table', 1),
(12, '2020_10_12_160715_create_packages_table', 1),
(13, '2020_10_12_160715_create_pages_table', 1),
(14, '2020_10_12_160715_create_password_resets_table', 1),
(15, '2020_10_12_160715_create_payment_methods_table', 1),
(16, '2020_10_12_160715_create_permission_tables', 1),
(17, '2020_10_12_160715_create_post_types_table', 1),
(18, '2020_10_12_160715_create_report_types_table', 1),
(19, '2020_10_12_160715_create_sessions_table', 1),
(20, '2020_10_12_160715_create_settings_table', 1),
(21, '2020_10_12_160715_create_user_types_table', 1),
(22, '2020_10_12_160716_create_category_field_table', 1),
(23, '2020_10_12_160716_create_countries_table', 1),
(24, '2020_10_12_160716_create_fields_options_table', 1),
(25, '2020_10_12_160716_create_subadmin1_table', 1),
(26, '2020_10_12_160716_create_subadmin2_table', 1),
(27, '2020_10_12_160716_create_users_table', 1),
(28, '2020_10_12_160717_create_cities_table', 1),
(29, '2020_10_12_160717_create_posts_table', 1),
(30, '2020_10_12_160717_create_saved_posts_table', 1),
(31, '2020_10_12_160717_create_saved_search_table', 1),
(32, '2020_10_12_160717_create_threads_table', 1),
(33, '2020_10_12_160718_create_threads_messages_table', 1),
(34, '2020_10_12_160718_create_threads_participants_table', 1),
(35, '2020_10_12_160719_create_payments_table', 1),
(36, '2020_10_12_160719_create_pictures_table', 1),
(37, '2020_10_12_160719_create_post_values_table', 1),
(38, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(39, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(40, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(41, '2016_06_01_000004_create_oauth_clients_table', 2),
(42, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(43, '2021_02_23_080517_create_banners_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `short_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_badge` tinyint(1) UNSIGNED DEFAULT '0',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo_duration` int(11) DEFAULT '30' COMMENT 'In days',
  `duration` int(10) UNSIGNED DEFAULT '30' COMMENT 'In days',
  `pictures_limit` int(11) DEFAULT '5',
  `description` text COLLATE utf8_unicode_ci COMMENT 'In country language',
  `facebook_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `google_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `twitter_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `linkedin_ads_duration` int(10) UNSIGNED DEFAULT '0',
  `recommended` tinyint(1) DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `translation_lang`, `translation_of`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `promo_duration`, `duration`, `pictures_limit`, `description`, `facebook_ads_duration`, `google_ads_duration`, `twitter_ads_duration`, `linkedin_ads_duration`, `recommended`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Regular List', 'Free', 'red', 1, '0.00', 'USD', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 2, 3, 0, 1),
(2, 'en', 2, 'Top page Ad', 'Premium', 'orange', 1, '7.50', 'USD', 7, 60, 10, 'Featured on the homepage\nFeatured in the category', 0, 0, 0, 0, 1, NULL, 4, 5, 0, 1),
(3, 'en', 3, 'Top page Ad+', 'Premium+', 'green', 1, '9.00', 'USD', 30, 120, 15, 'Featured on the homepage\nFeatured in the category', 0, 0, 0, 0, 0, NULL, 6, 7, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `external_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) UNSIGNED DEFAULT '0',
  `excluded_from_footer` tinyint(1) UNSIGNED DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `translation_lang`, `translation_of`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, 'en', 1, NULL, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of {YourCity} under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access the Service via internet LaraClassified.</li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.</p><p>Any complaints should be addressed to Customer Service LaraClassified.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(2, 'en', 2, NULL, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 1, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(3, 'en', 3, NULL, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 1, '2021-02-16 08:48:26', '2021-02-16 08:48:26'),
(4, 'en', 4, NULL, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<p><b>How do I place an ad?</b></p><p>It\'s very easy to place an ad: click on the button \"Post free Ads\" above right.</p><p><b>What does it cost to advertise?</b></p><p>The publication is 100% free throughout the website.</p><p><b>If I post an ad, will I also get more spam e-mails?</b></p><p>Absolutely not because your email address is not visible on the website.</p><p><b>How long will my ad remain on the website?</b></p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.</p><p><b>I sold my item. How do I delete my ad?</b></p><p>Once your product is sold or leased, log in to your account to remove your ad.</p>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2021-02-16 08:48:26', '2021-02-16 08:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `post_id`, `package_id`, `payment_method_id`, `transaction_id`, `amount`, `active`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 5, NULL, '0.00', 1, '2021-02-18 07:06:09', '2021-02-18 07:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `has_ccbox` tinyint(1) UNSIGNED DEFAULT '0',
  `is_compatible_api` tinyint(1) DEFAULT '0',
  `countries` mediumtext COLLATE utf8_unicode_ci COMMENT 'Countries codes separated by comma.',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal', 'Paypal', 'Payment with Paypal', 0, 0, '', 0, 0, 1, 0, 1),
(5, 'offlinepayment', 'Offline Payment', NULL, 0, 1, NULL, 5, 5, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'permission-list', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(2, 'permission-create', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(3, 'permission-update', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(4, 'permission-delete', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(5, 'role-list', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(6, 'role-create', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(7, 'role-update', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(8, 'role-delete', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27'),
(9, 'dashboard-access', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint(1) UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `post_id`, `filename`, `position`, `active`, `created_at`, `updated_at`) VALUES
(2, 2, 'files/pk/2/95acb46472f2d0aa8c7d5a74ac64852d.jpg', 1, 1, '2021-02-17 01:28:38', '2021-02-17 01:28:38'),
(3, 2, 'files/pk/2/ddcd0b5f028c2ca217c0c8e585871a55.jpg', 2, 1, '2021-02-17 01:28:38', '2021-02-17 01:28:38'),
(4, 3, 'files/pk/3/3eb4e5cd4cfa21a300fb9bca010801f2.jpg', 1, 1, '2021-02-17 03:23:44', '2021-02-17 03:23:44'),
(5, 4, 'files/pk/4/ea5874a35c05b21012a6f9d68948c45f.jpg', 1, 1, '2021-02-17 03:29:36', '2021-02-17 03:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `post_type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(17,2) UNSIGNED DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT '0',
  `contact_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lon` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visits` int(10) UNSIGNED DEFAULT '0',
  `rating_cache` float(2,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `rating_count` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '0',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '1',
  `accept_terms` tinyint(1) DEFAULT '0',
  `accept_marketing_offers` tinyint(1) DEFAULT '0',
  `is_permanent` tinyint(1) DEFAULT '0',
  `reviewed` tinyint(1) DEFAULT '0',
  `featured` tinyint(1) UNSIGNED DEFAULT '0',
  `archived` tinyint(1) DEFAULT '0',
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint(1) UNSIGNED DEFAULT '0',
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `fb_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `country_code`, `user_id`, `category_id`, `post_type_id`, `title`, `description`, `tags`, `price`, `negotiable`, `contact_name`, `email`, `phone`, `phone_hidden`, `address`, `city_id`, `lon`, `lat`, `ip_addr`, `visits`, `rating_cache`, `rating_count`, `email_token`, `phone_token`, `tmp_token`, `verified_email`, `verified_phone`, `accept_terms`, `accept_marketing_offers`, `is_permanent`, `reviewed`, `featured`, `archived`, `archived_at`, `archived_manually`, `deletion_mail_sent_at`, `fb_profile`, `partner`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'PK', 1, 42, NULL, 'Animating Symbols', '<p>sdzdssdsf sdfdSf df s</p>', 'ren,furnished', '100000.00', 1, 'Admin', 'syedshajihaider@gmail.com', '+923007479927', NULL, NULL, 176, 74.35, 31.56, '127.0.0.1', 8, 0.0, 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-02-17 01:28:23', '2021-02-18 07:54:04'),
(3, 'PK', 2, 2, NULL, 'tesla model s', '<p>testing rent </p>', 'rent', '8000.00', NULL, 'Ali', 'ali@gmail.com', '', NULL, NULL, 176, 74.35, 31.56, '127.0.0.1', 42, 0.0, 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-02-17 03:23:03', '2021-02-24 02:26:26'),
(4, 'PK', 3, 38, NULL, 'house for rent', '<p>house for rent</p>', 'houseforrent', '55000.00', NULL, 'Shaji', 'shaji@gmail.com', '', NULL, NULL, 176, 74.35, 31.56, '127.0.0.1', 54, 0.0, 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, '2021-02-17 03:25:55', '2021-02-22 01:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `translation_lang`, `translation_of`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Private individual', NULL, NULL, NULL, 1),
(2, 'en', 2, 'Professional', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_values`
--

CREATE TABLE `post_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` int(10) UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_values`
--

INSERT INTO `post_values` (`id`, `post_id`, `field_id`, `option_id`, `value`) VALUES
(11, 2, 9, NULL, '21'),
(12, 2, 10, NULL, '68'),
(13, 2, 13, NULL, '84'),
(14, 2, 11, NULL, '79'),
(15, 3, 27, NULL, '164'),
(16, 3, 1, NULL, '12'),
(17, 3, 3, NULL, '2021'),
(18, 3, 5, NULL, '57'),
(19, 3, 7, NULL, '63'),
(20, 3, 8, NULL, '65'),
(21, 3, 4, NULL, '200'),
(22, 3, 6, 59, '59'),
(23, 3, 6, 60, '60'),
(24, 3, 6, 61, '61'),
(25, 3, 6, 62, '62'),
(26, 4, 27, NULL, '166'),
(27, 4, 10, NULL, '71'),
(28, 4, 13, NULL, '84'),
(29, 4, 11, NULL, '80');

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Fraud'),
(2, 'en', 2, 'Duplicate'),
(3, 'en', 3, 'Spam'),
(4, 'en', 4, 'Wrong category'),
(5, 'en', 5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `spam` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', '2021-02-16 08:48:27', '2021-02-16 08:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `saved_posts`
--

INSERT INTO `saved_posts` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, '2021-02-22 02:12:55', '2021-02-22 02:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payload` mediumtext COLLATE utf8_unicode_ci,
  `last_activity` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_agent` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` mediumtext COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"31ab0c5f-b0fd-a5fe-b659-b048af623dc1\",\"app_name\":\"RentFirst\",\"slogan\":\"we rent everything\",\"logo\":\"app\\/logo\\/logo-602cf102374a5.png\",\"favicon\":null,\"email\":\"admin@gmail.com\",\"phone_number\":null,\"auto_detect_language\":\"0\",\"php_specific_date_format\":\"0\",\"date_format\":\"YYYY-MM-DD\",\"datetime_format\":\"YYYY-MM-DD HH:mm\",\"date_force_utf8\":\"0\",\"logo_dark\":\"app\\/backend\\/logo-dark-602cf10295c21.png\",\"logo_light\":\"app\\/backend\\/logo-light-602cf12648d42.png\",\"vector_charts_type\":\"morris_bar\",\"latest_entries_limit\":\"5\",\"show_countries_charts\":\"1\"}', 'Application Setup', NULL, NULL, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', '{\"app_skin\":\"skin-green\",\"body_background_color\":null,\"body_text_color\":null,\"body_background_image\":null,\"body_background_image_fixed\":\"0\",\"page_width\":null,\"title_color\":null,\"progress_background_color\":null,\"link_color\":null,\"link_color_hover\":null,\"header_sticky\":\"0\",\"header_height\":null,\"header_background_color\":null,\"header_bottom_border_width\":null,\"header_bottom_border_color\":\"#E8E8E8\",\"header_link_color\":null,\"header_link_color_hover\":null,\"footer_background_color\":null,\"footer_text_color\":null,\"footer_title_color\":null,\"footer_link_color\":null,\"footer_link_color_hover\":null,\"payment_icon_top_border_width\":null,\"payment_icon_top_border_color\":null,\"payment_icon_bottom_border_width\":null,\"payment_icon_bottom_border_color\":null,\"btn_post_bg_top_color\":null,\"btn_post_bg_bottom_color\":null,\"btn_post_border_color\":null,\"btn_post_text_color\":null,\"btn_post_bg_top_color_hover\":null,\"btn_post_bg_bottom_color_hover\":null,\"btn_post_border_color_hover\":null,\"btn_post_text_color_hover\":null,\"custom_css\":null,\"login_bg_image\":null,\"admin_logo_bg\":\"skin3\",\"admin_navbar_bg\":\"skin6\",\"admin_sidebar_type\":\"full\",\"admin_sidebar_bg\":\"skin6\",\"admin_sidebar_position\":\"1\",\"admin_header_position\":\"1\",\"admin_boxed_layout\":\"0\",\"admin_dark_theme\":\"0\"}', 'Style Customization', NULL, NULL, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', NULL, 'Listing & Search Options', NULL, NULL, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads (Form & Single Page)', '{\"publication_form_type\":\"1\",\"picture_mandatory\":\"1\",\"pictures_limit\":\"5\",\"tags_limit\":\"15\",\"guests_can_post_ads\":\"1\",\"posts_review_activation\":\"0\",\"permanent_posts_enabled\":\"0\",\"pricing_page_enabled\":\"0\",\"show_post_types\":\"0\",\"auto_registration\":\"0\",\"wysiwyg_editor\":\"tinymce\",\"remove_url_before\":\"0\",\"remove_url_after\":\"0\",\"remove_email_before\":\"0\",\"remove_email_after\":\"0\",\"remove_phone_before\":\"0\",\"remove_phone_after\":\"0\",\"convert_phone_number_to_img\":\"0\",\"hide_phone_number\":\"2\",\"show_security_tips\":\"0\",\"enable_whatsapp_btn\":\"0\",\"pre_filled_whatsapp_message\":\"0\",\"elapsed_time_from_now\":\"0\",\"hide_dates\":\"0\",\"guests_can_contact_ads_authors\":\"1\",\"similar_posts\":\"1\",\"show_post_on_googlemap\":\"0\",\"activation_facebook_comments\":\"0\"}', 'Ads (Form & Single Page) Options', NULL, NULL, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"email_sender\":\"admin@gmail.com\",\"driver\":\"sendmail\",\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\"}', 'Mail Sending Configuration', NULL, NULL, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', NULL, 'SMS Sending Configuration', NULL, NULL, 12, 13, 1, 1, NULL, NULL),
(7, 'upload', 'Upload', NULL, 'Upload Settings', NULL, NULL, 14, 15, 1, 1, NULL, NULL),
(8, 'geo_location', 'Geo Location', '{\"default_country_code\":\"PK\"}', 'Geo Location Configuration', NULL, NULL, 16, 17, 1, 1, NULL, NULL),
(9, 'security', 'Security', NULL, 'Security Options', NULL, NULL, 18, 19, 1, 1, NULL, NULL),
(10, 'social_auth', 'Social Login', NULL, 'Social Network Login', NULL, NULL, 20, 21, 1, 1, NULL, NULL),
(11, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, NULL, 22, 23, 1, 1, NULL, NULL),
(12, 'optimization', 'Optimization', NULL, 'Optimization Tools', NULL, NULL, 24, 25, 1, 1, NULL, NULL),
(13, 'seo', 'SEO', NULL, 'SEO Tools', NULL, NULL, 26, 27, 1, 1, NULL, NULL),
(14, 'other', 'Others', NULL, 'Other Options', NULL, NULL, 28, 29, 1, 1, NULL, NULL),
(15, 'cron', 'Cron', NULL, 'Cron Job', NULL, NULL, 30, 31, 1, 1, NULL, NULL),
(16, 'footer', 'Footer', NULL, 'Pages Footer', NULL, NULL, 32, 33, 1, 1, NULL, NULL),
(17, 'backup', 'Backup', NULL, 'Backup Configuration', NULL, NULL, 34, 35, 1, 1, NULL, NULL),
(18, 'reviews', 'Reviews', NULL, 'Reviews System', NULL, 0, 32, 33, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `asciiname`, `active`, `created_at`, `updated_at`) VALUES
(1, 'PK.08', 'PK', 'Islamabad', 'Islamabad', 1, NULL, NULL),
(2, 'PK.05', 'PK', 'Sindh', 'Sindh', 1, NULL, NULL),
(3, 'PK.04', 'PK', 'Punjab', 'Punjab', 1, NULL, NULL),
(4, 'PK.03', 'PK', 'Khyber Pakhtunkhwa', 'Khyber Pakhtunkhwa', 1, NULL, NULL),
(5, 'PK.07', 'PK', 'Gilgit-Baltistan', 'Gilgit-Baltistan', 1, NULL, NULL),
(6, 'PK.02', 'PK', 'Balochistan', 'Balochistan', 1, NULL, NULL),
(7, 'PK.06', 'PK', 'Azad Kashmir', 'Azad Kashmir', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin2`
--

INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `asciiname`, `active`, `created_at`, `updated_at`) VALUES
(1, 'PK.02.1162104', 'PK', 'PK.02', 'Zhob District', 'Zhob District', 1, NULL, NULL),
(2, 'PK.02.1163052', 'PK', 'PK.02', 'Kech District', 'Kech District', 1, NULL, NULL),
(3, 'PK.05.1163570', 'PK', 'PK.05', 'Thatta District', 'Thatta District', 1, NULL, NULL),
(4, 'PK.05.1163602', 'PK', 'PK.05', 'Thar Pārkar District', 'Thar Parkar District', 1, NULL, NULL),
(5, 'PK.03.1164211', 'PK', 'PK.03', 'Swāt District', 'Swat District', 1, NULL, NULL),
(6, 'PK.05.1164407', 'PK', 'PK.05', 'Sukkur District', 'Sukkur District', 1, NULL, NULL),
(7, 'PK.03.1164536', 'PK', 'PK.03', 'South Wazīristān District', 'South Waziristan District', 1, NULL, NULL),
(8, 'PK.02.1164895', 'PK', 'PK.02', 'Sibi District', 'Sibi District', 1, NULL, NULL),
(9, 'PK.04.1164908', 'PK', 'PK.04', 'Siālkot District', 'Sialkot District', 1, NULL, NULL),
(10, 'PK.05.1165106', 'PK', 'PK.05', 'Shikārpur District', 'Shikarpur District', 1, NULL, NULL),
(11, 'PK.04.1165218', 'PK', 'PK.04', 'Shekhūpura District', 'Shekhupura District', 1, NULL, NULL),
(12, 'PK.04.1165999', 'PK', 'PK.04', 'Sargodha District', 'Sargodha District', 1, NULL, NULL),
(13, 'PK.05.1166162', 'PK', 'PK.05', 'Sānghar District', 'Sanghar District', 1, NULL, NULL),
(14, 'PK.04.1166545', 'PK', 'PK.04', 'Sāhīwāl District', 'Sahiwal District', 1, NULL, NULL),
(15, 'PK.04.1166991', 'PK', 'PK.04', 'Rawalpindi District', 'Rawalpindi District', 1, NULL, NULL),
(16, 'PK.04.1167458', 'PK', 'PK.04', 'Rahīmyār Khān District', 'Rahimyar Khan District', 1, NULL, NULL),
(17, 'PK.02.1167527', 'PK', 'PK.02', 'Quetta District', 'Quetta District', 1, NULL, NULL),
(18, 'PK.06.1167717', 'PK', 'PK.06', 'Poonch District', 'Poonch District', 1, NULL, NULL),
(19, 'PK.02.1167820', 'PK', 'PK.02', 'Pishīn District', 'Pishin District', 1, NULL, NULL),
(20, 'PK.03.1168195', 'PK', 'PK.03', 'Peshāwar District', 'Peshawar District', 1, NULL, NULL),
(21, 'PK.02.1168444', 'PK', 'PK.02', 'Panjgūr District', 'Panjgur District', 1, NULL, NULL),
(22, 'PK.03.1168705', 'PK', 'PK.03', 'Orakzai Agency', 'Orakzai Agency', 1, NULL, NULL),
(23, 'PK.03.1168875', 'PK', 'PK.03', 'North Wazīristān District', 'North Waziristan District', 1, NULL, NULL),
(24, 'PK.05.1169115', 'PK', 'PK.05', 'Shaheed Benazirabad District', 'Shaheed Benazirabad District', 1, NULL, NULL),
(25, 'PK.02.1169249', 'PK', 'PK.02', 'Nasīrābād District', 'Nasirabad District', 1, NULL, NULL),
(26, 'PK.04.1169603', 'PK', 'PK.04', 'Muzaffargarh District', 'Muzaffargarh District', 1, NULL, NULL),
(27, 'PK.06.1169606', 'PK', 'PK.06', 'Muzaffarābād District', 'Muzaffarabad District', 1, NULL, NULL),
(28, 'PK.04.1169821', 'PK', 'PK.04', 'Multān District', 'Multan District', 1, NULL, NULL),
(29, 'PK.03.1170122', 'PK', 'PK.03', 'Mohmand Agency', 'Mohmand Agency', 1, NULL, NULL),
(30, 'PK.06.1170297', 'PK', 'PK.06', 'Mirpur District', 'Mirpur District', 1, NULL, NULL),
(31, 'PK.04.1170424', 'PK', 'PK.04', 'Miānwāli District', 'Mianwali District', 1, NULL, NULL),
(32, 'PK.03.1170875', 'PK', 'PK.03', 'Mardān District', 'Mardan District', 1, NULL, NULL),
(33, 'PK.03.1170950', 'PK', 'PK.03', 'Mānsehra District', 'Mansehra District', 1, NULL, NULL),
(34, 'PK.03.1171388', 'PK', 'PK.03', 'Malakand Protected Area', 'Malakand Protected Area', 1, NULL, NULL),
(35, 'PK.02.1171867', 'PK', 'PK.02', 'Loralai District', 'Loralai District', 1, NULL, NULL),
(36, 'PK.02.1172115', 'PK', 'PK.02', 'Lasbela District', 'Lasbela District', 1, NULL, NULL),
(37, 'PK.05.1172127', 'PK', 'PK.05', 'Lārkāna District', 'Larkana District', 1, NULL, NULL),
(38, 'PK.04.1172449', 'PK', 'PK.04', 'Lahore District', 'Lahore District', 1, NULL, NULL),
(39, 'PK.03.1172574', 'PK', 'PK.03', 'Kurram District', 'Kurram District', 1, NULL, NULL),
(40, 'PK.06.1173037', 'PK', 'PK.06', 'Kotli District', 'Kotli District', 1, NULL, NULL),
(41, 'PK.02.1173463', 'PK', 'PK.02', 'Kohlu District', 'Kohlu District', 1, NULL, NULL),
(42, 'PK.03.1173489', 'PK', 'PK.03', 'Kohāt District', 'Kohat District', 1, NULL, NULL),
(43, 'PK.03.1173641', 'PK', 'PK.03', 'Khyber Agency', 'Khyber Agency', 1, NULL, NULL),
(44, 'PK.02.1173663', 'PK', 'PK.02', 'Khuzdār District', 'Khuzdar District', 1, NULL, NULL),
(45, 'PK.02.1174059', 'PK', 'PK.02', 'Khārān District', 'Kharan District', 1, NULL, NULL),
(46, 'PK.05.1174349', 'PK', 'PK.05', 'Khairpur District', 'Khairpur District', 1, NULL, NULL),
(47, 'PK.04.1174623', 'PK', 'PK.04', 'Kasūr District', 'Kasur District', 1, NULL, NULL),
(48, 'PK.02.1175293', 'PK', 'PK.02', 'Kalāt District', 'Kalat District', 1, NULL, NULL),
(49, 'PK.02.1175527', 'PK', 'PK.02', 'Kachhi District', 'Kachhi District', 1, NULL, NULL),
(50, 'PK.04.1175862', 'PK', 'PK.04', 'Jhelum District', 'Jhelum District', 1, NULL, NULL),
(51, 'PK.04.1175906', 'PK', 'PK.04', 'Jhang District', 'Jhang District', 1, NULL, NULL),
(52, 'PK.05.1176514', 'PK', 'PK.05', 'Jacobabad District', 'Jacobabad District', 1, NULL, NULL),
(53, 'PK.05.1176733', 'PK', 'PK.05', 'Hyderābād District', 'Hyderabad District', 1, NULL, NULL),
(54, 'PK.07.1176775', 'PK', 'PK.07', 'Hunza-Nagar District', 'Hunza-Nagar District', 1, NULL, NULL),
(55, 'PK.02.1177445', 'PK', 'PK.02', 'Gwādar District', 'Gwadar District', 1, NULL, NULL),
(56, 'PK.04.1177651', 'PK', 'PK.04', 'Gujrāt District', 'Gujrat District', 1, NULL, NULL),
(57, 'PK.04.1177658', 'PK', 'PK.04', 'Gujrānwāla District', 'Gujranwala District', 1, NULL, NULL),
(58, 'PK.04.1179399', 'PK', 'PK.04', 'Faisalābād District', 'Faisalabad District', 1, NULL, NULL),
(59, 'PK.03.1179754', 'PK', 'PK.03', 'Upper Dīr District', 'Upper Dir District', 1, NULL, NULL),
(60, 'PK.03.1180280', 'PK', 'PK.03', 'Dera Ismāīl Khān Tribal Area', 'Dera Ismail Khan Tribal Area', 1, NULL, NULL),
(61, 'PK.03.1180282', 'PK', 'PK.03', 'Dera Ismāīl Khān District', 'Dera Ismail Khan District', 1, NULL, NULL),
(62, 'PK.04.1180287', 'PK', 'PK.04', 'Dera Ghāzi Khān District', 'Dera Ghazi Khan District', 1, NULL, NULL),
(63, 'PK.05.1180802', 'PK', 'PK.05', 'Dādu District', 'Dadu District', 1, NULL, NULL),
(64, 'PK.03.1181064', 'PK', 'PK.03', 'Chitrāl District', 'Chitral District', 1, NULL, NULL),
(65, 'PK.02.1181950', 'PK', 'PK.02', 'Chāgai District', 'Chagai District', 1, NULL, NULL),
(66, 'PK.03.1182146', 'PK', 'PK.03', 'Buner District', 'Buner District', 1, NULL, NULL),
(67, 'PK.03.1183459', 'PK', 'PK.03', 'Bannu District', 'Bannu District', 1, NULL, NULL),
(68, 'PK.07.1183615', 'PK', 'PK.07', 'Skārdu District', 'Skardu District', 1, NULL, NULL),
(69, 'PK.03.1183781', 'PK', 'PK.03', 'Bājaur Agency', 'Bajaur Agency', 1, NULL, NULL),
(70, 'PK.04.1183876', 'PK', 'PK.04', 'Bahāwalpur District', 'Bahawalpur District', 1, NULL, NULL),
(71, 'PK.04.1183882', 'PK', 'PK.04', 'Bahāwalnagar District', 'Bahawalnagar District', 1, NULL, NULL),
(72, 'PK.05.1184051', 'PK', 'PK.05', 'Badīn District', 'Badin District', 1, NULL, NULL),
(73, 'PK.04.1184248', 'PK', 'PK.04', 'Attock District', 'Attock District', 1, NULL, NULL),
(74, 'PK.03.1185055', 'PK', 'PK.03', 'Abbottābād District', 'Abbottabad District', 1, NULL, NULL),
(75, 'PK.05.1376894', 'PK', 'PK.05', 'Mirpur Khas District', 'Mirpur Khas District', 1, NULL, NULL),
(76, 'PK.02.6641896', 'PK', 'PK.02', 'Awārān District', 'Awaran District', 1, NULL, NULL),
(77, 'PK.02.6641912', 'PK', 'PK.02', 'Bārkhān District', 'Barkhan District', 1, NULL, NULL),
(78, 'PK.02.6641919', 'PK', 'PK.02', 'Dera Bugti District', 'Dera Bugti District', 1, NULL, NULL),
(79, 'PK.02.6641922', 'PK', 'PK.02', 'Jāfarābād District', 'Jafarabad District', 1, NULL, NULL),
(80, 'PK.02.6641923', 'PK', 'PK.02', 'Jhal Magsi District', 'Jhal Magsi District', 1, NULL, NULL),
(81, 'PK.02.6641952', 'PK', 'PK.02', 'Mastung District', 'Mastung District', 1, NULL, NULL),
(82, 'PK.02.6641955', 'PK', 'PK.02', 'Mūsa Khel District', 'Musa Khel District', 1, NULL, NULL),
(83, 'PK.02.6641960', 'PK', 'PK.02', 'Nushki District', 'Nushki District', 1, NULL, NULL),
(84, 'PK.02.6641961', 'PK', 'PK.02', 'Qila Abdullāh District', 'Qila Abdullah District', 1, NULL, NULL),
(85, 'PK.02.6641963', 'PK', 'PK.02', 'Qila Saifullāh District', 'Qila Saifullah District', 1, NULL, NULL),
(86, 'PK.02.6641965', 'PK', 'PK.02', 'Wāshuk District', 'Washuk District', 1, NULL, NULL),
(87, 'PK.02.6641972', 'PK', 'PK.02', 'Ziārat District', 'Ziarat District', 1, NULL, NULL),
(88, 'PK.04.7331706', 'PK', 'PK.04', 'Toba Tek Singh District', 'Toba Tek Singh District', 1, NULL, NULL),
(89, 'PK.05.7352189', 'PK', 'PK.05', 'Naushahro Fīroz District', 'Naushahro Firoz District', 1, NULL, NULL),
(90, 'PK.05.7418822', 'PK', 'PK.05', 'Ghotki District', 'Ghotki District', 1, NULL, NULL),
(91, 'PK.04.7418846', 'PK', 'PK.04', 'Lodhrān District', 'Lodhran District', 1, NULL, NULL),
(92, 'PK.04.7418850', 'PK', 'PK.04', 'Pākpattan District', 'Pakpattan District', 1, NULL, NULL),
(93, 'PK.04.7418888', 'PK', 'PK.04', 'Okāra District', 'Okara District', 1, NULL, NULL),
(94, 'PK.04.7418890', 'PK', 'PK.04', 'Khānewāl District', 'Khanewal District', 1, NULL, NULL),
(95, 'PK.04.7418962', 'PK', 'PK.04', 'Hāfizābād District', 'Hafizabad District', 1, NULL, NULL),
(96, 'PK.04.7418963', 'PK', 'PK.04', 'Mandi Bahāuddīn District', 'Mandi Bahauddin District', 1, NULL, NULL),
(97, 'PK.04.7418964', 'PK', 'PK.04', 'Chakwāl District', 'Chakwal District', 1, NULL, NULL),
(98, 'PK.04.7418965', 'PK', 'PK.04', 'Khushāb District', 'Khushab District', 1, NULL, NULL),
(99, 'PK.04.7418966', 'PK', 'PK.04', 'Bhakkar District', 'Bhakkar District', 1, NULL, NULL),
(100, 'PK.04.7418967', 'PK', 'PK.04', 'Layyah District', 'Layyah District', 1, NULL, NULL),
(101, 'PK.04.7418968', 'PK', 'PK.04', 'Nārowāl District', 'Narowal District', 1, NULL, NULL),
(102, 'PK.03.7419039', 'PK', 'PK.03', 'Lakki Marwat District', 'Lakki Marwat District', 1, NULL, NULL),
(103, 'PK.03.7419040', 'PK', 'PK.03', 'Tānk District', 'Tank District', 1, NULL, NULL),
(104, 'PK.03.7419041', 'PK', 'PK.03', 'Tānk Tribal Area', 'Tank Tribal Area', 1, NULL, NULL),
(105, 'PK.03.7419043', 'PK', 'PK.03', 'Bannu Tribal Area', 'Bannu Tribal Area', 1, NULL, NULL),
(106, 'PK.03.7419044', 'PK', 'PK.03', 'Lakki Marwat Tribal Area', 'Lakki Marwat Tribal Area', 1, NULL, NULL),
(107, 'PK.03.7419047', 'PK', 'PK.03', 'Karak District', 'Karak District', 1, NULL, NULL),
(108, 'PK.03.7419048', 'PK', 'PK.03', 'Hangu District', 'Hangu District', 1, NULL, NULL),
(109, 'PK.03.7419049', 'PK', 'PK.03', 'Peshāwar Tribal Area', 'Peshawar Tribal Area', 1, NULL, NULL),
(110, 'PK.03.7419050', 'PK', 'PK.03', 'Kohāt Tribal Area', 'Kohat Tribal Area', 1, NULL, NULL),
(111, 'PK.03.7419051', 'PK', 'PK.03', 'Chārsadda District', 'Charsadda District', 1, NULL, NULL),
(112, 'PK.03.7419052', 'PK', 'PK.03', 'Nowshera District', 'Nowshera District', 1, NULL, NULL),
(113, 'PK.03.7419053', 'PK', 'PK.03', 'Shāngla District', 'Shangla District', 1, NULL, NULL),
(114, 'PK.03.7419054', 'PK', 'PK.03', 'Harīpur District', 'Haripur District', 1, NULL, NULL),
(115, 'PK.03.7419055', 'PK', 'PK.03', 'Swābi District', 'Swabi District', 1, NULL, NULL),
(116, 'PK.03.7419056', 'PK', 'PK.03', 'Lower Dīr District', 'Lower Dir District', 1, NULL, NULL),
(117, 'PK.07.7419077', 'PK', 'PK.07', 'Ghanche District', 'Ghanche District', 1, NULL, NULL),
(118, 'PK.05.7419156', 'PK', 'PK.05', 'Jāmshoro District', 'Jamshoro District', 1, NULL, NULL),
(119, 'PK.05.7419157', 'PK', 'PK.05', 'Matiāri District', 'Matiari District', 1, NULL, NULL),
(120, 'PK.04.7419159', 'PK', 'PK.04', 'Nankāna Sāhib District', 'Nankana Sahib District', 1, NULL, NULL),
(121, 'PK.06.7536187', 'PK', 'PK.06', 'Bhimbar District', 'Bhimbar District', 1, NULL, NULL),
(122, 'PK.06.7536188', 'PK', 'PK.06', 'Bagh District', 'Bagh District', 1, NULL, NULL),
(123, 'PK.03.8061265', 'PK', 'PK.03', 'Tor Ghar', 'Tor Ghar', 1, NULL, NULL),
(124, 'PK.06.8199376', 'PK', 'PK.06', 'Neelum District', 'Neelum District', 1, NULL, NULL),
(125, 'PK.03.8224052', 'PK', 'PK.03', 'Battagram District', 'Battagram District', 1, NULL, NULL),
(126, 'PK.04.8309731', 'PK', 'PK.04', 'Rājanpur', 'Rajanpur', 1, NULL, NULL),
(127, 'PK.07.8309748', 'PK', 'PK.07', 'Astor', 'Astor', 1, NULL, NULL),
(128, 'PK.06.8309754', 'PK', 'PK.06', 'Haveli', 'Haveli', 1, NULL, NULL),
(129, 'PK.06.8309755', 'PK', 'PK.06', 'Hatian', 'Hatian', 1, NULL, NULL),
(130, 'PK.02.8309758', 'PK', 'PK.02', 'Harnai', 'Harnai', 1, NULL, NULL),
(131, 'PK.02.8309759', 'PK', 'PK.02', 'Shirāni', 'Shirani', 1, NULL, NULL),
(132, 'PK.07.8358419', 'PK', 'PK.07', 'Gilgit', 'Gilgit', 1, NULL, NULL),
(133, 'PK.07.8358421', 'PK', 'PK.07', 'Diamīr', 'Diamir', 1, NULL, NULL),
(134, 'PK.06.8986039', 'PK', 'PK.06', 'Sudhanoti District', 'Sudhanoti District', 1, NULL, NULL),
(135, 'PK.05.9034783', 'PK', 'PK.05', 'Qamber Shahdadkot District', 'Qamber Shahdadkot District', 1, NULL, NULL),
(136, 'PK.05.9035095', 'PK', 'PK.05', 'Kashmore District', 'Kashmore District', 1, NULL, NULL),
(137, 'PK.05.9072726', 'PK', 'PK.05', 'Umerkot District', 'Umerkot District', 1, NULL, NULL),
(138, 'PK.05.9625763', 'PK', 'PK.05', 'Tando Allahyar District', 'Tando Allahyar District', 1, NULL, NULL),
(139, 'PK.05.9625902', 'PK', 'PK.05', 'Tando Mohammad Khan District', 'Tando Mohammad Khan District', 1, NULL, NULL),
(140, 'PK.05.10300608', 'PK', 'PK.05', 'Sujawal District', 'Sujawal District', 1, NULL, NULL),
(141, 'PK.04.10344547', 'PK', 'PK.04', 'Vehari District', 'Vehari District', 1, NULL, NULL),
(142, 'PK.07.11594770', 'PK', 'PK.07', 'Ghizer District', 'Ghizer District', 1, NULL, NULL),
(143, 'PK.05.11744831', 'PK', 'PK.05', 'Karachi Central District', 'Karachi Central District', 1, NULL, NULL),
(144, 'PK.05.11744832', 'PK', 'PK.05', 'Karachi East District', 'Karachi East District', 1, NULL, NULL),
(145, 'PK.05.11744833', 'PK', 'PK.05', 'Karachi South District', 'Karachi South District', 1, NULL, NULL),
(146, 'PK.07.11744834', 'PK', 'PK.07', 'Kharmang District', 'Kharmang District', 1, NULL, NULL),
(147, 'PK.05.11744835', 'PK', 'PK.05', 'Korangi District', 'Korangi District', 1, NULL, NULL),
(148, 'PK.05.11744837', 'PK', 'PK.05', 'Malir District', 'Malir District', 1, NULL, NULL),
(149, 'PK.07.11744838', 'PK', 'PK.07', 'Nagar District', 'Nagar District', 1, NULL, NULL),
(150, 'PK.07.11744839', 'PK', 'PK.07', 'Shigar District', 'Shigar District', 1, NULL, NULL),
(151, 'PK.02.11744842', 'PK', 'PK.02', 'Sohbatpur District', 'Sohbatpur District', 1, NULL, NULL),
(152, 'PK.04.11886901', 'PK', 'PK.04', 'Chiniot', 'Chiniot', 1, NULL, NULL),
(153, 'PK.03.12105028', 'PK', 'PK.03', 'Lower Kohistan District', 'Lower Kohistan District', 1, NULL, NULL),
(154, 'PK.03.12105031', 'PK', 'PK.03', 'Upper Kohistan District', 'Upper Kohistan District', 1, NULL, NULL),
(155, 'PK.05.12105033', 'PK', 'PK.05', 'District of West Karachi', 'District of West Karachi', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `post_id`, `subject`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, 'House for rent', NULL, NULL, '2021-02-22 01:13:48', '2021-02-22 01:13:48'),
(2, 4, 'House for rent', NULL, NULL, '2021-02-22 01:16:37', '2021-02-22 01:16:37'),
(3, 4, 'House for rent', NULL, NULL, '2021-02-22 01:19:36', '2021-02-22 01:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `threads_messages`
--

CREATE TABLE `threads_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci,
  `filename` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `threads_messages`
--

INSERT INTO `threads_messages` (`id`, `thread_id`, `user_id`, `body`, `filename`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'hellosadsS Ddsdnhilubuhykbgukyhvbkuygbvuktiyt', NULL, NULL, NULL, '2021-02-22 01:13:48', '2021-02-22 01:13:48'),
(2, 2, 4, 'hello sir mai aay karf lyna aa', NULL, NULL, NULL, '2021-02-22 01:16:37', '2021-02-22 01:16:37'),
(3, 3, 2, 'lksjdfkl;jsadl;kjfladsjf lsadjf; lkjasd;lkfja;sldkj f;lasjd lf;kjsa', NULL, NULL, NULL, '2021-02-22 01:19:36', '2021-02-22 01:19:36'),
(4, 3, 2, 'dsjfdslkjflksdjflkjsdf', NULL, NULL, NULL, '2021-02-22 01:20:31', '2021-02-22 01:20:31'),
(5, 3, 2, 'dfdsdsfdsfsdfsdfs', NULL, NULL, NULL, '2021-02-22 01:21:40', '2021-02-22 01:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `threads_participants`
--

CREATE TABLE `threads_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `is_important` tinyint(1) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `threads_participants`
--

INSERT INTO `threads_participants` (`id`, `thread_id`, `user_id`, `last_read`, `is_important`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-02-22 01:13:48', 0, NULL, '2021-02-22 01:13:48', '2021-02-22 01:13:48'),
(2, 1, 3, '2021-02-22 01:54:51', 0, NULL, '2021-02-22 01:13:48', '2021-02-22 01:54:51'),
(3, 2, 4, '2021-02-22 01:16:37', 0, NULL, '2021-02-22 01:16:37', '2021-02-22 01:16:37'),
(4, 2, 3, '2021-02-22 01:54:45', 0, NULL, '2021-02-22 01:16:37', '2021-02-22 01:54:45'),
(5, 3, 2, '2021-02-22 01:30:47', 0, NULL, '2021-02-22 01:19:36', '2021-02-22 01:30:47'),
(6, 3, 3, '2021-02-22 01:54:38', 0, NULL, '2021-02-22 01:19:36', '2021-02-22 01:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `gender_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED DEFAULT '0',
  `can_be_impersonated` tinyint(1) UNSIGNED DEFAULT '1',
  `disable_comments` tinyint(1) UNSIGNED DEFAULT '0',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'facebook, google, twitter, linkedin, ...',
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Provider User ID',
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT '1',
  `verified_phone` tinyint(1) UNSIGNED DEFAULT '1',
  `accept_terms` tinyint(1) DEFAULT '0',
  `accept_marketing_offers` tinyint(1) DEFAULT '0',
  `time_zone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked` tinyint(1) UNSIGNED DEFAULT '0',
  `closed` tinyint(1) UNSIGNED DEFAULT '0',
  `last_activity` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `accept_terms`, `accept_marketing_offers`, `time_zone`, `blocked`, `closed`, `last_activity`, `last_login_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'PK', NULL, 1, 1, 'admin', NULL, 'Administrator', NULL, 0, NULL, 'admin@gmail.com', NULL, '$2y$10$.COhpHOAyiJy.YZiZWNK8ewBHc/4u9Ka4uOjHL5hvf3gh9NwX332e', NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, 0, 0, NULL, '2021-02-17 10:51:10', NULL, '2021-02-16 08:48:27', '2021-02-17 05:51:10'),
(2, 'PK', 'en', NULL, NULL, 'ali', NULL, NULL, '', NULL, NULL, 'ali@gmail.com', NULL, '$2y$10$WWBIgrdiDs/oLIUJmgP9EOhhmoLvY//ctbvVw22i1N6A9t5KCYApC', NULL, 0, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, 0, 0, NULL, '2021-02-22 05:25:19', NULL, '2021-02-17 03:21:35', '2021-02-22 00:25:19'),
(3, 'PK', 'en', NULL, NULL, 'shaji', NULL, NULL, '', NULL, NULL, 'shaji@gmail.com', NULL, '$2y$10$lhx7brQo9osna58nM89XvOYKVmazt7yXNv4IRflenIkOmqn1YN7LC', NULL, 0, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-02-24 07:30:21', NULL, '2021-02-17 03:24:38', '2021-02-24 02:30:21'),
(4, 'PK', 'en', NULL, NULL, 'mango', NULL, NULL, '21321321321', NULL, NULL, 'mango@gmail.com', NULL, '$2y$10$VYXycNxIPH1eOWVrXpAUeOYfsW7.cCSJGez6qQy5VhlVU26PDCL42', NULL, 0, 1, 0, '127.0.0.1', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-02-22 01:16:15', '2021-02-22 01:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Professional', 1),
(2, 'Individual', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `advertising_slug_unique` (`slug`),
  ADD KEY `advertising_active_index` (`active`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blacklist_type_entry_index` (`type`,`entry`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_translation_lang_index` (`translation_lang`),
  ADD KEY `categories_translation_of_index` (`translation_of`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_slug_index` (`slug`),
  ADD KEY `categories_lft_translation_lang_index` (`lft`,`translation_lang`),
  ADD KEY `categories_rgt_translation_lang_index` (`rgt`,`translation_lang`),
  ADD KEY `categories_depth_translation_lang_index` (`depth`,`translation_lang`);

--
-- Indexes for table `category_field`
--
ALTER TABLE `category_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_field_category_id_field_id_unique` (`category_id`,`field_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_code_index` (`country_code`),
  ADD KEY `cities_name_index` (`name`),
  ADD KEY `cities_subadmin1_code_index` (`subadmin1_code`),
  ADD KEY `cities_subadmin2_code_index` (`subadmin2_code`),
  ADD KEY `cities_active_index` (`active`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `continents_code_unique` (`code`),
  ADD KEY `continents_active_index` (`active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`),
  ADD KEY `countries_active_index` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_translation_lang_index` (`translation_lang`),
  ADD KEY `fields_translation_of_index` (`translation_of`),
  ADD KEY `fields_belongs_to_index` (`belongs_to`);

--
-- Indexes for table `fields_options`
--
ALTER TABLE `fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_options_field_id_index` (`field_id`),
  ADD KEY `fields_options_translation_lang_index` (`translation_lang`),
  ADD KEY `fields_options_translation_of_index` (`translation_of`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender_translation_lang_index` (`translation_lang`),
  ADD KEY `gender_translation_of_index` (`translation_of`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_sections_method_unique` (`method`),
  ADD KEY `home_sections_active_index` (`active`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_abbr_unique` (`abbr`),
  ADD KEY `languages_active_index` (`active`),
  ADD KEY `languages_default_index` (`default`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_tags_translation_lang_index` (`translation_lang`),
  ADD KEY `meta_tags_translation_of_index` (`translation_of`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_active_index` (`active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_translation_lang_index` (`translation_lang`),
  ADD KEY `pages_translation_of_index` (`translation_of`),
  ADD KEY `pages_parent_id_index` (`parent_id`),
  ADD KEY `pages_active_index` (`active`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_package_id_index` (`package_id`),
  ADD KEY `payments_payment_method_id_index` (`payment_method_id`),
  ADD KEY `payments_post_id_index` (`post_id`),
  ADD KEY `payments_active_index` (`active`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_has_ccbox_index` (`has_ccbox`),
  ADD KEY `payment_methods_active_index` (`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pictures_post_id_index` (`post_id`),
  ADD KEY `pictures_active_index` (`active`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_lon_lat_index` (`lon`,`lat`),
  ADD KEY `posts_country_code_index` (`country_code`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_category_id_index` (`category_id`),
  ADD KEY `posts_title_index` (`title`),
  ADD KEY `posts_address_index` (`address`),
  ADD KEY `posts_city_id_index` (`city_id`),
  ADD KEY `posts_reviewed_index` (`reviewed`),
  ADD KEY `posts_featured_index` (`featured`),
  ADD KEY `posts_post_type_id_index` (`post_type_id`),
  ADD KEY `posts_contact_name_index` (`contact_name`),
  ADD KEY `posts_verified_email_index` (`verified_email`),
  ADD KEY `posts_verified_phone_index` (`verified_phone`),
  ADD KEY `posts_archived_index` (`archived`),
  ADD KEY `posts_tags_index` (`tags`),
  ADD KEY `posts_is_permanent_index` (`is_permanent`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_types_translation_lang_index` (`translation_lang`),
  ADD KEY `post_types_translation_of_index` (`translation_of`),
  ADD KEY `post_types_active_index` (`active`);

--
-- Indexes for table `post_values`
--
ALTER TABLE `post_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_values_post_id_index` (`post_id`),
  ADD KEY `post_values_field_id_index` (`field_id`),
  ADD KEY `post_values_option_id_index` (`option_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_types_translation_lang_index` (`translation_lang`),
  ADD KEY `report_types_translation_of_index` (`translation_of`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_posts_user_id_index` (`user_id`),
  ADD KEY `saved_posts_post_id_index` (`post_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_search_user_id_index` (`user_id`),
  ADD KEY `saved_search_country_code_index` (`country_code`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`),
  ADD KEY `settings_active_index` (`active`);

--
-- Indexes for table `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin1_code_unique` (`code`),
  ADD KEY `subadmin1_name_index` (`name`),
  ADD KEY `subadmin1_active_index` (`active`),
  ADD KEY `subadmin1_country_code_index` (`country_code`);

--
-- Indexes for table `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin2_code_unique` (`code`),
  ADD KEY `subadmin2_name_index` (`name`),
  ADD KEY `subadmin2_active_index` (`active`),
  ADD KEY `subadmin2_country_code_index` (`country_code`),
  ADD KEY `subadmin2_subadmin1_code_index` (`subadmin1_code`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_post_id_index` (`post_id`);

--
-- Indexes for table `threads_messages`
--
ALTER TABLE `threads_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_messages_thread_id_index` (`thread_id`),
  ADD KEY `threads_messages_user_id_index` (`user_id`);

--
-- Indexes for table `threads_participants`
--
ALTER TABLE `threads_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_participants_thread_id_index` (`thread_id`),
  ADD KEY `threads_participants_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_country_code_index` (`country_code`),
  ADD KEY `users_user_type_id_index` (`user_type_id`),
  ADD KEY `users_gender_id_index` (`gender_id`),
  ADD KEY `users_verified_email_index` (`verified_email`),
  ADD KEY `users_verified_phone_index` (`verified_phone`),
  ADD KEY `users_username_index` (`username`),
  ADD KEY `users_phone_index` (`phone`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_is_admin_index` (`is_admin`),
  ADD KEY `users_can_be_impersonated_index` (`can_be_impersonated`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_types_active_index` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `category_field`
--
ALTER TABLE `category_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=388;

--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fields_options`
--
ALTER TABLE `fields_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_values`
--
ALTER TABLE `post_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `threads_messages`
--
ALTER TABLE `threads_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `threads_participants`
--
ALTER TABLE `threads_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
