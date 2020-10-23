-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2020 at 06:10 PM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_managements`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `mobile`, `password`, `remember_token`, `status`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Super  Admin', 'asif.sanix@gmail.com', '7894561230', '$2y$10$XZuiRROY/vGwCjI4ImzgFO9d4To3vDfmdspRC7ABueeqykhhzNt46', 'FpE922ljCs6CRzsxSFvOcpkX0llFD7sCdAHfsLGR9qbq6lcdQxfAcwVhvsBz', 1, 'storage/admin/1_1576476827.png', '2019-03-27 00:00:00', '2019-12-16 11:43:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_logins`
--

CREATE TABLE `admin_logins` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `login_at` datetime DEFAULT NULL,
  `logout_at` datetime DEFAULT NULL,
  `ip_address` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_logins`
--

INSERT INTO `admin_logins` (`id`, `employee_id`, `login_at`, `logout_at`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '10.107.4.84', '2019-03-30 06:32:21', '2019-03-30 06:32:21'),
(2, 1, '2019-03-30 06:59:32', NULL, '10.107.4.84', '2019-03-30 06:59:32', '2019-03-30 06:59:32'),
(3, 1, '2019-03-30 07:08:27', '2019-03-30 07:08:54', '10.107.4.84', '2019-03-30 07:08:27', '2019-03-30 07:08:54'),
(4, 1, '2019-03-30 12:39:50', '2019-03-30 12:40:05', '10.107.4.84', '2019-03-30 12:39:50', '2019-03-30 12:40:05'),
(5, 6, '2019-03-30 12:42:15', NULL, '10.107.4.84', '2019-03-30 12:42:15', '2019-03-30 12:42:15'),
(6, 2, '2019-03-30 12:43:22', '2019-03-30 12:56:44', '10.107.4.84', '2019-03-30 12:43:22', '2019-03-30 12:56:44'),
(7, 1, '2019-03-30 13:10:08', NULL, '10.107.4.84', '2019-03-30 13:10:08', '2019-03-30 13:10:08'),
(8, 1, '2019-03-30 14:19:38', NULL, '10.107.4.84', '2019-03-30 14:19:38', '2019-03-30 14:19:38'),
(9, 1, '2019-04-02 11:59:52', NULL, '10.107.4.29', '2019-04-02 11:59:52', '2019-04-02 11:59:52'),
(10, 1, '2019-04-02 16:42:21', '2019-04-02 19:04:57', '10.107.4.29', '2019-04-02 16:42:21', '2019-04-02 19:04:57'),
(11, 1, '2019-04-02 19:05:03', NULL, '10.107.4.29', '2019-04-02 19:05:03', '2019-04-02 19:05:03'),
(12, 1, '2019-04-04 12:50:24', '2019-04-04 13:29:58', '10.107.4.29', '2019-04-04 12:50:24', '2019-04-04 13:29:58'),
(13, 1, '2019-04-04 13:30:03', NULL, '10.107.4.29', '2019-04-04 13:30:03', '2019-04-04 13:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`slug`, `name`, `icon`, `parent`, `ordering`, `status`) VALUES
('admin', 'Admin', 'fa fa-user-secret', NULL, 1, 1),
('bread', 'Bread', 'ft-target', 'setting', 3, 1),
('dashboard', 'Dashboard', 'ft-home', NULL, 0, 1),
('menu', 'Menu', NULL, 'setting', 2, 1),
('role', 'Role', NULL, 'setting', 1, 1),
('setting', 'Setting', 'ft-settings', NULL, 6, 1),
('site_setting', 'Site Setting', 'ft-sliders', 'setting', 0, 1),
('user', 'User', 'ft-users', NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `menu_slug` varchar(200) DEFAULT NULL,
  `permission_key` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `menu_slug`, `permission_key`) VALUES
(1, 'role', 'browse_role'),
(2, 'role', 'read_role'),
(3, 'role', 'add_role'),
(4, 'role', 'edit_role'),
(5, 'role', 'delete_role'),
(6, 'site_setting', 'browse_site_setting'),
(7, 'site_setting', 'read_site_setting'),
(8, 'site_setting', 'add_site_setting'),
(9, 'site_setting', 'edit_site_setting'),
(10, 'site_setting', 'delete_site_setting'),
(11, 'setting', 'browse_setting'),
(12, 'setting', 'read_setting'),
(13, 'setting', 'add_setting'),
(14, 'setting', 'edit_setting'),
(15, 'setting', 'delete_setting'),
(16, 'bread', 'browse_bread'),
(17, 'bread', 'read_bread'),
(18, 'bread', 'add_bread'),
(19, 'bread', 'edit_bread'),
(20, 'bread', 'delete_bread');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'root', 'Super Admin', '2019-03-28 06:21:03', '2019-03-28 06:21:03'),
(2, 'admin', 'Admin', '2019-03-28 06:21:03', '2019-03-28 06:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_policies`
--

CREATE TABLE `role_policies` (
  `role_id` int(11) NOT NULL,
  `policy` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_policies`
--

INSERT INTO `role_policies` (`role_id`, `policy`, `created_at`, `updated_at`) VALUES
(1, 'sdfsdvsdfsdfsdfsd', NULL, NULL),
(4, 'dsfdsfdsfsd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL,
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` text,
  `site_title` varchar(255) DEFAULT NULL,
  `site_description` text,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `product_price`, `shipping_price`, `email`, `mobile`, `address`, `site_title`, `site_description`, `logo`, `favicon`, `created_at`, `updated_at`) VALUES
(1, '2.99', '0.50', 'Wannonadam@gmail.com', '3236301826', 'E-99 Phase-7 Mohali Industrial Area \r\nPunjab - 160059', 'Adam', 'ios app', 'storage/sitesetting//1563856827_logo.png', 'storage/sitesetting//1563856827_favicon.png', NULL, '2019-12-18 23:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `remember_token`, `status`, `avatar`, `device_id`, `created_at`, `updated_at`) VALUES
(1, 'Asif', 'asif.sanix@gmail.com', NULL, NULL, '$2y$10$XZuiRROY/vGwCjI4ImzgFO9d4To3vDfmdspRC7ABueeqykhhzNt46', NULL, 1, NULL, NULL, '2020-10-23 06:05:58', '2020-10-23 06:05:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_logins`
--
ALTER TABLE `admin_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`slug`),
  ADD UNIQUE KEY `slug` (`slug`);

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
  ADD UNIQUE KEY `key` (`permission_key`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD UNIQUE KEY `role_id_2` (`role_id`,`permission_key`);

--
-- Indexes for table `role_policies`
--
ALTER TABLE `role_policies`
  ADD UNIQUE KEY `role_id` (`role_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_logins`
--
ALTER TABLE `admin_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
