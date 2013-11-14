/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : happyland

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-11-13 22:29:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hpl_daily_sales
-- ----------------------------
DROP TABLE IF EXISTS `hpl_daily_sales`;
CREATE TABLE `hpl_daily_sales` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subsidiaries_id` int(10) NOT NULL,
  `date_sale` date NOT NULL,
  `total_opening_cash` float NOT NULL DEFAULT '0',
  `total_closing_cash` float NOT NULL DEFAULT '0',
  `total_master_card` float NOT NULL DEFAULT '0',
  `total_visa_card` float NOT NULL DEFAULT '0',
  `total_retirement_pen` float NOT NULL DEFAULT '0',
  `total_retirementl_dol` float NOT NULL DEFAULT '0',
  `grand_total_calculated` float NOT NULL DEFAULT '0',
  `grand_total_z_format` float NOT NULL DEFAULT '0',
  `total_difference_money` float NOT NULL DEFAULT '0',
  `total_diferrence_values` float NOT NULL DEFAULT '0',
  `total_num_transactions` int(11) DEFAULT '0',
  `total_hours_by_cash` int(11) DEFAULT '0',
  `status` varchar(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hpl_daily_sales_hpl_subsidiaries1_idx` (`subsidiaries_id`),
  CONSTRAINT `fk_hpl_daily_sales_hpl_subsidiaries1` FOREIGN KEY (`subsidiaries_id`) REFERENCES `hpl_subsidiaries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hpl_daily_sales_detail
-- ----------------------------
DROP TABLE IF EXISTS `hpl_daily_sales_detail`;
CREATE TABLE `hpl_daily_sales_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `daily_sales_id` int(10) NOT NULL,
  `type_of_sales_id` int(11) NOT NULL,
  `operator_id` int(10) DEFAULT NULL,
  `opening_cash` float NOT NULL DEFAULT '0',
  `cash_number` int(11) NOT NULL DEFAULT '1' COMMENT 'caja o punto de servcio del game system',
  `closing_cash` float NOT NULL DEFAULT '0',
  `master_card_amount` float NOT NULL DEFAULT '0',
  `visa_amount` float NOT NULL DEFAULT '0',
  `retirement_amount_pen` float NOT NULL DEFAULT '0',
  `retirement_amount_dol` float NOT NULL DEFAULT '0',
  `total_calculated` float NOT NULL DEFAULT '0',
  `total_x_format` float NOT NULL DEFAULT '0',
  `difference_money` float NOT NULL DEFAULT '0',
  `difference_values` varchar(45) NOT NULL DEFAULT '0',
  `num_transacctions` int(11) NOT NULL DEFAULT '0',
  `hour_by_cash` int(11) NOT NULL DEFAULT '0',
  `status` varchar(3) NOT NULL DEFAULT 'opn',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hpl_daily_sales_detail_hpl_user_idx` (`operator_id`),
  KEY `fk_hpl_daily_sales_detail_hpl_daily_sales1_idx` (`daily_sales_id`),
  KEY `fk_hpl_daily_sales_detail_hpl_type_of_sales1_idx` (`type_of_sales_id`),
  CONSTRAINT `fk_hpl_daily_sales_detail_hpl_daily_sales1` FOREIGN KEY (`daily_sales_id`) REFERENCES `hpl_daily_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hpl_daily_sales_detail_hpl_type_of_sales1` FOREIGN KEY (`type_of_sales_id`) REFERENCES `hpl_type_of_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hpl_module
-- ----------------------------
DROP TABLE IF EXISTS `hpl_module`;
CREATE TABLE `hpl_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `show_menu` int(11) NOT NULL DEFAULT '0',
  `position_order` int(11) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hpl_module_hpl_module1_idx` (`parent_id`),
  CONSTRAINT `fk_hpl_module_hpl_module1` FOREIGN KEY (`parent_id`) REFERENCES `hpl_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hpl_module_profile_access
-- ----------------------------
DROP TABLE IF EXISTS `hpl_module_profile_access`;
CREATE TABLE `hpl_module_profile_access` (
  `profile_id` int(10) NOT NULL,
  `module_id` int(11) NOT NULL,
  `read` tinyint(4) DEFAULT '0',
  `write` tinyint(4) DEFAULT '0',
  `download` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile_id`,`module_id`),
  KEY `fk_hpl_module_profile_access_hpl_module1_idx` (`module_id`),
  CONSTRAINT `fk_hpl_module_profile_access_hpl_module1` FOREIGN KEY (`module_id`) REFERENCES `hpl_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hpl_module_profile_access_hpl_profile1` FOREIGN KEY (`profile_id`) REFERENCES `hpl_profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hpl_profile
-- ----------------------------
DROP TABLE IF EXISTS `hpl_profile`;
CREATE TABLE `hpl_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla perfiles de usuario',
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `access_permition` varchar(10) NOT NULL DEFAULT 'readonly',
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hpl_subsidiaries
-- ----------------------------
DROP TABLE IF EXISTS `hpl_subsidiaries`;
CREATE TABLE `hpl_subsidiaries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hpl_subsidiaries_hpl_subsidiaries1_idx` (`parent_id`),
  CONSTRAINT `fk_hpl_subsidiaries_hpl_subsidiaries1` FOREIGN KEY (`parent_id`) REFERENCES `hpl_subsidiaries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hpl_type_of_sales
-- ----------------------------
DROP TABLE IF EXISTS `hpl_type_of_sales`;
CREATE TABLE `hpl_type_of_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `position_order` int(11) NOT NULL DEFAULT '1',
  `is_other_sales` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hpl_user
-- ----------------------------
DROP TABLE IF EXISTS `hpl_user`;
CREATE TABLE `hpl_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subsidiaries_id` int(10) NOT NULL,
  `profile_id` int(10) NOT NULL,
  `worker_code` varchar(15) NOT NULL,
  `num_doc` varchar(8) NOT NULL,
  `full_name` varchar(80) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `second_last_name` varchar(20) NOT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(115) NOT NULL,
  `generated_password` varchar(115) DEFAULT NULL,
  `is_first_session` tinyint(1) DEFAULT '0',
  `secret_question` varchar(60) DEFAULT NULL,
  `secret_answer` varchar(60) DEFAULT NULL,
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `worker_code_UNIQUE` (`worker_code`),
  UNIQUE KEY `num_doc_UNIQUE` (`num_doc`),
  KEY `fk_hpl_user_hpl_profile1_idx` (`profile_id`),
  KEY `fk_hpl_user_hpl_subsidiaries1_idx` (`subsidiaries_id`),
  FULLTEXT KEY `full_name_index` (`full_name`),
  CONSTRAINT `fk_hpl_user_hpl_profile1` FOREIGN KEY (`profile_id`) REFERENCES `hpl_profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hpl_user_hpl_subsidiaries1` FOREIGN KEY (`subsidiaries_id`) REFERENCES `hpl_subsidiaries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2134 DEFAULT CHARSET=latin1;
