-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 06, 2013 at 08:56 AM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myangkorpeople`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arts`
--

CREATE TABLE IF NOT EXISTS `tbl_arts` (
  `art_id` int(100) unsigned NOT NULL,
  `art_name` varchar(100) DEFAULT NULL,
  `art_desc` text,
  `art_refid` int(20) unsigned NOT NULL,
  `art_quote` char(1) DEFAULT NULL,
  `art_lasttransaction` text,
  `art_dimh` double(11,6) DEFAULT NULL,
  `art_diml1` double(11,6) DEFAULT NULL,
  `art_diml2` double(11,6) DEFAULT NULL,
  `st_id` int(100) unsigned NOT NULL,
  `sur_id` int(100) unsigned NOT NULL,
  `tal_id` int(100) unsigned NOT NULL,
  PRIMARY KEY (`art_id`),
  KEY `st_id` (`st_id`),
  KEY `sur_id` (`sur_id`),
  KEY `tal_id` (`tal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_art_entiry`
--

CREATE TABLE IF NOT EXISTS `tbl_art_entiry` (
  `ent_id` int(100) unsigned NOT NULL,
  `tal_name` varchar(200) NOT NULL,
  `ent_name` varchar(200) NOT NULL,
  `ent_desc` text,
  `ent_refid` varchar(200) DEFAULT NULL,
  `ent_quote` varchar(200) DEFAULT NULL,
  `show_id` int(100) unsigned NOT NULL,
  `gal_id` int(100) unsigned NOT NULL,
  `sur_id` int(100) unsigned NOT NULL,
  `gal_price` int(10) DEFAULT NULL,
  PRIMARY KEY (`ent_id`),
  KEY `show_id` (`show_id`),
  KEY `gal_id` (`gal_id`),
  KEY `sur_id` (`sur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assets`
--

CREATE TABLE IF NOT EXISTS `tbl_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `tbl_assets`
--

INSERT INTO `tbl_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 191, 0, 'root.1', 'Root Asset', '{"core.login.site":{"1":1,"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 116, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 117, 118, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 119, 120, 1, 'com_installer', 'com_installer', '{"core.admin":{"1":1},"core.manage":{"1":1,"7":0},"core.delete":{"1":1,"7":0},"core.edit.state":{"1":1,"7":0}}'),
(11, 1, 121, 122, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 123, 124, 1, 'com_login', 'com_login', '{}'),
(13, 1, 125, 126, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 127, 128, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 129, 130, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 131, 132, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 133, 134, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 135, 136, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 137, 140, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 141, 142, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 143, 144, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 145, 146, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 147, 148, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 149, 152, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 153, 158, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 159, 160, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 25, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 138, 139, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 154, 155, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 150, 151, 1, 'com_users.notes.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 161, 162, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 163, 164, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 165, 166, 1, 'com_gantry', 'gantry', '{}'),
(36, 1, 167, 168, 1, 'com_rokcandy.category.8', 'Basic', ''),
(37, 1, 169, 170, 1, 'com_rokcandy.category.9', 'Typography', ''),
(38, 1, 171, 172, 1, 'com_rokcandy.category.10', 'Uncategorised', ''),
(39, 1, 173, 174, 1, 'com_rokcandy', 'rokcandy', '{}'),
(41, 1, 175, 176, 1, 'com_roksprocket', 'roksprocket', '{}'),
(42, 8, 26, 49, 2, 'com_content.category.11', 'Demo Articles', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(43, 42, 27, 28, 3, 'com_content.article.1', 'Template Features', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 42, 29, 30, 3, 'com_content.article.2', 'Module Positions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 42, 31, 32, 3, 'com_content.article.3', 'Module Variations', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 42, 33, 34, 3, 'com_content.article.4', 'Template Typography', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 42, 35, 36, 3, 'com_content.article.5', 'Menu Options', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 42, 37, 38, 3, 'com_content.article.6', 'Integrated Extensions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 42, 39, 40, 3, 'com_content.article.7', 'Tutorials and Guides', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 42, 41, 42, 3, 'com_content.article.8', 'Installation Instructions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 42, 43, 44, 3, 'com_content.article.9', 'Logo Editing', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 42, 45, 46, 3, 'com_content.article.10', 'Preset Styles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 42, 47, 48, 3, 'com_content.article.11', 'About Joomla!', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 8, 50, 71, 2, 'com_content.category.12', 'Sample Content', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(55, 54, 51, 52, 3, 'com_content.article.12', 'Donec Nunc Magna Posuere', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(56, 54, 53, 54, 3, 'com_content.article.13', 'Lorem Ipsum Dolor Sit Amet', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(57, 54, 55, 56, 3, 'com_content.article.14', 'Vestibulum Dapibus Est Nulla', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(58, 54, 57, 58, 3, 'com_content.article.15', 'Nec Libero Laoreet Faucibus', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(59, 54, 59, 60, 3, 'com_content.article.16', 'Sed Imperdiet Ligula Nisi', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(60, 54, 61, 62, 3, 'com_content.article.17', 'Massa Diam Tristique Urna', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(61, 54, 63, 64, 3, 'com_content.article.18', 'Sapien Eros Consetur Dolor', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(62, 54, 65, 66, 3, 'com_content.article.19', 'Maecenas Varius Neque Nec', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(63, 25, 156, 157, 2, 'com_weblinks.category.13', 'RocketTheme', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(64, 8, 72, 97, 2, 'com_content.category.14', 'RokSprocket Mosaic', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(65, 8, 98, 107, 2, 'com_content.category.15', 'RokSprocket Tabs', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(66, 8, 108, 115, 2, 'com_content.category.16', 'RokSprocket Lists', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(67, 64, 73, 74, 3, 'com_content.article.20', 'Music', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(68, 27, 21, 22, 3, 'com_content.article.21', 'Framework', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(69, 64, 75, 76, 3, 'com_content.article.22', 'Site Speed', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(70, 64, 77, 78, 3, 'com_content.article.23', 'Presets', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(71, 64, 79, 80, 3, 'com_content.article.24', 'Menus', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(72, 64, 81, 82, 3, 'com_content.article.25', 'K2 Styling', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(73, 64, 83, 84, 3, 'com_content.article.26', '78 Positions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(74, 64, 85, 86, 3, 'com_content.article.27', 'Logo Picker', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(75, 64, 87, 88, 3, 'com_content.article.28', 'RokSprocket', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(76, 64, 89, 90, 3, 'com_content.article.29', 'Suffixes', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(77, 64, 91, 92, 3, 'com_content.article.30', 'Search', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(78, 64, 93, 94, 3, 'com_content.article.31', 'Extensions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(79, 65, 99, 100, 3, 'com_content.article.32', 'Featured', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(80, 65, 101, 102, 3, 'com_content.article.33', 'Popular', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(81, 65, 103, 104, 3, 'com_content.article.34', 'Latest', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(82, 65, 105, 106, 3, 'com_content.article.35', 'Random', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(83, 66, 109, 110, 3, 'com_content.article.36', 'How to Install', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(84, 66, 111, 112, 3, 'com_content.article.37', 'Editing the Logo', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(85, 66, 113, 114, 3, 'com_content.article.38', 'Demo Replication', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(88, 1, 177, 178, 1, 'com_socialloginandsocialshare', 'socialloginandsocialshare', '{}'),
(89, 1, 179, 180, 1, 'com_rokgallery', 'rokgallery', '{}'),
(90, 54, 67, 68, 3, 'com_content.article.39', 'About Us', '{"core.delete":{"6":1,"7":1,"3":1},"core.edit":{"6":1,"7":1,"3":1,"4":1},"core.edit.state":{"6":1,"7":1,"3":1,"5":1}}'),
(91, 1, 181, 182, 1, 'com_k2', 'com_k2', '{}'),
(92, 1, 183, 184, 1, 'com_rokmodule', 'rokmodule', '{}'),
(93, 54, 69, 70, 3, 'com_content.article.40', 'calender', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(94, 27, 19, 20, 3, 'com_content.article.41', 'talent', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(95, 1, 185, 186, 1, 'com_fwgallery', 'fwgallery', '{}'),
(96, 27, 23, 24, 3, 'com_content.article.42', 'Video', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(97, 1, 187, 190, 1, 'com_jevents', 'jevents', '{"core.manage":[],"core.create":[],"core.edit.own":[],"core.edit":[],"core.edit.state":[],"core.deleteall":[],"core.admin":[]}'),
(98, 97, 188, 189, 2, 'com_jevents.category.17', 'DEFAULT', '{"core.create":[],"core.edit":[],"core.edit.state":[],"core.deleteall":[],"core.edit.own":[]}'),
(99, 64, 95, 96, 3, 'com_content.article.43', 'News Feed ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_associations`
--

CREATE TABLE IF NOT EXISTS `tbl_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banners`
--

CREATE TABLE IF NOT EXISTS `tbl_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner_clients`
--

CREATE TABLE IF NOT EXISTS `tbl_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `tbl_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE IF NOT EXISTS `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 33, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 97, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 97, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 97, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 97, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 97, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 97, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users.notes', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 97, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(8, 36, 1, 13, 14, 1, 'basic', 'com_rokcandy', 'Basic', 'basic', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 97, '2012-10-08 13:06:35', 0, '0000-00-00 00:00:00', 0, ''),
(9, 37, 1, 15, 16, 1, 'typography', 'com_rokcandy', 'Typography', 'typography', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 97, '2012-10-08 13:06:35', 0, '0000-00-00 00:00:00', 0, ''),
(10, 38, 1, 17, 18, 1, 'uncategorised', 'com_rokcandy', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 97, '2012-10-08 13:06:35', 0, '0000-00-00 00:00:00', 0, ''),
(11, 42, 1, 19, 20, 1, 'demo-articles', 'com_content', 'Demo Articles', 'demo-articles', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 97, '2012-10-08 13:11:44', 257, '2012-10-08 13:13:53', 0, '*'),
(12, 54, 1, 21, 22, 1, 'sample-content', 'com_content', 'Sample Content', 'sample-content', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 97, '2012-10-08 13:58:00', 0, '0000-00-00 00:00:00', 0, '*'),
(13, 63, 1, 23, 24, 1, 'rockettheme', 'com_weblinks', 'RocketTheme', 'rockettheme', '', '<div class="rt-image rt-floatleft">\r\n    <img class="rt-noborder" alt="RocketTheme WebLinks" src="images/rocketlauncher/weblinks/rockettheme.png" />\r\n</div>\r\n\r\n<p>RocketTheme provides Premium Professional Themes and Templates for OpenSource Platforms: Joomla, Wordpress, phpBB3, Magento &amp; More</p>\r\n\r\n<p>The RocketTheme Template Club features exclusive access to professional templates to help transform your site &amp; set you apart from the competition.</p>\r\n\r\n<div class="clear"></div>', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 97, '2012-10-08 14:02:56', 0, '0000-00-00 00:00:00', 0, '*'),
(14, 64, 1, 25, 26, 1, 'roksprocket-mosaic', 'com_content', 'RokSprocket Mosaic', 'roksprocket-mosaic', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 97, '2012-10-12 14:15:14', 0, '0000-00-00 00:00:00', 0, '*'),
(15, 65, 1, 27, 28, 1, 'roksprocket-tabs', 'com_content', 'RokSprocket Tabs', 'roksprocket-tabs', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 97, '2012-10-12 14:15:24', 0, '0000-00-00 00:00:00', 0, '*'),
(16, 66, 1, 29, 30, 1, 'roksprocket-lists', 'com_content', 'RokSprocket Lists', 'roksprocket-lists', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 97, '2012-10-12 14:15:32', 0, '0000-00-00 00:00:00', 0, '*'),
(17, 98, 1, 31, 32, 1, 'default', 'com_jevents', 'DEFAULT', 'default', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","catcolour":"#6633FF","overlaps":"0","admin":"0"}', '', '', '{"author":"","robots":""}', 97, '2013-05-09 08:32:33', 97, '2013-06-03 06:29:09', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact_details`
--

CREATE TABLE IF NOT EXISTS `tbl_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content`
--

CREATE TABLE IF NOT EXISTS `tbl_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `tbl_content`
--

INSERT INTO `tbl_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 43, 'Template Features', 'template-features', '', '                                                                         <div class="rt-center">\n  <span class="promo3">The next generation layout and structure compliments the beautiful and intricate design of the template in conjunction with its many features and integrated extensions</span>\n</div>\n\n<br />\n\n<div class="rt-image rt-center largemargintop largemarginbottom">\n  <img class="rt-noborder" src="images/rocketlauncher/features/features-template-preview.png" alt="image" />\n</div>\n\n<br />\n\n<div class="rt-center largemargintop largemarginbottom">\n  <span class="promo2">Inside <strong>Metropolis</strong> Template</span><br />\n  <span class="promo3">Everything You Need to Build Your Stunning Website</span>\n</div>\n\n<br />\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-1.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117" target="_blank"><span>Preset Styles</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-2.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=2&amp;Itemid=109" target="_blank"><span>Modules Position</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-3.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=3&amp;Itemid=110" target="_blank"><span>Module Variations</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-4.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=5&amp;Itemid=112" target="_blank"><span>Dropdown Menu</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-5.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=4&amp;Itemid=111" target="_blank"><span>Typography</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-6.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113" target="_blank"><span>Integrated Extensions</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-7.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=9&amp;Itemid=116" target="_blank"><span>Logo Picker</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-8.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113" target="_blank"><span>K2 (3rd Party)</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-33 gantry-width-block rt-center">\n  <div class="gantry-width-spacer">\n    <div class="rt-image">\n      <img src="images/rocketlauncher/features/feature-9.jpg" alt="image" />\n      <h3><a href="index.php?option=com_content&amp;view=article&amp;id=11&amp;Itemid=118" target="_blank"><span>Joomla Stuff</span></a></h3>\n    </div>\n  </div>\n</div>\n\n<div class="clear"></div><br />\n\n<div class="rt-center largemargintop largemarginbottom">\n  <span class="promo2"><strong>Gantry 4</strong> Framework</span><br />\n  <span class="promo3">Powerful Framework that Makes Building Websites Easier</span>\n</div>\n\n<br />\n\n<div class="gantry-width-25 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <ul class="list-icon info largemargintop">\n      <li class="largemarginbottom"><strong>Compact Grid System</strong><br />CSS grid framework to construct content by providing commonly used dimensions</li>\n      <li class="largemarginbottom hidden-tablet"><strong>Stunning Admin UI</strong><br />Gantry provides a uniquely intuitive interface to control all aspects of the design</li>\n        <li class="largemarginbottom hidden-tablet"><strong>Integrated Features</strong><br />Many built-in features such as font-sizer, Google Analytics, Date, etc</li>\n    </ul>\n  </div>\n</div>\n\n<div class="gantry-width-50 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <div class="rt-image rt-center">\n      <img class="rt-noborder" src="images/rocketlauncher/features/feature-admin-panel.png" alt="image" />\n    </div>\n  </div>\n</div>\n\n<div class="gantry-width-25 gantry-width-block">\n  <div class="gantry-width-spacer">\n      <ul class="list-icon info largemargintop">\n        <li class="largemarginbottom"><strong>Source-Ordered Layout</strong><br />With up to 3 total sidebars, you can achieve highly complex mainbody layout scenarios</li>\n        <li class="largemarginbottom hidden-tablet"><strong>Grid RTL Support</strong><br />Built in RTL support which will automatically order the layout to support RTL</li>\n        <li class="largemarginbottom hidden-tablet"><strong>Multi-Page Configuration</strong><br />Assign different template configurations for one or several menu items/pages</li>\n      </ul>\n  </div>\n</div>\n\n<div class="clear"></div><br />\n\n<div class="rt-center largemargintop largemarginbottom">\n  <span class="promo2"><strong>Interested</strong>? Want to try <strong>Metropolis</strong>?</span><br />\n  <a class="readon promo1 medmargintop" href="http://www.rockettheme.com/joomla-templates/metropolis" target="_blank"><span><span class="icon-download-alt largepaddingtop"></span> <span>Download</span></span></a>\n</div>\n\n<div class="clear"></div><br />', '', 1, 0, 0, 11, '2012-10-08 13:16:57', 97, '', '2012-11-01 14:00:24', 632, 0, '0000-00-00 00:00:00', '2012-10-08 13:16:57', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 11, '', '', 1, 216, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 44, 'Module Positions', 'module-positions', '', '<p class="info">If no modules are published to a position, the entire area or row will not appear/collapse.</p>\r\n\r\n<div class="rt-image">\r\n  <img src="images/rocketlauncher/module-positions/positions-diagram.jpg" alt="Module Positions" />\r\n</div>\r\n\r\n<div class="clear largemarginbottom">&nbsp;</div>\r\n\r\n<div class="rt-center medpaddingtop smallpaddingbottom"><a class="readon"  href="http://www.gantry-framework.org/documentation/joomla/configure/layouts"><span>Documentation: Gantry Framework Layouts</span></a></div>', '', 1, 0, 0, 11, '2012-10-08 13:17:21', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 13:17:21', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 10, '', '', 1, 69, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 45, 'Module Variations', 'module-variations', '', '<p class="nomarginbottom">There are <strong>10 stylistic module class suffixes</strong>, these add a unique style variation to the module: <strong>box1-6</strong> and <strong>title1-4</strong>; and 25 structural suffixes, these affect the layout and metrics of the module.</p>', '', 1, 0, 0, 11, '2012-10-08 13:17:37', 97, '', '2012-10-31 18:02:43', 632, 0, '0000-00-00 00:00:00', '2012-10-08 13:17:37', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 9, '', '', 1, 113, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `tbl_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(4, 46, 'Template Typography', 'template-typography', '', '<!-- Typography\r\n================================================== -->\r\n<section id="typography">\r\n  <div class="page-header">\r\n    <h1>Typography</h1>\r\n  </div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h2 id="headings">Headings</h2>\r\n  <p>All HTML headings, <code>&lt;h1&gt;</code> through <code>&lt;h6&gt;</code> are available.</p>\r\n  <div class="gantry-example">\r\n    <h1>h1. Heading 1</h1>\r\n    <h2>h2. Heading 2</h2>\r\n    <h3>h3. Heading 3</h3>\r\n    <h4>h4. Heading 4</h4>\r\n    <h5>h5. Heading 5</h5>\r\n    <h6>h6. Heading 6</h6>\r\n  </div>\r\n\r\n  <h3>Built with Less</h3>\r\n  <p>The typographic scale is based on two LESS variables in <strong>variables.less</strong>: <code>@baseFontSize</code> and <code>@baseLineHeight</code>. The first is the base font-size used throughout and the second is the base line-height. We use those variables and some simple math to create the margins, paddings, and line-heights of all our type and more. Customize them and Bootstrap adapts.</p>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h2 id="body-copy">Body copy</h2>\r\n  <p>Bootstrap''s global default <code>font-size</code> is <strong>14px</strong>, with a <code>line-height</code> of <strong>1.7em</strong>. This is applied to the <code>&lt;body&gt;</code> and all paragraphs. In addition, <code>&lt;p&gt;</code> (paragraphs) receive a bottom margin of half their line-height (9px by default).</p>\r\n  <div class="gantry-example">\r\n    <p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>\r\n  </div>\r\n  <pre class="prettyprint">&lt;p&gt;...&lt;/p&gt;</pre>\r\n\r\n  <h3>Lead body copy</h3>\r\n  <p>Make a paragraph stand out by adding <code>.lead</code>.</p>\r\n  <div class="gantry-example">\r\n    <p class="lead">Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus.</p>\r\n  </div>\r\n  <pre class="prettyprint">&lt;p class=&quot;lead&quot;&gt;...&lt;/p&gt;</pre>\r\n\r\n\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n\r\n  <h2 id="emphasis">Emphasis</h2>\r\n  <span>Make use of HTML''s default emphasis tags with lightweight styles.</span><br />\r\n\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h4><code>&lt;em&gt;</code></h4>\r\n  <p>For emphasizing a snippet of text with <em>stress</em></p>\r\n  <div class="gantry-example">\r\n    <p>The following snippet of text is <em>rendered as italicized text</em>.</p>\r\n  </div>\r\n  <pre class="prettyprint">&lt;em&gt;rendered as italicized text&lt;/em&gt;</pre>\r\n\r\n  <h4><code>&lt;strong&gt;</code></h4>\r\n  <p>For emphasizing a snippet of text with <strong>important</strong></p>\r\n  <div class="gantry-example">\r\n    <p>The following snippet of text is <strong>rendered as bold text</strong>.</p>\r\n  </div>\r\n  <pre class="prettyprint">&lt;strong&gt;rendered as bold text&lt;/strong&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h4><code>&lt;small&gt;</code></h4>\r\n  <p>For de-emphasizing inline or blocks of text, <small>use the small tag.</small></p>\r\n  <div class="gantry-example">\r\n    <p><small>This line of text is meant to be treated as fine print.</small></p>\r\n  </div>\r\n<pre class="prettyprint">&lt;p&gt;\r\n  &lt;small&gt;This line of text is meant to be treated as fine print.&lt;/small&gt;\r\n&lt;/p&gt;</pre><br />\r\n\r\n  <p><strong>Note:</strong> Feel free to use <code>&lt;b&gt;</code> and <code>&lt;i&gt;</code> in HTML5. <code>&lt;b&gt;</code> is meant to highlight words or phrases without conveying additional importance while <code>&lt;i&gt;</code> is mostly for voice, technical terms, etc.</p>\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<h3>Notice Styles</h3>\r\n\r\n<p>Use the <code>&lt;p&gt;</code> tag with <code>.success</code>, <code>.warning</code>, <code>.info</code> or <code>.error</code> classes.</p>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n<div class="gantry-example"><p class="success">Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p></div>\r\n<pre class="prettyprint">&lt;p class=&quot;success&quot;&gt;...&lt;/p&gt;</pre>\r\n\r\n<div class="gantry-example"><p class="info">Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p></div>\r\n<pre class="prettyprint">&lt;p class=&quot;info&quot;&gt;...&lt;/p&gt;</pre>\r\n</div></div>    \r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n<div class="gantry-example"><p class="warning">Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p></div>\r\n<pre class="prettyprint">&lt;p class=&quot;warning&quot;&gt;...&lt;/p&gt;</pre>\r\n\r\n<div class="gantry-example"><p class="error">Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p></div>\r\n<pre class="prettyprint">&lt;p class=&quot;error&quot;&gt;...&lt;/p&gt;</pre>\r\n</div></div>\r\n\r\n<div class="clear"></div>\r\n\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left" style="float: none;">\r\n  <h2 id="abbreviations">Abbreviations</h2>\r\n  <p>Stylized implementation of HTML''s <code>&lt;abbr&gt;</code> element for abbreviations and acronyms to show the expanded version on hover. Abbreviations with a <code>title</code> attribute have a light dotted bottom border and a help cursor on hover, providing additional context on hover.</p>\r\n\r\n  <h4><code>&lt;abbr&gt;</code></h4>\r\n  <p>For expanded text on long hover of an abbreviation, include the <code>title</code> attribute.</p>\r\n  <div class="gantry-example">\r\n    <p>An abbreviation of the word attribute is <abbr title="attribute">attr</abbr>.</p>\r\n  </div>\r\n  <pre class="prettyprint">&lt;abbr title=&quot;attribute&quot;&gt;attr&lt;/abbr&gt;</pre>\r\n\r\n  <h4><code>&lt;abbr class="initialism"&gt;</code></h4>\r\n  <p>Add <code>.initialism</code> to an abbreviation for a slightly smaller font-size.</p>\r\n  <div class="gantry-example">\r\n    <p><abbr title="HyperText Markup Language" class="initialism">HTML</abbr> is the best thing since sliced bread.</p>\r\n  </div>\r\n  <pre class="prettyprint">&lt;abbr title=&quot;attribute&quot; class=&quot;initialism&quot;&gt;attr&lt;/abbr&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h2 id="addresses">Addresses</h2>\r\n  <p>Present contact information for the nearest ancestor or the entire body of work.</p>\r\n\r\n  <h4><code>&lt;address&gt;</code></h4>\r\n  <p>Preserve formatting by ending all lines with <code>&lt;br&gt;</code>.</p>\r\n  <div class="gantry-example">\r\n    <address>\r\n      <strong>Twitter, Inc.</strong><br>\r\n      795 Folsom Ave, Suite 600<br>\r\n      San Francisco, CA 94107<br>\r\n      <abbr title="Phone">P:</abbr> (123) 456-7890\r\n    </address>\r\n    <address>\r\n      <strong>Full Name</strong><br>\r\n      <a href="mailto:#">first.last@gmail.com</a>\r\n    </address>\r\n  </div>\r\n<pre class="prettyprint linenums">\r\n&lt;address&gt;\r\n  &lt;strong&gt;Twitter, Inc.&lt;/strong&gt;&lt;br&gt;\r\n  795 Folsom Ave, Suite 600&lt;br&gt;\r\n  San Francisco, CA 94107&lt;br&gt;\r\n  &lt;abbr title=&quot;Phone&quot;&gt;P:&lt;/abbr&gt; (123) 456-7890\r\n&lt;/address&gt;\r\n&lt;address&gt;\r\n  &lt;strong&gt;Full Name&lt;/strong&gt;&lt;br&gt;\r\n  &lt;a href=&quot;mailto:#&quot;&gt;first.last&#64;gmail.com&lt;/a&gt;\r\n&lt;/address&gt;\r\n</pre>\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n\r\n  <h2 id="blockquotes">Blockquotes</h2>\r\n  <p>For quoting blocks of content from another source within your document.</p>\r\n\r\n  <h3>Default blockqoute</h3>\r\n  <p>Wrap <code>&lt;blockquote&gt;</code> around any <abbr title="HyperText Markup Language">HTML</abbr> as the quote. For straight quotes we recommend a <code>&lt;p&gt;</code>.</p>\r\n  <div class="gantry-example">\r\n    <blockquote>\r\n      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n    </blockquote>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;blockquote&gt;\r\n  &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n&lt;/blockquote&gt;</pre>\r\n\r\n  <h3>Blockquote options</h3>\r\n  <span>Style and content changes for simple variations on a standard blockquote.</span><br />\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h4>Naming a source</h4>\r\n  <p>Add <code>&lt;small&gt;</code> tag for identifying the source. Wrap the name of the source work in <code>&lt;cite&gt;</code>.</p>\r\n  <div class="gantry-example">\r\n    <blockquote>\r\n      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n      <small>Someone famous in <cite title="Source Title">Source Title</cite></small>\r\n    </blockquote>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;blockquote&gt;\r\n  &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;\r\n  &lt;small&gt;Someone famous &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;&lt;/small&gt;\r\n&lt;/blockquote&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h4>Alternate displays</h4>\r\n  <p>Use <code>.pull-right</code> for a floated, right-aligned blockquote.</p>\r\n  <div class="gantry-example" style="overflow: hidden;">\r\n    <blockquote class="pull-right">\r\n      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>\r\n      <small>Someone famous in <cite title="Source Title">Source Title</cite></small>\r\n    </blockquote>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;blockquote class=&quot;pull-right&quot;&gt;\r\n  ...\r\n&lt;/blockquote&gt;</pre>\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n\r\n  <!-- Lists -->\r\n  <h2 id="lists">Lists</h2>\r\n\r\n<div class="gantry-width-block gantry-width-33">\r\n<div class="gantry-left">\r\n  <h3>Unordered</h3>\r\n  <p>A list of items in which the order does <em>not</em> explicitly matter.</p>\r\n  <div class="gantry-example">\r\n    <ul>\r\n      <li>Lorem ipsum dolor sit amet</li>\r\n      <li>Nulla volutpat aliquam velit\r\n        <ul>\r\n          <li>Phasellus iaculis neque</li>\r\n          <li>Purus sodales ultricies</li>\r\n          <li>Vestibulum laoreet porttitor sem</li>\r\n          <li>Ac tristique libero volutpat at</li>\r\n        </ul>\r\n      </li>\r\n      <li>Faucibus porta lacus fringilla vel</li>\r\n      <li>Eget porttitor lorem</li>\r\n    </ul>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;ul&gt;\r\n  &lt;li&gt;...&lt;/li&gt;\r\n&lt;/ul&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-33">\r\n<div class="gantry-left">\r\n  <h3>Ordered</h3>\r\n  <p>A list of items in which the order <em>does</em> explicitly matter.</p>\r\n  <div class="gantry-example">\r\n    <ol>\r\n      <li>Lorem ipsum dolor sit amet</li>\r\n      <li>Consectetur adipiscing elit</li>\r\n      <li>Integer molestie lorem at massa</li>\r\n      <li>Facilisis in pretium nisl aliquet</li>\r\n      <li>Nulla volutpat aliquam velit</li>\r\n      <li>Faucibus porta lacus fringilla vel</li>\r\n      <li>Aenean sit amet erat nunc</li>\r\n      <li>Eget porttitor lorem</li>\r\n    </ol>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;ol&gt;\r\n  &lt;li&gt;...&lt;/li&gt;\r\n&lt;/ol&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-33">\r\n<div class="gantry-left">\r\n<h3>Unstyled</h3>\r\n<p>A list of items with no <code>list-style</code> or additional left padding.</p>\r\n<div class="gantry-example">\r\n  <ul class="unstyled">\r\n      <li>Lorem ipsum dolor sit amet</li>\r\n      <li>Nulla volutpat aliquam velit\r\n        <ul>\r\n          <li>Phasellus iaculis neque</li>\r\n          <li>Purus sodales ultricies</li>\r\n          <li>Vestibulum laoreet porttitor sem</li>\r\n          <li>Ac tristique libero volutpat at</li>\r\n        </ul>\r\n      </li>\r\n      <li>Faucibus porta lacus fringilla vel</li>\r\n      <li>Eget porttitor lorem</li>\r\n  </ul>\r\n</div>\r\n<pre class="prettyprint linenums">&lt;ul class=&quot;unstyled&quot;&gt;\r\n  &lt;li&gt;...&lt;/li&gt;\r\n&lt;/ul&gt;</pre>\r\n</div></div>\r\n\r\n<div class="clear"></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n<h3>Description</h3>\r\n<p>A list of terms with their associated descriptions.</p>\r\n<div class="gantry-example">\r\n  <dl>\r\n    <dt>Description lists</dt>\r\n    <dd>A description list is perfect for defining terms.</dd>\r\n    <dt>Euismod</dt>\r\n    <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>\r\n    <dd>Donec id elit non mi porta gravida at eget metus.</dd>\r\n    <dt>Malesuada porta</dt>\r\n    <dd>Etiam porta sem malesuada magna mollis euismod.</dd>\r\n  </dl>\r\n</div>\r\n<pre class="prettyprint linenums">&lt;dl&gt;\r\n  &lt;dt&gt;...&lt;/dt&gt;\r\n  &lt;dd&gt;...&lt;/dd&gt;\r\n&lt;/dl&gt;</pre><br />\r\n<p>\r\n  <strong>Note:</strong>\r\n  Horizontal description lists will truncate terms that are too long to fit in the left column fix <code>text-overflow</code>. In narrower viewports, they will change to the default stacked layout.\r\n</p>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n<h3>Horizontal description</h3>\r\n<p>Make terms and descriptions in <code>&lt;dl&gt;</code> line up side-by-side.</p>\r\n<div class="gantry-example">\r\n  <dl class="dl-horizontal">\r\n    <dt>Description lists</dt>\r\n    <dd>A description list is perfect for defining terms.</dd>\r\n    <dt>Euismod</dt>\r\n    <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>\r\n    <dd>Donec id elit non mi porta gravida at eget metus.</dd>\r\n    <dt>Malesuada porta</dt>\r\n    <dd>Etiam porta sem malesuada magna mollis euismod.</dd>\r\n    <dt>Felis euismod semper eget lacinia</dt>\r\n    <dd>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>\r\n  </dl>\r\n</div>\r\n<pre class="prettyprint linenums">&lt;dl class=&quot;dl-horizontal&quot;&gt;\r\n  &lt;dt&gt;...&lt;/dt&gt;\r\n  &lt;dd&gt;...&lt;/dd&gt;\r\n&lt;/dl&gt;</pre>\r\n</div></div>\r\n<div class="clear"></div>\r\n</section>\r\n\r\n\r\n\r\n<!-- Code\r\n================================================== -->\r\n<section id="code">\r\n  <div class="page-header">\r\n    <h1>Code</h1>\r\n  </div>\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h2>Inline</h2>\r\n  <p>Wrap inline snippets of code with <code>&lt;code&gt;</code>.</p>\r\n<div class="gantry-example">\r\nFor example, <code>&lt;section&gt;</code> should be wrapped as inline.\r\n</div>\r\n<pre class="prettyprint linenums">For example, &lt;code&gt;&lt;section&gt;&lt;/code&gt; should be wrapped as inline.</pre>\r\n<p><strong>Note:</strong> Be sure to keep code within <code>&lt;pre&gt;</code> tags as close to the left as possible; it will render all tabs.</p>\r\n<p>You may optionally add the <code>.pre-scrollable</code> class which will set a max-height of 350px and provide a y-axis scrollbar.</p>\r\n\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h2>Basic block</h2>\r\n  <p>Use <code>&lt;pre&gt;</code> for multiple lines of code. Be sure to escape any angle brackets in the code for proper rendering.</p>\r\n<div class="gantry-example">\r\n<pre>&lt;p&gt;Sample text here...&lt;/p&gt;</pre>\r\n</div>\r\n<pre class="prettyprint linenums" style="margin-bottom: 9px;">&lt;pre&gt;\r\n  &amp;lt;p&amp;gt;Sample text here...&amp;lt;/p&amp;gt;\r\n&lt;/pre&gt;</pre>\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<h2>Prettify</h2>\r\n<p>To add colored syntax highlight to the <code>&lt;pre&gt;</code> tag, then use the <code>.prettyprint</code> class or the <code>.prettyprint linenums</code> class.</p>\r\n\r\n<div class="gantry-example">\r\n<pre class="prettyprint linenums">&lt;?php /** Begin Debug **/ if ($gantry-&gt;countModules(&#x27;debug&#x27;)) : ?&gt;\r\n	&lt;div id=&quot;rt-debug&quot;&gt;\r\n		&lt;div class=&quot;rt-container&quot;&gt;\r\n			&lt;?php echo $gantry-&gt;displayModules(&#x27;debug&#x27;,&#x27;standard&#x27;,&#x27;standard&#x27;); ?&gt;\r\n			&lt;div class=&quot;clear&quot;&gt;&lt;/div&gt;\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;\r\n	&lt;?php /** End Debug **/ endif; ?&gt;</pre>\r\n</div>\r\n<pre class="prettyprint linenums">&lt;pre class=&quot;prettyprint linenums&quot;&gt;&lt;?php /** Begin Debug **/ if ($gantry-&gt;countModules(&#x27;debug&#x27;)) : ?&gt;\r\n	&lt;div id=&quot;rt-debug&quot;&gt;\r\n		&lt;div class=&quot;rt-container&quot;&gt;\r\n			&lt;?php echo $gantry-&gt;displayModules(&#x27;debug&#x27;,&#x27;standard&#x27;,&#x27;standard&#x27;); ?&gt;\r\n			&lt;div class=&quot;clear&quot;&gt;&lt;/div&gt;\r\n		&lt;/div&gt;\r\n	&lt;/div&gt;\r\n	&lt;?php /** End Debug **/ endif; ?&gt;&lt;/pre&gt;</pre>\r\n</section>\r\n\r\n\r\n\r\n<!-- Tables\r\n================================================== -->\r\n<section id="tables">\r\n  <div class="page-header">\r\n    <h1>Tables</h1>\r\n  </div>\r\n\r\n  <h2>Default styles</h2>\r\n  <p>For basic styling—light padding and only horizontal dividers—add the base class <code>.table</code> to any <code>&lt;table&gt;</code>.</p>\r\n  <div class="gantry-example">\r\n    <table class="table">\r\n      <thead>\r\n        <tr>\r\n          <th>#</th>\r\n          <th>First Name</th>\r\n          <th>Last Name</th>\r\n          <th>Username</th>\r\n        </tr>\r\n      </thead>\r\n      <tbody>\r\n        <tr>\r\n          <td>1</td>\r\n          <td>Mark</td>\r\n          <td>Otto</td>\r\n          <td>@mdo</td>\r\n        </tr>\r\n        <tr>\r\n          <td>2</td>\r\n          <td>Jacob</td>\r\n          <td>Thornton</td>\r\n          <td>@fat</td>\r\n        </tr>\r\n        <tr>\r\n          <td>3</td>\r\n          <td>Larry</td>\r\n          <td>the Bird</td>\r\n          <td>@twitter</td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;table class=&quot;table&quot;&gt;\r\n  &hellip;\r\n&lt;/table&gt;</pre>\r\n\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n  <h2>Optional classes</h2>\r\n  <span>Add any of the follow classes to the <code>.table</code> base class.</span><br />\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h4><code>.table-striped</code></h4>\r\n  <p>Adds zebra-striping to any table row within the <code>&lt;tbody&gt;</code> via the <code>:nth-child</code> CSS selector (not available in IE7-IE8).</p>\r\n  <div class="gantry-example">\r\n    <table class="table table-striped">\r\n      <thead>\r\n        <tr>\r\n          <th>#</th>\r\n          <th>First Name</th>\r\n          <th>Last Name</th>\r\n          <th>Username</th>\r\n        </tr>\r\n      </thead>\r\n      <tbody>\r\n        <tr>\r\n          <td>1</td>\r\n          <td>Mark</td>\r\n          <td>Otto</td>\r\n          <td>@mdo</td>\r\n        </tr>\r\n        <tr>\r\n          <td>2</td>\r\n          <td>Jacob</td>\r\n          <td>Thornton</td>\r\n          <td>@fat</td>\r\n        </tr>\r\n        <tr>\r\n          <td>3</td>\r\n          <td>Larry</td>\r\n          <td>the Bird</td>\r\n          <td>@twitter</td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n<pre class="prettyprint linenums" style="margin-bottom: 18px;">&lt;table class=&quot;table table-striped&quot;&gt;\r\n  &hellip;\r\n&lt;/table&gt;</pre>\r\n  <h4><code>.table-hover</code></h4>\r\n  <p>Enable a hover state on table rows within a <code>&lt;tbody&gt;</code>.</p>\r\n  <div class="gantry-example">\r\n    <table class="table table-hover">\r\n      <thead>\r\n        <tr>\r\n          <th>#</th>\r\n          <th>First Name</th>\r\n          <th>Last Name</th>\r\n          <th>Username</th>\r\n        </tr>\r\n      </thead>\r\n      <tbody>\r\n        <tr>\r\n          <td>1</td>\r\n          <td>Mark</td>\r\n          <td>Otto</td>\r\n          <td>@mdo</td>\r\n        </tr>\r\n        <tr>\r\n          <td>2</td>\r\n          <td>Jacob</td>\r\n          <td>Thornton</td>\r\n          <td>@fat</td>\r\n        </tr>\r\n        <tr>\r\n          <td>3</td>\r\n          <td colspan="2">Larry the Bird</td>\r\n          <td>@twitter</td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n<pre class="prettyprint linenums" style="margin-bottom: 18px;">&lt;table class=&quot;table table-hover&quot;&gt;\r\n  &hellip;\r\n&lt;/table&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right" style="float: none;">\r\n  <h4><code>.table-bordered</code></h4>\r\n  <p>Add borders and rounded corners to the table.</p>\r\n  <div class="gantry-example">\r\n    <table class="table table-bordered">\r\n      <thead>\r\n        <tr>\r\n          <th>#</th>\r\n          <th>First Name</th>\r\n          <th>Last Name</th>\r\n          <th>Username</th>\r\n        </tr>\r\n      </thead>\r\n      <tbody>\r\n        <tr>\r\n          <td rowspan="2">1</td>\r\n          <td>Mark</td>\r\n          <td>Otto</td>\r\n          <td>@mdo</td>\r\n        </tr>\r\n        <tr>\r\n          <td>Mark</td>\r\n          <td>Otto</td>\r\n          <td>@TwBootstrap</td>\r\n        </tr>\r\n        <tr>\r\n          <td>2</td>\r\n          <td>Jacob</td>\r\n          <td>Thornton</td>\r\n          <td>@fat</td>\r\n        </tr>\r\n        <tr>\r\n          <td>3</td>\r\n          <td colspan="2">Larry the Bird</td>\r\n          <td>@twitter</td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;table class=&quot;table table-bordered&quot;&gt;\r\n  &hellip;\r\n&lt;/table&gt;</pre>\r\n  <h4><code>.table-condensed</code></h4>\r\n  <p>Makes tables more compact by cutting cell padding in half.</p>\r\n  <div class="gantry-example">\r\n    <table class="table table-condensed">\r\n      <thead>\r\n        <tr>\r\n          <th>#</th>\r\n          <th>First Name</th>\r\n          <th>Last Name</th>\r\n          <th>Username</th>\r\n        </tr>\r\n      </thead>\r\n      <tbody>\r\n        <tr>\r\n          <td>1</td>\r\n          <td>Mark</td>\r\n          <td>Otto</td>\r\n          <td>@mdo</td>\r\n        </tr>\r\n        <tr>\r\n          <td>2</td>\r\n          <td>Jacob</td>\r\n          <td>Thornton</td>\r\n          <td>@fat</td>\r\n        </tr>\r\n        <tr>\r\n          <td>3</td>\r\n          <td colspan="2">Larry the Bird</td>\r\n          <td>@twitter</td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n<pre class="prettyprint linenums" style="margin-bottom: 18px;">&lt;table class=&quot;table table-condensed&quot;&gt;\r\n  &hellip;\r\n&lt;/table&gt;</pre>\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n  <h2>Optional row classes</h2>   \r\n  <p>Use contextual classes to color table rows.</p>\r\n     <table class="table table-bordered table-striped">\r\n        <colgroup>\r\n          <col class="span1">\r\n          <col class="span7">\r\n        </colgroup>\r\n        <thead>\r\n          <tr>\r\n            <th>Class</th>\r\n            <th>Description</th>\r\n          </tr>\r\n        </thead>\r\n        <tbody>\r\n          <tr>\r\n            <td>\r\n              <code>.success</code>\r\n            </td>\r\n            <td>Indicates a successful or positive action.</td>\r\n          </tr>\r\n          <tr>\r\n            <td>\r\n              <code>.error</code>\r\n            </td>\r\n            <td>Indicates a dangerous or potentially negative action.</td>\r\n          </tr>\r\n          <tr>\r\n            <td>\r\n              <code>.info</code>\r\n            </td>\r\n            <td>Used as an alternative to the default styles.</td>\r\n          </tr>\r\n        </tbody>\r\n      </table>\r\n\r\n	<div class="gantry-example">\r\n       <table class="table">\r\n         <thead>\r\n           <tr>\r\n             <th>#</th>\r\n             <th>Product</th>\r\n             <th>Payment Taken</th>\r\n             <th>Status</th>\r\n           </tr>\r\n         </thead>\r\n         <tbody>\r\n           <tr class="success">\r\n             <td>1</td>\r\n             <td>TB - Monthly</td>\r\n             <td>01/04/2012</td>\r\n             <td>Approved</td>\r\n           </tr>\r\n           <tr class="error">\r\n             <td>2</td>\r\n             <td>TB - Monthly</td>\r\n             <td>02/04/2012</td>\r\n             <td>Declined</td>\r\n           </tr>\r\n           <tr class="warning">\r\n             <td>3</td>\r\n             <td>TB - Monthly</td>\r\n             <td>03/04/2012</td>\r\n             <td>Pending</td>\r\n           </tr>\r\n           <tr class="info">\r\n             <td>4</td>\r\n             <td>TB - Monthly</td>\r\n             <td>04/04/2012</td>\r\n             <td>Call in to confirm</td>\r\n           </tr>\r\n         </tbody>\r\n       </table>\r\n     </div>\r\n<pre class="prettyprint linenums">...\r\n  &lt;tr class=&quot;success&quot;&gt;\r\n    &lt;td&gt;1&lt;/td&gt;\r\n    &lt;td&gt;TB - Monthly&lt;/td&gt;\r\n    &lt;td&gt;01/04/2012&lt;/td&gt;\r\n    &lt;td&gt;Approved&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n...</pre>\r\n\r\n  <h2>Supported table markup</h2>\r\n  <p>List of supported table HTML elements and how they should be used.</p>\r\n  <table class="table table-bordered table-striped">\r\n    <colgroup>\r\n      <col class="span1">\r\n      <col class="span7">\r\n    </colgroup>\r\n    <thead>\r\n      <tr>\r\n        <th>Tag</th>\r\n        <th>Description</th>\r\n      </tr>\r\n    </thead>\r\n    <tbody>\r\n      <tr>\r\n        <td>\r\n          <code>&lt;table&gt;</code>\r\n        </td>\r\n        <td>\r\n          Wrapping element for displaying data in a tabular format\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>\r\n          <code>&lt;thead&gt;</code>\r\n        </td>\r\n        <td>\r\n          Container element for table header rows (<code>&lt;tr&gt;</code>) to label table columns\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>\r\n          <code>&lt;tbody&gt;</code>\r\n        </td>\r\n        <td>\r\n          Container element for table rows (<code>&lt;tr&gt;</code>) in the body of the table\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>\r\n          <code>&lt;tr&gt;</code>\r\n        </td>\r\n        <td>\r\n          Container element for a set of table cells (<code>&lt;td&gt;</code> or <code>&lt;th&gt;</code>) that appears on a single row\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>\r\n          <code>&lt;td&gt;</code>\r\n        </td>\r\n        <td>\r\n          Default table cell\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>\r\n          <code>&lt;th&gt;</code>\r\n        </td>\r\n        <td>\r\n          Special table cell for column (or row, depending on scope and placement) labels<br>\r\n          Must be used within a <code>&lt;thead&gt;</code>\r\n        </td>\r\n      </tr>\r\n      <tr>\r\n        <td>\r\n          <code>&lt;caption&gt;</code>\r\n        </td>\r\n        <td>\r\n          Description or summary of what the table holds, especially useful for screen readers\r\n        </td>\r\n      </tr>\r\n    </tbody>\r\n  </table>\r\n<pre class="prettyprint linenums">&lt;table&gt;\r\n  &lt;caption&gt;...&lt;/caption&gt;\r\n  &lt;thead&gt;\r\n    &lt;tr&gt;\r\n      &lt;th&gt;...&lt;/th&gt;\r\n      &lt;th&gt;...&lt;/th&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/thead&gt;\r\n  &lt;tbody&gt;\r\n    &lt;tr&gt;\r\n      &lt;td&gt;...&lt;/td&gt;\r\n      &lt;td&gt;...&lt;/td&gt;\r\n    &lt;/tr&gt;\r\n  &lt;/tbody&gt;\r\n&lt;/table&gt;</pre>\r\n\r\n</section>\r\n\r\n\r\n\r\n<!-- Forms\r\n================================================== -->\r\n<section id="forms">\r\n  <div class="page-header">\r\n    <h1>Forms</h1>\r\n  </div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left" style="float: none;">                \r\n  <h2>Default styles</h2>\r\n  <p>Individual form controls receive styling, but without any required base class on the <code>&lt;form&gt;</code> or large changes in markup. Results in stacked, left-aligned labels on top of form controls.</p>\r\n\r\n  <form class="gantry-example"><fieldset>\r\n    <legend>Legend</legend>\r\n    <label>Label name</label>\r\n    <input type="text" placeholder="Type something…">\r\n    <span class="help-block">Example block-level help text here.</span>\r\n    <label class="checkbox">\r\n      <input type="checkbox"> Check me out\r\n    </label>\r\n    <button type="submit" class="btn">Submit</button>\r\n  </fieldset></form>\r\n\r\n<pre class="prettyprint linenums">&lt;form&gt;\r\n  &lt;legend&gt;Legend&lt;/legend&gt;\r\n  &lt;label&gt;Label name&lt;/label&gt;\r\n  &lt;input type=&quot;text&quot; placeholder=&quot;Type something&hellip;&quot;&gt;\r\n  &lt;span class=&quot;help-block&quot;&gt;Example block-level help text here.&lt;/span&gt;\r\n  &lt;label class=&quot;checkbox&quot;&gt;\r\n    &lt;input type=&quot;checkbox&quot;&gt; Check me out\r\n  &lt;/label&gt;\r\n  &lt;button type=&quot;submit&quot; class=&quot;btn&quot;&gt;Submit&lt;/button&gt;\r\n&lt;/form&gt;</pre><br />\r\n\r\n  <h2>Optional layouts</h2>\r\n  <p>Included with Bootstrap are three optional form layouts for common use cases.</p>\r\n\r\n  <h3>Search form</h3>\r\n  <p>Add <code>.form-search</code> to the form and <code>.search-query</code> to the <code>&lt;input&gt;</code> for an extra-rounded text input.</p>\r\n  <form class="gantry-example form-search">\r\n    <input type="text" class="input-medium search-query">\r\n    <button type="submit" class="btn">Search</button>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;form class=&quot;form-search&quot;&gt;\r\n  &lt;input type=&quot;text&quot; class=&quot;input-medium search-query&quot;&gt;\r\n  &lt;button type=&quot;submit&quot; class=&quot;btn&quot;&gt;Search&lt;/button&gt;\r\n&lt;/form&gt;</pre>\r\n\r\n  <h3>Inline form</h3>\r\n  <p>Add <code>.form-inline</code> for left-aligned labels and inline-block controls for a compact layout.</p>\r\n  <form class="gantry-example form-inline">\r\n    <input type="text" class="input-small" placeholder="Email">\r\n    <input type="password" class="input-small" placeholder="Password">\r\n    <label class="checkbox">\r\n      <input type="checkbox"> Remember me\r\n    </label>\r\n    <button type="submit" class="btn">Sign in</button>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;form class=&quot;form-inline&quot;&gt;\r\n  &lt;input type=&quot;text&quot; class=&quot;input-small&quot; placeholder=&quot;Email&quot;&gt;\r\n  &lt;input type=&quot;password&quot; class=&quot;input-small&quot; placeholder=&quot;Password&quot;&gt;\r\n  &lt;label class=&quot;checkbox&quot;&gt;\r\n    &lt;input type=&quot;checkbox&quot;&gt; Remember me\r\n  &lt;/label&gt;\r\n  &lt;button type=&quot;submit&quot; class=&quot;btn&quot;&gt;Sign in&lt;/button&gt;\r\n&lt;/form&gt;</pre>\r\n\r\n  <h3>Horizontal form</h3>\r\n  <p>Right align labels and float them to the left to make them appear on the same line as controls. Requires the most markup changes from a default form:</p>\r\n  <ul>\r\n    <li>Add <code>.form-horizontal</code> to the form</li>\r\n    <li>Wrap labels and controls in <code>.control-group</code></li>\r\n    <li>Add <code>.control-label</code> to the label</li>\r\n    <li>Wrap any associated controls in <code>.controls</code> for proper alignment</li>\r\n  </ul>\r\n  <form class="gantry-example form-horizontal"><fieldset>\r\n    <legend>Legend</legend>\r\n    <div class="control-group">\r\n      <label class="control-label" for="inputEmail">Email</label>\r\n      <div class="controls">\r\n        <input type="text" id="inputEmail" placeholder="Email">\r\n      </div>\r\n    </div>\r\n    <div class="control-group">\r\n      <label class="control-label" for="inputPassword">Password</label>\r\n      <div class="controls">\r\n        <input type="password" id="inputPassword" placeholder="Password">\r\n      </div>\r\n    </div>\r\n    <div class="control-group">\r\n      <div class="controls">\r\n        <label class="checkbox">\r\n          <input type="checkbox"> Remember me\r\n        </label>\r\n        <button type="submit" class="btn">Sign in</button>\r\n      </div>\r\n    </div></fieldset>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;form class=&quot;form-horizontal&quot;&gt;\r\n  &lt;div class=&quot;control-group&quot;&gt;\r\n    &lt;label class=&quot;control-label&quot; for=&quot;inputEmail&quot;&gt;Email&lt;/label&gt;\r\n    &lt;div class=&quot;controls&quot;&gt;\r\n      &lt;input type=&quot;text&quot; id=&quot;inputEmail&quot; placeholder=&quot;Email&quot;&gt;\r\n    &lt;/div&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;control-group&quot;&gt;\r\n    &lt;label class=&quot;control-label&quot; for=&quot;inputPassword&quot;&gt;Password&lt;/label&gt;\r\n    &lt;div class=&quot;controls&quot;&gt;\r\n      &lt;input type=&quot;password&quot; id=&quot;inputPassword&quot; placeholder=&quot;Password&quot;&gt;\r\n    &lt;/div&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;control-group&quot;&gt;\r\n    &lt;div class=&quot;controls&quot;&gt;\r\n      &lt;label class=&quot;checkbox&quot;&gt;\r\n        &lt;input type=&quot;checkbox&quot;&gt; Remember me\r\n      &lt;/label&gt;\r\n      &lt;button type=&quot;submit&quot; class=&quot;btn&quot;&gt;Sign in&lt;/button&gt;\r\n    &lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/form&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h2>Supported form controls</h2>\r\n  <p>Examples of standard form controls supported in an example form layout.</p>\r\n\r\n  <h3>Inputs</h3>\r\n  <p>Most common form control, text-based input fields. Includes support for all HTML5 types: text, password, datetime, datetime-local, date, month, time, week, number, email, url, search, tel, and color.</p>\r\n  <p>Requires the use of a specified <code>type</code> at all times.</p>\r\n  <form class="gantry-example form-inline">\r\n    <input type="text" placeholder="Text input">\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;input type=&quot;text&quot; placeholder=&quot;Text input&quot;&gt;</pre>\r\n\r\n  <h3>Textarea</h3>\r\n  <p>Form control which supports multiple lines of text. Change <code>row</code> attribute as necessary.</p>\r\n  <form class="gantry-example form-inline">\r\n    <textarea rows="3"></textarea>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;textarea rows=&quot;3&quot;&gt;&lt;/textarea&gt;</pre>\r\n\r\n  <h3>Checkboxes and radios</h3>\r\n  <p>Checkboxes are for selecting one or several options in a list while radios are for selecting one option from many.</p>\r\n  <h4>Default (stacked)</h4>\r\n  <form class="gantry-example">\r\n    <label class="checkbox">\r\n      <input type="checkbox" value="">\r\n      Option one is this and that—be sure to include why it''s great\r\n    </label>\r\n    <br>\r\n    <label class="radio">\r\n      <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">\r\n      Option one is this and that—be sure to include why it''s great\r\n    </label>\r\n    <label class="radio">\r\n      <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">\r\n      Option two can be something else and selecting it will deselect option one\r\n    </label>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;label class=&quot;checkbox&quot;&gt;\r\n  &lt;input type=&quot;checkbox&quot; value=&quot;&quot;&gt;\r\n  Option one is this and that&mdash;be sure to include why it&#x27;s great\r\n&lt;/label&gt;\r\n\r\n&lt;label class=&quot;radio&quot;&gt;\r\n  &lt;input type=&quot;radio&quot; name=&quot;optionsRadios&quot; id=&quot;optionsRadios1&quot; value=&quot;option1&quot; checked&gt;\r\n  Option one is this and that&mdash;be sure to include why it&#x27;s great\r\n&lt;/label&gt;\r\n&lt;label class=&quot;radio&quot;&gt;\r\n  &lt;input type=&quot;radio&quot; name=&quot;optionsRadios&quot; id=&quot;optionsRadios2&quot; value=&quot;option2&quot;&gt;\r\n  Option two can be something else and selecting it will deselect option one\r\n&lt;/label&gt;</pre>\r\n\r\n  <h4>Inline checkboxes</h4>\r\n  <p>Add the <code>.inline</code> class to a series of checkboxes or radios for controls appear on the same line.</p>\r\n  <form class="gantry-example">\r\n    <label class="checkbox inline">\r\n      <input type="checkbox" id="inlineCheckbox1" value="option1"> 1\r\n    </label>\r\n    <label class="checkbox inline">\r\n      <input type="checkbox" id="inlineCheckbox2" value="option2"> 2\r\n    </label>\r\n    <label class="checkbox inline">\r\n      <input type="checkbox" id="inlineCheckbox3" value="option3"> 3\r\n    </label>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;label class=&quot;checkbox inline&quot;&gt;\r\n  &lt;input type=&quot;checkbox&quot; id=&quot;inlineCheckbox1&quot; value=&quot;option1&quot;&gt; 1\r\n&lt;/label&gt;\r\n&lt;label class=&quot;checkbox inline&quot;&gt;\r\n  &lt;input type=&quot;checkbox&quot; id=&quot;inlineCheckbox2&quot; value=&quot;option2&quot;&gt; 2\r\n&lt;/label&gt;\r\n&lt;label class=&quot;checkbox inline&quot;&gt;\r\n  &lt;input type=&quot;checkbox&quot; id=&quot;inlineCheckbox3&quot; value=&quot;option3&quot;&gt; 3\r\n&lt;/label&gt;</pre>\r\n\r\n  <h3>Selects</h3>\r\n  <p>Use the default option or specify a <code>multiple="multiple"</code> to show multiple options at once.</p>\r\n  <form class="gantry-example">\r\n    <select>\r\n      <option>1</option>\r\n      <option>2</option>\r\n      <option>3</option>\r\n      <option>4</option>\r\n      <option>5</option>\r\n    </select>\r\n    <br>\r\n    <select multiple="multiple">\r\n      <option>1</option>\r\n      <option>2</option>\r\n      <option>3</option>\r\n      <option>4</option>\r\n      <option>5</option>\r\n    </select>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;select&gt;\r\n  &lt;option&gt;1&lt;/option&gt;\r\n  &lt;option&gt;2&lt;/option&gt;\r\n  &lt;option&gt;3&lt;/option&gt;\r\n  &lt;option&gt;4&lt;/option&gt;\r\n  &lt;option&gt;5&lt;/option&gt;\r\n&lt;/select&gt;\r\n\r\n&lt;select multiple=&quot;multiple&quot;&gt;\r\n  &lt;option&gt;1&lt;/option&gt;\r\n  &lt;option&gt;2&lt;/option&gt;\r\n  &lt;option&gt;3&lt;/option&gt;\r\n  &lt;option&gt;4&lt;/option&gt;\r\n  &lt;option&gt;5&lt;/option&gt;\r\n&lt;/select&gt;</pre>\r\n</div></div>\r\n\r\n<div class="clear"></div>\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n\r\n  <h2>Extending form controls</h2>\r\n  <p>Adding on top of existing browser controls, Bootstrap includes other useful form components.</p>\r\n\r\n  <h3>Prepended and appended inputs</h3>\r\n  <span>Add text or buttons before or after any text-based input. Do note that <code>select</code> elements are not supported here.</span><br />\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left" style="float: none;">\r\n  <h4>Default options</h4>\r\n  <p>Wrap an <code>.add-on</code> and an <code>input</code> with one of two classes to prepend or append text to an input.</p>\r\n  <form class="gantry-example">\r\n    <div class="input-prepend">\r\n      <span class="add-on">@</span>\r\n      <input class="span2" id="prependedInput" size="16" type="text" placeholder="Username">\r\n    </div>\r\n    <br>\r\n    <div class="input-append">\r\n      <input class="span2" id="appendedInput" size="16" type="text">\r\n      <span class="add-on">.00</span>\r\n    </div>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;div class=&quot;input-prepend&quot;&gt;\r\n  &lt;span class=&quot;add-on&quot;&gt;@&lt;/span&gt;&lt;input class=&quot;span2&quot; id=&quot;prependedInput&quot; size=&quot;16&quot; type=&quot;text&quot; placeholder=&quot;Username&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;input-append&quot;&gt;\r\n  &lt;input class=&quot;span2&quot; id=&quot;appendedInput&quot; size=&quot;16&quot; type=&quot;text&quot;&gt;&lt;span class=&quot;add-on&quot;&gt;.00&lt;/span&gt;\r\n&lt;/div&gt;</pre>\r\n\r\n  <h4>Search form</h4>\r\n  <form class="gantry-example form-search">\r\n    <div class="input-append">\r\n      <input type="text" class="span2 search-query">\r\n      <button type="submit" class="btn">Search</button>\r\n    </div>\r\n    <br /><br /><div class="input-prepend">\r\n      <button type="submit" class="btn">Search</button>\r\n      <input type="text" class="span2 search-query">\r\n    </div>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;form class=&quot;form-search&quot;&gt;\r\n  &lt;div class=&quot;input-append&quot;&gt;\r\n    &lt;input type=&quot;text&quot; class=&quot;span2 search-query&quot;&gt;\r\n    &lt;button type=&quot;submit&quot; class=&quot;btn&quot;&gt;Search&lt;/button&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;input-prepend&quot;&gt;\r\n    &lt;button type=&quot;submit&quot; class=&quot;btn&quot;&gt;Search&lt;/button&gt;\r\n    &lt;input type=&quot;text&quot; class=&quot;span2 search-query&quot;&gt;\r\n  &lt;/div&gt;\r\n&lt;/form&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right" style="float: none;">\r\n  <h4>Combined</h4>\r\n  <p>Use both classes and two instances of <code>.add-on</code> to prepend and append an input.</p>\r\n  <form class="gantry-example form-inline">\r\n    <div class="input-prepend input-append">\r\n      <span class="add-on">$</span>\r\n      <input class="span2" id="appendedPrependedInput" size="16" type="text">\r\n      <span class="add-on">.00</span>\r\n    </div>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;div class=&quot;input-prepend input-append&quot;&gt;\r\n  &lt;span class=&quot;add-on&quot;&gt;$&lt;/span&gt;&lt;input class=&quot;span2&quot; id=&quot;appendedPrependedInput&quot; size=&quot;16&quot; type=&quot;text&quot;&gt;&lt;span class=&quot;add-on&quot;&gt;.00&lt;/span&gt;\r\n&lt;/div&gt;</pre>\r\n\r\n  <h4>Buttons instead of text</h4>\r\n  <p>Instead of a <code>&lt;span&gt;</code> with text, use a <code>.btn</code> to attach a button (or two) to an input.</p>\r\n  <form class="gantry-example">\r\n    <div class="input-append">\r\n      <input class="span2" id="appendedInputButton" size="16" type="text">\r\n      <button class="btn" type="button">Go!</button>\r\n    </div>\r\n    <br>\r\n    <div class="input-append">\r\n      <input class="span2" id="appendedInputButtons" size="16" type="text">\r\n      <button class="btn" type="button">Search</button>\r\n      <button class="btn" type="button">Options</button>\r\n    </div>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;div class=&quot;input-append&quot;&gt;\r\n  &lt;input class=&quot;span2&quot; id=&quot;appendedInputButton&quot; size=&quot;16&quot; type=&quot;text&quot;&gt;&lt;button class=&quot;btn&quot; type=&quot;button&quot;&gt;Go!&lt;/button&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;input-append&quot;&gt;\r\n  &lt;input class=&quot;span2&quot; id=&quot;appendedInputButtons&quot; size=&quot;16&quot; type=&quot;text&quot;&gt;&lt;button class=&quot;btn&quot; type=&quot;button&quot;&gt;Search&lt;/button&gt;&lt;button class=&quot;btn&quot; type=&quot;button&quot;&gt;Options&lt;/button&gt;\r\n&lt;/div&gt;</pre>\r\n\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h3>Form actions</h3>\r\n  <p>End a form with a group of actions (buttons). When placed within a <code>.form-horizontal</code>, the buttons will automatically indent to line up with the form controls.</p>\r\n  <form class="gantry-example">\r\n    <div class="form-actions">\r\n      <button type="submit" class="btn btn-primary">Save changes</button>\r\n      <button type="button" class="btn">Cancel</button>\r\n    </div>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;div class=&quot;form-actions&quot;&gt;\r\n  &lt;button type=&quot;submit&quot; class=&quot;btn btn-primary&quot;&gt;Save changes&lt;/button&gt;\r\n  &lt;button type=&quot;button&quot; class=&quot;btn&quot;&gt;Cancel&lt;/button&gt;\r\n&lt;/div&gt;</pre>\r\n\r\n  <h3>Help text</h3>\r\n  <p>Inline and block level support for help text that appears around form controls.</p>\r\n  <h4>Inline help</h4>\r\n  <form class="gantry-example form-inline">\r\n    <input type="text"> <span class="help-inline">Inline help text</span>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;input type=&quot;text&quot;&gt;&lt;span class=&quot;help-inline&quot;&gt;Inline help text&lt;/span&gt;</pre>\r\n\r\n  <h4>Block help</h4>\r\n  <form class="gantry-example form-inline">\r\n    <input type="text">\r\n    <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;input type=&quot;text&quot;&gt;&lt;span class=&quot;help-block&quot;&gt;A longer block of help text that breaks onto a new line and may extend beyond one line.&lt;/span&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right" style="float: none;">\r\n  <h3>Control sizing</h3>\r\n  <p>Use relative sizing classes like <code>.input-large</code> or match your inputs to the grid column sizes using <code>.span*</code> classes.</p>\r\n\r\n  <h4>Relative sizing</h4>\r\n  <form class="gantry-example" style="padding-bottom: 15px;">\r\n    <div class="controls docs-input-sizes">\r\n      <input class="input-mini" type="text" placeholder=".input-mini"><br />\r\n      <input class="input-small" type="text" placeholder=".input-small"><br />\r\n      <input class="input-medium" type="text" placeholder=".input-medium"><br />\r\n      <input class="input-large" type="text" placeholder=".input-large"><br />\r\n      <input class="input-xlarge" type="text" placeholder=".input-xlarge"><br />\r\n      <input class="input-xxlarge" type="text" placeholder=".input-xxlarge">\r\n    </div>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;input class=&quot;input-mini&quot; type=&quot;text&quot; placeholder=&quot;.input-mini&quot;&gt;\r\n&lt;input class=&quot;input-small&quot; type=&quot;text&quot; placeholder=&quot;.input-small&quot;&gt;\r\n&lt;input class=&quot;input-medium&quot; type=&quot;text&quot; placeholder=&quot;.input-medium&quot;&gt;\r\n&lt;input class=&quot;input-large&quot; type=&quot;text&quot; placeholder=&quot;.input-large&quot;&gt;\r\n&lt;input class=&quot;input-xlarge&quot; type=&quot;text&quot; placeholder=&quot;.input-xlarge&quot;&gt;\r\n&lt;input class=&quot;input-xxlarge&quot; type=&quot;text&quot; placeholder=&quot;.input-xxlarge&quot;&gt;</pre><br />\r\n  <p>\r\n    <strong>Note:</strong> In future versions, we''ll be altering the use of these relative input classes to match our button sizes. For example, <code>.input-large</code> will increase the padding and font-size of an input.\r\n  </p>\r\n\r\n  <h3>Uneditable inputs</h3>\r\n  <p>Present data in a form that''s not editable without using actual form markup.</p>\r\n  <form class="gantry-example">\r\n    <span class="input-xlarge uneditable-input">Some value here</span>\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;span class=&quot;input-xlarge uneditable-input&quot;&gt;Some value here&lt;/span&gt;</pre>\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n<br /><!-- SEPARATOR -->\r\n\r\n\r\n  <h2>Form control states</h2>\r\n  <span>Provide feedback to users or visitors with basic feedback states on form controls and labels.</span><br />\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h3>Input focus</h3>\r\n  <p>We remove the default <code>outline</code> styles on some form controls and apply a <code>box-shadow</code> in its place for <code>:focus</code>.</p>\r\n  <form class="gantry-example form-inline">\r\n    <input class="input-xlarge focused" id="focusedInput" type="text" value="This is focused...">\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;input class=&quot;input-xlarge&quot; id=&quot;focusedInput&quot; type=&quot;text&quot; value=&quot;This is focused...&quot;&gt;</pre>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h3>Disabled inputs</h3>\r\n  <p>Add the <code>disabled</code> attribute on an input to prevent user input and trigger a slightly different look.</p>\r\n  <form class="gantry-example form-inline">\r\n    <input class="input-xlarge" id="disabledInput" type="text" placeholder="Disabled input here…" disabled="">\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;input class=&quot;input-xlarge&quot; id=&quot;disabledInput&quot; type=&quot;text&quot; placeholder=&quot;Disabled input here...&quot; disabled&gt;</pre>\r\n</div></div>\r\n<div class="clear"></div>       \r\n\r\n<h3>Validation states</h3>\r\n<p>Bootstrap includes validation styles for error, warning, and success messages. To use, add the appropriate class to the surrounding <code>.control-group</code>.</p>\r\n\r\n<form class="gantry-example form-horizontal">\r\n  <div class="control-group warning">\r\n    <label class="control-label" for="inputWarning">Input with warning</label>\r\n    <div class="controls">\r\n      <input type="text" id="inputWarning">\r\n      <span class="help-inline">Something may have gone wrong</span>\r\n    </div>\r\n  </div>\r\n  <div class="control-group error">\r\n    <label class="control-label" for="inputError">Input with error</label>\r\n    <div class="controls">\r\n      <input type="text" id="inputError">\r\n      <span class="help-inline">Please correct the error</span>\r\n    </div>\r\n  </div>\r\n  <div class="control-group info">\r\n    <label class="control-label" for="inputError">Input with info</label>\r\n    <div class="controls">\r\n      <input type="text" id="inputError">\r\n      <span class="help-inline">Username is taken</span>\r\n    </div>\r\n  </div>\r\n  <div class="control-group success">\r\n    <label class="control-label" for="inputSuccess">Input with success</label>\r\n    <div class="controls">\r\n      <input type="text" id="inputSuccess">\r\n      <span class="help-inline">Woohoo!</span>\r\n    </div>\r\n  </div>\r\n</form>   \r\n<pre class="prettyprint linenums">&lt;div class=&quot;control-group warning&quot;&gt;\r\n  &lt;label class=&quot;control-label&quot; for=&quot;inputWarning&quot;&gt;Input with warning&lt;/label&gt;\r\n  &lt;div class=&quot;controls&quot;&gt;\r\n    &lt;input type=&quot;text&quot; id=&quot;inputWarning&quot;&gt;\r\n    &lt;span class=&quot;help-inline&quot;&gt;Something may have gone wrong&lt;/span&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;control-group error&quot;&gt;\r\n  &lt;label class=&quot;control-label&quot; for=&quot;inputError&quot;&gt;Input with error&lt;/label&gt;\r\n  &lt;div class=&quot;controls&quot;&gt;\r\n    &lt;input type=&quot;text&quot; id=&quot;inputError&quot;&gt;\r\n    &lt;span class=&quot;help-inline&quot;&gt;Please correct the error&lt;/span&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;control-group info&quot;&gt;\r\n  &lt;label class=&quot;control-label&quot; for=&quot;inputError&quot;&gt;Input with info&lt;/label&gt;\r\n  &lt;div class=&quot;controls&quot;&gt;\r\n    &lt;input type=&quot;text&quot; id=&quot;inputError&quot;&gt;\r\n    &lt;span class=&quot;help-inline&quot;&gt;Username is taken&lt;/span&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;control-group success&quot;&gt;\r\n  &lt;label class=&quot;control-label&quot; for=&quot;inputSuccess&quot;&gt;Input with success&lt;/label&gt;\r\n  &lt;div class=&quot;controls&quot;&gt;\r\n    &lt;input type=&quot;text&quot; id=&quot;inputSuccess&quot;&gt;\r\n    &lt;span class=&quot;help-inline&quot;&gt;Woohoo!&lt;/span&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;</pre>\r\n</section>\r\n\r\n\r\n\r\n<!-- Buttons\r\n================================================== -->\r\n<section id="buttons">\r\n  <div class="page-header">\r\n    <h1>Buttons</h1>\r\n  </div>\r\n\r\n  <h2>Default buttons</h2>\r\n  <p>Button styles can be applied to anything with the <code>.btn</code> class applied. However, typically you''ll want to apply these to only <code>&lt;a&gt;</code> and <code>&lt;button&gt;</code> elements for the best rendering.</p>\r\n<table class="table table-bordered table-striped">\r\n  <thead>\r\n    <tr>\r\n      <th>Button</th>\r\n      <th>class=""</th>\r\n      <th>Description</th>\r\n    </tr>\r\n  </thead>\r\n  <tbody>\r\n    <tr>\r\n      <td><button type="button" class="btn">Default</button></td>\r\n      <td><code>btn</code></td>\r\n      <td>Standard gray button with gradient</td>\r\n    </tr>\r\n    <tr>\r\n      <td><button type="button" class="btn btn-primary">Primary</button></td>\r\n      <td><code>btn btn-primary</code></td>\r\n      <td>Provides extra visual weight and identifies the primary action in a set of buttons</td>\r\n    </tr>\r\n    <tr>\r\n      <td><button type="button" class="btn btn-info">Info</button></td>\r\n      <td><code>btn btn-info</code></td>\r\n      <td>Used as an alternative to the default styles</td>\r\n    </tr>\r\n    <tr>\r\n      <td><button type="button" class="btn btn-success">Success</button></td>\r\n      <td><code>btn btn-success</code></td>\r\n      <td>Indicates a successful or positive action</td>\r\n    </tr>\r\n    <tr>\r\n      <td><button type="button" class="btn btn-warning">Warning</button></td>\r\n      <td><code>btn btn-warning</code></td>\r\n      <td>Indicates caution should be taken with this action</td>\r\n    </tr>\r\n    <tr>\r\n      <td><button type="button" class="btn btn-danger">Danger</button></td>\r\n      <td><code>btn btn-danger</code></td>\r\n      <td>Indicates a dangerous or potentially negative action</td>\r\n    </tr>\r\n    <tr>\r\n      <td><button type="button" class="btn btn-inverse">Inverse</button></td>\r\n      <td><code>btn btn-inverse</code></td>\r\n      <td>Alternate dark gray button, not tied to a semantic action or use</td>\r\n    </tr>\r\n    <tr>\r\n      <td><button type="button" class="btn btn-link">Link</button></td>\r\n      <td><code>btn btn-link</code></td>\r\n      <td>Deemphasize a button by making it look like a link while maintaining button behavior</td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n\r\n  <h4>Cross browser compatibility</h4>\r\n  <p>IE9 doesn''t crop background gradients on rounded corners, so we remove it. Related, IE9 jankifies disabled <code>button</code> elements, rendering text gray with a nasty text-shadow that we cannot fix.</p>\r\n\r\n\r\n  <h2>Button sizes</h2>\r\n  <p>Fancy larger or smaller buttons? Add <code>.btn-large</code>, <code>.btn-small</code>, or <code>.btn-mini</code> for additional sizes.</p>\r\n  <div class="gantry-example">\r\n    <p>\r\n      <button type="button" class="btn btn-large btn-primary">Large button</button>\r\n      <button type="button" class="btn btn-large">Large button</button>\r\n    </p>\r\n    <p>\r\n      <button type="button" class="btn btn-primary">Default button</button>\r\n      <button type="button" class="btn">Default button</button>\r\n    </p>\r\n    <p>\r\n      <button type="button" class="btn btn-small btn-primary">Small button</button>\r\n      <button type="button" class="btn btn-small">Small button</button>\r\n    </p>\r\n    <p>\r\n      <button type="button" class="btn btn-mini btn-primary">Mini button</button>\r\n      <button type="button" class="btn btn-mini">Mini button</button>\r\n    </p>\r\n  </div>\r\n<pre class="prettyprint linenums">&lt;p&gt;\r\n  &lt;button class=&quot;btn btn-large btn-primary&quot; type=&quot;button&quot;&gt;Large button&lt;/button&gt;\r\n  &lt;button class=&quot;btn btn-large&quot; type=&quot;button&quot;&gt;Large button&lt;/button&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n  &lt;button class=&quot;btn btn-primary&quot; type=&quot;button&quot;&gt;Default button&lt;/button&gt;\r\n  &lt;button class=&quot;btn&quot; type=&quot;button&quot;&gt;Default button&lt;/button&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n  &lt;button class=&quot;btn btn-small btn-primary&quot; type=&quot;button&quot;&gt;Small button&lt;/button&gt;\r\n  &lt;button class=&quot;btn btn-small&quot; type=&quot;button&quot;&gt;Small button&lt;/button&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n  &lt;button class=&quot;btn btn-mini btn-primary&quot; type=&quot;button&quot;&gt;Mini button&lt;/button&gt;\r\n  &lt;button class=&quot;btn btn-mini&quot; type=&quot;button&quot;&gt;Mini button&lt;/button&gt;\r\n&lt;/p&gt;</pre>\r\n<p>Create block level buttons—those that span the full width of a parent— by adding <code>.btn-block</code>.</p>\r\n<div class="gantry-example">\r\n  <div class="well" style="max-width: 400px; margin: 0 auto 10px;">\r\n    <button type="button" class="btn btn-large btn-block btn-primary">Block level button</button>\r\n    <button type="button" class="btn btn-large btn-block">Block level button</button>\r\n  </div>\r\n</div>\r\n<pre class="prettyprint linenums">&lt;button class=&quot;btn btn-large btn-block btn-primary&quot; type=&quot;button&quot;&gt;Block level button&lt;/button&gt;\r\n&lt;button class=&quot;btn btn-large btn-block&quot; type=&quot;button&quot;&gt;Block level button&lt;/button&gt;</pre>\r\n	\r\n  <h2>Disabled state</h2>\r\n  <p>Make buttons look unclickable by fading them back 50%.</p>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-left">\r\n  <h3>Anchor element</h3>\r\n  <p>Add the <code>.disabled</code> class to <code>&lt;a&gt;</code> buttons.</p>\r\n  <p class="gantry-example">\r\n    <a href="#" class="btn btn-large btn-primary disabled">Primary link</a>\r\n    <a href="#" class="btn btn-large disabled">Link</a>\r\n  </p>\r\n<pre class="prettyprint linenums">&lt;a href=&quot;#&quot; class=&quot;btn btn-large btn-primary disabled&quot;&gt;Primary link&lt;/a&gt;\r\n&lt;a href=&quot;#&quot; class=&quot;btn btn-large disabled&quot;&gt;Link&lt;/a&gt;</pre><br />\r\n  <p>\r\n    <strong>Note:</strong>\r\n    We use <code>.disabled</code> as a utility class here, similar to the common <code>.active</code> class, so no prefix is required.\r\n  </p>\r\n</div></div>\r\n\r\n<div class="gantry-width-block gantry-width-50">\r\n<div class="gantry-right">\r\n  <h3>Button element</h3>\r\n  <p>Add the <code>disabled</code> attribute to <code>&lt;button&gt;</code> buttons.</p>\r\n  <p class="gantry-example">\r\n    <button type="button" class="btn btn-large btn-primary disabled" disabled="disabled">Primary button</button>\r\n    <button type="button" class="btn btn-large" disabled="">Button</button>\r\n  </p>\r\n<pre class="prettyprint linenums">&lt;button type=&quot;button&quot; class=&quot;btn btn-large btn-primary disabled&quot; disabled=&quot;disabled&quot;&gt;Primary button&lt;/button&gt;\r\n&lt;button type=&quot;button&quot; class=&quot;btn btn-large&quot; disabled&gt;Button&lt;/button&gt;</pre>\r\n</div></div>\r\n<div class="clear"></div>\r\n\r\n\r\n  <h2>One class, multiple tags</h2>\r\n  <p>Use the <code>.btn</code> class on an <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code>, or <code>&lt;input&gt;</code> element.</p>\r\n  <form class="gantry-example">\r\n    <a class="btn" href="">Link</a>\r\n    <button class="btn" type="submit">Button</button>\r\n    <input class="btn" type="button" value="Input">\r\n    <input class="btn" type="submit" value="Submit">\r\n  </form>\r\n<pre class="prettyprint linenums">&lt;a class=&quot;btn&quot; href=&quot;&quot;&gt;Link&lt;/a&gt;\r\n&lt;button class=&quot;btn&quot; type=&quot;submit&quot;&gt;Button&lt;/button&gt;\r\n&lt;input class=&quot;btn&quot; type=&quot;button&quot; value=&quot;Input&quot;&gt;\r\n&lt;input class=&quot;btn&quot; type=&quot;submit&quot; value=&quot;Submit&quot;&gt;</pre><br />\r\n  <p>As a best practice, try to match the element for your context to ensure matching cross-browser rendering. If you have an <code>input</code>, use an <code>&lt;input type="submit"&gt;</code> for your button.</p>\r\n\r\n</section>\r\n\r\n<!-- Icons\r\n================================================== -->\r\n<h1>Icons</h1>\r\n<h2>Font Awesome</h2>\r\n\r\n  <p>Font Awesome is a pictographic language of web-related actions which delivers 220 icons. The Font Awesome webfont, CSS, and LESS files are licensed under CC BY 3.0 and you can find the full examples of usage at <a href="http://fortawesome.github.com/Font-Awesome" target="_blank">Font Awesome - http://fortawesome.github.com/Font-Awesome</a></p>\r\n\r\n<p>Add <code>.icon-CLASS_NAME</code> to any element, best used with a <code>&lt;span&gt;</code>.</p>\r\n\r\n<div class="gantry-example">\r\n<h3>Web Icons</h3>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-adjust"> icon-adjust</span><br /><br />\r\n      <span class="icon-asterisk"> icon-asterisk</span><br /><br />\r\n      <span class="icon-ban-circle"> icon-ban-circle</span><br /><br />\r\n      <span class="icon-bar-chart"> icon-bar-chart</span><br /><br />\r\n      <span class="icon-barcode"> icon-barcode</span><br /><br />\r\n      <span class="icon-beaker"> icon-beaker</span><br /><br />\r\n      <span class="icon-bell"> icon-bell</span><br /><br />\r\n      <span class="icon-bolt"> icon-bolt</span><br /><br />\r\n      <span class="icon-book"> icon-book</span><br /><br />\r\n      <span class="icon-bookmark"> icon-bookmark</span><br /><br />\r\n      <span class="icon-bookmark-empty"> icon-bookmark-empty</span><br /><br />\r\n      <span class="icon-briefcase"> icon-briefcase</span><br /><br />\r\n      <span class="icon-bullhorn"> icon-bullhorn</span><br /><br />\r\n      <span class="icon-calendar"> icon-calendar</span><br /><br />\r\n      <span class="icon-camera"> icon-camera</span><br /><br />\r\n      <span class="icon-camera-retro"> icon-camera-retro</span><br /><br />\r\n      <span class="icon-certificate"> icon-certificate</span><br /><br />\r\n      <span class="icon-check"> icon-check</span><br /><br />\r\n      <span class="icon-check-empty"> icon-check-empty</span><br /><br />\r\n      <span class="icon-cloud"> icon-cloud</span><br /><br />\r\n      <span class="icon-cog"> icon-cog</span><br /><br />\r\n      <span class="icon-cogs"> icon-cogs</span><br /><br />\r\n      <span class="icon-comment"> icon-comment</span><br /><br />\r\n      <span class="icon-comment-alt"> icon-comment-alt</span><br /><br />\r\n      <span class="icon-comments"> icon-comments</span><br /><br />\r\n      <span class="icon-comments-alt"> icon-comments-alt</span><br /><br />\r\n      <span class="icon-credit-card"> icon-credit-card</span><br /><br />\r\n      <span class="icon-dashboard"> icon-dashboard</span><br /><br />\r\n      <span class="icon-download"> icon-download</span><br /><br />\r\n      <span class="icon-download-alt"> icon-download-alt</span><br /><br />\r\n      <span class="icon-edit"> icon-edit</span><br /><br />\r\n      <span class="icon-envelope"> icon-envelope</span><br /><br />\r\n      <span class="icon-envelope-alt"> icon-envelope-alt</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-exclamation-sign"> icon-exclamation-sign</span><br /><br />\r\n      <span class="icon-external-link"> icon-external-link</span><br /><br />\r\n      <span class="icon-eye-close"> icon-eye-close</span><br /><br />\r\n      <span class="icon-eye-open"> icon-eye-open</span><br /><br />\r\n      <span class="icon-facetime-video"> icon-facetime-video</span><br /><br />\r\n      <span class="icon-film"> icon-film</span><br /><br />\r\n      <span class="icon-filter"> icon-filter</span><br /><br />\r\n      <span class="icon-fire"> icon-fire</span><br /><br />\r\n      <span class="icon-flag"> icon-flag</span><br /><br />\r\n      <span class="icon-folder-close"> icon-folder-close</span><br /><br />\r\n      <span class="icon-folder-open"> icon-folder-open</span><br /><br />\r\n      <span class="icon-gift"> icon-gift</span><br /><br />\r\n      <span class="icon-glass"> icon-glass</span><br /><br />\r\n      <span class="icon-globe"> icon-globe</span><br /><br />\r\n      <span class="icon-group"> icon-group</span><br /><br />\r\n      <span class="icon-hdd"> icon-hdd</span><br /><br />\r\n      <span class="icon-headphones"> icon-headphones</span><br /><br />\r\n      <span class="icon-heart"> icon-heart</span><br /><br />\r\n      <span class="icon-heart-empty"> icon-heart-empty</span><br /><br />\r\n      <span class="icon-home"> icon-home</span><br /><br />\r\n      <span class="icon-inbox"> icon-inbox</span><br /><br />\r\n      <span class="icon-info-sign"> icon-info-sign</span><br /><br />\r\n      <span class="icon-key"> icon-key</span><br /><br />\r\n      <span class="icon-leaf"> icon-leaf</span><br /><br />\r\n      <span class="icon-legal"> icon-legal</span><br /><br />\r\n      <span class="icon-lemon"> icon-lemon</span><br /><br />\r\n      <span class="icon-lock"> icon-lock</span><br /><br />\r\n      <span class="icon-unlock"> icon-unlock</span><br /><br />\r\n      <span class="icon-magic"> icon-magic</span><br /><br />\r\n      <span class="icon-magnet"> icon-magnet</span><br /><br />\r\n      <span class="icon-map-marker"> icon-map-marker</span><br /><br />\r\n      <span class="icon-minus"> icon-minus</span><br /><br />\r\n      <span class="icon-minus-sign"> icon-minus-sign</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-money"> icon-money</span><br /><br />\r\n      <span class="icon-move"> icon-move</span><br /><br />\r\n      <span class="icon-music"> icon-music</span><br /><br />\r\n      <span class="icon-off"> icon-off</span><br /><br />\r\n      <span class="icon-ok"> icon-ok</span><br /><br />\r\n      <span class="icon-ok-circle"> icon-ok-circle</span><br /><br />\r\n      <span class="icon-ok-sign"> icon-ok-sign</span><br /><br />\r\n      <span class="icon-pencil"> icon-pencil</span><br /><br />\r\n      <span class="icon-picture"> icon-picture</span><br /><br />\r\n      <span class="icon-plane"> icon-plane</span><br /><br />\r\n      <span class="icon-plus"> icon-plus</span><br /><br />\r\n      <span class="icon-plus-sign"> icon-plus-sign</span><br /><br />\r\n      <span class="icon-print"> icon-print</span><br /><br />\r\n      <span class="icon-pushpin"> icon-pushpin</span><br /><br />\r\n      <span class="icon-qrcode"> icon-qrcode</span><br /><br />\r\n      <span class="icon-question-sign"> icon-question-sign</span><br /><br />\r\n      <span class="icon-random"> icon-random</span><br /><br />\r\n      <span class="icon-refresh"> icon-refresh</span><br /><br />\r\n      <span class="icon-remove"> icon-remove</span><br /><br />\r\n      <span class="icon-remove-circle"> icon-remove-circle</span><br /><br />\r\n      <span class="icon-remove-sign"> icon-remove-sign</span><br /><br />\r\n      <span class="icon-reorder"> icon-reorder</span><br /><br />\r\n      <span class="icon-resize-horizontal"> icon-resize-horizontal</span><br /><br />\r\n      <span class="icon-resize-vertical"> icon-resize-vertical</span><br /><br />\r\n      <span class="icon-retweet"> icon-retweet</span><br /><br />\r\n      <span class="icon-road"> icon-road</span><br /><br />\r\n      <span class="icon-rss"> icon-rss</span><br /><br />\r\n      <span class="icon-screenshot"> icon-screenshot</span><br /><br />\r\n      <span class="icon-search"> icon-search</span><br /><br />\r\n      <span class="icon-share"> icon-share</span><br /><br />\r\n      <span class="icon-share-alt"> icon-share-alt</span><br /><br />\r\n      <span class="icon-shopping-cart"> icon-shopping-cart</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-signal"> icon-signal</span><br /><br />\r\n      <span class="icon-signin"> icon-signin</span><br /><br />\r\n      <span class="icon-signout"> icon-signout</span><br /><br />\r\n      <span class="icon-sitemap"> icon-sitemap</span><br /><br />\r\n      <span class="icon-sort"> icon-sort</span><br /><br />\r\n      <span class="icon-sort-down"> icon-sort-down</span><br /><br />\r\n      <span class="icon-sort-up"> icon-sort-up</span><br /><br />\r\n      <span class="icon-star"> icon-star</span><br /><br />\r\n      <span class="icon-star-empty"> icon-star-empty</span><br /><br />\r\n      <span class="icon-star-half"> icon-star-half</span><br /><br />\r\n      <span class="icon-tag"> icon-tag</span><br /><br />\r\n      <span class="icon-tags"> icon-tags</span><br /><br />\r\n      <span class="icon-tasks"> icon-tasks</span><br /><br />\r\n      <span class="icon-thumbs-down"> icon-thumbs-down</span><br /><br />\r\n      <span class="icon-thumbs-up"> icon-thumbs-up</span><br /><br />\r\n      <span class="icon-time"> icon-time</span><br /><br />\r\n      <span class="icon-tint"> icon-tint</span><br /><br />\r\n      <span class="icon-trash"> icon-trash</span><br /><br />\r\n      <span class="icon-trophy"> icon-trophy</span><br /><br />\r\n      <span class="icon-truck"> icon-truck</span><br /><br />\r\n      <span class="icon-umbrella"> icon-umbrella</span><br /><br />\r\n      <span class="icon-upload"> icon-upload</span><br /><br />\r\n      <span class="icon-upload-alt"> icon-upload-alt</span><br /><br />\r\n      <span class="icon-user"> icon-user</span><br /><br />\r\n      <span class="icon-user-md"> icon-user-md</span><br /><br />\r\n      <span class="icon-volume-off"> icon-volume-off</span><br /><br />\r\n      <span class="icon-volume-down"> icon-volume-down</span><br /><br />\r\n      <span class="icon-volume-up"> icon-volume-up</span><br /><br />\r\n      <span class="icon-warning-sign"> icon-warning-sign</span><br /><br />\r\n      <span class="icon-wrench"> icon-wrench</span><br /><br />\r\n      <span class="icon-zoom-in"> icon-zoom-in</span><br /><br />\r\n      <span class="icon-zoom-out"> icon-zoom-out</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="clear"></div>\r\n  <div>\r\n    <h3>Text Editor Icons</h3>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-file"> icon-file</span><br /><br />\r\n      <span class="icon-cut"> icon-cut</span><br /><br />\r\n      <span class="icon-copy"> icon-copy</span><br /><br />\r\n      <span class="icon-paste"> icon-paste</span><br /><br />\r\n      <span class="icon-save"> icon-save</span><br /><br />\r\n      <span class="icon-undo"> icon-undo</span><br /><br />\r\n      <span class="icon-repeat"> icon-repeat</span><br /><br />\r\n      <span class="icon-paper-clip"> icon-paper-clip</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-text-height"> icon-text-height</span><br /><br />\r\n      <span class="icon-text-width"> icon-text-width</span><br /><br />\r\n      <span class="icon-align-left"> icon-align-left</span><br /><br />\r\n      <span class="icon-align-center"> icon-align-center</span><br /><br />\r\n      <span class="icon-align-right"> icon-align-right</span><br /><br />\r\n      <span class="icon-align-justify"> icon-align-justify</span><br /><br />\r\n      <span class="icon-indent-left"> icon-indent-left</span><br /><br />\r\n      <span class="icon-indent-right"> icon-indent-right</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-font"> icon-font</span><br /><br />\r\n      <span class="icon-bold"> icon-bold</span><br /><br />\r\n      <span class="icon-italic"> icon-italic</span><br /><br />\r\n      <span class="icon-strikethrough"> icon-strikethrough</span><br /><br />\r\n      <span class="icon-underline"> icon-underline</span><br /><br />\r\n      <span class="icon-link"> icon-link</span><br /><br />\r\n      <span class="icon-columns"> icon-columns</span><br /><br />\r\n      <span class="icon-table"> icon-table</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-th-large"> icon-th-large</span><br /><br />\r\n      <span class="icon-th"> icon-th</span><br /><br />\r\n      <span class="icon-th-list"> icon-th-list</span><br /><br />\r\n      <span class="icon-list"> icon-list</span><br /><br />\r\n      <span class="icon-list-ol"> icon-list-ol</span><br /><br />\r\n      <span class="icon-list-ul"> icon-list-ul</span><br /><br />\r\n      <span class="icon-list-alt"> icon-list-alt</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="clear"></div>\r\n  <div>\r\n    <h3>Directional Icons</h3>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-arrow-down"> icon-arrow-down</span><br /><br />\r\n      <span class="icon-arrow-left"> icon-arrow-left</span><br /><br />\r\n      <span class="icon-arrow-right"> icon-arrow-right</span><br /><br />\r\n      <span class="icon-arrow-up"> icon-arrow-up</span><br /><br />\r\n      <span class="icon-chevron-down"> icon-chevron-down</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-circle-arrow-down"> icon-circle-arrow-down</span><br /><br />\r\n      <span class="icon-circle-arrow-left"> icon-circle-arrow-left</span><br /><br />\r\n      <span class="icon-circle-arrow-right"> icon-circle-arrow-right</span><br /><br />\r\n      <span class="icon-circle-arrow-up"> icon-circle-arrow-up</span><br /><br />\r\n      <span class="icon-chevron-left"> icon-chevron-left</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-caret-down"> icon-caret-down</span><br /><br />\r\n      <span class="icon-caret-left"> icon-caret-left</span><br /><br />\r\n      <span class="icon-caret-right"> icon-caret-right</span><br /><br />\r\n      <span class="icon-caret-up"> icon-caret-up</span><br /><br />\r\n      <span class="icon-chevron-right"> icon-chevron-right</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-hand-down"> icon-hand-down</span><br /><br />\r\n      <span class="icon-hand-left"> icon-hand-left</span><br /><br />\r\n      <span class="icon-hand-right"> icon-hand-right</span><br /><br />\r\n      <span class="icon-hand-up"> icon-hand-up</span><br /><br />\r\n      <span class="icon-chevron-up"> icon-chevron-up</span><br /><br />\r\n    </div>\r\n  </div>\r\n<div class="clear"></div>\r\n  <div>\r\n    <h3>Video Player Icons</h3>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-play-circle"> icon-play-circle</span><br /><br />\r\n      <span class="icon-play"> icon-play</span><br /><br />\r\n      <span class="icon-pause"> icon-pause</span><br /><br />\r\n      <span class="icon-stop"> icon-stop</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-step-backward"> icon-step-backward</span><br /><br />\r\n      <span class="icon-fast-backward"> icon-fast-backward</span><br /><br />\r\n      <span class="icon-backward"> icon-backward</span><br /><br />\r\n      <span class="icon-forward"> icon-forward</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-fast-forward"> icon-fast-forward</span><br /><br />\r\n      <span class="icon-step-forward"> icon-step-forward</span><br /><br />\r\n      <span class="icon-eject"> icon-eject</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-fullscreen"> icon-fullscreen</span><br /><br />\r\n      <span class="icon-resize-full"> icon-resize-full</span><br /><br />\r\n      <span class="icon-resize-small"> icon-resize-small</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="clear"></div>\r\n  <div>\r\n    <h3>Social Icons</h3>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-phone"> icon-phone</span><br /><br />\r\n      <span class="icon-phone-sign"> icon-phone-sign</span><br /><br />\r\n      <span class="icon-facebook"> icon-facebook</span><br /><br />\r\n      <span class="icon-facebook-sign"> icon-facebook-sign</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-twitter"> icon-twitter</span><br /><br />\r\n      <span class="icon-twitter-sign"> icon-twitter-sign</span><br /><br />\r\n      <span class="icon-github"> icon-github</span><br /><br />\r\n      <span class="icon-github-sign"> icon-github-sign</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-linkedin"> icon-linkedin</span><br /><br />\r\n      <span class="icon-linkedin-sign"> icon-linkedin-sign</span><br /><br />\r\n      <span class="icon-pinterest"> icon-pinterest</span><br /><br />\r\n      <span class="icon-pinterest-sign"> icon-pinterest-sign</span><br /><br />\r\n    </div>\r\n  </div>\r\n  <div class="gantry-width-25 gantry-width-block">\r\n    <div class="gantry-width-spacer">\r\n      <span class="icon-google-plus"> icon-google-plus</span><br /><br />\r\n      <span class="icon-google-plus-sign"> icon-google-plus-sign</span><br /><br />\r\n      <span class="icon-sign-blank"> icon-sign-blank</span><br /><br />\r\n    </div>\r\n  </div>\r\n<div class="clear"></div>\r\n</div>\r\n<pre class="prettyprint linenums">&lt;span class="icon-CLASS_NAME"&gt;\r\n  ...\r\n&lt;/span&gt;\r\n&lt;span class="icon-download"&gt;\r\n  ...\r\n&lt;/span&gt;</pre>\r\n\r\n<div class="clear"></div>\r\n\r\n<!-- Notice\r\n================================================== -->\r\n<p><em>The documented typography above is a modified version of the reference guide available at: <a href="http://twitter.github.com/bootstrap/base-css.html">http://twitter.github.com/bootstrap/base-css.html</a></em></p>', '', 1, 0, 0, 11, '2012-10-08 13:18:03', 97, '', '2012-11-01 13:14:22', 632, 0, '0000-00-00 00:00:00', '2012-10-08 13:18:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, 8, '', '', 1, 99, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `tbl_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(5, 47, 'Menu Options', 'menu-options', '', '<p class="error">RokNavMenu is the core of all the powerful Metropolis menu system. Please ensure you are using the latest version of RokNavMenu, available <a href="http://www.rockettheme.com/extensions-joomla/roknavmenu" target="_blank">here</a>.</p>\r\n\r\n<h2>Dropdown Menu</h2>\r\n\r\n<p>The <strong>Dropdown Menu</strong> is an advanced CSS drive dropdown menu system. It offers advanced structural features such as multiple columns, inline icons and text, inline modules and positions, custom column widths, item distribution and menu offset. All of these are configurable for each menu item.</p>\r\n\r\n<div class="rt-image">\r\n  <img src="images/rocketlauncher/menu-options/dropdownmenu.jpg" alt="Dropdown Menu" />\r\n</div>\r\n\r\n<div class="clear largemarginbottom">&nbsp;</div><br />\r\n\r\n<h2>SplitMenu</h2>\r\n\r\n<p>A static menu system that displays 1st level items in the main horizontal menu and further children in the Sidebar.</p>\r\n\r\n<div class="rt-image">\r\n  <img src="images/rocketlauncher/menu-options/splitmenu.jpg" alt="SplitMenu" />\r\n</div>\r\n\r\n<div class="clear largemarginbottom">&nbsp;</div><br />\r\n\r\n<p class="notice">All Menu Items can be edited from <strong>Admin &rarr; Menu &rarr; <em>Menu Name</em> &rarr; <em>Menu Item</em></strong>.</p>\r\n\r\n<br />\r\n\r\n<p class="rt-image rt-floatleft nomarginbottom">\r\n<img class="rt-noborder" src="images/rocketlauncher/features/responsive-nav.png" alt="image" width="200px" height="auto" />\r\n</p>\r\n\r\n<h2>Responsive Mode: Smartphone</h2>\r\n\r\n<p>For mobile devices, there are two options, a dropdown panel menu with items in a tree format or a select box using the browsers own UI elements. Chose a format in the template''s menu settings.</p>\r\n\r\n<p>The mobile menu is active for both the Dropdown Menu and SplitMenu.</p>\r\n\r\n<div class="clear"></div><br />\r\n\r\n<h2>Creating child menu items</h2>\r\n\r\n<p>Go to <strong>Admin &rarr; Menu &rarr; <em>A Menu</em> &rarr; <em>A Menu Item</em> &rarr; Select a <em>Parent Item</em></strong>, and it will appear as a child of it.</p>\r\n\r\n<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img src="images/rocketlauncher/menu-options/childmenu-1.jpg" alt="image" />\r\n    </div> \r\n  </div>\r\n</div>\r\n\r\n<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img src="images/rocketlauncher/menu-options/childmenu-2.jpg" alt="image" />\r\n    </div>  \r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div>\r\n', '', 1, 0, 0, 11, '2012-10-08 13:18:19', 97, '', '2012-11-01 19:35:52', 632, 0, '0000-00-00 00:00:00', '2012-10-08 13:18:19', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 0, 7, '', '', 1, 116, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 48, 'Integrated Extensions', 'integrated-extensions', '', '<div class="rt-center largemargintop largemarginbottom">\r\n  <span class="promo2">Integrated Extensions</span><br />\r\n  <span class="promo3">Enhance Your Website with the <strong>Powerful Tools</strong></span>\r\n</div>\r\n\r\n<div class="clear"></div>\r\n\r\n<div class="rt-center">\r\n<a target="_blank" href="http://www.rockettheme.com/joomla-templates/metropolis" class="readon promo1 medmargintop"><span><span class="icon-download-alt"></span> Download</span></a>\r\n</div>', '', 1, 0, 0, 11, '2012-10-08 13:18:36', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 13:18:36', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 6, '', '', 1, 100, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 49, 'Tutorials and Guides', 'tutorials-and-guides', '', '<p>Metropolis for Joomla is a RocketTheme Joomla Template Club release featuring the revolutionary Gantry Joomla Template Framework. Gantry is a comprehensive set of building blocks to enable the rapid development and realization of a design into a flexible and powerful web platform theme.</p>\r\n\r\n<p class="info">To configure the template, navigate to <strong>Extensions &rarr; Template Manager &rarr; <em>rt_metropolis</em></strong>. Mouseover the labels to view a description of each parameter.</p>', '', 1, 0, 0, 11, '2012-10-08 13:19:04', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 13:19:04', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 5, '', '', 1, 75, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 50, 'Installation Instructions', 'installation-instructions', '', '<p>The following is a guide that covers how to set up your new <strong>Metropolis</strong> template on your Joomla! site. Here you can find an overview of the files included in the Metropolis release and instructions on installing and activating the template in your Joomla! install.</p>\r\n\r\n<p class="info nomarginbottom"><strong>Note:</strong> The <strong>Bundle</strong> Template is only necessary if the Gantry Library is not installed at <strong>/libraries/gantry directory</strong>.</p>\r\n\r\n<br />\r\n\r\n<h3>Step 1 - Installation</h3>\r\n\r\n<ol class="largemarginbottom">\r\n  <li>Install from <strong>Admin &rarr; Extensions &rarr; Extensions Manager</strong></li>\r\n  <li>Browse for <strong>rt_metropolis.zip</strong> and click <strong>Upload &amp; Install</strong></li>  \r\n</ol>\r\n\r\n<div class="rt-image">\r\n  <img alt="Image" src="images/rocketlauncher/installation/installation-1.jpg" />\r\n</div>\r\n<br />\r\n<div class="rt-image">\r\n  <img alt="Image" src="images/rocketlauncher/installation/installation-j30-1.jpg" />\r\n</div>\r\n\r\n<div class="clear">&nbsp;</div>\r\n\r\n<br />\r\n\r\n<h3>Step 2 - Template Default</h3>\r\n\r\n<ol class="largemarginbottom">\r\n  <li>Make the template default at <strong>Admin &rarr; Extensions &rarr; Template Manager</strong></li>\r\n  <li>Select <strong>rt_metropolis</strong></li>\r\n  <li>Press <strong>Make Default</strong></li>\r\n</ol>\r\n\r\n<div class="rt-image">\r\n  <img alt="Image" src="images/rocketlauncher/installation/installation-2.jpg" />\r\n</div>\r\n<br />\r\n<div class="rt-image">\r\n  <img alt="Image" src="images/rocketlauncher/installation/installation-j30-2.jpg" />\r\n</div>\r\n\r\n<div class="clear largemarginbottom">&nbsp;</div><br />\r\n\r\n<h2>RocketLauncher Instructions</h2>\r\n\r\n<p class="nomarginbottom">We always recommend installing a <strong>RocketLauncher</strong> first to trial and understand the template more effectively. It must be installed as <strong>new</strong>, and <strong>not</strong> over an existing Joomla install.</p>\r\n\r\n<br />\r\n\r\n<h3>Step 1 - Upload</h3>\r\n\r\n<ul class="medmarginbottom">\r\n  <li><strong>Download</strong> the RocketLauncher</li>\r\n  <li><strong>Unzip</strong> the file</li>\r\n  <li><strong>Upload</strong> the created folder to your server</li>\r\n</ul>\r\n\r\n<p class="info nomarginbottom"><strong>Note:</strong> You can upload all the files via FTP, or use cPanel or SSH to upload the zip and unzip directly onto the server. Enquire with your hosting provider.</p>\r\n\r\n<br />\r\n\r\n<h3>Step 2 - Installation</h3>\r\n\r\n<ul>\r\n  <li>Go to <a href="#">www.yoursite.com/<em>*folder name*</em></a></li>\r\n  <li>Follow the Installation instructions</li>\r\n  <li>Ensure you click <em class="bold2">Install Sample Data</em> during installation</li>\r\n  <li>Remove the installation folder in the Installation interface</li>\r\n</ul>\r\n', '', 1, 0, 0, 11, '2012-10-08 13:19:23', 97, '', '2012-11-01 12:38:40', 632, 0, '0000-00-00 00:00:00', '2012-10-08 13:19:23', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 4, '', '', 1, 59, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 51, 'Logo Editing', 'logo-editing', '', '<p>There are two methods of changing the Metropolis logo: <strong>via the logo picker</strong> and <strong>manual</strong> change.</p>\r\n\r\n<h3>The Logo Picker</h3>\r\n\r\n<ol>\r\n  <li>Enable <strong>Logo</strong> and set to <strong>Custom</strong> at <em>Admin &rarr; Extensions &rarr; Templates Manager &rarr; rt_metropolis &rarr; Features.</em></li>\r\n  <li>Set <strong>Logo Picker</strong> to either <strong>RokGallery</strong> or <strong>MediaManager</strong>.</li>\r\n  <li><strong>Select</strong> your logo, <strong>Insert</strong> and <strong>Save</strong></li>\r\n</ol>\r\n\r\n<br />\r\n\r\n<div class="rt-image">\r\n  <img src="images/rocketlauncher/logo-editing/logo-panel.jpg" alt="Logo Panel" />\r\n</div>\r\n\r\n<div class="clear largemarginbottom">&nbsp;</div><br />\r\n\r\n<div class="rt-image">\r\n  <img src="images/rocketlauncher/logo-editing/select-logo.jpg" alt="Select Logo" />\r\n</div>\r\n\r\n<div class="clear largemarginbottom">&nbsp;</div><br />\r\n\r\n<h3>Manual Change</h3>\r\n\r\n<ol>\r\n  <li>Enable <strong>Logo</strong> and set <strong>Type</strong> to <strong>Metropolis</strong>.</li>\r\n  <li>Upload <strong>logo.png</strong> to the <br /><strong> /templates/rt_metropolis/images/logo/#style/</strong> directory</li>\r\n  <li>Clear your browser cache and refresh.</li>\r\n</ol>\r\n\r\n<div class="clear"></div><br />\r\n\r\n<p>If you cannot see your new logo, ensure you have uploaded it to the right directory and the directory permissions are writeable. Enquire with your hosting provider.</p>\r\n\r\n<a target="_blank" href="http://www.rockettheme.com/joomla-templates/metropolis" class="readon"><span>Download Sources Here</span></a>\r\n\r\n<div class="clear"></div>\r\n', '', 1, 0, 0, 11, '2012-10-08 13:19:37', 97, '', '2012-11-01 11:15:18', 632, 0, '0000-00-00 00:00:00', '2012-10-08 13:19:37', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 3, '', '', 1, 22, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 52, 'Preset Styles', 'preset-styles', '', '<p>The <strong>Style Settings</strong> panel in the Gantry based theme administration interface provides several options for configuring the main built in stylistic aspects of the template.</p>\r\n\r\n<div class="rt-image">\r\n  <img src="images/rocketlauncher/styles/admin-style-panel.jpg" alt="Style" />\r\n</div>\r\n\r\n<br />\r\n\r\n<p>Gantry also provides the ability for you to create your own custom presets based on any parameter in the theme administrator. You should determine which parameters you wish to configure to be a part of the presets.</p>\r\n\r\n<div class="clear"></div>\r\n\r\n<br />\r\n\r\n<h2>Assigning a Style</h2>\r\n\r\n<p>With Gantry, the ability to assign a certain style to an individual page has never been easier and/or more efficient. Just follow these simple steps:</p>\r\n\r\n<ul>\r\n  <li>Go to <strong>Extensions → Template Manager → rt_metropolis &rarr; Assignments &rarr; <em>*Menu Item*</em></strong></li>  \r\n  <li>Select your preset from <strong>Show Presets</strong>, configure and save.</li>\r\n</ul>\r\n\r\n<br />\r\n\r\n<p>After setting your defaults to the desired values, select the Menu Items button and choose the menu item you wish to modify the parameters for. You will then see a series of checkboxes on the left of all the supported parameters.</p>\r\n\r\n<p>Select the checkbox next to the parameter you wish to modify, it will then become active, and you can modify as you wish. Clicking “<strong>Save</strong>” in the toolbar will then save this configuration.</p>\r\n\r\n<a href="http://gantry-framework.org/documentation/joomla/configure/style" class="readon largemargintop"><span>Gantry Framework: Style Configuration</span></a>\r\n', '', 1, 0, 0, 11, '2012-10-08 13:19:53', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 13:19:53', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 2, '', '', 1, 111, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 53, 'About Joomla!', 'about-joomla', '', '<h3>What is Joomla?</h3>\r\n<p>Joomla is an award-winning content management system (CMS), which enables you to build Web sites and powerful online applications. Many aspects, including its ease-of-use and extensibility, have made Joomla the most popular Web site software available. Best of all, Joomla is an open source solution that is freely available to everyone.</p>\r\n\r\n<p>With millions of websites running on Joomla, the software is used by individuals, small &amp; medium-sized businesses, and large organizations worldwide to easily create &amp; build a variety of websites &amp; web-enabled applications.</p>\r\n\r\n<h3>What Joomla! can do?</h3>\r\n<p>Joomla is used all over the world to power Web sites of all shapes and sizes. For example:</p>\r\n<ul>\r\n  <li>Corporate Web sites or portals</li>\r\n  <li>Corporate intranets and extranets</li>\r\n  <li>Online magazines, newspapers, and publications</li>\r\n  <li>E-commerce and online reservations</li>\r\n  <li>Government applications</li>\r\n  <li>Small business Web sites</li>\r\n  <li>Non-profit and organizational Web sites</li>\r\n  <li>Community-based portals</li>\r\n  <li>School and church Web sites</li>\r\n  <li>Personal or family homepages</li>\r\n</ul>\r\n\r\n<br />\r\n\r\n<h3>Site and Administrator</h3>\r\n<p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the "Site Administrator" link on the "This Site" menu or by adding /administrator to the end of you domain name.</p>\r\n<p>Log in to the administrator using the username and password created during the installation of Joomla.</p>\r\n\r\n<h3>Learn More</h3>\r\n<p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href="http://docs.joomla.org" target="_blank">Joomla! documentation site</a> and on the<a href="http://forum.joomla.org" target="_blank"> Joomla! forums</a>.</p>\r\n\r\n<a href="http://www.joomla.org/" target="_blank" class="readon"><span>Visit Joomla!</span></a>', '', 1, 0, 0, 11, '2012-10-08 13:20:08', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 13:20:08', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 1, '', '', 1, 118, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 55, 'Donec Nunc Magna Posuere', 'donec-nunc-magna-posuere', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 13:59:57', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 13:59:57', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 9, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 56, 'Lorem Ipsum Dolor Sit Amet', 'lorem-ipsum-dolor-sit-amet', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 14:00:14', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 14:00:14', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 8, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 57, 'Vestibulum Dapibus Est Nulla', 'vestibulum-dapibus-est-nulla', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 14:00:33', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 14:00:33', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 7, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(15, 58, 'Nec Libero Laoreet Faucibus', 'nec-libero-laoreet-faucibus', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 14:00:51', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 14:00:51', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 6, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 59, 'Sed Imperdiet Ligula Nisi', 'sed-imperdiet-ligula-nisi', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 14:01:12', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 14:01:12', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 5, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(17, 60, 'Massa Diam Tristique Urna', 'massa-diam-tristique-urna', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 14:01:31', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 14:01:31', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 4, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(18, 61, 'Sapien Eros Consetur Dolor', 'sapien-eros-consetur-dolor', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 14:01:51', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 14:01:51', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 3, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(19, 62, 'Maecenas Varius Neque Nec', 'maecenas-varius-neque-nec', '', '<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit. Etiam dapibus, tellus ac ornare aliquam, massa diam tristique urna, id faucibus lectus erat ut pede.</p>\r\n\r\n<p>Maecenas varius neque nec libero laoreet faucibus. Phasellus sodales, lectus sed vulputate rutrum, ipsum nulla lacinia magna, sed imperdiet ligula nisi eu ipsum. Donec nunc magna, posuere eget, aliquam in, vulputate in, lacus.</p>\r\n\r\n', '\r\n\r\n<p>In erat. Pellentesque erat. Mauris vehicula vestibulum justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla pulvinar est. Integer urna. Pellentesque pulvinar dui a magna. Nulla facilisi.</p>\r\n\r\n<p>Proin imperdiet. Aliquam ornare, metus vitae gravida dignissim, nisi nisl ultricies felis, ac tristique enim pede eget elit. Integer non erat nec turpis sollicitudin malesuada. Vestibulum dapibus. Nulla facilisi. Nulla iaculis, leo sit amet mollis luctus, sapien eros consecetur dolor, eu faucibus elit nibh eu nibh. Maecenas lacus pede, lobortis non, rhoncus id, tristique a, mi. Cras auctor libero vitae sem vestibulum euismod. Nunc fermentum.</p>', 1, 0, 0, 12, '2012-10-08 14:02:09', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-08 14:02:09', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(20, 67, 'Music', 'music', '', '<p>This is the most popular Guitarist</p>\r\n<a href="index.php?option=com_content&view=article&id=11&catid=11"><img src="images/images.jpg" alt="" /></a>', '', 1, 0, 0, 14, '2012-10-12 14:43:51', 97, '', '2013-05-02 04:54:15', 97, 0, '0000-00-00 00:00:00', '2012-10-12 14:43:51', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"1","show_article_options":"1","show_urls_images_backend":"1","show_urls_images_frontend":"1"}', 14, 0, 11, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(21, 68, 'Framework', 'framework', '', '<style>\r\n    .component-block.rt-block.main-overlay-light\r\n    {\r\n        display:none;\r\n    }\r\n</style>\r\n<p>The Gantry Framework sits at the core of the template, providing the base for the major features and functions, such as the responsive grid.</p>', '', 1, 0, 0, 2, '2012-10-12 14:44:35', 97, '', '2013-05-07 10:24:46', 97, 0, '0000-00-00 00:00:00', '2012-10-12 14:44:35', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","alternative_readmore":"","article_layout":"_:default","show_publishing_options":"0","show_article_options":"0","show_urls_images_backend":"0","show_urls_images_frontend":"0"}', 34, 0, 2, '', '', 1, 1678, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(22, 69, 'Site Speed', 'site-speed', '', '<p>Increase the speed of your site by enabling the RokBooster plug-in which will compress and combine your CSS &amp; JavaScript into as few files as possible</p>', '', 1, 0, 0, 14, '2012-10-12 14:45:02', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-12 14:45:02', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 10, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(23, 70, 'Presets', 'presets', '', '<p>Metropolis has 10 stunning preset style variations to choose from, as well as configure from the Gantry administrator, in addition to custom module variations.</p>', '', 1, 0, 0, 14, '2012-10-12 14:45:56', 97, '', '2012-11-01 12:39:48', 632, 0, '0000-00-00 00:00:00', '2012-10-12 14:45:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 9, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(24, 71, 'Menus', 'menus', '', '<p>There are two menu options available: Dropdown, a CSS driven dropdown menu, and SplitMenu, a static menu.</p>', '', 1, 0, 0, 14, '2012-10-12 14:46:45', 97, '', '2012-11-01 12:39:08', 632, 0, '0000-00-00 00:00:00', '2012-10-12 14:46:45', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 8, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(25, 72, 'K2 Styling', 'k2-styling', '', '<p>Metropolis has styled, including responsive, support for the popular third party content / CCK extension by JoomlaWorks.gr, K2.</p>', '', 1, 0, 0, 14, '2012-10-12 14:47:21', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-12 14:47:21', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 7, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(26, 73, '78 Positions', '78-positions', '', '<p>A vast module positions assortment, spread over Gantry Grid Rows, split into groupings of six, for maximum flexibility</p>', '', 1, 0, 0, 14, '2012-10-12 14:47:53', 97, '', '2012-11-01 12:56:55', 632, 0, '0000-00-00 00:00:00', '2012-10-12 14:47:53', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 6, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(27, 74, 'Logo Picker', 'logo-picker', '', '<p>There are two methods of changing the Metropolis logo, via the logo picker or by manual change. Choose the logo from RokGallery or Media Manager.</p>', '', 1, 0, 0, 14, '2012-10-12 14:49:23', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-12 14:49:23', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 5, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `tbl_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(28, 75, 'RokSprocket', 'roksprocket', '', '<p>A powerful switchblade content extension, that provides an array of display options, all within one single modular framework with an intuitive interface.</p>', '', 1, 0, 0, 14, '2012-10-12 14:49:56', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-12 14:49:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 4, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(29, 76, 'Suffixes', 'suffixes', '', '<p>Metropolis has a range of module class suffixes, both stylistic and structural that allow you to individualize a module to create unique layouts &amp; appearances.</p>', '', 1, 0, 0, 14, '2012-10-12 14:51:14', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-12 14:51:14', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 3, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(30, 77, 'Search', 'search', '', '<p>Use RokAjaxSearch, a Ajax powered search extension, as a search solution for your site, with local and Google support.</p>', '', 1, 0, 0, 14, '2012-10-12 14:51:47', 97, '', '2012-11-01 12:40:40', 632, 0, '0000-00-00 00:00:00', '2012-10-12 14:51:47', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(31, 78, 'Extensions', 'extensions', '', '<p>Metropolis has styled, including responsive, support for the popular third party content / CCK extension by JoomlaWorks.gr, K2.</p>', '', 1, 0, 0, 14, '2012-10-12 14:52:23', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-10-12 14:52:23', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(32, 79, 'Featured', 'featured', '', '<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <span class="rt-image">\r\n      <img alt="image" src="images/rocketlauncher/frontpage/roksprocket-tabs/img1.jpg" />\r\n    </span>\r\n  </div>\r\n</div>\r\n\r\n<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <h4 class="nomargintop medmarginbottom">RokSprocket</h4>\r\n    <p><span class="visible-tablet">A powerful content-centric addon with multiple layouts, such as Tabs or Lists.</span><span class="hidden-tablet">A powerful content-centric extension with Mosaic, Lists, Headlines, Tabs and Features layout modes.</span><span class="visible-large medmargintop">RokSprocket has a combined and intuitive administrative inferface for all layout types, for quick and easy setup.</span></p>\r\n    <a class="readon" href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113"><span>Read More</span></a>\r\n  </div>\r\n</div>', '', 1, 0, 0, 15, '2012-10-12 15:03:30', 97, '', '2013-04-26 07:10:14', 97, 0, '0000-00-00 00:00:00', '2012-10-12 15:03:30', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 16, 0, 3, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(33, 80, 'Popular', 'popular', '', '<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <h4 class="nomargintop medmarginbottom">Utilities</h4>\r\n    <p><span class="visible-tablet">RokBooster is a CSS/JS compression plugin to increase site performance.</span><span class="hidden-tablet">RokBooster is a CSS/JS compression plugin to increase site performance with configurable exemptions.</span><span class="visible-large medmargintop">RokPad is an advanced code editor with code highlighting, ajax save, a code toolbar and much more.</span></p>\r\n    <a class="readon" href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113"><span>Read More</span></a>\r\n  </div>\r\n</div>\r\n\r\n<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <span class="rt-image">\r\n      <img alt="image" src="images/rocketlauncher/frontpage/roksprocket-tabs/img2.jpg" />\r\n    </span>\r\n  </div>\r\n</div>', '', 1, 0, 0, 15, '2012-10-12 15:04:30', 97, '', '2013-04-26 07:05:27', 97, 97, '2013-04-26 07:05:27', '2012-10-12 15:04:30', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 9, 0, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(34, 81, 'Latest', 'latest', '', '<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <span class="rt-image">\r\n      <img alt="image" src="images/rocketlauncher/frontpage/roksprocket-tabs/img3.jpg" />\r\n    </span>\r\n  </div>\r\n</div>\r\n\r\n<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <h4 class="nomargintop medmarginbottom">K2 Styling</h4>\r\n    <p><span class="visible-tablet">K2 is a CCK extension from JoomlaWorks.gr (third party)</span><span class="hidden-tablet">K2 is a CCK (Content Control Kit) extension by JoomlaWorks.gr which expands Joomla''s content.</span><span class="visible-large medmargintop">The template has integrated styling for K2, adding stylistics tweaks for a seamless appearance.</span></p>\r\n    <a class="readon" href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113"><span>Read More</span></a>  </div>\r\n</div>', '', 0, 0, 0, 15, '2012-10-12 15:05:07', 97, '', '2013-04-26 07:00:22', 97, 0, '0000-00-00 00:00:00', '2012-10-12 15:05:07', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 10, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(35, 82, 'Random', 'random', '', '<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <h4 class="nomargintop medmarginbottom">RokAjaxSearch</h4>\r\n    <p><span class="visible-tablet">An AJAX powered searching solution with both local and Google support.</span><span class="hidden-tablet">An AJAX powered searching solution with both local (Joomla) and Google searching capabilities.</span><span class="visible-large medmargintop">Enter an API key from Google and do custom searches for images, videos, blogs and others.</span></p>\r\n    <a class="readon" href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113"><span>Read More</span></a>\r\n  </div>\r\n</div>\r\n\r\n<div class="rt-demo-block gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <span class="rt-image">\r\n      <img alt="image" src="images/rocketlauncher/frontpage/roksprocket-tabs/img2.jpg" />\r\n    </span>\r\n  </div>\r\n</div>', '', 1, 0, 0, 15, '2012-10-12 15:05:41', 97, '', '2013-04-26 07:10:46', 97, 97, '2013-04-26 07:10:46', '2012-10-12 15:05:41', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 0, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(36, 83, 'How to Install', 'how-to-install', '', 'Install the bundle package for quick setup of the template elements such as Gantry and RokNavMenu.', '', 1, 0, 0, 16, '2012-10-12 15:07:26', 97, '', '2012-11-01 10:54:34', 632, 0, '0000-00-00 00:00:00', '2012-10-12 15:07:26', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 11, 0, 2, '', '', 1, 6, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(37, 84, 'Editing the Logo', 'editing-the-logo', '', 'We provide Adobe® Fireworks Layered PNG sources for logo editing.', '', 1, 0, 0, 16, '2012-10-12 15:07:52', 97, '', '2012-10-26 09:48:04', 632, 0, '0000-00-00 00:00:00', '2012-10-12 15:07:52', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 6, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(38, 85, 'Demo Replication', 'demo-content-replica', '', 'Copy the demo with an edited full Joomla installation package.', '', 1, 0, 0, 16, '2012-10-12 15:08:27', 97, '', '2013-04-09 01:01:31', 97, 0, '0000-00-00 00:00:00', '2012-10-12 15:08:27', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 7, 0, 0, '', '', 1, 27, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(39, 90, 'About Us', 'about-us', '', '<h2>Welcome to About us page', '</h2>\r\n\r\n', 1, 0, 0, 12, '2013-04-08 07:00:13', 97, '', '2013-04-26 06:08:38', 97, 0, '0000-00-00 00:00:00', '2013-04-08 07:00:13', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 34, 0, 1, '', '', 1, 104, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(40, 93, 'calender', 'calender', '', '<iframe src="https://www.google.com/calendar/embed?src=nbijpjkapkbd3f9cvp0qsbi618%40group.calendar.google.com&ctz=Asia/Phnom_Penh" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>', '', -2, 0, 0, 12, '2013-04-18 03:30:54', 97, '', '2013-04-18 03:37:45', 97, 0, '0000-00-00 00:00:00', '2013-04-18 03:30:54', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(41, 94, 'talent', 'talent', '', 'talent', '', 0, 0, 0, 2, '2013-05-02 03:20:12', 97, '', '2013-05-20 02:39:23', 97, 0, '0000-00-00 00:00:00', '2013-05-02 03:20:12', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, 1, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(42, 96, 'Video', 'video', '', '{videobox}q5zVB7TZs9I{/videobox}', '', 1, 0, 0, 2, '2013-05-08 03:58:48', 97, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-05-08 03:58:48', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 21, '{"robots":"","author":"","rights":"this video is for testing ","xreference":""}', 0, '*', ''),
(43, 99, 'News Feed ', 'news-feed', '', '[h5]{what the fuck are you testing}[/h5]', '', 1, 0, 0, 14, '2013-05-31 06:14:25', 97, '', '2013-05-31 06:14:30', 97, 97, '2013-06-03 08:11:59', '2013-05-31 06:14:25', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 0, '', '', 1, 58, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `tbl_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content_rating`
--

CREATE TABLE IF NOT EXISTS `tbl_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `tbl_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_extensions`
--

CREATE TABLE IF NOT EXISTS `tbl_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10109 ;

--
-- Dumping data for table `tbl_extensions`
--

INSERT INTO `tbl_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{"cachetimeout":"6"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"target":"0","count_clicks":"1","icons":2,"link_icons":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_num_links":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_links_cat":"1","show_pagination_limit":"1","show_headings":"0","show_link_description":"1","show_link_hits":"1","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"0","show_readmore_title":"0","readmore_limit":"100","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"0","show_publishing_options":"0","show_article_options":"0","show_urls_images_frontend":"0","show_urls_images_backend":"0","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"0","show_subcat_desc":"0","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"0","show_cat_num_articles_cat":"0","num_leading_articles":"0","num_intro_articles":"4","num_columns":"1","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"0","filter_field":"hide","show_headings":"0","list_show_date":"0","date_format":"","list_show_hits":"0","list_show_author":"0","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"0","show_feed_link":"0","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"1","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"11.4","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 0, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 1, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2013","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.4.1","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 14, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0);
INSERT INTO `tbl_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 11, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 12, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 18, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 15, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 13, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"2.5.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.5","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.5","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.9","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(800, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'gantry', 'component', 'com_gantry', '', 0, 1, 0, 0, '{"legacy":false,"name":"Gantry","type":"component","creationDate":"April 1, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"4.1.9","description":"Gantry Starting Template for Joomla! v4.1.9","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'System - Gantry', 'plugin', 'gantry', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - Gantry","type":"plugin","creationDate":"April 1, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"4.1.9","description":"Gantry System Plugin for Joomla","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10005, 'System - RokExtender', 'plugin', 'rokextender', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - RokExtender","type":"plugin","creationDate":"October 31, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.0.0","description":"System - Gantry","group":""}', '{"registered":"\\/modules\\/mod_roknavmenu\\/lib\\/RokNavMenuEvents.php,\\/modules\\/mod_rokminievents\\/lib\\/RokMiniEventsPlugin.php"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10006, 'RokNavMenu', 'module', 'mod_roknavmenu', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokNavMenu","type":"module","creationDate":"October 31, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.0.0","description":"RocketTheme Customizable Navigation Menu","group":""}', '{"limit_levels":"0","startLevel":"0","endLevel":"0","showAllChildren":"0","filteringspacer2":"","theme":"default","custom_layout":"default.php","custom_formatter":"default.php","cache":"0","module_cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'RokAjaxSearch', 'module', 'mod_rokajaxsearch', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokAjaxSearch","type":"module","creationDate":"November 1, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.3.0","description":"RokAjaxSearch is an ajaxian searcher that displays the results immediately and allows to choose the\\n        proper one.\\n    ","group":""}', '{"moduleclass_sfx":"","search_page":"index.php?option=com_search&view=search&tmpl=component","adv_search_page":"index.php?option=com_search&view=search","spacer_style_options":"","include_css":"1","theme":"blue","spacer_advanced_search":"","searchphrase":"any","ordering":"newest","limit":"10","perpage":"3","websearch":"0","blogsearch":"0","imagesearch":"0","videosearch":"0","websearch_api":"","show_pagination":"1","safesearch":"MODERATE","image_size":"MEDIUM","show_estimated":"1","spacer_advanced_settings":"","hide_divs":"","include_link":"1","show_description":"1","include_category":"1","show_readmore":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 'Editor - RokPad', 'plugin', 'rokpad', 'editors', 0, 1, 1, 0, '{"legacy":false,"name":"Editor - RokPad","type":"plugin","creationDate":"April 4, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.1.4","description":"\\n        <div class=\\"rokpad-description\\">\\n        <img src=\\"..\\/plugins\\/editors\\/rokpad\\/assets\\/admin\\/images\\/rokpad.jpg\\" class=\\"img-padding\\" \\/><h1>RokPad<\\/h1>\\n        <h2>The Power of Desktop Text Editor in a Joomla!<\\/h2>\\n        <p>Ever wished you could use a powerful desktop text editor such as Textmate, SublimeText, or UltraEdit directly on a Joomla! web site?  Now with RokPad we provide many features and capabilities that traditionally would only be found in a powerful desktop editor.  RokPad provides advanced functions such as an Ajax saving action, syntax highlighting, configurable themes, multiple cursors and selections, shortcut keys, multiple language support, and many other incredible features.<\\/p>\\n\\n        <h2>Key Features:<\\/h2>\\n        <ul class=\\"features\\">\\n\\t\\t\\t<li>Code Highlighter built on the great ACE Editor<\\/li>\\n\\t        <li>Support for CSS, HTML, JavaScript, JSON, LESS, Markdown, PHP, SQL, Plain Text, Textile, XML and more...<\\/li>\\n\\t        <li>Ajax save and Automatic Save options. You''ll never loose your content again, nor wait until the page has finished reloading after a save!<\\/li>\\n\\t        <li>Save, Undo, Redo, Goto line, Advanced Search and Search &amp; Replace, Full Screen. Settings like Themes, Font Size, Code Folding, Wrap Mode, Invisible Characters, Print Margin, Highlight of selected word<\\/li>\\n\\t        <li>26 Themes to choose from<\\/li>\\n\\t        <li>Resizable Editor by dragging the Statusbar<\\/li>\\n\\t        <li>Keyboard shortcuts<\\/li>\\n\\t        <li>Brackets match<\\/li>\\n\\t        <li>Multiple cursors and selections<\\/li>\\n\\t        <li>Vertical Selection<\\/li>\\n\\t        <li>Ability to insert at multiple locations xtd-buttons shortcodes, all at once.<\\/li>\\n\\t        <li>Shortcodes and Universal Tag Insertion<\\/li>\\n\\t        <li>Drag &amp; Drop of text from external applications such as other Browser Tabs\\/windows or Native Applications (Supported on Firefox, Chrome, IE10 and Safari)<\\/li>\\n\\t        <li>Import local files by Drag &amp; Drop directly from your desktop! (Supported on Firefox, Chrome, IE10 and Safari 6+)<\\/li>\\n\\t        <li>And much more!<\\/li>\\n        <\\/ul>\\n        <\\/div>\\n        ","group":""}', '{"autosave-enabled":"0","autosave-time":"5","theme":"fluidvision","font-size":"12px","fold-style":"markbeginend","use-wrap-mode":"free","selection-style":"1","highlight-active-line":"1","highlight-selected-word":"1","show-invisibles":"0","show-gutter":"1","show-print-margin":"1","fade-fold-widgets":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10014, 'System - RokBox', 'plugin', 'rokbox', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - RokBox","type":"plugin","creationDate":"April 10, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.0.2","description":"\\n        <div class=\\"rokbox-description\\">\\n        <img src=\\"..\\/plugins\\/system\\/rokbox\\/assets\\/admin\\/images\\/rokbox.jpg\\" class=\\"img-padding\\" \\/><h1>RokBox2<\\/h1>\\n        <p>RokBox2 is a fully responsive modal pop-up plug-in for Joomla.  It displays <strong>images<\\/strong>, <strong>videos<\\/strong>, <strong>embedded widgets<\\/strong>, <strong>Ajax content<\\/strong> and <strong>Joomla modules<\\/strong>.<\\/p>\\n\\n        <p>RokBox2 contains a <strong>Content plug-in<\\/strong> and <strong>Button Editor plug-in<\\/strong>. The <strong>Content plug-in<\\/strong> can auto-generate thumbnails of <strong>local images<\\/strong> that can be used as content for your RokBox2 links. All thumbnails generated are <strong>responsive<\\/strong> so that they can easily adapt to any device. The <strong>Button Editor plug-in<\\/strong> allows for easy creation of RokBox2 style snippets with just a few clicks.<\\/p>\\n        <p>RokBox2 also provides backward compatibility for RokBox1 style <code>{rokbox}<\\/code> syntax.<\\/p>\\n\\n        <h2>Key Features:<\\/h2>\\n        <ul class=\\"features\\">\\n            <li>HTML5 and CSS3<\\/li>\\n            <li>Fully Responsive<\\/li>\\n            <li>Auto thumbnails generator<\\/li>\\n            <li>Captions supporting HTML syntax<\\/li>\\n            <li>Ajax Content listener<\\/li>\\n            <li>Multiple media types supported:\\n                <ul class=\\"features\\">\\n                    <li>Images: base64 encoded, jpg, gif, png, bmp, webp<\\/li>\\n                    <li>HTML5 Video and Audio<\\/li>\\n                    <li>TwitPic<\\/li>\\n                    <li>Instagram<\\/li>\\n                    <li>YouTube<\\/li>\\n                    <li>Vimeo<\\/li>\\n                    <li>Telly (ex TwitVid)<\\/li>\\n                    <li>Metacafe<\\/li>\\n                    <li>Dailymotion<\\/li>\\n                    <li>Spotify<\\/li>\\n                    <li>Google Maps<\\/li>\\n                <\\/ul>\\n            <\\/li>\\n            <li>Fit\\/Unfit Screen: If an image is too big it gets shrunk to fit the view-port but you can always click the Fit Screen icon to expand it and scroll.<\\/li>\\n            <li>Albums to group related images<\\/li>\\n            <li>Key Bindings for easy navigation: <code>&larr;<\\/code> (Previous), <code>&rarr;<\\/code> (Next), <code>f<\\/code> Fitscreen\\/Unfitscreen, <code>esc<\\/code> Close<\\/li>\\n        <\\/ul>\\n\\n        <p class=\\"note\\"><strong>NOTE:<\\/strong> RokBox2 consists of 3 plug-ins: <strong>Content<\\/strong>, <strong>System<\\/strong> and <strong>Editor Button<\\/strong>. Make sure to have a look at all three plug-in manager pages to get an idea of what they do.<\\/p>\\n        <\\/div>\\n        ","group":""}', '{"theme":"light","custom-theme":"sample","custom-legacy":"0","width":"640","height":"460","transition":"Quad.easeOut","duration":"200","chase":"40","effect":"quicksilver","frame-border":"20","content-padding":"0","arrows-height":"35","captions":"1","captionsDelay":"800","scrolling":"0","keyEvents":"1","overlay_background":"#000000","overlay_opacity":"0.85","overlay_duration":"200","overlay_transition":"Quad.easeInOut","autoplay":"true","ytautoplay":"0","ythighquality":"0","controller":"false","bgcolor":"#f3f3f3","vimeoColor":"00adef","vimeoPortrait":"0","vimeoTitle":"0","vimeoFullScreen":"1","vimeoByline":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10015, 'Content - RokBox', 'plugin', 'rokbox', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"Content - RokBox","type":"plugin","creationDate":"April 10, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.0.2","description":"\\n        <div class=\\"rokbox-description\\">\\n        <img src=\\"..\\/plugins\\/system\\/rokbox\\/assets\\/admin\\/images\\/rokbox.jpg\\" class=\\"img-padding\\" \\/><h1>RokBox2<\\/h1>\\n        <p>Auto generates thumbnails of <strong>local images<\\/strong> that can be used as content for your RokBox2 links. All thumbnails generated are <strong>responsive<\\/strong> so that they can be easily adapted to any device. RokBox2 Content plugins also provides backward compatibility for the old discontinued RokBox1 that allowed writing snippets through the <code>{rokbox}<\\/code> syntax.<\\/p>\\n\\n        <p class=\\"note\\"><strong>NOTE:<\\/strong> RokBox2 comes with 3 plugins: <strong>Content<\\/strong>, <strong>System<\\/strong> and <strong>Editor Button<\\/strong>. Make sure to have a look at all three plugin manager pages to get an idea of what they do.<\\/p>\\n        <\\/div>\\n        ","group":""}', '{"remote_sizes":"0","thumb_ext":"_thumb","thumb_class":"album","thumb_custom":"0","thumb_dir":"cache","thumb_width":"150","thumb_height":"100","thumb_quality":"90"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10017, 'RokCandy', 'component', 'com_rokcandy', '', 1, 1, 0, 0, '{"legacy":false,"name":"RokCandy","type":"component","creationDate":"November 1, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.5.0","description":"\\n\\t\\tRokCandy is a simple yet powerful macro system for Joomla 1.6.  It provides the ability to create and categorize macros that can be used throughout your site.\\n\\t","group":""}', '{"forcecache":"0","adminenabled":"0","editenabled":"0","contentPlugin":"0","disabled":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 'Button - RokCandy', 'plugin', 'rokcandy', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"Button - RokCandy","type":"plugin","creationDate":"November 1, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.5.0","description":"This is an Editor Button to allow selection of RokCandy macros","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(10019, 'System - RokCandy', 'plugin', 'rokcandy', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - RokCandy","type":"plugin","creationDate":"November 1, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.5.0","description":"This is the RokCandy system plugin that performs the macro replacement","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 16, 0),
(10021, 'System - RokBooster', 'plugin', 'rokbooster', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"System - RokBooster","type":"plugin","creationDate":"February 7, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.1.5","description":"\\n        \\n        <div class=\\"booster-description\\">\\n        <img src=\\"..\\/plugins\\/system\\/rokbooster\\/assets\\/images\\/rokbooster.jpg\\" class=\\"img-padding\\" \\/><h1>RokBooster<\\/h1>\\n        <p>Increase the speed of your site by enabling the RokBooster plug-in.  This advanced extensions will <strong>compress<\\/strong> and <strong>combine<\\/strong> your <strong>CSS<\\/strong> and <strong>JavaScript<\\/strong> into as few files as possible each.  RokBooster can dramatically reduce the number of HTTP calls a browser has to make, and sending those compressed files GZipped means your pages will load faster with less load on your server.<\\/p>\\n\\n        <h2>Key Features:<\\/h2>\\n        <ul class=\\"features\\">\\n            <li>Combine and compress CSS and JavaScript into as few files as possible<\\/li>\\n            <li>GZip compression used to send CSS and JavaScript files<\\/li>\\n            <li>Compress Inline CSS and JavaScript<\\/li>\\n            <li>Customizable cache timeout<\\/li>\\n            <li>Background rendering, so initial file processing won''t slow your users down<\\/li>\\n            <li>Full page scan allows for non-header JavaScript and CSS to be included<\\/li>\\n            <li>Ability to ignore specific CSS and JavaScript files<\\/li>\\n        <\\/ul>\\n        <p class=\\"note\\"><strong>NOTE:<\\/strong> Clearing the Joomla cache will remove the RokBooster compressed cache files causing them to regenerate on the next page hit<\\/p>\\n        <\\/div>\\n        \\n    ","group":""}', '{"cache_time":"60","minify_css":"1","style_sort":"RokBooster_Compressor_Sort_ExternalOnTop","inline_css":"1","imported_css":"1","minify_js":"1","script_sort":"RokBooster_Compressor_Sort_ExternalOnTop","inline_js":"1","ignored_files":"","scan_method":"header","use_background_processing":"1","disable_for_ie":"1"}', '', '', 0, '0000-00-00 00:00:00', 17, 0),
(10024, 'System - RokCommon', 'plugin', 'rokcommon', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - RokCommon","type":"plugin","creationDate":"March 7, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"3.1.6","description":"RokCommon System Plugin","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10031, 'roksprocket', 'component', 'com_roksprocket', '', 1, 1, 0, 0, '{"legacy":false,"name":"RokSprocket","type":"component","creationDate":"March 12, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.8.7","description":"RokSprocket Component for Joomla","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10032, 'RokSprocket Module', 'module', 'mod_roksprocket', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokSprocket Module","type":"module","creationDate":"March 12, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.8.7","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10033, 'System - RokSprocket', 'plugin', 'roksprocket', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - RokSprocket","type":"plugin","creationDate":"March 12, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.8.7","description":"RokSprocket System Plugin","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10034, 'Content - RokInjectModule', 'plugin', 'rokinjectmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"Content - RokInjectModule","type":"plugin","creationDate":"March 1, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.4","description":"RokInjectModule Content Plugin.  Use format [module-{moduleid}] in your article to inject a module. You can also specify a style, eg: [module-28 style=xhtml]","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(10035, 'com_gantry', 'component', 'com_gantry', '', 1, 1, 1, 0, '{"legacy":false,"name":"Gantry","type":"component","creationDate":"September 18, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"4.0.5","description":"Gantry Starting Template for Joomla! v4.0.5","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10036, 'rt_metropolis', 'template', 'rt_metropolis', '', 0, 1, 1, 0, '{"legacy":false,"name":"rt_metropolis","type":"template","creationDate":"February 13, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.2","description":"Parent for all PHP based projects","group":""}', '{"master":"true"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10047, 'Content - Social Share', 'plugin', 'socialshare', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"Content - Social Share","type":"plugin","creationDate":"2012-01-01","author":"LoginRadius","copyright":"2012 to till","authorEmail":"developers@loginradius.com","authorUrl":"http:\\/\\/www.loginradius.com","version":"3.0.1","description":"\\n\\tLoginRadius enables social share for your joomla websites.\\n","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10050, 'Social Login', 'module', 'mod_socialloginandsocialshare', '', 0, 1, 0, 0, '{"legacy":false,"name":"Social Login","type":"module","creationDate":"2012-01-01","author":"LoginRadius","copyright":"Copyright (C) 2012 - till Open Source Matters. All rights reserved.","authorEmail":"developers@loginradius.com","authorUrl":"www.LoginRadius.com","version":"3.0.1","description":"LoginRadius enables social login and social share for your joomla websites.","group":""}', '{"usesecure":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10051, 'System - Social Login', 'plugin', 'socialloginandsocialshare', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - Social Login And Social Share","type":"plugin","creationDate":"2012-01-01","author":"LoginRadius","copyright":"2012 to till","authorEmail":"developers@loginradius.com","authorUrl":"http:\\/\\/www.loginradius.com","version":"3.0.1","description":"\\n\\tLoginRadius enables social login for your joomla websites.\\n","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10052, 'socialloginandsocialshare', 'component', 'com_socialloginandsocialshare', '', 1, 1, 0, 0, '{"legacy":false,"name":"Social Login And Social Share","type":"component","creationDate":"2012-01-01","author":"LoginRadius","copyright":"2013, LoginRadius","authorEmail":"developers@loginradius.com","authorUrl":"http:\\/\\/www.loginradius.com","version":"3.0.1","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10055, 'rokgallery', 'component', 'com_rokgallery', '', 1, 1, 0, 0, '{"legacy":false,"name":"RokGallery","type":"component","creationDate":"March 8, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.23","description":"A Gallery component for Joomla 1.6 from RocketTheme.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10056, 'RokGallery Module', 'module', 'mod_rokgallery', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokGallery Module","type":"module","creationDate":"March 8, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.23","description":"Module for displaying RokGallery","group":""}', '{"link":"0","default_menuitem":"0","title":"false","caption":"false","sort_by":"gallery_ordering","sort_direction":"ASC","limit_count":"10","css_style":"light","layout":"grid","columns":"1","arrows":"onhover","navigation":"thumbnails","animation_type":"random","animation_duration":"500","autoplay_enabled":"0","autoplay_delay":"7","showcase_arrows":"onhover","showcase_image_position":"left","showcase_imgpadding":"0","showcase_animation_type":"random","showcase_captionsanimation":"crossfade","showcase_animation_duration":"500","showcase_autoplay_enabled":"0","showcase_autoplay_delay":"7","showcase_responsive_arrows":"onhover","showcase_responsive_image_position":"left","showcase_responsive_imgpadding":"0","showcase_responsive_animation_type":"random","showcase_responsive_captionsanimation":"crossfade","showcase_responsive_animation_duration":"500","showcase_responsive_autoplay_enabled":"0","showcase_responsive_autoplay_delay":"7","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10057, 'Button - RokGallery', 'plugin', 'rokgallery', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"Button - RokGallery","type":"plugin","creationDate":"March 8, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.23","description":"This is an Editor Button to allow selection of RokGallery Slices","group":""}', '{}', '', '', 97, '2013-04-29 01:24:09', 50, 0),
(10058, 'System - RokGallery', 'plugin', 'rokgallery', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - RokGallery","type":"plugin","creationDate":"March 8, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.23","description":"A system level support plugin for RokGallery.","group":""}', '{}', '', '', 97, '2013-04-29 01:24:00', 50, 0),
(10060, 'RokStories', 'module', 'mod_rokstories', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokStories","type":"module","creationDate":"March 21, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.13","description":"RokStories","group":""}', '{"":"","load_css":"1","layout_type":"layout1","content_type":"joomla","catid":"","show_front":"1","user_id":"0","joomla_image":"text","k2_category":"","k2_children":"0","k2_featured":"1","k2_image_size":"L","spacer":"","count":"4","itemsOrdering":"","strip_tags":"a,i,br","content_position":"right","show_article_title":"1","show_created_date":"0","show_article":"1","show_article_link":"1","legacy_readmore":"0","thumb_width":"90","start_width":"auto","start_element":"0","thumbs_opacity":"0.3","fixed_height":"0","mouse_type":"click","autoplay":"0","autoplay_delay":"5000","@spacer":"Additional Showcase Layout Type Content Options","show_label_article_title":"1","show_arrows":"1","show_circles":"1","arrows_placement":"inside","show_thumbs":"0","fixed_thumb":"1","link_titles":"0","link_labels":"0","link_images":"0","show_mask":"1","mask_desc_dir":"topdown","mask_imgs_dir":"bottomup","scrollerDuration":"1000","scrollerTransition":"Expo.easeInOut","show_controls":"1","left_offset_x":"-40","left_offset_y":"-100","right_offset_x":"-30","right_offset_y":"-100","left_f_offset_x":"-40","left_f_offset_y":"-100","right_f_offset_x":"-30","right_f_offset_y":"-100","cache":"0","module_cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10065, 'Hello, World!', 'module', 'mod_helloworld', '', 0, 1, 0, 0, '{"legacy":false,"name":"Hello, World!","type":"module","creationDate":"Unknown","author":"John Doe","copyright":"","authorEmail":"","authorUrl":"","version":"2.5.9","description":"A simple Hello, World! module.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10069, 'RokMiniEvents', 'module', 'mod_rokminievents', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokMiniEvents","type":"module","creationDate":"April 4, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.0.0","description":"RokMiniEvents allows to share your Joomla! website Google Calendar Events","group":""}', '{"builtin_css":"1","set_widths":"1","wrapper_width":"750","item_number":"3","sortorder":"ascending","time_range":"predefined_ranges","startmin":"","startmax":"","rangespan":"current_month","show_description":"1","strip_tags":"a,i,br","trim_description":"1","trim_count":"200","localtime":"local","timezone":"0","dayformat":"%d","monthformat":"%b","yearformat":"%Y","timeformat":"%I:%M %p","datedisplay":"badge","showyear":"0","limit_count":"0","events_pane":"3","timeline":"arrows","timeline_dates":"inline","transition":"Expo.easeInOut","duration":"500","offset_x":"0","cache":"0","module_cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10070, 'com_k2', 'component', 'com_k2', '', 1, 0, 0, 0, '{"legacy":false,"name":"COM_K2","type":"component","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"Thank you for installing K2 by JoomlaWorks, the powerful content extension for Joomla!","group":""}', '{"enable_css":"1","jQueryHandling":"1.8remote","backendJQueryHandling":"remote","userName":"1","userImage":"1","userDescription":"1","userURL":"1","userEmail":"0","userFeedLink":"1","userFeedIcon":"1","userItemCount":"10","userItemTitle":"1","userItemTitleLinked":"1","userItemDateCreated":"1","userItemImage":"1","userItemIntroText":"1","userItemCategory":"1","userItemTags":"1","userItemCommentsAnchor":"1","userItemReadMore":"1","userItemK2Plugins":"1","tagItemCount":"10","tagItemTitle":"1","tagItemTitleLinked":"1","tagItemDateCreated":"1","tagItemImage":"1","tagItemIntroText":"1","tagItemCategory":"1","tagItemReadMore":"1","tagItemExtraFields":"0","tagOrdering":"","tagFeedLink":"1","tagFeedIcon":"1","genericItemCount":"10","genericItemTitle":"1","genericItemTitleLinked":"1","genericItemDateCreated":"1","genericItemImage":"1","genericItemIntroText":"1","genericItemCategory":"1","genericItemReadMore":"1","genericItemExtraFields":"0","genericFeedLink":"1","genericFeedIcon":"1","feedLimit":"10","feedItemImage":"1","feedImgSize":"S","feedItemIntroText":"1","feedTextWordLimit":"","feedItemFullText":"1","feedItemTags":"0","feedItemVideo":"0","feedItemGallery":"0","feedItemAttachments":"0","feedBogusEmail":"","introTextCleanup":"0","introTextCleanupExcludeTags":"","introTextCleanupTagAttr":"","fullTextCleanup":"0","fullTextCleanupExcludeTags":"","fullTextCleanupTagAttr":"","xssFiltering":"0","linkPopupWidth":"900","linkPopupHeight":"600","imagesQuality":"100","itemImageXS":"100","itemImageS":"200","itemImageM":"400","itemImageL":"600","itemImageXL":"900","itemImageGeneric":"300","catImageWidth":"100","catImageDefault":"1","userImageWidth":"100","userImageDefault":"1","commenterImgWidth":"48","onlineImageEditor":"splashup","imageTimestamp":"0","imageMemoryLimit":"","socialButtonCode":"","twitterUsername":"","facebookImage":"1","comments":"1","commentsOrdering":"DESC","commentsLimit":"10","commentsFormPosition":"below","commentsPublishing":"1","commentsReporting":"2","commentsReportRecipient":"","inlineCommentsModeration":"0","gravatar":"1","recaptcha":"0","commentsFormNotes":"1","commentsFormNotesText":"","frontendEditing":"1","showImageTab":"1","showImageGalleryTab":"1","showVideoTab":"1","showExtraFieldsTab":"1","showAttachmentsTab":"1","showK2Plugins":"1","sideBarDisplayFrontend":"0","mergeEditors":"1","sideBarDisplay":"1","attachmentsFolder":"","hideImportButton":"0","googleSearch":"0","googleSearchContainer":"k2GoogleSearchContainer","K2UserProfile":"1","K2UserGroup":"","redirect":"","adminSearch":"simple","cookieDomain":"","taggingSystem":"1","lockTags":"0","showTagFilter":"0","k2TagNorm":"0","k2TagNormCase":"lower","k2TagNormAdditionalReplacements":"","recaptcha_public_key":"","recaptcha_private_key":"","recaptcha_theme":"clean","recaptchaOnRegistration":"0","stopForumSpam":"0","stopForumSpamApiKey":"","showItemsCounterAdmin":"1","showChildCatItems":"1","disableCompactOrdering":"0","metaDescLimit":"150","enforceSEFReplacements":"0","SEFReplacements":"","k2Sef":"0","k2SefLabelCat":"content","k2SefLabelTag":"tag","k2SefLabelUser":"author","k2SefLabelSearch":"search","k2SefLabelDate":"date","k2SefLabelItem":"0","k2SefLabelItemCustomPrefix":"","k2SefInsertItemId":"1","k2SefItemIdTitleAliasSep":"dash","k2SefUseItemTitleAlias":"1","k2SefInsertCatId":"1","k2SefCatIdTitleAliasSep":"dash","k2SefUseCatTitleAlias":"1","sh404SefLabelCat":"","sh404SefLabelUser":"blog","sh404SefLabelItem":"2","sh404SefTitleAlias":"alias","sh404SefModK2ContentFeedAlias":"feed","sh404SefInsertItemId":"0","sh404SefInsertUniqueItemId":"0","cbIntegration":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10071, 'plg_finder_k2', 'plugin', 'k2', 'finder', 0, 0, 1, 0, '{"legacy":false,"name":"plg_finder_k2","type":"plugin","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"PLG_FINDER_K2_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10072, 'Search - K2', 'plugin', 'k2', 'search', 0, 0, 1, 0, '{"legacy":false,"name":"Search - K2","type":"plugin","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_THIS_PLUGIN_EXTENDS_THE_DEFAULT_JOOMLA_SEARCH_FUNCTIONALITY_TO_K2_CONTENT","group":""}', '{"search_limit":"50","search_tags":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10073, 'System - K2', 'plugin', 'k2', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"System - K2","type":"plugin","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_THE_K2_SYSTEM_PLUGIN_IS_USED_TO_ASSIST_THE_PROPER_FUNCTIONALITY_OF_THE_K2_COMPONENT_SITE_WIDE_MAKE_SURE_ITS_ALWAYS_PUBLISHED_WHEN_THE_K2_COMPONENT_IS_INSTALLED","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10074, 'User - K2', 'plugin', 'k2', 'user', 0, 0, 1, 0, '{"legacy":false,"name":"User - K2","type":"plugin","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_A_USER_SYNCHRONIZATION_PLUGIN_FOR_K2","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10075, 'Josetta - K2 Categories', 'plugin', 'k2category', 'josetta_ext', 0, 0, 1, 0, '{"legacy":false,"name":"Josetta - K2 Categories","type":"plugin","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10076, 'Josetta - K2 Items', 'plugin', 'k2item', 'josetta_ext', 0, 0, 1, 0, '{"legacy":false,"name":"Josetta - K2 Items","type":"plugin","creationDate":"June 7th, 2012","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `tbl_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10077, 'K2 Comments', 'module', 'mod_k2_comments', '', 0, 0, 0, 0, '{"legacy":false,"name":"K2 Comments","type":"module","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"MOD_K2_COMMENTS_DESCRIPTION","group":""}', '{"moduleclass_sfx":"","module_usage":"","":"K2_TOP_COMMENTERS","catfilter":"0","category_id":"","comments_limit":"5","comments_word_limit":"10","commenterName":"1","commentAvatar":"1","commentAvatarWidthSelect":"custom","commentAvatarWidth":"50","commentDate":"1","commentDateFormat":"absolute","commentLink":"1","itemTitle":"1","itemCategory":"1","feed":"1","commenters_limit":"5","commenterNameOrUsername":"1","commenterAvatar":"1","commenterAvatarWidthSelect":"custom","commenterAvatarWidth":"50","commenterLink":"1","commenterCommentsCounter":"1","commenterLatestComment":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10078, 'K2 Content', 'module', 'mod_k2_content', '', 0, 0, 0, 0, '{"legacy":false,"name":"K2 Content","type":"module","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_MOD_K2_CONTENT_DESCRIPTION","group":""}', '{"moduleclass_sfx":"","getTemplate":"Default","source":"filter","":"K2_OTHER_OPTIONS","catfilter":"0","category_id":"","getChildren":"0","itemCount":"5","itemsOrdering":"","FeaturedItems":"1","popularityRange":"","videosOnly":"0","item":"","items":"","itemTitle":"1","itemAuthor":"1","itemAuthorAvatar":"1","itemAuthorAvatarWidthSelect":"custom","itemAuthorAvatarWidth":"50","userDescription":"1","itemIntroText":"1","itemIntroTextWordLimit":"","itemImage":"1","itemImgSize":"Small","itemVideo":"1","itemVideoCaption":"1","itemVideoCredits":"1","itemAttachments":"1","itemTags":"1","itemCategory":"1","itemDateCreated":"1","itemHits":"1","itemReadMore":"1","itemExtraFields":"0","itemCommentsCounter":"1","feed":"1","itemPreText":"","itemCustomLink":"0","itemCustomLinkTitle":"","itemCustomLinkURL":"http:\\/\\/","itemCustomLinkMenuItem":"","K2Plugins":"1","JPlugins":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10079, 'K2 Tools', 'module', 'mod_k2_tools', '', 0, 0, 0, 0, '{"legacy":false,"name":"K2 Tools","type":"module","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_TOOLS","group":""}', '{"moduleclass_sfx":"","module_usage":"0","":"K2_CUSTOM_CODE_SETTINGS","archiveItemsCounter":"1","archiveCategory":"","authors_module_category":"","authorItemsCounter":"1","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"","home":"","seperator":"","root_id":"","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"","catfilter":"0","category_id":"","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":"0","cloud_category_recursive":"0","customCode":"","parsePhp":"0","K2Plugins":"0","JPlugins":"0","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10080, 'K2 Users', 'module', 'mod_k2_users', '', 0, 0, 0, 0, '{"legacy":false,"name":"K2 Users","type":"module","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_MOD_K2_USERS_DESCRTIPTION","group":""}', '{"moduleclass_sfx":"","getTemplate":"Default","source":"0","":"K2_DISPLAY_OPTIONS","filter":"1","K2UserGroup":"","ordering":"1","limit":"4","userIDs":"","userName":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","userDescription":"1","userDescriptionWordLimit":"","userURL":"1","userEmail":"0","userFeed":"1","userItemCount":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10081, 'K2 User', 'module', 'mod_k2_user', '', 0, 0, 0, 0, '{"legacy":false,"name":"K2 User","type":"module","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_MOD_K2_USER_DESCRIPTION","group":""}', '{"moduleclass_sfx":"","pretext":"","":"K2_LOGIN_LOGOUT_REDIRECTION","name":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","menu":"","login":"","logout":"","usesecure":"0","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10082, 'K2 Quick Icons (admin)', 'module', 'mod_k2_quickicons', '', 1, 0, 2, 0, '{"legacy":false,"name":"K2 Quick Icons (admin)","type":"module","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_QUICKICONS_FOR_USE_IN_THE_JOOMLA_CONTROL_PANEL_DASHBOARD_PAGE","group":""}', '{"modCSSStyling":"1","modLogo":"1","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10083, 'K2 Stats (admin)', 'module', 'mod_k2_stats', '', 1, 0, 2, 0, '{"legacy":false,"name":"K2 Stats (admin)","type":"module","creationDate":"April 7th, 2013","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2013 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.6.6","description":"K2_STATS_FOR_USE_IN_THE_K2_DASHBOARD_PAGE","group":""}', '{"latestItems":"1","popularItems":"1","mostCommentedItems":"1","latestComments":"1","statistics":"1","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10085, 'Content - RokComments', 'plugin', 'rokcomments', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"Content - RokComments","type":"plugin","creationDate":"April 2, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.3","description":"\\n      \\n      <style>\\n          .rc-wrapper h1 {margin-left:0;}\\n          .rc-wrapper h2 {margin-top:40px;color:#333;}\\n          span.readonly .rc-wrapper {font-weight:normal;}\\n          .rc-wrapper img {float:right;margin:0 0 20px 20px;}\\n          .rc-wrapper .under {text-decoration:underline;}\\n          .rc-wrapper li {list-style-type:decimal !important;margin-left:30px;}\\n          .plg-desc {margin-left:0 !Important;}\\n      <\\/style>\\n      <div class=\\"rc-wrapper\\">\\n\\n      <h1>RokComments<\\/h1>\\n      <p> RokComments is a powerful content plugin that allows for easy integration of third-party JavaScript-based comment systems such as <b><a href=\\"#intnse\\">IntenseDebate<\\/a><\\/b>, <b><a href=\\"#facebook\\">Facebook<\\/a><\\/b>, <b><a href=\\"disqus\\">Disqus<\\/a><\\/b>, <b><a href=\\"#livefyre\\">Livefyre<\\/a><\\/b>, and <b>JS-Kit<\\/b> <em>(Deprecated)<\\/em><\\/p>\\n\\n      <a name=\\"intense\\"><\\/a>\\n      <h2>IntenseDebate<\\/h2>\\n      <p><img src=\\"..\\/plugins\\/content\\/rokcomments\\/images\\/id-comments-acct.jpg\\" \\"\\/>To setup RokComments to use IntenseDebate, you first have to sign up at <a href=\\"http:\\/\\/intensedebate.com\\" target=\\"_new\\">http:\\/\\/intensedebate.com<\\/a>. Once you have created an account, you need to select <strong>\\"Sites\\"<\\/strong> from the top menu, then click <strong>\\"+ Add blog\\/site\\"<\\/strong> from the dropdown. Enter the URL to your website and click Next Step. for Step 2, choose <strong>Generic Install<\\/strong> from the options, then click Next Step.  This last page has the JavaScript that you normally would need to install the comments.<\\/p>\\n      <p>Just save the long string variable that is displayed in the <strong>idcomments_acct<\\/strong> var. This is the only thing you will need to configure RokComments to use IntenseDebate.\\n      <\\/p>\\n      <h3>Configure<\\/h3>\\n      <p>Open up the <strong>RokComments Content Plugin<\\/strong> via the <strong>Plugin Manager<\\/strong> in the Joomla Administrator.  Set the following attributes:<\\/p>\\n      <ol>\\n          <li>Set <strong>Comment System<\\/strong> to <strong class=\\"under\\">IntenseDebate<\\/strong><\\/li>\\n          <li>Enable\\/Disable the <strong>Show Comment Count<\\/strong> and the <strong>Show Comment Icon<\\/strong> options as you desire.<\\/li>\\n          <li>If you are using <strong class=\\"under\\">Menus + Categories<\\/strong> for the Activation Method, ensure you select the correct <strong>Menus<\\/strong> and\\/or <strong>Categories<\\/strong> where you would like the comments to show.<\\/li>\\n          <li>In the <strong>IntenseDebate Account<\\/strong> input field, put the <strong class=\\"under\\">idcomments_act<\\/strong> value you saved earlier. eg: <strong class=\\"under\\">2a8f5c96e2fb1deb5a485678a9c523f0<\\/strong> <\\/li>\\n      <\\/ol>\\n\\n      <a name=\\"facebook\\"><\\/a>\\n      <h2>Facebook<\\/h2>\\n      <p><img src=\\"..\\/plugins\\/content\\/rokcomments\\/images\\/fb-appid.jpg\\" \\"\\/>The first step to integrating Facebook comments is to sign up as a Facebook developer.  To do this you must enable and authorize the <strong>Facebook Developer<\\/strong> application to access your Facebook account. Visit the <a href=\\"https:\\/\\/developers.facebook.com\\/apps\\" target=\\"_new\\">FaceBook App Here<\\/a> and click <strong>\\"Allow\\"<\\/strong>.  The next step is to click the <strong>\\"+ Create New App\\"<\\/strong> button on the \\"Apps\\" page.  Enter something like <strong>\\"MySite Comments\\"<\\/strong> in the App Display Name field, and some unique name for the App Namespace, such as <strong>\\"mysite-comments\\"<\\/strong>, review and agree to the Facebook Platform Policies and click \\"Continue\\". Enter the Security Check validation and click \\"Submit\\".  The next page is the <strong>\\"Basic Settings\\"<\\/strong> and here you need to enter your domain for the <strong>App Domain<\\/strong>, eg: <strong class=\\"under\\">mysite.com<\\/strong>.  You also need to click the <strong>Website<\\/strong> block in the \\"Select how your app integrates with Facebook\\" section and put the URL of your website, eg: <strong class=\\"under\\">http:\\/\\/www.mysite.com<\\/strong>.<\\/p>\\n      <p>Lastly copy the <strong>App ID<\\/strong> value as you will need this to configure RokComments to use Facebook.<\\/p>\\n      <h3>Configure<\\/h3>\\n      <p>Open up the <strong>RokComments Content Plugin<\\/strong> via the <strong>Plugin Manager<\\/strong> in the Joomla Administrator.  Set the following attributes:<\\/p>\\n      <ol>\\n          <li>Set <strong>Comment System<\\/strong> to <strong class=\\"under\\">Facebook<\\/strong><\\/li>\\n          <li>Enable\\/Disable the <strong>Show Comment Count<\\/strong> option as you desire. <strong>Show Comment Icon<\\/strong> has no effect for Facebook.<\\/li>\\n          <li>If you are using <strong class=\\"under\\">Menus + Categories<\\/strong> for the Activation Method, ensure you select the correct <strong>Menus<\\/strong> and\\/or <strong>Categories<\\/strong> where you would like the comments to show.<\\/li>\\n          <li>In the <strong>Facebook AppId<\\/strong> input field, put the <strong class=\\"under\\">App ID<\\/strong> value you saved earlier. eg: <strong class=\\"under\\">236773289710058<\\/strong> <\\/li>\\n          <li>Enter the width in pixels of the comment area, just adjust this field till it fits nicely under your content<\\/li>\\n          <li>Enter a comma separated list of Facebook User IDs of people you want to be able to moderate these comments.  Alternatively you can moderate them via the <a href=\\"http:\\/\\/developers.facebook.com\\/tools\\/comments\\" target=\\"_new\\">Developer Tools<\\/a><\\/li>\\n      <\\/ol>\\n\\n      <a name=\\"disqus\\"><\\/a>\\n      <h2>Disqus<\\/h2>\\n      <p><img src=\\"..\\/plugins\\/content\\/rokcomments\\/images\\/dis-shortname.jpg\\" \\"\\/>In order to use Disqus comments you need to first Sign Up at <a href=\\"http:\\/\\/disqus.com\\/\\" target=\\"_new\\">http:\\/\\/disqus.com<\\/a>.  After signing up you need to click the <strong>\\"+ Add\\"<\\/strong> button in the <strong>Your Sites<\\/strong> sidebar section.  Fill in the form with your information for the your site.<\\/p>\\n      <p>The <strong>\\"shortname\\"<\\/strong> is important as this is the unique identifier you will use when configuring RokComments.  On the Settings panel configure the options as you like, or just leave the defaults before hitting continue.  You will be able to moderate these comments directly by going to the shortname url, eg: <strong>http:\\/\\/mysite.disqus.com<\\/strong>.<\\/p>\\n      <h3>Configure<\\/h3>\\n      <p>Open up the <strong>RokComments Content Plugin<\\/strong> via the <strong>Plugin Manager<\\/strong> in the Joomla Administrator.  Set the following attributes:<\\/p>\\n      <ol>\\n          <li>Set <strong>Comment System<\\/strong> to <strong class=\\"under\\">Disqus<\\/strong><\\/li>\\n          <li>Enable\\/Disable the <strong>Show Comment Count<\\/strong> and the <strong>Show Comment Icon<\\/strong> options as you desire.<\\/li>\\n          <li>If you are using <strong class=\\"under\\">Menus + Categories<\\/strong> for the Activation Method, ensure you select the correct <strong>Menus<\\/strong> and\\/or <strong>Categories<\\/strong> where you would like the comments to show.<\\/li>\\n          <li>In the <strong>Disqus Shorname<\\/strong> input field, put the <strong class=\\"under\\">shortname<\\/strong> value you saved earlier. eg: <strong class=\\"under\\">mysite<\\/strong> <\\/li>\\n          <li>If you need to test the comments on an inaccessible website during development you can enable the <strong>Developer Mode<\\/strong> option here.<\\/li>\\n      <\\/ol>\\n\\n      <a name=\\"livefyre\\"><\\/a>\\n      <h2>Livefyre<\\/h2>\\n      <p><img src=\\"..\\/plugins\\/content\\/rokcomments\\/images\\/lf-siteid.jpg\\" \\"\\/>The first step to installing Livefyre comments on your site is to Sign Up via the <a href=\\"http:\\/\\/www.livefyre.com\\" target=\\"_new\\">http:\\/\\/www.livefyre.com<\\/a> website.  When you have signed up, you should click <strong>\\"Install\\"<\\/strong> or go directly to the <a href=\\"http:\\/\\/www.livefyre.com\\/install\\/\\" target=\\"_new\\">install URL<\\/a>. Enter the URL of your site and then click the <strong>\\"Custom\\"<\\/strong> option for the <strong>Platform<\\/strong>, and then click the \\"Keep Going!\\" button.<\\/p>\\n      <p>That''s all there is to it.  You will be provided with a chunk of JavaScript, but all you need to do is copy the numeric <strong>site_id<\\/strong> variable as this will be used to configure RokComments to use Livefyre.<\\/p>\\n\\n      <h3>Configure<\\/h3>\\n      <p>Open up the <strong>RokComments Content Plugin<\\/strong> via the <strong>Plugin Manager<\\/strong> in the Joomla Administrator.  Set the following attributes:<\\/p>\\n      <ol>\\n          <li>Set <strong>Comment System<\\/strong> to <strong class=\\"under\\">Livefyre<\\/strong><\\/li>\\n          <li>NOTE: Comment Counts are not supported in Livefyre currently, so those options will be ignored.<\\/li>\\n          <li>If you are using <strong class=\\"under\\">Menus + Categories<\\/strong> for the Activation Method, ensure you select the correct <strong>Menus<\\/strong> and\\/or <strong>Categories<\\/strong> where you would like the comments to show.<\\/li>\\n          <li>In the <strong>Livefyre Site ID<\\/strong> input field, put the <strong class=\\"under\\">site_id<\\/strong> value you saved earlier. eg: <strong class=\\"under\\">291224<\\/strong> <\\/li>\\n      <\\/ol>\\n      \\n       <\\/div>\\n      \\n    ","group":""}', '{"system":"1","spacer_global":"","showcount":"1","showicon":"rk-icon","tagmode":"0","method":"id","spacer_menus_cats":"","menus":"","categories":"","spacer_intense":"","id-account":"","spacer_facebook":"","fb-appid":"","fb-width":"500","fb-postcount":"10","fb-modid":"","spacer_disq":"","d-subdomain":"","d-devmode":"0","spacer_livefyre":"","lf-siteid":"","spacer_jskit":"","js-domain":""}', '', '', 97, '2013-04-10 04:51:09', 1, 0),
(10086, 'Button - RokComments', 'plugin', 'rokcomments', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"Button - RokComments","type":"plugin","creationDate":"April 2, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.3","description":"Inserts the plugin code for RokComments","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10088, 'RokNewsPager', 'module', 'mod_roknewspager', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokNewsPager","type":"module","creationDate":"March 22, 2012","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.7","description":"RokNewsPager is a horizontal paging latest news module","group":""}', '{"":"","load_css":"1","theme":"light","content_type":"joomla","joomla_all":"0","catid":"","featured":"1","k2_all":"0","k2_category":"","k2_children":"0","k2_featured":"1","k2_image_size":"L","spacer_content_parameters":"","article_count":"5","show_accordion":"0","show_paging":"1","maxpages":"8","show_title":"1","link_title":"1","show_thumbnails":"1","thumb_width":"90","thumbnail_link":"1","show_overlay":"1","overlay":"","show_ratings":"1","show_readmore":"1","readmore_text":"Read More...","itemsOrdering":"","show_preview_text":"1","strip_tags":"a,br","preview_count":"200","show_comment_count":"0","show_author":"0","show_published_date":"0","autoupdate":"0","autoupdate_delay":"5000","moduleclass_sfx":"","cache":"0","module_ident":"id","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10089, 'rokmodule', 'component', 'com_rokmodule', '', 1, 1, 0, 0, '{"legacy":false,"name":"RokModule","type":"component","creationDate":"November 11, 2011","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2011 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"1.3","description":"Displays a module as a component - useful for ajax (v1.1 adds support for modules by moduleid as well as module)","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10093, 'Button - RokBox', 'plugin', 'rokbox', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"Button - RokBox","type":"plugin","creationDate":"April 10, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"2.0.2","description":"This is an Editor Button to allow injection of RokBox snippets into your Content","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10096, 'RokCommon', 'library', 'lib_rokcommon', '', 0, 1, 1, 0, '{"legacy":false,"name":"RokCommon","type":"library","creationDate":"March 7, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"3.1.6","description":"RokCommon Shared Library","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10099, 'Gantry', 'library', 'lib_gantry', '', 0, 1, 1, 0, '{"legacy":false,"name":"Gantry","type":"library","creationDate":"April 1, 2013","author":"RocketTheme, LLC","copyright":"(C) 2005 - 2013 RocketTheme, LLC. All rights reserved.","authorEmail":"support@rockettheme.com","authorUrl":"http:\\/\\/www.rockettheme.com","version":"4.1.9","description":"Gantry Starting Template for Joomla! v4.1.9","group":""}', '{}', '{"last_update":1369988238}', '', 0, '0000-00-00 00:00:00', 0, 0),
(10101, 'fwgallery', 'component', 'com_fwgallery', '', 1, 1, 0, 0, '{"legacy":false,"name":"FW Gallery","type":"component","creationDate":"15 April 2013","author":"Fastw3b - We develop while you are thinking","copyright":"Copyright (C) 2013 Fastw3b. All rights reserved.","authorEmail":"dev@fastw3b.net","authorUrl":"http:\\/\\/www.fastw3b.net","version":"2.2.0","description":"\\n<p style=\\"text-align: center;\\"><img style=\\"margin-bottom: 20px; vertical-align: top;\\" alt=\\"thank-yu3\\" src=\\"components\\/com_fwgallery\\/assets\\/images\\/thank-yu3.png\\" width=\\"960\\" height=\\"77\\" \\/><\\/p>\\n<table style=\\"width: 870px; height: 260px;\\" border=\\"0\\">\\n<tbody>\\n<tr>\\n<td><img style=\\"float: left;\\" alt=\\"01_c_gallery\\" src=\\"components\\/com_fwgallery\\/assets\\/images\\/01_c_gallery.png\\" width=\\"178\\" height=\\"236\\" \\/><\\/td>\\n<td>\\n<p><strong>FW Gallery has been installed successfully on your website. <\\/strong><\\/p>\\n<p><strong>Many thanks for your choice!<\\/strong><\\/p>\\n<p> <\\/p>\\n<p><strong>What to do next?<\\/strong><\\/p>\\n<p>1. Go to Menus &gt;&gt; Main Menu &gt;&gt; click on New button<\\/p>\\n<p>2. Assign FW Gallery menu items to your website menu<\\/p>\\n<p>3. Go to FW Gallery &gt;&gt; Galleries to create your first photo gallery.<\\/p>\\n<ol> <\\/ol><\\/td>\\n<td><img style=\\"float: right;\\" alt=\\"fw_gal_on_iphone_for_message\\" src=\\"components\\/com_fwgallery\\/assets\\/images\\/fw_gal_on_iphone_for_message.png\\" width=\\"264\\" height=\\"172\\" \\/><\\/td>\\n<\\/tr>\\n<\\/tbody>\\n<\\/table>\\n<br \\/>\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 18pt;\\"><strong>Improve your photo gallery with extra features!<\\/strong><\\/span><\\/p>\\n<p style=\\"text-align: left;\\"> <\\/p>\\n<table style=\\"text-align: center; width: 959px; height: 350px;\\" border=\\"0\\">\\n<tbody>\\n<tr>\\n<td valign=\\"top\\">\\n<p><a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/joomla-extensions\\/best-offer\\/66-uncategorised\\/393-fw-gallery-subscriptions.html\\"><img alt=\\"fw_gallery_free\\" src=\\"components\\/com_fwgallery\\/assets\\/images\\/fw_gallery_free.png\\" width=\\"125\\" height=\\"135\\" \\/><\\/a><\\/p>\\n<p><strong>FREE GALLERY<\\/strong> <strong>SUBSCRIPTION<\\/strong><\\/p>\\n<div style=\\"text-align: center; clear: both;\\"><span style=\\"font-size: 8pt;\\">Free Download!<strong> <\\/strong><\\/span><\\/div>\\n<a target=\\"_blank\\" href=\\"https:\\/\\/fastw3b.net\\/joomla-extensions\\/best-offer\\/66-uncategorised\\/393-fw-gallery-subscriptions.html\\"><span style=\\"font-size: 8pt;\\">Get it now &gt;&gt;<\\/span><\\/a>\\n<div style=\\"text-align: center; clear: both;\\"><span style=\\"font-size: 8pt;\\"> <\\/span><\\/div>\\n<div><ol>\\n<li>FW Gallery &amp; <strong>6 addons<\\/strong><\\/li>\\n<li><strong>Future Updates <\\/strong>for 6 months<\\/li>\\n<li>Unlimited domains usage<\\/li>\\n<li>Access to Documentation<\\/li>\\n<\\/ol><\\/div>\\n<div><\\/div>\\n<p> <\\/p>\\n<p> <\\/p>\\n<\\/td>\\n<td valign=\\"top\\">\\n<p style=\\"text-align: center;\\"><a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/joomla-extensions\\/best-offer\\/66-uncategorised\\/393-fw-gallery-subscriptions.html\\"><img alt=\\"fw_gallery_basic\\" src=\\"components\\/com_fwgallery\\/assets\\/images\\/fw_gallery_basic.png\\" width=\\"125\\" height=\\"135\\" \\/><\\/a><\\/p>\\n<p style=\\"text-align: center;\\"><strong>BASIC GALLERY SUBSCRIPTION<\\/strong><\\/p>\\n<div style=\\"text-align: center; clear: both;\\"><span style=\\"font-size: 8pt;\\">Price: <strong>$29.99 <\\/strong><\\/span><\\/div>\\n<div style=\\"text-align: center;\\"><a href=\\"https:\\/\\/fastw3b.net\\/joomla-extensions\\/best-offer\\/66-uncategorised\\/393-fw-gallery-subscriptions.html\\" target=\\"_blank\\"><span style=\\"font-size: 8pt;\\">Get it now &gt;&gt;<\\/span><\\/a><\\/div>\\n<div style=\\"text-align: center;\\"><\\/div>\\n<div style=\\"text-align: center;\\"><ol>\\n<li>\\n<div style=\\"text-align: left;\\">FW Gallery &amp; addons<\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\"><strong>Future Updates<\\/strong> for 6 months<strong><br \\/><\\/strong><\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\">Unlimited domains usage<\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\">Access to Documentation<\\/div>\\n<\\/li>\\n<\\/ol><\\/div>\\n<\\/td>\\n<td valign=\\"top\\">\\n<p style=\\"text-align: center;\\"><a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/joomla-extensions\\/best-offer\\/66-uncategorised\\/393-fw-gallery-subscriptions.html\\"><img alt=\\"fw_gallery_advanced\\" src=\\"components\\/com_fwgallery\\/assets\\/images\\/fw_gallery_advanced.png\\" width=\\"125\\" height=\\"135\\" \\/><\\/a><\\/p>\\n<div style=\\"text-align: center; clear: both;\\"><strong>ADVANCED GALLERY SUBSCRIPTION<\\/strong><\\/div>\\n<div style=\\"text-align: center; clear: both;\\"><span style=\\"font-size: 8pt;\\">Price: <strong>$49.99<\\/strong><\\/span><\\/div>\\n<div style=\\"text-align: center;\\"><a href=\\"http:\\/\\/fastw3b.net\\/joomla-extensions\\/product\\/177-advanced-gallery-subscription.html\\"><span style=\\"font-size: 8pt;\\">Get it now &gt;&gt; <\\/span><\\/a><\\/div>\\n<div style=\\"text-align: center;\\"><\\/div>\\n<div style=\\"text-align: center;\\"><ol>\\n<li>\\n<div style=\\"text-align: left;\\">FW Gallery &amp; addons<\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\"><strong>Future Updates<\\/strong> for <strong>6 months<br \\/><\\/strong><\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\"><strong>Support Service<\\/strong> for <strong>6 months<\\/strong><\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\">Unlimited domains usage<\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\">Access to Documentation<\\/div>\\n<\\/li>\\n<\\/ol><\\/div>\\n<\\/td>\\n<td valign=\\"top\\">\\n<p style=\\"text-align: center;\\"><a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/joomla-extensions\\/best-offer\\/66-uncategorised\\/393-fw-gallery-subscriptions.html\\"><img alt=\\"fw_gallery_ultimate\\" src=\\"components\\/com_fwgallery\\/assets\\/images\\/fw_gallery_ultimate.png\\" width=\\"125\\" height=\\"135\\" \\/><\\/a><\\/p>\\n<p style=\\"text-align: center;\\"><strong>ULTIMATE GALLERY SUBSCRIPTION<\\/strong><\\/p>\\n<div style=\\"text-align: center; clear: both;\\"><\\/div>\\n<div style=\\"text-align: center; clear: both;\\"><span style=\\"font-size: 8pt;\\">Price: <strong>$99.99<\\/strong><\\/span> <a target=\\"_blank\\" href=\\"http:\\/\\/www.fastw3b.net\\/joomla-extensions\\/product\\/62-fw-gallery-video-template.html\\"><span style=\\"font-size: 8pt;\\"> <\\/span><\\/a><\\/div>\\n<div style=\\"text-align: center; clear: both;\\"><a href=\\"http:\\/\\/fastw3b.net\\/joomla-extensions\\/product\\/178-ultimate-gallery-subscription.html\\"><span style=\\"font-size: 8pt;\\">Get it now &gt;&gt;<\\/span><\\/a><br \\/><ol>\\n<li>\\n<div style=\\"text-align: left;\\">FW Gallery &amp; <strong>all addons<\\/strong><\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\"><strong>Future Updates<\\/strong> for <strong>12 months<br \\/><\\/strong><\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\"><strong>Support Service<\\/strong> for <strong>12 months<\\/strong><\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\">Unlimited domains usage<\\/div>\\n<\\/li>\\n<li>\\n<div style=\\"text-align: left;\\">Access to Documentation<\\/div>\\n<\\/li>\\n<\\/ol><\\/div>\\n<\\/td>\\n<\\/tr>\\n<\\/tbody>\\n<\\/table>\\n<p style=\\"text-align: left;\\"><span style=\\"font-size: 8pt;\\"> <\\/span><\\/p>\\n<div style=\\"text-align: center;\\"><\\/div>\\n<div style=\\"text-align: center; clear: both;\\"><\\/div>\\n<div style=\\"text-align: center; clear: both;\\"><\\/div>\\n<p><span style=\\"font-size: 12pt;\\"><strong>Useful links:<\\/strong><\\/span><\\/p>\\n<ul>\\n<li>Getting started <a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/support\\/fw-gallery.html\\">documentation &gt;&gt;<\\/a><\\/li>\\n<li>FW Gallery <a href=\\"https:\\/\\/fastw3b.net\\/joomla-extensions\\/best-offer\\/66-uncategorised\\/393-fw-gallery-subscriptions.html\\">Subscriptions &gt;&gt;<\\/a><\\/li>\\n<li>FW Gallery <a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/joomla-extensions\\/fw-gallery.html\\">add-ons &gt;&gt;<\\/a><\\/li>\\n<li>Read FW Gallery <a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/latest-news.html\\">latest news &gt;&gt;<\\/a><\\/li>\\n<li>View <a target=\\"_blank\\" href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/photos-a-images\\/photo-gallery\\/13185\\">JED reviews and leave yours &gt;&gt;<\\/a><\\/li>\\n<li>Follow FW Gallery news on <a target=\\"_blank\\" href=\\"http:\\/\\/twitter.com\\/#!\\/Fastw3b\\">Twitter<\\/a> or <a target=\\"_blank\\" href=\\"http:\\/\\/www.facebook.com\\/pages\\/Fastw3b\\/165610930146118\\">Facebook &gt;&gt;<\\/a><\\/li>\\n<li>Have any questions? Feel free to <a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/contact-us.html\\">contact us &gt;&gt;<\\/a><\\/li>\\n<\\/ul>\\n<div>Developed by <a target=\\"_blank\\" href=\\"http:\\/\\/fastw3b.net\\/\\">Fastw3b<\\/a><\\/div>\\n<div>Copyright &copy; 2007 - 2013 Fastw3b<\\/div>\\n\\t","group":""}', '{"im_th_w":"120","im_th_h":"120","im_mid_w":"200","im_mid_h":"200","im_max_w":"600","im_max_h":"600","gallery_color":"aaaaaa","gallery_box_width":"160","image_box_width":"240","ordering_galleries":"name","ordering_images":"new","use_watermark":"0","watermark_file":"","use_voting":"1","public_voting":"1","galleries_a_row":"3","images_a_row":"3","galleries_limit":"20","images_limit":"20","display_total_galleries":"1","display_galleries_limit_selector":"1","display_gallery_limit_selector":"1","display_owner_gallery":"1","display_owner_image":"1","display_date_gallery":"1","display_gallery_sorting":"1","display_name_gallery":"1","display_name_image":"1","display_date_image":"1","display_image_views":"1","display_user_copyright":"1","date_format":"F d, Y","new_days":"7","hide_fw_copyright":"0","template":"simple","im_just_shrink":"0","watermark_position":"left bottom","watermark_text":"","allow_image_download":"1","allow_print_button":"1","hide_bottom_image":"0","hide_mignifier":"0","hide_single_image_view":"0","hide_iphone_app_promo":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10102, 'PLG_SYSTEM_VIDEOBOX', 'plugin', 'videobox', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"PLG_SYSTEM_VIDEOBOX","type":"plugin","creationDate":"August 2012","author":"Hitko","copyright":"This extension in released under the GNU\\/GPL License - http:\\/\\/www.gnu.org\\/copyleft\\/gpl.html","authorEmail":"development@hitko.si","authorUrl":"http:\\/\\/hitko.si\\/","version":"3.1.0","description":"PLG_SYSTEM_VIDEOBOX_XML_DESCRIPTION","group":""}', '{"full_url":"0","tag":"videobox","loadjq":"1","width":"640","height":"363","class":"","style":"","autoplay":"0","box":"0","width_b":"640","height_b":"363","width_bt":"188","height_bt":"141","class_b":"","style_b":"","no_lb_b":"1","play_b":"0","play_nlb_b":"0","width_g":"640","height_g":"363","width_gt":"206","height_gt":"155","break":"4","pages":"16","class_g":"","style_g":"","no_lb":"1","play_g":"0","play_nlb_g":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10103, 'jevents', 'component', 'com_jevents', '', 1, 1, 0, 0, '{"legacy":true,"name":"JEvents","type":"component","creationDate":"October 2012","author":"GWE Systems Ltd ","copyright":"(C) 2009-2012 GWE Systems Ltd, 2006-2008 JEvents Project Group","authorEmail":"","authorUrl":"http:\\/\\/www.jevents.net","version":"2.2.8","description":"Events, meetings and more","group":""}', '{"com_calViewName":"ext","darktemplate":"0","com_dateformat":"0","com_calUseStdTime":"0","com_cache":"0","com_calHeadline":"comp","com_calUseIconic":"1","iconstoshow":["bymonth"],"com_navbarcolor":"orange","com_earliestyear":"2000","com_latestyear":"2015","com_starday":"0","com_print_icon_view":"0","com_email_icon_view":"0","installlayouts":"0","com_copyright":"1","showPanelNews":"1","hideMigration":"1","mergemenus":"1","icaltimezonelive":"Asia\\/Brunei","regexsearch":"1","catseparator":"|","newsef":"0","com_blockRobots":"1","robotprior":"-1 month","robotpost":"+1 month","redirectrobots":"0","robotmenuitem":"","blockall":"0","largeDataSetLimit":"100000","jevadmin":"0","authorisedonly":"0","jevpublishown":"0","icaltimezone":"","icalkey":"SECRET_PHRASE","showicalicon":"0","disableicalexport":"0","outlook2003icalexport":"0","icalmultiday":"0","icalmultiday24h":"0","feimport":"0","allowedit":"1","icalformatted":"0","multicategory":"1","editpopup":"1","disablerepeats":"1","popupw":"800","popuph":"500","defaultcat":"0","forcepopupcalendar":"1","com_calForceCatColorEventForm":"2","com_single_pane_edit":"1","timebeforedescription":"1","com_show_editor_buttons":"1","com_editor_button_exceptions":"pagebreak,readmore","com_notifyboth":"0","com_notifyallevents":"0","com_notifyauthor":"0","showpriority":"0","multiday":"1","checkclashes":"0","noclashes":"0","skipreferrer":"0","defaultstarttime":"08:00","defaultendtime":"17:00","allowraw":"0","com_byview":"1","com_mailview":"1","com_hitsview":"1","com_repeatview":"1","contact_display_name":"0","com_calCutTitle":"15","com_calMaxDisplay":"15","com_calDisplayStarttime":"1","com_enableToolTip":"1","tooltiptype":"joomla","com_calTTBackground":"1","com_calTTPosX":"LEFT","com_calTTPosY":"BELOW","com_calTTShadow":"0","com_calTTShadowX":"0","com_calTTShadowY":"0","com_calEventListRowsPpg":"10","showyearpast":"1","com_showrepeats":"1","showyeardate":"0","com_rss_cache":"1","com_rss_cache_time":"3600","com_rss_count":"5","com_rss_live_bookmarks":"1","com_rss_modid":"0","com_rss_title":"JEvents RSS Feed for Joomla","com_rss_description":"Powered by JEvents!","com_rss_limit_text":"0","com_rss_text_length":"20","com_rss_logo":"","modcal_DispLastMonth":"NO","modcal_DispLastMonthDays":"0","modcal_DispNextMonth":"NO","modcal_DispNextMonthDays":"0","modcal_LinkCloaking":"0","modlatest_MaxEvents":"10","modlatest_Mode":"0","modlatest_Days":"5","startnow":"0","modlatest_NoRepeat":"1","modlatest_multiday":"0","modlatest_DispLinks":"1","modlatest_DispYear":"0","modlatest_DisDateStyle":"0","modlatest_DisTitleStyle":"0","modlatest_LinkToCal":"0","modlatest_LinkCloaking":"0","modlatest_SortReverse":"0","modlatest_CustFmtStr":"${eventDate}[!a: - ${endDate(%I:%M%p)}]\\r\\n${title}","modlatest_RSS":"0","modlatest_contentplugins":"0","notifymessage":"Title : {TITLE}<br\\/><br\\/>\\r\\n{DESCRIPTION}<br\\/><br\\/>\\r\\nEvent submitted from [ {LIVESITE} ] by [ {AUTHOR} ]<br\\/>\\r\\nView this event : {VIEWLINK}<br\\/>\\r\\nEdit this event : {EDITLINK}<br\\/>\\r\\nManage your events : <a href=''{MANAGEEVENTS}''>Manage Events<\\/a><br\\/>"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10104, 'JEvents Calendar', 'module', 'mod_jevents_cal', '', 0, 1, 0, 0, '{"legacy":true,"name":"JEvents Calendar","type":"module","creationDate":"October 2012","author":"GWE Systems Ltd","copyright":"(C) 2009-2012 GWE Systems Ltd, 2006-2008 JEvents Project Group","authorEmail":"","authorUrl":"http:\\/\\/www.jevents.net","version":"2.2.8","description":"Shows up to 3 different monthly calendar for JEvents component","group":""}', '{"@spacer":"JEV_LATEST_EXTRAS_TAB_LABEL","com_calViewName":"","target_itemid":"","catidnew":"","allcats":"1","modcal_useLocalParam":"0","noeventcheck":"0","ignorecatfilter":"0","ignorefiltermodule":"0","minical_showlink":"1","minical_prevyear":"1","minical_prevmonth":"1","minical_actmonth":"1","minical_actyear":"1","minical_nextmonth":"1","minical_nextyear":"1","minical_usedate":"0","modcal_DispLastMonth":"NO","modcal_DispLastMonthDays":"0","modcal_DispNextMonth":"NO","modcal_DispNextMonthDays":"0","extras0":"","extras1":"","extras2":"","extras3":"","extras4":"","extras5":"","extras6":"","extras7":"","extras8":"","extras9":"","extras10":"","extras11":"","extras12":"","extras13":"","moduleclass_sfx":"","inc_ec_css":"1","cache":"1","modcal_LinkCloaking":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10105, 'Latest JEvents', 'module', 'mod_jevents_latest', '', 0, 1, 0, 0, '{"legacy":true,"name":"Latest JEvents","type":"module","creationDate":"October 2012","author":"GWE Systems Ltd","copyright":"(C) 2009-2012 GWE Systems Ltd, 2006-2008 JEvents Project Group","authorEmail":"","authorUrl":"http:\\/\\/www.jevents.net","version":"2.2.5","description":"Show latest events for Events component","group":""}', '{"@spacer":"","com_calViewName":"","cache":"0","moduleclass_sfx":"","catidnew":"","extras0":"","extras1":"","extras2":"","extras3":"","extras4":"","extras5":"","extras6":"","extras7":"","extras8":"","extras9":"","extras10":"","extras11":"","extras12":"","extras13":"","ignorecatfilter":"0","ignorefiltermodule":"0","target_itemid":"","modlatest_inccss":"1","layout":"","modlatest_useLocalParam":"1","modlatest_CustFmtStr":"${eventDate}[!a: - ${endDate(%I:%M%p)}]<br \\/>${title}","modlatest_MaxEvents":"10","modlatest_Mode":"3","modlatest_Days":"30","startnow":"0","pastonly":"0","modlatest_NoRepeat":"0","modlatest_multiday":"0","modlatest_DispLinks":"1","modlatest_DispYear":"0","modlatest_DisDateStyle":"0","modlatest_DisTitleStyle":"0","modlatest_LinkToCal":"0","modlatest_LinkCloaking":"0","modlatest_SortReverse":"0","modlatest_RSS":"0","modlatest_rss_title":"","modlatest_rss_description":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10106, 'JEvents Legend', 'module', 'mod_jevents_legend', '', 0, 1, 0, 0, '{"legacy":true,"name":"JEvents Legend","type":"module","creationDate":"July 2012","author":"GWE Systems Ltd","copyright":"(C) 2009-2012 GWE Systems Ltd, 2006-2008 JEvents Project Group","authorEmail":"","authorUrl":"http:\\/\\/www.jevents.net","version":"2.2.3","description":"Shows legend for JEvents categories","group":""}', '{"cache":"0","moduleclass_sfx":"","show_admin":"0","modlegend_inccss":"1","nonjeventsdisable":"1","target_itemid":"","catidnew":"","hideinactivekids":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10107, 'JEvents View Switcher', 'module', 'mod_jevents_switchview', '', 0, 1, 0, 0, '{"legacy":true,"name":"JEvents View Switcher","type":"module","creationDate":"May 2010","author":"GWE Systems Ltd","copyright":"(C) 2009-2010 GWE Systems Ltd, 2006-2008 JEvents Project Group","authorEmail":"","authorUrl":"http:\\/\\/www.jevents.net","version":"1.5.5 b1770","description":"Switch views for JEvents component and modules","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10108, 'Search - JEvents', 'plugin', 'eventsearch', 'search', 0, 1, 1, 0, '{"legacy":true,"name":"Search - JEvents","type":"plugin","creationDate":"June 2012","author":"JEvents Project Group","copyright":"(C) 2008-2012 GWE Systems Ltd, 2006-2008 JEvents Project Group","authorEmail":"","authorUrl":"www.jevents.net","version":"2.2.0","description":"Events Search is a plugin to allow searching events of the Events component.","group":""}', '{"search_limit":"50","date_format":"%Y-%m-%d","target_itemid":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_filters`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_finder_taxonomy`
--

INSERT INTO `tbl_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_terms`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_finder_terms_common`
--

INSERT INTO `tbl_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finder_types`
--

CREATE TABLE IF NOT EXISTS `tbl_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_finder_types`
--

INSERT INTO `tbl_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Category', ''),
(2, 'Contact', ''),
(3, 'Article', ''),
(4, 'News Feed', ''),
(5, 'Web Link', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fwg_files`
--

CREATE TABLE IF NOT EXISTS `tbl_fwg_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `descr` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `selected` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `longitude` float NOT NULL DEFAULT '0',
  `latitude` float NOT NULL DEFAULT '0',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `name` (`name`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_fwg_files`
--

INSERT INTO `tbl_fwg_files` (`id`, `project_id`, `type_id`, `user_id`, `published`, `ordering`, `hits`, `name`, `filename`, `descr`, `created`, `selected`, `longitude`, `latitude`, `copyright`) VALUES
(1, 1, 1, 97, 1, 1, 8, 'my sis', '525666-362085110507540-779988363-n.jpg', 'The professional traditional dancer ', '2013-05-06 17:00:00', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fwg_files_vote`
--

CREATE TABLE IF NOT EXISTS `tbl_fwg_files_vote` (
  `user_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `value` tinyint(4) NOT NULL DEFAULT '0',
  `ipaddr` bigint(20) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fwg_projects`
--

CREATE TABLE IF NOT EXISTS `tbl_fwg_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `descr` text,
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_public` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `color` char(6) NOT NULL DEFAULT 'aaaaaa',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`),
  KEY `published` (`published`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_fwg_projects`
--

INSERT INTO `tbl_fwg_projects` (`id`, `parent`, `user_id`, `name`, `descr`, `ordering`, `published`, `gid`, `is_public`, `created`, `color`) VALUES
(1, 0, 97, 'My gallery', '', 1, 1, 0, 0, '2013-05-06 17:00:00', '5a3194');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fwg_types`
--

CREATE TABLE IF NOT EXISTS `tbl_fwg_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `published` tinyint(4) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `plugin` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_fwg_types`
--

INSERT INTO `tbl_fwg_types` (`id`, `published`, `name`, `plugin`) VALUES
(1, 1, 'Image', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_galleries`
--

CREATE TABLE IF NOT EXISTS `tbl_galleries` (
  `gal_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `gal_name` varchar(100) NOT NULL,
  `gal_statut` text,
  `gal_address1` text,
  `gal_address2` text,
  `gal_zipcode` int(5) DEFAULT NULL,
  `gal_city` varchar(100) DEFAULT NULL,
  `gal_country` varchar(100) DEFAULT NULL,
  `gal_phone_number` int(20) DEFAULT NULL,
  `gal_mail` varchar(100) DEFAULT NULL,
  `gal_website` varchar(100) DEFAULT NULL,
  `sur_id` int(100) unsigned NOT NULL,
  PRIMARY KEY (`gal_id`),
  KEY `sur_id` (`sur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_categories`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_categories` (
  `id` int(12) NOT NULL DEFAULT '0',
  `color` varchar(8) NOT NULL DEFAULT '',
  `overlaps` tinyint(3) NOT NULL DEFAULT '0',
  `admin` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_catmap`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_catmap` (
  `evid` int(12) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '1',
  `ordering` int(5) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `key_event_category` (`evid`,`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_jevents_catmap`
--

INSERT INTO `tbl_jevents_catmap` (`evid`, `catid`, `ordering`) VALUES
(1, 17, 0),
(5, 17, 0),
(3, 17, 0),
(4, 17, 0),
(6, 17, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_exception`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_exception` (
  `ex_id` int(12) NOT NULL AUTO_INCREMENT,
  `rp_id` int(12) NOT NULL DEFAULT '0',
  `eventid` int(12) NOT NULL DEFAULT '1',
  `eventdetail_id` int(12) NOT NULL DEFAULT '0',
  `exception_type` int(2) NOT NULL DEFAULT '0',
  `startrepeat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `oldstartrepeat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tempfield` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ex_id`),
  KEY `eventid` (`eventid`),
  KEY `rp_id` (`rp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_icsfile`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_icsfile` (
  `ics_id` int(12) NOT NULL AUTO_INCREMENT,
  `srcURL` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(30) NOT NULL DEFAULT '',
  `filename` varchar(120) NOT NULL DEFAULT '',
  `icaltype` tinyint(3) NOT NULL DEFAULT '0',
  `isdefault` tinyint(3) NOT NULL DEFAULT '0',
  `ignoreembedcat` tinyint(3) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(100) NOT NULL DEFAULT '',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `refreshed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `autorefresh` tinyint(3) NOT NULL DEFAULT '0',
  `overlaps` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ics_id`),
  UNIQUE KEY `label` (`label`),
  KEY `stateidx` (`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_jevents_icsfile`
--

INSERT INTO `tbl_jevents_icsfile` (`ics_id`, `srcURL`, `label`, `filename`, `icaltype`, `isdefault`, `ignoreembedcat`, `state`, `access`, `catid`, `created`, `created_by`, `created_by_alias`, `modified_by`, `refreshed`, `autorefresh`, `overlaps`) VALUES
(1, '', 'Default', 'Initial ICS File', 2, 1, 0, 1, 1, 17, '0000-00-00 00:00:00', 97, '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_repbyday`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_repbyday` (
  `rptday` date NOT NULL DEFAULT '0000-00-00',
  `rp_id` int(12) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '1',
  KEY `rptday` (`rptday`),
  KEY `daycat` (`rptday`,`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_repetition`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_repetition` (
  `rp_id` int(12) NOT NULL AUTO_INCREMENT,
  `eventid` int(12) NOT NULL DEFAULT '1',
  `eventdetail_id` int(12) NOT NULL DEFAULT '0',
  `duplicatecheck` varchar(32) NOT NULL DEFAULT '',
  `startrepeat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endrepeat` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`rp_id`),
  UNIQUE KEY `duplicatecheck` (`duplicatecheck`),
  KEY `eventid` (`eventid`),
  KEY `eventstart` (`eventid`,`startrepeat`),
  KEY `eventend` (`eventid`,`endrepeat`),
  KEY `eventdetail` (`eventdetail_id`),
  KEY `startrepeat` (`startrepeat`),
  KEY `startend` (`startrepeat`,`endrepeat`),
  KEY `endrepeat` (`endrepeat`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_jevents_repetition`
--

INSERT INTO `tbl_jevents_repetition` (`rp_id`, `eventid`, `eventdetail_id`, `duplicatecheck`, `startrepeat`, `endrepeat`) VALUES
(1, 1, 1, 'abf06368082e45f82b72596369f7e886', '2013-05-09 08:00:00', '2013-05-09 17:00:00'),
(5, 5, 5, '186bc3b4f982058d2537dfcc102f5557', '2013-06-06 08:00:00', '2013-06-06 17:00:00'),
(3, 3, 3, '7dfde73cb900459f8c239923cb089141', '2013-05-14 08:00:00', '2013-05-14 17:00:00'),
(4, 4, 4, '42424f973f886aed8b49959450ad8e60', '2013-05-28 08:00:00', '2013-05-28 17:00:00'),
(6, 6, 6, 'ce92a2591521050d04aab1ddfe3b3f50', '2013-06-01 08:00:00', '2013-06-01 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_rrule`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_rrule` (
  `rr_id` int(12) NOT NULL AUTO_INCREMENT,
  `eventid` int(12) NOT NULL DEFAULT '1',
  `freq` varchar(30) NOT NULL DEFAULT '',
  `until` int(12) NOT NULL DEFAULT '1',
  `untilraw` varchar(30) NOT NULL DEFAULT '',
  `count` int(6) NOT NULL DEFAULT '1',
  `rinterval` int(6) NOT NULL DEFAULT '1',
  `bysecond` varchar(50) NOT NULL DEFAULT '',
  `byminute` varchar(50) NOT NULL DEFAULT '',
  `byhour` varchar(50) NOT NULL DEFAULT '',
  `byday` varchar(50) NOT NULL DEFAULT '',
  `bymonthday` varchar(50) NOT NULL DEFAULT '',
  `byyearday` varchar(50) NOT NULL DEFAULT '',
  `byweekno` varchar(50) NOT NULL DEFAULT '',
  `bymonth` varchar(50) NOT NULL DEFAULT '',
  `bysetpos` varchar(50) NOT NULL DEFAULT '',
  `wkst` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`rr_id`),
  KEY `eventid` (`eventid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_jevents_rrule`
--

INSERT INTO `tbl_jevents_rrule` (`rr_id`, `eventid`, `freq`, `until`, `untilraw`, `count`, `rinterval`, `bysecond`, `byminute`, `byhour`, `byday`, `bymonthday`, `byyearday`, `byweekno`, `bymonth`, `bysetpos`, `wkst`) VALUES
(1, 1, 'none', 0, '', 1, 1, '', '', '', 'TH', '', '', '', '', '', ''),
(5, 5, 'none', 0, '', 1, 1, '', '', '', 'TH', '', '', '', '', '', ''),
(3, 3, 'none', 0, '', 1, 1, '', '', '', '+1TU,+2TU,+3TU,+4TU,+5TU', '', '', '', '', '', ''),
(4, 4, 'none', 0, '', 1, 1, '', '', '', 'TU', '', '', '', '', '', ''),
(6, 6, 'none', 0, '', 1, 1, '', '', '', 'SA', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_vevdetail`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_vevdetail` (
  `evdet_id` int(12) NOT NULL AUTO_INCREMENT,
  `rawdata` longtext NOT NULL,
  `dtstart` int(11) NOT NULL DEFAULT '0',
  `dtstartraw` varchar(30) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `durationraw` varchar(30) NOT NULL DEFAULT '',
  `dtend` int(11) NOT NULL DEFAULT '0',
  `dtendraw` varchar(30) NOT NULL DEFAULT '',
  `dtstamp` varchar(30) NOT NULL DEFAULT '',
  `class` varchar(10) NOT NULL DEFAULT '',
  `categories` varchar(120) NOT NULL DEFAULT '',
  `color` varchar(20) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `geolon` float NOT NULL DEFAULT '0',
  `geolat` float NOT NULL DEFAULT '0',
  `location` varchar(120) NOT NULL DEFAULT '',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `contact` varchar(120) NOT NULL DEFAULT '',
  `organizer` varchar(120) NOT NULL DEFAULT '',
  `url` text NOT NULL,
  `extra_info` varchar(240) NOT NULL DEFAULT '',
  `created` varchar(30) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT '1',
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `multiday` tinyint(3) NOT NULL DEFAULT '1',
  `hits` int(11) NOT NULL DEFAULT '0',
  `noendtime` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`evdet_id`),
  FULLTEXT KEY `searchIdx` (`summary`,`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_jevents_vevdetail`
--

INSERT INTO `tbl_jevents_vevdetail` (`evdet_id`, `rawdata`, `dtstart`, `dtstartraw`, `duration`, `durationraw`, `dtend`, `dtendraw`, `dtstamp`, `class`, `categories`, `color`, `description`, `geolon`, `geolat`, `location`, `priority`, `status`, `summary`, `contact`, `organizer`, `url`, `extra_info`, `created`, `sequence`, `state`, `modified`, `multiday`, `hits`, `noendtime`) VALUES
(1, '', 1368057600, '', 0, '', 1368090000, '', '', '', '', '', 'meetinggggg', 0, 0, '', 0, '', 'meeting', '', '', '', '', '', 0, 1, '2013-05-09 17:17:05', 1, 8, 0),
(3, '', 1368489600, '', 0, '', 1368522000, '', '', '', '', '', '', 0, 0, '', 0, '', 'fgfghfgghfjh', '', '', '', '', '', 0, 1, '2013-05-09 17:33:25', 1, 2, 0),
(4, '', 1369699200, '', 0, '', 1369731600, '', '', '', '', '', '', 0, 0, '', 0, '', 'fgfghjkhj', '', '', '', '', '', 0, 1, '2013-05-09 17:34:57', 1, 3, 0),
(5, '', 1370476800, '', 0, '', 1370509200, '', '', '', '', '', 'for bisou test', 0, 0, '', 0, '', 'bisou', '', '', '', '', '', 0, 1, '2013-05-31 15:52:18', 1, 1, 0),
(6, '', 1370044800, '', 0, '', 1370077200, '', '', '', '', '', 'this is bisou test', 0, 0, '', 0, '', 'bisou', '', '', '', '', '', 0, 1, '2013-05-31 15:52:55', 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jevents_vevent`
--

CREATE TABLE IF NOT EXISTS `tbl_jevents_vevent` (
  `ev_id` int(12) NOT NULL AUTO_INCREMENT,
  `icsid` int(12) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '1',
  `uid` varchar(255) NOT NULL DEFAULT '',
  `refreshed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(100) NOT NULL DEFAULT '',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `rawdata` longtext NOT NULL,
  `recurrence_id` varchar(30) NOT NULL DEFAULT '',
  `detail_id` int(12) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `lockevent` tinyint(3) NOT NULL DEFAULT '0',
  `author_notified` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ev_id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `icsid` (`icsid`),
  KEY `stateidx` (`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_jevents_vevent`
--

INSERT INTO `tbl_jevents_vevent` (`ev_id`, `icsid`, `catid`, `uid`, `refreshed`, `created`, `created_by`, `created_by_alias`, `modified_by`, `rawdata`, `recurrence_id`, `detail_id`, `state`, `lockevent`, `author_notified`, `access`) VALUES
(1, 1, 17, '24710d45c669d43ad5eedaa0eadb7479', '0000-00-00 00:00:00', '2013-05-09 17:17:05', 97, '', 97, 'a:18:{s:3:"UID";s:32:"24710d45c669d43ad5eedaa0eadb7479";s:11:"X-EXTRAINFO";s:0:"";s:8:"LOCATION";s:0:"";s:11:"allDayEvent";s:3:"off";s:7:"CONTACT";s:0:"";s:11:"DESCRIPTION";s:11:"meetinggggg";s:12:"publish_down";s:10:"2013-05-09";s:10:"publish_up";s:10:"2013-05-09";s:7:"SUMMARY";s:7:"meeting";s:3:"URL";s:0:"";s:11:"X-CREATEDBY";i:97;s:7:"DTSTART";i:1368057600;s:5:"DTEND";i:1368090000;s:5:"RRULE";a:4:{s:4:"FREQ";s:4:"none";s:5:"COUNT";i:1;s:8:"INTERVAL";s:1:"1";s:5:"BYDAY";s:2:"TH";}s:8:"MULTIDAY";s:1:"1";s:9:"NOENDTIME";s:1:"0";s:7:"X-COLOR";s:0:"";s:9:"LOCKEVENT";s:1:"0";}', '', 1, 1, 0, 0, 1),
(5, 1, 17, '2d70bfa4aa739ea5b1cd39cb8a1e963f', '0000-00-00 00:00:00', '2013-05-31 15:52:18', 97, '', 97, 'a:18:{s:3:"UID";s:32:"2d70bfa4aa739ea5b1cd39cb8a1e963f";s:11:"X-EXTRAINFO";s:0:"";s:8:"LOCATION";s:0:"";s:11:"allDayEvent";s:3:"off";s:7:"CONTACT";s:0:"";s:11:"DESCRIPTION";s:14:"for bisou test";s:12:"publish_down";s:10:"2013-06-06";s:10:"publish_up";s:10:"2013-06-06";s:7:"SUMMARY";s:5:"bisou";s:3:"URL";s:0:"";s:11:"X-CREATEDBY";i:97;s:7:"DTSTART";i:1370476800;s:5:"DTEND";i:1370509200;s:5:"RRULE";a:4:{s:4:"FREQ";s:4:"none";s:5:"COUNT";i:1;s:8:"INTERVAL";s:1:"1";s:5:"BYDAY";s:2:"TH";}s:8:"MULTIDAY";s:1:"1";s:9:"NOENDTIME";s:1:"0";s:7:"X-COLOR";s:0:"";s:9:"LOCKEVENT";s:1:"0";}', '', 5, 1, 0, 0, 1),
(3, 1, 17, '660ddfca0b533ad8f578601a0d10ccdd', '0000-00-00 00:00:00', '2013-05-09 17:33:20', 98, '', 97, 'a:18:{s:3:"UID";s:32:"660ddfca0b533ad8f578601a0d10ccdd";s:11:"X-EXTRAINFO";s:0:"";s:8:"LOCATION";s:0:"";s:11:"allDayEvent";s:3:"off";s:7:"CONTACT";s:0:"";s:11:"DESCRIPTION";s:0:"";s:12:"publish_down";s:10:"2013-05-14";s:10:"publish_up";s:10:"2013-05-14";s:7:"SUMMARY";s:12:"fgfghfgghfjh";s:3:"URL";s:0:"";s:11:"X-CREATEDBY";i:98;s:7:"DTSTART";i:1368489600;s:5:"DTEND";i:1368522000;s:5:"RRULE";a:4:{s:4:"FREQ";s:4:"none";s:5:"COUNT";i:1;s:8:"INTERVAL";s:1:"1";s:5:"BYDAY";s:24:"+1TU,+2TU,+3TU,+4TU,+5TU";}s:8:"MULTIDAY";s:1:"1";s:9:"NOENDTIME";s:1:"0";s:7:"X-COLOR";s:0:"";s:9:"LOCKEVENT";s:1:"0";}', '', 3, 1, 0, 0, 1),
(4, 1, 17, '01361e1def9e5861af59fb8f462e3f08', '0000-00-00 00:00:00', '2013-05-09 17:34:57', 97, '', 97, 'a:18:{s:3:"UID";s:32:"01361e1def9e5861af59fb8f462e3f08";s:11:"X-EXTRAINFO";s:0:"";s:8:"LOCATION";s:0:"";s:11:"allDayEvent";s:3:"off";s:7:"CONTACT";s:0:"";s:11:"DESCRIPTION";s:0:"";s:12:"publish_down";s:10:"2013-05-28";s:10:"publish_up";s:10:"2013-05-28";s:7:"SUMMARY";s:9:"fgfghjkhj";s:3:"URL";s:0:"";s:11:"X-CREATEDBY";i:97;s:7:"DTSTART";i:1369699200;s:5:"DTEND";i:1369731600;s:5:"RRULE";a:4:{s:4:"FREQ";s:4:"none";s:5:"COUNT";i:1;s:8:"INTERVAL";s:1:"1";s:5:"BYDAY";s:2:"TU";}s:8:"MULTIDAY";s:1:"1";s:9:"NOENDTIME";s:1:"0";s:7:"X-COLOR";s:0:"";s:9:"LOCKEVENT";s:1:"0";}', '', 4, 1, 0, 0, 1),
(6, 1, 17, 'b019187df0a7dfc1cd7d8fef4ca121ee', '0000-00-00 00:00:00', '2013-05-31 15:52:55', 97, '', 97, 'a:18:{s:3:"UID";s:32:"b019187df0a7dfc1cd7d8fef4ca121ee";s:11:"X-EXTRAINFO";s:0:"";s:8:"LOCATION";s:0:"";s:11:"allDayEvent";s:3:"off";s:7:"CONTACT";s:0:"";s:11:"DESCRIPTION";s:18:"this is bisou test";s:12:"publish_down";s:10:"2013-06-01";s:10:"publish_up";s:10:"2013-06-01";s:7:"SUMMARY";s:5:"bisou";s:3:"URL";s:0:"";s:11:"X-CREATEDBY";i:97;s:7:"DTSTART";i:1370044800;s:5:"DTEND";i:1370077200;s:5:"RRULE";a:4:{s:4:"FREQ";s:4:"none";s:5:"COUNT";i:1;s:8:"INTERVAL";s:1:"1";s:5:"BYDAY";s:2:"SA";}s:8:"MULTIDAY";s:1:"1";s:9:"NOENDTIME";s:1:"0";s:7:"X-COLOR";s:0:"";s:9:"LOCKEVENT";s:1:"0";}', '', 6, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jev_defaults`
--

CREATE TABLE IF NOT EXISTS `tbl_jev_defaults` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `subject` text NOT NULL,
  `value` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_jev_defaults`
--

INSERT INTO `tbl_jev_defaults` (`id`, `title`, `name`, `subject`, `value`, `state`, `params`) VALUES
(1, 'Event Detail Page', 'icalevent.detail_body', '', '', 0, ''),
(2, 'List Row Detail', 'icalevent.list_row', '', '', 0, ''),
(3, 'Monthly Calendar Cell', 'month.calendar_cell', '', '', 1, ''),
(4, 'Monthly Calendar Tooltip (Joomla Tooltip Only)', 'month.calendar_tip', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jev_users`
--

CREATE TABLE IF NOT EXISTS `tbl_jev_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(2) NOT NULL DEFAULT '0',
  `canuploadimages` tinyint(2) NOT NULL DEFAULT '0',
  `canuploadmovies` tinyint(2) NOT NULL DEFAULT '0',
  `cancreate` tinyint(2) NOT NULL DEFAULT '0',
  `canedit` tinyint(2) NOT NULL DEFAULT '0',
  `canpublishown` tinyint(2) NOT NULL DEFAULT '0',
  `candeleteown` tinyint(2) NOT NULL DEFAULT '0',
  `canpublishall` tinyint(2) NOT NULL DEFAULT '0',
  `candeleteall` tinyint(2) NOT NULL DEFAULT '0',
  `cancreateown` tinyint(2) NOT NULL DEFAULT '0',
  `cancreateglobal` tinyint(2) NOT NULL DEFAULT '0',
  `eventslimit` int(11) NOT NULL DEFAULT '0',
  `extraslimit` int(11) NOT NULL DEFAULT '0',
  `categories` varchar(255) NOT NULL DEFAULT '',
  `calendars` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_attachments`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `titleAttribute` text NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_categories`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `extraFieldsGroup` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`published`,`access`,`trash`),
  KEY `parent` (`parent`),
  KEY `ordering` (`ordering`),
  KEY `published` (`published`),
  KEY `access` (`access`),
  KEY `trash` (`trash`),
  KEY `language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_comments`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `commentDate` datetime NOT NULL,
  `commentText` text NOT NULL,
  `commentEmail` varchar(255) NOT NULL,
  `commentURL` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`),
  KEY `userID` (`userID`),
  KEY `published` (`published`),
  KEY `latestComments` (`published`,`commentDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_extra_fields`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `group` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `published` (`published`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_extra_fields_groups`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_extra_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_items`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `video` text,
  `gallery` varchar(255) DEFAULT NULL,
  `extra_fields` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `extra_fields_search` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `featured` smallint(6) NOT NULL DEFAULT '0',
  `featured_ordering` int(11) NOT NULL DEFAULT '0',
  `image_caption` text NOT NULL,
  `image_credits` varchar(255) NOT NULL,
  `video_caption` text NOT NULL,
  `video_credits` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  `params` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `metakey` text NOT NULL,
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`published`,`publish_up`,`publish_down`,`trash`,`access`),
  KEY `catid` (`catid`),
  KEY `created_by` (`created_by`),
  KEY `ordering` (`ordering`),
  KEY `featured` (`featured`),
  KEY `featured_ordering` (`featured_ordering`),
  KEY `hits` (`hits`),
  KEY `created` (`created`),
  KEY `language` (`language`),
  FULLTEXT KEY `search` (`title`,`introtext`,`fulltext`,`extra_fields_search`,`image_caption`,`image_credits`,`video_caption`,`video_credits`,`metadesc`,`metakey`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_rating`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_rating` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_tags`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_tags_xref`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_tags_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagID` (`tagID`),
  KEY `itemID` (`itemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_users`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL DEFAULT 'm',
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tbl_k2_users`
--

INSERT INTO `tbl_k2_users` (`id`, `userID`, `userName`, `gender`, `description`, `image`, `url`, `group`, `plugins`, `ip`, `hostname`, `notes`) VALUES
(1, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(2, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(3, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(4, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(5, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(6, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(7, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(8, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(9, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(10, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(11, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(12, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(13, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', ''),
(14, 0, NULL, 'm', '', NULL, NULL, 1, '', '::1', 'Dell', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_k2_user_groups`
--

CREATE TABLE IF NOT EXISTS `tbl_k2_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_languages`
--

CREATE TABLE IF NOT EXISTS `tbl_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_languages`
--

INSERT INTO `tbl_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loginradius_settings`
--

CREATE TABLE IF NOT EXISTS `tbl_loginradius_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting` varchar(255) NOT NULL,
  `value` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting` (`setting`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=496 ;

--
-- Dumping data for table `tbl_loginradius_settings`
--

INSERT INTO `tbl_loginradius_settings` (`id`, `setting`, `value`) VALUES
(462, 'apikey', 'ac0fc0a1-5683-4d94-ad79-3d826708ef6e'),
(463, 'apisecret', '0f9717fc-9356-476c-84e7-8661b69700bc'),
(464, 'useapi', '1'),
(465, 'setredirct', ''),
(466, 'linkaccount', '1'),
(467, 'sendemail', '1'),
(468, 'dummyemail', '1'),
(469, 'emailtitle', 'You are trying to connect with %s account'),
(470, 'emailrequiredmessage', 'Unfortunatly we could not retrieve any email from your %s account. Please enter your email address in the form below in order to continue.'),
(471, 'emailinvalidmessage', 'This email is invalid. Please enter a valid email'),
(472, 'showname', '1'),
(473, 'showwithicons', '1'),
(474, 'showicons', '0'),
(475, 'showlogout', '1'),
(476, 'enableshare', '1'),
(477, 'beforesharetitle', 'Share it now!'),
(478, 'chooseshare', '4'),
(479, 'choosesharepos', '0'),
(480, 'verticalsharetopoffset', '200'),
(481, 'enablefb', 'facebook'),
(482, 'enabletwitter', 'twitter'),
(483, 'enablepin', 'pinterest'),
(484, 'enablegplus', 'googleplus'),
(485, 'enablelinkedin', 'linkedin'),
(486, 'sharepos', '0'),
(487, 'enablecounter', '0'),
(488, 'beforecountertitle', 'Be a fan!'),
(489, 'choosecounter', '0'),
(490, 'choosecounterpos', '0'),
(491, 'verticalcountertopoffset', ''),
(492, 'counterpos', '0'),
(493, 's_articles', 'a:40:{i:0;s:2:"42";i:1;s:2:"39";i:2;s:2:"38";i:3;s:2:"31";i:4;s:2:"35";i:5;s:2:"30";i:6;s:2:"19";i:7;s:2:"37";i:8;s:2:"41";i:9;s:2:"11";i:10;s:2:"21";i:11;s:2:"29";i:12;s:2:"33";i:13;s:2:"36";i:14;s:2:"18";i:15;s:2:"10";i:16;s:2:"28";i:17;s:2:"17";i:18;s:2:"32";i:19;s:1:"9";i:20;s:1:"8";i:21;s:2:"16";i:22;s:2:"27";i:23;s:2:"26";i:24;s:1:"7";i:25;s:2:"15";i:26;s:2:"14";i:27;s:2:"25";i:28;s:1:"6";i:29;s:1:"5";i:30;s:2:"24";i:31;s:2:"13";i:32;s:2:"12";i:33;s:2:"23";i:34;s:1:"4";i:35;s:2:"22";i:36;s:1:"3";i:37;s:1:"2";i:38;s:2:"20";i:39;s:1:"1";}'),
(494, 'c_articles', ''),
(495, 'rearrange_settings', 'a:5:{i:0;s:8:"facebook";i:1;s:10:"googleplus";i:2;s:7:"twitter";i:3;s:8:"linkedin";i:4;s:9:"pinterest";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loginradius_users`
--

CREATE TABLE IF NOT EXISTS `tbl_loginradius_users` (
  `id` int(11) DEFAULT NULL,
  `LoginRadius_id` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `lr_picture` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_loginradius_users`
--

INSERT INTO `tbl_loginradius_users` (`id`, `LoginRadius_id`, `provider`, `lr_picture`, `dob`, `gender`) VALUES
(97, '100001181617699', 'facebook', '100001181617699.jpg', NULL, NULL),
(97, 'MUR5BU3GO1', 'linkedin', 'MUR5BU3GO1.jpg', NULL, NULL),
(115, '101168011683787395082', 'google', 'NypisitChhorn115.jpg', NULL, NULL),
(98, '113966114507040965445', 'google', '113966114507040965445.jpg', NULL, NULL),
(189, '110848539268946865997', 'google', '110848539268946865997.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=183 ;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 189, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 45, 46, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 37, 38, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 39, 44, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 40, 41, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 42, 43, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 35, 36, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 47, 48, 0, '*', 1),
(101, 'mainmenu', 'Profile', 'profile', '', 'profile', 'index.php?option=com_content&view=article&id=21', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"Metropolis - November 2012 Template Demo","show_page_heading":0,"page_heading":"","pageclass_sfx":" nov12-home","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"Welcome","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"125","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 29, 34, 1, '*', 0),
(103, 'main', 'RokCandy', 'rokcandy', '', 'rokcandy', 'index.php?option=com_rokcandy', 'component', 0, 1, 1, 10017, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_rokcandy/assets/rokcandy-icon-16.png', 0, '', 49, 54, 0, '', 1),
(104, 'main', 'Macros', 'macros', '', 'rokcandy/macros', 'index.php?option=com_rokcandy', 'component', 0, 103, 2, 10017, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_rokcandy/assets/rokcandy-icon-16.png', 0, '', 50, 51, 0, '', 1),
(105, 'main', 'Categories', 'categories', '', 'rokcandy/categories', 'index.php?option=com_categories&extension=com_rokcandy', 'component', 0, 103, 2, 10017, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_rokcandy/assets/icon-16-category.png', 0, '', 52, 53, 0, '', 1),
(108, 'mainmenu', 'Features', 'features', '', 'features', 'index.php?option=com_content&view=article&id=1', 'component', 0, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"37","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"173","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 75, 106, 0, '*', 0),
(109, 'mainmenu', 'Module Positions', 'module-positions', '', 'features/module-positions', 'index.php?option=com_content&view=article&id=2', 'component', 0, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 8, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 76, 77, 0, '*', 0),
(110, 'mainmenu', 'Module Variations', 'module-variations', '', 'features/module-variations', 'index.php?option=com_content&view=article&id=3', 'component', 0, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 9, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 78, 79, 0, '*', 0),
(111, 'mainmenu', 'Typography', 'typography', '', 'features/typography', 'index.php?option=com_content&view=article&id=4', 'component', 0, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 80, 81, 0, '*', 0),
(112, 'mainmenu', 'Menu Options', 'menu-options', '', 'features/menu-options', 'index.php?option=com_content&view=article&id=5', 'component', 0, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_columns":"2","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"360","dropdown_column_widths":"180,180","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"125","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 82, 99, 0, '*', 0),
(113, 'mainmenu', 'Extensions', 'extensions', '', 'features/extensions', 'index.php?option=com_content&view=article&id=6', 'component', 0, 108, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 100, 101, 0, '*', 0),
(114, 'mainmenu', 'Tutorials', 'tutorials', '', 'tutorials', 'index.php?option=com_content&view=article&id=7', 'component', 0, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"Guides","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"37","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"125","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 65, 74, 0, '*', 0),
(115, 'mainmenu', 'Installation', 'installation', '', 'tutorials/installation', 'index.php?option=com_content&view=article&id=8', 'component', 0, 114, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 66, 67, 0, '*', 0),
(116, 'mainmenu', 'Logo Editing', 'logo-editing', '', 'tutorials/logo-editing', 'index.php?option=com_content&view=article&id=9', 'component', 0, 114, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 68, 69, 0, '*', 0),
(117, 'mainmenu', 'Styles', 'styles', '', 'styles', 'index.php?option=com_content&view=article&id=10', 'component', 0, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"57","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"200","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"modules","dropdown_modules":"182","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 107, 108, 0, '*', 0),
(118, 'mainmenu', 'J! Stuff', 'j-stuff', '', 'j-stuff', 'index.php?option=com_content&view=article&id=11', 'component', 0, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"Essential Pages","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"32","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"125","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 109, 116, 0, '*', 0),
(119, 'mainmenu', '404 Error Page', '2012-10-08-13-46-27', '', 'features/2012-10-08-13-46-27', 'index.php?Itemid=404', 'url', 0, 108, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 102, 103, 0, '*', 0),
(120, 'mainmenu', 'More Details', '2012-10-08-13-46-59', '', 'features/2012-10-08-13-46-59', 'http://www.rockettheme.com/joomla-templates/metropolis', 'url', 0, 108, 2, 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 104, 105, 0, '*', 0),
(121, 'mainmenu', 'Forum Guides', '2012-10-08-13-48-36', '', 'tutorials/2012-10-08-13-48-36', 'http://www.rockettheme.com/forum/index.php?f=675&rb_v=viewforum', 'url', 0, 114, 2, 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 70, 71, 0, '*', 0),
(122, 'mainmenu', 'Gantry Framework', '2012-10-08-13-49-04', '', 'tutorials/2012-10-08-13-49-04', 'http://www.gantry-framework.org/documentation', 'url', 0, 114, 2, 0, 0, 0, '0000-00-00 00:00:00', 1, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 72, 73, 0, '*', 0),
(123, 'mainmenu', 'Member Access', 'member-access', '', 'j-stuff/member-access', 'index.php?option=com_users&view=login', 'component', 0, 118, 2, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"The RocketTheme Joomla Template Club features exclusive access to professional Joomla templates to help transform your Joomla based site and set you apart from the competition. Complimentary access to to the new RocketTheme Extensions Club is provided for all RocketTheme Joomla Club members.","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"Member Access","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 110, 111, 0, '*', 0),
(124, 'mainmenu', 'Category Blog', 'category-blog', '', 'j-stuff/category-blog', 'index.php?option=com_content&view=category&layout=blog&id=12', 'component', 0, 118, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"1","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"1","show_item_navigation":"1","show_vote":"1","show_readmore":"","show_readmore_title":"","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 112, 113, 0, '*', 0),
(125, 'mainmenu', 'Web Links', 'web-links', '', 'j-stuff/web-links', 'index.php?option=com_weblinks&view=category&id=13', 'component', 0, 118, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_num_links":"","show_pagination_limit":"0","show_headings":"0","show_link_description":"","show_link_hits":"","show_pagination":"0","show_pagination_results":"0","show_feed_link":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"125","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 114, 115, 0, '*', 0),
(126, 'mainmenu', 'Menu Examples', 'menu-examples', '', 'features/menu-options/menu-examples', 'index.php?Itemid=', 'alias', 0, 112, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"112","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"1","dropdown_children_type":"menuitems","dropdown_modules":"125","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 83, 90, 0, '*', 0),
(127, 'mainmenu', 'Menu Types', 'menu-types', '', 'features/menu-options/menu-types', 'index.php?Itemid=', 'alias', 0, 112, 3, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"112","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"1","dropdown_children_type":"menuitems","dropdown_modules":"125","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 91, 98, 0, '*', 0),
(128, 'mainmenu', 'Child Item', 'child-item', '', 'features/menu-options/menu-examples/child-item', 'index.php?Itemid=', 'alias', 0, 126, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"112","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 84, 85, 0, '*', 0),
(129, 'mainmenu', 'Menu Icon', 'menu-icon', '', 'features/menu-options/menu-examples/menu-icon', 'index.php?Itemid=', 'alias', 0, 126, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"112","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"icon-list-ul","dropdown_customclass":"","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 86, 87, 0, '*', 0),
(130, 'mainmenu', 'Module Menu', 'module-menu', '', 'features/menu-options/menu-examples/module-menu', 'index.php?Itemid=', 'alias', 0, 126, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"112","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"250","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"modulepos","dropdown_modules":"144","dropdown_module_positions":"menu-mod","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 88, 89, 0, '*', 0),
(131, 'mainmenu', 'Dropdown Menu', '2012-10-08-14-28-44', '', 'features/menu-options/menu-types/2012-10-08-14-28-44', 'index.php?option=com_content&view=article&id=5&Itemid=112&menu-type=dropdownmenu', 'url', 0, 127, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 92, 93, 0, '*', 0),
(132, 'mainmenu', 'SplitMenu', '2012-10-08-14-28-45', '', 'features/menu-options/menu-types/2012-10-08-14-28-45', 'index.php?option=com_content&view=article&id=5&Itemid=112&menu-type=splitmenu', 'url', 0, 127, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 94, 95, 0, '*', 0),
(133, 'mainmenu', 'No Menu', '2012-10-08-14-28-46', '', 'features/menu-options/menu-types/2012-10-08-14-28-46', 'index.php?option=com_content&view=article&id=5&Itemid=112&menu-type=nomenu', 'url', 0, 127, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 96, 97, 0, '*', 0),
(134, 'copyrightmenu', 'Guides', 'guides', '', 'guides', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"114","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 117, 118, 0, '*', 0),
(135, 'copyrightmenu', 'Addons', 'addons', '', 'addons', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"113","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 119, 120, 0, '*', 0),
(136, 'copyrightmenu', 'Menu', 'menu', '', 'menu', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"112","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 121, 122, 0, '*', 0),
(137, 'copyrightmenu', 'Presets', 'presets', '', 'presets', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"117","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 123, 124, 0, '*', 0),
(140, 'main', 'COM_SOCIALLOGINANDSOCIALSHARE', 'com-socialloginandsocialshare', '', 'com-socialloginandsocialshare', 'index.php?option=com_socialloginandsocialshare', 'component', 0, 1, 1, 10052, 0, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_socialloginandsocialshare/images/favicon.png', 0, '', 125, 126, 0, '', 1),
(142, 'mainmenu', 'About Us', 'about-us', '', 'about-us', 'index.php?option=com_users&view=profile', 'component', 0, 1, 1, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 127, 132, 0, '*', 0),
(143, 'main', 'RokGallery', 'rokgallery', '', 'rokgallery', 'index.php?option=com_rokgallery', 'component', 0, 1, 1, 10055, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_rokgallery/assets/images/rokgallery_16x16.png', 0, '', 133, 134, 0, '', 1),
(144, 'mainmenu', 'fuck', 'fuck', '', 'about-us/fuck', 'index.php?option=com_users&view=login', 'component', 0, 142, 2, 25, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"177","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 128, 129, 0, '*', 0),
(145, 'mainmenu', 'User Blog', 'user-blog', '', 'about-us/user-blog', 'index.php?option=com_content&view=category&layout=blog&id=2', 'component', 0, 142, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"188","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 130, 131, 0, '*', 0),
(146, 'main', 'COM_K2', 'com-k2', '', 'com-k2', 'index.php?option=com_k2', 'component', 0, 1, 1, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, '../media/k2/assets/images/system/k2_16x16.png', 0, '', 135, 156, 0, '', 1),
(147, 'main', 'K2_ITEMS', 'k2-items', '', 'com-k2/k2-items', 'index.php?option=com_k2&view=items', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 136, 137, 0, '', 1),
(148, 'main', 'K2_CATEGORIES', 'k2-categories', '', 'com-k2/k2-categories', 'index.php?option=com_k2&view=categories', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 138, 139, 0, '', 1),
(149, 'main', 'K2_TAGS', 'k2-tags', '', 'com-k2/k2-tags', 'index.php?option=com_k2&view=tags', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 140, 141, 0, '', 1),
(150, 'main', 'K2_COMMENTS', 'k2-comments', '', 'com-k2/k2-comments', 'index.php?option=com_k2&view=comments', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 142, 143, 0, '', 1),
(151, 'main', 'K2_USERS', 'k2-users', '', 'com-k2/k2-users', 'index.php?option=com_k2&view=users', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 144, 145, 0, '', 1),
(152, 'main', 'K2_USER_GROUPS', 'k2-user-groups', '', 'com-k2/k2-user-groups', 'index.php?option=com_k2&view=usergroups', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 146, 147, 0, '', 1),
(153, 'main', 'K2_EXTRA_FIELDS', 'k2-extra-fields', '', 'com-k2/k2-extra-fields', 'index.php?option=com_k2&view=extrafields', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 148, 149, 0, '', 1),
(154, 'main', 'K2_EXTRA_FIELD_GROUPS', 'k2-extra-field-groups', '', 'com-k2/k2-extra-field-groups', 'index.php?option=com_k2&view=extrafieldsgroups', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 150, 151, 0, '', 1),
(155, 'main', 'K2_MEDIA_MANAGER', 'k2-media-manager', '', 'com-k2/k2-media-manager', 'index.php?option=com_k2&view=media', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 152, 153, 0, '', 1),
(156, 'main', 'K2_INFORMATION', 'k2-information', '', 'com-k2/k2-information', 'index.php?option=com_k2&view=info', 'component', 0, 146, 2, 10070, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 154, 155, 0, '', 1),
(160, 'mainmenu', 'Gallery', 'talents', '', 'talents', 'index.php?option=com_content&view=article&id=38', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"0","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/images.jpg","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"194","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 55, 64, 0, '*', 0),
(161, 'mainmenu', 'Musics', 'musics', '', 'talents/musics', 'index.php?option=com_rokgallery&view=gallery', 'component', 1, 160, 2, 10055, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"gallery_id":"2","default_layout":"grid-4col","default_style":"light","default_sort_by":"gallery_ordering","default_sort_direction":"ASC","slice_link_to":"default","show_sorts":"1","show_available_layouts":"1","pages_in_shown_range":"7","grid-3col-items_per_row":"3","grid-3col-rows_per_page":"4","grid-4col-items_per_row":"4","grid-4col-rows_per_page":"4","list-2col-items_per_row":"2","list-2col-rows_per_page":"6","gallery_show_title":"1","gallery_use_title_from":"slice","gallery_show_caption":"1","gallery_use_caption_from":"slice","gallery_show_tags":"1","gallery_use_tags_from":"combined","gallery_remove_gallery_tags":"1","gallery_show_tags_count":"1","gallery_show_created_at":"1","gallery_show_loves":"1","gallery_show_views":"1","detail_show_title":"1","detail_use_title_from":"slice","detail_show_caption":"1","detail_use_caption_from":"slice","detail_show_tags":"1","detail_use_tags_from":"combined","detail_remove_gallery_tags":"1","detail_show_tags_count":"1","detail_show_created_at":"1","detail_show_updated_at":"1","detail_show_loves":"1","detail_show_views":"1","detail_show_filesize":"1","detail_use_filesize_from":"file","detail_show_dimensions":"1","detail_use_dimensions_from":"file","detail_show_download_full":"1","detail_show_gallery_info":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"194","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 56, 57, 0, '*', 0),
(163, 'main', 'Galleries', 'galleries', '', 'fw-gallery/galleries', 'index.php?option=com_fwgallery&view=fwgallery', 'component', 0, 162, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/galleries.png', 0, '', 158, 159, 0, '', 1),
(164, 'main', 'Images', 'images', '', 'fw-gallery/images', 'index.php?option=com_fwgallery&view=files', 'component', 0, 162, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/images.png', 0, '', 160, 161, 0, '', 1),
(165, 'main', 'Plugins', 'plugins', '', 'fw-gallery/plugins', 'index.php?option=com_fwgallery&view=plugins', 'component', 0, 162, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/plugins.png', 0, '', 162, 163, 0, '', 1),
(166, 'main', 'Templates', 'templates', '', 'fw-gallery/templates', 'index.php?option=com_fwgallery&view=templates', 'component', 0, 162, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/templates.png', 0, '', 164, 165, 0, '', 1),
(167, 'main', 'Config', 'config', '', 'fw-gallery/config', 'index.php?option=com_fwgallery&view=config', 'component', 0, 162, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/fwconfig.png', 0, '', 166, 167, 0, '', 1),
(168, 'main', 'iPhone App', 'iphone-app', '', 'fw-gallery/iphone-app', 'index.php?option=com_fwgallery&view=iphone', 'component', 0, 162, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/iphone.png', 0, '', 168, 169, 0, '', 1),
(169, 'main', 'FW Gallery', 'fw-gallery', '', 'fw-gallery', 'index.php?option=com_fwgallery', 'component', 0, 1, 1, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/fwgalleryicon.png', 0, '', 171, 184, 0, '', 1),
(170, 'main', 'Galleries', 'galleries', '', 'fw-gallery/galleries', 'index.php?option=com_fwgallery&view=fwgallery', 'component', 0, 169, 2, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/galleries.png', 0, '', 172, 173, 0, '', 1),
(171, 'main', 'Images', 'images', '', 'fw-gallery/images', 'index.php?option=com_fwgallery&view=files', 'component', 0, 169, 2, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/images.png', 0, '', 174, 175, 0, '', 1),
(172, 'main', 'Plugins', 'plugins', '', 'fw-gallery/plugins', 'index.php?option=com_fwgallery&view=plugins', 'component', 0, 169, 2, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/plugins.png', 0, '', 176, 177, 0, '', 1),
(173, 'main', 'Templates', 'templates', '', 'fw-gallery/templates', 'index.php?option=com_fwgallery&view=templates', 'component', 0, 169, 2, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/templates.png', 0, '', 178, 179, 0, '', 1),
(174, 'main', 'Config', 'config', '', 'fw-gallery/config', 'index.php?option=com_fwgallery&view=config', 'component', 0, 169, 2, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/fwconfig.png', 0, '', 180, 181, 0, '', 1),
(175, 'main', 'iPhone App', 'iphone-app', '', 'fw-gallery/iphone-app', 'index.php?option=com_fwgallery&view=iphone', 'component', 0, 169, 2, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_fwgallery/assets/images/iphone.png', 0, '', 182, 183, 0, '', 1),
(176, 'mainmenu', 'Dancer ', 'dancer', '', 'talents/dancer', 'index.php?option=com_fwgallery&view=gallery', 'component', 1, 160, 2, 10101, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 7, '{"id":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"traditional dancer ","menu-meta_keywords":"dancer ","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"25","dropdown_column_widths":"25","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"192","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 58, 59, 0, '*', 0),
(177, 'mainmenu', 'Video', 'video', '', 'talents/video', 'index.php?option=com_content&view=article&id=42', 'component', 1, 160, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"194","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 60, 61, 0, '*', 0),
(178, 'main', 'com_jevents', 'com-jevents', '', 'com-jevents', 'index.php?option=com_jevents', 'component', 0, 1, 1, 10103, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 185, 186, 0, '', 1),
(179, 'mainmenu', 'Calender', 'calender', '', 'talents/calender', 'index.php?option=com_jevents&view=month&layout=calendar', 'component', 1, 160, 2, 10103, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"com_calViewName":"global","com_calUseIconic":"1","iconstoshow":["byyear","bymonth","byweek","byday","search"],"showyearpast":"1","overridelayout":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"195","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 62, 63, 0, '*', 0);
INSERT INTO `tbl_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(180, 'mainmenu', 'CA', 'ca', '', 'profile/ca', 'index.php?option=com_jevents&view=icalevent&layout=edit', 'component', -2, 101, 2, 10103, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"com_calUseIconic":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"195","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 30, 31, 0, '*', 0),
(181, 'mainmenu', 'CAA', 'caa', '', 'profile/caa', 'index.php?option=com_jevents&view=icals&layout=ical', 'component', -2, 101, 2, 10103, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"icalcache":"1440","constrained":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"195","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 32, 33, 0, '*', 0),
(182, 'mainmenu', 'News Feed ', 'news-feed', '', 'news-feed', 'index.php?option=com_content&view=article&id=43', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"dropdown_item_subtext":"","dropdown_customimage":"","dropdown_customicon":"","dropdown_customclass":"","dropdown_offset":"0","dropdown_columns":"1","dropdown_distribution":"even","dropdown_manual_distribution":"","dropdown_dropdown_width":"","dropdown_column_widths":"","dropdown_children_group":"0","dropdown_children_type":"menuitems","dropdown_modules":"213","dropdown_module_positions":"","splitmenu_item_subtext":"","splitmenu_customimage":"","splitmenu_customicon":"","splitmenu_customclass":""}', 187, 188, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_types`
--

CREATE TABLE IF NOT EXISTS `tbl_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_menu_types`
--

INSERT INTO `tbl_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'copyrightmenu', 'Copyright Menu', 'Copyright Menu');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE IF NOT EXISTS `tbl_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=250 ;

--
-- Dumping data for table `tbl_messages`
--

INSERT INTO `tbl_messages` (`message_id`, `user_id_from`, `user_id_to`, `folder_id`, `date_time`, `state`, `priority`, `subject`, `message`) VALUES
(5, 98, 98, 0, '2013-04-29 01:45:38', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: fan001'),
(6, 99, 99, 0, '2013-04-29 01:45:38', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: fan001'),
(8, 98, 98, 0, '2013-04-29 01:48:36', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: artist001'),
(9, 99, 99, 0, '2013-04-29 01:48:36', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: artist001'),
(11, 98, 98, 0, '2013-05-09 03:14:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man'),
(12, 99, 99, 0, '2013-05-09 03:14:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man'),
(14, 98, 98, 0, '2013-05-09 03:23:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man23'),
(15, 99, 99, 0, '2013-05-09 03:23:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man23'),
(17, 98, 98, 0, '2013-05-09 03:29:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(18, 99, 99, 0, '2013-05-09 03:29:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(20, 98, 98, 0, '2013-05-09 04:10:22', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(21, 99, 99, 0, '2013-05-09 04:10:22', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(23, 98, 98, 0, '2013-05-09 04:13:24', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(24, 99, 99, 0, '2013-05-09 04:13:24', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(26, 98, 98, 0, '2013-05-09 04:14:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(27, 99, 99, 0, '2013-05-09 04:14:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(29, 98, 98, 0, '2013-05-09 04:24:31', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(30, 99, 99, 0, '2013-05-09 04:24:31', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: man231'),
(32, 98, 98, 0, '2013-05-09 04:50:29', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(33, 99, 99, 0, '2013-05-09 04:50:29', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(35, 98, 98, 0, '2013-05-09 06:13:00', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(36, 99, 99, 0, '2013-05-09 06:13:00', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(38, 98, 98, 0, '2013-05-09 06:20:14', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(39, 99, 99, 0, '2013-05-09 06:20:14', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(41, 98, 98, 0, '2013-05-09 06:22:24', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(42, 99, 99, 0, '2013-05-09 06:22:24', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pisit12'),
(44, 98, 98, 0, '2013-05-10 03:38:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: cnpisit1'),
(45, 99, 99, 0, '2013-05-10 03:38:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: cnpisit1'),
(47, 98, 98, 0, '2013-05-10 08:58:45', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: NypisitChhorn'),
(48, 99, 99, 0, '2013-05-10 08:58:45', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: NypisitChhorn'),
(50, 98, 98, 0, '2013-05-16 02:54:11', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(51, 99, 99, 0, '2013-05-16 02:54:11', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(53, 98, 98, 0, '2013-05-16 03:04:22', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(54, 99, 99, 0, '2013-05-16 03:04:22', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(56, 98, 98, 0, '2013-05-16 07:20:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: test'),
(57, 99, 99, 0, '2013-05-16 07:20:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: test'),
(59, 98, 98, 0, '2013-05-20 09:12:16', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipiset'),
(60, 99, 99, 0, '2013-05-20 09:12:16', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipiset'),
(62, 98, 98, 0, '2013-05-21 03:38:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(63, 99, 99, 0, '2013-05-21 03:38:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(65, 98, 98, 0, '2013-05-21 06:36:43', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(66, 99, 99, 0, '2013-05-21 06:36:43', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(68, 98, 98, 0, '2013-05-21 06:38:12', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(69, 99, 99, 0, '2013-05-21 06:38:12', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(71, 98, 98, 0, '2013-05-21 06:39:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(72, 99, 99, 0, '2013-05-21 06:39:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(74, 98, 98, 0, '2013-05-21 06:55:08', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(75, 99, 99, 0, '2013-05-21 06:55:08', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(77, 98, 98, 0, '2013-05-21 06:56:48', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(78, 99, 99, 0, '2013-05-21 06:56:48', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(80, 98, 98, 0, '2013-05-21 08:19:36', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(81, 99, 99, 0, '2013-05-21 08:19:36', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kiriko'),
(83, 98, 98, 0, '2013-05-22 06:40:23', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(84, 99, 99, 0, '2013-05-22 06:40:23', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(86, 98, 98, 0, '2013-05-22 07:50:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipipi'),
(87, 99, 99, 0, '2013-05-22 07:50:33', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipipi'),
(89, 98, 98, 0, '2013-05-22 09:22:06', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(90, 99, 99, 0, '2013-05-22 09:22:06', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(92, 98, 98, 0, '2013-05-23 01:31:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(93, 99, 99, 0, '2013-05-23 01:31:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(95, 98, 98, 0, '2013-05-23 03:11:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(96, 99, 99, 0, '2013-05-23 03:11:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(98, 98, 98, 0, '2013-05-23 03:31:35', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(99, 99, 99, 0, '2013-05-23 03:31:35', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(101, 98, 98, 0, '2013-05-23 03:35:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(102, 99, 99, 0, '2013-05-23 03:35:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(104, 98, 98, 0, '2013-05-23 08:27:37', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(105, 99, 99, 0, '2013-05-23 08:27:37', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(107, 98, 98, 0, '2013-05-23 09:33:58', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(108, 99, 99, 0, '2013-05-23 09:33:58', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: mamama'),
(110, 98, 98, 0, '2013-05-29 02:20:03', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: qqqqqqq'),
(111, 99, 99, 0, '2013-05-29 02:20:03', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: qqqqqqq'),
(113, 98, 98, 0, '2013-05-29 03:33:27', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: wwwww'),
(114, 99, 99, 0, '2013-05-29 03:33:27', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: wwwww'),
(116, 98, 98, 0, '2013-05-29 03:46:48', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(117, 99, 99, 0, '2013-05-29 03:46:48', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(119, 98, 98, 0, '2013-05-29 03:49:35', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(120, 99, 99, 0, '2013-05-29 03:49:35', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(122, 98, 98, 0, '2013-05-29 04:13:06', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(123, 99, 99, 0, '2013-05-29 04:13:06', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(125, 98, 98, 0, '2013-05-29 04:50:55', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(126, 99, 99, 0, '2013-05-29 04:50:55', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(128, 98, 98, 0, '2013-05-29 06:23:43', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(129, 99, 99, 0, '2013-05-29 06:23:43', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(131, 98, 98, 0, '2013-05-29 06:24:47', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(132, 99, 99, 0, '2013-05-29 06:24:47', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kkkkk'),
(134, 98, 98, 0, '2013-05-29 06:27:44', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: ppppp'),
(135, 99, 99, 0, '2013-05-29 06:27:44', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: ppppp'),
(137, 98, 98, 0, '2013-05-29 06:35:48', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: fan'),
(138, 99, 99, 0, '2013-05-29 06:35:48', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: fan'),
(140, 98, 98, 0, '2013-05-29 06:36:51', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: actor'),
(141, 99, 99, 0, '2013-05-29 06:36:51', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: actor'),
(143, 98, 98, 0, '2013-05-29 07:02:26', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: actor'),
(144, 99, 99, 0, '2013-05-29 07:02:26', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: actor'),
(146, 98, 98, 0, '2013-05-29 07:04:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: actor'),
(147, 99, 99, 0, '2013-05-29 07:04:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: actor'),
(149, 98, 98, 0, '2013-05-29 07:05:32', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: fan'),
(150, 99, 99, 0, '2013-05-29 07:05:32', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: fan'),
(152, 98, 98, 0, '2013-05-29 08:33:58', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: galerist'),
(153, 99, 99, 0, '2013-05-29 08:33:58', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: galerist'),
(155, 98, 98, 0, '2013-05-29 10:21:56', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kjskajlkj'),
(156, 99, 99, 0, '2013-05-29 10:21:56', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kjskajlkj'),
(158, 98, 98, 0, '2013-05-30 01:42:36', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(159, 99, 99, 0, '2013-05-30 01:42:36', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(161, 98, 98, 0, '2013-05-30 01:44:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(162, 99, 99, 0, '2013-05-30 01:44:53', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(164, 98, 98, 0, '2013-05-30 03:54:49', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(165, 99, 99, 0, '2013-05-30 03:54:49', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(167, 98, 98, 0, '2013-05-30 04:11:50', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka1'),
(168, 99, 99, 0, '2013-05-30 04:11:50', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka1'),
(170, 98, 98, 0, '2013-05-30 06:46:24', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka1'),
(171, 99, 99, 0, '2013-05-30 06:46:24', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka1'),
(173, 98, 98, 0, '2013-05-30 06:48:25', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka11'),
(174, 99, 99, 0, '2013-05-30 06:48:25', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka11'),
(176, 98, 98, 0, '2013-05-30 06:55:38', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipi'),
(177, 99, 99, 0, '2013-05-30 06:55:38', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipi'),
(179, 98, 98, 0, '2013-05-30 06:57:30', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipi'),
(180, 99, 99, 0, '2013-05-30 06:57:30', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: pipi'),
(182, 98, 98, 0, '2013-05-30 07:03:07', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(183, 99, 99, 0, '2013-05-30 07:03:07', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kaka'),
(185, 98, 98, 0, '2013-05-30 07:06:31', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kakapi'),
(186, 99, 99, 0, '2013-05-30 07:06:31', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kakapi'),
(188, 98, 98, 0, '2013-05-30 07:16:21', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: povpov'),
(189, 99, 99, 0, '2013-05-30 07:16:21', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: povpov'),
(191, 98, 98, 0, '2013-05-30 07:22:15', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: povpov'),
(192, 99, 99, 0, '2013-05-30 07:22:15', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: povpov'),
(194, 98, 98, 0, '2013-05-30 07:48:32', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: povpov'),
(195, 99, 99, 0, '2013-05-30 07:48:32', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: povpov'),
(197, 98, 98, 0, '2013-05-30 08:09:02', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kapi'),
(198, 99, 99, 0, '2013-05-30 08:09:02', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kapi'),
(200, 98, 98, 0, '2013-05-30 08:23:42', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: tititi'),
(201, 99, 99, 0, '2013-05-30 08:23:42', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: tititi'),
(203, 98, 98, 0, '2013-05-30 08:32:44', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: tititiqq'),
(204, 99, 99, 0, '2013-05-30 08:32:44', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: tititiqq'),
(206, 98, 98, 0, '2013-05-30 09:04:09', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(207, 99, 99, 0, '2013-05-30 09:04:09', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(208, 97, 97, 0, '2013-05-30 09:55:06', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(209, 98, 98, 0, '2013-05-30 09:55:06', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(210, 99, 99, 0, '2013-05-30 09:55:06', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(211, 97, 97, 0, '2013-05-30 10:07:18', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not execute: /var/qmail/bin/sendmail The user who attempted to register is: picaso'),
(212, 98, 98, 0, '2013-05-30 10:07:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not execute: /var/qmail/bin/sendmail The user who attempted to register is: picaso'),
(213, 99, 99, 0, '2013-05-30 10:07:18', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not execute: /var/qmail/bin/sendmail The user who attempted to register is: picaso'),
(214, 97, 97, 0, '2013-05-30 10:08:47', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(215, 98, 98, 0, '2013-05-30 10:08:47', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(216, 99, 99, 0, '2013-05-30 10:08:47', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(217, 97, 97, 0, '2013-05-30 10:22:16', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(218, 98, 98, 0, '2013-05-30 10:22:16', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(219, 99, 99, 0, '2013-05-30 10:22:16', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: picaso'),
(220, 97, 97, 0, '2013-05-31 01:25:35', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: rachana'),
(221, 98, 98, 0, '2013-05-31 01:25:35', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: rachana'),
(222, 99, 99, 0, '2013-05-31 01:25:35', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: rachana'),
(223, 97, 97, 0, '2013-05-31 03:00:20', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kakakakakakakaka'),
(224, 98, 98, 0, '2013-05-31 03:00:20', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kakakakakakakaka'),
(225, 99, 99, 0, '2013-05-31 03:00:20', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kakakakakakakaka'),
(226, 97, 97, 0, '2013-06-03 01:26:34', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: somcute'),
(227, 98, 98, 0, '2013-06-03 01:26:34', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: somcute'),
(228, 99, 99, 0, '2013-06-03 01:26:34', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: somcute'),
(229, 97, 97, 0, '2013-06-03 01:46:49', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: nypisit.chhorn@mapring.com The user who attempted to register is: somcute1'),
(230, 98, 98, 0, '2013-06-03 01:46:49', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: nypisit.chhorn@mapring.com The user who attempted to register is: somcute1'),
(231, 99, 99, 0, '2013-06-03 01:46:49', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: nypisit.chhorn@mapring.com The user who attempted to register is: somcute1'),
(232, 97, 97, 0, '2013-06-03 02:11:40', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(233, 98, 98, 0, '2013-06-03 02:11:40', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(234, 99, 99, 0, '2013-06-03 02:11:40', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(235, 97, 97, 0, '2013-06-03 04:27:14', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(236, 98, 98, 0, '2013-06-03 04:27:14', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(237, 99, 99, 0, '2013-06-03 04:27:14', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(238, 97, 97, 0, '2013-06-03 04:38:17', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kagnara'),
(239, 98, 98, 0, '2013-06-03 04:38:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kagnara'),
(240, 99, 99, 0, '2013-06-03 04:38:17', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kagnara'),
(241, 97, 97, 0, '2013-06-03 06:03:44', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kagnara'),
(242, 98, 98, 0, '2013-06-03 06:03:44', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kagnara'),
(243, 99, 99, 0, '2013-06-03 06:03:44', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: kagnara'),
(244, 97, 97, 0, '2013-06-03 06:21:37', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(245, 98, 98, 0, '2013-06-03 06:21:37', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(246, 99, 99, 0, '2013-06-03 06:21:37', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: kagnara'),
(247, 97, 97, 0, '2013-06-04 07:59:04', 1, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: nypisit'),
(248, 98, 98, 0, '2013-06-04 07:59:04', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: nypisit'),
(249, 99, 99, 0, '2013-06-04 07:59:04', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: The following from address failed: chhornnypisit.itc@gmail.com The user who attempted to register is: nypisit');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `tbl_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE IF NOT EXISTS `tbl_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=215 ;

--
-- Dumping data for table `tbl_modules`
--

INSERT INTO `tbl_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(92, 'Responsive Layouts Showcase', '', '<div class="rt-center largemargintop largemarginbottom">\r\n  <span class="promo2"><strong>Responsive</strong> Layout</span><br />\r\n  <span class="promo3">A responsive design automatically adapts itself to a particular viewing environment such as desktop, tablet or mobile, without the need for separate layouts for varying platforms</span>\r\n</div>\r\n\r\n<div class="rt-image rt-center largemargintop largemarginbottom">\r\n  <img class="rt-noborder" alt="image" src="images/rocketlauncher/features/responsive.png" />\r\n</div>\r\n\r\n<div class="clear"></div>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <h4 class="smallmarginbottom">Responsive Frameworks</h4>\r\n    <p>We use the responsive layout based on <a target="_blank" href="http://twitter.github.com/bootstrap/" class="external"><strong>Twitter''s Bootstrap Framework</strong></a>, with its collection of utility classes, to provide a flexible responsive design.</p>\r\n    <a href="http://www.rockettheme.com/blog/team/1550-responsive-design-and-gantry4" class="readon"><span class="icon-external-link"></span><span> Read Blog</span></a>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <h4 class="smallmarginbottom">RocketTheme Extensions</h4>\r\n    <p>The RokSprocket and RokGallery extensions are built to work with a responsive layout and support mobile touch events, such as <strong>''swipe''</strong>.</p>\r\n    <a href="http://www.rockettheme.com/blog/team/1555-responsive-design-rocketthemes-extensions" class="readon"><span class="icon-external-link"></span><span> Read Blog</span></a>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <h4 class="smallmarginbottom">Media Queries in JavaScript</h4>\r\n    <p>We have created a new helper class, <strong>RokMediaQueries.js</strong>, which provides a unified system that enables extensions to add media query listeners.</p>\r\n    <a href="http://www.rockettheme.com/blog/team/1555-responsive-design-rocketthemes-extensions" class="readon"><span class="icon-external-link"></span><span> Read Blog</span></a>\r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div>', 1, 'showcase-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box6","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(93, 'Responsive Layouts', '', '<div class="rt-image">\r\n  <img class="rt-noborder" alt="image" src="images/rocketlauncher/features/responsive-1.jpg" />\r\n</div>\r\n\r\n<br />\r\n\r\n<span>Metropolis''s responsive grid system is designed for desktop, tablet and smartphone systems, each with minor modifications to ensure compatibility in each mode. The table above shows the breakdown of screen resolutions and associated devices, and what layout characters are then applied to each.</span>', 1, 'utility-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box1 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(94, 'Responsive Classes', '', '<div class="rt-image">\r\n  <img class="rt-noborder" alt="image" src="images/rocketlauncher/features/responsive-2.jpg" />\r\n</div>\r\n\r\n<br />\r\n\r\n<span>Another useful feature available, via Bootstrap, is the collection of responsive utility classes that can be used to help tweak layouts by providing a simple method of showing or hiding modules. Insert the above module class suffixes into your settings to show/hide a module for a particular mode.</span>', 1, 'utility-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box4 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(95, 'Media Queries', '', '<p>In terms of media queries, the breakdown is:</p>\r\n<pre class="lines rt-pre-col2">\r\n/* Smartphones */\r\n@media (max-width: 480px) { ... }\r\n\r\n/* Smartphones to Tablets */\r\n@media (min-width: 481px) and (max-width: 767px) { ... }\r\n\r\n/* Tablets */\r\n@media (min-width: 768px) and (max-width: 959px) { ... }\r\n\r\n/* Desktop */\r\n@media (min-width: 960px) and (max-width: 1199px) { ... }\r\n\r\n/* Large Display */\r\n@media (min-width: 1200px) { ... }\r\n</pre>', 1, 'maintop-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(96, 'Navigation', '', '<p class="rt-image rt-floatleft nomarginbottom">\r\n    <img class="rt-noborder" src="images/rocketlauncher/features/responsive-nav.png" alt="image" />\r\n</p>\r\n\r\n<div class="hidden-large hidden-desktop"><div class="clear"></div></div>\r\n\r\n<p>For mobile devices, there are two options, a dropdown panel menu with items in a tree format or a select box using the browsers own UI elements. Chose a format in the template''s menu settings.</p>\r\n\r\n<p class="hidden-tablet">The <strong>Dropdown Menu</strong> is a CSS driven dropdown menu, offering such features as multiple columns<span class="hidden-desktop">, inline icons, subtext, modules and positions, custom column widths, item distribution</span> and menu offsets. </p>\r\n\r\n<p class="hidden-tablet"><strong>SplitMenu</strong> displays 1st level items in the navigation bar and children in the Sidebar.</p>\r\n\r\n<div class="visible-large"><br /></div>', 1, 'maintop-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(97, 'Features Footer', '', '<div class="gantry-width-66 gantry-width-block">\r\n  <div class="gantry-width-space">\r\n    <h3>All the Features<span class="hidden-tablet"> - in One Complete List</span></h3>\r\n    <h4>Metropolis Template</h4>\r\n    \r\n    <div class="gantry-width-50 gantry-width-block">\r\n      <div class="gantry-width-space">\r\n        <ul class="circle">\r\n          <li>10 Preset Styles</li>\r\n          <li>76 Module Positions</li>\r\n          <li>Powered by Gantry 4</li>\r\n          <li>Dropdown Menu</li>\r\n          <li>SplitMenu</li>\r\n          <li>Custom Typography</li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    \r\n    <div class="gantry-width-50 gantry-width-block">\r\n      <div class="gantry-width-space">\r\n        <ul class="circle">\r\n          <li>RokSprocket Styling</li>\r\n          <li>K2 Styling</li>\r\n          <li>Gantry Framework</li>\r\n          <li>RTL Layout Support</li>\r\n          <li>Major Browsers Support</li>\r\n          <li>HTML5, CSS3, LESS CSS</li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    \r\n    <div class="clear"></div>\r\n    \r\n    <h4>Gantry Framework</h4>\r\n\r\n    <div class="gantry-width-50 gantry-width-block">\r\n      <div class="gantry-width-space">\r\n        <ul class="circle">\r\n          <li>CSS Grid Framework</li>\r\n          <li>Responsive HTML5 base template</li>\r\n          <li>Stunning Admin Interface</li>\r\n          <li>Source Ordered Mainbody</li>\r\n          <li>Extensive Administrator Interface</li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    \r\n    <div class="gantry-width-50 gantry-width-block">\r\n      <div class="gantry-width-space">\r\n        <ul class="circle">\r\n          <li>Built-in Less Compiler</li>\r\n          <li>Versatile Layout</li>\r\n          <li>Grid RTL Support</li>\r\n          <li>Google Web Fonts Support</li>   \r\n          <li>Per Browser based CSS / JS control</li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    \r\n    <div class="clear"></div>\r\n\r\n  </div>\r\n</div>\r\n\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-space">\r\n    <h3>Requirements</h3>\r\n    <ul class="checkmark">\r\n      <li><strong>Apache 2.x or Microsoft IIS 7</strong><br />\r\n        <em>Most widely deployed web server software, required for Joomla!</em></li>\r\n      <li><strong>PHP 5.3+</strong> &amp; <strong>MySQL 5.0.4+</strong><br />\r\n        <em>General-purpose server-side scripting language for web development and a popular open-source database system.</em></li>\r\n      <li><strong>Joomla! 2.5.x</strong> or <strong>Joomla! 3.0.x</strong><br />\r\n        <em>Please download the latest version at <a class="normalfont nobold" href="http://www.joomla.org" target="_blank">www.joomla.org</a>.</em></li>\r\n      <li><strong>Gantry Framework</strong><br />\r\n        <em>Please ensure you are using the latest version of <a class="normalfont nobold" href="http://www.gantry-framework.org" target="_blank">Gantry</a>.</em></li>\r\n      <li><strong>RokNavMenu Module</strong><br />\r\n        <em>Core <a class="normalfont nobold" href="index.php?option=com_content&amp;view=article&amp;id=5&amp;Itemid=112">menu system</a> for RocketTheme templates.</em></li>\r\n    </ul>\r\n  <div class="clear"></div>\r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(98, 'Gantry Grid Distribution', '', '<p>Configure at <strong>Admin &rarr; Extensions &rarr; Template Manager &rarr; rt_metropolis</strong>, then go to <strong>Layouts</strong> to set the grid widths and allocated positions.</p>\r\n\r\n<div class="rt-image">\r\n  <img src="images/rocketlauncher/module-positions/grid-distribution.jpg" alt="image" />\r\n</div>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 icon-th","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(99, 'Injected Gantry Features', '', '<div class="rt-image">\r\n  <img alt="Non-Standard Elements" src="images/rocketlauncher/module-positions/injected-features.jpg" />\r\n</div>\r\n\r\n<div class="clear largemarginbottom">&nbsp;</div>\r\n\r\n<!-- <p class="hidden-tablet">In the Gantry framework we use the term Feature to mean a specific bit of functionality. Features are flexible enough that they can be used to perform almost any kind of logic you would need.</p> -->\r\n\r\n<p class="nomarginbottom">There are <strong>Features</strong> that are injected into a position when enabled, and are stacked vertically; which includes: Social Buttons, Date, Font Sizer, Login Panel, Popup Module, Branding, Copyright, To-Top Scroller, System Messages, Reset Settings, and Google Analytics.</p>', 15, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box4 icon-signin","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(100, 'MainBody / Sidebar Layouts', '', '<p>Configure at <strong>Admin &rarr; Extensions &rarr; Template Manager &rarr; rt_metropolis</strong>, then go to <strong>Layouts</strong> tab and set the varying Mainbody/Sidebar layout possibilities.</p>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img src="images/rocketlauncher/module-positions/position-config-mb1.jpg" alt="image"/>\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img src="images/rocketlauncher/module-positions/position-config-mb2.jpg" alt="image"/>\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img src="images/rocketlauncher/module-positions/position-config-mb3.jpg" alt="image"/>\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div><br />\r\n\r\n<p class="attention">Note: If no modules are assigned to the Sidebar positions, the Mainbody will become full width.</p>\r\n\r\n<div class="rt-image">\r\n  <img alt="Module Positions" src="images/rocketlauncher/module-positions/gantry-layout.jpg" />\r\n</div>\r\n', 1, 'mainbottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(101, 'Basic: Using Gantry Layouts', '', '<div class="gantry-width-25 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a rel="rokbox[745 505]" title="Video Tutorial :: Using Gantry Layouts" href="http://www.gantry-framework.org/videos/joomla/g4-module-widths.mp4">\r\n      <span class="rt-image">\r\n        <img src="images/rocketlauncher/module-positions/using-layouts.jpg" alt="Using Layouts" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-75 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <p>To find out about <strong>Gantry Layouts</strong> and <strong>Module Widths</strong>, check out this screencast which covers basic concepts of configuring layout with a combination of module setting and the Gantry layout control.</p>\r\n\r\n    <a class="readon smallmargintop" href="http://www.gantry-framework.org/documentation/joomla/configure/layouts" target="_blank"><span>View : Using Layouts</span></a>\r\n  </div>    \r\n</div>\r\n\r\n<div class="clear"></div>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-info-sign","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(102, 'Advanced: Adding Positions', '', '<div class="gantry-width-25 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a rel="rokbox[745 505]" title="Video Tutorial :: Module Positions" href="http://www.gantry-framework.org/videos/joomla/g4-module-positions.mp4">\r\n      <span class="rt-image">\r\n      <img src="images/rocketlauncher/module-positions/adding-module-positions.jpg" alt="Adding Module Positions" />\r\n      </span>  \r\n    </a>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-75 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <p>Check out this quick screencast on <strong>Module Positions</strong> to get an overview of how module positions work within Gantry Framework. Click below button to learn how to <strong>add a new row of module positions</strong>.</p>\r\n\r\n    <a class="readon smallmargintop" href="http://www.gantry-framework.org/documentation/joomla/customize/adding-module-positions" target="_blank"><span>Learn : Adding Positions</span></a>\r\n  </div>    \r\n</div>\r\n\r\n<div class="clear"></div>', 1, 'footer-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-info-sign","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(103, 'Using a Suffix', '', '<p>Enter any available suffixes at <strong>Extensions &rarr; Module Manager &rarr; <em>Module</em> &rarr; Module Class Suffix</strong>.</p>\r\n<p class="notice nomarginbottom">You can compound multiple suffixes together such as: <strong><em>box1 title3</em></strong>.</p>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box6 icon-asterisk","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(104, 'Standard Variations: 25 Additional Module Class Suffixes', '', '<ul>\r\n  <li><strong>rt-center:</strong> centres the content of the module.</li>\r\n  <li><strong>shadow2-10</strong> adds varying shadows around the module.</li>\r\n  <li><strong>rounded and basic:</strong> changes the border style of the module.</li>\r\n  <li><strong>standardcase, uppercase, lowercase:</strong> change the case of the module title.</li>  \r\n  <li><strong>nomargintop, nomarginright, nomarginbottom, nomarginleft, nomarginall:</strong> removes the various margins around the module.</li>    \r\n  <li><strong>nopaddingtop, nopaddingright, nopaddingbottom, nopaddingleft, nopaddingall:</strong> removes the various paddings around the module</li>    \r\n</ul>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(105, 'Why Use RokCandy', '', '<p><strong>RokCandy</strong> is the ideal solution for those with <strong>limited coding skills</strong> or those who implement our templates for their clients.</p>\r\n\r\n<p>It is <strong>free</strong> from the WYSIWYG editors horrific filtering habits and can be easily pre-configured for your <strong>personal needs</strong> or the needs of your client.</p>\r\n\r\n<a href="http://www.rockettheme.com/extensions-joomla/rokcandy" class="readon" target="_blank"><span>Download : RokCandy</span></a>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(106, 'Video : Using Typography', '', '<div class="gantry-width-25 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <a href="http://www.rockettheme.com/video/joomla15/using-typography-joomla15.mov" title="Video Tutorial :: Joomla Using Typography Video Tutorial" rel="rokbox[540 380]">\r\n      <span class="rt-image">\r\n        <img src="images/rocketlauncher/typography/using-typography.jpg" alt="Using Typography" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-75 gantry-width-block">\r\n  <div class="gantry-width-spacer nomargintop">\r\n    <p>Check out this quick screencast to learn how to use RokCandy to enhance your Joomla! content. The tags are very easy to learn and this guide shows you how to use all the styles.</p>\r\n    <a href="http://www.rockettheme.com/video/joomla15/using-typography-joomla15.mov" title="Video Tutorial :: Joomla Using Typography Video Tutorial" rel="rokbox[540 380]" class="readon"><span>Watch : Using Typography</span></a>\r\n  </div>    \r\n</div>\r\n\r\n<div class="clear"></div>', 1, 'footer-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(107, 'Set Menu Type', '', '<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n      <p class="visible-large">RokNavMenu provides a feature rich platform for extending the menu, allowing for overrides and plugins for the menu itself, in addition to versatile theming capabilities and so much more.</p>\r\n      \r\n    <p>To find all the parameters for DropDown Menu &amp; SplitMenu on Metropolis template, such as transitions, duration &amp; sublevel position, please navigate to:</p>\r\n    \r\n    <ul class="dots">\r\n      <li><strong>Extensions &rarr; Template Manager &rarr; rt_metropolis</strong></li>\r\n      <li>Then go to <strong>Menu</strong> tab, and set the Menu parameters</li>\r\n    </ul>\r\n    \r\n    <p class="largemargintop attention">Descriptions of each template parameter can be seen when you mouseover the label of each option.</p>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img src="images/rocketlauncher/menu-options/menu-setting.jpg" alt="Set Menu" />\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div>', 1, 'maintop-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box1 icon-info-sign","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(108, 'Dropdown Menu', '', '<div class="rt-center">\r\n    <p>A CSS driven dropdown menu, with subtext line, multi-columns, icons and more.</p>\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=5&amp;Itemid=112&amp;menu-type=dropdownmenu" class="readon"><span>Switch to Dropdown Menu</span></a>\r\n</div>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 icon-align-justify icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(109, 'SplitMenu', '', '<div class="rt-center">\r\n    <p>A static menu system that displays 1st level items in the main horizontal menu and all children in the Sidebar.</p>\r\n	<a href="index.php?option=com_content&amp;view=article&amp;id=5&amp;Itemid=112&amp;menu-type=splitmenu" class="readon"><span>Switch to SplitMenu</span></a>\r\n</div>', 13, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 icon-th-list icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(110, 'No Menu', '', '<p>An option to disable the menu, allowing for normal module use of the navigation position.</p>', 15, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(111, 'SubText Line', '', '<p>The option that allows you to insert additional text to the Menu Item Title, including the SubMenu Item Title. There is separate styling for this, making it useful for adding snippets to menu items.</p>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(112, 'Menu Icon', '', '<p>RokNavMenu provides the option to display a small icon image, powered by FontAwesome, for the menu item. The menu icon can be displayed both for the parent items and the child items.</p>', 1, 'footer-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(113, 'Multi-Columns', '', '<p>Who needs a single dropdown column when you can have as many as you want? Using the built-in configurable parameters, you can make up to four incredible multi column dropdowns.</p>', 1, 'footer-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(114, 'RokSprocket Showcase', '', '<div class="gantry-width-66 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <span class="promo2">Rok<strong>Sprocket</strong></span><br />\r\n    <span class="promo3">A Revolutionary Content Module <span class="rt-extra-desc">with Multiple Layout Options</span></span><br />\r\n    <p class="largemargintop">RokSprocket is a revolutionary new extension for Joomla 2.5 designed to give you an incredible level of control over how you present your content. Sophisticated content filters, robust layout modes and options, integration with multiple content providers, and a streamlined no-nonsense interface all contribute to a powerful yet user friendly experience from start to finish.</p>\r\n  </div>\r\n  <div class="gantry-width-spacer">\r\n    <div class="gantry-width-50 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="checkmark">\r\n          <li><span>Multiple Layout Options</span></li>\r\n          <li><span>Multiple Content Providers</span></li>\r\n          <li><span>Advanced Cumulative Filters</span></li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    <div class="gantry-width-50 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="checkmark">\r\n          <li><span>Advanced Sorting Rules</span></li>\r\n          <li><span>Custom Article Configuration</span></li>\r\n          <li><span>RokGallery/MediaManager Support</span></li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n  <p>To learn more about the implementation details of supporting responsive design for RocketTheme''s Extensions, please visit the following link.</p>\r\n  <a href="http://www.rockettheme.com/blog/team/1555-responsive-design-rocketthemes-extensions" target="_blank" class="readon"><span class="icon-external-link"></span><span> Responsive Design: Part 3 - RocketTheme''s Extensions</span></a>        \r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-25 gantry-width-block rt-block box5">\r\n  <div class="gantry-width-spacer">\r\n    <h4>Mobile Touch Events</h4>\r\n    <p>From the very genesis of it''s development, <strong>RokSprocket</strong> was designed with responsive layouts in mind. We also implemented <strong>touch events</strong> to allow you to ''swipe'' to change tabs, headlines, features and lists. This makes RokSprocket an <strong>excellent solution</strong> for <strong>responsive</strong> site building.</p>\r\n    <div class="rt-image largemargintop">\r\n      <img class="rt-noborder" src="images/rocketlauncher/extensions/swipe.png" alt="image" />\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div><br />\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img class="rt-noborder" src="images/rocketlauncher/extensions/ext-roksprocket-1.png" alt="image" />\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img class="rt-noborder" src="images/rocketlauncher/extensions/ext-roksprocket-2.png" alt="image" />\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-33 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img class="rt-noborder" src="images/rocketlauncher/extensions/ext-roksprocket-3.png" alt="image" />\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div><br />', 1, 'showcase-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(115, 'K2 (3rd Party) Styling Support', '', '<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img class="rt-noborder" src="images/rocketlauncher/extensions/ext-k2-1.png" alt="image" />\r\n    </div>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <div class="rt-image">\r\n      <img class="rt-noborder" src="images/rocketlauncher/extensions/ext-k2-2.png" alt="image" />\r\n    </div>\r\n  </div> \r\n</div>\r\n\r\n<div class="clear"></div>\r\n\r\n<div class="gantry-width-spacer">\r\n  <p>K2 is the popular powerful content extension for Joomla! with CCK-like features. The version used in this Demo site is <strong>2.6.1</strong>. K2 was built as a complete replacement of the default article system in Joomla!. Install it like any Joomla! extension, import your articles from the default Joomla! article system and you instantly get a host of new features for your existing content.</p>\r\n  <p class="alert">The 3rd party component K2 is NOT included in RocketLauncher. You will need to download them from <a target="_blank" href="http://getk2.org/">Get K2</a> and configure them on your site.</p>\r\n</div>', 1, 'maintop-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 icon-gift icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(118, 'RokBooster', '', '<p>Increase the speed of your site by enabling the RokBooster plug-in. RokBooster can dramatically reduce the number of HTTP calls a browser has to make, and sending those compressed files GZipped means your pages will load faster with less load.</p>\r\n<a class="readon" href="http://www.rockettheme.com/extensions-joomla/rokbooster" target="_blank">Download: RokBooster</a>', 3, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-bolt","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(119, 'RokPad', '', '<p>RokPad provides advanced functions such as an Ajax saving action, syntax highlighting, multiple cursors and selections, shortcut keys, and many other incredible features that traditionally would only be found in a powerful desktop editor.</p>\r\n<p><a class="readon" href="http://www.rockettheme.com/extensions-joomla/rokpad" target="_blank">Download: RokPad</a></p>', 3, 'content-bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-file","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(120, 'Extensions Footer', '', '<div class="gantry-width-70 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <h3>All RocketTheme Extensions</h3>\r\n    <p>Many of our extensions were developed to accompany RocketTheme templates but we have now created versions that are intended to work independently of our templates if you wish.</p>\r\n\r\n    <h4 class="nomarginbottom">Club Extensions</h4>\r\n    \r\n    <div class="gantry-width-33 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="circle">\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokgallery" target="_blank">RokGallery</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokstock" target="_blank">RokStock</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokpad" target="_blank">RokPad</a></li>     \r\n        </ul>\r\n      </div>\r\n    </div>\r\n    \r\n    <div class="gantry-width-33 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="circle">  \r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokminievents" target="_blank">RokMiniEvents</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokweather" target="_blank">RokWeather</a></li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n\r\n    <div class="gantry-width-33 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="circle">\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/roktwittie" target="_blank">RokTwittie</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokfeaturetable" target="_blank">RokFeatureTable</a></li>\r\n        </ul>  \r\n      </div>\r\n    </div>    \r\n    \r\n    <div class="clear"></div>\r\n    \r\n    <h4 class="nomargintop nomarginbottom">Free Extensions</h4>\r\n\r\n    <div class="gantry-width-33 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="circle">\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/roksprocket" target="_blank">RokSprocket</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokbox" target="_blank">RokBox</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokbooster" target="_blank">RokBooster</a></li>\r\n        </ul>\r\n      </div>\r\n    </div>   \r\n\r\n    <div class="gantry-width-33 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="circle">\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/roknavmenu" target="_blank">RokNavMenu</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokquickcart" target="_blank">RokQuickCart</a></li>\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokcandy" target="_blank">RokCandy</a></li>\r\n        </ul>\r\n      </div>\r\n    </div>   \r\n\r\n    <div class="gantry-width-33 gantry-width-block">\r\n      <div class="gantry-width-spacer">\r\n        <ul class="circle">\r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokajaxsearch" target="_blank">RokAjaxSearch</a></li>      \r\n          <li><a href="http://www.rockettheme.com/extensions-joomla/rokcomments" target="_blank">RokComments</a></li>\r\n        </ul>  \r\n      </div>\r\n    </div>            \r\n\r\n    <div class="clear"></div>\r\n  </div>\r\n</div>\r\n\r\n\r\n<div class="gantry-width-30 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <h3>Download</h3>\r\n    \r\n    <p>You can download the extensions from:</p>\r\n    \r\n    <ul class="normalfont nomarginbottom checkmark">\r\n      <li><strong>Metropolis Download Page:</strong><br /><strong>rt_metropolis-extensions.zip</strong> for J2.5. Unzip the file, it contains all the extensions used for Metropolis template.</li>\r\n      <li class="nomarginbottom"><strong>RocketTheme Extensions Page:</strong><br />Contains all individual extensions are available from the Extensions section of RokDownloads.</li>\r\n    </ul>\r\n    \r\n    <a href="http://www.rockettheme.com/extensions-downloads/" target="_blank" class="readon largemargintop"><span>Download : Extensions</span></a>\r\n  <div class="clear"></div>\r\n  </div>\r\n</div>\r\n<div class="clear"></div>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(121, 'Installation', '', '<div class="rt-center">\r\n    <p>Download and install the <strong>Bundle</strong> file if Gantry is not installed, use the Standard Template file if <a href="index.php?option=com_content&amp;view=article&amp;id=8&amp;Itemid=115">Gantry</a> is already present.</p>\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=8&amp;Itemid=115" class="readon"><span>More Information</span></a>\r\n</div>    ', 1, 'showcase-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"icon-cogs icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(122, 'Demo Replica', '', '<div class="rt-center">\r\n    <p>You may deploy a <a href="index.php?option=com_content&amp;view=article&amp;id=8&amp;Itemid=115">replica</a> of this month''s demo with ease, using the readily available <strong>RocketLauncher</strong> package.</p>\r\n	<a href="index.php?option=com_content&amp;view=article&amp;id=8&amp;Itemid=115" class="readon"><span>More Information</span></a>\r\n</div>', 1, 'showcase-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"icon-copy icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(123, 'Configuration', '', '<p>An overview of template files and instructions for installing &amp; configuring Metropolis template.</p>\r\n<a class="readon" href="index.php?option=com_content&amp;view=article&amp;id=8&amp;Itemid=115"><span>Read More</span></a>', 1, 'content-top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box1 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(124, 'Logo Editing', '', '<img src="images/logo Angkor people.png" alt="" />\r\n', 1, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(125, 'Video Documentation', '', '<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <ul>\r\n        <li><a class="nobold" href="http://www.gantry-framework.org/videos/joomla/g4-install.mp4" title="Video Tutorial :: Gantry Installation" rel="rokbox[503 356]">Install Gantry</a></li>\r\n        <li><a class="nobold" href="www.gantry-framework.org/videos/joomla/g4-features.mp4" title="Video Tutorial :: Gantry Features" rel="rokbox[504 336]">Gantry Features</a></li>\r\n        <li><a class="nobold" href="http://www.gantry-framework.org/media/videos/module_widths.mov" title="Video Tutorial :: Using Layouts" rel="rokbox[503 356]">Gantry Layout</a></li>\r\n        <li><a class="nobold" href="www.gantry-framework.org/videos/joomla/g4-module-positions.mp4" title="Video Tutorial :: Module Positions" rel="rokbox[503 356]">Module Positions</a></li>  \r\n    </ul>   \r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomarginright nomarginleft">\r\n    <ul>\r\n    	<li><a class="nobold" rel="rokbox[503 356]" title="Video Tutorial :: Module Width" href="www.gantry-framework.org/videos/joomla/g4-module-widths.mp4">Module Width</a></li>\r\n		<li><a class="nobold" rel="rokbox[504 336]" title="Video Tutorial :: Module Variations" href="www.gantry-framework.org/videos/joomla/g4-module-variations.mp4">Module Variations</a></li>\r\n		<li><a class="nobold" rel="rokbox[504 336]" title="Video Tutorial :: Force Module Positionsr" href="www.gantry-framework.org/videos/joomla/g4-forcepos.mp4">Force<span class="visible-large"> Module</span> Positions</a></li>\r\n		<li><a class="nobold" rel="rokbox[504 336](joomla15basic)" title="Video Tutorial :: Template Overrides" href="www.gantry-framework.org/videos/joomla/g4-overrides.mp4">Template Overrides</a></li>\r\n	</ul>   \r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div>\r\n\r\n<a href="http://www.gantry-framework.org/documentation" target="_blank" class="readon largemargintop smallmarginbottom"><span>View All</span></a>', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box4 icon-camera","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(126, 'Forum Tutorials', '', '<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <ul>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178543&amp;rb_v=viewtopic" target="_blank">Editing the Logo</a></li>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178545&amp;rb_v=viewtopic" target="_blank">Template Text</a></li>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178546&amp;rb_v=viewtopic" target="_blank">RokBox Login</a></li>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178547&amp;rb_v=viewtopic" target="_blank">Popup Module</a></li>\r\n    </ul>   \r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-50 gantry-width-block">\r\n  <div class="gantry-width-spacer nomarginright nomarginleft">\r\n    <ul>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178548&amp;rb_v=viewtopic" target="_blank">Template Guide</a></li>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178549&amp;rb_v=viewtopic" target="_blank">Template FAQs</a></li>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178550&amp;rb_v=viewtopic" target="_blank">Responsive Classes</a></li>\r\n      <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178552&amp;rb_v=viewtopic" target="_blank">Demo Content</a></li>\r\n    </ul>   \r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div>\r\n\r\n<a class="readon largemargintop smallmarginbottom" target="_blank" href="http://www.rockettheme.com/forum/index.php?f=676&amp;rb_v=viewforum"><span>View All</span></a>', 1, 'content-bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box2 icon-question-sign","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(127, 'Joomla Docs', '', '<p>Joomla.org is an invaluable resource for general information on how to use, configure and modify Joomla.</p>\r\n<a href="http://docs.joomla.org" class="readon" target="_blank"><span>Read More</span></a>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-file","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(128, 'Theme Help', '', '<p>We provide tutorials of RocketTheme template installation, RocketLauncher and other related topics.</p>\r\n<a href="http://www.rockettheme.com/joomla-tutorials" class="readon" target="_blank"><span>Read More</span></a>', 1, 'footer-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-star","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(129, 'Gantry Info', '', '<p>More extensive details of the Gantry Framework, inclusive of both written and video tutorials, please visit Gantry Site.</p>\r\n<a href="http://www.gantry-framework.org/" target="_blank" class="readon"><span>Learn More</span></a>', 1, 'footer-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-info-sign","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(130, 'Requirements', '', '<ul class="checkmark nomarginbottom">\r\n  <li><strong>Apache 2.x or Microsoft IIS 7</strong></li>\r\n  <li><strong>PHP 5.3.x</strong></li>\r\n  <li><strong>MySQL 5.0.4 or higher</strong></li>\r\n  <li><strong>Joomla! 2.5.x / 3.0.x</strong></li> \r\n  <li><strong>Gantry Framework</strong></li>\r\n  <li class="nomarginbottom"><strong>RokNavMenu Module</strong></li>\r\n</ul>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box6 icon-check","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(131, 'RocketLauncher', '', '<p class="medmarginbottom"><strong>RocketLauncher</strong> is a customized <strong>Joomla</strong> install, that installs a <strong>replica</strong> of the <strong>demo</strong>.</p>\r\n<p class="alert nomarginbottom"><strong>Note</strong>: All sample content images will be replaced with blank versions in the RocketLauncher.</p>', 15, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box2 icon-magic","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(132, 'Forum Guides', '', '<ul>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178543&amp;rb_v=viewtopic" target="_blank"><span class="visible-large">How to </span>Edit the Logo</a></li>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178545&amp;rb_v=viewtopic" target="_blank"><span class="visible-large">How to Change </span>Template Text</a></li>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178546&amp;rb_v=viewtopic" target="_blank"><span class="visible-large">How to Enable </span>RokBox Login</a></li>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178547&amp;rb_v=viewtopic" target="_blank"><span class="visible-large">How to Activate </span>Popup Module</a></li>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178548&amp;rb_v=viewtopic" target="_blank">Template Guide<span class="visible-large"> and Information</span></a></li>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178549&amp;rb_v=viewtopic" target="_blank"><span class="visible-large">Metropolis </span>Template FAQs</a></li>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178550&amp;rb_v=viewtopic" target="_blank">Responsive Classes<span class="visible-large"> in Metropolis</span></a></li>\r\n  <li><a class="nobold" href="http://www.rockettheme.com/forum/index.php?f=676&amp;t=178552&amp;rb_v=viewtopic" target="_blank"><span class="visible-large">How to Replicate </span>Demo Content</a></li>\r\n</ul>   \r\n\r\n<a class="readon largemargintop smallmarginbottom" target="_blank" href="http://www.rockettheme.com/forum/index.php?f=676&amp;rb_v=viewforum"><span>View All</span></a>', 19, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box1 icon-question-sign","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');
INSERT INTO `tbl_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(133, 'Video Docs', '', '<ul>\r\n  <li><a class="nobold" href="http://www.gantry-framework.org/videos/joomla/g4-install.mp4" title="Video Tutorial :: Gantry Installation" rel="rokbox[503 356]"><span class="visible-large">How to </span>Install Gantry</a></li>\r\n  <li><a class="nobold" href="www.gantry-framework.org/videos/joomla/g4-features.mp4" title="Video Tutorial :: Gantry Features" rel="rokbox[504 336]"><span class="visible-large">Find Out </span>Gantry Features</a></li>\r\n  <li><a class="nobold" href="http://www.gantry-framework.org/media/videos/module_widths.mov" title="Video Tutorial :: Using Layouts" rel="rokbox[503 356]"><span class="visible-large">Learn </span>Gantry Layout</a></li>\r\n  <li><a class="nobold" href="www.gantry-framework.org/videos/joomla/g4-module-positions.mp4" title="Video Tutorial :: Module Positions" rel="rokbox[503 356]"><span class="visible-large">Check Gantry </span>Module Positions</a></li>  \r\n  <li><a class="nobold" rel="rokbox[503 356]" title="Video Tutorial :: Module Width" href="www.gantry-framework.org/videos/joomla/g4-module-widths.mp4"><span class="visible-large">How to Adjust </span>Module Width</a></li>\r\n  <li><a class="nobold" rel="rokbox[504 336]" title="Video Tutorial :: Module Variations" href="www.gantry-framework.org/videos/joomla/g4-module-variations.mp4"><span class="visible-large">View Gantry </span>Module Variations</a></li>\r\n  <li><a class="nobold" rel="rokbox[504 336]" title="Video Tutorial :: Force Module Positionsr" href="www.gantry-framework.org/videos/joomla/g4-forcepos.mp4"><span class="visible-large">How to </span>Force Module Positions</a></li>\r\n  <li><a class="nobold" rel="rokbox[504 336](joomla15basic)" title="Video Tutorial :: Template Overrides" href="www.gantry-framework.org/videos/joomla/g4-overrides.mp4"><span class="visible-large">How to Do </span>Template Overrides</a></li>\r\n</ul>\r\n<a href="http://www.gantry-framework.org/documentation" target="_blank" class="readon largemargintop smallmarginbottom"><span>View All</span></a>', 19, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box4 icon-camera","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(134, 'Essential Files', '', '<ul class="list-icon checkmark normalfont nomarginbottom">\r\n  <li><strong>Gantry Framework</strong> - Download the latest version of Gantry Framework from <a href="" target="_blank">http://www.gantry-framework.org/</a> for update</li>\r\n  <li><strong>Template (Standalone)</strong> <em>rt_metropolis.zip</em> - Standalone template file without the Gantry Framework (If Gantry is already installed)</li>\r\n  <li><strong>Template (Bundle)</strong> <em>rt_metropolis-bundle.zip</em> - Template plus the Gantry Framework (If Gantry is not installed)</li>\r\n  <li><strong>RokNavMenu</strong> <em>rt_metropolis-extensions.zip(<strong>unzip first</strong>) and find mod_roknavmenu.zip</em> - Required for the menu to work</li>\r\n</ul>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-fire","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(135, 'Additional Files', '', '<ul class="list-icon checkmark normalfont nomarginbottom">\r\n  <li><strong>Source PNG(s)</strong> <em>rt_metropolis-sources.zip</em> - Adobe® Fireworks PNG source file(s) and any applicable fonts</li>\r\n  <li><strong>Source BG PNG(s)</strong> <em>rt_metropolis-sources-bg.zip</em> - Adobe® Fireworks PNG BG source file(s) — <em>Only distributed if the template has complex BGs</em></li>\r\n  <li><strong>Extensions</strong> <em>rt_metropolis-extensions.zip</em> - All extensions used for the template (Unzip first to find the individual extension)</li>\r\n  <li><strong>RocketLauncher</strong> <em>rt_metropolis-rocketlauncher.zip</em> - Demo replica installer. It needs a fresh Joomla! installation</li>\r\n</ul>', 1, 'footer-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 icon-plus-sign","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(136, '10 Preset Styles - Preview Live', '', '<div class="rt-center">\r\n    <p class="notice">View all styles live by appending <strong>?presets=preset#</strong> or <strong>&amp;presets=preset#</strong> to the end of your URL such as <strong><a href="#">http://yoursite.com/index.php?presets=preset4</a></strong>.</p>\r\n\r\n	<p>In sequential order, <strong>Preset 1 - Preset 10</strong>. Please click on the image to load a live example of each style variation.</p>\r\n</div>\r\n\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset1">\r\n      <span class="rt-image">\r\n        <img alt="Preset 1" src="images/rocketlauncher/styles/ss1.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset2">\r\n      <span class="rt-image">\r\n        <img alt="Preset 2" src="images/rocketlauncher/styles/ss2.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset3">\r\n      <span class="rt-image">\r\n        <img alt="Preset 3" src="images/rocketlauncher/styles/ss3.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset4">\r\n      <span class="rt-image">\r\n        <img alt="Preset 4" src="images/rocketlauncher/styles/ss4.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset5">\r\n      <span class="rt-image">\r\n        <img alt="Preset 5" src="images/rocketlauncher/styles/ss5.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset6">\r\n      <span class="rt-image">\r\n        <img alt="Preset 6" src="images/rocketlauncher/styles/ss6.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset7">\r\n      <span class="rt-image">\r\n        <img alt="Preset 7" src="images/rocketlauncher/styles/ss7.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset8">\r\n      <span class="rt-image">\r\n        <img alt="Preset 8" src="images/rocketlauncher/styles/ss8.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset9">\r\n      <span class="rt-image">\r\n        <img alt="Preset 9" src="images/rocketlauncher/styles/ss9.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n<div class="gantry-width-20 gantry-width-block">\r\n  <div class="gantry-width-spacer">\r\n    <a href="index.php?option=com_content&amp;view=article&amp;id=10&amp;Itemid=117&amp;presets=preset10">\r\n      <span class="rt-image">\r\n        <img alt="Preset 10" src="images/rocketlauncher/styles/ss10.jpg" />\r\n      </span>\r\n    </a>\r\n  </div>\r\n</div>\r\n\r\n<div class="clear"></div>\r\n', 1, 'showcase-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 icon-heart icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(137, 'Custom Presets', '', '<p class="hidden-tablet">Gantry provides the ability for you to create your own custom presets based on any parameter in the template administrator.</p>\r\n\r\n<ul class="circle-large">\r\n  <li>Go to <strong>Extensions &rarr; Template Manager &rarr; rt_metropolis</strong></li>\r\n  <li>Click "<strong>Presets</strong>"</li>\r\n  <li>Configure the Settings</li>\r\n  <li>Click <strong>Save &rarr; Save Preset</strong></li>\r\n  <li>Follow the <strong>Preset Saver procedure</strong></li>\r\n</ul>\r\n\r\n<div class="hidden-tablet">\r\n<p class="notice">You can edit the prebuilt presets in the <strong>gantry.config.php</strong> file, or use the User Interface method outlined above.</p>\r\n</div>\r\n\r\n<p class="visible-large">When you create a new custom preset, there is a default image used in the preset chooser to represent this. You can create your own thumbnail for each style by creating a png file that is the ''short'' name of the preset with the dimensions of 180px x 100px.</p>\r\n\r\n<a class="readon" href="http://www.gantry-framework.org/documentation/joomla/customize/custom-presets" target="_blank">Gantry Framework: Custom Presets</a>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(138, 'Preset Footer', '', '<div class="rt-image largemarginbottom"><img alt="image" src="images/rocketlauncher/styles/presets-save.jpg" /></div>\r\n<div class="clear"></div>\r\n<div class="rt-image"><img alt="image" src="images/rocketlauncher/styles/presets-create.jpg" /></div>', 1, 'footer-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(139, 'RocketTheme Clubs', '', '<div>\r\n  <h4 class="nomarginbottom">Joomla Templates Club</h4>\r\n  <p>Best known template club in JoomlaSphere</p>\r\n</div>\r\n\r\n<div>\r\n  <h4 class="nomarginbottom">Wordpress Themes Club</h4>\r\n  <p>Provides a stunningly unique blog design</p>\r\n</div>\r\n\r\n<div>\r\n  <h4 class="nomarginbottom">Magento Templates Club</h4>\r\n  <p>eCommerce template platform for growth</p>\r\n</div>  \r\n\r\n<div>\r\n  <h4 class="nomarginbottom">phpBB3 Styles Club</h4>\r\n  <p>Transform phpBB3 into a professional forum</p>\r\n</div>  \r\n\r\n<a href="https://www.rockettheme.com/join-a-club" class="readon" target="_blank"><span>Join Now</span></a>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box1 icon-home","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(140, 'Newsflash', '', '', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_news', 1, 1, '{"catid":["12"],"image":"0","item_title":"0","link_titles":"","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"1","ordering":"a.publish_up","layout":"_:default","moduleclass_sfx":"box2 title3","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(141, 'Main Menu', '', '', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"box4 icon-th-list","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(142, 'Member Access', '', '', 20, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 0, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","layout":"_:default","moduleclass_sfx":"box2 icon-lock","cache":"0"}', 0, '*'),
(143, 'Who''s Online', '', '', 20, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_whosonline', 1, 1, '{"showmode":"0","layout":"_:default","moduleclass_sfx":"box3 icon-user","cache":"0","filter_groups":"0"}', 0, '*'),
(144, 'Module in Menu', '', '<p>This is an example of a module being displayed inside the menu <strong>dropdowns</strong>.</p>\r\n<p><a href="#" class="readon"><span>Read More</span></a></p>', 0, 'menu-mod', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(145, 'Copyright Menu', '', '', 0, 'copyright-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 0, '{"menutype":"copyrightmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"horizmenu nomarginleft nomarginright nopaddingleft nopaddingright hidden-phone","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(146, 'title1', '', '<p>An example module using the <strong>title1</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(147, 'title3', '', '<p>An example module using the <strong>title3</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(148, 'box1', '', '<p>An example module using the <strong>box1</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(149, 'box3', '', '<p>An example module using the <strong>box3</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(150, 'title2', '', '<p>An example module using the <strong>title2</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(151, 'title4', '', '<p>An example module using the <strong>title4</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title4","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(152, 'box2', '', '<p>An example module using the <strong>box2</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(153, 'box4', '', '<p>An example module using the <strong>box4</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box4","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(154, 'box2 title3', '', '<p>An example module using the <strong>box2 title3</strong> module suffix.</p>\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>\r\n<a href="#" class="readon"><span>More</span></a>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box2 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(155, 'box3 title2', '', '<p>An example module using the <strong>box3 title2</strong> module suffix.</p>\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>\r\n<a href="#" class="readon"><span>More</span></a>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 title2","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(156, 'box4 title1', '', '<p>An example module using the <strong>box4 title1</strong> module suffix.</p>\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>\r\n<a href="#" class="readon"><span>More</span></a>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box4 title1","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(157, 'FP Showcase - RokSprocket Features', '', '', 1, 'showcase-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_roksprocket', 1, 0, '{"provider":"joomla","layout":"features","joomla_articles":{"1":{"root":{"article":"1"}},"2":{"root":{"article":"6"}},"3":{"root":{"article":"4"}},"4":{"root":{"article":"10"}}},"joomla_sort":"manual","joomla_sort_manual_append":"after","headlines_themes":"default","tabs_themes":"default","mosaic_themes":"default","lists_themes":"default","tabs_position":"top","lists_enable_accordion":"1","display_limit":"\\u221e","features_themes":"showcase","headlines_label_text":"","features_show_title":"1","lists_previews_length":"20","headlines_previews_length":"20","tabs_animation":"slideandfade","lists_strip_html_tags":"1","lists_items_per_page":"5","mosaic_columns":"3","tabs_autoplay":"0","features_show_article_text":"1","headlines_show_arrows":"show","features_previews_length":"\\u221e","features_strip_html_tags":"0","headlines_animation":"slideandfade","lists_show_arrows":"show","mosaic_previews_length":"20","tabs_autoplay_delay":"5","features_show_arrows":"show","mosaic_strip_html_tags":"1","mosaic_items_per_page":"5","lists_show_pagination":"1","features_show_pagination":"1","headlines_autoplay":"0","tabs_resize_enable":"0","tabs_resize_width":"0","tabs_resize_height":"0","mosaic_article_details":"0","features_animation":"crossfade","headlines_autoplay_delay":"5","tabs_previews_length":"0","lists_autoplay":"0","tabs_strip_html_tags":"0","mosaic_animations":["fade","scale","rotate"],"features_autoplay":"0","lists_autoplay_delay":"5","headlines_resize_enable":"0","headlines_resize_width":"0","headlines_resize_height":"0","mosaic_ordering":["default","title","date","random"],"features_autoplay_delay":"5","lists_resize_enable":"0","lists_resize_width":"0","lists_resize_height":"0","features_resize_enable":"0","features_resize_width":"0","features_resize_height":"0","headlines_description_default":"primary","features_title_default":"title","tabs_title_default":"title","headlines_image_default":"primary","lists_title_default":"title","features_description_default":"primary","lists_description_default":"primary","headlines_image_default_custom":"","lists_image_default":"primary","tabs_icon_default":"primary","features_image_default":"primary","tabs_icon_default_custom":"","lists_image_default_custom":"","headlines_link_default":"primary","lists_link_default":"primary","headlines_link_default_custom":"","features_image_default_custom":"","tabs_link_default":"primary","lists_link_default_custom":"","features_link_default":"primary","tabs_link_default_custom":"","features_link_default_custom":"","mosaic_resize_enable":"0","mosaic_resize_width":"0","mosaic_resize_height":"0","mosaic_title_default":"title","tabs_description_default":"primary","mosaic_description_default":"primary","mosaic_image_default":"primary","mosaic_image_default_custom":"","mosaic_link_default":"primary","mosaic_link_default_custom":"","cache":"0","moduleclass_sfx":"basic","module_cache":"1","cache_time":"900"}', 0, '*'),
(158, 'FP Feature - RokSprocket Mosaic', '', '', 1, 'feature-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_roksprocket', 1, 0, '{"provider":"joomla","layout":"mosaic","joomla_articles":{"1":{"root":{"article":"0"}}},"joomla_filters":{"1":{"root":{"category":"14"}}},"joomla_sort":"manual","joomla_sort_manual_append":"after","headlines_themes":"default","tabs_themes":"default","mosaic_themes":"default","lists_themes":"default","tabs_position":"top","lists_enable_accordion":"1","display_limit":"\\u221e","features_themes":"slideshow","headlines_label_text":"","features_show_title":"1","lists_previews_length":"20","headlines_previews_length":"20","tabs_animation":"slideandfade","lists_strip_html_tags":"1","lists_items_per_page":"5","mosaic_columns":"3","tabs_autoplay":"0","features_show_article_text":"1","headlines_show_arrows":"show","features_previews_length":"\\u221e","features_strip_html_tags":"1","headlines_animation":"slideandfade","lists_show_arrows":"show","mosaic_previews_length":"13","tabs_autoplay_delay":"5","features_show_arrows":"show","mosaic_strip_html_tags":"1","mosaic_items_per_page":"3","lists_show_pagination":"1","features_show_pagination":"1","headlines_autoplay":"0","tabs_resize_enable":"0","tabs_resize_width":"0","tabs_resize_height":"0","mosaic_article_details":"0","features_animation":"crossfade","headlines_autoplay_delay":"5","tabs_previews_length":"0","lists_autoplay":"0","tabs_strip_html_tags":"0","mosaic_animations":["fade","scale","rotate"],"features_autoplay":"1","lists_autoplay_delay":"5","headlines_resize_enable":"0","headlines_resize_width":"0","headlines_resize_height":"0","mosaic_ordering":["default","title","date","random"],"features_autoplay_delay":"5","lists_resize_enable":"0","lists_resize_width":"0","lists_resize_height":"0","features_resize_enable":"0","features_resize_width":"0","features_resize_height":"0","headlines_description_default":"primary","features_title_default":"title","tabs_title_default":"title","headlines_image_default":"primary","lists_title_default":"title","features_description_default":"primary","lists_description_default":"primary","headlines_image_default_custom":"","lists_image_default":"primary","tabs_icon_default":"primary","features_image_default":"primary","tabs_icon_default_custom":"","lists_image_default_custom":"","headlines_link_default":"primary","lists_link_default":"primary","headlines_link_default_custom":"","features_image_default_custom":"","tabs_link_default":"primary","lists_link_default_custom":"","features_link_default":"primary","tabs_link_default_custom":"","features_link_default_custom":"","mosaic_resize_enable":"0","mosaic_resize_width":"0","mosaic_resize_height":"0","mosaic_title_default":"title","tabs_description_default":"primary","mosaic_description_default":"primary","mosaic_image_default":"primary","mosaic_image_default_custom":"","mosaic_link_default":"custom","mosaic_link_default_custom":"index.php?option=com_content&view=article&id=1&Itemid=108","cache":"0","moduleclass_sfx":"basic","module_cache":"1","cache_time":"900"}', 0, '*'),
(159, 'From Blog', '', '', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_roksprocket', 1, 1, '{"provider":"joomla","layout":"tabs","joomla_filters":{"1":{"root":{"category":"15"}}},"joomla_sort":"manual","joomla_sort_manual_append":"after","headlines_themes":"default","tabs_themes":"default","mosaic_themes":"default","lists_themes":"default","tabs_position":"top","lists_enable_accordion":"1","display_limit":"\\u221e","features_themes":"slideshow","headlines_label_text":"","features_show_title":"1","lists_previews_length":"20","headlines_previews_length":"20","tabs_animation":"slideandfade","lists_strip_html_tags":"1","lists_items_per_page":"5","mosaic_columns":"3","tabs_autoplay":"0","features_show_article_text":"1","headlines_show_arrows":"show","features_previews_length":"\\u221e","features_strip_html_tags":"1","headlines_animation":"slideandfade","lists_show_arrows":"show","mosaic_previews_length":"20","tabs_autoplay_delay":"5","features_show_arrows":"show","mosaic_strip_html_tags":"1","mosaic_items_per_page":"5","lists_show_pagination":"1","features_show_pagination":"1","headlines_autoplay":"0","tabs_resize_enable":"0","tabs_resize_width":"0","tabs_resize_height":"0","mosaic_article_details":"0","features_animation":"crossfade","headlines_autoplay_delay":"5","tabs_previews_length":"0","lists_autoplay":"0","tabs_strip_html_tags":"0","mosaic_animations":["fade","scale","rotate"],"features_autoplay":"1","lists_autoplay_delay":"5","headlines_resize_enable":"0","headlines_resize_width":"0","headlines_resize_height":"0","mosaic_ordering":["default","title","date","random"],"features_autoplay_delay":"5","lists_resize_enable":"0","lists_resize_width":"0","lists_resize_height":"0","features_resize_enable":"0","features_resize_width":"0","features_resize_height":"0","headlines_description_default":"primary","features_title_default":"title","tabs_title_default":"title","headlines_image_default":"primary","lists_title_default":"title","features_description_default":"primary","lists_description_default":"primary","headlines_image_default_custom":"","lists_image_default":"primary","tabs_icon_default":"primary","features_image_default":"primary","tabs_icon_default_custom":"","lists_image_default_custom":"","headlines_link_default":"primary","lists_link_default":"primary","headlines_link_default_custom":"","features_image_default_custom":"","tabs_link_default":"none","lists_link_default_custom":"","features_link_default":"primary","tabs_link_default_custom":"index.php?option=com_content&view=article&id=6&Itemid=113","features_link_default_custom":"","mosaic_resize_enable":"0","mosaic_resize_width":"0","mosaic_resize_height":"0","mosaic_title_default":"title","tabs_description_default":"primary","mosaic_description_default":"primary","mosaic_image_default":"primary","mosaic_image_default_custom":"","mosaic_link_default":"primary","mosaic_link_default_custom":"","cache":"0","moduleclass_sfx":"box4","module_cache":"1","cache_time":"900"}', 0, '*'),
(160, 'Help & Tips', '', '', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_roksprocket', 1, 1, '{"provider":"joomla","layout":"lists","joomla_filters":{"1":{"root":{"category":"16"}}},"joomla_sort":"automatic","joomla_sort_manual_append":"after","tabs_themes":"default","mosaic_themes":"default","headlines_themes":"default","lists_themes":"default","display_limit":"\\u221e","lists_enable_accordion":"1","tabs_position":"top","headlines_label_text":"","features_themes":"slideshow","lists_previews_length":"17","features_show_title":"1","tabs_animation":"slideandfade","headlines_previews_length":"20","lists_strip_html_tags":"1","tabs_autoplay":"0","lists_items_per_page":"5","features_show_article_text":"1","headlines_show_arrows":"show","mosaic_columns":"3","features_previews_length":"\\u221e","features_strip_html_tags":"1","mosaic_previews_length":"20","headlines_animation":"slideandfade","tabs_autoplay_delay":"5","features_show_arrows":"show","lists_show_arrows":"show","mosaic_strip_html_tags":"1","features_show_pagination":"1","mosaic_items_per_page":"5","headlines_autoplay":"0","lists_show_pagination":"1","tabs_resize_enable":"0","tabs_resize_width":"0","tabs_resize_height":"0","features_animation":"crossfade","lists_autoplay":"0","tabs_previews_length":"0","mosaic_article_details":"0","headlines_autoplay_delay":"5","features_autoplay":"1","lists_autoplay_delay":"5","tabs_strip_html_tags":"0","mosaic_animations":["fade","scale","rotate"],"headlines_resize_enable":"0","headlines_resize_width":"0","headlines_resize_height":"0","mosaic_ordering":["default","title","date","random"],"features_autoplay_delay":"5","lists_resize_enable":"0","lists_resize_width":"0","lists_resize_height":"0","features_resize_enable":"0","features_resize_width":"0","features_resize_height":"0","headlines_description_default":"primary","headlines_image_default":"primary","tabs_title_default":"title","features_title_default":"title","lists_title_default":"title","features_description_default":"primary","headlines_image_default_custom":"","tabs_icon_default":"primary","lists_image_default":"primary","lists_description_default":"primary","features_image_default":"primary","lists_image_default_custom":"","tabs_icon_default_custom":"","headlines_link_default":"primary","features_image_default_custom":"","lists_link_default":"none","headlines_link_default_custom":"","tabs_link_default":"primary","lists_link_default_custom":"index.php?option=com_content&view=article&id=7&Itemid=114","tabs_link_default_custom":"","features_link_default":"primary","features_link_default_custom":"","mosaic_resize_enable":"0","mosaic_resize_width":"0","mosaic_resize_height":"0","mosaic_title_default":"title","tabs_description_default":"primary","mosaic_description_default":"primary","mosaic_image_default":"primary","mosaic_image_default_custom":"","mosaic_link_default":"primary","mosaic_link_default_custom":"","cache":"0","moduleclass_sfx":"icon-book box4","module_cache":"1","cache_time":"900"}', 0, '*'),
(161, 'Search Art', '', '', 1, 'sidebar-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_rokajaxsearch', 1, 1, '{"search_page":"index.php?option=com_search&view=search&tmpl=component","adv_search_page":"index.php?option=com_search&view=search","include_css":"0","theme":"light","searchphrase":"any","ordering":"newest","limit":"10","perpage":"3","websearch":"0","blogsearch":"0","imagesearch":"0","videosearch":"0","websearch_api":"","show_pagination":"1","safesearch":"MODERATE","image_size":"MEDIUM","show_estimated":"1","hide_divs":"","include_link":"1","show_description":"1","include_category":"1","show_readmore":"1","moduleclass_sfx":"basic nomarginleft nomarginright nomarginbottom nopaddingbottom","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(162, 'Preset Styles', '', '<p> </p>\r\n<div class="rt-center">\r\n<div class="module-title">\r\n<h2 class="title nomarginbottom visible-large">Preset Styles</h2>\r\n<h2 class="title nomarginbottom hidden-large">Styles</h2>\r\n</div>\r\n</div>', 2, 'sidebar-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box3 icon-heart icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(163, 'FP MainBottom A', '', '<div class="rt-image">\r\n    <img alt="image" src="images/rocketlauncher/frontpage/mainbottom/img1.jpg" />\r\n    <div class="rt-image-description">\r\n        <span class="icon-eye-open rt-big-icon"></span>\r\n        <h4>Template Configuration</h4>\r\n        <p>Guides Available</p>\r\n        <a href="index.php?option=com_content&amp;view=article&amp;id=7&amp;Itemid=114" class="readon"><span>Read More</span></a>\r\n    </div>\r\n</div>', 1, 'mainbottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"basic nopaddingleft nopaddingright","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(164, 'Demo Info', '', '<p>All demo content is for <strong>sample</strong> purposes only, intended to show a live site. All images are licensed from <a href="http://www.shutterstock.com" target="_blank"><strong>ShutterStock</strong></a> for  exclusive use on this <strong>demo</strong> site only.</p>\r\n\r\n<p class="rt-image hidden-tablet">\r\n    <img class="rt-noborder" src="images/rocketlauncher/frontpage/footer/logo-footer.png" alt="Logo" />\r\n</p>', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(165, 'Inside Metropolis', '', '<ul class="rt-demo-footer-menu">\r\n  <li><a href="index.php?option=com_content&amp;view=article&amp;id=1&amp;Itemid=108">Features</a></li>\r\n  <li><a href="index.php?option=com_content&amp;view=article&amp;id=2&amp;Itemid=109">Module Positions</a></li>\r\n  <li><a href="index.php?option=com_content&amp;view=article&amp;id=3&amp;Itemid=110">Module Variations</a></li>\r\n  <li class="hidden-tablet"><a href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113">Extensions</a></li>\r\n</ul>', 1, 'footer-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"hidden-phone","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(166, 'Contact Us', '', '<div class="gantry-width-10 gantry-width-block medmarginright">\n    <span class="icon-phone medmarginbottom largepaddingbottom"></span>\n</div>\n<div class="gantry-width-90 gantry-width-block">\n    <a href="#"><em class="bold nobold">+1 (555) 555-555-5555</em></a><br />\n    <span><em class="bold nobold">+1 (555) 555-555-5556</em></span>\n</div>\n\n<div class="clear medmarginbottom">&nbsp;</div>\n\n<div class="gantry-width-10 gantry-width-block medmarginright">\n    <span class="icon-home medmarginbottom largepaddingbottom"></span>\n</div>\n<div class="gantry-width-90 gantry-width-block">\n    <a href="#"><em class="bold nobold">Metropolis Template LLC</em></a><br />\n    <em class="bold nobold">\n      123 Joomla! Boulevard<br />\n      Seattle, WA 00000, USA \n	</em>\n</div>\n\n<div class="clear medmarginbottom hidden-tablet">&nbsp;</div>\n\n<div class="gantry-width-10 gantry-width-block medmarginright hidden-tablet">\n	<span class="icon-envelope-alt medmarginbottom largepaddingbottom"></span>\n</div>\n<div class="gantry-width-90 gantry-width-block hidden-tablet">\n	<p><em class="bold nobold">noreply@domain.com</em></p>\n</div>\n\n<div class="clear"></div>', 1, 'footer-c', 97, '2013-04-08 02:27:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"hidden-phone","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(167, 'RocketLauncher', '', '<div class="rt-center">\r\n    <div class="module-title">\r\n      <h2 class="title visible-large">RocketLauncher</h2>\r\n      <h2 class="title hidden-large smallmarginbottom">Replica</h2>\r\n    </div>\r\n</div>\r\n\r\n<span class="visible-tablet">A full Joomla installation that installs a editied version of the demo.</span>\r\n<span class="hidden-tablet">A full Joomla installation that installs a editied version of the demo onto your server.</span>', 1, 'sidebar-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box2 icon-magic icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(168, 'FP MainBottom B', '', '<div class="rt-image">\r\n    <img alt="image" src="images/rocketlauncher/frontpage/mainbottom/img2.jpg" />\r\n    <div class="rt-image-description">\r\n        <span class="icon-eye-open rt-big-icon"></span>\r\n        <h4>Adobe&reg; Fireworks PNG</h4>\r\n        <p>Layered Sources</p>\r\n        <a href="index.php?option=com_content&amp;view=article&amp;id=9&amp;Itemid=116" class="readon"><span>Read More</span></a>\r\n    </div>\r\n</div>', 1, 'mainbottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"basic nopaddingleft nopaddingright hidden-phone","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(169, 'FP MainBottom C', '', '<div class="rt-image">\r\n    <img alt="image" src="images/rocketlauncher/frontpage/mainbottom/img3.jpg" />\r\n    <div class="rt-image-description">\r\n        <span class="icon-eye-open rt-big-icon"></span>\r\n        <h4>Demo Replication</h4>\r\n        <p>RocketLauncher</p>\r\n        <a href="index.php?option=com_content&amp;view=article&amp;id=8&amp;Itemid=115" class="readon"><span>Read More</span></a>\r\n    </div>\r\n</div>', 1, 'mainbottom-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"basic nopaddingleft nopaddingright hidden-phone","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(170, 'FP MainBottom D', '', '<div class="rt-image">\r\n    <img alt="image" src="images/rocketlauncher/frontpage/mainbottom/img4.jpg" />\r\n    <div class="rt-image-description">\r\n        <span class="icon-eye-open rt-big-icon"></span>\r\n        <h4>Versatile RokSprocket</h4>\r\n        <p>Integrated Styling</p>\r\n        <a href="index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=113" class="readon"><span>Read More</span></a>\r\n    </div>\r\n</div>', 1, 'mainbottom-d', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"basic nopaddingleft nopaddingright hidden-phone","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(172, 'Our Users', '', '<div class="rt-demo-block gantry-width-33 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <span class="rt-image">\n      <img src="images/rocketlauncher/frontpage/sidebar/user1.jpg" alt="image">\n    </span>\n  </div>\n</div>\n\n<div class="rt-demo-block gantry-width-33 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <span class="rt-image">\n      <img src="images/rocketlauncher/frontpage/sidebar/user2.jpg" alt="image">\n    </span>\n  </div>\n</div>\n\n<div class="rt-demo-block gantry-width-33 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <span class="rt-image">\n      <img src="images/rocketlauncher/frontpage/sidebar/user3.jpg" alt="image">\n    </span>\n  </div>\n</div>\n\n<div class="clear"></div>\n\n<div class="rt-demo-block gantry-width-33 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <span class="rt-image">\n      <img src="images/rocketlauncher/frontpage/sidebar/user4.jpg" alt="image">\n    </span>\n  </div>\n</div>\n\n<div class="rt-demo-block gantry-width-33 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <span class="rt-image">\n     <img src="images/rocketlauncher/frontpage/sidebar/user5.jpg" alt="image">\n    </span>\n  </div>\n</div>\n\n<div class="rt-demo-block gantry-width-33 gantry-width-block">\n  <div class="gantry-width-spacer">\n    <span class="rt-image">\n 		<img src="images/rocketlauncher/frontpage/sidebar/user5.jpg" alt="image">\n    </span>\n  </div>\n</div>\n\n<div class="clear"></div>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"fp-recent-users icon-user basic hidden-phone","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(173, 'box5', '', '<p>An example module using the <strong>box5</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box5","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(174, 'basic', '', '<p>An example module using the <strong>basic</strong> module suffix.</p>\r\n<p>This suffix will only display the module content without its border and background.</p>\r\n<a href="#" class="readon"><span>More</span></a>', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"basic","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(175, 'RokAjaxSearch', '', '<p>RokAjaxSearch is a truly powerful module that brings fantastic search functionality to Joomla, using the powerful and versatile javascript library, Mootools as well as full Google Search integration.</p>\r\n<p>RokAjaxSearch offers AJAX powered real time search results for both your Joomla site content as well Google Search. There are various configuration options and parameters allowing you to enable not only Google web search, but Google Blog search, Google Image search, and Google Video search.</p>\r\n<span class="visible-desktop rt-floatleft"><a class="readon" rel="rokbox" href="images/rocketlauncher/extensions/ext-rokajaxsearch.jpg" target="_blank">Preview</a></span>\r\n<a class="readon" href="http://www.rockettheme.com/extensions-joomla/rokajaxsearch" target="_blank">Download: RokAjaxSearch</a>', 1, 'content-top-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box4 title3","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(176, 'FontAwesome Title Icon Suffix', '', '<p>Furthermore, you can also add <a href="http://fortawesome.github.com/Font-Awesome/">FontAwesome</a> icons into the Module Class Suffix.  You will get a medium sized icon to the left of the title. If you compound it with <strong>icon-large</strong> suffix, it will make a large centered icon above the title with the title centered.</p>\r\n\r\n<p></p>Suffixes are in the <strong>icon-NAME</strong> format such as <strong>icon-star</strong>, as shown on the <a href="index.php?option=com_content&amp;view=article&amp;id=4&amp;Itemid=111">Typography</a> page.</p>', 1, 'mainbottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"icon-star","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(177, 'icon-facebook', '', '<p>An example module using the <strong>icon-facebook</strong> module class suffix.</p>\r\n<p class="visible-desktop">Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>\r\n<p class="hidden-large">Nulla mauris ipsum, egestas ut mattis eu, sagittis vel quam. Ut sapien nunc, malesuada id lacinia eget.</p>\r\n<p class="visible-large">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum at sem ut ipsum vestibulum euismod. Mauris et massa porta leo facilisis feugiat. Suspendisse id neque a sem facilisis blandit.</p>\r\n<p><a class="readon" href="#"><span>More</span></a></p>', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"icon-facebook","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(178, 'icon-twitter icon-large', '', '<p>An example module using the <strong>icon-twitter icon-large</strong> module class suffix.</p>', 1, 'bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"icon-twitter icon-large","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(179, 'icon-pinterest', '', '<p>An example module using the <strong>icon-pinterest</strong> module class suffix.</p>\r\n\r\n<p class="visible-desktop">Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>\r\n\r\n<p class="hidden-large">Nulla mauris ipsum, egestas ut mattis eu, sagittis vel quam. Ut sapien nunc, malesuada id lacinia eget.</p>\r\n\r\n<p class="visible-large">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum at sem ut ipsum vestibulum euismod. Mauris et massa porta leo facilisis feugiat. Suspendisse id neque a sem facilisis blandit.</p>\r\n\r\n<a class="readon" href="#"><span>More</span></a>', 1, 'bottom-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"icon-pinterest","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(180, 'box6', '', '<p>An example module using the <strong>box6</strong> module suffix.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consecetur adipiscing elit donec sit amet nibh.</p>', 1, 'content-bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"box6","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(181, 'About Metropolis', '', '<p><strong>Metropolis</strong>, the November 2012 template release, is an elegantly designed theme, combining simple color schemes and shades to complement many content setups.</p> \r\n\r\n<p>The template''s user level functionality is mastered by RokSprocket, which benefits from integrated Metropolis styling. A standard assortment of features are included.</p>\r\n\r\n<a href="index.php?option=com_content&view=article&id=39&catid=12&Itemid=142">About Us</a><a href="index.php?option=com_rokgallery&view=gallery&Itemid=145">Gallery</a>', 2, 'content-top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');
INSERT INTO `tbl_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(182, 'Menu Presets', '', '<div class="rt-center">\n  <a href="?presets=preset1" class="rt-floatleft largemarginbottom">\n    <p>Preset 1</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset1.png" width="75" height="66" alt="Preset 1" />\n    </span>\n  </a>\n  <a href="?presets=preset2" class="rt-floatleft largemarginbottom nomarginright">\n    <p>Preset 2</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset2.png" width="75" height="66" alt="Preset 2" />\n    </span>\n  </a>\n  \n  <div class="clear"></div>\n  \n  <a href="?presets=preset3" class="rt-floatleft largemarginbottom">\n    <p>Preset 3</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset3.png" width="75" height="66" alt="Preset 3" />\n    </span>\n  </a>\n  <a href="?presets=preset4" class="rt-floatleft largemarginbottom nomarginright">\n    <p>Preset 4</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset4.png" width="75" height="66" alt="Preset 4" />\n    </span>\n  </a>\n  \n  <div class="clear"></div>\n  \n  <a href="?presets=preset5" class="rt-floatleft largemarginbottom">\n    <p>Preset 5</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset5.png" width="75" height="66" alt="Preset 5" />\n    </span>\n  </a>\n  <a href="?presets=preset6" class="rt-floatleft largemarginbottom nomarginright">\n    <p>Preset 6</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset6.png" width="75" height="66" alt="Preset 6" />\n    </span>\n  </a>\n  \n  <div class="clear"></div>\n  \n  <a href="?presets=preset7" class="rt-floatleft largemarginbottom">\n    <p>Preset 7</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset7.png" width="75" height="66" alt="Preset 7" />\n    </span>\n  </a>\n  <a href="?presets=preset8" class="rt-floatleft largemarginbottom nomarginright">\n    <p>Preset 8</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset8.png" width="75" height="66" alt="Preset 8" />\n    </span>\n  </a>\n  \n  <div class="clear"></div>\n\n  <a href="?presets=preset9" class="rt-floatleft largemarginbottom">\n    <p>Preset 9</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset9.png" width="75" height="66" alt="Preset 9" />\n    </span>\n  </a>\n  <a href="?presets=preset10" class="rt-floatleft largemarginbottom nomarginright">\n    <p>Preset 10</p>\n    <span class="rt-image">\n      <img src="images/rocketlauncher/styles/preset10.png" width="75" height="66" alt="Preset 10" />\n    </span>\n  </a>\n  \n  <div class="clear"></div>\n</div>', 1, 'menu-presets', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(183, 'Breadcrumbs', '', '', 0, 'breadcrumb', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 0, '{"showHere":"1","showHome":"1","homeText":"","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(186, 'Social Login', '', '', 1, 'showcase-a', 97, '2013-06-05 04:35:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_socialloginandsocialshare', 1, 1, '{"pretext":"","posttext":"","login":"101","logout":"101","usesecure":"0","layout":"_:default","moduleclass_sfx":""}', 0, '*'),
(188, 'Hello, World!', '', '', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_helloworld', 1, 1, '', 0, '*'),
(189, 'rokgalleries', '', '', 1, 'showcase-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_rokgallery', 1, 1, '{"gallery_id":"1","link":"none","default_menuitem":"134","title":"0","caption":"0","sort_by":"gallery_ordering","sort_direction":"ASC","limit_count":"20","css_style":"light","layout":"slideshow","columns":"1","arrows":"yes","navigation":"none","animation_type":"random","animation_duration":"500","autoplay_enabled":"1","autoplay_delay":"7","showcase_arrows":"onhover","showcase_image_position":"left","showcase_imgpadding":"0","showcase_animation_type":"random","showcase_captionsanimation":"crossfade","showcase_animation_duration":"500","showcase_autoplay_enabled":"0","showcase_autoplay_delay":"7","showcase_responsive_arrows":"onhover","showcase_responsive_image_position":"left","showcase_responsive_imgpadding":"0","showcase_responsive_animation_type":"random","showcase_responsive_captionsanimation":"crossfade","showcase_responsive_animation_duration":"500","showcase_responsive_autoplay_enabled":"0","showcase_responsive_autoplay_delay":"7","backgroundimage":"","cache":"1","moduleclass_sfx":"","cache_time":"900","cachemode":"static"}', 0, '*'),
(191, 'test', '', '', 8, 'sidebar-a', 97, '2013-04-10 02:33:07', '2013-04-10 09:32:47', '2013-04-17 09:33:01', 1, 'mod_rokminievents', 1, 1, '{"builtin_css":"1","set_widths":"1","wrapper_width":"750","item_number":"3","sortorder":"ascending","time_range":"time_span","startmin":"2013-04-10","startmax":"2015-01-30","rangespan":"current_month","show_description":"1","strip_tags":"a,i,br","trim_description":"1","trim_count":"200","localtime":"server","timezone":"Africa\\/Abidjan","dayformat":"%e","monthformat":"%b","yearformat":"%Y","timeformat":"%I:%M %p","datedisplay":"badge","showyear":"1","limit_count":"0","events_pane":"4","timeline":"arrows","timeline_dates":"inline","transition":"Expo.easeInOut","duration":"500","offset_x":"0","google":"1","google_gid":"nbijpjkapkbd3f9cvp0qsbi618@group.calendar.google.com","google_past":"1","google_maxresults":"25","google_gcache":"3600","google_links":"link_internal","moduleclass_sfx":"","cache":"0","module_cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(192, 'K2 Comments', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_comments', 1, 1, '', 0, '*'),
(193, 'K2 Content', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_content', 1, 1, '', 0, '*'),
(194, 'K2 Tools', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_tools', 1, 1, '', 0, '*'),
(195, 'K2 Users', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_users', 1, 1, '', 0, '*'),
(196, 'K2 User', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_user', 1, 1, '', 0, '*'),
(197, 'K2 Quick Icons (admin)', '', '', 0, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_quickicons', 1, 1, '', 1, '*'),
(198, 'K2 Stats (admin)', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_stats', 1, 1, '', 1, '*'),
(199, 'calender', '', '', 2, 'bottom-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_rokminievents', 1, 1, '{"builtin_css":"0","set_widths":"0","wrapper_width":"750","item_number":"3","sortorder":"ascending","time_range":"time_span","startmin":"2013-04-18","startmax":"2015-04-30","rangespan":"current_month","show_description":"1","strip_tags":"a,i,br,iframe","trim_description":"1","trim_count":"200","localtime":"local","timezone":"Asia\\/Phnom_Penh","dayformat":"%d","monthformat":"%B","yearformat":"%Y","timeformat":"%I:%M %p","datedisplay":"badge","showyear":"0","limit_count":"0","events_pane":"3","timeline":"both","timeline_dates":"inline","transition":"Expo.easeInOut","duration":"500","offset_x":"0","google":"1","google_gid":"nbijpjkapkbd3f9cvp0qsbi618@group.calendar.google.com","google_past":"1","google_maxresults":"25","google_gcache":"3600","google_links":"link_external","moduleclass_sfx":"","cache":"0","module_cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(200, 'RokStories', '', '', 3, 'maintop-a', 97, '2013-06-03 08:17:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_rokstories', 2, 1, '{"load_css":"1","layout_type":"layout7","content_type":"joomla","catid":[""],"show_front":"1","user_id":"by_me","joomla_image":"text","k2_children":"0","k2_featured":"2","k2_image_size":"L","count":"100","itemsOrdering":"rdate","strip_tags":"a,i,br","content_position":"right","show_article_title":"1","show_created_date":"1","show_article":"1","show_article_link":"1","legacy_readmore":"0","thumb_width":"90","start_width":"auto","start_element":"0","thumbs_opacity":"0.3","fixed_height":"0","mouse_type":"click","autoplay":"0","autoplay_delay":"5000","show_label_article_title":"1","show_arrows":"1","show_circles":"1","arrows_placement":"inside","show_thumbs":"0","fixed_thumb":"1","link_titles":"0","link_labels":"0","link_images":"0","show_mask":"1","mask_desc_dir":"topdown","mask_imgs_dir":"bottomup","scrollerDuration":"1000","scrollerTransition":"Expo.easeInOut","show_controls":"1","left_offset_x":"-40","left_offset_y":"-100","right_offset_x":"-30","right_offset_y":"-100","left_f_offset_x":"-40","left_f_offset_y":"-100","right_f_offset_x":"-30","right_f_offset_y":"-100","moduleclass_sfx":"","cache":"0","module_cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(201, 'RokNewsPager', '', '', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_roknewspager', 1, 1, '{"load_css":"1","theme":"light","content_type":"joomla","joomla_all":"0","catid":["12"],"featured":"1","k2_all":"0","k2_children":"0","k2_featured":"1","k2_image_size":"L","article_count":"5","show_accordion":"0","show_paging":"1","maxpages":"8","show_title":"1","link_title":"0","show_thumbnails":"1","thumb_width":"90","thumbnail_link":"1","show_overlay":"1","overlay":"-1","show_ratings":"1","show_readmore":"1","readmore_text":"Read More...","itemsOrdering":"","show_preview_text":"1","strip_tags":"a,br","preview_count":"200","show_comment_count":"0","show_author":"0","show_published_date":"0","autoupdate":"0","autoupdate_delay":"5000","moduleclass_sfx":"","cache":"0","module_ident":"id","cache_time":"900"}', 0, '*'),
(202, 'latest user ', '', '', 1, 'content-bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_users_latest', 1, 1, '{"shownumber":"5","filter_groups":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(203, 'FP Feature - RokSprocket Mosaic (2)', '', '', 2, 'feature-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_roksprocket', 1, 0, '{"provider":"joomla","layout":"mosaic","joomla_filters":{"1":{"root":{"category":"14"}}},"joomla_sort":"manual","joomla_sort_manual_append":"after","headlines_themes":"default","tabs_themes":"default","mosaic_themes":"default","lists_themes":"default","tabs_position":"top","lists_enable_accordion":"1","display_limit":"\\u221e","features_themes":"slideshow","headlines_label_text":"","features_show_title":"1","lists_previews_length":"20","headlines_previews_length":"20","tabs_animation":"slideandfade","lists_strip_html_tags":"1","lists_items_per_page":"5","mosaic_columns":"3","tabs_autoplay":"0","features_show_article_text":"1","headlines_show_arrows":"show","features_previews_length":"\\u221e","features_strip_html_tags":"1","headlines_animation":"slideandfade","lists_show_arrows":"show","mosaic_previews_length":"13","tabs_autoplay_delay":"5","features_show_arrows":"show","mosaic_strip_html_tags":"1","mosaic_items_per_page":"3","lists_show_pagination":"1","features_show_pagination":"1","headlines_autoplay":"0","tabs_resize_enable":"0","tabs_resize_width":"0","tabs_resize_height":"0","mosaic_article_details":"0","features_animation":"crossfade","headlines_autoplay_delay":"5","tabs_previews_length":"0","lists_autoplay":"0","tabs_strip_html_tags":"0","mosaic_animations":["fade","scale","rotate"],"features_autoplay":"1","lists_autoplay_delay":"5","headlines_resize_enable":"0","headlines_resize_width":"0","headlines_resize_height":"0","mosaic_ordering":["default","title","date","random"],"features_autoplay_delay":"5","lists_resize_enable":"0","lists_resize_width":"0","lists_resize_height":"0","features_resize_enable":"0","features_resize_width":"0","features_resize_height":"0","headlines_description_default":"primary","features_title_default":"title","tabs_title_default":"title","headlines_image_default":"primary","lists_title_default":"title","features_description_default":"primary","lists_description_default":"primary","headlines_image_default_custom":"","lists_image_default":"primary","tabs_icon_default":"primary","features_image_default":"primary","tabs_icon_default_custom":"","lists_image_default_custom":"","headlines_link_default":"primary","lists_link_default":"primary","headlines_link_default_custom":"","features_image_default_custom":"","tabs_link_default":"primary","lists_link_default_custom":"","features_link_default":"primary","tabs_link_default_custom":"","features_link_default_custom":"","mosaic_resize_enable":"0","mosaic_resize_width":"0","mosaic_resize_height":"0","mosaic_title_default":"title","tabs_description_default":"primary","mosaic_description_default":"primary","mosaic_image_default":"primary","mosaic_image_default_custom":"","mosaic_link_default":"custom","mosaic_link_default_custom":"index.php?option=com_content&view=article&id=1&Itemid=108","cache":"0","moduleclass_sfx":"basic","module_cache":"1","cache_time":"900"}', 0, '*'),
(204, 'snydication feed', '', '', 2, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_syndicate', 1, 1, '{"display_text":1,"text":"","format":"rss","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 0, '*'),
(205, 'My Profile', '', '', 1, 'content-top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_socialloginandsocialshare', 1, 1, '{"pretext":"Login","posttext":"My account ","login":"101","logout":"101","usesecure":"0","layout":"_:default","moduleclass_sfx":""}', 0, '*'),
(207, 'testnewsflash', '', '', 1, 'content-bottom-c', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_articles_news', 1, 1, '{"catid":["11"],"image":"0","item_title":"0","link_titles":"","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"5","ordering":"a.publish_up","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(208, 'video', 'video', '', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_related_items', 1, 1, '{"showDate":"0","layout":"_:default","moduleclass_sfx":"","owncache":"1"}', 0, '*'),
(209, 'calender', '', '', 1, 'footer-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_rokminievents', 1, 1, '{"builtin_css":"1","set_widths":"1","wrapper_width":"750","item_number":"3","sortorder":"ascending","time_range":"time_span","startmin":"2013-05-09","startmax":"2013-05-31","rangespan":"current_month","show_description":"1","strip_tags":"a,i,br,iframe","trim_description":"1","trim_count":"200","localtime":"local","timezone":"Asia\\/Brunei","dayformat":"%d","monthformat":"%b","yearformat":"%Y","timeformat":"%I:%M %p","datedisplay":"badge","showyear":"1","limit_count":"2","events_pane":"3","timeline":"arrows","timeline_dates":"inline","transition":"Expo.easeInOut","duration":"500","offset_x":"0","google":"1","google_gid":" nbijpjkapkbd3f9cvp0qsbi618","google_past":"0","google_maxresults":"10","google_gcache":"3600","google_links":"link_no","jevents":"1","jevents_total":"10","jevents_norepeats":"0","jevents_past":"1","jevents_links":"link_no","moduleclass_sfx":"","cache":"0","module_cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(210, 'JEvents Calendar', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jevents_cal', 1, 1, '', 0, '*'),
(211, 'Latest JEvents', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jevents_latest', 1, 1, '', 0, '*'),
(212, 'JEvents Legend', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jevents_legend', 1, 1, '', 0, '*'),
(213, 'JEvents View Switcher', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jevents_switchview', 1, 1, '', 0, '*'),
(214, 'RokStories (2)', '', '', 1, 'showcase-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_rokstories', 2, 1, '{"load_css":"1","layout_type":"layout8","content_type":"joomla","catid":[""],"show_front":"1","user_id":"by_me","joomla_image":"text","k2_children":"0","k2_featured":"2","k2_image_size":"L","count":"4","itemsOrdering":"","strip_tags":"a,i,br","content_position":"left","show_article_title":"1","show_created_date":"0","show_article":"1","show_article_link":"1","legacy_readmore":"0","thumb_width":"90","start_width":"auto","start_element":"0","thumbs_opacity":"0.3","fixed_height":"0","mouse_type":"click","autoplay":"0","autoplay_delay":"5000","show_label_article_title":"1","show_arrows":"1","show_circles":"1","arrows_placement":"inside","show_thumbs":"0","fixed_thumb":"1","link_titles":"0","link_labels":"0","link_images":"0","show_mask":"1","mask_desc_dir":"topdown","mask_imgs_dir":"bottomup","scrollerDuration":"1000","scrollerTransition":"Expo.easeInOut","show_controls":"1","left_offset_x":"-40","left_offset_y":"-100","right_offset_x":"-30","right_offset_y":"-100","left_f_offset_x":"-40","left_f_offset_y":"-100","right_f_offset_x":"-30","right_f_offset_y":"-100","moduleclass_sfx":"","cache":"0","module_cache":"1","cache_time":"900","cachemode":"static"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules_menu`
--

CREATE TABLE IF NOT EXISTS `tbl_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_modules_menu`
--

INSERT INTO `tbl_modules_menu` (`moduleid`, `menuid`) VALUES
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(79, 0),
(86, 0),
(92, 108),
(93, 108),
(94, 108),
(95, 108),
(96, 108),
(97, 108),
(98, 109),
(99, 109),
(100, 109),
(101, 109),
(102, 109),
(103, 110),
(104, 110),
(105, 111),
(106, 111),
(107, 112),
(108, 112),
(109, 112),
(110, 112),
(111, 112),
(112, 112),
(113, 112),
(114, 113),
(115, 113),
(118, 113),
(119, 101),
(120, 113),
(121, 114),
(121, 118),
(121, 123),
(121, 125),
(122, 114),
(122, 118),
(122, 123),
(122, 125),
(123, 114),
(124, 101),
(125, 114),
(126, 114),
(127, 114),
(127, 116),
(127, 118),
(127, 123),
(127, 124),
(127, 125),
(128, 114),
(128, 116),
(128, 118),
(128, 123),
(128, 124),
(128, 125),
(129, 114),
(129, 116),
(129, 118),
(129, 123),
(129, 124),
(129, 125),
(130, 115),
(131, 115),
(132, 112),
(132, 115),
(132, 116),
(132, 117),
(132, 118),
(132, 124),
(132, 125),
(133, 112),
(133, 115),
(133, 116),
(133, 117),
(133, 118),
(134, 115),
(135, 115),
(136, 117),
(137, 117),
(138, 117),
(139, 123),
(140, 123),
(141, 124),
(143, 112),
(143, 115),
(143, 116),
(143, 117),
(143, 118),
(143, 123),
(143, 124),
(143, 125),
(144, 0),
(145, 0),
(146, 110),
(147, 110),
(148, 110),
(149, 110),
(150, 110),
(151, 110),
(152, 110),
(153, 110),
(154, 110),
(155, 110),
(156, 110),
(157, 101),
(158, 101),
(159, 101),
(160, 101),
(161, 101),
(162, 101),
(163, 101),
(164, 101),
(165, 101),
(166, 101),
(167, 101),
(168, 101),
(169, 101),
(170, 101),
(172, 101),
(173, 110),
(174, 110),
(175, 113),
(176, 110),
(177, 110),
(178, 110),
(179, 110),
(180, 110),
(181, 101),
(182, 0),
(183, 124),
(186, 101),
(186, 134),
(186, 135),
(186, 136),
(186, 137),
(187, 0),
(188, 0),
(189, 101),
(189, 134),
(189, 135),
(189, 136),
(189, 137),
(191, 101),
(191, 134),
(191, 135),
(191, 136),
(191, 137),
(197, 0),
(198, 0),
(199, 101),
(199, 134),
(199, 135),
(199, 136),
(199, 137),
(200, 134),
(200, 135),
(200, 136),
(200, 137),
(200, 182),
(201, 0),
(202, 134),
(202, 135),
(202, 136),
(202, 137),
(202, 142),
(203, 101),
(204, 101),
(204, 134),
(204, 135),
(204, 136),
(204, 137),
(205, 101),
(205, 134),
(205, 135),
(205, 136),
(205, 137),
(207, 0),
(208, 0),
(209, 101),
(209, 134),
(209, 135),
(209, 136),
(209, 137),
(214, 134),
(214, 135),
(214, 136),
(214, 137),
(214, 145);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `tbl_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_newsfeeds`
--

INSERT INTO `tbl_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`, `access`, `language`, `params`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `xreference`, `publish_up`, `publish_down`) VALUES
(5, 1, 'feed ', 'feed', 'http://feed', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0, 1, '*', '{"show_feed_image":"","show_feed_description":"","show_item_description":"","feed_character_count":"0","newsfeed_layout":"","feed_display_order":""}', '2013-05-20 02:29:02', 97, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_overrider`
--

CREATE TABLE IF NOT EXISTS `tbl_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_redirect_links`
--

CREATE TABLE IF NOT EXISTS `tbl_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `tbl_redirect_links`
--

INSERT INTO `tbl_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://localhost/myangkorpeople/index.php?Itemid=404', '', 'http://localhost/myangkorpeople/index.php/features', '', 1, 0, '2013-04-08 04:09:25', '0000-00-00 00:00:00'),
(2, 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 'http://localhost/myangkorpeople/', '', 1, 0, '2013-04-08 04:11:44', '0000-00-00 00:00:00'),
(3, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset2.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:46', '0000-00-00 00:00:00'),
(4, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset5.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:47', '0000-00-00 00:00:00'),
(5, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset6.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:47', '0000-00-00 00:00:00'),
(6, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset1.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:47', '0000-00-00 00:00:00'),
(7, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset3.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:47', '0000-00-00 00:00:00'),
(8, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset4.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:47', '0000-00-00 00:00:00'),
(9, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset9.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:50', '0000-00-00 00:00:00'),
(10, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset7.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:51', '0000-00-00 00:00:00'),
(11, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset10.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:51', '0000-00-00 00:00:00'),
(12, 'http://localhost/myangkorpeople/index.php/features/images/rocketlauncher/styles/preset8.png', '', 'http://localhost/myangkorpeople/index.php/features/menu-options?menu-type=dropdownmenu', '', 1, 0, '2013-04-08 04:11:51', '0000-00-00 00:00:00'),
(13, 'http://localhost/myangkorpeople/index.php/component/content/?id=6&Itemid=113', '', 'http://localhost/myangkorpeople/', '', 4, 0, '2013-04-08 04:28:45', '0000-00-00 00:00:00'),
(14, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset3.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:01', '0000-00-00 00:00:00'),
(15, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset1.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:00', '0000-00-00 00:00:00'),
(16, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset2.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:00', '0000-00-00 00:00:00'),
(17, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset5.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:01', '0000-00-00 00:00:00'),
(18, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset4.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:01', '0000-00-00 00:00:00'),
(19, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset6.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:03', '0000-00-00 00:00:00'),
(20, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset7.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:06', '0000-00-00 00:00:00'),
(21, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset8.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:06', '0000-00-00 00:00:00'),
(22, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset10.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:06', '0000-00-00 00:00:00'),
(23, 'http://localhost/myangkorpeople/index.php/about-us/images/rocketlauncher/styles/preset9.png', '', 'http://localhost/myangkorpeople/index.php/about-us/fuck', '', 5, 0, '2013-04-09 02:17:07', '0000-00-00 00:00:00'),
(24, 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 'http://localhost/myangkorpeople/index.php/j-stuff/member-access', '', 2, 0, '2013-04-18 10:28:15', '0000-00-00 00:00:00'),
(25, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset1.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 3, 0, '2013-04-18 10:28:17', '0000-00-00 00:00:00'),
(26, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset4.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 3, 0, '2013-04-18 10:28:17', '0000-00-00 00:00:00'),
(27, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset3.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 3, 0, '2013-04-18 10:28:18', '0000-00-00 00:00:00'),
(28, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset2.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 3, 0, '2013-04-18 10:28:18', '0000-00-00 00:00:00'),
(29, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset5.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 3, 0, '2013-04-18 10:28:18', '0000-00-00 00:00:00'),
(30, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset6.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 3, 0, '2013-04-18 10:28:18', '0000-00-00 00:00:00'),
(31, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset7.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 2, 0, '2013-04-18 10:28:20', '0000-00-00 00:00:00'),
(32, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset9.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/helper.php', '', 2, 0, '2013-04-18 10:28:21', '0000-00-00 00:00:00'),
(33, 'http://localhost/myangkorpeople/index.php/j-stuff/member-access', '', '', '', 1, 0, '2013-04-30 10:09:09', '0000-00-00 00:00:00'),
(34, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset8.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/member-access', '', 1, 0, '2013-04-30 10:09:16', '0000-00-00 00:00:00'),
(35, 'http://localhost/myangkorpeople/index.php/j-stuff/images/rocketlauncher/styles/preset10.png', '', 'http://localhost/myangkorpeople/index.php/j-stuff/member-access', '', 1, 0, '2013-04-30 10:09:16', '0000-00-00 00:00:00'),
(36, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset5.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 9, 0, '2013-05-02 03:25:46', '0000-00-00 00:00:00'),
(37, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset1.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 9, 0, '2013-05-02 03:25:46', '0000-00-00 00:00:00'),
(38, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset6.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 9, 0, '2013-05-02 03:25:46', '0000-00-00 00:00:00'),
(39, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset4.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 9, 0, '2013-05-02 03:25:48', '0000-00-00 00:00:00'),
(40, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset3.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 9, 0, '2013-05-02 03:25:49', '0000-00-00 00:00:00'),
(41, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset2.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 9, 0, '2013-05-02 03:25:49', '0000-00-00 00:00:00'),
(42, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset7.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 8, 0, '2013-05-02 03:25:50', '0000-00-00 00:00:00'),
(43, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset8.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 8, 0, '2013-05-02 03:25:50', '0000-00-00 00:00:00'),
(44, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset9.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 8, 0, '2013-05-02 03:25:51', '0000-00-00 00:00:00'),
(45, 'http://localhost/myangkorpeople/index.php/talents/images/rocketlauncher/styles/preset10.png', '', 'http://localhost/myangkorpeople/index.php/talents/musics', '', 7, 0, '2013-05-02 03:25:52', '0000-00-00 00:00:00'),
(46, 'http://localhost/myangkorpeople/index.php/component/content/?id=1&Itemid=108', '', 'http://localhost/myangkorpeople/', '', 18, 0, '2013-05-02 04:23:13', '0000-00-00 00:00:00'),
(47, 'http://localhost/myangkorpeople/', '', 'http://localhost/myangkorpeople/administrator/index.php', '', 19, 0, '2013-05-03 08:43:49', '0000-00-00 00:00:00'),
(48, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset3.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:33', '0000-00-00 00:00:00'),
(49, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset6.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:33', '0000-00-00 00:00:00'),
(50, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset2.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:33', '0000-00-00 00:00:00'),
(51, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset5.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:33', '0000-00-00 00:00:00'),
(52, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset4.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:33', '0000-00-00 00:00:00'),
(53, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset1.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:34', '0000-00-00 00:00:00'),
(54, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset7.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:36', '0000-00-00 00:00:00'),
(55, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset10.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:36', '0000-00-00 00:00:00'),
(56, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset8.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:36', '0000-00-00 00:00:00'),
(57, 'http://localhost/myangkorpeople/index.php/images/rocketlauncher/styles/preset9.png', '', 'http://localhost/myangkorpeople/index.php/about-us?view=registration', '', 1, 0, '2013-05-09 01:22:37', '0000-00-00 00:00:00'),
(58, 'http://localhost/myangkorpeople/index.php/component/content/?id=8&Itemid=115', '', 'http://localhost/myangkorpeople/index.php', '', 1, 0, '2013-05-31 08:31:51', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokcandy`
--

CREATE TABLE IF NOT EXISTS `tbl_rokcandy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `macro` text NOT NULL,
  `html` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `tbl_rokcandy`
--

INSERT INTO `tbl_rokcandy` (`id`, `catid`, `macro`, `html`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`) VALUES
(20, 8, '[h1]{text}[/h1]', '<h1>{text}</h1>', 1, 0, '0000-00-00 00:00:00', 1, ''),
(21, 8, '[h2]{text}[/h2]', '<h2>{text}</h2>', 1, 0, '0000-00-00 00:00:00', 2, ''),
(22, 8, '[h3]{text}[/h3]', '<h3>{text}</h3>', 1, 0, '0000-00-00 00:00:00', 3, ''),
(23, 8, '[h4]{text}[/h4]', '<h4>{text}</h4>', 1, 0, '0000-00-00 00:00:00', 4, ''),
(24, 8, '[h5]{text}[/h5]', '<h5>{text}</h5>', 1, 0, '0000-00-00 00:00:00', 5, ''),
(25, 8, '[b]{text}[/b]', '<strong>{text}</strong>', 1, 0, '0000-00-00 00:00:00', 6, ''),
(26, 8, '[i]{text}[/i]', '<em>{text}</em>', 1, 0, '0000-00-00 00:00:00', 7, ''),
(27, 8, '[code]{text}[/code]', '<code>{text}</code>', 1, 0, '0000-00-00 00:00:00', 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokcommon_configs`
--

CREATE TABLE IF NOT EXISTS `tbl_rokcommon_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extension` varchar(45) NOT NULL DEFAULT '',
  `type` varchar(45) NOT NULL,
  `file` varchar(256) NOT NULL,
  `priority` int(10) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_rokcommon_configs`
--

INSERT INTO `tbl_rokcommon_configs` (`id`, `extension`, `type`, `file`, `priority`) VALUES
(7, 'rokgallery', 'container', '/components/com_rokgallery/container.xml', 10),
(8, 'rokgallery', 'library', '/components/com_rokgallery/lib', 10),
(9, 'roksprocket', 'container', '/components/com_roksprocket/container.xml', 10),
(10, 'roksprocket', 'library', '/components/com_roksprocket/lib', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_files`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `guid` char(36) NOT NULL,
  `md5` char(32) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `license` varchar(255) DEFAULT NULL,
  `xsize` int(10) unsigned NOT NULL,
  `ysize` int(10) unsigned NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `type` char(20) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `guid` (`guid`),
  UNIQUE KEY `tbl_files_sluggable_idx` (`slug`),
  KEY `tbl_rokgallery_files_published_idx` (`published`),
  KEY `tbl_rokgallery_files_md5_idx` (`md5`),
  KEY `tbl_rokgallery_files_guid_idx` (`guid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tbl_rokgallery_files`
--

INSERT INTO `tbl_rokgallery_files` (`id`, `filename`, `guid`, `md5`, `title`, `description`, `license`, `xsize`, `ysize`, `filesize`, `type`, `published`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'natural-beauty_switzerland-2c.jpg', 'eeabb84f-3cf6-48b1-9f68-f57aa084d700', '0149491a05247b09857024c9dc50b823', 'natural-beauty switzerland-2c', NULL, NULL, 1024, 768, 142455, 'jpg', 1, '2013-04-09 07:44:49', '2013-04-09 07:50:13', 'natural-beauty-switzerland-2c'),
(3, '000d6065c51b0ae7637237.jpg', '45a99edc-edb0-4604-d22a-130ce36bd3bc', '74c10bf1e18c0b00265b57d9acee9097', '000d6065c51b0ae7637237', NULL, NULL, 400, 539, 49202, 'jpg', 1, '2013-04-09 07:47:10', '2013-04-09 07:47:10', '000d6065c51b0ae7637237'),
(4, 'bankable3.jpg', '68045602-8f7b-43d3-bb42-1895f32e1a45', '4b38b276d70eef06f2b87cf4046c0607', 'bankable3', NULL, NULL, 615, 420, 23440, 'jpg', 1, '2013-04-09 07:47:10', '2013-04-09 07:47:10', 'bankable3'),
(5, 'famous-graffiti-artist-blu.jpg', '54aa9ccd-7243-4007-eef4-48ce864736a7', 'cd005d59335658520d641e898bbede41', 'famous-graffiti-artist-blu', NULL, NULL, 468, 346, 107634, 'jpg', 1, '2013-04-09 07:47:11', '2013-04-09 07:47:11', 'famous-graffiti-artist-blu'),
(6, 'images.jpg', '3fef20ec-d6f4-4e4b-c887-59f2550f4663', 'aa4ed71679da2a2dca40c3951efd5a7c', 'images', NULL, NULL, 275, 183, 11222, 'jpg', 1, '2013-04-09 07:47:11', '2013-04-09 07:47:11', 'images'),
(7, 'images1.jpg', '9f0efde5-a9c9-4ceb-8d5e-5cc3f4c9068f', '9291df7220dfcd9bea3ae8b62d325a42', 'images1', NULL, NULL, 268, 188, 13901, 'jpg', 1, '2013-04-09 07:47:11', '2013-04-09 07:47:11', 'images1'),
(8, 'images2.jpg', '9368a0dd-9440-474e-86b7-b68f4540d5a3', '416e30895c1149508231055dadf5ab79', 'images2', NULL, NULL, 282, 178, 11782, 'jpg', 1, '2013-04-09 07:47:11', '2013-04-09 07:47:11', 'images2'),
(9, 'South Korean artist Kwon Sang Woo photos _6_.jpg', 'e8a68352-edee-4d2c-e01e-5e807a1cdf9c', '8549bb5a1639d0ea64cfe28224e08cee', 'Kwon Sang Woo ', '', NULL, 546, 640, 40413, 'jpg', 1, '2013-04-09 07:47:12', '2013-04-09 08:19:11', 'south-korean-artist-kwon-sang-woo-photos-6');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_files_index`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_files_index` (
  `keyword` varchar(200) NOT NULL DEFAULT '',
  `field` varchar(50) NOT NULL DEFAULT '',
  `position` bigint(20) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword`,`field`,`position`,`id`),
  KEY `tbl_rokgallery_files_index_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rokgallery_files_index`
--

INSERT INTO `tbl_rokgallery_files_index` (`keyword`, `field`, `position`, `id`) VALUES
('2c', 'title', 3, 1),
('beauty', 'title', 1, 1),
('natural', 'title', 0, 1),
('switzerland', 'title', 2, 1),
('000d6065c51b0ae7637237', 'title', 0, 3),
('bankable3', 'title', 0, 4),
('artist', 'title', 2, 5),
('blu', 'title', 3, 5),
('famous', 'title', 0, 5),
('graffiti', 'title', 1, 5),
('images', 'title', 0, 6),
('images1', 'title', 0, 7),
('images2', 'title', 0, 8),
('kwon', 'title', 0, 9),
('sang', 'title', 1, 9),
('woo', 'title', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_file_loves`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_file_loves` (
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `kount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rokgallery_file_loves`
--

INSERT INTO `tbl_rokgallery_file_loves` (`file_id`, `kount`) VALUES
(1, 5),
(4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_file_tags`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_file_tags` (
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`,`tag`),
  KEY `tbl_rokgallery_file_tags_file_id_idx` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rokgallery_file_tags`
--

INSERT INTO `tbl_rokgallery_file_tags` (`file_id`, `tag`) VALUES
(1, 'vacation'),
(3, 'front'),
(4, 'vacation'),
(5, 'front'),
(6, 'front'),
(7, 'front'),
(8, 'front'),
(9, 'front');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_file_views`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_file_views` (
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `kount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rokgallery_file_views`
--

INSERT INTO `tbl_rokgallery_file_views` (`file_id`, `kount`) VALUES
(1, 8),
(4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_filters`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `query` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `rokgallery_profiles_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_galleries`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `filetags` longtext,
  `width` int(10) unsigned NOT NULL DEFAULT '910',
  `height` int(10) unsigned NOT NULL DEFAULT '500',
  `keep_aspect` tinyint(1) DEFAULT '0',
  `force_image_size` tinyint(1) DEFAULT '0',
  `thumb_xsize` int(10) unsigned NOT NULL DEFAULT '190',
  `thumb_ysize` int(10) unsigned NOT NULL DEFAULT '150',
  `thumb_background` varchar(12) DEFAULT NULL,
  `thumb_keep_aspect` tinyint(1) DEFAULT '0',
  `auto_publish` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tbl_rokgallery_galleries_auto_publish_idx` (`auto_publish`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_rokgallery_galleries`
--

INSERT INTO `tbl_rokgallery_galleries` (`id`, `name`, `filetags`, `width`, `height`, `keep_aspect`, `force_image_size`, `thumb_xsize`, `thumb_ysize`, `thumb_background`, `thumb_keep_aspect`, `auto_publish`) VALUES
(1, 'RokGallery gallery', 'a:1:{i:0;s:5:"front";}', 1080, 500, 0, 1, 100, 75, 'transparent', 0, 1),
(2, 'vacation', 'a:1:{i:0;s:8:"vacation";}', 800, 400, 0, 1, 190, 150, 'transparent', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_jobs`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_jobs` (
  `id` char(36) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL,
  `properties` text,
  `state` varchar(255) NOT NULL,
  `status` text,
  `percent` bigint(20) unsigned DEFAULT NULL,
  `sm` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rokgallery_jobs`
--

INSERT INTO `tbl_rokgallery_jobs` (`id`, `type`, `properties`, `state`, `status`, `percent`, `sm`, `created_at`, `updated_at`) VALUES
('2b4dedb9-28e4-4210-9b92-21741868714f', 'Update Gallery', 'a:2:{s:9:"galleryId";s:1:"2";s:5:"files";a:2:{i:0;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"1";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:1;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"4";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}}}', 'Completed', 'Gallery Update Complete', 100, 'O:27:"RokGallery_Job_StateMachine":5:{s:9:"\0*\0_state";O:33:"RokGallery_Job_StateMap_Completed":2:{s:8:"\0*\0_name";s:33:"RokGallery_Job_StateMap.Completed";s:6:"\0*\0_id";i:8;}s:18:"\0*\0_previous_state";O:31:"RokGallery_Job_StateMap_Running":2:{s:8:"\0*\0_name";s:31:"RokGallery_Job_StateMap.Running";s:6:"\0*\0_id";i:2;}s:15:"\0*\0_state_stack";a:0:{}s:14:"\0*\0_transition";N;s:14:"\0*\0_debug_flag";b:0;}', '2013-04-09 09:15:46', '2013-04-09 09:15:48'),
('5faa16da-6193-4126-dc90-5650c708a15a', 'Tag Addition', 'a:2:{i:0;O:32:"RokGallery_Job_Property_FileTags":5:{s:9:"\0*\0fileId";i:1;s:7:"\0*\0tags";a:1:{i:0;s:8:"vacation";}s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:1;O:32:"RokGallery_Job_Property_FileTags":5:{s:9:"\0*\0fileId";i:4;s:7:"\0*\0tags";a:1:{i:0;s:8:"vacation";}s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}}', 'Completed', 'Tag Addition Complete', 100, 'O:27:"RokGallery_Job_StateMachine":5:{s:9:"\0*\0_state";O:33:"RokGallery_Job_StateMap_Completed":2:{s:8:"\0*\0_name";s:33:"RokGallery_Job_StateMap.Completed";s:6:"\0*\0_id";i:8;}s:18:"\0*\0_previous_state";O:31:"RokGallery_Job_StateMap_Running":2:{s:8:"\0*\0_name";s:31:"RokGallery_Job_StateMap.Running";s:6:"\0*\0_id";i:2;}s:15:"\0*\0_state_stack";a:0:{}s:14:"\0*\0_transition";N;s:14:"\0*\0_debug_flag";b:0;}', '2013-04-09 09:02:38', '2013-04-09 09:02:41'),
('69cb0341-ee0c-4e37-f1e8-1a0a6a64e685', 'Update Gallery', 'a:2:{s:9:"galleryId";s:1:"1";s:5:"files";a:6:{i:0;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"3";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:1;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"5";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:2;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"6";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:3;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"7";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:4;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"8";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:5;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"9";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}}}', 'Completed', 'Gallery Update Complete', 100, 'O:27:"RokGallery_Job_StateMachine":5:{s:9:"\0*\0_state";O:33:"RokGallery_Job_StateMap_Completed":2:{s:8:"\0*\0_name";s:33:"RokGallery_Job_StateMap.Completed";s:6:"\0*\0_id";i:8;}s:18:"\0*\0_previous_state";O:31:"RokGallery_Job_StateMap_Running":2:{s:8:"\0*\0_name";s:31:"RokGallery_Job_StateMap.Running";s:6:"\0*\0_id";i:2;}s:15:"\0*\0_state_stack";a:0:{}s:14:"\0*\0_transition";N;s:14:"\0*\0_debug_flag";b:0;}', '2013-04-10 02:52:43', '2013-04-10 02:52:45'),
('9f21cb62-2f80-4e08-bb05-a8110ba58a86', 'Update Gallery', 'a:2:{s:9:"galleryId";s:1:"2";s:5:"files";a:2:{i:0;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"1";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:1;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"4";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}}}', 'Completed', 'Gallery Update Complete', 100, 'O:27:"RokGallery_Job_StateMachine":5:{s:9:"\0*\0_state";O:33:"RokGallery_Job_StateMap_Completed":2:{s:8:"\0*\0_name";s:33:"RokGallery_Job_StateMap.Completed";s:6:"\0*\0_id";i:8;}s:18:"\0*\0_previous_state";O:31:"RokGallery_Job_StateMap_Running":2:{s:8:"\0*\0_name";s:31:"RokGallery_Job_StateMap.Running";s:6:"\0*\0_id";i:2;}s:15:"\0*\0_state_stack";a:0:{}s:14:"\0*\0_transition";N;s:14:"\0*\0_debug_flag";b:0;}', '2013-05-07 08:03:52', '2013-05-07 08:03:54'),
('fbb9551a-9bd7-4675-ee20-36eb02884153', 'Update Gallery', 'a:2:{s:9:"galleryId";s:1:"2";s:5:"files";a:2:{i:0;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"1";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}i:1;O:35:"RokGallery_Job_Property_GalleryFile":4:{s:5:"\0*\0id";s:1:"4";s:12:"\0*\0completed";b:1;s:8:"\0*\0error";b:0;s:9:"\0*\0status";N;}}}', 'Completed', 'Gallery Update Complete', 100, 'O:27:"RokGallery_Job_StateMachine":5:{s:9:"\0*\0_state";O:33:"RokGallery_Job_StateMap_Completed":2:{s:8:"\0*\0_name";s:33:"RokGallery_Job_StateMap.Completed";s:6:"\0*\0_id";i:8;}s:18:"\0*\0_previous_state";O:31:"RokGallery_Job_StateMap_Running":2:{s:8:"\0*\0_name";s:31:"RokGallery_Job_StateMap.Running";s:6:"\0*\0_id";i:2;}s:15:"\0*\0_state_stack";a:0:{}s:14:"\0*\0_transition";N;s:14:"\0*\0_debug_flag";b:0;}', '2013-05-02 06:16:58', '2013-05-02 06:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_profiles`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `profile` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tbl_rokgallery_profiles_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_schema_version`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_schema_version` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rokgallery_schema_version`
--

INSERT INTO `tbl_rokgallery_schema_version` (`version`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_slices`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_slices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `gallery_id` int(10) unsigned DEFAULT NULL,
  `guid` char(36) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `caption` text,
  `link` text,
  `filesize` int(10) unsigned NOT NULL,
  `xsize` int(10) unsigned NOT NULL,
  `ysize` int(10) unsigned NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `admin_thumb` tinyint(1) NOT NULL DEFAULT '0',
  `manipulations` longtext,
  `palette` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumb_xsize` int(10) unsigned NOT NULL,
  `thumb_ysize` int(10) unsigned NOT NULL,
  `thumb_keep_aspect` tinyint(1) NOT NULL DEFAULT '1',
  `thumb_background` varchar(12) DEFAULT NULL,
  `ordering` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `guid` (`guid`),
  UNIQUE KEY `tbl_rokgallery_slices_sluggable_idx` (`slug`,`gallery_id`),
  KEY `rokgallery_slices_published_idx` (`published`),
  KEY `rokgallery_slices_guid_idx` (`guid`),
  KEY `file_id_idx` (`file_id`),
  KEY `gallery_id_idx` (`gallery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tbl_rokgallery_slices`
--

INSERT INTO `tbl_rokgallery_slices` (`id`, `file_id`, `gallery_id`, `guid`, `title`, `caption`, `link`, `filesize`, `xsize`, `ysize`, `published`, `admin_thumb`, `manipulations`, `palette`, `created_at`, `updated_at`, `slug`, `thumb_xsize`, `thumb_ysize`, `thumb_keep_aspect`, `thumb_background`, `ordering`) VALUES
(1, 1, NULL, 'decb8b04-77ec-470a-91de-7ece2858fbbe', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 15051, 300, 180, 0, 1, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:300;s:6:"height";i:225;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:23;s:5:"width";i:300;s:6:"height";i:180;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 07:44:49', '2013-04-09 07:44:49', 'admin-thumbnail', 150, 150, 1, NULL, 8),
(3, 3, NULL, '24ac6439-ff3a-41a4-ce37-fef868ffd1d4', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 10699, 300, 180, 0, 1, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:300;s:6:"height";i:404;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:112;s:5:"width";i:300;s:6:"height";i:180;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 07:47:10', '2013-04-09 07:47:10', 'admin-thumbnail-2', 150, 150, 1, NULL, 6),
(4, 4, NULL, '7f7b4ae6-997f-40bb-e99d-4e2f5ca1e4a1', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 9153, 300, 180, 0, 1, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:300;s:6:"height";i:205;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:13;s:5:"width";i:300;s:6:"height";i:180;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 07:47:10', '2013-04-09 07:47:10', 'admin-thumbnail-3', 150, 150, 1, NULL, 5),
(5, 5, NULL, 'dbd23832-b807-4f76-80ca-75acebc3f364', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 23936, 300, 180, 0, 1, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:300;s:6:"height";i:222;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:21;s:5:"width";i:300;s:6:"height";i:180;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 07:47:11', '2013-04-09 07:47:11', 'admin-thumbnail-4', 150, 150, 1, NULL, 4),
(6, 6, NULL, 'cde8e7fa-746b-4495-d92d-f382f5137eba', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 15075, 300, 180, 0, 1, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:300;s:6:"height";i:200;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:10;s:5:"width";i:300;s:6:"height";i:180;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 07:47:11', '2013-04-09 07:47:11', 'admin-thumbnail-5', 150, 150, 1, NULL, 3),
(7, 7, NULL, 'a78bc5c3-e62d-4ef5-f7e0-d38dfad5dfcd', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 17510, 300, 180, 0, 1, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:300;s:6:"height";i:210;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:15;s:5:"width";i:300;s:6:"height";i:180;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 07:47:11', '2013-04-09 07:47:11', 'admin-thumbnail-6', 150, 150, 1, NULL, 2),
(8, 8, NULL, '3d215f39-8bc4-4197-dc9b-9d1bfd2b1863', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 15867, 282, 178, 0, 1, 'a:0:{}', NULL, '2013-04-09 07:47:12', '2013-04-09 07:47:12', 'admin-thumbnail-7', 150, 150, 1, NULL, 1),
(9, 9, NULL, '5f3de15a-1594-415f-ba5b-f2f82b9a9b5f', 'Admin Thumbnail', 'Admin Thumbnail', NULL, 8721, 300, 180, 0, 1, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:300;s:6:"height";i:352;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:86;s:5:"width";i:300;s:6:"height";i:180;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 07:47:12', '2013-04-09 07:47:12', 'admin-thumbnail-8', 150, 150, 1, NULL, 0),
(10, 9, 1, 'bf3231a6-fd33-43b3-d6f8-b342b9bbe4cd', 'Kwon Sang Woo ', '', '{"type":"manual","link":""}', 48012, 1080, 500, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";i:1080;s:6:"height";i:1266;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:272;s:5:"width";i:1080;s:6:"height";i:500;s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 08:05:44', '2013-04-09 08:19:11', 'south-korean-artist-kwon-sang-woo-photos-6', 100, 75, 0, 'transparent', 5),
(11, 5, 1, '0f7db4b8-7a7a-498b-d068-d320474a0ffc', 'famous-graffiti-artist-blu', NULL, NULL, 155294, 1080, 500, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";s:4:"1080";s:6:"height";i:798;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:149;s:5:"width";s:4:"1080";s:6:"height";s:3:"500";s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 08:05:45', '2013-04-09 08:09:07', 'famous-graffiti-artist-blu', 100, 75, 0, 'transparent', 4),
(12, 6, 1, 'a7353ab2-e8e0-4588-80b1-e4dec1187fdd', 'images', NULL, NULL, 87202, 1080, 500, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";s:4:"1080";s:6:"height";i:719;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:110;s:5:"width";s:4:"1080";s:6:"height";s:3:"500";s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 08:05:46', '2013-04-09 08:09:08', 'images', 100, 75, 0, 'transparent', 3),
(13, 7, 1, '2949dfaf-39ac-4be4-e55f-a2a21c42cd83', 'images1', NULL, NULL, 101499, 1080, 500, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";s:4:"1080";s:6:"height";i:758;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:129;s:5:"width";s:4:"1080";s:6:"height";s:3:"500";s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 08:05:47', '2013-04-09 08:09:09', 'images1', 100, 75, 0, 'transparent', 2),
(14, 8, 1, '068ddee2-30ba-4a0f-a582-454bc0cc91f9', 'images2', NULL, NULL, 94093, 1080, 500, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";s:4:"1080";s:6:"height";i:682;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:91;s:5:"width";s:4:"1080";s:6:"height";s:3:"500";s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 08:05:47', '2013-04-09 08:09:10', 'images2', 100, 75, 0, 'transparent', 1),
(15, 3, 1, 'f0c556f3-5ad9-4400-a23e-5f6610ae9760', 'cnpisit', NULL, '{"type":"manual","link":""}', 56977, 1080, 500, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";s:4:"1080";s:6:"height";i:1455;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:478;s:5:"width";s:4:"1080";s:6:"height";s:3:"500";s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 08:05:48', '2013-04-10 02:52:45', 'cnpisit', 100, 75, 0, 'transparent', 0),
(16, 1, 2, '3b3ff0a2-4c5f-48e8-f5ae-0c7b0e057162', 'natural-beauty switzerland-2c', NULL, NULL, 63283, 800, 400, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";s:3:"800";s:6:"height";i:600;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:100;s:5:"width";s:3:"800";s:6:"height";s:3:"400";s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 09:02:40', '2013-05-07 08:03:53', 'natural-beauty-switzerland-2c', 190, 150, 1, 'transparent', 1),
(17, 4, 2, 'f51c0a40-edd7-46c2-8a22-2638ba4a0dee', 'bankable3', NULL, NULL, 30874, 800, 400, 1, 0, 'a:2:{i:0;O:37:"RokGallery_Manipulation_Action_Resize":4:{s:7:"\0*\0type";s:6:"resize";s:5:"width";s:3:"800";s:6:"height";i:546;s:8:"\0*\0setup";b:1;}i:1;O:35:"RokGallery_Manipulation_Action_Crop":6:{s:7:"\0*\0type";s:4:"crop";s:4:"left";i:0;s:3:"top";i:73;s:5:"width";s:3:"800";s:6:"height";s:3:"400";s:8:"\0*\0setup";b:1;}}', NULL, '2013-04-09 09:02:41', '2013-05-07 08:03:53', 'bankable3', 190, 150, 1, 'transparent', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_slices_index`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_slices_index` (
  `keyword` varchar(200) NOT NULL DEFAULT '',
  `field` varchar(50) NOT NULL DEFAULT '',
  `position` bigint(20) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword`,`field`,`position`,`id`),
  KEY `rokgallery_slices_index_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rokgallery_slices_index`
--

INSERT INTO `tbl_rokgallery_slices_index` (`keyword`, `field`, `position`, `id`) VALUES
('admin', 'caption', 0, 1),
('admin', 'title', 0, 1),
('thumbnail', 'caption', 1, 1),
('thumbnail', 'title', 1, 1),
('admin', 'caption', 0, 3),
('admin', 'title', 0, 3),
('thumbnail', 'caption', 1, 3),
('thumbnail', 'title', 1, 3),
('admin', 'caption', 0, 4),
('admin', 'title', 0, 4),
('thumbnail', 'caption', 1, 4),
('thumbnail', 'title', 1, 4),
('admin', 'caption', 0, 5),
('admin', 'title', 0, 5),
('thumbnail', 'caption', 1, 5),
('thumbnail', 'title', 1, 5),
('admin', 'caption', 0, 6),
('admin', 'title', 0, 6),
('thumbnail', 'caption', 1, 6),
('thumbnail', 'title', 1, 6),
('admin', 'caption', 0, 7),
('admin', 'title', 0, 7),
('thumbnail', 'caption', 1, 7),
('thumbnail', 'title', 1, 7),
('admin', 'caption', 0, 8),
('admin', 'title', 0, 8),
('thumbnail', 'caption', 1, 8),
('thumbnail', 'title', 1, 8),
('admin', 'caption', 0, 9),
('admin', 'title', 0, 9),
('thumbnail', 'caption', 1, 9),
('thumbnail', 'title', 1, 9),
('kwon', 'title', 0, 10),
('sang', 'title', 1, 10),
('woo', 'title', 2, 10),
('artist', 'title', 2, 11),
('blu', 'title', 3, 11),
('famous', 'title', 0, 11),
('graffiti', 'title', 1, 11),
('images', 'title', 0, 12),
('images1', 'title', 0, 13),
('images2', 'title', 0, 14),
('cnpisit', 'title', 0, 15),
('2c', 'title', 3, 16),
('beauty', 'title', 1, 16),
('natural', 'title', 0, 16),
('switzerland', 'title', 2, 16),
('bankable3', 'title', 0, 17);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rokgallery_slice_tags`
--

CREATE TABLE IF NOT EXISTS `tbl_rokgallery_slice_tags` (
  `slice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`slice_id`,`tag`),
  KEY `rokgallery_slice_tags_slice_id_idx` (`slice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roksprocket_items`
--

CREATE TABLE IF NOT EXISTS `tbl_roksprocket_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(45) NOT NULL,
  `provider` varchar(45) NOT NULL,
  `provider_id` varchar(45) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module_id`),
  KEY `idx_module_order` (`module_id`,`order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=769 ;

--
-- Dumping data for table `tbl_roksprocket_items`
--

INSERT INTO `tbl_roksprocket_items` (`id`, `module_id`, `provider`, `provider_id`, `order`, `params`) VALUES
(424, '160', 'joomla', '36', 0, '{"lists_item_title":"<span class=''hidden-tablet''>How to Install the Template<\\/span><span class=''visible-tablet''>Installation<\\/span>","lists_item_image":"-default-","lists_item_link":"-default-","lists_item_description":"-default-","mosaic_item_title":"-default-","tabs_item_title":"-default-","mosaic_item_description":"-default-","tabs_item_icon":"-default-","mosaic_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","mosaic_item_link":"-default-","mosaic_item_tags":null,"features_item_title":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(425, '160', 'joomla', '37', 1, '{"lists_item_title":"<span class=''hidden-tablet''>Editing the Logo Source<\\/span><span class=''visible-tablet''>Logo Editing<\\/span>","lists_item_image":"-default-","lists_item_link":"-default-","lists_item_description":"-default-","mosaic_item_title":"-default-","tabs_item_title":"-default-","mosaic_item_description":"-default-","tabs_item_icon":"-default-","mosaic_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","mosaic_item_link":"-default-","mosaic_item_tags":null,"features_item_title":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(426, '160', 'joomla', '38', 2, '{"lists_item_title":"<span class=''hidden-tablet''>Easy Demo Replication<\\/span><span class=''visible-tablet''>Demo Copy<\\/span>","lists_item_image":"-default-","lists_item_link":"-default-","lists_item_description":"-default-","mosaic_item_title":"-default-","tabs_item_title":"-default-","mosaic_item_description":"-default-","tabs_item_icon":"-default-","mosaic_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","mosaic_item_link":"-default-","mosaic_item_tags":null,"features_item_title":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(472, '159', 'joomla', '32', 0, '{"tabs_item_title":"-title-","tabs_item_icon":"{''type'':''rokgallery'',''path'':''media\\/rokgallery\\/e\\/e8a68352-edee-4d2c-e01e-5e807a1cdf9c\\/bf3231a6-fd33-43b3-d6f8-b342b9bbe4cd.jpg'',''width'':''1080'',''height'':''500'',''preview'':''\\/myangkorpeople\\/media\\/rokgallery\\/e\\/e8a68352-edee-4d2c-e01e-5e807a1cdf9c\\/bf3231a6-fd33-43b3-d6f8-b342b9bbe4cd-mini-admin-thumb.jpg'',''link'':''index.php?option=com_rokgallery&view=gallerypicker&tmpl=component&show_menuitems=0&inputfield=items_joomla_32__params_tabs_item_icon''}","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(473, '159', 'joomla', '35', 1, '{"tabs_item_title":"<span class=''hidden-tablet''>Random<\\/span><span class=''visible-tablet''>More<\\/span>","tabs_item_icon":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(474, '159', 'joomla', '34', 2, '{"tabs_item_title":"<span class=''hidden-tablet''>Latest<\\/span><span class=''visible-tablet''>New<\\/span>","tabs_item_icon":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(475, '159', 'joomla', '33', 3, '{"tabs_item_title":"<span class=''hidden-tablet''>Popular<\\/span><span class=''visible-tablet''>Top<\\/span>","tabs_item_icon":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(572, '158', 'joomla', '20', 0, '{"mosaic_item_title":"test","mosaic_item_description":"just for test","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/images.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_20__params_mosaic_item_image''}","mosaic_item_link":"http:\\/\\/localhost\\/myangkorpeople\\/index.php\\/talents","mosaic_item_tags":"drama, horror","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(573, '158', 'joomla', '21', 1, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img2.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_21__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"horror, action","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(574, '158', 'joomla', '22', 2, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img3.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_22__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"action, drama","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(575, '158', 'joomla', '23', 3, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img4.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_23__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"drama, horror, Default","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(576, '158', 'joomla', '25', 4, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img6.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_25__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"action, drama","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(577, '158', 'joomla', '24', 5, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img5.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_24__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"horror, action","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(578, '158', 'joomla', '26', 6, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img7.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_26__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"drama, horror","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(579, '158', 'joomla', '27', 7, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img8.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_27__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"horror, action","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(580, '158', 'joomla', '28', 8, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img9.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_28__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"action, drama","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(581, '158', 'joomla', '29', 9, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img10.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_29__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"drama, horror","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(582, '158', 'joomla', '30', 10, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img11.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_30__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"horror, action","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(583, '158', 'joomla', '31', 11, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img12.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_31__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"action, drama","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(732, '157', 'joomla', '6', 0, '{"features_item_title":"<span>Integrated<\\/span><br \\/><span>Extensions.<\\/span>","features_item_description":"<span class=''hidden-tablet''>There are a series of extensions with template specific styling, inclusive of both RocketTheme addons and K2, a third party CCK extension.<\\/span><span class=''visible-tablet''>There are several  extensions with template specific styling, inclusive of RocketTheme addons and K2.<\\/span><span class=''visible-large largemargintop medmarginbottom''>Such extensions include RokSprocket, with all its layout modes; RokAjaxSearch, RokGallery and K2.<\\/span>","features_item_image":"{''type'':''mediamanager'',''path'':''images\\/574895_362085077174210_1025193204_n.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_6__params_features_item_image&undefined&undefined''}","features_item_link":"-default-","tabs_item_title":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","tabs_item_icon":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"lists_item_description":"-default-","headlines_item_image":"-default-","headlines_item_link":"-default-","headlines_item_description":"-default-"}'),
(733, '157', 'joomla', '1', 1, '{"features_item_title":"<span>Gantry 4<\\/span><br \\/><span>Template.<\\/span>","features_item_description":"<span class=''hidden-tablet''>Built on the Gantry 4 Framework, Metropolis features a Responsive Layout, meaning it automatically adapts to the viewing device.<\\/span><span class=''visible-tablet''>Gantry 4 features a responsive layout, that adapts automatically to the viewing device.<\\/span><span class=''visible-large largemargintop medmarginbottom''>There are five responsive modes: small or large phone, tablet, desktop and large display.<\\/span>","features_item_image":"{''type'':''mediamanager'',''path'':''images\\/image\\/Musician-1200x1920.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_1__params_features_item_image&undefined&undefined''}","features_item_link":"-default-","tabs_item_title":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","tabs_item_icon":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"lists_item_description":"-default-","headlines_item_image":"-default-","headlines_item_link":"-default-","headlines_item_description":"-default-"}'),
(734, '157', 'joomla', '4', 2, '{"features_item_title":"<span>Rich Set of<\\/span><br \\/><span>Typography.<\\/span>","features_item_description":"<span class=''hidden-tablet''>The template sports a wide selection of custom typography, based on Twitter''s bootstrap providing consistent and rich web elements.<\\/span> <span class=''visible-tablet''>The base set has been modified to be stylistically integrated into the template.<\\/span> <span class=''visible-large largemargintop medmarginbottom''>The base set has been modified to be stylistically integrated into Metropolis.<\\/span>","features_item_image":"{''type'':''mediamanager'',''path'':''images\\/image\\/khan-actor.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_4__params_features_item_image&undefined&undefined''}","features_item_link":"-default-","tabs_item_title":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","tabs_item_icon":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"lists_item_description":"-default-","headlines_item_image":"-default-","headlines_item_link":"-default-","headlines_item_description":"-default-"}'),
(735, '157', 'joomla', '10', 3, '{"features_item_title":"<span>Multiple<\\/span><br \\/><span>Variations.<\\/span>","features_item_description":"<span class=''hidden-tablet''>There are eight preset style variations with Metropolis, offering an array of possibilities for easy setup and configuration.<\\/span> <span class=''visible-tablet''>There are eight preset style variations with Metropolis, offering an array of possibilities.<\\/span> <span class=''visible-large largemargintop medmarginbottom''>Module suffixes are split into stylistic and layout types, changing either appearance or structure.<\\/span>","features_item_image":"{''type'':''mediamanager'',''path'':''images\\/image\\/images.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_10__params_features_item_image&undefined&undefined''}","features_item_link":"-default-","tabs_item_title":"-default-","lists_item_title":"-default-","mosaic_item_title":"-default-","tabs_item_icon":"-default-","mosaic_item_description":"-default-","lists_item_image":"-default-","mosaic_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","mosaic_item_link":"-default-","lists_item_link":"-default-","mosaic_item_tags":null,"lists_item_description":"-default-","headlines_item_image":"-default-","headlines_item_link":"-default-","headlines_item_description":"-default-"}'),
(758, '203', 'joomla', '20', 0, '{"mosaic_item_title":"-title-","mosaic_item_description":"-article-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/image\\/Musician-1200x1920.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_20__params_mosaic_item_image''}","mosaic_item_link":"http:\\/\\/localhost\\/myangkorpeople\\/index.php\\/talents\\/musics","mosaic_item_tags":"drama, horror","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(759, '203', 'joomla', '22', 1, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/574895_362085077174210_1025193204_n.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_22__params_mosaic_item_image''}","mosaic_item_link":"http:\\/\\/localhost\\/myangkorpeople\\/index.php\\/talents\\/dancer","mosaic_item_tags":"action, drama","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(760, '203', 'joomla', '23', 2, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/image\\/khan-actor.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_23__params_mosaic_item_image''}","mosaic_item_link":"http:\\/\\/localhost\\/myangkorpeople\\/index.php\\/talents\\/video\\n","mosaic_item_tags":"drama, horror, Default","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(761, '203', 'joomla', '25', 3, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img6.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_25__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"action, drama","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(762, '203', 'joomla', '24', 4, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img5.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_24__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"horror, action","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(763, '203', 'joomla', '26', 5, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img7.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_26__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"drama, horror","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(764, '203', 'joomla', '27', 6, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img8.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_27__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"horror, action","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(765, '203', 'joomla', '28', 7, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img9.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_28__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"action, drama","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(766, '203', 'joomla', '29', 8, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img10.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_29__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"drama, horror","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(767, '203', 'joomla', '30', 9, '{"mosaic_item_title":"-default-","mosaic_item_description":"-default-","mosaic_item_image":"{''type'':''mediamanager'',''path'':''images\\/rocketlauncher\\/frontpage\\/roksprocket-mosaic\\/img11.jpg'',''preview'':'''',''link'':''index.php?option=com_media&view=images&layout=default&tmpl=component&e_name=items_joomla_30__params_mosaic_item_image''}","mosaic_item_link":"-default-","mosaic_item_tags":"horror, action","tabs_item_title":"-default-","lists_item_title":"-default-","tabs_item_icon":"-default-","lists_item_image":"-default-","tabs_item_link":"-default-","tabs_item_description":"-default-","lists_item_link":"-default-","features_item_title":"-default-","lists_item_description":"-default-","headlines_item_image":"-default-","features_item_description":"-default-","headlines_item_link":"-default-","features_item_image":"-default-","headlines_item_description":"-default-","features_item_link":"-default-"}'),
(768, '203', 'joomla', '31', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schemas`
--

CREATE TABLE IF NOT EXISTS `tbl_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_schemas`
--

INSERT INTO `tbl_schemas` (`extension_id`, `version_id`) VALUES
(700, '2.5.9');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_screenuser_talents`
--

CREATE TABLE IF NOT EXISTS `tbl_screenuser_talents` (
  `st_id` int(100) unsigned NOT NULL,
  `sur_id` int(100) unsigned NOT NULL,
  `tal_id` int(100) unsigned NOT NULL,
  KEY `sur_id` (`sur_id`),
  KEY `tal_id` (`tal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_screen_user`
--

CREATE TABLE IF NOT EXISTS `tbl_screen_user` (
  `sur_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `sur_name` varchar(100) DEFAULT NULL,
  `sur_function` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_screen_users`
--

CREATE TABLE IF NOT EXISTS `tbl_screen_users` (
  `sur_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `sur_function` varchar(100) DEFAULT NULL,
  `sur_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_session`
--

CREATE TABLE IF NOT EXISTS `tbl_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_session`
--

INSERT INTO `tbl_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('i7g2vau7l03bu2tur7d6o7u7a2', 0, 1, '1370489893', '__default|a:8:{s:15:"session.counter";i:14;s:19:"session.timer.start";i:1370483314;s:18:"session.timer.last";i:1370489882;s:17:"session.timer.now";i:1370489891;s:22:"session.client.browser";s:65:"Mozilla/5.0 (Windows NT 6.2; rv:21.0) Gecko/20100101 Firefox/21.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"f5a87c0c273adfd7fb9d7a24140f568b";}__com_rokgallery.site|a:6:{s:10:"gallery_id";s:1:"2";s:7:"sort_by";s:16:"gallery_ordering";s:14:"sort_direction";s:3:"ASC";s:6:"layout";s:9:"grid-4col";s:9:"last_page";i:1;s:14:"items_per_page";i:16;}rokgallery|a:1:{s:4:"data";O:8:"stdClass":0:{}}com_rokgallery|a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"site";O:8:"stdClass":1:{s:5:"views";O:8:"stdClass":2:{s:6:"file_4";b:1;s:6:"file_1";b:1;}}}}', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_show_art`
--

CREATE TABLE IF NOT EXISTS `tbl_show_art` (
  `show_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `show_name` varchar(200) NOT NULL,
  `show_category` varchar(200) NOT NULL,
  `show_startdate` date DEFAULT NULL,
  `show_enddate` date DEFAULT NULL,
  `show_createdate` date DEFAULT NULL,
  `show_modifiydate` date DEFAULT NULL,
  `gal_id` int(100) unsigned NOT NULL,
  `sur_id` int(100) unsigned NOT NULL,
  PRIMARY KEY (`show_id`),
  KEY `gal_id` (`gal_id`),
  KEY `sur_id` (`sur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_network`
--

CREATE TABLE IF NOT EXISTS `tbl_social_network` (
  `sn_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `sn_name` varchar(100) NOT NULL,
  `sn_login` varchar(100) NOT NULL,
  `sn_password` varchar(100) NOT NULL,
  `sur_id` int(100) unsigned NOT NULL,
  PRIMARY KEY (`sn_id`),
  KEY `sur_id` (`sur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_talents`
--

CREATE TABLE IF NOT EXISTS `tbl_talents` (
  `tal_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `tal_name` varchar(100) NOT NULL,
  `tal_desc` varchar(100) NOT NULL,
  `tal_quote` char(1) NOT NULL,
  PRIMARY KEY (`tal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_template_styles`
--

CREATE TABLE IF NOT EXISTS `tbl_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_template_styles`
--

INSERT INTO `tbl_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","html5":"0"}'),
(7, 'rt_metropolis', 0, '1', 'rt_metropolis - Default', '{"master":"true","current_id":"7","template_full_name":"Metropolis","grid_system":"12","template_prefix":"metropolis-","cookie_time":"31536000","name":"Preset1","copy_lang_files_if_diff":"1","logo":{"enabled":"1","position":"header-a","type":"metropolis","custom":{"image":""}},"main":{"accent":"#7d66e3","overlay":"light","bg":"wood"},"headerpanel":{"overlay":"dark"},"showcasepanel":{"overlay":"dark"},"body":{"overlay":"dark"},"bottompanel":{"overlay":"dark"},"footerpanel":{"overlay":"dark"},"blocks":{"default":"#baa07b","box1":"#e1563f","box2":"#23b1bf","box3":"#ad4455","box4":"#336598","default-overlay":"light"},"font":{"family":"s:metropolis","size":"default","size-is":"small"},"viewswitcher-priority":"1","logo-priority":"2","copyright-priority":"3","styledeclaration-priority":"4","fontsizer-priority":"5","date-priority":"7","totop-priority":"8","systemmessages-priority":"9","morearticles-priority":"12","smartload-priority":"13","pagesuffix-priority":"14","resetsettings-priority":"15","analytics-priority":"16","fusionmenu-priority":"18","jstools-priority":"21","moduleoverlays-priority":"22","rtl-priority":"23","splitmenu-priority":"24","webfonts-priority":"27","styledeclaration-enabled":"1","social":{"enabled":"1","position":"copyright-c","twitter":"https:\\/\\/twitter.com\\/rockettheme","facebook":"http:\\/\\/www.facebook.com\\/RocketTheme","google":"https:\\/\\/plus.google.com\\/114430407008695950828\\/posts","rss":"http:\\/\\/www.rockettheme.com\\/blog?format=feed&type=rss"},"date":{"enabled":"0","position":"top-d","clientside":"0","formats":"%A, %B %d, %Y"},"fontsizer":{"enabled":"0","position":"feature-b"},"login":{"enabled":"0","position":"utility-c","text":"Member Login","logouttext":"Logout"},"popup":{"enabled":"0","position":"utility-d","text":"Popup Module","width":"250","height":"235"},"sidepanel":{"enabled":"0","width":"250","position":"auxiliary"},"branding":{"enabled":"0","position":"copyright-a"},"copyright":{"enabled":"0","position":"copyright-a","text":"Designed by RocketTheme","layout":"3,3,3,3","showall":"0","showmax":"6"},"totop":{"enabled":"1","position":"copyright-c","text":"Top"},"systemmessages":{"enabled":"1","position":"drawer"},"resetsettings":{"enabled":"0","position":"copyright-d","text":"Reset Settings"},"analytics":{"enabled":"0","code":"","position":"analytics"},"menu":{"enabled":"1","type":"dropdownmenu","dropdownmenu":{"theme":"gantry-dropdown","limit_levels":"0","startLevel":"0","showAllChildren":"1","class_sfx":"top","cache":"0","menutype":"mainmenu","position":"header-b","responsive-menu":"panel","enable-current-id":"0","module_cache":"1"},"splitmenu":{"mainmenu-limit_levels":"1","mainmenu-startLevel":"0","mainmenu-endLevel":"0","mainmenu-class_sfx":"top","submenu-limit_levels":"1","submenu-startLevel":"1","submenu-endLevel":"9","cache":"0","menutype":"mainmenu","theme":"gantry-splitmenu","mainmenu-position":"header-b","submenu-position":"sidebar-a","submenu-title":"1","submenu-class_sfx":"","submenu-module_sfx":"box4 icon-th-list","responsive-menu":"panel","roknavmenu_dropdown_enable-current-id":"0","module_cache":"1"}},"top":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"header":{"layout":"a:1:{i:12;a:1:{i:2;a:2:{i:0;i:3;i:1;i:9;}}}","showall":"0","showmax":"6"},"showcase":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"feature":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"utility":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"maintop":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"mainbodyPosition":"a:1:{i:12;a:2:{i:3;a:3:{s:2:\\"mb\\";i:6;s:2:\\"sa\\";i:3;s:2:\\"sb\\";i:3;}i:2;a:2:{s:2:\\"mb\\";i:8;s:2:\\"sa\\";i:4;}}}","mainbottom":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"extension":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"bottom":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"footer":{"layout":"3,3,3,3","showall":"0","showmax":"6"},"layout-mode":"responsive","loadtransition":"0","component-enabled":"0","mainbody-enabled":"1","rtl-enabled":"1","pagesuffix-enabled":"0","selectivizr-enabled":"0","less":{"compression":"1","compilewait":"2","debugheader":"0"},"k2":"0","ie7splash-enabled":"1"}'),
(8, 'rt_metropolis', 0, '0', 'rt_metropolis - Module Positions', '{"master":"7","current_id":"8","main":{"accent":"#F0C12F","bg":"wood"},"blocks":{"default":"#928277","box1":"#C45F47","box2":"#F4C432","box3":"#8A8E2D","box4":"#DB8129"},"fusionmenu-priority":"18","social":{"rss":"http:\\/\\/www.rockettheme.com\\/blog?format=feed&amp;type=rss"},"mainbodyPosition":"a:1:{i:12;a:2:{i:3;a:3:{s:2:\\"mb\\";i:6;s:2:\\"sa\\";i:3;s:2:\\"sb\\";i:3;}i:2;a:2:{s:2:\\"mb\\";i:6;s:2:\\"sa\\";i:6;}}}"}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_updates`
--

CREATE TABLE IF NOT EXISTS `tbl_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=518 ;

--
-- Dumping data for table `tbl_updates`
--

INSERT INTO `tbl_updates` (`update_id`, `update_site_id`, `extension_id`, `categoryid`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 3, 0, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hy-AM_details.xml', ''),
(2, 3, 0, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/id-ID_details.xml', ''),
(3, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.9.2', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(4, 3, 0, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/km-KH_details.xml', ''),
(5, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(6, 3, 0, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hu-HU_details.xml', ''),
(7, 3, 0, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/bg-BG_details.xml', ''),
(8, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(9, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(10, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(11, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(12, 3, 0, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/tr-TR_details.xml', ''),
(13, 3, 0, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/uk-UA_details.xml', ''),
(14, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(15, 3, 0, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/be-BY_details.xml', ''),
(16, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(17, 3, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(18, 3, 0, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '2.5.5.3', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', ''),
(19, 3, 0, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '2.5.5.3', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', ''),
(20, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(21, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(22, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(23, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(24, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(25, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(26, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(27, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(28, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(29, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(30, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(31, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(32, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.2', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(33, 3, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.9.2', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(34, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(35, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(36, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(37, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(38, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(39, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(40, 3, 0, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/lt-LT_details.xml', ''),
(41, 3, 0, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/lt-LT_details.xml', ''),
(42, 3, 0, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '2.5.1.5', '', 'http://update.joomla.org/language/details/sq-AL_details.xml', ''),
(43, 3, 0, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '2.5.1.5', '', 'http://update.joomla.org/language/details/sq-AL_details.xml', ''),
(44, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(45, 3, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(46, 3, 0, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '2.5.7.4', '', 'http://update.joomla.org/language/details/gl-ES_details.xml', ''),
(47, 3, 0, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '2.5.7.4', '', 'http://update.joomla.org/language/details/gl-ES_details.xml', ''),
(48, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(49, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(50, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(51, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(52, 3, 0, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-PT_details.xml', ''),
(53, 3, 0, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-PT_details.xml', ''),
(54, 3, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.8.4', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(55, 3, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.8.4', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(56, 3, 0, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/he-IL_details.xml', ''),
(57, 3, 0, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/he-IL_details.xml', ''),
(58, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(59, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(60, 3, 0, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/lo-LA_details.xml', ''),
(61, 3, 0, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/lo-LA_details.xml', ''),
(62, 3, 0, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', ''),
(63, 3, 0, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', ''),
(64, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(65, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(66, 3, 0, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/el-GR_details.xml', ''),
(67, 3, 0, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/el-GR_details.xml', ''),
(68, 3, 0, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/eo-XX_details.xml', ''),
(69, 3, 0, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/eo-XX_details.xml', ''),
(70, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(71, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(72, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(73, 3, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(74, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(75, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(76, 3, 0, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/vi-VN_details.xml', ''),
(77, 3, 0, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/vi-VN_details.xml', ''),
(78, 3, 0, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ckb-IQ_details.xml', ''),
(79, 3, 0, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ckb-IQ_details.xml', ''),
(80, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(81, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(82, 3, 0, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/hr-HR_details.xml', ''),
(83, 3, 0, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/hr-HR_details.xml', ''),
(84, 3, 0, 0, 'Azeri', '', 'pkg_az-AZ', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/az-AZ_details.xml', ''),
(85, 3, 0, 0, 'Azeri', '', 'pkg_az-AZ', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/az-AZ_details.xml', ''),
(86, 3, 0, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nn-NO_details.xml', ''),
(87, 3, 0, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nn-NO_details.xml', ''),
(88, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(89, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(90, 3, 0, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/gd-GB_details.xml', ''),
(91, 3, 0, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/gd-GB_details.xml', ''),
(92, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(93, 3, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(94, 3, 0, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '1.7.0.1', '', 'http://update.joomla.org/language/details/eu-ES_details.xml', ''),
(95, 3, 0, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '1.7.0.1', '', 'http://update.joomla.org/language/details/eu-ES_details.xml', ''),
(96, 3, 0, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ug-CN_details.xml', ''),
(97, 3, 0, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ug-CN_details.xml', ''),
(98, 3, 0, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ko-KR_details.xml', ''),
(99, 3, 0, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ko-KR_details.xml', ''),
(100, 3, 0, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/hi-IN_details.xml', ''),
(101, 3, 0, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/hi-IN_details.xml', ''),
(102, 3, 0, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/cy-GB_details.xml', ''),
(103, 3, 0, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/cy-GB_details.xml', ''),
(104, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(105, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(112, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(113, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(114, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(115, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(116, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(117, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(118, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(119, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(120, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(121, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(122, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(123, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(124, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(125, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(126, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(127, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(128, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(129, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(130, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(131, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(132, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(133, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(134, 1, 700, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.10', '', 'http://update.joomla.org/core/extension.xml', ''),
(135, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(136, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(137, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(138, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(139, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(140, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(141, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(142, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(143, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(144, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(145, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(146, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(147, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(148, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(149, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(150, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(151, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(152, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(153, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(154, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(155, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(156, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(157, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(158, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(159, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(160, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(161, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(162, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(163, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(164, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(165, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(166, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(167, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(168, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(169, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(170, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(171, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(172, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(173, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(174, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(175, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(176, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(177, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(178, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(179, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(180, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(181, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(182, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(183, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(184, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(185, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(186, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(187, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(188, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(189, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(190, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(191, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(192, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(193, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(194, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(195, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(196, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(197, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(198, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(199, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(200, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(201, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(202, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(203, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(204, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(205, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(206, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(207, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(208, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(209, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(210, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(211, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(212, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(213, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(214, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(215, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(216, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(217, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(218, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(219, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(220, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(221, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(222, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(223, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(224, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(225, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(226, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(227, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(228, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(229, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(230, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(231, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(232, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(233, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(234, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(235, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(236, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(237, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(238, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(239, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(240, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(241, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(242, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(243, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(244, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(245, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(246, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(247, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(248, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(249, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(250, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(251, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(252, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(253, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(254, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(255, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(256, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(257, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(258, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(259, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(260, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(261, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(262, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(263, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(264, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(265, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(266, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(267, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(268, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(269, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(270, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(271, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(272, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(273, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(274, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(275, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(276, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(277, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(278, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(279, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(280, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(281, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(282, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(283, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(284, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(285, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(286, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(287, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(288, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(289, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(290, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(291, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(292, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(293, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(294, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(295, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(296, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(297, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(298, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(299, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(300, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(301, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(302, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(303, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(304, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(305, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(306, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(307, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(308, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(309, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(310, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(311, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(312, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(313, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(314, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(315, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(316, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(317, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(318, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(319, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(320, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(321, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(322, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(323, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(324, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(325, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(326, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(327, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(328, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(329, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(330, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(331, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(332, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(333, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(334, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(335, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(336, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(337, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(338, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(339, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(340, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(341, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(342, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(343, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(344, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(345, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(346, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(347, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(348, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(349, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(350, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(351, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(352, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', '');
INSERT INTO `tbl_updates` (`update_id`, `update_site_id`, `extension_id`, `categoryid`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(353, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(354, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(355, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(356, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(357, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(358, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(359, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(360, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(361, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(362, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(363, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(364, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(365, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(366, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(367, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(368, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(369, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(370, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(371, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(372, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(373, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(374, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(375, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(376, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(377, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(378, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(379, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(380, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(381, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(382, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(383, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(384, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(385, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(386, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(387, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(388, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(389, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(390, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(391, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(392, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(393, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(394, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(395, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(396, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(397, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(398, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(399, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(400, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(401, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(402, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(403, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(404, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(405, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(406, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(407, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(408, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(409, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(410, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(411, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(412, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(413, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(414, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(415, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(416, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(417, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(418, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(419, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(420, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(421, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(422, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(423, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(424, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(425, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(426, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(427, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(428, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(429, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(430, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(431, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(432, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(433, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(434, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(435, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(436, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(437, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(438, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(439, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(440, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(441, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(442, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(443, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(444, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(445, 3, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(446, 3, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(447, 3, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(448, 3, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(449, 3, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(450, 3, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(451, 3, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(452, 3, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(453, 3, 0, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', ''),
(454, 3, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(455, 3, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(456, 3, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(457, 3, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(458, 3, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(459, 3, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(460, 3, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(461, 3, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(462, 3, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(463, 3, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(464, 3, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(465, 3, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(466, 3, 0, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', ''),
(467, 3, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(468, 3, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(469, 3, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(470, 3, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(471, 3, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(472, 3, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(473, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(474, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(475, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(476, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(477, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(478, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(479, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(480, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(481, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(482, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(483, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(484, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(485, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(486, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(487, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(488, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(489, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(490, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(491, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(492, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(493, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(494, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(495, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(496, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(497, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(498, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(499, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(500, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(501, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(502, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(503, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(504, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(505, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(506, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(507, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(508, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(509, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(510, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(511, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(512, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(513, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(514, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(515, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(516, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', ''),
(517, 1, 0, 0, 'Joomla', '', 'joomla', 'file', '', 0, '2.5.11', '', 'http://update.joomla.org/core/extension.xml', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_update_categories`
--

CREATE TABLE IF NOT EXISTS `tbl_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_update_sites`
--

CREATE TABLE IF NOT EXISTS `tbl_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tbl_update_sites`
--

INSERT INTO `tbl_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1370406908),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 0, 1365556361),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', 0, 1367457070),
(5, 'RocketTheme Update Directory', 'collection', 'http://updates.rockettheme.com/joomla/updates.xml', 0, 1365556392),
(9, 'RocketTheme Update Directory', 'collection', '\n            http://updates.rockettheme.com/joomla/updates.xml\n        ', 0, 1365468520),
(10, 'K2 Updates', 'extension', 'http://getk2.org/update.xml', 0, 1365643585),
(11, 'Gantry Framework Update Site', 'extension', 'http://www.gantry-framework.org/updates/joomla16/gantry.xml', 0, 1367570494),
(12, 'Unknown Site', 'extension', '\n		\n		\n		\n	', 0, 1368088624);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `tbl_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_update_sites_extensions`
--

INSERT INTO `tbl_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(5, 10006),
(5, 10008),
(5, 10012),
(5, 10014),
(5, 10015),
(5, 10017),
(5, 10021),
(5, 10032),
(5, 10034),
(5, 10096),
(9, 10060),
(9, 10069),
(10, 10070),
(11, 10099),
(12, 10103);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usergroups`
--

CREATE TABLE IF NOT EXISTS `tbl_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_usergroups`
--

INSERT INTO `tbl_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `userlevel` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `resetCount` (`resetCount`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=190 ;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `userlevel`) VALUES
(97, 'Super User', 'admin', 'teng.rachana@gmail.com', 'fd2d93362e4209584fc09056de09f447:AxeT79xrHpE1vdejOVO9tgUZy8mAdJYn', 'deprecated', 0, 1, '2013-04-05 04:37:14', '2013-06-06 01:45:55', '0', '{"editor":"","timezone":"","language":"","admin_style":"","admin_language":"","helpsite":""}', '0000-00-00 00:00:00', 0, 1),
(98, 'cnpisit', 'cnpisit', 'chhornnypisit.itc@gmail.com', 'e8679e231f91b41f97ff5263bbd38012:6jhRkrRnaDdQX6aqlONbO8eHk80uptC8', 'deprecated', 0, 1, '2013-04-05 07:33:13', '2013-06-04 10:39:09', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, NULL),
(99, 'pisit', 'pisit', 'chhornnypisit.itc@ymail.com', '9f3aeb6ca2020bad32e320855a4f5183:NobhFJ6JVDflqDOkJPSwwka7sLWKfF2E', '', 0, 1, '2013-04-08 09:29:01', '2013-06-06 01:47:01', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, NULL),
(101, 'fan001', 'fan001', 'fan@mail.com', '43aa1022fd9dd64f9e58387a4b8992e8:uHBpcKHcQVkrh2RANukAryizGvT9ue16', '', 0, 0, '2013-04-29 01:45:37', '2013-05-31 02:19:08', '', '{}', '0000-00-00 00:00:00', 0, NULL),
(102, 'artist001', 'artist001', 'artist@mail.com', '8a9e930ea9efa42af88830f7f8f87da5:ahPbSSyX2TAJ5ILj8obRtu61K3hgIe7d', '', 0, 0, '2013-04-29 01:48:34', '2013-04-29 01:49:11', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, NULL),
(115, 'Nypisit', 'NypisitChhorn', 'nypisit.chhorn@mapring.com', '5a4295d9282924c866018f4bd1fb5328:QsVV5MlLMEmGqlG5vRjNOBVVpC8JWNZB', 'deprecated', 0, 0, '2013-05-10 08:58:43', '2013-05-16 02:52:15', '', '{}', '0000-00-00 00:00:00', 0, NULL),
(186, 'kagnara kol', 'kagnara', 'kol.kagnara@gmail.com', '91d6d6f5c8c2e2d69a82432750c6e354:tyoZtnQw4dkvHz0FssPw10nTQqRbKmkU', '', 1, 0, '2013-06-03 06:21:34', '0000-00-00 00:00:00', '386cd0f0001667111b874edaea872b13', '{}', '0000-00-00 00:00:00', 0, 4),
(188, 'chhorn nypisit', 'nypisit', 'pisit_lovlov@yahoo.com', '7c9526383844155069fb837ca2f70c64:XCTeQ5MhIatsEljlJsOabcXEUtCelmQE', '', 0, 0, '2013-06-04 08:02:19', '2013-06-04 08:48:46', '', '{}', '0000-00-00 00:00:00', 0, 5),
(189, 'pov pov', 'sreypov ', 'povpov.cn@gmail.com', '2d732fdc9d4a37661be80e1bd4cf7294:R4MAhMnZ6wK39bch6YiyP720ZP7R1lZf', '', 0, 0, '2013-06-04 08:50:44', '2013-06-06 01:48:34', '', '{}', '0000-00-00 00:00:00', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_notes`
--

CREATE TABLE IF NOT EXISTS `tbl_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profiles`
--

CREATE TABLE IF NOT EXISTS `tbl_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `tbl_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user_usergroup_map`
--

INSERT INTO `tbl_user_usergroup_map` (`user_id`, `group_id`) VALUES
(97, 8),
(98, 2),
(98, 3),
(99, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(115, 2),
(188, 2),
(188, 5),
(189, 2),
(189, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_viewlevels`
--

CREATE TABLE IF NOT EXISTS `tbl_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_viewlevels`
--

INSERT INTO `tbl_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_weblinks`
--

CREATE TABLE IF NOT EXISTS `tbl_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_weblinks`
--

INSERT INTO `tbl_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `state`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `access`, `params`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`) VALUES
(1, 13, 0, 'Joomla Templates', 'joomla-templates', 'http://www.rockettheme.com/joomla', '', '0000-00-00 00:00:00', 0, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-10-08 14:03:32', 97, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 13, 0, 'Wordpress Themes', 'wordpress-themes', 'http://www.rockettheme.com/wordpress', '', '0000-00-00 00:00:00', 0, 1, 0, '0000-00-00 00:00:00', 2, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-10-08 14:03:40', 97, '', '2012-10-08 14:04:17', 257, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 13, 0, 'Magento Templates', 'magento-templates', 'http://www.rockettheme.com/magento', '', '0000-00-00 00:00:00', 0, 1, 0, '0000-00-00 00:00:00', 3, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-10-08 14:04:00', 97, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 13, 0, 'phpBB3 Styles', 'phpbb3-styles', 'http://www.rockettheme.com/phpbb3', '', '0000-00-00 00:00:00', 0, 1, 0, '0000-00-00 00:00:00', 4, 0, 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-10-08 14:04:06', 97, '', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_art_entiry`
--
ALTER TABLE `tbl_art_entiry`
  ADD CONSTRAINT `tbl_art_entiry_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `tbl_show_art` (`show_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_art_entiry_ibfk_2` FOREIGN KEY (`gal_id`) REFERENCES `tbl_show_art` (`show_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_art_entiry_ibfk_3` FOREIGN KEY (`sur_id`) REFERENCES `tbl_show_art` (`show_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_galleries`
--
ALTER TABLE `tbl_galleries`
  ADD CONSTRAINT `tbl_galleries_ibfk_1` FOREIGN KEY (`sur_id`) REFERENCES `tbl_screen_users` (`sur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rokgallery_files_index`
--
ALTER TABLE `tbl_rokgallery_files_index`
  ADD CONSTRAINT `tbl_rokgallery_files_index_id_idx` FOREIGN KEY (`id`) REFERENCES `tbl_rokgallery_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rokgallery_file_loves`
--
ALTER TABLE `tbl_rokgallery_file_loves`
  ADD CONSTRAINT `tbl_file_loves_file_id_files_id` FOREIGN KEY (`file_id`) REFERENCES `tbl_rokgallery_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rokgallery_file_tags`
--
ALTER TABLE `tbl_rokgallery_file_tags`
  ADD CONSTRAINT `tbl_file_tags_file_id_files_id` FOREIGN KEY (`file_id`) REFERENCES `tbl_rokgallery_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rokgallery_file_views`
--
ALTER TABLE `tbl_rokgallery_file_views`
  ADD CONSTRAINT `tbl_file_views_file_id__files_id` FOREIGN KEY (`file_id`) REFERENCES `tbl_rokgallery_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rokgallery_slices`
--
ALTER TABLE `tbl_rokgallery_slices`
  ADD CONSTRAINT `tbl_slices_file_id_files_id` FOREIGN KEY (`file_id`) REFERENCES `tbl_rokgallery_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_slices_gallery_id_galleries_id` FOREIGN KEY (`gallery_id`) REFERENCES `tbl_rokgallery_galleries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rokgallery_slices_index`
--
ALTER TABLE `tbl_rokgallery_slices_index`
  ADD CONSTRAINT `tbl_rokgallery_slices_index_id_idx` FOREIGN KEY (`id`) REFERENCES `tbl_rokgallery_slices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rokgallery_slice_tags`
--
ALTER TABLE `tbl_rokgallery_slice_tags`
  ADD CONSTRAINT `tbl_slice_tags_slice_id_slices_id` FOREIGN KEY (`slice_id`) REFERENCES `tbl_rokgallery_slices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_screenuser_talents`
--
ALTER TABLE `tbl_screenuser_talents`
  ADD CONSTRAINT `tbl_screenuser_talents_ibfk_1` FOREIGN KEY (`sur_id`) REFERENCES `tbl_screen_users` (`sur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_screenuser_talents_ibfk_2` FOREIGN KEY (`tal_id`) REFERENCES `tbl_talents` (`tal_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_show_art`
--
ALTER TABLE `tbl_show_art`
  ADD CONSTRAINT `tbl_show_art_ibfk_1` FOREIGN KEY (`gal_id`) REFERENCES `tbl_galleries` (`gal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_show_art_ibfk_2` FOREIGN KEY (`sur_id`) REFERENCES `tbl_galleries` (`gal_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_social_network`
--
ALTER TABLE `tbl_social_network`
  ADD CONSTRAINT `tbl_social_network_ibfk_1` FOREIGN KEY (`sur_id`) REFERENCES `tbl_screen_users` (`sur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
