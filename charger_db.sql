-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2024 at 07:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `charger_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add customer', 7, 'add_customer'),
(26, 'Can change customer', 7, 'change_customer'),
(27, 'Can delete customer', 7, 'delete_customer'),
(28, 'Can view customer', 7, 'view_customer'),
(29, 'Can add login', 8, 'add_login'),
(30, 'Can change login', 8, 'change_login'),
(31, 'Can delete login', 8, 'delete_login'),
(32, 'Can view login', 8, 'view_login'),
(33, 'Can add district', 9, 'add_district'),
(34, 'Can change district', 9, 'change_district'),
(35, 'Can delete district', 9, 'delete_district'),
(36, 'Can view district', 9, 'view_district'),
(37, 'Can add state', 10, 'add_state'),
(38, 'Can change state', 10, 'change_state'),
(39, 'Can delete state', 10, 'delete_state'),
(40, 'Can view state', 10, 'view_state'),
(41, 'Can add charging_station', 11, 'add_charging_station'),
(42, 'Can change charging_station', 11, 'change_charging_station'),
(43, 'Can delete charging_station', 11, 'delete_charging_station'),
(44, 'Can view charging_station', 11, 'view_charging_station'),
(45, 'Can add complaint', 12, 'add_complaint'),
(46, 'Can change complaint', 12, 'change_complaint'),
(47, 'Can delete complaint', 12, 'delete_complaint'),
(48, 'Can view complaint', 12, 'view_complaint'),
(49, 'Can add enquiry', 13, 'add_enquiry'),
(50, 'Can change enquiry', 13, 'change_enquiry'),
(51, 'Can delete enquiry', 13, 'delete_enquiry'),
(52, 'Can view enquiry', 13, 'view_enquiry'),
(53, 'Can add echarger_booking', 14, 'add_echarger_booking'),
(54, 'Can change echarger_booking', 14, 'change_echarger_booking'),
(55, 'Can delete echarger_booking', 14, 'delete_echarger_booking'),
(56, 'Can view echarger_booking', 14, 'view_echarger_booking'),
(57, 'Can add charger_station_booking', 15, 'add_charger_station_booking'),
(58, 'Can change charger_station_booking', 15, 'change_charger_station_booking'),
(59, 'Can delete charger_station_booking', 15, 'delete_charger_station_booking'),
(60, 'Can view charger_station_booking', 15, 'view_charger_station_booking'),
(61, 'Can add fee', 16, 'add_fee'),
(62, 'Can change fee', 16, 'change_fee'),
(63, 'Can delete fee', 16, 'delete_fee'),
(64, 'Can view fee', 16, 'view_fee');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$hPH5EVyBg5gP9NJnxu9tnz$LToNlgjOP9Hfp63sKeVxKCxGz58sUMe+AkTYFlmPFI8=', NULL, 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-05-05 09:18:20.554972');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(15, 'charger_app', 'charger_station_booking'),
(11, 'charger_app', 'charging_station'),
(12, 'charger_app', 'complaint'),
(7, 'charger_app', 'customer'),
(9, 'charger_app', 'district'),
(14, 'charger_app', 'echarger_booking'),
(13, 'charger_app', 'enquiry'),
(16, 'charger_app', 'fee'),
(8, 'charger_app', 'login'),
(10, 'charger_app', 'state'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-05 09:17:36.510817'),
(2, 'auth', '0001_initial', '2023-05-05 09:17:36.933974'),
(3, 'admin', '0001_initial', '2023-05-05 09:17:37.027724'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-05-05 09:17:37.034232'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-05 09:17:37.065490'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-05-05 09:17:37.112358'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-05-05 09:17:37.165754'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-05-05 09:17:37.181380'),
(9, 'auth', '0004_alter_user_username_opts', '2023-05-05 09:17:37.181380'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-05-05 09:17:37.228250'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-05-05 09:17:37.234771'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-05-05 09:17:37.234771'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-05-05 09:17:37.250419'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-05-05 09:17:37.266031'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-05-05 09:17:37.297278'),
(16, 'auth', '0011_update_proxy_permissions', '2023-05-05 09:17:37.297278'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-05-05 09:17:37.335030'),
(18, 'charger_app', '0001_initial', '2023-05-05 09:17:37.366285'),
(19, 'sessions', '0001_initial', '2023-05-05 09:17:37.397531'),
(20, 'charger_app', '0002_district_state', '2023-05-06 05:22:20.994441'),
(21, 'charger_app', '0003_charging_station', '2023-05-06 06:53:44.778314'),
(22, 'charger_app', '0004_complaint', '2023-05-08 09:04:47.715071'),
(23, 'charger_app', '0005_enquiry', '2023-05-08 09:35:50.015292'),
(24, 'charger_app', '0006_echarger_booking', '2023-05-20 09:04:30.026354'),
(25, 'charger_app', '0006_charger_station_booking', '2023-05-20 09:50:10.675214'),
(26, 'charger_app', '0007_fee', '2023-05-22 05:41:48.985998');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('38jza3cuv9bjihg3cdnp40f7wb7v446i', 'eyJhbmFtZSI6ImFkbWluIiwic2xvZ2lkIjoxfQ:1rNShu:qxxvU5PTtrIHifLWqL4atFYhB6c-voIAJMuJRHkTTkE', '2024-01-24 07:08:58.005351'),
('7cf9dmysyljkcnz9edj1k0b0q4a7r4kf', 'eyJ1bmFtZSI6ImFudTEyMzQiLCJzbG9naWQiOjF9:1pztT4:QCjp-akwpZUFjxBjuMkOiOqiSHsH0k2df3QhYaGGWuc', '2023-06-02 06:19:58.352185'),
('8nn108j46uqtzfs3w033u80nunck54o6', 'eyJ1bmFtZSI6ImFudTEyMzQiLCJzbG9naWQiOjF9:1pzZ1u:DyYAMO_H_qbQ0cJiLxoy9n4bFelW6eiNp1pXI70E60c', '2023-06-01 08:30:34.027931'),
('8yukj9eoekib7mdni4zzb04vb30y7ob9', 'eyJ1bmFtZSI6ImFudTEyMzQiLCJzbG9naWQiOjF9:1q0EbD:v2z_2anTde1Wk0C19TKa2bmbXTh8DSayMa20sG2ge0I', '2023-06-03 04:53:47.278164'),
('ab3aisu5kfaj6lffg74vytyhi52qp2im', 'eyJ1bmFtZSI6ImFudTEyMzQiLCJzbG9naWQiOjF9:1q0Drx:sQQN9PGH-X58bVz0Viget2HmKfnDqkcwviunhp3C14o', '2023-06-03 04:07:01.982333'),
('c2soqwmpxen4f6bxhsdfjoepo9v4thnx', 'eyJ1bmFtZSI6ImFudTEyMzQiLCJzbG9naWQiOjF9:1q7sBd:xfU-sm2pLMiaMYYIodi9YMBYY7hywS7AVrfko7b7mjo', '2023-06-24 06:34:57.686374'),
('k9r34n720zzqwcj863c96dr8d1vgt23p', 'eyJhbmFtZSI6ImFkbWluIiwic2xvZ2lkIjoxfQ:1pvxiT:BE7cKHB1bbmDKTLPG1JRdsxhaaHvUTS2hfoqUpL-8SA', '2023-05-22 10:03:37.766333'),
('kykadcmupz2w88q753wtnugn74u20f6o', 'eyJ1bmFtZSI6ImFudTEyMzQiLCJzbG9naWQiOjF9:1q0ELT:PNtA6FCbMfxjHsTZjF3HVKdY7Zb9au7DcPwssEDPtt8', '2023-06-03 04:37:31.105583'),
('pkbo9hhwy16rqxt8hpd0t1s8xl7tizzo', 'eyJ1bmFtZSI6ImFudTEyMzQiLCJzbG9naWQiOjF9:1rEQv3:QGCGXgn6x7y_rjYNJ_qp3oRAh6pJZKALUHLvC-uocG4', '2023-12-30 09:25:13.757712'),
('uoajpou8ty0x5a203x0cx1ipyoqph686', 'eyJhbmFtZSI6ImFkbWluIiwic2xvZ2lkIjoxfQ:1pweoi:U6Ho1_p1YSw0-NaJ4kZnyE-odgSkBFT9SBDsmW-EsXk', '2023-05-24 08:04:56.693342');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(11) NOT NULL,
  `start_date_time` datetime(6) NOT NULL,
  `end_date_time` datetime(6) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `entry_date` datetime(6) NOT NULL,
  `station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `start_date_time`, `end_date_time`, `user_login_id`, `status`, `entry_date`, `station_id`) VALUES
(1, '2023-05-20 02:04:00.000000', '2023-05-20 04:04:00.000000', 1, 'Paid', '2023-05-20 15:20:40.119313', 3),
(2, '2023-05-20 02:04:00.000000', '2023-05-20 04:04:00.000000', 1, 'Booked', '2023-05-20 15:20:45.079844', 3),
(3, '2023-05-21 03:04:00.000000', '2023-05-21 05:07:00.000000', 1, 'Paid', '2023-05-20 15:35:17.481124', 1),
(4, '2023-05-20 02:04:00.000000', '2023-05-20 23:04:00.000000', 1, 'Booked', '2023-05-20 15:36:03.351241', 1),
(5, '2023-05-20 02:04:00.000000', '2023-05-20 03:04:00.000000', 1, 'Booked', '2023-05-20 15:36:38.315854', 1),
(6, '2023-05-22 15:00:00.000000', '2023-05-22 16:00:00.000000', 1, 'Booked', '2023-05-22 10:53:23.324241', 1),
(7, '2023-11-25 03:05:00.000000', '2023-11-25 05:09:00.000000', 1, 'Booked', '2023-11-25 14:25:42.756656', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_charging_station`
--

CREATE TABLE `tbl_charging_station` (
  `station_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `place` varchar(50) DEFAULT NULL,
  `longitude` decimal(15,10) DEFAULT NULL,
  `latitude` decimal(15,10) DEFAULT NULL,
  `entry_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_charging_station`
--

INSERT INTO `tbl_charging_station` (`station_id`, `district_id`, `place`, `longitude`, `latitude`, `entry_date`) VALUES
(1, 259, 'Pathanamthitta', 76.7894124985, 9.2646099121, '2023-05-06 12:23:50.778944'),
(2, 259, 'Ranni', 76.7791378089, 9.3783065402, '2023-05-06 12:36:06.928280'),
(3, 259, 'Adoor', 76.7310490329, 9.1442980711, '2023-05-06 12:37:05.306099'),
(4, 259, 'Kaippattoor', 76.7520185502, 9.2238191086, '2023-05-06 13:12:34.078602');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint_subject` varchar(50) NOT NULL,
  `complaint` varchar(150) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `reply` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint_subject`, `complaint`, `user_login_id`, `reply`) VALUES
(4, 'No proper way of booking', 'No proper way of booking', 1, 'rt645645');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `user_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` longtext NOT NULL,
  `place` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`user_id`, `login_id`, `customer_name`, `phone_number`, `Email`, `Address`, `place`) VALUES
(1, 1, 'Anu Jose', 9865321245, 'anu@gmail.com', 'Anu Villa', 'Adoor');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `state_id`, `district`) VALUES
(1, 32, 'North and Middle Andaman'),
(2, 32, 'South Andaman'),
(3, 32, 'Nicobar'),
(4, 1, 'Adilabad'),
(5, 1, 'Anantapur'),
(6, 1, 'Chittoor'),
(7, 1, 'East Godavari'),
(8, 1, 'Guntur'),
(9, 1, 'Hyderabad'),
(10, 1, 'Kadapa'),
(11, 1, 'Karimnagar'),
(12, 1, 'Khammam'),
(13, 1, 'Krishna'),
(14, 1, 'Kurnool'),
(15, 1, 'Mahbubnagar'),
(16, 1, 'Medak'),
(17, 1, 'Nalgonda'),
(18, 1, 'Nellore'),
(19, 1, 'Nizamabad'),
(20, 1, 'Prakasam'),
(21, 1, 'Rangareddi'),
(22, 1, 'Srikakulam'),
(23, 1, 'Vishakhapatnam'),
(24, 1, 'Vizianagaram'),
(25, 1, 'Warangal'),
(26, 1, 'West Godavari'),
(27, 3, 'Anjaw'),
(28, 3, 'Changlang'),
(29, 3, 'East Kameng'),
(30, 3, 'Lohit'),
(31, 3, 'Lower Subansiri'),
(32, 3, 'Papum Pare'),
(33, 3, 'Tirap'),
(34, 3, 'Dibang Valley'),
(35, 3, 'Upper Subansiri'),
(36, 3, 'West Kameng'),
(37, 2, 'Barpeta'),
(38, 2, 'Bongaigaon'),
(39, 2, 'Cachar'),
(40, 2, 'Darrang'),
(41, 2, 'Dhemaji'),
(42, 2, 'Dhubri'),
(43, 2, 'Dibrugarh'),
(44, 2, 'Goalpara'),
(45, 2, 'Golaghat'),
(46, 2, 'Hailakandi'),
(47, 2, 'Jorhat'),
(48, 2, 'Karbi Anglong'),
(49, 2, 'Karimganj'),
(50, 2, 'Kokrajhar'),
(51, 2, 'Lakhimpur'),
(52, 2, 'Marigaon'),
(53, 2, 'Nagaon'),
(54, 2, 'Nalbari'),
(55, 2, 'North Cachar Hills'),
(56, 2, 'Sibsagar'),
(57, 2, 'Sonitpur'),
(58, 2, 'Tinsukia'),
(59, 4, 'Araria'),
(60, 4, 'Aurangabad'),
(61, 4, 'Banka'),
(62, 4, 'Begusarai'),
(63, 4, 'Bhagalpur'),
(64, 4, 'Bhojpur'),
(65, 4, 'Buxar'),
(66, 4, 'Darbhanga'),
(67, 4, 'Purba Champaran'),
(68, 4, 'Gaya'),
(69, 4, 'Gopalganj'),
(70, 4, 'Jamui'),
(71, 4, 'Jehanabad'),
(72, 4, 'Khagaria'),
(73, 4, 'Kishanganj'),
(74, 4, 'Kaimur'),
(75, 4, 'Katihar'),
(76, 4, 'Lakhisarai'),
(77, 4, 'Madhubani'),
(78, 4, 'Munger'),
(79, 4, 'Madhepura'),
(80, 4, 'Muzaffarpur'),
(81, 4, 'Nalanda'),
(82, 4, 'Nawada'),
(83, 4, 'Patna'),
(84, 4, 'Purnia'),
(85, 4, 'Rohtas'),
(86, 4, 'Saharsa'),
(87, 4, 'Samastipur'),
(88, 4, 'Sheohar'),
(89, 4, 'Sheikhpura'),
(90, 4, 'Saran'),
(91, 4, 'Sitamarhi'),
(92, 4, 'Supaul'),
(93, 4, 'Siwan'),
(94, 4, 'Vaishali'),
(95, 4, 'Pashchim Champaran'),
(96, 36, 'Bastar'),
(97, 36, 'Bilaspur'),
(98, 36, 'Dantewada'),
(99, 36, 'Dhamtari'),
(100, 36, 'Durg'),
(101, 36, 'Jashpur'),
(102, 36, 'Janjgir-Champa'),
(103, 36, 'Korba'),
(104, 36, 'Koriya'),
(105, 36, 'Kanker'),
(106, 36, 'Kawardha'),
(107, 36, 'Mahasamund'),
(108, 36, 'Raigarh'),
(109, 36, 'Rajnandgaon'),
(110, 36, 'Raipur'),
(111, 36, 'Surguja'),
(112, 29, 'Diu'),
(113, 29, 'Daman'),
(114, 25, 'Central Delhi'),
(115, 25, 'East Delhi'),
(116, 25, 'New Delhi'),
(117, 25, 'North Delhi'),
(118, 25, 'North East Delhi'),
(119, 25, 'North West Delhi'),
(120, 25, 'South Delhi'),
(121, 25, 'South West Delhi'),
(122, 25, 'West Delhi'),
(123, 26, 'North Goa'),
(124, 26, 'South Goa'),
(125, 5, 'Ahmedabad'),
(126, 5, 'Amreli District'),
(127, 5, 'Anand'),
(128, 5, 'Banaskantha'),
(129, 5, 'Bharuch'),
(130, 5, 'Bhavnagar'),
(131, 5, 'Dahod'),
(132, 5, 'The Dangs'),
(133, 5, 'Gandhinagar'),
(134, 5, 'Jamnagar'),
(135, 5, 'Junagadh'),
(136, 5, 'Kutch'),
(137, 5, 'Kheda'),
(138, 5, 'Mehsana'),
(139, 5, 'Narmada'),
(140, 5, 'Navsari'),
(141, 5, 'Patan'),
(142, 5, 'Panchmahal'),
(143, 5, 'Porbandar'),
(144, 5, 'Rajkot'),
(145, 5, 'Sabarkantha'),
(146, 5, 'Surendranagar'),
(147, 5, 'Surat'),
(148, 5, 'Vadodara'),
(149, 5, 'Valsad'),
(150, 6, 'Ambala'),
(151, 6, 'Bhiwani'),
(152, 6, 'Faridabad'),
(153, 6, 'Fatehabad'),
(154, 6, 'Gurgaon'),
(155, 6, 'Hissar'),
(156, 6, 'Jhajjar'),
(157, 6, 'Jind'),
(158, 6, 'Karnal'),
(159, 6, 'Kaithal'),
(160, 6, 'Kurukshetra'),
(161, 6, 'Mahendragarh'),
(162, 6, 'Mewat'),
(163, 6, 'Panchkula'),
(164, 6, 'Panipat'),
(165, 6, 'Rewari'),
(166, 6, 'Rohtak'),
(167, 6, 'Sirsa'),
(168, 6, 'Sonepat'),
(169, 6, 'Yamuna Nagar'),
(170, 6, 'Palwal'),
(171, 7, 'Bilaspur'),
(172, 7, 'Chamba'),
(173, 7, 'Hamirpur'),
(174, 7, 'Kangra'),
(175, 7, 'Kinnaur'),
(176, 7, 'Kulu'),
(177, 7, 'Lahaul and Spiti'),
(178, 7, 'Mandi'),
(179, 7, 'Shimla'),
(180, 7, 'Sirmaur'),
(181, 7, 'Solan'),
(182, 7, 'Una'),
(183, 8, 'Anantnag'),
(184, 8, 'Badgam'),
(185, 8, 'Bandipore'),
(186, 8, 'Baramula'),
(187, 8, 'Doda'),
(188, 8, 'Jammu'),
(189, 8, 'Kargil'),
(190, 8, 'Kathua'),
(191, 8, 'Kupwara'),
(192, 8, 'Leh'),
(193, 8, 'Poonch'),
(194, 8, 'Pulwama'),
(195, 8, 'Rajauri'),
(196, 8, 'Srinagar'),
(197, 8, 'Samba'),
(198, 8, 'Udhampur'),
(199, 34, 'Bokaro'),
(200, 34, 'Chatra'),
(201, 34, 'Deoghar'),
(202, 34, 'Dhanbad'),
(203, 34, 'Dumka'),
(204, 34, 'Purba Singhbhum'),
(205, 34, 'Garhwa'),
(206, 34, 'Giridih'),
(207, 34, 'Godda'),
(208, 34, 'Gumla'),
(209, 34, 'Hazaribagh'),
(210, 34, 'Koderma'),
(211, 34, 'Lohardaga'),
(212, 34, 'Pakur'),
(213, 34, 'Palamu'),
(214, 34, 'Ranchi'),
(215, 34, 'Sahibganj'),
(216, 34, 'Seraikela and Kharsawan'),
(217, 34, 'Pashchim Singhbhum'),
(218, 34, 'Ramgarh'),
(219, 9, 'Bidar'),
(220, 9, 'Belgaum'),
(221, 9, 'Bijapur'),
(222, 9, 'Bagalkot'),
(223, 9, 'Bellary'),
(224, 9, 'Bangalore Rural District'),
(225, 9, 'Bangalore Urban District'),
(226, 9, 'Chamarajnagar'),
(227, 9, 'Chikmagalur'),
(228, 9, 'Chitradurga'),
(229, 9, 'Davanagere'),
(230, 9, 'Dharwad'),
(231, 9, 'Dakshina Kannada'),
(232, 9, 'Gadag'),
(233, 9, 'Gulbarga'),
(234, 9, 'Hassan'),
(235, 9, 'Haveri District'),
(236, 9, 'Kodagu'),
(237, 9, 'Kolar'),
(238, 9, 'Koppal'),
(239, 9, 'Mandya'),
(240, 9, 'Mysore'),
(241, 9, 'Raichur'),
(242, 9, 'Shimoga'),
(243, 9, 'Tumkur'),
(244, 9, 'Udupi'),
(245, 9, 'Uttara Kannada'),
(246, 9, 'Ramanagara'),
(247, 9, 'Chikballapur'),
(248, 9, 'Yadagiri'),
(249, 10, 'Alappuzha'),
(250, 10, 'Ernakulam'),
(251, 10, 'Idukki'),
(252, 10, 'Kollam'),
(253, 10, 'Kannur'),
(254, 10, 'Kasaragod'),
(255, 10, 'Kottayam'),
(256, 10, 'Kozhikode'),
(257, 10, 'Malappuram'),
(258, 10, 'Palakkad'),
(259, 10, 'Pathanamthitta'),
(260, 10, 'Thrissur'),
(261, 10, 'Thiruvananthapuram'),
(262, 10, 'Wayanad'),
(263, 11, 'Alirajpur'),
(264, 11, 'Anuppur'),
(265, 11, 'Ashok Nagar'),
(266, 11, 'Balaghat'),
(267, 11, 'Barwani'),
(268, 11, 'Betul'),
(269, 11, 'Bhind'),
(270, 11, 'Bhopal'),
(271, 11, 'Burhanpur'),
(272, 11, 'Chhatarpur'),
(273, 11, 'Chhindwara'),
(274, 11, 'Damoh'),
(275, 11, 'Datia'),
(276, 11, 'Dewas'),
(277, 11, 'Dhar'),
(278, 11, 'Dindori'),
(279, 11, 'Guna'),
(280, 11, 'Gwalior'),
(281, 11, 'Harda'),
(282, 11, 'Hoshangabad'),
(283, 11, 'Indore'),
(284, 11, 'Jabalpur'),
(285, 11, 'Jhabua'),
(286, 11, 'Katni'),
(287, 11, 'Khandwa'),
(288, 11, 'Khargone'),
(289, 11, 'Mandla'),
(290, 11, 'Mandsaur'),
(291, 11, 'Morena'),
(292, 11, 'Narsinghpur'),
(293, 11, 'Neemuch'),
(294, 11, 'Panna'),
(295, 11, 'Rewa'),
(296, 11, 'Rajgarh'),
(297, 11, 'Ratlam'),
(298, 11, 'Raisen'),
(299, 11, 'Sagar'),
(300, 11, 'Satna'),
(301, 11, 'Sehore'),
(302, 11, 'Seoni'),
(303, 11, 'Shahdol'),
(304, 11, 'Shajapur'),
(305, 11, 'Sheopur'),
(306, 11, 'Shivpuri'),
(307, 11, 'Sidhi'),
(308, 11, 'Singrauli'),
(309, 11, 'Tikamgarh'),
(310, 11, 'Ujjain'),
(311, 11, 'Umaria'),
(312, 11, 'Vidisha'),
(313, 12, 'Ahmednagar'),
(314, 12, 'Akola'),
(315, 12, 'Amrawati'),
(316, 12, 'Aurangabad'),
(317, 12, 'Bhandara'),
(318, 12, 'Beed'),
(319, 12, 'Buldhana'),
(320, 12, 'Chandrapur'),
(321, 12, 'Dhule'),
(322, 12, 'Gadchiroli'),
(323, 12, 'Gondiya'),
(324, 12, 'Hingoli'),
(325, 12, 'Jalgaon'),
(326, 12, 'Jalna'),
(327, 12, 'Kolhapur'),
(328, 12, 'Latur'),
(329, 12, 'Mumbai City'),
(330, 12, 'Mumbai suburban'),
(331, 12, 'Nandurbar'),
(332, 12, 'Nanded'),
(333, 12, 'Nagpur'),
(334, 12, 'Nashik'),
(335, 12, 'Osmanabad'),
(336, 12, 'Parbhani'),
(337, 12, 'Pune'),
(338, 12, 'Raigad'),
(339, 12, 'Ratnagiri'),
(340, 12, 'Sindhudurg'),
(341, 12, 'Sangli'),
(342, 12, 'Solapur'),
(343, 12, 'Satara'),
(344, 12, 'Thane'),
(345, 12, 'Wardha'),
(346, 12, 'Washim'),
(347, 12, 'Yavatmal'),
(348, 13, 'Bishnupur'),
(349, 13, 'Churachandpur'),
(350, 13, 'Chandel'),
(351, 13, 'Imphal East'),
(352, 13, 'Senapati'),
(353, 13, 'Tamenglong'),
(354, 13, 'Thoubal'),
(355, 13, 'Ukhrul'),
(356, 13, 'Imphal West'),
(357, 14, 'East Garo Hills'),
(358, 14, 'East Khasi Hills'),
(359, 14, 'Jaintia Hills'),
(360, 14, 'Ri-Bhoi'),
(361, 14, 'South Garo Hills'),
(362, 14, 'West Garo Hills'),
(363, 14, 'West Khasi Hills'),
(364, 15, 'Aizawl'),
(365, 15, 'Champhai'),
(366, 15, 'Kolasib'),
(367, 15, 'Lawngtlai'),
(368, 15, 'Lunglei'),
(369, 15, 'Mamit'),
(370, 15, 'Saiha'),
(371, 15, 'Serchhip'),
(372, 16, 'Dimapur'),
(373, 16, 'Kohima'),
(374, 16, 'Mokokchung'),
(375, 16, 'Mon'),
(376, 16, 'Phek'),
(377, 16, 'Tuensang'),
(378, 16, 'Wokha'),
(379, 16, 'Zunheboto'),
(380, 17, 'Angul'),
(381, 17, 'Boudh'),
(382, 17, 'Bhadrak'),
(383, 17, 'Bolangir'),
(384, 17, 'Bargarh'),
(385, 17, 'Baleswar'),
(386, 17, 'Cuttack'),
(387, 17, 'Debagarh'),
(388, 17, 'Dhenkanal'),
(389, 17, 'Ganjam'),
(390, 17, 'Gajapati'),
(391, 17, 'Jharsuguda'),
(392, 17, 'Jajapur'),
(393, 17, 'Jagatsinghpur'),
(394, 17, 'Khordha'),
(395, 17, 'Kendujhar'),
(396, 17, 'Kalahandi'),
(397, 17, 'Kandhamal'),
(398, 17, 'Koraput'),
(399, 17, 'Kendrapara'),
(400, 17, 'Malkangiri'),
(401, 17, 'Mayurbhanj'),
(402, 17, 'Nabarangpur'),
(403, 17, 'Nuapada'),
(404, 17, 'Nayagarh'),
(405, 17, 'Puri'),
(406, 17, 'Rayagada'),
(407, 17, 'Sambalpur'),
(408, 17, 'Subarnapur'),
(409, 17, 'Sundargarh'),
(410, 27, 'Karaikal'),
(411, 27, 'Mahe'),
(412, 27, 'Puducherry'),
(413, 27, 'Yanam'),
(414, 18, 'Amritsar'),
(415, 18, 'Bathinda'),
(416, 18, 'Firozpur'),
(417, 18, 'Faridkot'),
(418, 18, 'Fatehgarh Sahib'),
(419, 18, 'Gurdaspur'),
(420, 18, 'Hoshiarpur'),
(421, 18, 'Jalandhar'),
(422, 18, 'Kapurthala'),
(423, 18, 'Ludhiana'),
(424, 18, 'Mansa'),
(425, 18, 'Moga'),
(426, 18, 'Mukatsar'),
(427, 18, 'Nawan Shehar'),
(428, 18, 'Patiala'),
(429, 18, 'Rupnagar'),
(430, 18, 'Sangrur'),
(431, 19, 'Ajmer'),
(432, 19, 'Alwar'),
(433, 19, 'Bikaner'),
(434, 19, 'Barmer'),
(435, 19, 'Banswara'),
(436, 19, 'Bharatpur'),
(437, 19, 'Baran'),
(438, 19, 'Bundi'),
(439, 19, 'Bhilwara'),
(440, 19, 'Churu'),
(441, 19, 'Chittorgarh'),
(442, 19, 'Dausa'),
(443, 19, 'Dholpur'),
(444, 19, 'Dungapur'),
(445, 19, 'Ganganagar'),
(446, 19, 'Hanumangarh'),
(447, 19, 'Juhnjhunun'),
(448, 19, 'Jalore'),
(449, 19, 'Jodhpur'),
(450, 19, 'Jaipur'),
(451, 19, 'Jaisalmer'),
(452, 19, 'Jhalawar'),
(453, 19, 'Karauli'),
(454, 19, 'Kota'),
(455, 19, 'Nagaur'),
(456, 19, 'Pali'),
(457, 19, 'Pratapgarh'),
(458, 19, 'Rajsamand'),
(459, 19, 'Sikar'),
(460, 19, 'Sawai Madhopur'),
(461, 19, 'Sirohi'),
(462, 19, 'Tonk'),
(463, 19, 'Udaipur'),
(464, 20, 'East Sikkim'),
(465, 20, 'North Sikkim'),
(466, 20, 'South Sikkim'),
(467, 20, 'West Sikkim'),
(468, 21, 'Ariyalur'),
(469, 21, 'Chennai'),
(470, 21, 'Coimbatore'),
(471, 21, 'Cuddalore'),
(472, 21, 'Dharmapuri'),
(473, 21, 'Dindigul'),
(474, 21, 'Erode'),
(475, 21, 'Kanchipuram'),
(476, 21, 'Kanyakumari'),
(477, 21, 'Karur'),
(478, 21, 'Madurai'),
(479, 21, 'Nagapattinam'),
(480, 21, 'The Nilgiris'),
(481, 21, 'Namakkal'),
(482, 21, 'Perambalur'),
(483, 21, 'Pudukkottai'),
(484, 21, 'Ramanathapuram'),
(485, 21, 'Salem'),
(486, 21, 'Sivagangai'),
(487, 21, 'Tiruppur'),
(488, 21, 'Tiruchirappalli'),
(489, 21, 'Theni'),
(490, 21, 'Tirunelveli'),
(491, 21, 'Thanjavur'),
(492, 21, 'Thoothukudi'),
(493, 21, 'Thiruvallur'),
(494, 21, 'Thiruvarur'),
(495, 21, 'Tiruvannamalai'),
(496, 21, 'Vellore'),
(497, 21, 'Villupuram'),
(498, 22, 'Dhalai'),
(499, 22, 'North Tripura'),
(500, 22, 'South Tripura'),
(501, 22, 'West Tripura'),
(502, 33, 'Almora'),
(503, 33, 'Bageshwar'),
(504, 33, 'Chamoli'),
(505, 33, 'Champawat'),
(506, 33, 'Dehradun'),
(507, 33, 'Haridwar'),
(508, 33, 'Nainital'),
(509, 33, 'Pauri Garhwal'),
(510, 33, 'Pithoragharh'),
(511, 33, 'Rudraprayag'),
(512, 33, 'Tehri Garhwal'),
(513, 33, 'Udham Singh Nagar'),
(514, 33, 'Uttarkashi'),
(515, 23, 'Agra'),
(516, 23, 'Allahabad'),
(517, 23, 'Aligarh'),
(518, 23, 'Ambedkar Nagar'),
(519, 23, 'Auraiya'),
(520, 23, 'Azamgarh'),
(521, 23, 'Barabanki'),
(522, 23, 'Badaun'),
(523, 23, 'Bagpat'),
(524, 23, 'Bahraich'),
(525, 23, 'Bijnor'),
(526, 23, 'Ballia'),
(527, 23, 'Banda'),
(528, 23, 'Balrampur'),
(529, 23, 'Bareilly'),
(530, 23, 'Basti'),
(531, 23, 'Bulandshahr'),
(532, 23, 'Chandauli'),
(533, 23, 'Chitrakoot'),
(534, 23, 'Deoria'),
(535, 23, 'Etah'),
(536, 23, 'Kanshiram Nagar'),
(537, 23, 'Etawah'),
(538, 23, 'Firozabad'),
(539, 23, 'Farrukhabad'),
(540, 23, 'Fatehpur'),
(541, 23, 'Faizabad'),
(542, 23, 'Gautam Buddha Nagar'),
(543, 23, 'Gonda'),
(544, 23, 'Ghazipur'),
(545, 23, 'Gorkakhpur'),
(546, 23, 'Ghaziabad'),
(547, 23, 'Hamirpur'),
(548, 23, 'Hardoi'),
(549, 23, 'Mahamaya Nagar'),
(550, 23, 'Jhansi'),
(551, 23, 'Jalaun'),
(552, 23, 'Jyotiba Phule Nagar'),
(553, 23, 'Jaunpur District'),
(554, 23, 'Kanpur Dehat'),
(555, 23, 'Kannauj'),
(556, 23, 'Kanpur Nagar'),
(557, 23, 'Kaushambi'),
(558, 23, 'Kushinagar'),
(559, 23, 'Lalitpur'),
(560, 23, 'Lakhimpur Kheri'),
(561, 23, 'Lucknow'),
(562, 23, 'Mau'),
(563, 23, 'Meerut'),
(564, 23, 'Maharajganj'),
(565, 23, 'Mahoba'),
(566, 23, 'Mirzapur'),
(567, 23, 'Moradabad'),
(568, 23, 'Mainpuri'),
(569, 23, 'Mathura'),
(570, 23, 'Muzaffarnagar'),
(571, 23, 'Pilibhit'),
(572, 23, 'Pratapgarh'),
(573, 23, 'Rampur'),
(574, 23, 'Rae Bareli'),
(575, 23, 'Saharanpur'),
(576, 23, 'Sitapur'),
(577, 23, 'Shahjahanpur'),
(578, 23, 'Sant Kabir Nagar'),
(579, 23, 'Siddharthnagar'),
(580, 23, 'Sonbhadra'),
(581, 23, 'Sant Ravidas Nagar'),
(582, 23, 'Sultanpur'),
(583, 23, 'Shravasti'),
(584, 23, 'Unnao'),
(585, 23, 'Varanasi'),
(586, 24, 'Birbhum'),
(587, 24, 'Bankura'),
(588, 24, 'Bardhaman'),
(589, 24, 'Darjeeling'),
(590, 24, 'Dakshin Dinajpur'),
(591, 24, 'Hooghly'),
(592, 24, 'Howrah'),
(593, 24, 'Jalpaiguri'),
(594, 24, 'Cooch Behar'),
(595, 24, 'Kolkata'),
(596, 24, 'Malda'),
(597, 24, 'Midnapore'),
(598, 24, 'Murshidabad'),
(599, 24, 'Nadia'),
(600, 24, 'North 24 Parganas'),
(601, 24, 'South 24 Parganas'),
(602, 24, 'Purulia'),
(603, 24, 'Uttar Dinajpur');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiry`
--

CREATE TABLE `tbl_enquiry` (
  `enquiry_id` int(11) NOT NULL,
  `enquiry_subject` varchar(50) NOT NULL,
  `enquiry` varchar(150) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `reply` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_enquiry`
--

INSERT INTO `tbl_enquiry` (`enquiry_id`, `enquiry_subject`, `enquiry`, `user_login_id`, `reply`) VALUES
(2, 'wqewqeqwe', 'qwewqewqe ewrewr', 1, 'No'),
(3, 'qweqwe', 'qwreqwrwqrt', 1, 'No'),
(4, 'qwreqwrvcewre', 'wrewre', 1, 'sqwdqwd');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fee`
--

CREATE TABLE `tbl_fee` (
  `fee_id` int(11) NOT NULL,
  `fee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_fee`
--

INSERT INTO `tbl_fee` (`fee_id`, `fee`) VALUES
(1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` longtext DEFAULT NULL,
  `Usertype` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `username`, `password`, `Usertype`, `status`) VALUES
(1, 'anu1234', 'anu12345', 'Customer', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`state_id`, `country_id`, `state`) VALUES
(1, 105, 'ANDHRA PRADESH'),
(2, 105, 'ASSAM'),
(3, 105, 'ARUNACHAL PRADESH'),
(4, 105, 'BIHAR'),
(5, 105, 'GUJRAT'),
(6, 105, 'HARYANA'),
(7, 105, 'HIMACHAL PRADESH'),
(8, 105, 'JAMMU & KASHMIR'),
(9, 105, 'KARNATAKA'),
(10, 105, 'KERALA'),
(11, 105, 'MADHYA PRADESH'),
(12, 105, 'MAHARASHTRA'),
(13, 105, 'MANIPUR'),
(14, 105, 'MEGHALAYA'),
(15, 105, 'MIZORAM'),
(16, 105, 'NAGALAND'),
(17, 105, 'ORISSA'),
(18, 105, 'PUNJAB'),
(19, 105, 'RAJASTHAN'),
(20, 105, 'SIKKIM'),
(21, 105, 'TAMIL NADU'),
(22, 105, 'TRIPURA'),
(23, 105, 'UTTAR PRADESH'),
(24, 105, 'WEST BENGAL'),
(25, 105, 'DELHI'),
(26, 105, 'GOA'),
(27, 105, 'PONDICHERY'),
(28, 105, 'LAKSHDWEEP'),
(29, 105, 'DAMAN & DIU'),
(30, 105, 'DADRA & NAGAR'),
(31, 105, 'CHANDIGARH'),
(32, 105, 'ANDAMAN & NICOBAR'),
(33, 105, 'UTTARANCHAL'),
(34, 105, 'JHARKHAND'),
(35, 105, 'CHATTISGARH');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_charging_station`
--
ALTER TABLE `tbl_charging_station`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `tbl_fee`
--
ALTER TABLE `tbl_fee`
  ADD PRIMARY KEY (`fee_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_charging_station`
--
ALTER TABLE `tbl_charging_station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;

--
-- AUTO_INCREMENT for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  MODIFY `enquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_fee`
--
ALTER TABLE `tbl_fee`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
