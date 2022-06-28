-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 31 mai 2022 à 10:32
-- Version du serveur :  10.3.35-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bota4906_yovente1`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`id`, `account_no`, `name`, `initial_balance`, `total_balance`, `note`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Account-1', 'Comptabilité 1', NULL, 0, 'Fond de caisse initial', 1, 1, '2018-12-18 01:58:02', '2022-01-06 14:27:31'),
(3, '21211', 'Sa', NULL, 0, NULL, 0, 0, '2018-12-18 01:58:56', '2022-01-03 15:36:31');

-- --------------------------------------------------------

--
-- Structure de la table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `billers`
--

CREATE TABLE `billers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ensemble', NULL, NULL, 1, '2022-05-11 06:18:34', '2022-05-11 06:18:34'),
(2, 'Abaya', NULL, NULL, 1, '2022-05-11 06:18:47', '2022-05-11 06:18:47');

-- --------------------------------------------------------

--
-- Structure de la table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AFOURAR - BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(2, 'AGADIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(3, 'AGHBAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(4, 'AGLOU', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(5, 'AGOURAY - MEKNES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(6, 'AGZIRT BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(7, 'AHFIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(8, 'AIN ALLA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(9, 'AIN AOUDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(10, 'AIN ATTIQ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(11, 'AIN CHEGGAG', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(12, 'AIN CHKEF', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(13, 'AIN DFALI-OUAZZANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(14, 'AIN EL MEDIOUR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(15, 'AIN HAROUDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(16, 'AIN JEMAA-MEKNES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(17, 'AIN JIRI-MEKNES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(18, 'AIN SEDDAQ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(19, 'AIN TEKKI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(20, 'AIN ZARKA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(21, 'AIT AISSA OUBRAHIM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(22, 'AIT AMIRA-AGADIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(23, 'AIT IAAZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(24, 'AIT IHYA OMOUSSA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(25, 'AIT MELLOUL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(26, 'AIT OURIR-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(27, 'AJDIR-HOUCIMA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(28, 'AJDIR-TAZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(29, 'AKKA-TATA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(30, 'AKLIM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(31, 'AL HOCEIMA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(32, 'ALNIF', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(33, 'ANZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(34, 'AOUFOUS', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(35, 'AOURIR-AGADIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(36, 'ARJAT-MOHAMMEDIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(37, 'ARREFOUD VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(38, 'ASILAH VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(39, 'ASSA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(40, 'ATTAOUIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(41, 'AZEMMOUR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(42, 'AZILAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(43, 'AZLA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(44, 'AZROU', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(45, 'BAB BARD', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(46, 'BAB TAZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(47, 'BDOUZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(48, 'BEJAAD', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(49, 'BELAAGID', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(50, 'BELFAA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(51, 'BELKSIRI VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(52, 'BEN AHMED-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(53, 'BEN GUERIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(54, 'BEN TAYEB-NADOR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(55, 'BENI ENSAR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(56, 'BENI MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(57, 'BENSLIMANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(58, 'BERKANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(59, 'BERRECHID VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(60, 'BHALIL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(61, 'BIOUGRA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(62, 'BIR JDID', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(63, 'BNI AYAT - BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(64, 'BNI BOUAYACH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(65, 'BNI YAKHLEF', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(66, 'BOUANANE-TETOUN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(67, 'BOUARFA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(68, 'BOUDERBALA-MEKNES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(69, 'BOUFKRANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(70, 'BOUIZAKARNE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(71, 'BOUJDOUR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(72, 'BOUJNIBA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(73, 'BOUKNADL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(74, 'BOULANOUARE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(75, 'BOULEMANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(76, 'BOUMALNE DADES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(77, 'BOUMIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(78, 'BOUNAAMANE-TIZNIT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(79, 'BOUSKOURA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(80, 'BOUZNIKA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(81, 'BRADIA - BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(82, 'CABO NEGRO', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(83, 'CASABLANCA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(84, 'CHEFCHAOUEN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(85, 'CHELLALAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(86, 'CHICHAOUA-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(87, 'CHOUITER', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(88, 'DAKHLA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(89, 'DAR BOUAZZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(90, 'DAR OULD ZIDOUH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(91, 'DAROUA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(92, 'DCHEIRA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(93, 'DEMNATE-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(94, 'DKHISSA-MEKNES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(95, 'DLALHA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(96, 'DOUAR BOUMAIZ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(97, 'DRARGA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(98, 'DRIOUCH-NADOR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(99, 'ECHEMMAIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(100, 'EL BOROUJ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(101, 'EL GARA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(102, 'EL JADIDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(103, 'EL KSIBA - BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(104, 'EL MAADER EL KABIR-TIZNIT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(105, 'EL MANSOURIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(106, 'EL OUATIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(107, 'ELHAJEB VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(108, 'ERRACHIDIA-02', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(109, 'ERRAHMA VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(110, 'ESSAOUIRA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(111, 'ESSMARA-SAHARA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(112, 'FAM EL HISN-TATA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(113, 'FES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(114, 'FIGUIG', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(115, 'FNIDEQ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(116, 'FOUM ZGUID', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(117, 'FQUIH BEN SALAH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(118, 'GFIFAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(119, 'GOUASSEM-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(120, 'GOULMIMA VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(121, 'GUELMIM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(122, 'GUERCIF', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(123, 'GUISSER', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(124, 'HAD HRARA-SAFI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(125, 'HAD SWLME', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(126, 'HAD WLAD FRAJ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(127, 'HARHOURA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(128, 'HOUARA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(129, 'IDI JABER-BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(130, 'IFRAN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(131, 'IGHRAM LAALAM-BENI MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(132, 'IMGON-TINGHIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(133, 'IMINTANOUTE-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(134, 'IMOUZAR KANDRE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(135, 'IMOUZZER MARMOUCHA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(136, 'IMZOUREN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(137, 'INZEGANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(138, 'ISSAFEN-TATA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(139, 'ISSAGUEN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(140, 'JAMAAT FDALA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(141, 'JAMAAT SHAIM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(142, 'JERADA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(143, 'JORF EL MELHA-OUZZANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(144, 'JORF SEFAR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(145, 'KABILA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(146, 'KAMOUNI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(147, 'KARIAT ARKMAN‎-NADOR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(148, 'KARIAT BA MOHAMED', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(149, 'KASBA TADLA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(150, 'KASBAH EL TAHER', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(151, 'KELÂA DES SRAGHNA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(152, 'KELÂAT M GOUNA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(153, 'KELIAA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(154, 'KENITRA VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(155, 'KHEMIS SAHEL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(156, 'KHEMIS ZEMAMRA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(157, 'KHEMISSET VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(158, 'KHENICHET', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(159, 'KHENIFRA VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(160, 'KHOURIBGA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(161, 'KSAR EL KEBIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(162, 'KSAR SGHIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(163, 'LAAROUI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(164, 'LAAYOUNE-PORT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(165, 'LAAYOUNE-SAHARA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(166, 'LALLA FATNA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(167, 'LALLA MIMOUNA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(168, 'LAOUAMRA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(169, 'LARACHE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(170, 'LAYOUN CHERKIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(171, 'LHAJ KADOUR VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(172, 'LHAWZIA-JADIDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(173, 'LMHAYA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(174, 'LOUIZIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(175, 'M DIQ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(176, 'MAAZIZ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(177, 'MARINA SMIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(178, 'MARRAKECH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(179, 'MARTIL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(180, 'MASMOUDA - OUAZZANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(181, 'MAZAGAN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(182, 'MEDIONA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(183, 'MEHDIA VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(184, 'MEJJAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(185, 'MEKNES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(186, 'MHAMID EL GHIZLANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(187, 'MIDAR-DRIOUCH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(188, 'MIDELT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(189, 'MIMOSA-MOHAMMEDIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(190, 'MISSOUR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(191, 'MOLY DRISSE ZARHOUNE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(192, 'MOUHAMMEDIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(193, 'MOULAY ABDELLAH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(194, 'MOULAY BOUSSELHAM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(195, 'MOULAY YAÂCOUB', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(196, 'MRIRTE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(197, 'MSAWAR RASO', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(198, 'MSEMRIR-TINGHIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(199, 'MZOUDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(200, 'NADOR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(201, 'NOUACEUR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(202, 'OUAHAT SIDI BRAHIM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(203, 'OUALMES VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(204, 'OUARZAZAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(205, 'OUAZZANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(206, 'OUDAYA-MARRAKECH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(207, 'OUED AMLIL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(208, 'OUED LAOU', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(209, 'OUED ZEM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(210, 'OUJDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(211, 'OULAD AYAD', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(212, 'OULAD BERHIL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(213, 'OULAD DAHOU', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(214, 'OULAD JERRAR-TIZNIT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(215, 'OULAD SAID', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(216, 'OULAD SAID-BENI MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(217, 'OULAD TEIMA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(218, 'OULAD ZMAM - BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(219, 'OULED BEN RAHMOUN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(220, 'OULED BOUTABET', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(221, 'OURIKA-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(222, 'OUTAT EL HAJ', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(223, 'PLAGE DAVID-BOUZNIKA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(224, 'RABAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(225, 'RAS EL MA-FES', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(226, 'RICHE-02', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(227, 'RISSANI VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(228, 'ROMMANI VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(229, 'SAAIDIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(230, 'SAFI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(231, 'SALE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(232, 'SALE EL JADIDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(233, 'SBAA AYOUNE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(234, 'SEBT EL GUERDANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(235, 'SEBT GZOULA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(236, 'SEFROU', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(237, 'SEGANGAN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(238, 'SELOUANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(239, 'SETTATE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(240, 'SID L MOKHTAR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(241, 'SID ZOUINE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(242, 'SIDI AISSA-BENI-MELLAL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(243, 'SIDI ALLAL EL BAHRAOUI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(244, 'SIDI ALLAL TAZI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(245, 'SIDI BENNOUR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(246, 'SIDI BOU OTHMANE-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(247, 'SIDI BOUZID', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(248, 'SIDI EL AIDI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(249, 'SIDI GHIAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(250, 'SIDI HAJJAJ SBIT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(251, 'SIDI HARAZEM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(252, 'SIDI IFNI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(253, 'SIDI KACEM', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(254, 'SIDI KAOUKI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(255, 'SIDI RAHL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(256, 'SIDI RAHLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(257, 'SIDI SLIMAN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(258, 'SIDI TAIBI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(259, 'SIDI YAHYA GHARB VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(260, 'SIDI-BIBI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(261, 'SKHIRAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(262, 'SKHOUR EL RAHMNA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(263, 'SOUIHLA-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(264, 'SOUIRIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(265, 'SOUK LARBAA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(266, 'SOUK LARBAA VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(267, 'SOUK SEBT OULAD NEMMA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(268, 'TADDART-TAZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(269, 'TAFETACHTE ESSAOUIRA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(270, 'TAFOUGHALT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(271, 'TAFRAOUTE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(272, 'TAGHAZOUT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(273, 'TAGMOUT-TATA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(274, 'TAGOUNITE‬-ZAGORA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(275, 'TAHANAOUT-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(276, 'TAHLA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(277, 'TAMANSOURT-MARRAKECH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(278, 'TAMARIS', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(279, 'TAMEGROUTE-ZAGORA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(280, 'TAMESLUHT- VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(281, 'TAMESNA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(282, 'TAMRAGHT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(283, 'TAMRAGHT-AGADIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(284, 'TAN TAN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(285, 'TANGER', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(286, 'TANTAN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(287, 'TAOUNATE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(288, 'TAOURIRT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(289, 'TARFYA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(290, 'TARGUIST', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(291, 'TAROUDANT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(292, 'TASSOULTANT-VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(293, 'TATA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(294, 'TAWJTAT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(295, 'TAZA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(296, 'TAZNAKHT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(297, 'TEMARA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(298, 'TEMSIA-AGADIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(299, 'TEROUAL - OUAZZANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(300, 'TETOUAN', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(301, 'TIFLET VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(302, 'TIKIOUINE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(303, 'TIN MANSOUR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(304, 'TINEJDAD VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(305, 'TINGHIR VILLE', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(306, 'TISSINT-TATA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(307, 'TIT MELLIL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(308, 'TIZNIT', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(309, 'TIZTOTIN-NADOR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(310, 'TLAT BOUARIS', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(311, 'TNIN EL GHIATE-SAFI', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(312, 'TNINE CHTOUKA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(313, 'TNINE GHARBIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(314, 'TOHMO AGADIR', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(315, 'WALIDIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(316, 'YOUSSOFIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(317, 'YOUSSOUFIA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(318, 'ZAGORA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(319, 'ZAIDA', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(320, 'ZAOUIAT CHEIKH', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(321, 'ZAOUIT SIDI SMAIL', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(322, 'ZAYOU', '2022-05-08 23:29:12', '2022-05-08 23:29:12'),
(323, 'ZOUMI-OUAZZANE', '2022-05-08 23:29:12', '2022-05-08 23:29:12');

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(2, 'Dirham', 'DHS', 1, '2020-11-01 00:29:12', '2022-01-02 14:06:53');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sold_by` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `packing` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivering` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `livraison` int(11) NOT NULL,
  `min_withdraw` int(11) NOT NULL,
  `staff_access` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `currency`, `livraison`, `min_withdraw`, `staff_access`, `date_format`, `developed_by`, `invoice_format`, `state`, `theme`, `created_at`, `updated_at`, `currency_position`) VALUES
(1, 'YoVente', '20220102040718.png', '2', 50, 500, 'own', 'd-m-Y', 'T@R!K', 'standard', 1, 'default.css', '2018-07-06 05:13:11', '2022-02-17 07:57:21', 'suffix');

-- --------------------------------------------------------

--
-- Structure de la table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'en', '2018-07-07 21:59:17', '2019-12-24 16:34:20');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_17_060412_create_categories_table', 1),
(4, '2018_02_20_035727_create_brands_table', 1),
(5, '2018_02_25_100635_create_suppliers_table', 1),
(6, '2018_02_27_101619_create_warehouse_table', 1),
(7, '2018_03_03_040448_create_units_table', 1),
(8, '2018_03_04_041317_create_taxes_table', 1),
(9, '2018_03_10_061915_create_customer_groups_table', 1),
(10, '2018_03_10_090534_create_customers_table', 1),
(11, '2018_03_11_095547_create_billers_table', 1),
(12, '2018_04_05_054401_create_products_table', 1),
(13, '2018_04_06_133606_create_purchases_table', 1),
(14, '2018_04_06_154600_create_product_purchases_table', 1),
(15, '2018_04_06_154915_create_product_warhouse_table', 1),
(16, '2018_04_10_085927_create_sales_table', 1),
(17, '2018_04_10_090133_create_product_sales_table', 1),
(18, '2018_04_10_090254_create_payments_table', 1),
(19, '2018_04_10_090341_create_payment_with_cheque_table', 1),
(20, '2018_04_10_090509_create_payment_with_credit_card_table', 1),
(21, '2018_04_13_121436_create_quotation_table', 1),
(22, '2018_04_13_122324_create_product_quotation_table', 1),
(23, '2018_04_14_121802_create_transfers_table', 1),
(24, '2018_04_14_121913_create_product_transfer_table', 1),
(25, '2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table', 2),
(26, '2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table', 3),
(27, '2018_05_20_054532_create_adjustments_table', 4),
(28, '2018_05_20_054859_create_product_adjustments_table', 4),
(29, '2018_05_21_163419_create_returns_table', 5),
(30, '2018_05_21_163443_create_product_returns_table', 5),
(31, '2018_06_02_050905_create_roles_table', 6),
(32, '2018_06_02_073430_add_columns_to_users_table', 7),
(33, '2018_06_03_053738_create_permission_tables', 8),
(36, '2018_06_21_063736_create_pos_setting_table', 9),
(37, '2018_06_21_094155_add_user_id_to_sales_table', 10),
(38, '2018_06_21_101529_add_user_id_to_purchases_table', 11),
(39, '2018_06_21_103512_add_user_id_to_transfers_table', 12),
(40, '2018_06_23_061058_add_user_id_to_quotations_table', 13),
(41, '2018_06_23_082427_add_is_deleted_to_users_table', 14),
(42, '2018_06_25_043308_change_email_to_users_table', 15),
(43, '2018_07_06_115449_create_general_settings_table', 16),
(44, '2018_07_08_043944_create_languages_table', 17),
(45, '2018_07_11_102144_add_user_id_to_returns_table', 18),
(46, '2018_07_11_102334_add_user_id_to_payments_table', 18),
(47, '2018_07_22_130541_add_digital_to_products_table', 19),
(49, '2018_07_24_154250_create_deliveries_table', 20),
(50, '2018_08_16_053336_create_expense_categories_table', 21),
(51, '2018_08_17_115415_create_expenses_table', 22),
(55, '2018_08_18_050418_create_gift_cards_table', 23),
(56, '2018_08_19_063119_create_payment_with_gift_card_table', 24),
(57, '2018_08_25_042333_create_gift_card_recharges_table', 25),
(58, '2018_08_25_101354_add_deposit_expense_to_customers_table', 26),
(59, '2018_08_26_043801_create_deposits_table', 27),
(60, '2018_09_02_044042_add_keybord_active_to_pos_setting_table', 28),
(61, '2018_09_09_092713_create_payment_with_paypal_table', 29),
(62, '2018_09_10_051254_add_currency_to_general_settings_table', 30),
(63, '2018_10_22_084118_add_biller_and_store_id_to_users_table', 31),
(65, '2018_10_26_034927_create_coupons_table', 32),
(66, '2018_10_27_090857_add_coupon_to_sales_table', 33),
(67, '2018_11_07_070155_add_currency_position_to_general_settings_table', 34),
(68, '2018_11_19_094650_add_combo_to_products_table', 35),
(69, '2018_12_09_043712_create_accounts_table', 36),
(70, '2018_12_17_112253_add_is_default_to_accounts_table', 37),
(71, '2018_12_19_103941_add_account_id_to_payments_table', 38),
(72, '2018_12_20_065900_add_account_id_to_expenses_table', 39),
(73, '2018_12_20_082753_add_account_id_to_returns_table', 40),
(74, '2018_12_26_064330_create_return_purchases_table', 41),
(75, '2018_12_26_144210_create_purchase_product_return_table', 42),
(76, '2018_12_26_144708_create_purchase_product_return_table', 43),
(77, '2018_12_27_110018_create_departments_table', 44),
(78, '2018_12_30_054844_create_employees_table', 45),
(79, '2018_12_31_125210_create_payrolls_table', 46),
(80, '2018_12_31_150446_add_department_id_to_employees_table', 47),
(81, '2019_01_01_062708_add_user_id_to_expenses_table', 48),
(82, '2019_01_02_075644_create_hrm_settings_table', 49),
(83, '2019_01_02_090334_create_attendances_table', 50),
(84, '2019_01_27_160956_add_three_columns_to_general_settings_table', 51),
(85, '2019_02_15_183303_create_stock_counts_table', 52),
(86, '2019_02_17_101604_add_is_adjusted_to_stock_counts_table', 53),
(87, '2019_04_13_101707_add_tax_no_to_customers_table', 54),
(89, '2019_10_14_111455_create_holidays_table', 55),
(90, '2019_11_13_145619_add_is_variant_to_products_table', 56),
(91, '2019_11_13_150206_create_product_variants_table', 57),
(92, '2019_11_13_153828_create_variants_table', 57),
(93, '2019_11_25_134041_add_qty_to_product_variants_table', 58),
(94, '2019_11_25_134922_add_variant_id_to_product_purchases_table', 58),
(95, '2019_11_25_145341_add_variant_id_to_product_warehouse_table', 58),
(96, '2019_11_29_182201_add_variant_id_to_product_sales_table', 59),
(97, '2019_12_04_121311_add_variant_id_to_product_quotation_table', 60),
(98, '2019_12_05_123802_add_variant_id_to_product_transfer_table', 61),
(100, '2019_12_08_114954_add_variant_id_to_product_returns_table', 62),
(101, '2019_12_08_203146_add_variant_id_to_purchase_product_return_table', 63),
(102, '2020_02_28_103340_create_money_transfers_table', 64),
(103, '2020_07_01_193151_add_image_to_categories_table', 65),
(105, '2020_09_26_130426_add_user_id_to_deliveries_table', 66),
(107, '2020_10_11_125457_create_cash_registers_table', 67),
(108, '2020_10_13_155019_add_cash_register_id_to_sales_table', 68),
(109, '2020_10_13_172624_add_cash_register_id_to_returns_table', 69),
(110, '2020_10_17_212338_add_cash_register_id_to_payments_table', 70),
(111, '2020_10_18_124200_add_cash_register_id_to_expenses_table', 71),
(112, '2020_10_21_121632_add_developed_by_to_general_settings_table', 72),
(113, '2019_08_19_000000_create_failed_jobs_table', 73),
(114, '2020_10_30_135557_create_notifications_table', 73),
(115, '2020_11_01_044954_create_currencies_table', 74),
(116, '2020_11_01_140736_add_price_to_product_warehouse_table', 75),
(117, '2020_11_02_050633_add_is_diff_price_to_products_table', 76),
(118, '2020_11_09_055222_add_user_id_to_customers_table', 77),
(119, '2020_11_17_054806_add_invoice_format_to_general_settings_table', 78),
(120, '2021_02_10_074859_add_variant_id_to_product_adjustments_table', 79),
(121, '2021_03_07_093606_create_product_batches_table', 80),
(122, '2021_03_07_093759_add_product_batch_id_to_product_warehouse_table', 80),
(123, '2021_03_07_093900_add_product_batch_id_to_product_purchases_table', 80),
(124, '2021_03_11_132603_add_product_batch_id_to_product_sales_table', 81),
(127, '2021_03_25_125421_add_is_batch_to_products_table', 82),
(128, '2021_05_19_120127_add_product_batch_id_to_product_returns_table', 82),
(130, '2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table', 83),
(131, '2021_05_23_124848_add_product_batch_id_to_product_transfer_table', 84),
(132, '2021_05_26_153106_add_product_batch_id_to_product_quotation_table', 85),
(134, '2022_01_03_205841_add_livraison_to_general_settings_table', 86),
(135, '2022_01_06_181753_add_livraison_to_sales_table', 87),
(136, '2022_01_06_182916_add_original_price_to_product_sales_table', 88),
(142, '2022_01_16_181335_add_packing_delivering_delivered_to_deliveries_table', 89),
(143, '2022_01_31_113821_add_fullname_to_users_table', 90),
(144, '2022_02_02_095123_add_bank_settings_to_users_table', 91),
(146, '2022_02_02_105659_add_created_by_to_customers_table', 92),
(148, '2022_02_03_093218_add_min_withdraw_to_general_settings_table', 93),
(149, '2022_02_03_101436_create_withdraws_table', 94),
(150, '2022_02_04_174247_rename_withdraws_table', 95),
(152, '2022_02_04_212528_add_is_paid_to_withdrawals_table', 96),
(153, '2022_02_09_202841_add_is_valide_to_sales_table', 97),
(154, '2022_05_09_220616_create_cities_table', 98),
(155, '2022_05_16_092535_add_customer_data_to_sales_table', 99),
(156, '2022_05_16_094339_remove_fields_to_sales_table', 100);

-- --------------------------------------------------------

--
-- Structure de la table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `payment_reference`, `user_id`, `purchase_id`, `sale_id`, `cash_register_id`, `account_id`, `amount`, `change`, `paying_method`, `payment_note`, `created_at`, `updated_at`) VALUES
(4, 'ppr-20220530-123834', 1, 6, NULL, NULL, 1, 6600, 0, 'Cash', NULL, '2022-05-29 22:38:34', '2022-05-29 22:38:34');

-- --------------------------------------------------------

--
-- Structure de la table `payment_with_cheque`
--

CREATE TABLE `payment_with_cheque` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_with_gift_card`
--

CREATE TABLE `payment_with_gift_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_with_paypal`
--

CREATE TABLE `payment_with_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'products-edit', 'web', '2018-06-03 00:00:09', '2018-06-03 00:00:09'),
(5, 'products-delete', 'web', '2018-06-03 21:54:22', '2018-06-03 21:54:22'),
(6, 'products-add', 'web', '2018-06-03 23:34:14', '2018-06-03 23:34:14'),
(7, 'products-index', 'web', '2018-06-04 02:34:27', '2018-06-04 02:34:27'),
(8, 'purchases-index', 'web', '2018-06-04 07:03:19', '2018-06-04 07:03:19'),
(9, 'purchases-add', 'web', '2018-06-04 07:12:25', '2018-06-04 07:12:25'),
(10, 'purchases-edit', 'web', '2018-06-04 08:47:36', '2018-06-04 08:47:36'),
(11, 'purchases-delete', 'web', '2018-06-04 08:47:36', '2018-06-04 08:47:36'),
(12, 'sales-index', 'web', '2018-06-04 09:49:08', '2018-06-04 09:49:08'),
(13, 'sales-add', 'web', '2018-06-04 09:49:52', '2018-06-04 09:49:52'),
(14, 'sales-edit', 'web', '2018-06-04 09:49:52', '2018-06-04 09:49:52'),
(15, 'sales-delete', 'web', '2018-06-04 09:49:53', '2018-06-04 09:49:53'),
(16, 'quotes-index', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(17, 'quotes-add', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(18, 'quotes-edit', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(19, 'quotes-delete', 'web', '2018-06-04 21:05:10', '2018-06-04 21:05:10'),
(20, 'transfers-index', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(21, 'transfers-add', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(22, 'transfers-edit', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(23, 'transfers-delete', 'web', '2018-06-04 21:30:03', '2018-06-04 21:30:03'),
(24, 'returns-index', 'web', '2018-06-04 21:50:24', '2018-06-04 21:50:24'),
(25, 'returns-add', 'web', '2018-06-04 21:50:24', '2018-06-04 21:50:24'),
(26, 'returns-edit', 'web', '2018-06-04 21:50:25', '2018-06-04 21:50:25'),
(27, 'returns-delete', 'web', '2018-06-04 21:50:25', '2018-06-04 21:50:25'),
(28, 'customers-index', 'web', '2018-06-04 22:15:54', '2018-06-04 22:15:54'),
(29, 'customers-add', 'web', '2018-06-04 22:15:55', '2018-06-04 22:15:55'),
(30, 'customers-edit', 'web', '2018-06-04 22:15:55', '2018-06-04 22:15:55'),
(31, 'customers-delete', 'web', '2018-06-04 22:15:55', '2018-06-04 22:15:55'),
(32, 'suppliers-index', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(33, 'suppliers-add', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(34, 'suppliers-edit', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(35, 'suppliers-delete', 'web', '2018-06-04 22:40:12', '2018-06-04 22:40:12'),
(36, 'product-report', 'web', '2018-06-24 22:05:33', '2018-06-24 22:05:33'),
(37, 'purchase-report', 'web', '2018-06-24 22:24:56', '2018-06-24 22:24:56'),
(38, 'sale-report', 'web', '2018-06-24 22:33:13', '2018-06-24 22:33:13'),
(39, 'customer-report', 'web', '2018-06-24 22:36:51', '2018-06-24 22:36:51'),
(40, 'due-report', 'web', '2018-06-24 22:39:52', '2018-06-24 22:39:52'),
(41, 'users-index', 'web', '2018-06-24 23:00:10', '2018-06-24 23:00:10'),
(42, 'users-add', 'web', '2018-06-24 23:00:10', '2018-06-24 23:00:10'),
(43, 'users-edit', 'web', '2018-06-24 23:01:30', '2018-06-24 23:01:30'),
(44, 'users-delete', 'web', '2018-06-24 23:01:30', '2018-06-24 23:01:30'),
(45, 'profit-loss', 'web', '2018-07-14 20:50:05', '2018-07-14 20:50:05'),
(46, 'best-seller', 'web', '2018-07-14 21:01:38', '2018-07-14 21:01:38'),
(47, 'daily-sale', 'web', '2018-07-14 21:24:21', '2018-07-14 21:24:21'),
(48, 'monthly-sale', 'web', '2018-07-14 21:30:41', '2018-07-14 21:30:41'),
(49, 'daily-purchase', 'web', '2018-07-14 21:36:46', '2018-07-14 21:36:46'),
(50, 'monthly-purchase', 'web', '2018-07-14 21:48:17', '2018-07-14 21:48:17'),
(51, 'payment-report', 'web', '2018-07-14 22:10:41', '2018-07-14 22:10:41'),
(52, 'warehouse-stock-report', 'web', '2018-07-14 22:16:55', '2018-07-14 22:16:55'),
(53, 'product-qty-alert', 'web', '2018-07-14 22:33:21', '2018-07-14 22:33:21'),
(54, 'supplier-report', 'web', '2018-07-30 02:00:01', '2018-07-30 02:00:01'),
(55, 'expenses-index', 'web', '2018-09-05 00:07:10', '2018-09-05 00:07:10'),
(56, 'expenses-add', 'web', '2018-09-05 00:07:10', '2018-09-05 00:07:10'),
(57, 'expenses-edit', 'web', '2018-09-05 00:07:10', '2018-09-05 00:07:10'),
(58, 'expenses-delete', 'web', '2018-09-05 00:07:11', '2018-09-05 00:07:11'),
(59, 'general_setting', 'web', '2018-10-19 22:10:04', '2018-10-19 22:10:04'),
(60, 'mail_setting', 'web', '2018-10-19 22:10:04', '2018-10-19 22:10:04'),
(61, 'pos_setting', 'web', '2018-10-19 22:10:04', '2018-10-19 22:10:04'),
(62, 'hrm_setting', 'web', '2019-01-02 09:30:23', '2019-01-02 09:30:23'),
(63, 'purchase-return-index', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(64, 'purchase-return-add', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(65, 'purchase-return-edit', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(66, 'purchase-return-delete', 'web', '2019-01-02 20:45:14', '2019-01-02 20:45:14'),
(67, 'account-index', 'web', '2019-01-02 21:06:13', '2019-01-02 21:06:13'),
(68, 'balance-sheet', 'web', '2019-01-02 21:06:14', '2019-01-02 21:06:14'),
(69, 'account-statement', 'web', '2019-01-02 21:06:14', '2019-01-02 21:06:14'),
(70, 'department', 'web', '2019-01-02 21:30:01', '2019-01-02 21:30:01'),
(71, 'attendance', 'web', '2019-01-02 21:30:01', '2019-01-02 21:30:01'),
(72, 'payroll', 'web', '2019-01-02 21:30:01', '2019-01-02 21:30:01'),
(73, 'employees-index', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(74, 'employees-add', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(75, 'employees-edit', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(76, 'employees-delete', 'web', '2019-01-02 21:52:19', '2019-01-02 21:52:19'),
(77, 'user-report', 'web', '2019-01-16 05:48:18', '2019-01-16 05:48:18'),
(78, 'stock_count', 'web', '2019-02-17 09:32:01', '2019-02-17 09:32:01'),
(79, 'adjustment', 'web', '2019-02-17 09:32:02', '2019-02-17 09:32:02'),
(80, 'sms_setting', 'web', '2019-02-22 04:18:03', '2019-02-22 04:18:03'),
(81, 'create_sms', 'web', '2019-02-22 04:18:03', '2019-02-22 04:18:03'),
(82, 'print_barcode', 'web', '2019-03-07 04:02:19', '2019-03-07 04:02:19'),
(83, 'empty_database', 'web', '2019-03-07 04:02:19', '2019-03-07 04:02:19'),
(84, 'customer_group', 'web', '2019-03-07 04:37:15', '2019-03-07 04:37:15'),
(85, 'unit', 'web', '2019-03-07 04:37:15', '2019-03-07 04:37:15'),
(86, 'tax', 'web', '2019-03-07 04:37:15', '2019-03-07 04:37:15'),
(87, 'gift_card', 'web', '2019-03-07 05:29:38', '2019-03-07 05:29:38'),
(88, 'coupon', 'web', '2019-03-07 05:29:38', '2019-03-07 05:29:38'),
(89, 'holiday', 'web', '2019-10-19 07:57:15', '2019-10-19 07:57:15'),
(90, 'warehouse-report', 'web', '2019-10-22 05:00:23', '2019-10-22 05:00:23'),
(91, 'warehouse', 'web', '2020-02-26 05:47:32', '2020-02-26 05:47:32'),
(92, 'brand', 'web', '2020-02-26 05:59:59', '2020-02-26 05:59:59'),
(93, 'billers-index', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(94, 'billers-add', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(95, 'billers-edit', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(96, 'billers-delete', 'web', '2020-02-26 06:11:15', '2020-02-26 06:11:15'),
(97, 'money-transfer', 'web', '2020-03-02 04:41:48', '2020-03-02 04:41:48'),
(98, 'category', 'web', '2020-07-13 11:13:16', '2020-07-13 11:13:16'),
(99, 'delivery', 'web', '2020-07-13 11:13:16', '2020-07-13 11:13:16'),
(100, 'send_notification', 'web', '2020-10-31 05:21:31', '2020-10-31 05:21:31'),
(101, 'today_sale', 'web', '2020-10-31 05:57:04', '2020-10-31 05:57:04'),
(102, 'today_profit', 'web', '2020-10-31 05:57:04', '2020-10-31 05:57:04'),
(103, 'currency', 'web', '2020-11-08 23:23:11', '2020-11-08 23:23:11'),
(104, 'backup_database', 'web', '2020-11-14 23:16:55', '2020-11-14 23:16:55'),
(105, 'withdraw-add', 'web', '2022-02-03 08:10:47', '2022-02-03 08:10:49'),
(106, 'withdraw-edit', 'web', '2022-02-03 08:10:51', '2022-02-03 08:10:52'),
(107, 'withdraw-index', 'web', '2022-02-03 08:11:09', '2022-02-03 08:11:11'),
(108, 'withdraw-delete', 'web', '2022-02-03 08:11:26', '2022-02-03 08:11:27');

-- --------------------------------------------------------

--
-- Structure de la table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `keybord_active`, `stripe_public_key`, `stripe_secret_key`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 3, 1, 'Stripe_Publishable_key', 'Stripe_Secret_key', '2022-01-07 21:32:23', '2022-01-07 21:32:23');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `qty`, `alert_quantity`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_variant`, `is_batch`, `is_diffPrice`, `featured`, `product_list`, `qty_list`, `price_list`, `product_details`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 'Product 1', 'P-22-910', 'standard', 'C39', NULL, 1, 1, 1, 1, '100', '150', 31, 5, NULL, NULL, NULL, NULL, NULL, NULL, '1653854170095IMG-20200713-WA0031-removebg-preview.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-05-29 19:56:47', '2022-05-29 22:47:54'),
(5, 'Product 2', 'P-22-642', 'standard', 'C39', NULL, 1, 1, 1, 1, '120', '180', 30, 5, NULL, NULL, NULL, NULL, NULL, NULL, '1653854286531IMG-20200713-WA0030-removebg-preview.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-05-29 19:58:15', '2022-05-29 21:48:31'),
(6, 'Product 3', 'P-22-400', 'standard', 'C39', NULL, 2, 1, 1, 1, '90', '130', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, '1653854352292IMG-20200713-WA0036-removebg-preview.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-05-29 19:59:26', '2022-05-29 19:59:26');

-- --------------------------------------------------------

--
-- Structure de la table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `purchase_id`, `product_id`, `product_batch_id`, `variant_id`, `qty`, `recieved`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(21, 6, 5, NULL, 1, 20, 20, 1, 120, 0, 0, 0, 2400, '2022-05-29 21:48:30', '2022-05-29 21:48:30'),
(22, 6, 4, NULL, 1, 10, 10, 1, 100, 0, 0, 0, 1000, '2022-05-29 21:48:31', '2022-05-29 21:48:31'),
(23, 6, 4, NULL, 2, 20, 20, 1, 100, 0, 0, 0, 2000, '2022-05-29 21:48:31', '2022-05-29 21:48:31'),
(24, 6, 5, NULL, 2, 10, 10, 1, 120, 0, 0, 0, 1200, '2022-05-29 21:48:31', '2022-05-29 21:48:31'),
(25, 7, 4, NULL, 1, 1, 1, 1, 100, 0, 0, 0, 100, '2022-05-29 22:47:54', '2022-05-29 22:47:54');

-- --------------------------------------------------------

--
-- Structure de la table `product_quotation`
--

CREATE TABLE `product_quotation` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `original_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_id`, `position`, `item_code`, `additional_price`, `qty`, `created_at`, `updated_at`) VALUES
(25, 4, 1, 1, 'M-P-22-910', NULL, 11, '2022-05-29 19:56:47', '2022-05-29 22:47:54'),
(26, 4, 2, 2, 'L-P-22-910', NULL, 20, '2022-05-29 19:56:47', '2022-05-29 21:48:31'),
(27, 4, 3, 3, 'XL-P-22-910', NULL, 0, '2022-05-29 19:56:47', '2022-05-29 19:56:47'),
(28, 4, 4, 4, 'XXL-P-22-910', NULL, 0, '2022-05-29 19:56:47', '2022-05-29 19:56:47'),
(29, 5, 2, 1, 'L-P-22-642', NULL, 10, '2022-05-29 19:58:15', '2022-05-29 21:48:31'),
(30, 5, 1, 2, 'M-P-22-642', NULL, 20, '2022-05-29 19:58:15', '2022-05-29 21:48:30'),
(31, 6, 3, 1, 'XL-P-22-400', NULL, 0, '2022-05-29 19:59:26', '2022-05-29 19:59:26'),
(32, 6, 4, 2, 'XXL-P-22-400', NULL, 0, '2022-05-29 19:59:26', '2022-05-29 19:59:26');

-- --------------------------------------------------------

--
-- Structure de la table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `status`, `payment_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(6, 'pr-tarik-290522-224830', 1, NULL, NULL, 4, 60, 0, 0, 6600, 0, 0, NULL, NULL, 6600, 6600, 1, 2, NULL, NULL, '2022-05-29 21:48:30', '2022-05-29 22:38:34'),
(7, 'pr-noure-300522-004754', 30, NULL, NULL, 1, 1, 0, 0, 100, 0, 0, NULL, NULL, 100, 0, 1, 1, NULL, NULL, '2022-05-29 22:47:54', '2022-05-29 22:47:54');

-- --------------------------------------------------------

--
-- Structure de la table `purchase_product_return`
--

CREATE TABLE `purchase_product_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrateur du système', 'web', 1, '2018-06-01 22:46:44', '2022-01-07 19:39:04'),
(4, 'Vendeur', 'Rôle Vendeur', 'web', 1, '2018-06-01 23:05:27', '2022-01-07 19:38:33'),
(5, 'Client', 'Rôle Client', 'web', 1, '2020-11-05 05:43:16', '2022-01-07 19:38:48');

-- --------------------------------------------------------

--
-- Structure de la table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 4),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(69, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(105, 4),
(106, 1),
(106, 4),
(107, 1),
(107, 4),
(108, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_tel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` int(11) NOT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `livraison` int(11) NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `is_valide` tinyint(1) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'pce', 'Pièce', NULL, '*', 1, 1, '2022-05-11 06:19:23', '2022-05-11 06:19:23');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rib` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `rib`, `bank_name`, `password`, `remember_token`, `phone`, `company_name`, `role_id`, `biller_id`, `warehouse_id`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Tarik', 'tarik', 'boukjij', 'tarik.engineering@gmail.com', '3200009233890588399028340', 'AL BARID BANK', '$2y$10$HPt3Go.HX8PKm/9Tuh2h5uaW3yIVnf5qu9y.aWIv85AVZJbUU0slG', 'cBdHXGE3YoTAUjTPOAvF2ksFz2UAEDQ75bCNo9tJ7bX9sIqSQ9cl3ytU6PSi', '0689385061', 'T@R!K', 1, NULL, NULL, 1, 0, '2018-06-02 02:24:15', '2022-02-02 08:39:11'),
(23, 'Vendeur', 'vendeur', 'vendeur', 'vendeur@yovente.com', '42084724572057208572457', 'ATTIJARI WAFA BANK', '$2y$10$ZpJbd7m8PzYsUguYOjJJzu9oE7YO/Z.9bB2HyVBR5PBew8XCoPBRW', NULL, '0633333333', NULL, 4, NULL, NULL, 1, 0, '2022-01-07 20:35:45', '2022-02-02 08:39:37'),
(24, 'Salma', 'salma', 'boukjijma', 'salma@yovente.com', '', '', '$2y$10$0e2hSyrAl2X1W2XqAdnvUOVGLPK8f8xZmLhT8ItTYdqedqe2VcJbq', NULL, '0611111111', 'Salma Company', 5, NULL, NULL, 0, 1, '2022-01-15 19:13:17', '2022-01-30 18:00:17'),
(25, 'rim', 'rim', 'boukjijm', 'rim@yovente.com', '', '', '$2y$10$u6iuPGz6DHP5EVI0BGWsjOcVYKAQ4jbHTYhrwd/x23RLlrru5qPTK', NULL, '0622222222', 'Rim Company', 5, NULL, NULL, 0, 1, '2022-01-30 17:57:46', '2022-01-30 18:00:03'),
(26, 'Vendeur1', 'vendeur1', 'vendeur1', 'vendeur1@yovente.com', '', '', '$2y$10$Gk1VagRoo0AFv8xsZlOeT.4KEIu6um10ClY89DLokWCA1moANi3D2', NULL, '0688888888', NULL, 4, NULL, NULL, 0, 1, '2022-01-30 20:55:39', '2022-04-05 14:54:45'),
(27, 'faty1', 'faty', 'boukjijf', 'faty1@yovente.com', '', '', '$2y$10$7vuIzRDHIpcCdYGEXwc/beOVE6R9/jdlI79Cj/1Hbf.x.Wy8cnJAO', NULL, '0612121212', NULL, 4, NULL, NULL, 0, 1, '2022-01-31 10:19:52', '2022-04-05 14:54:45'),
(28, 'nejjar', 'fatima ezzahra', 'nejjar', 'nejjar@yovente.com', NULL, NULL, '$2y$10$1vFI/whJVJENEzQFeS/7DekOnRkUK/UuZzGUq0rEHGdIYnBsmm3fy', NULL, '0615914789', NULL, 4, NULL, NULL, 0, 1, '2022-02-09 19:06:27', '2022-02-09 19:06:45'),
(29, 'nejjar', 'fatima ezzahra', 'nejjar', 'nejjar@yovente.com', NULL, NULL, '$2y$10$gN9XZ6W9/fF9I94FQcwVK.sG0tgtoX2F5kp8CA7JMyfFw.uRJUp0K', NULL, '0612345678', NULL, 1, NULL, NULL, 0, 1, '2022-02-09 19:07:20', '2022-04-05 14:54:45'),
(30, 'noure', 'Bougteba', 'Noureddine', 'noure@yovente.com', NULL, NULL, '$2y$10$k1Lv9.BC3ekllPTg2/mmuO3g43RgXDkMu29hpFomgRudsaiuQEWc.', NULL, '0660397499', 'Yovente S.A.R.L', 1, NULL, NULL, 1, 0, '2022-04-05 14:56:19', '2022-04-05 14:56:29'),
(31, 'Yasmin', 'Yasmin', 'Bougteba', 'yasmin@gmail.com', NULL, NULL, '$2y$10$FYRiFZlcbcx1GFZ88QLSt.PS3bMLAHlTo8wfhYNBMptJULWCCcqju', NULL, '0660397499', 'Nour1', 4, NULL, NULL, 1, 0, '2022-04-05 20:48:27', '2022-04-07 19:22:33');

-- --------------------------------------------------------

--
-- Structure de la table `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `variants`
--

INSERT INTO `variants` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'M', '2022-05-11 06:21:39', '2022-05-11 06:21:39'),
(2, 'L', '2022-05-11 06:21:39', '2022-05-11 06:21:39'),
(3, 'XL', '2022-05-11 06:21:39', '2022-05-11 06:21:39'),
(4, 'XXL', '2022-05-11 06:21:40', '2022-05-11 06:21:40');

-- --------------------------------------------------------

--
-- Structure de la table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `withdraw_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_valide` tinyint(1) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pos_setting`
--
ALTER TABLE `pos_setting`
  ADD UNIQUE KEY `pos_setting_id_unique` (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_quotation`
--
ALTER TABLE `product_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT pour la table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT pour la table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `product_quotation`
--
ALTER TABLE `product_quotation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
