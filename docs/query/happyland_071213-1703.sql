/*
Navicat MySQL Data Transfer

Source Server         : happyland-localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : happyland

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-12-07 09:56:41
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
  `total_web_payment` float NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_daily_sales
-- ----------------------------
INSERT INTO `hpl_daily_sales` VALUES ('1', '10', '2013-09-02', '200', '200', '0', '0', '0', '0', '0', '200', '10000', '0', '0', '40', '8', 'cls', '2013-11-02 17:05:48', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('2', '10', '2013-09-08', '0', '0', '0', '0', '0', '0', '0', '0', '7000', '0', '0', '0', '0', 'cls', '2013-11-08 10:46:17', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('3', '10', '2013-09-11', '2150', '2150', '150', '0', '0', '4300', '300', '2150', '8000', '1150', '0', '0', '0', 'cls', '2013-11-12 10:58:59', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('4', '10', '2013-09-12', '2174', '2174', '71', '201', '45', '1757', '1816', '3746', '3737.5', '8.5', '174', '174', '156', 'cls', '2013-11-12 14:39:09', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('5', '10', '2013-09-13', '333', '432', '314', '342', '0', '330', '330', '1415', '9500', '1095', '240', '250', '330', 'cls', '2013-11-13 09:38:20', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('6', '10', '2013-09-15', '2900', '2900', '90', '310', '0', '770', '1100', '2270', '8000', '1', '55', '13', '19', 'cls', '2013-11-15 12:11:28', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('7', '10', '2013-09-19', '2.5', '2.55', '14', '3', '0', '9', '1', '27.05', '6500', '26.05', '0', '0', '0', 'opn', '2013-11-19 18:23:30', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('8', '10', '2013-09-20', '200', '200', '120', '10', '10', '162', '10', '312', '312', '0', '15', '0', '0', 'opn', '2013-11-19 10:00:44', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('9', '10', '2013-10-02', '200', '200', '0', '0', '0', '0', '0', '200', '10000', '0', '0', '40', '8', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('10', '10', '2013-10-08', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '0', '0', 'cls', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('11', '10', '2013-10-11', '2150', '2150', '150', '0', '0', '4300', '300', '2150', '30000', '1150', '0', '0', '0', 'cls', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('12', '10', '2013-10-12', '2174', '2174', '71', '201', '45', '1757', '1816', '3746', '20750', '8.5', '174', '174', '156', 'cls', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('13', '10', '2013-10-13', '333', '432', '314', '342', '0', '330', '330', '1415', '35890', '1095', '240', '250', '330', 'cls', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('14', '10', '2013-10-15', '2900', '2900', '90', '310', '0', '770', '1100', '2270', '57900', '1', '55', '13', '19', 'cls', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('15', '10', '2013-10-19', '2.5', '2.55', '14', '3', '0', '9', '1', '27.05', '12000', '26.05', '0', '0', '0', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('16', '10', '2013-11-01', '200', '200', '120', '10', '10', '162', '10', '312', '35000', '0', '15', '0', '0', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('17', '10', '2013-11-02', '200', '200', '0', '0', '0', '0', '0', '200', '8000', '0', '0', '40', '8', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('18', '10', '2013-11-08', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '0', '0', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('19', '10', '2013-11-11', '2150', '2150', '150', '0', '0', '4300', '300', '2150', '12500', '1150', '0', '0', '0', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('20', '10', '2013-11-12', '2174', '2174', '71', '201', '45', '1757', '1816', '3746', '18000', '8.5', '174', '174', '156', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('21', '10', '2013-11-13', '333', '432', '314', '342', '0', '330', '330', '1415', '10000', '1095', '240', '250', '330', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('22', '10', '2013-11-15', '2900', '2900', '90', '310', '0', '770', '1100', '2270', '16000', '1', '55', '13', '19', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('23', '10', '2013-11-19', '2.5', '2.55', '14', '3', '0', '9', '1', '27.05', '12500', '26.05', '0', '0', '0', 'opn', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('24', '10', '2013-11-20', '200', '200', '120', '10', '10', '162', '10', '312', '12500', '0', '15', '0', '0', 'cls', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('25', '22', '2013-11-20', '150', '150.85', '130', '-120', '100', '3500', '250', '3', '12500', '5', '0', '0', '0', 'cls', '2013-11-20 12:30:05', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('26', '20', '2013-11-20', '250', '250', '54', '22', '10', '789', '0', '875', '10000', '0', '0', '0', '0', 'opn', '2013-11-20 12:30:35', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('27', '2', '2013-11-21', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '0', '0', 'opn', '2013-11-21 11:09:04', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('28', '17', '2013-11-22', '0', '0', '0', '0', '0', '0', '0', '0', '35000', '0', '0', '0', '0', 'opn', '2013-11-22 11:22:46', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('29', '18', '2013-11-22', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '0', '0', 'opn', '2013-11-22 12:17:48', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('30', '19', '2013-11-22', '0', '0', '0', '0', '0', '0', '0', '0', '35000', '0', '0', '0', '0', 'opn', '2013-11-22 12:17:52', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('31', '17', '2013-11-27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '2013-11-27 10:07:59', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('32', '18', '2013-11-27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '2013-11-27 10:08:01', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('33', '19', '2013-11-27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '2013-11-27 10:08:02', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('34', '20', '2013-11-27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '2013-11-27 10:08:14', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('35', '21', '2013-11-27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '2013-11-27 10:08:15', '0', null, null);
INSERT INTO `hpl_daily_sales` VALUES ('36', '22', '2013-11-27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '2013-11-27 10:08:17', '0', null, null);

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
  `web_payment` float NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_daily_sales_detail
-- ----------------------------
INSERT INTO `hpl_daily_sales_detail` VALUES ('1', '2', '1', '1601', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:17', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('2', '2', '1', '2051', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:21', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('3', '2', '1', '1606', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:25', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('4', '3', '1', '1604', '100', '1', '100', '100', '0', '0', '100', '100', '300', '300', '0', '', '0', '0', 'opn', '0', '2013-11-12 10:58:59', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('5', '3', '1', '2051', '800', '1', '800', '0', '0', '0', '100', '100', '200', '200', '0', '', '0', '0', 'opn', '0', '2013-11-12 10:59:05', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('6', '3', '3', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0', '0', '100', '', '0', '0', 'opn', '0', '2013-11-12 10:59:46', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('7', '3', '2', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0', '0', '100', '', '0', '0', 'opn', '0', '2013-11-12 10:59:50', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('8', '3', '4', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '0', '20', '', '0', '0', 'opn', '0', '2013-11-12 10:59:53', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('9', '3', '7', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '50', '', '0', '0', 'opn', '0', '2013-11-12 10:59:55', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('10', '3', '6', '0', '0', '0', '0', '0', '0', '0', '800', '0', '0', '0', '800', '', '0', '0', 'opn', '0', '2013-11-12 11:00:01', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('11', '3', '5', '0', '0', '0', '0', '0', '0', '0', '80', '0', '0', '0', '80', '', '0', '0', 'opn', '0', '2013-11-12 11:00:03', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('12', '4', '1', '1639', '787', '1', '787', '8', '78', '0', '78', '8', '172', '165.5', '6.5', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:09', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('13', '4', '1', '1601', '100', '2', '100', '1', '0', '0', '1', '0', '0', '0', '2', '', '0', '0', 'opn', '0', '2013-11-12 14:39:21', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('14', '4', '1', '1695', '787', '3', '787', '8', '78', '0', '78', '8', '172', '172', '0', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:26', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('15', '4', '1', '1743', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-12 14:39:28', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('22', '3', '1', '1606', '950', '2', '950', '50', '0', '0', '0', '0', '50', '50', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:01:22', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('23', '3', '1', '1639', '100', '4', '100', '0', '0', '0', '450', '0', '450', '450', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:02:01', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('24', '5', '2', '0', '0', '100', '100', '0', '100', '0', '0', '0', '0', '0', '200', '', '0', '0', 'opn', '0', '2013-11-13 09:38:21', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('25', '5', '3', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-13 09:38:22', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('26', '5', '1', '1605', '100', '1', '0', '0', '0', '0', '0', '0', '-100', '0', '-100', '', '0', '0', 'opn', '0', '2013-11-13 09:38:34', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('266', '5', '1', '1606', '123', '12', '231', '213', '231', '0', '321', '321', '1194', '231', '963', '231', '231', '321', 'opn', '0', '2013-11-13 17:16:48', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('267', '5', '1', '1603', '100', '4', '100', '100', '10', '0', '8', '8', '126', '88', '38', '8', '8', '8', 'opn', '0', '2013-11-13 17:17:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('268', '5', '1', '1602', '10', '4', '1', '1', '1', '0', '1', '1', '-5', '1', '-6', '1', '11', '1', 'opn', '0', '2013-11-13 17:17:03', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('269', '6', '1', '1622', '100', '1', '100', '20', '10', '0', '500', '50', '580', '580', '0', '50', '10', '15', 'opn', '0', '2013-11-15 12:11:29', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('270', '6', '1', '1680', '500', '2', '500', '50', '50', '0', '50', '50', '200', '199', '1', '2', '0', '0', 'opn', '0', '2013-11-15 12:12:57', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('271', '6', '1', '1743', '800', '4', '800', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '0', '2013-11-15 12:13:22', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('272', '6', '1', '1601', '1500', '4', '1500', '20', '250', '0', '0', '150', '420', '419', '1', '3', '3', '4', 'opn', '0', '2013-11-15 12:13:25', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('273', '6', '2', '0', '0', '0', '0', '0', '0', '0', '120', '800', '920', '920', '0', '', '0', '0', 'opn', '0', '2013-11-15 12:14:01', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('274', '6', '3', '0', '0', '545', '0', '0', '0', '0', '100', '50', '150', '151', '-1', '', '0', '0', 'opn', '0', '2013-11-15 12:14:03', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('275', '6', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-15 12:14:04', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('287', '4', '2', '0', '0', '0', '0', '0', '0', '0', '100', '150', '250', '250', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:43:40', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('288', '4', '3', '0', '0', '0', '0', '0', '0', '0', '1500', '1650', '3150', '3150', '0', '', '0', '0', 'opn', '0', '2013-11-19 12:25:37', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('289', '7', '1', '1639', '1', '23', '2', '1', '1', '0', '5', '0', '0', '0', '8', '', '0', '0', 'opn', '0', '2013-11-19 18:23:30', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('290', '7', '1', '1601', '0.5', '10000', '0.55', '2', '2', '0', '4', '0', '0', '0', '8.05', '', '0', '0', 'opn', '0', '2013-11-19 18:23:38', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('291', '7', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '', '0', '0', 'opn', '0', '2013-11-19 18:24:58', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('292', '7', '1', '1601', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-19 18:25:12', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('293', '7', '1', '1603', '0', '1', '0', '11', '11', '0', '0', '0', '0', '0', '22', '', '0', '0', 'opn', '0', '2013-11-19 18:25:16', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('294', '7', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '', '0', '0', 'opn', '0', '2013-11-19 18:25:20', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('295', '7', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '', '0', '0', 'opn', '0', '2013-11-19 18:25:20', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('296', '8', '1', '1601', '100', '1', '100', '100', '10', '10', '10', '10', '140', '140', '0', '15', '0', '0', 'opn', '0', '2013-11-19 10:00:44', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('297', '8', '1', '1639', '100', '2', '100', '20', '0', '0', '0', '0', '20', '20', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:00:59', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('298', '8', '2', '0', '0', '0', '0', '0', '0', '0', '102', '0', '102', '102', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:01:16', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('299', '8', '5', '0', '0', '0', '0', '0', '0', '0', '50', '0', '50', '50', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:01:22', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('300', '9', '1', '1601', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('301', '9', '1', '2051', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('302', '28', '1', '1606', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('303', '10', '1', '1604', '100', '1', '100', '100', '0', '0', '100', '100', '300', '300', '0', '', '0', '0', 'opn', '0', '2013-11-12 10:58:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('304', '10', '1', '2051', '800', '1', '800', '0', '0', '0', '100', '100', '200', '200', '0', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('305', '10', '3', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0', '0', '100', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('306', '10', '2', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0', '0', '100', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('307', '10', '4', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '0', '20', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('308', '10', '7', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '50', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('309', '10', '6', '0', '0', '0', '0', '0', '0', '0', '800', '0', '0', '0', '800', '', '0', '0', 'opn', '0', '2013-11-12 11:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('310', '10', '5', '0', '0', '0', '0', '0', '0', '0', '80', '0', '0', '0', '80', '', '0', '0', 'opn', '0', '2013-11-12 11:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('311', '11', '1', '1639', '787', '1', '787', '8', '78', '0', '78', '8', '172', '165.5', '6.5', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('312', '11', '1', '1601', '100', '2', '100', '1', '0', '0', '1', '0', '0', '0', '2', '', '0', '0', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('313', '11', '1', '1695', '787', '3', '787', '8', '78', '0', '78', '8', '172', '172', '0', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('314', '11', '1', '1743', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('315', '12', '1', '1606', '950', '2', '950', '50', '0', '0', '0', '0', '50', '50', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:01:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('316', '12', '1', '1639', '100', '4', '100', '0', '0', '0', '450', '0', '450', '450', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:02:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('317', '13', '2', '0', '0', '100', '100', '0', '100', '0', '0', '0', '0', '0', '200', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('318', '13', '3', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('319', '13', '1', '1605', '100', '1', '0', '0', '0', '0', '0', '0', '-100', '0', '-100', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('320', '13', '1', '1606', '123', '12', '231', '213', '231', '0', '321', '321', '1194', '231', '963', '231', '231', '321', 'opn', '0', '2013-11-13 17:16:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('321', '13', '1', '1603', '100', '4', '100', '100', '10', '0', '8', '8', '126', '88', '38', '8', '8', '8', 'opn', '0', '2013-11-13 17:17:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('322', '13', '1', '1602', '10', '4', '1', '1', '1', '0', '1', '1', '-5', '1', '-6', '1', '11', '1', 'opn', '0', '2013-11-13 17:17:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('323', '14', '1', '1622', '100', '1', '100', '20', '10', '0', '500', '50', '580', '580', '0', '50', '10', '15', 'opn', '0', '2013-11-15 12:11:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('324', '14', '1', '1680', '500', '2', '500', '50', '50', '0', '50', '50', '200', '199', '1', '2', '0', '0', 'opn', '0', '2013-11-15 12:12:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('325', '14', '1', '1743', '800', '4', '800', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'opn', '0', '2013-11-15 12:13:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('326', '14', '1', '1601', '1500', '4', '1500', '20', '250', '0', '0', '150', '420', '419', '1', '3', '3', '4', 'opn', '0', '2013-11-15 12:13:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('327', '14', '2', '0', '0', '0', '0', '0', '0', '0', '120', '800', '920', '920', '0', '', '0', '0', 'opn', '0', '2013-11-15 12:14:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('328', '14', '3', '0', '0', '545', '0', '0', '0', '0', '100', '50', '150', '151', '-1', '', '0', '0', 'opn', '0', '2013-11-15 12:14:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('329', '14', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-15 12:14:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('330', '15', '2', '0', '0', '0', '0', '0', '0', '0', '100', '150', '250', '250', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:43:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('331', '15', '3', '0', '0', '0', '0', '0', '0', '0', '1500', '1650', '3150', '3150', '0', '', '0', '0', 'opn', '0', '2013-11-19 12:25:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('332', '16', '1', '1639', '1', '23', '2', '1', '1', '0', '5', '0', '0', '0', '8', '', '0', '0', 'opn', '0', '2013-11-19 18:23:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('333', '16', '1', '1601', '0.5', '10000', '0.55', '2', '2', '0', '4', '0', '0', '0', '8.05', '', '0', '0', 'opn', '0', '2013-11-19 18:23:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('334', '16', '5', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '', '0', '0', 'opn', '0', '2013-11-19 18:24:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('335', '16', '1', '1601', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-19 18:25:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('336', '16', '1', '1603', '0', '1', '0', '11', '11', '0', '0', '0', '0', '0', '22', '', '0', '0', 'opn', '0', '2013-11-19 18:25:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('337', '16', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '', '0', '0', 'opn', '0', '2013-11-19 18:25:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('338', '16', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '-1', '0', '-1', '', '0', '0', 'opn', '0', '2013-11-19 18:25:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('339', '17', '1', '1601', '100', '1', '100', '100', '10', '10', '10', '10', '140', '140', '0', '15', '0', '0', 'opn', '0', '2013-11-19 10:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('340', '17', '1', '1639', '100', '2', '100', '20', '0', '0', '0', '0', '20', '20', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('341', '17', '2', '0', '0', '0', '0', '0', '0', '0', '102', '0', '102', '102', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:01:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('342', '17', '5', '0', '0', '0', '0', '0', '0', '0', '50', '0', '50', '50', '0', '', '0', '0', 'opn', '0', '2013-11-19 10:01:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('343', '18', '1', '1601', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('344', '18', '1', '2051', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('345', '18', '1', '1606', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-08 10:46:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('346', '19', '1', '1604', '100', '1', '100', '100', '0', '0', '100', '100', '300', '300', '0', '', '0', '0', 'opn', '0', '2013-11-12 10:58:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('347', '19', '1', '2051', '800', '1', '800', '0', '0', '0', '100', '100', '200', '200', '0', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('348', '19', '3', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0', '0', '100', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('349', '19', '2', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0', '0', '100', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('350', '19', '4', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '0', '20', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('351', '19', '7', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '50', '', '0', '0', 'opn', '0', '2013-11-12 10:59:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('352', '19', '6', '0', '0', '0', '0', '0', '0', '0', '800', '0', '0', '0', '800', '', '0', '0', 'opn', '0', '2013-11-12 11:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('353', '19', '5', '0', '0', '0', '0', '0', '0', '0', '80', '0', '0', '0', '80', '', '0', '0', 'opn', '0', '2013-11-12 11:00:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('354', '20', '1', '1639', '787', '1', '787', '8', '78', '0', '78', '8', '172', '165.5', '6.5', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('355', '20', '1', '1601', '100', '2', '100', '1', '0', '0', '1', '0', '0', '0', '2', '', '0', '0', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('356', '20', '1', '1695', '787', '3', '787', '8', '78', '0', '78', '8', '172', '172', '0', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('357', '20', '1', '1743', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('358', '29', '1', '1606', '950', '2', '950', '50', '0', '0', '0', '0', '50', '50', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:01:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('359', '30', '1', '1639', '100', '4', '100', '0', '0', '0', '450', '0', '450', '450', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:02:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('360', '22', '2', '0', '0', '100', '100', '0', '100', '0', '0', '0', '0', '0', '200', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('361', '22', '3', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('362', '22', '1', '1605', '100', '1', '0', '0', '0', '0', '0', '0', '-100', '0', '-100', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('363', '22', '1', '1606', '123', '12', '231', '213', '231', '0', '321', '321', '1194', '231', '963', '231', '231', '321', 'opn', '0', '2013-11-13 17:16:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('364', '22', '1', '1603', '100', '4', '100', '100', '10', '0', '8', '8', '126', '88', '38', '8', '8', '8', 'opn', '0', '2013-11-13 17:17:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('365', '22', '1', '1602', '10', '4', '1', '1', '1', '0', '1', '1', '-5', '1', '-6', '1', '11', '1', 'opn', '0', '2013-11-13 17:17:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('366', '23', '1', '1639', '787', '1', '787', '8', '78', '0', '78', '8', '172', '165.5', '6.5', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('367', '23', '1', '1601', '100', '2', '100', '1', '0', '0', '1', '0', '0', '0', '2', '', '0', '0', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('368', '23', '1', '1695', '787', '3', '787', '8', '78', '0', '78', '8', '172', '172', '0', '87', '87', '78', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('369', '23', '1', '1743', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-12 14:39:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('370', '24', '1', '1606', '950', '2', '950', '50', '0', '0', '0', '0', '50', '50', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:01:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('371', '24', '1', '1639', '100', '4', '100', '0', '0', '0', '450', '0', '450', '450', '0', '', '0', '0', 'opn', '0', '2013-11-12 18:02:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('372', '24', '2', '0', '0', '100', '100', '0', '100', '0', '0', '0', '0', '0', '200', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('373', '24', '3', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('374', '24', '1', '1605', '100', '1', '0', '0', '0', '0', '0', '0', '-100', '0', '-100', '', '0', '0', 'opn', '0', '2013-11-13 09:38:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('375', '24', '1', '1606', '123', '12', '231', '213', '231', '0', '321', '321', '1194', '231', '963', '231', '231', '321', 'opn', '0', '2013-11-13 17:16:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('376', '24', '1', '1603', '100', '4', '100', '100', '10', '0', '8', '8', '126', '88', '38', '8', '8', '8', 'opn', '0', '2013-11-13 17:17:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('377', '24', '1', '1602', '10', '4', '1', '1', '1', '0', '1', '1', '-5', '1', '-6', '1', '11', '1', 'opn', '0', '2013-11-13 17:17:00', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('378', '25', '1', '1602', '100', '1', '100', '50', '-120', '0', '1500', '100', '1', '-1770', '3', '', '0', '0', 'opn', '0', '2013-11-20 12:30:05', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('379', '26', '1', '1604', '100', '1', '100', '52', '10', '10', '500', '0', '572', '572', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:30:35', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('380', '26', '1', '1610', '150', '2', '150', '2', '12', '0', '50', '0', '64', '64', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:30:52', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('381', '26', '2', '0', '0', '0', '0', '0', '0', '0', '150', '0', '150', '150', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:31:24', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('382', '26', '3', '0', '0', '0', '0', '0', '0', '0', '10', '0', '10', '10', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:31:26', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('383', '26', '4', '0', '0', '0', '0', '0', '0', '0', '15', '0', '15', '15', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:31:28', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('384', '26', '5', '0', '0', '0', '0', '0', '0', '0', '12', '0', '12', '12', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:31:29', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('385', '26', '6', '0', '0', '0', '0', '0', '0', '0', '50', '0', '50', '50', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:31:34', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('386', '26', '7', '0', '0', '0', '0', '0', '0', '0', '2', '0', '2', '2', '0', '', '0', '0', 'opn', '0', '2013-11-20 12:31:36', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('387', '25', '1', '1639', '50', '2', '50.85', '80', '0', '100', '2000', '150', '2', '0', '2', '', '0', '0', 'opn', '0', '2013-11-20 12:31:53', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('388', '27', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', 'opn', '0', '2013-11-21 11:09:04', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('389', '34', '4', '0', '0', '0', '0', '0', '0', '0', '100', '0', '100', '100', '0', '', '0', '0', 'opn', '0', '2013-11-27 10:07:59', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('390', '35', '6', '0', '0', '0', '0', '0', '0', '0', '150', '0', '150', '150', '0', '', '0', '0', 'opn', '0', '2013-11-27 10:08:01', '0', null, null);
INSERT INTO `hpl_daily_sales_detail` VALUES ('391', '36', '7', '0', '0', '0', '0', '0', '0', '0', '200', '0', '200', '200', '0', '', '0', '0', 'opn', '0', '2013-11-27 10:08:02', '0', null, null);

-- ----------------------------
-- Table structure for hpl_module
-- ----------------------------
DROP TABLE IF EXISTS `hpl_module`;
CREATE TABLE `hpl_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `module_action` varchar(50) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_module
-- ----------------------------
INSERT INTO `hpl_module` VALUES ('1', null, 'Ventas Diarias', '', 'DailySales', '', '1', '3', '0', 'act', '2013-10-25 13:01:11', '0', null, null);
INSERT INTO `hpl_module` VALUES ('2', '1', 'Listado de Ventas Diarias', '', 'DailySales', 'index', '1', '1', '0', 'act', '2013-10-25 13:02:24', '0', null, null);
INSERT INTO `hpl_module` VALUES ('3', '1', 'Registrar Venta Diaria', '', 'DailySales', 'maintenanceForm', '1', '2', '0', 'act', '2013-10-25 13:02:40', '0', null, null);
INSERT INTO `hpl_module` VALUES ('4', null, 'Usuarios', '', 'User', '', '1', '1', '0', 'act', '2013-10-25 14:07:13', '0', null, null);
INSERT INTO `hpl_module` VALUES ('5', '4', 'Listado de Usuarios', '', 'User', 'index', '1', '1', '0', 'act', '2013-10-25 14:07:18', '0', null, null);
INSERT INTO `hpl_module` VALUES ('6', '4', 'Agregar Usuario', '', 'User', 'maintenanceUser', '1', '2', '0', 'act', '2013-10-25 14:07:24', '0', null, null);
INSERT INTO `hpl_module` VALUES ('7', '4', 'Modificar Usuario', '', 'User', 'maintenanceUser/$1', '0', '3', '0', 'act', '2013-10-25 14:07:30', '0', null, null);
INSERT INTO `hpl_module` VALUES ('8', null, 'Perfiles', '', 'Profile', '', '1', '2', '0', 'act', '2013-10-25 14:07:56', '0', null, null);
INSERT INTO `hpl_module` VALUES ('9', '8', 'Listado de Perfiles', '', 'Profile', 'index', '1', '1', '0', 'act', '2013-10-25 14:08:01', '0', null, null);
INSERT INTO `hpl_module` VALUES ('10', '8', 'Agregar Perfil', '', 'Profile', 'maintenanceProfile', '1', '2', '0', 'act', '2013-10-25 14:08:04', '0', null, null);
INSERT INTO `hpl_module` VALUES ('11', '8', 'Modificar Perfil', '', 'Profile', 'maintenanceProfile/$1', '0', '3', '0', 'act', '2013-10-25 14:08:08', '0', null, null);
INSERT INTO `hpl_module` VALUES ('12', null, 'Reportes', '', '', '', '1', '1', '0', 'act', '2013-11-08 16:40:53', '0', null, null);
INSERT INTO `hpl_module` VALUES ('13', '12', 'Ventas diarias', '', '', '', '1', '1', '0', 'act', '2013-11-08 16:40:59', '0', null, null);
INSERT INTO `hpl_module` VALUES ('14', '12', 'Depositos', '', '', '', '1', '1', '0', 'act', '2013-11-08 16:41:20', '0', null, null);
INSERT INTO `hpl_module` VALUES ('15', '1', 'Listar Presupuesto', '', 'BudgetSales', 'listBudget', '1', '3', '0', 'act', '2013-11-26 17:42:22', '0', null, null);
INSERT INTO `hpl_module` VALUES ('16', '1', 'Registrar Presupuesto', '', 'BudgetSales', 'maintenanceBudget', '1', '4', '0', 'act', '2013-11-26 17:42:42', '0', null, null);
INSERT INTO `hpl_module` VALUES ('17', '1', 'Listado de Ventas diarias [Administrador]', '', 'DailySales', 'managementIndex', '0', '1', '0', 'act', '2013-12-06 08:51:46', '0', null, null);

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
-- Records of hpl_module_profile_access
-- ----------------------------
INSERT INTO `hpl_module_profile_access` VALUES ('3', '1', '1', '1', '1', '2013-11-12 17:55:13', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '2', '1', '1', '1', '2013-11-12 17:55:49', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '3', '1', '1', '1', '2013-11-12 17:55:49', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '4', '1', '1', '1', '2013-11-19 12:02:09', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '5', '1', '1', '1', '2013-11-19 12:02:09', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '6', '1', '1', '1', '2013-11-19 12:02:09', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '7', '1', '1', '1', '2013-11-19 12:02:09', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '8', '1', '1', '1', '2013-11-12 09:46:02', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '9', '1', '1', '1', '2013-11-12 10:06:22', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '10', '1', '1', '1', '2013-11-12 17:59:31', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '11', '1', '1', '1', '2013-11-12 17:59:31', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '15', '1', '1', '1', '2013-11-26 17:44:49', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '16', '1', '1', '1', '2013-11-26 17:44:49', '0', null, null);
INSERT INTO `hpl_module_profile_access` VALUES ('3', '17', '1', '1', '1', '2013-12-06 08:52:32', '0', null, null);

-- ----------------------------
-- Table structure for hpl_profile
-- ----------------------------
DROP TABLE IF EXISTS `hpl_profile`;
CREATE TABLE `hpl_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla perfiles de usuario',
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `access_permition` varchar(10) NOT NULL DEFAULT 'readonly',
  `sys_block` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_profile
-- ----------------------------
INSERT INTO `hpl_profile` VALUES ('1', 'Administrador de Local', 'Administrador de Local descripción', 'total', '1', 'act', '0', '2013-10-25 11:44:38', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('2', 'Administrador del Sistema', null, 'readonly', '1', 'act', '0', '2013-10-25 14:23:56', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('3', 'Operador', 'Operador que se encuentra en los puntos de venta (POS) o caja', 'custom', '1', 'act', '0', '2013-10-25 14:24:00', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('6', 'Sub gerente Zonal - Centro', 'Sub gerente Zonal - Centro --- descripción', 'readonly', '1', 'act', '0', '2013-10-25 17:25:03', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('7', 'Sub gerente Zonal - Sur', 'Sub gerente Zonal - Zona Sur', 'total', '1', 'act', '0', '2013-11-04 17:05:09', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('8', 'Sub gerente Zonal - Norte', 'Sub gerente Zonal - Zona Note', 'custom', '1', 'act', '0', '2013-11-04 17:05:30', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('9', 'asdsadsa', 'dasdsaadasdas', 'custom', '0', 'act', '1', '2013-11-14 09:41:34', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('10', 'bbbasdasd', 'as dasdsadas', 'custom', '0', 'act', '1', '2013-11-14 09:41:41', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('11', 'bvbvcbcv', 'b vcb cvbcvvcb', 'custom', '0', 'act', '1', '2013-11-14 09:41:46', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('12', 'vbcvbc vbcv', 'bv cb vcb cv', 'custom', '0', 'act', '0', '2013-11-14 09:41:52', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('13', '213123aeqw ewq ', 'ewq ewqeqw eqwewq', 'custom', '0', 'act', '0', '2013-11-14 09:42:00', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('14', 's das dasd sadadqweqw easd', 'sa dasdasdas', 'custom', '0', 'act', '0', '2013-11-14 09:42:13', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('15', 'pl´sadkop dsapoksad pk', 'kpsdkpdsafklñs d', 'custom', '0', 'act', '1', '2013-11-14 09:42:22', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('16', '´ps aod´psadpoa', 'sañl daskldjaskdas', 'custom', '0', 'act', '0', '2013-11-14 09:42:28', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('17', ' adsdklñsadjklk sadj', 'kldsa jkldasjdklsa', 'custom', '0', 'act', '0', '2013-11-14 09:42:37', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('18', 'operador 2', 'asjdsalk djsal djaskdjas', 'readonly', '0', 'act', '0', '2013-11-21 17:23:29', '0', null, null);

-- ----------------------------
-- Table structure for hpl_subsidiaries
-- ----------------------------
DROP TABLE IF EXISTS `hpl_subsidiaries`;
CREATE TABLE `hpl_subsidiaries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `area_m2` varchar(45) DEFAULT NULL,
  `is_princ_office` tinyint(4) NOT NULL DEFAULT '0',
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
-- Records of hpl_subsidiaries
-- ----------------------------
INSERT INTO `hpl_subsidiaries` VALUES ('2', null, 'Contabilidad', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('3', null, 'Operaciones', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('4', null, 'Logística', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('6', null, 'Sistemas', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('7', null, 'Recursos Humanos', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('8', null, 'Marketing', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('9', null, 'Arquitectura', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('10', null, 'C.C. Jockey Plaza', '250', '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('12', null, 'C.C. Mall Aventura Plaza Bellavista', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('13', null, 'C.C. La Pascana', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('14', null, 'C.C. Real Plaza Trujillo', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('15', null, 'C.C. Real Plaza Chiclayo', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('16', null, 'C.C. Piura el Sol', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('17', null, 'C.C. El Quinde Cajamarca', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('18', null, 'C.C. Real Plaza Huancayo', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('19', null, 'C.C. Plaza Norte', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('20', null, 'C.C. Real Plaza Santa. Clara', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('21', null, 'Mantenimiento', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('22', null, 'C.C. Real Plaza Centro Cívico', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('23', null, 'C.C. Mega Express Villa - Chorrillos', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('24', null, 'C.C. Real Plaza Pro', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('25', null, 'Proyectos', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('28', null, 'C.C. Real Plaza Arequipa', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('29', null, 'C.C. Mall Aventura Arequipa', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('30', null, 'C.C. Real Plaza Chimbote', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('31', null, 'C.C. Real Plaza Piura', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('32', null, 'C.C. Real Plaza Guardia Civil', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('33', null, 'Control y Gestión', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('35', null, 'Piura Minka', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('36', null, 'C.C. Mall Aventura Plaza Santa Anita', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('37', null, 'Tesoreria', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('38', null, 'Administración', null, '1', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('39', null, 'C.C. El Quinde Ica', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('40', null, 'C.C. Real Plaza Huanuco', null, '0', 'act', '0', '2013-10-25 11:22:24', '0', null, null);

-- ----------------------------
-- Table structure for hpl_subsidiaries_budget
-- ----------------------------
DROP TABLE IF EXISTS `hpl_subsidiaries_budget`;
CREATE TABLE `hpl_subsidiaries_budget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subsidiaries_id` int(10) NOT NULL,
  `date` date NOT NULL,
  `budget_amount` float DEFAULT NULL,
  `budget_amount_assigned` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`subsidiaries_id`),
  KEY `fk_hpl_subsidiaries_budget_hpl_subsidiaries1_idx` (`subsidiaries_id`),
  KEY `date_index` (`date`),
  CONSTRAINT `fk_hpl_subsidiaries_budget_hpl_subsidiaries1` FOREIGN KEY (`subsidiaries_id`) REFERENCES `hpl_subsidiaries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_subsidiaries_budget
-- ----------------------------
INSERT INTO `hpl_subsidiaries_budget` VALUES ('1', '10', '2013-09-01', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('2', '10', '2013-09-02', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('3', '10', '2013-09-03', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('4', '10', '2013-09-04', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('5', '10', '2013-09-05', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('6', '10', '2013-09-06', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('7', '10', '2013-09-07', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('8', '10', '2013-09-08', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('9', '10', '2013-09-09', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('10', '10', '2013-09-10', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('11', '10', '2013-09-11', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('12', '10', '2013-09-12', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('13', '10', '2013-09-13', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('14', '10', '2013-09-14', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('15', '10', '2013-09-15', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('16', '10', '2013-09-16', '3700', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('17', '10', '2013-09-17', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('18', '10', '2013-09-18', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('19', '10', '2013-09-19', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('20', '10', '2013-09-20', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('21', '10', '2013-09-21', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('22', '10', '2013-09-22', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('23', '10', '2013-09-23', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('24', '10', '2013-09-24', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('25', '10', '2013-09-25', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('26', '10', '2013-09-26', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('27', '10', '2013-09-27', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('28', '10', '2013-09-28', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('29', '10', '2013-09-29', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('30', '10', '2013-09-30', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('31', '10', '2013-10-01', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('32', '10', '2013-10-02', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('33', '10', '2013-10-03', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('34', '10', '2013-10-04', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('35', '10', '2013-10-05', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('36', '10', '2013-10-06', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('37', '10', '2013-10-07', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('38', '10', '2013-10-08', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('39', '10', '2013-10-09', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('40', '10', '2013-10-10', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('41', '10', '2013-10-11', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('42', '10', '2013-10-12', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('43', '10', '2013-10-13', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('44', '10', '2013-10-14', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('45', '10', '2013-10-15', '5850', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('46', '10', '2013-10-16', '6000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('47', '10', '2013-10-17', '6150', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('48', '10', '2013-10-18', '6300', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('49', '10', '2013-10-19', '6450', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('50', '10', '2013-10-20', '6600', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('51', '10', '2013-10-21', '6750', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('52', '10', '2013-10-22', '6900', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('53', '10', '2013-10-23', '7050', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('54', '10', '2013-10-24', '10000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('55', '10', '2013-10-25', '12000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('56', '10', '2013-10-26', '7500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('57', '10', '2013-10-27', '7650', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('58', '10', '2013-10-28', '7800', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('59', '10', '2013-10-29', '7950', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('60', '10', '2013-10-30', '8100', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('61', '10', '2013-10-31', '12000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('62', '10', '2013-11-01', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('63', '10', '2013-11-02', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('64', '10', '2013-11-03', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('65', '10', '2013-11-04', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('66', '10', '2013-11-05', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('67', '10', '2013-11-06', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('68', '10', '2013-11-07', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('69', '10', '2013-11-08', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('70', '10', '2013-11-09', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('71', '10', '2013-11-10', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('72', '10', '2013-11-11', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('73', '10', '2013-11-12', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('74', '10', '2013-11-13', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('75', '10', '2013-11-14', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('76', '10', '2013-11-15', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('77', '10', '2013-11-16', '3700', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('78', '10', '2013-11-17', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('79', '10', '2013-11-18', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('80', '10', '2013-11-19', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('81', '10', '2013-11-20', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('82', '10', '2013-11-21', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('83', '10', '2013-11-22', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('84', '10', '2013-11-23', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('85', '10', '2013-11-24', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('86', '10', '2013-11-25', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('87', '10', '2013-11-26', '4500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('88', '10', '2013-11-27', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('89', '10', '2013-11-28', '7000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('90', '10', '2013-11-29', '5000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('91', '10', '2013-11-30', '5500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('92', '10', '2013-12-01', '7000', '6500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('93', '10', '2013-12-02', '5000', '4500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('94', '10', '2013-12-03', '7000', '6500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('95', '10', '2013-12-04', '5000', '4500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('96', '10', '2013-12-05', '5500', '5000', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('97', '10', '2013-12-06', '4500', '3800', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('98', '10', '2013-12-07', '5000', '4500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('99', '10', '2013-12-08', '7000', '6500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('100', '10', '2013-12-09', '5000', '4500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('101', '10', '2013-12-10', '5500', '4500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('102', '10', '2013-12-11', '4500', '4000', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('103', '10', '2013-12-12', '5000', '4500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('104', '10', '2013-12-13', '7000', '6500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('105', '10', '2013-12-14', '5000', '4500', '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('106', '10', '2013-12-15', '5850', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('107', '10', '2013-12-16', '6000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('108', '10', '2013-12-17', '6150', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('109', '10', '2013-12-18', '6300', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('110', '10', '2013-12-19', '6450', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('111', '10', '2013-12-20', '6600', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('112', '10', '2013-12-21', '6750', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('113', '10', '2013-12-22', '6900', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('114', '10', '2013-12-23', '7050', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('115', '10', '2013-12-24', '10000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('116', '10', '2013-12-25', '12000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('117', '10', '2013-12-26', '7500', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('118', '10', '2013-12-27', '7650', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('119', '10', '2013-12-28', '7800', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('120', '10', '2013-12-29', '7950', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('121', '10', '2013-12-30', '8100', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('122', '10', '2013-12-31', '12000', null, '0000-00-00 00:00:00', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('123', '10', '2012-09-01', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('124', '10', '2012-09-02', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('125', '10', '2012-09-03', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('126', '10', '2012-09-04', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('127', '10', '2012-09-05', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('128', '10', '2012-09-06', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('129', '10', '2012-09-07', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('130', '10', '2012-09-08', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('131', '10', '2012-09-09', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('132', '10', '2012-09-10', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('133', '10', '2012-09-11', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('134', '10', '2012-09-12', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('135', '10', '2012-09-13', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('136', '10', '2012-09-14', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('137', '10', '2012-09-15', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('138', '10', '2012-09-16', '3700', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('139', '10', '2012-09-17', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('140', '10', '2012-09-18', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('141', '10', '2012-09-19', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('142', '10', '2012-09-20', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('143', '10', '2012-09-21', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('144', '10', '2012-09-22', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('145', '10', '2012-09-23', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('146', '10', '2012-09-24', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('147', '10', '2012-09-25', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('148', '10', '2012-09-26', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('149', '10', '2012-09-27', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('150', '10', '2012-09-28', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('151', '10', '2012-09-29', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('152', '10', '2012-09-30', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('153', '10', '2012-10-01', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('154', '10', '2012-10-02', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('155', '10', '2012-10-03', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('156', '10', '2012-10-04', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('157', '10', '2012-10-05', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('158', '10', '2012-10-06', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('159', '10', '2012-10-07', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('160', '10', '2012-10-08', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('161', '10', '2012-10-09', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('162', '10', '2012-10-10', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('163', '10', '2012-10-11', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('164', '10', '2012-10-12', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('165', '10', '2012-10-13', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('166', '10', '2012-10-14', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('167', '10', '2012-10-15', '5850', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('168', '10', '2012-10-16', '6000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('169', '10', '2012-10-17', '6150', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('170', '10', '2012-10-18', '6300', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('171', '10', '2012-10-19', '6450', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('172', '10', '2012-10-20', '6600', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('173', '10', '2012-10-21', '6750', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('174', '10', '2012-10-22', '6900', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('175', '10', '2012-10-23', '7050', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('176', '10', '2012-10-24', '10000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('177', '10', '2012-10-25', '12000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('178', '10', '2012-10-26', '7500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('179', '10', '2012-10-27', '7650', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('180', '10', '2012-10-28', '7800', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('181', '10', '2012-10-29', '7950', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('182', '10', '2012-10-30', '8100', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('183', '10', '2012-10-31', '12000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('184', '10', '2012-11-01', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('185', '10', '2012-11-02', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('186', '10', '2012-11-03', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('187', '10', '2012-11-04', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('188', '10', '2012-11-05', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('189', '10', '2012-11-06', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('190', '10', '2012-11-07', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('191', '10', '2012-11-08', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('192', '10', '2012-11-09', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('193', '10', '2012-11-10', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('194', '10', '2012-11-11', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('195', '10', '2012-11-12', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('196', '10', '2012-11-13', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('197', '10', '2012-11-14', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('198', '10', '2012-11-15', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('199', '10', '2012-11-16', '3700', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('200', '10', '2012-11-17', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('201', '10', '2012-11-18', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('202', '10', '2012-11-19', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('203', '10', '2012-11-20', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('204', '10', '2012-11-21', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('205', '10', '2012-11-22', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('206', '10', '2012-11-23', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('207', '10', '2012-11-24', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('208', '10', '2012-11-25', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('209', '10', '2012-11-26', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('210', '10', '2012-11-27', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('211', '10', '2012-11-28', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('212', '10', '2012-11-29', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('213', '10', '2012-11-30', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('214', '10', '2012-12-01', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('215', '10', '2012-12-02', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('216', '10', '2012-12-03', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('217', '10', '2012-12-04', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('218', '10', '2012-12-05', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('219', '10', '2012-12-06', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('220', '10', '2012-12-07', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('221', '10', '2012-12-08', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('222', '10', '2012-12-09', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('223', '10', '2012-12-10', '5500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('224', '10', '2012-12-11', '4500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('225', '10', '2012-12-12', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('226', '10', '2012-12-13', '7000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('227', '10', '2012-12-14', '5000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('228', '10', '2012-12-15', '5850', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('229', '10', '2012-12-16', '6000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('230', '10', '2012-12-17', '6150', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('231', '10', '2012-12-18', '6300', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('232', '10', '2012-12-19', '6450', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('233', '10', '2012-12-20', '6600', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('234', '10', '2012-12-21', '6750', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('235', '10', '2012-12-22', '6900', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('236', '10', '2012-12-23', '7050', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('237', '10', '2012-12-24', '10000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('238', '10', '2012-12-25', '12000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('239', '10', '2012-12-26', '7500', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('240', '10', '2012-12-27', '7650', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('241', '10', '2012-12-28', '7800', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('242', '10', '2012-12-29', '7950', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('243', '10', '2012-12-30', '8100', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('244', '10', '2012-12-31', '12000', null, '2013-12-05 12:09:36', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('252', '10', '2013-08-01', '7800', '0', '2013-12-05 17:29:22', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('253', '17', '2013-12-01', '7800', '7000', '2013-12-05 17:29:39', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('254', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('255', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('256', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('257', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('258', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('259', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('260', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('261', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:13', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('262', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('263', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('264', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('265', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('266', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('267', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('268', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('269', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('270', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('271', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('272', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('273', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('274', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('275', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('276', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('277', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('278', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('279', '17', '2013-12-02', '7800', '0', '2013-12-05 17:30:14', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('280', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('281', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('282', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('283', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('284', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('285', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('286', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('287', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('288', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('289', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('290', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('291', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('292', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('293', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('294', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('295', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('296', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('297', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('298', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('299', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('300', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('301', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('302', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('303', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('304', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('305', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('306', '17', '2013-12-03', '7800', '0', '2013-12-05 17:30:23', '0', null, null);
INSERT INTO `hpl_subsidiaries_budget` VALUES ('307', '39', '2013-12-01', '7890', '0', '2013-12-05 17:31:10', '0', null, null);

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
-- Records of hpl_type_of_sales
-- ----------------------------
INSERT INTO `hpl_type_of_sales` VALUES ('1', 'Ingreso por Cajero (POS)', null, '1', '0', '0', 'act', '2013-10-30 18:02:50', '1', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('2', 'Boleta', null, '1', '1', '0', 'act', '2013-10-30 18:02:53', '1', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('3', 'Factura', null, '2', '1', '0', 'act', '2013-10-30 18:03:40', '1', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('4', 'Venta Satélites', null, '3', '1', '0', 'act', '2013-10-30 18:04:12', '0', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('5', 'Venta Zippers', null, '4', '1', '0', 'act', '2013-10-30 18:04:23', '0', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('6', 'Cumpleaños (Venta de Contratos)', null, '5', '1', '0', 'act', '2013-10-30 18:04:30', '0', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('7', 'Diferencia de Cajero', null, '6', '1', '0', 'act', '2013-11-02 17:03:08', '0', null, null);

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

-- ----------------------------
-- Records of hpl_user
-- ----------------------------
INSERT INTO `hpl_user` VALUES ('1601', '17', '1', '00001', '41259338', 'JOSE EDUARDO DEL ROSARIO RAMIREZ', 'JOSE EDUARDO', 'DEL ROSARIO', 'RAMIREZ', '', 'jdelrosario-000', 'db0f1692db526b1809a2dadb40a494738b144a56', '', '0', null, null, 'act', '0000-00-00 00:00:00', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1602', '25', '3', '00016', '00016', 'CARLOS ALBERTO BENAVIDES RODRIGUEZ', 'CARLOS ALBERTO', 'BENAVIDES', 'RODRIGUEZ', null, 'cbenavides-0001', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1603', '18', '3', '00017', '00017', 'RAUL ENRIQUE BERRIOS MESCUA', 'RAUL ENRIQUE', 'BERRIOS', 'MESCUA', null, 'rberrios-00017', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1604', '14', '3', '00021', '00021', 'NELSON EDWIN BURGOS HUANCA', 'NELSON EDWIN', 'BURGOS', 'HUANCA', null, 'nburgos-00021', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1605', '15', '3', '00024', '00024', 'ENRIQUE CARCHERI CORONEL', 'ENRIQUE', 'CARCHERI', 'CORONEL', null, 'ecarcheri-00024', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1606', '22', '3', '00026', '00026', 'SELENITA LUPE CARDENAS TIPISMANA', 'SELENITA LUPE', 'CARDENAS', 'TIPISMANA', null, 'scardenas-00026', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1607', '15', '3', '00027', '00027', 'JOHN ALBERTO CARLOS ROJAS', 'JOHN ALBERTO', 'CARLOS', 'ROJAS', null, 'jcarlos-00027', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1608', '13', '3', '00035', '00035', 'TORRE JARA DE LA', 'TORRE JARA', 'DE', 'LA', null, 'tde-00035', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1609', '21', '3', '00037', '00037', 'JOSEF NILTON ECHEVARRIA RICALDI', 'JOSEF NILTON', 'ECHEVARRIA', 'RICALDI', null, 'jechevarria-000', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1610', '16', '3', '00038', '00038', 'KARLA FIORELLA ELIAS GUERRERO', 'KARLA FIORELLA', 'ELIAS', 'GUERRERO', null, 'kelias-00038', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1611', '18', '3', '00039', '00039', 'SILVIA MARIA ESPINOZA PALMA', 'SILVIA MARIA', 'ESPINOZA', 'PALMA', null, 'sespinoza-00039', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1612', '36', '3', '00045', '00045', 'DENIS MAURO CRISTOBAL FELIX', 'DENIS MAURO', 'CRISTOBAL', 'FELIX', null, 'dcristobal-0004', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1613', '22', '3', '00047', '00047', 'ANDRES MARTIN GUANILO VALENCIA', 'ANDRES MARTIN', 'GUANILO', 'VALENCIA', null, 'aguanilo-00047', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1614', '24', '3', '00050', '00050', 'FEDERICO ALONSO HERRERA ZEÃ‘A', 'FEDERICO ALONSO', 'HERRERA', 'ZEÃ‘A', null, 'fherrera-00050', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1615', '21', '3', '00052', '00052', 'JORGE FORTUNATO JAUREGUI SANDOVAL', 'JORGE FORTUNATO', 'JAUREGUI', 'SANDOVAL', null, 'jjauregui-00052', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1616', '19', '3', '00055', '00055', 'LAURA SUJEY LOAYZA TIPISMANA', 'LAURA SUJEY', 'LOAYZA', 'TIPISMANA', null, 'lloayza-00055', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1617', '18', '3', '00063', '00063', 'INDIRA NATHALY MATIAS AGUILAR', 'INDIRA NATHALY', 'MATIAS', 'AGUILAR', null, 'imatias-00063', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1618', '22', '3', '00077', '00077', 'ROMELIA ROMANINA PARISI ALVAREZ', 'ROMELIA ROMANINA', 'PARISI', 'ALVAREZ', null, 'rparisi-00077', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1619', '15', '3', '00078', '00078', 'ALEXANDER GUILLERMO PERALTA CIGUEÃ‘AS', 'ALEXANDER GUILLERMO', 'PERALTA', 'CIGUEÃ‘AS', null, 'aperalta-00078', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1620', '17', '3', '00082', '00082', 'JORGE LUIS PORTAL CHALAN', 'JORGE LUIS', 'PORTAL', 'CHALAN', null, 'jportal-00082', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1621', '25', '3', '00084', '00084', 'JOSMELL IVAN QUILCA CARRION', 'JOSMELL IVAN', 'QUILCA', 'CARRION', null, 'jquilca-00084', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1622', '19', '3', '00091', '00091', 'JAVIER ANTHONY RIVERA VIDAL', 'JAVIER ANTHONY', 'RIVERA', 'VIDAL', null, 'jrivera-00091', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1623', '4', '3', '00098', '00098', 'SERGIO CESAR ROMAN ALDEA', 'SERGIO CESAR', 'ROMAN', 'ALDEA', null, 'sroman-00098', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1624', '3', '3', '00108', '00108', 'NIELS JONATHAN SEGERSBOL SALOMON', 'NIELS JONATHAN', 'SEGERSBOL', 'SALOMON', null, 'nsegersbol-0010', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1625', '31', '3', '00122', '00122', 'OSCAR ALBERTO UBILLUS FLORES', 'OSCAR ALBERTO', 'UBILLUS', 'FLORES', null, 'oubillus-00122', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1626', '3', '3', '00123', '00123', 'RODOLFO CHRISTOPHER VALDERRAMA LUJAN', 'RODOLFO CHRISTOPHER', 'VALDERRAMA', 'LUJAN', null, 'rvalderrama-001', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1627', '25', '3', '00124', '00124', 'RANDY RAFAEL VALLADOLID VALLADOLID', 'RANDY RAFAEL', 'VALLADOLID', 'VALLADOLID', null, 'rvalladolid-001', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1628', '21', '3', '00130', '00130', 'WILMER VILCA RIMACHE', 'WILMER', 'VILCA', 'RIMACHE', null, 'wvilca-00130', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1629', '21', '3', '00157', '00157', 'JOSAPHAT TRINIDAD AMARILLO', 'JOSAPHAT', 'TRINIDAD', 'AMARILLO', null, 'jtrinidad-00157', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1630', '21', '3', '00158', '00158', 'JEAN SERAFIN CASO MALDONADO', 'JEAN SERAFIN', 'CASO', 'MALDONADO', null, 'jcaso-00158', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1631', '10', '3', '00159', '00159', 'JOEL OSCAR ALANYA VILCA', 'JOEL OSCAR', 'ALANYA', 'VILCA', null, 'jalanya-00159', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1632', '33', '3', '00165', '00165', 'CESAR MIGUEL ARCE GONZALES', 'CESAR MIGUEL', 'ARCE', 'GONZALES', null, 'carce-00165', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1633', '25', '3', '00205', '00205', 'ORINSON HUESEMBER IRARICA', 'ORINSON', 'HUESEMBER', 'IRARICA', null, 'ohuesember-0020', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1634', '21', '3', '00224', '00224', 'TOÃ‘O GREGORIO SALCEDO ULLOA', 'TOÃ‘O GREGORIO', 'SALCEDO', 'ULLOA', null, 'tsalcedo-00224', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1635', '12', '3', '00238', '00238', 'PAUL LEONARDO LUCERO ALARCON', 'PAUL LEONARDO', 'LUCERO', 'ALARCON', null, 'plucero-00238', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1636', '25', '3', '00243', '00243', 'JOSE VICENTE SALAS RAMOS', 'JOSE VICENTE', 'SALAS', 'RAMOS', null, 'jsalas-00243', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1637', '25', '3', '00245', '00245', 'EDWIN ALFONZO PONCE VALLADARES', 'EDWIN ALFONZO', 'PONCE', 'VALLADARES', null, 'eponce-00245', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1638', '8', '3', '00246', '00246', 'CYNTHIA MARIANA FERNANDEZ CAIPO', 'CYNTHIA MARIANA', 'FERNANDEZ', 'CAIPO', null, 'cfernandez-0024', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1639', '6', '3', '00255', '00255', 'FARDY CALDERON VASQUEZ', 'FARDY', 'CALDERON', 'VASQUEZ', null, 'fcalderon-00255', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1640', '23', '3', '00269', '00269', 'GISELLA RAMOS PEREZ', 'GISELLA', 'RAMOS', 'PEREZ', null, 'gramos-00269', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1641', '8', '3', '00314', '00314', 'SARA KATHERINE ALCOCER TAPIA', 'SARA KATHERINE', 'ALCOCER', 'TAPIA', null, 'salcocer-00314', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1642', '10', '3', '00325', '00325', 'ANGHELLO ARMANDO ZAPATA FERNANDEZ', 'ANGHELLO ARMANDO', 'ZAPATA', 'FERNANDEZ', null, 'azapata-00325', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1643', '19', '3', '00337', '00337', 'LUIS ENRIQUE SOTO RIVERA', 'LUIS ENRIQUE', 'SOTO', 'RIVERA', null, 'lsoto-00337', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1644', '2', '3', '00358', '00358', 'YESENIA ABIGAIL GONZALES ARTEAGA', 'YESENIA ABIGAIL', 'GONZALES', 'ARTEAGA', null, 'ygonzales-00358', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1645', '12', '3', '00383', '00383', 'NIXTON RUIZ PAREDES MORENO', 'NIXTON RUIZ', 'PAREDES', 'MORENO', null, 'nparedes-00383', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1646', '13', '3', '00384', '00384', 'OSCAR ANDRES QUITO POLO', 'OSCAR ANDRES', 'QUITO', 'POLO', null, 'oquito-00384', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1647', '15', '3', '00406', '00406', 'GERMAN MESONES SOUSA', 'GERMAN', 'MESONES', 'SOUSA', null, 'gmesones-00406', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1648', '15', '3', '00410', '00410', 'KEVIN DAVID GUILLENA BURGA', 'KEVIN DAVID', 'GUILLENA', 'BURGA', null, 'kguillena-00410', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1649', '15', '3', '00412', '00412', 'GISSELLY MONDRAGON AURAZO', 'GISSELLY', 'MONDRAGON', 'AURAZO', null, 'gmondragon-0041', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1650', '31', '3', '00420', '00420', 'ARCESIO ALEJANDRO LOAYZA TRONCOS', 'ARCESIO ALEJANDRO', 'LOAYZA', 'TRONCOS', null, 'aloayza-00420', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1651', '31', '3', '00422', '00422', 'JUAN GUSTAVO AMAYA RUIZ', 'JUAN GUSTAVO', 'AMAYA', 'RUIZ', null, 'jamaya-00422', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1652', '15', '3', '00426', '00426', 'JHOANA CAROLINA RIVADENEYRA OBLITAS', 'JHOANA CAROLINA', 'RIVADENEYRA', 'OBLITAS', null, 'jrivadeneyra-00', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1653', '15', '3', '00427', '00427', 'CRISTHIAN ERIK PEREZ CARRANZA', 'CRISTHIAN ERIK', 'PEREZ', 'CARRANZA', null, 'cperez-00427', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1654', '20', '3', '00430', '00430', 'GABRIEL OMAR CHERO CASIANO', 'GABRIEL OMAR', 'CHERO', 'CASIANO', null, 'gchero-00430', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1655', '14', '3', '00506', '00506', 'VICTOR JOSE CHAVEZ URBINA', 'VICTOR JOSE', 'CHAVEZ', 'URBINA', null, 'vchavez-00506', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1656', '18', '3', '00513', '00513', 'MIRIAN MALLQUI JANAMPA', 'MIRIAN', 'MALLQUI', 'JANAMPA', null, 'mmallqui-00513', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1657', '21', '3', '00535', '00535', 'GABRIEL GERARDO SICHA PEREZ', 'GABRIEL GERARDO', 'SICHA', 'PEREZ', null, 'gsicha-00535', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1658', '29', '3', '00547', '00547', 'BRUNO CHAVEZ MOROCCO', 'BRUNO', 'CHAVEZ', 'MOROCCO', null, 'bchavez-00547', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1659', '29', '3', '00549', '00549', 'ADRIAN LEOPOLDO NUÃ‘EZ CENTTY', 'ADRIAN LEOPOLDO', 'NUÃ‘EZ', 'CENTTY', null, 'anuã‘ez-00549', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1660', '12', '3', '00552', '00552', 'CARLA PAOLA PASACHE SOLANO', 'CARLA PAOLA', 'PASACHE', 'SOLANO', null, 'cpasache-00552', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1661', '4', '3', '00560', '00560', 'RONALD RAUL BAZALAR MENDOZA', 'RONALD RAUL', 'BAZALAR', 'MENDOZA', null, 'rbazalar-00560', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1662', '16', '3', '00585', '00585', 'CARLOS EDINSON CORDOVA IMAN', 'CARLOS EDINSON', 'CORDOVA', 'IMAN', null, 'ccordova-00585', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1663', '28', '3', '00613', '00613', 'WENDOLY ARAGON CABALLERO', 'WENDOLY', 'ARAGON', 'CABALLERO', null, 'waragon-00613', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1664', '15', '3', '00617', '00617', 'GUSTAVO ADOLFO RUIZ RIOS', 'GUSTAVO ADOLFO', 'RUIZ', 'RIOS', null, 'gruiz-00617', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1665', '22', '3', '00684', '00684', 'MERVIN ADRIAN PEREZ ALBARRAN', 'MERVIN ADRIAN', 'PEREZ', 'ALBARRAN', null, 'mperez-00684', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1666', '29', '3', '00704', '00704', 'RENSO LUIS VELARDE BERNEDO', 'RENSO LUIS', 'VELARDE', 'BERNEDO', null, 'rvelarde-00704', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1667', '29', '3', '00705', '00705', 'JOHANN POOL VASQUEZ ALLASI', 'JOHANN POOL', 'VASQUEZ', 'ALLASI', null, 'jvasquez-00705', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1668', '14', '3', '00725', '00725', 'KATHERINE ELIZABETH VILCA ISLA', 'KATHERINE ELIZABETH', 'VILCA', 'ISLA', null, 'kvilca-00725', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1669', '17', '3', '00761', '00761', 'LUIS IVAN PRIETO REAÃ‘O', 'LUIS IVAN', 'PRIETO', 'REAÃ‘O', null, 'lprieto-00761', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1670', '10', '3', '00778', '00778', 'DIANA RUBI GOMEZ CLAVIJO', 'DIANA RUBI', 'GOMEZ', 'CLAVIJO', null, 'dgomez-00778', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1671', '15', '3', '00795', '00795', 'BRIGGITTE STHEFANI MIRANDA MONTIEL', 'BRIGGITTE STHEFANI', 'MIRANDA', 'MONTIEL', null, 'bmiranda-00795', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1672', '15', '3', '00801', '00801', 'OMAR VASQUEZ PEREGRINO', 'OMAR', 'VASQUEZ', 'PEREGRINO', null, 'ovasquez-00801', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1673', '36', '3', '00804', '00804', 'RICARDO GONZALES FERNANDEZ', 'RICARDO', 'GONZALES', 'FERNANDEZ', null, 'rgonzales-00804', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1674', '31', '3', '00815', '00815', 'JESUS ABIGAIL PINTADO RIVERA', 'JESUS ABIGAIL', 'PINTADO', 'RIVERA', null, 'jpintado-00815', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1675', '35', '3', '00820', '00820', 'ALEX XAVIER NOBLECILLA RUIZ', 'ALEX XAVIER', 'NOBLECILLA', 'RUIZ', null, 'anoblecilla-008', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1676', '29', '3', '00833', '00833', 'LILIANA MARLENI CATUNTA NEYRA', 'LILIANA MARLENI', 'CATUNTA', 'NEYRA', null, 'lcatunta-00833', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1677', '30', '3', '00841', '00841', 'ABNER JEFFERSON ODAR NECIOSUP', 'ABNER JEFFERSON', 'ODAR', 'NECIOSUP', null, 'aodar-00841', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1678', '30', '3', '00842', '00842', 'JHACK CESAR SAENZ DURAND', 'JHACK CESAR', 'SAENZ', 'DURAND', null, 'jsaenz-00842', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1679', '2', '3', '00854', '00854', 'CAROLINA ALEJANDRINA CAMPOS TELLO', 'CAROLINA ALEJANDRINA', 'CAMPOS', 'TELLO', null, 'ccampos-00854', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1680', '31', '3', '00868', '00868', 'MISAEL PALACIOS SERNAQUE', 'MISAEL', 'PALACIOS', 'SERNAQUE', null, 'mpalacios-00868', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1681', '31', '3', '00878', '00878', 'CESAR AUGUSTO ZAPATA RODRIGUEZ', 'CESAR AUGUSTO', 'ZAPATA', 'RODRIGUEZ', null, 'czapata-00878', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1682', '30', '3', '00883', '00883', 'KARIN CLAUDIA NAVEDA RISCO', 'KARIN CLAUDIA', 'NAVEDA', 'RISCO', null, 'knaveda-00883', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1683', '36', '3', '00899', '00899', 'ANDREA YESENIA MEZA VERASTEGUI', 'ANDREA YESENIA', 'MEZA', 'VERASTEGUI', null, 'ameza-00899', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1684', '12', '3', '00910', '00910', 'DIANA CAROLINA SOTOMAYOR LOPEZ', 'DIANA CAROLINA', 'SOTOMAYOR', 'LOPEZ', null, 'dsotomayor-0091', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1685', '12', '3', '00925', '00925', 'CINTHIA DEBORA CABEZAS BALTA', 'CINTHIA DEBORA', 'CABEZAS', 'BALTA', null, 'ccabezas-00925', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1686', '15', '3', '00949', '00949', 'DIEGO ARTURO PINEDA SUAREZ', 'DIEGO ARTURO', 'PINEDA', 'SUAREZ', null, 'dpineda-00949', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1687', '36', '3', '00995', '00995', 'ARTURO ITALO CUZCANO QUISPE', 'ARTURO ITALO', 'CUZCANO', 'QUISPE', null, 'acuzcano-00995', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1688', '19', '3', '00998', '00998', 'MARYORI LIZ LINARES MARTINEZ', 'MARYORI LIZ', 'LINARES', 'MARTINEZ', null, 'mlinares-00998', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1689', '15', '3', '01006', '01006', 'AUGUSTO VALENTINO VARGAS CUSTODIO', 'AUGUSTO VALENTINO', 'VARGAS', 'CUSTODIO', null, 'avargas-01006', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1690', '2', '3', '01012', '01012', 'ESMERALDA ELEUTERIO OLORTEGUI', 'ESMERALDA', 'ELEUTERIO', 'OLORTEGUI', null, 'eeleuterio-0101', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1691', '14', '3', '01016', '01016', 'ELI DAVID GRADOS LEON', 'ELI DAVID', 'GRADOS', 'LEON', null, 'egrados-01016', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1692', '20', '3', '01024', '01024', 'BENNY JOE CHAUCAS RIVERA', 'BENNY JOE', 'CHAUCAS', 'RIVERA', null, 'bchaucas-01024', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1693', '30', '3', '01033', '01033', 'CLARA LAURA FLORES PACHERRES', 'CLARA LAURA', 'FLORES', 'PACHERRES', null, 'cflores-01033', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1694', '10', '3', '01049', '01049', 'MARTHA MERCEDES MEZA MANCO', 'MARTHA MERCEDES', 'MEZA', 'MANCO', null, 'mmeza-01049', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1695', '29', '3', '01058', '01058', 'MARIELA AYTE LIMA', 'MARIELA', 'AYTE', 'LIMA', null, 'mayte-01058', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1696', '37', '3', '01061', '01061', 'VIVIAN FIORELLA CHAVEZ CERNA', 'VIVIAN FIORELLA', 'CHAVEZ', 'CERNA', null, 'vchavez-01061', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1697', '29', '3', '01067', '01067', 'FIORELLA ROCIO PARI NEYRA', 'FIORELLA ROCIO', 'PARI', 'NEYRA', null, 'fpari-01067', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1698', '3', '3', '01105', '01105', 'MARCOS FRANKLIN MEDINA ALVAN', 'MARCOS FRANKLIN', 'MEDINA', 'ALVAN', null, 'mmedina-01105', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1699', '15', '3', '01124', '01124', 'MARIA GRAZIA CARDENAS ARRASCO', 'MARIA GRAZIA', 'CARDENAS', 'ARRASCO', null, 'mcardenas-01124', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1700', '2', '3', '01128', '01128', 'IRMA ROSA ALZAMORA PACUTAYPE', 'IRMA ROSA', 'ALZAMORA', 'PACUTAYPE', null, 'ialzamora-01128', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1701', '31', '3', '01145', '01145', 'ADAN ANTONIO SOTO ESPINOZA', 'ADAN ANTONIO', 'SOTO', 'ESPINOZA', null, 'asoto-01145', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1702', '19', '3', '01158', '01158', 'CESAR EDUARDO MEZA CASTILLO', 'CESAR EDUARDO', 'MEZA', 'CASTILLO', null, 'cmeza-01158', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1703', '31', '3', '01192', '01192', 'JULIO CESAR MARTINEZ CARMEN', 'JULIO CESAR', 'MARTINEZ', 'CARMEN', null, 'jmartinez-01192', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1704', '25', '3', '01198', '01198', 'DENILSON ALDAIR ROMERO VALDERRAMA', 'DENILSON ALDAIR', 'ROMERO', 'VALDERRAMA', null, 'dromero-01198', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1705', '22', '3', '01230', '01230', 'DANIKA LOURDES OROPEZA ANGELES', 'DANIKA LOURDES', 'OROPEZA', 'ANGELES', null, 'doropeza-01230', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1706', '10', '3', '01275', '01275', ' EDUARDO GUTIERREZ ', ' EDUARDO', 'GUTIERREZ', '', null, ' gutierrez-0127', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1707', '9', '3', '01277', '01277', 'MILTON CESAR RUFINO PANTA', 'MILTON CESAR', 'RUFINO', 'PANTA', null, 'mrufino-01277', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1708', '12', '3', '01290', '01290', 'LUIS ALEJANDRO NORIEGA LLONTO', 'LUIS ALEJANDRO', 'NORIEGA', 'LLONTO', null, 'lnoriega-01290', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1709', '19', '3', '01303', '01303', 'PAUL MICHELL CAMPOS CABRERA', 'PAUL MICHELL', 'CAMPOS', 'CABRERA', null, 'pcampos-01303', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1710', '18', '3', '01331', '01331', 'MOISES QUISPE MENENDES', 'MOISES', 'QUISPE', 'MENENDES', null, 'mquispe-01331', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1711', '12', '3', '01345', '01345', 'LA CRUZ RIVERA DE', 'LA CRUZ', 'RIVERA', 'DE', null, 'lrivera-01345', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1712', '28', '3', '01346', '01346', 'ZHANDALY SALOME ORTIZ ARMENDARIZ', 'ZHANDALY SALOME', 'ORTIZ', 'ARMENDARIZ', null, 'zortiz-01346', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1713', '28', '3', '01350', '01350', 'JOSE ALONSO URQUIZO ALEJOS', 'JOSE ALONSO', 'URQUIZO', 'ALEJOS', null, 'jurquizo-01350', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1714', '21', '3', '01355', '01355', 'DANIEL ANGELO ALFARO RODRIGUEZ', 'DANIEL ANGELO', 'ALFARO', 'RODRIGUEZ', null, 'dalfaro-01355', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1715', '21', '3', '01371', '01371', 'KEVIN CORMAN OSORIO', 'KEVIN', 'CORMAN', 'OSORIO', null, 'kcorman-01371', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1716', '30', '3', '01374', '01374', 'GEENA STEFAN VERA GOMEZ', 'GEENA STEFAN', 'VERA', 'GOMEZ', null, 'gvera-01374', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1717', '4', '3', '01375', '01375', 'ENRIQUE ALBERTO HERRERA ESCATE', 'ENRIQUE ALBERTO', 'HERRERA', 'ESCATE', null, 'eherrera-01375', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1718', '28', '3', '01383', '01383', 'CARLOS GONZALO VIZCARDO SALAZAR', 'CARLOS GONZALO', 'VIZCARDO', 'SALAZAR', null, 'cvizcardo-01383', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1719', '14', '3', '01387', '01387', 'LUIS JEAN PONCE SANCHEZ', 'LUIS JEAN', 'PONCE', 'SANCHEZ', null, 'lponce-01387', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1720', '4', '3', '01388', '01388', 'JULIO OSCAR CABRERA BARRIOS', 'JULIO OSCAR', 'CABRERA', 'BARRIOS', null, 'jcabrera-01388', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1721', '19', '3', '01393', '01393', 'POOL FERNANDO ARANDA CHUQUILLANQUI', 'POOL FERNANDO', 'ARANDA', 'CHUQUILLANQUI', null, 'paranda-01393', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1722', '19', '3', '01399', '01399', 'ELIHAN CASTAÃ‘EDA RAMOS', 'ELIHAN', 'CASTAÃ‘EDA', 'RAMOS', null, 'ecastaã‘eda-013', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1723', '19', '3', '01402', '01402', 'RICHARD JHON SAMANIEGO TAMAYO', 'RICHARD JHON', 'SAMANIEGO', 'TAMAYO', null, 'rsamaniego-0140', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1724', '4', '3', '01408', '01408', 'ROSA SANDRA SOLDEVILLA LA', 'ROSA SANDRA', 'SOLDEVILLA', 'LA', null, 'rsoldevilla-014', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1725', '21', '3', '01410', '01410', 'LUIS MIGUEL DURAND HUAPAYA', 'LUIS MIGUEL', 'DURAND', 'HUAPAYA', null, 'ldurand-01410', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1726', '2', '3', '01412', '01412', 'JONATHAN WILMER GOMEZ BRAVO', 'JONATHAN WILMER', 'GOMEZ', 'BRAVO', null, 'jgomez-01412', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1727', '19', '3', '01416', '01416', 'ANGEL IVAN CASTILLO ARANDA', 'ANGEL IVAN', 'CASTILLO', 'ARANDA', null, 'acastillo-01416', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1728', '20', '3', '01423', '01423', 'MIGUEL ANGEL GONZALES PINTO', 'MIGUEL ANGEL', 'GONZALES', 'PINTO', null, 'mgonzales-01423', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1729', '22', '3', '01424', '01424', 'JOHN EDISON MARCOVICH BARRUETO', 'JOHN EDISON', 'MARCOVICH', 'BARRUETO', null, 'jmarcovich-0142', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1730', '7', '3', '01425', '01425', 'MONICA LUCIA CACERES GARRIDO', 'MONICA LUCIA', 'CACERES', 'GARRIDO', null, 'mcaceres-01425', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1731', '28', '3', '01432', '01432', 'JUAN CHRISTIAN CHAÃ‘I LAURA', 'JUAN CHRISTIAN', 'CHAÃ‘I', 'LAURA', null, 'jchaã‘i-01432', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1732', '36', '3', '01440', '01440', 'YESSICA ROXANA PALOMINO RUEDA', 'YESSICA ROXANA', 'PALOMINO', 'RUEDA', null, 'ypalomino-01440', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1733', '17', '3', '01444', '01444', 'CYNTHIA JAQUELINE RAMIREZ LEVY', 'CYNTHIA JAQUELINE', 'RAMIREZ', 'LEVY', null, 'cramirez-01444', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1734', '21', '3', '01445', '01445', 'DANIEL URDANEGUI CROVETTO', 'DANIEL', 'URDANEGUI', 'CROVETTO', null, 'durdanegui-0144', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1735', '17', '3', '01452', '01452', 'YESSICA FIORELLA SISNIEGAS NORIEGA', 'YESSICA FIORELLA', 'SISNIEGAS', 'NORIEGA', null, 'ysisniegas-0145', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1736', '21', '3', '01463', '01463', 'ARMANDO DAVID LEON CONDE', 'ARMANDO DAVID', 'LEON', 'CONDE', null, 'aleon-01463', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1737', '29', '3', '01471', '01471', 'SINDAY PRESCILIA CALERO LAZARO', 'SINDAY PRESCILIA', 'CALERO', 'LAZARO', null, 'scalero-01471', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1738', '25', '3', '01474', '01474', 'MARCOS ANTONIO YABAR BENITES', 'MARCOS ANTONIO', 'YABAR', 'BENITES', null, 'myabar-01474', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1739', '10', '3', '01480', '01480', 'JOHN ANDERSON CONDOLO ZETA', 'JOHN ANDERSON', 'CONDOLO', 'ZETA', null, 'jcondolo-01480', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1740', '38', '3', '01499', '01499', 'DORIS JULCA ESTELO', 'DORIS', 'JULCA', 'ESTELO', null, 'djulca-01499', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1741', '12', '3', '01504', '01504', 'OMAYRA NADIR ORTIZ VARGAS', 'OMAYRA NADIR', 'ORTIZ', 'VARGAS', null, 'oortiz-01504', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1742', '23', '3', '01510', '01510', 'CHRIS JOANNA RUIZ MACEDA', 'CHRIS JOANNA', 'RUIZ', 'MACEDA', null, 'cruiz-01510', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1743', '17', '1', '01531', '42949820', 'DAVIS CLINTON SANTOS CAÑARI', 'DAVIS CLINTON', 'SANTOS', 'CAÑARI', '', 'dsantos-01531', '7c4a8d09ca3762af61e59520943dc26494f8941b', null, '0', null, null, 'act', '0000-00-00 00:00:00', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1744', '7', '3', '01557', '01557', 'JENNY ERIKA BARRIENTOS MALLMA', 'JENNY ERIKA', 'BARRIENTOS', 'MALLMA', null, 'jbarrientos-015', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1745', '38', '3', '01565', '01565', 'CRISTHIAN PAUL AGAPITO PACHECO', 'CRISTHIAN PAUL', 'AGAPITO', 'PACHECO', null, 'cagapito-01565', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1746', '14', '3', '01569', '01569', 'JUAN JOSE CARRERA OSPINO', 'JUAN JOSE', 'CARRERA', 'OSPINO', null, 'jcarrera-01569', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1747', '21', '3', '01570', '01570', 'CLEMENTE NOE LIMAYMANTA MACHUCA', 'CLEMENTE NOE', 'LIMAYMANTA', 'MACHUCA', null, 'climaymanta-015', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1748', '12', '3', '01578', '01578', 'CYNTHIA STEPHANIE VIDAL REBATTA', 'CYNTHIA STEPHANIE', 'VIDAL', 'REBATTA', null, 'cvidal-01578', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1749', '15', '3', '01582', '01582', 'JHONATAN LUISIN FLORES MENCHOLA', 'JHONATAN LUISIN', 'FLORES', 'MENCHOLA', null, 'jflores-01582', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1750', '15', '3', '01583', '01583', 'DAVID JAVIER SILVA RUBIO', 'DAVID JAVIER', 'SILVA', 'RUBIO', null, 'dsilva-01583', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1751', '19', '3', '01598', '01598', 'PAUL FRANK CALLE GARCIA', 'PAUL FRANK', 'CALLE', 'GARCIA', null, 'pcalle-01598', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1752', '10', '3', '01600', '01600', 'WILSON ANTONIO RISCO OCUPA', 'WILSON ANTONIO', 'RISCO', 'OCUPA', null, 'wrisco-01600', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1753', '21', '3', '01622', '01622', 'FELIX SICHA MALDONADO', 'FELIX', 'SICHA', 'MALDONADO', null, 'fsicha-01622', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1754', '14', '3', '01627', '01627', 'KATERINE EDITH IZQUIERDO CHAUCA', 'KATERINE EDITH', 'IZQUIERDO', 'CHAUCA', null, 'kizquierdo-0162', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1755', '15', '3', '01629', '01629', 'ALY LIZETH LARREA OYARCE', 'ALY LIZETH', 'LARREA', 'OYARCE', null, 'alarrea-01629', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1756', '18', '3', '01630', '01630', 'GERALDINNE ALEJANDRA QUILLATUPA ROJAS', 'GERALDINNE ALEJANDRA', 'QUILLATUPA', 'ROJAS', null, 'gquillatupa-016', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1757', '17', '3', '01635', '01635', 'KEILA SUELY ORMEÃ‘O ENRIQUEZ', 'KEILA SUELY', 'ORMEÃ‘O', 'ENRIQUEZ', null, 'kormeã‘o-01635', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1758', '17', '3', '01637', '01637', 'GARY MOLINA CENTENO', 'GARY', 'MOLINA', 'CENTENO', null, 'gmolina-01637', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1759', '15', '3', '01642', '01642', 'LAURA LUZ LINARES GARCIA', 'LAURA LUZ', 'LINARES', 'GARCIA', null, 'llinares-01642', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1760', '21', '3', '01647', '01647', 'GILBERTO PASCUAL TRUJILLO', 'GILBERTO', 'PASCUAL', 'TRUJILLO', null, 'gpascual-01647', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1761', '22', '3', '01660', '01660', 'LIDIA ESTHER CUBA BLANCAS', 'LIDIA ESTHER', 'CUBA', 'BLANCAS', null, 'lcuba-01660', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1762', '2', '3', '01677', '01677', 'CANDY YESENIA PASTOR ZAVALETA', 'CANDY YESENIA', 'PASTOR', 'ZAVALETA', null, 'cpastor-01677', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1763', '19', '3', '01685', '01685', 'WALTER OMAR LIENDO RICKARD', 'WALTER OMAR', 'LIENDO', 'RICKARD', null, 'wliendo-01685', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1764', '36', '3', '01700', '01700', 'CHRISTIAN EDUARDO TORRES PAHUACHO', 'CHRISTIAN EDUARDO', 'TORRES', 'PAHUACHO', null, 'ctorres-01700', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1765', '28', '3', '01711', '01711', 'MARIA DEL TAPIA MURILLO', 'MARIA DEL', 'TAPIA', 'MURILLO', null, 'mtapia-01711', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1766', '29', '3', '01713', '01713', 'LUIS PAUL PERCA GONZALES', 'LUIS PAUL', 'PERCA', 'GONZALES', null, 'lperca-01713', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1767', '12', '3', '01714', '01714', 'ANDRE ELOY JULCAPOMA USCO', 'ANDRE ELOY', 'JULCAPOMA', 'USCO', null, 'ajulcapoma-0171', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1768', '14', '3', '01718', '01718', 'RENZO YAMIR COSAVALENTE VERGARA', 'RENZO YAMIR', 'COSAVALENTE', 'VERGARA', null, 'rcosavalente-01', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1769', '35', '3', '01719', '01719', 'KATHERINE LILIANA MORENO HUAMAN', 'KATHERINE LILIANA', 'MORENO', 'HUAMAN', null, 'kmoreno-01719', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1770', '32', '3', '01726', '01726', 'IVONNE YESSENIA NINAPAYTAN VARGAS', 'IVONNE YESSENIA', 'NINAPAYTAN', 'VARGAS', null, 'ininapaytan-017', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1771', '4', '3', '01727', '01727', 'TANIA ROSA AGUADO HUACCHARAQUI', 'TANIA ROSA', 'AGUADO', 'HUACCHARAQUI', null, 'taguado-01727', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1772', '13', '3', '01729', '01729', 'SAYDA ELITA HERNANDEZ HUANCA', 'SAYDA ELITA', 'HERNANDEZ', 'HUANCA', null, 'shernandez-0172', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1773', '24', '3', '01732', '01732', 'CAROL PAOLA CABEZAS LEON', 'CAROL PAOLA', 'CABEZAS', 'LEON', null, 'ccabezas-01732', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1774', '31', '3', '01744', '01744', 'CARLOS ENRIQUE ALEMAN ESTEVES', 'CARLOS ENRIQUE', 'ALEMAN', 'ESTEVES', null, 'caleman-01744', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1775', '14', '3', '01747', '01747', 'FRANCIES JHOMPIER ARROYO ARROYO', 'FRANCIES JHOMPIER', 'ARROYO', 'ARROYO', null, 'farroyo-01747', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1776', '15', '3', '01755', '01755', 'MELISSA IVONNE TRUJILLO TEJADA', 'MELISSA IVONNE', 'TRUJILLO', 'TEJADA', null, 'mtrujillo-01755', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1777', '36', '3', '01762', '01762', 'BETSABE LOPEZ LEON', 'BETSABE', 'LOPEZ', 'LEON', null, 'blopez-01762', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1778', '36', '3', '01770', '01770', 'JHONATAN EDICH GAMBOA CASTILLO', 'JHONATAN EDICH', 'GAMBOA', 'CASTILLO', null, 'jgamboa-01770', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1779', '38', '3', '01771', '01771', 'HERLANDINA FLORA HUAMAN ASTO', 'HERLANDINA FLORA', 'HUAMAN', 'ASTO', null, 'hhuaman-01771', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1780', '28', '3', '01781', '01781', 'ANAHY MARILIA ESCARZA CHAVEZ', 'ANAHY MARILIA', 'ESCARZA', 'CHAVEZ', null, 'aescarza-01781', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1781', '14', '3', '01787', '01787', 'NESTOR MIGUEL TERRONES ALFARO', 'NESTOR MIGUEL', 'TERRONES', 'ALFARO', null, 'nterrones-01787', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1782', '22', '3', '01792', '01792', 'DANIELLA ROXANA MEJIA SULLASI', 'DANIELLA ROXANA', 'MEJIA', 'SULLASI', null, 'dmejia-01792', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1783', '22', '3', '01794', '01794', 'EVER JUNIOR SILVA REYES', 'EVER JUNIOR', 'SILVA', 'REYES', null, 'esilva-01794', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1784', '36', '3', '01801', '01801', 'ANA LUCIA SULCA PEREZ', 'ANA LUCIA', 'SULCA', 'PEREZ', null, 'asulca-01801', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1785', '10', '3', '01809', '01809', 'MERY CRISTY NUÃ‘EZ SANCHEZ', 'MERY CRISTY', 'NUÃ‘EZ', 'SANCHEZ', null, 'mnuã‘ez-01809', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1786', '31', '3', '01811', '01811', 'SANTA MARIA LA CHIRA', 'SANTA MARIA', 'LA', 'CHIRA', null, 'sla-01811', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1787', '7', '3', '01814', '01814', 'RUDY QUISPE TORRES', 'RUDY', 'QUISPE', 'TORRES', null, 'rquispe-01814', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1788', '24', '3', '01823', '01823', 'GIANINA ELIZA PUJALLA FRANCO', 'GIANINA ELIZA', 'PUJALLA', 'FRANCO', null, 'gpujalla-01823', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1789', '36', '3', '01825', '01825', 'MARIA YSABEL MUÃ‘OZ HERRERA', 'MARIA YSABEL', 'MUÃ‘OZ', 'HERRERA', null, 'mmuã‘oz-01825', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1790', '32', '3', '01829', '01829', 'VICTORIA LUZMILA CARRASCO SOTOMAYOR', 'VICTORIA LUZMILA', 'CARRASCO', 'SOTOMAYOR', null, 'vcarrasco-01829', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1791', '7', '3', '01834', '01834', 'EDGAR GUERRA CHACALIAZA', 'EDGAR', 'GUERRA', 'CHACALIAZA', null, 'eguerra-01834', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1792', '10', '3', '01850', '01850', 'STEFANNY DENNIS NAVARRO VILLENA', 'STEFANNY DENNIS', 'NAVARRO', 'VILLENA', null, 'snavarro-01850', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1793', '18', '3', '01862', '01862', 'JORGE ERNESTTO SUAREZ FREYRE', 'JORGE ERNESTTO', 'SUAREZ', 'FREYRE', null, 'jsuarez-01862', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1794', '29', '3', '01879', '01879', 'CLAUDIA EDITH NAVARRO TITO', 'CLAUDIA EDITH', 'NAVARRO', 'TITO', null, 'cnavarro-01879', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1795', '29', '3', '01897', '01897', 'LESLIE JANETH ZELA CORIA', 'LESLIE JANETH', 'ZELA', 'CORIA', null, 'lzela-01897', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1796', '29', '3', '01898', '01898', 'MARJORIE NIKOL AUBERT LLERENA', 'MARJORIE NIKOL', 'AUBERT', 'LLERENA', null, 'maubert-01898', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1797', '12', '3', '01906', '01906', 'MARCOS RAUL RODRIGUEZ NAVA', 'MARCOS RAUL', 'RODRIGUEZ', 'NAVA', null, 'mrodriguez-0190', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1798', '25', '3', '01909', '01909', 'LA CRUZ NEIRA DE', 'LA CRUZ', 'NEIRA', 'DE', null, 'lneira-01909', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1799', '19', '3', '01911', '01911', 'DANIEL ALEXANDER VALLADARES BENTOCILLA', 'DANIEL ALEXANDER', 'VALLADARES', 'BENTOCILLA', null, 'dvalladares-019', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1800', '19', '3', '01914', '01914', 'ANGEL DURAND RAMIREZ', 'ANGEL', 'DURAND', 'RAMIREZ', null, 'adurand-01914', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1801', '19', '3', '01916', '01916', 'KATIUSCA LUZ VITA ORE', 'KATIUSCA LUZ', 'VITA', 'ORE', null, 'kvita-01916', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1802', '19', '3', '01919', '01919', 'HENRY ALEX VALDIVIANO MELGAREJO', 'HENRY ALEX', 'VALDIVIANO', 'MELGAREJO', null, 'hvaldiviano-019', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1803', '19', '3', '01920', '01920', 'EDSON JOSUE CANALES SALDARRIAGA', 'EDSON JOSUE', 'CANALES', 'SALDARRIAGA', null, 'ecanales-01920', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1804', '15', '3', '01926', '01926', 'SHERIM LIZET ZELADA PUICON', 'SHERIM LIZET', 'ZELADA', 'PUICON', null, 'szelada-01926', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1805', '22', '3', '01929', '01929', 'ENRIQUE AUGUSTO OLIVERA ESPICHAN', 'ENRIQUE AUGUSTO', 'OLIVERA', 'ESPICHAN', null, 'eolivera-01929', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1806', '22', '3', '01930', '01930', 'CYNTIA INES ESCALANTE ESPICHAN', 'CYNTIA INES', 'ESCALANTE', 'ESPICHAN', null, 'cescalante-0193', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1807', '21', '3', '01938', '01938', 'UBALDO FABIO BEJAR VEGA', 'UBALDO FABIO', 'BEJAR', 'VEGA', null, 'ubejar-01938', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1808', '18', '3', '01942', '01942', 'NADDIA LUCIA FAUSTINO MUJICA', 'NADDIA LUCIA', 'FAUSTINO', 'MUJICA', null, 'nfaustino-01942', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1809', '18', '3', '01945', '01945', 'SUSAN EVELYN AVELLANEDA ALANYA', 'SUSAN EVELYN', 'AVELLANEDA', 'ALANYA', null, 'savellaneda-019', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1810', '17', '3', '01965', '01965', 'GABI RODAS SANCHEZ', 'GABI', 'RODAS', 'SANCHEZ', null, 'grodas-01965', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1811', '17', '3', '01967', '01967', 'SARA ZOILA MARTOS TORRES', 'SARA ZOILA', 'MARTOS', 'TORRES', null, 'smartos-01967', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1812', '10', '3', '01974', '01974', 'ROSA ELVIRA ZEGARRA PAREDES', 'ROSA ELVIRA', 'ZEGARRA', 'PAREDES', null, 'rzegarra-01974', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1813', '32', '3', '01975', '01975', 'GLADYS TORRES VELASQUEZ', 'GLADYS', 'TORRES', 'VELASQUEZ', null, 'gtorres-01975', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1814', '29', '3', '01977', '01977', 'CESAR ALEXANDER ALAVE ALAVE', 'CESAR ALEXANDER', 'ALAVE', 'ALAVE', null, 'calave-01977', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1815', '29', '3', '01979', '01979', 'LILIANA MARILYN SALAZAR ZAPANA', 'LILIANA MARILYN', 'SALAZAR', 'ZAPANA', null, 'lsalazar-01979', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1816', '12', '3', '01983', '01983', 'ANGEL DE SALGUERO LEON', 'ANGEL DE', 'SALGUERO', 'LEON', null, 'asalguero-01983', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1817', '29', '3', '01995', '01995', 'WELVID VALOIS ROJAS MAZUELOS', 'WELVID VALOIS', 'ROJAS', 'MAZUELOS', null, 'wrojas-01995', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1818', '19', '3', '02001', '02001', 'BRAYAN MIRSHA DEZA MORALES', 'BRAYAN MIRSHA', 'DEZA', 'MORALES', null, 'bdeza-02001', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1819', '21', '3', '02005', '02005', 'CARLOS MAX FERNANDEZ CALVAY', 'CARLOS MAX', 'FERNANDEZ', 'CALVAY', null, 'cfernandez-0200', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1820', '18', '3', '02016', '02016', 'FERNANDO MANUEL MATIAS HURTADO', 'FERNANDO MANUEL', 'MATIAS', 'HURTADO', null, 'fmatias-02016', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1821', '12', '3', '02019', '02019', 'NELLY ANNE ROSAS RIOJA', 'NELLY ANNE', 'ROSAS', 'RIOJA', null, 'nrosas-02019', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1822', '28', '3', '02031', '02031', 'JOSE VILCA MEZA', 'JOSE', 'VILCA', 'MEZA', null, 'jvilca-02031', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1823', '14', '3', '02032', '02032', 'ALEX JAVIER LAZARO CASTILLO', 'ALEX JAVIER', 'LAZARO', 'CASTILLO', null, 'alazaro-02032', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1824', '4', '3', '02034', '02034', 'ALEX EDWARD TRISTAN GOMEZ', 'ALEX EDWARD', 'TRISTAN', 'GOMEZ', null, 'atristan-02034', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1825', '36', '3', '02036', '02036', 'EMELY MARNY SILVERIO GENEBROZO', 'EMELY MARNY', 'SILVERIO', 'GENEBROZO', null, 'esilverio-02036', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1826', '24', '3', '02040', '02040', 'JORGE ENRIQUE VILLAVICENCIO ANTUNEZ', 'JORGE ENRIQUE', 'VILLAVICENCIO', 'ANTUNEZ', null, 'jvillavicencio-', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1827', '21', '3', '02045', '02045', 'JOSE JOEL MONTES UTOS', 'JOSE JOEL', 'MONTES', 'UTOS', null, 'jmontes-02045', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1828', '31', '3', '02049', '02049', 'PERCY ARISTA LEIVA', 'PERCY', 'ARISTA', 'LEIVA', null, 'parista-02049', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1829', '19', '3', '02051', '02051', 'CLAUDIA VANNESA REQUEJO BOLIVAR', 'CLAUDIA VANNESA', 'REQUEJO', 'BOLIVAR', null, 'crequejo-02051', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1830', '30', '3', '02062', '02062', 'LILIANA ELIZABETH CHAFALOTE OBESO', 'LILIANA ELIZABETH', 'CHAFALOTE', 'OBESO', null, 'lchafalote-0206', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1831', '10', '3', '02075', '02075', 'STEPHANIE DIAZ DELGADO', 'STEPHANIE', 'DIAZ', 'DELGADO', null, 'sdiaz-02075', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1832', '30', '3', '02078', '02078', 'YATACO ROSSELY DIAZ ZULUETA', 'YATACO ROSSELY', 'DIAZ', 'ZULUETA', null, 'ydiaz-02078', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1833', '2', '3', '02090', '02090', 'CAROLIN LIDIA MARTINEZ CANDELA', 'CAROLIN LIDIA', 'MARTINEZ', 'CANDELA', null, 'cmartinez-02090', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1834', '37', '3', '02099', '02099', 'RENZO ARTURO RIVAS GALARZA', 'RENZO ARTURO', 'RIVAS', 'GALARZA', null, 'rrivas-02099', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1835', '21', '3', '02102', '02102', 'HENRY JACKSON LINARES RUIZ', 'HENRY JACKSON', 'LINARES', 'RUIZ', null, 'hlinares-02102', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1836', '10', '3', '02103', '02103', 'BRUNELLA ALESSANDRA GAMBOA CUNEO', 'BRUNELLA ALESSANDRA', 'GAMBOA', 'CUNEO', null, 'bgamboa-02103', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1837', '39', '3', '02107', '02107', 'KATHERIN MERCEDES PRADO FLORES', 'KATHERIN MERCEDES', 'PRADO', 'FLORES', null, 'kprado-02107', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1838', '22', '3', '02114', '02114', 'HAROLD ARTURO DURAND URIBE', 'HAROLD ARTURO', 'DURAND', 'URIBE', null, 'hdurand-02114', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1839', '22', '3', '02115', '02115', 'LA CRUZ LUJAN DE', 'LA CRUZ', 'LUJAN', 'DE', null, 'llujan-02115', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1840', '39', '3', '02119', '02119', 'BRIAN ORTECHO CORNEJO', 'BRIAN', 'ORTECHO', 'CORNEJO', null, 'bortecho-02119', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1841', '21', '3', '02121', '02121', 'FRANK ARIAS HIRPAHUANCA', 'FRANK', 'ARIAS', 'HIRPAHUANCA', null, 'farias-02121', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1842', '22', '3', '02124', '02124', 'MAYRA YUBEL VASQUEZ BUSTAMANTE', 'MAYRA YUBEL', 'VASQUEZ', 'BUSTAMANTE', null, 'mvasquez-02124', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1843', '28', '3', '02128', '02128', 'ANYELO ROBERTO HERNANDEZ LOZADA', 'ANYELO ROBERTO', 'HERNANDEZ', 'LOZADA', null, 'ahernandez-0212', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1844', '28', '3', '02130', '02130', 'EDUARDO LUIS LOZANO CORNEJO', 'EDUARDO LUIS', 'LOZANO', 'CORNEJO', null, 'elozano-02130', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1845', '20', '3', '02131', '02131', 'JHOANA JOSSELYN GONZALES JESUS', 'JHOANA JOSSELYN', 'GONZALES', 'JESUS', null, 'jgonzales-02131', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1846', '30', '3', '02132', '02132', 'ANA CRISTINA FLORES VEGA', 'ANA CRISTINA', 'FLORES', 'VEGA', null, 'aflores-02132', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1847', '10', '3', '02139', '02139', 'GEORGETTE ALEXANDRA CENTENO GALINDO', 'GEORGETTE ALEXANDRA', 'CENTENO', 'GALINDO', null, 'gcenteno-02139', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1848', '14', '3', '02143', '02143', 'DIEGO AUGUSTO AYALA ALARCON', 'DIEGO AUGUSTO', 'AYALA', 'ALARCON', null, 'dayala-02143', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1849', '36', '3', '02148', '02148', 'GERALDINE ESTEFANIA HUAMAN TAIPE', 'GERALDINE ESTEFANIA', 'HUAMAN', 'TAIPE', null, 'ghuaman-02148', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1850', '36', '3', '02149', '02149', 'MERCEDES PAMELA ROMERO ZAMORA', 'MERCEDES PAMELA', 'ROMERO', 'ZAMORA', null, 'mromero-02149', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1851', '36', '3', '02151', '02151', 'SANTOS MARIANA ARGOMEDO TORRES', 'SANTOS MARIANA', 'ARGOMEDO', 'TORRES', null, 'sargomedo-02151', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1852', '36', '3', '02154', '02154', 'ELIDA MARIA CAJA DURAN', 'ELIDA MARIA', 'CAJA', 'DURAN', null, 'ecaja-02154', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1853', '20', '3', '02156', '02156', 'LILIANA MARIBEL GUILLEN COMUN', 'LILIANA MARIBEL', 'GUILLEN', 'COMUN', null, 'lguillen-02156', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1854', '10', '3', '02160', '02160', 'NORMA PAREDES SALAZAR', 'NORMA', 'PAREDES', 'SALAZAR', null, 'nparedes-02160', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1855', '39', '3', '02164', '02164', 'ROSSMERY JOANA RAMIREZ QUISPE', 'ROSSMERY JOANA', 'RAMIREZ', 'QUISPE', null, 'rramirez-02164', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1856', '15', '3', '02171', '02171', 'NIEVES MUNDACA SIESQUEN', 'NIEVES', 'MUNDACA', 'SIESQUEN', null, 'nmundaca-02171', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1857', '15', '3', '02172', '02172', 'CLAUDIA TABOADA MIMBELA', 'CLAUDIA', 'TABOADA', 'MIMBELA', null, 'ctaboada-02172', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1858', '24', '3', '02175', '02175', 'MILAGROS RUBI ZAMORA CASTILLO', 'MILAGROS RUBI', 'ZAMORA', 'CASTILLO', null, 'mzamora-02175', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1859', '24', '3', '02176', '02176', 'JORDAN JOEL ROMERO AGUERO', 'JORDAN JOEL', 'ROMERO', 'AGUERO', null, 'jromero-02176', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1860', '10', '3', '02178', '02178', 'JOSE LUIS OJEDA SANCHEZ', 'JOSE LUIS', 'OJEDA', 'SANCHEZ', null, 'jojeda-02178', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1861', '7', '3', '02179', '02179', 'ALEXANDRA LISBHET LOPEZ RODRIGUEZ', 'ALEXANDRA LISBHET', 'LOPEZ', 'RODRIGUEZ', null, 'alopez-02179', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1862', '38', '3', '02180', '02180', 'LUZ ANGELICA GARAY GUERRA', 'LUZ ANGELICA', 'GARAY', 'GUERRA', null, 'lgaray-02180', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1863', '2', '3', '02182', '02182', 'CAROLAY MONSERRATT CONDORI FLORES', 'CAROLAY MONSERRATT', 'CONDORI', 'FLORES', null, 'ccondori-02182', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1864', '28', '3', '02190', '02190', 'ALEJANDRA ANDIA CIPRIANO', 'ALEJANDRA', 'ANDIA', 'CIPRIANO', null, 'aandia-02190', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1865', '36', '3', '02191', '02191', 'ROXANA MILAGROS FLORES PECAR', 'ROXANA MILAGROS', 'FLORES', 'PECAR', null, 'rflores-02191', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1866', '10', '3', '02192', '02192', 'DAYRO LEONARDO AMARO GUEVARA', 'DAYRO LEONARDO', 'AMARO', 'GUEVARA', null, 'damaro-02192', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1867', '10', '3', '02193', '02193', 'NADIA ANDREA PAREDES BEJARANO', 'NADIA ANDREA', 'PAREDES', 'BEJARANO', null, 'nparedes-02193', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1868', '22', '3', '02200', '02200', 'JUAN DANIEL MORALES SALINAS', 'JUAN DANIEL', 'MORALES', 'SALINAS', null, 'jmorales-02200', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1869', '22', '3', '02201', '02201', 'ROSA TORO SALAS LA', 'ROSA TORO', 'SALAS', 'LA', null, 'rsalas-02201', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1870', '21', '3', '02204', '02204', 'JOHAN KRANKL RAZA CONDOR', 'JOHAN KRANKL', 'RAZA', 'CONDOR', null, 'jraza-02204', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1871', '17', '3', '02206', '02206', 'AURORA ESTEFANIA VERGARA MIRANDA', 'AURORA ESTEFANIA', 'VERGARA', 'MIRANDA', null, 'avergara-02206', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1872', '19', '3', '02207', '02207', 'NICOLAS CANO CONDOR', 'NICOLAS', 'CANO', 'CONDOR', null, 'ncano-02207', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1873', '18', '3', '02210', '02210', 'JHONATAN PAUL QUINTANA ARRIETA', 'JHONATAN PAUL', 'QUINTANA', 'ARRIETA', null, 'jquintana-02210', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1874', '33', '3', '02219', '02219', 'PAULO CESAR ARTEAGA CASTRO', 'PAULO CESAR', 'ARTEAGA', 'CASTRO', null, 'parteaga-02219', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1875', '4', '3', '02220', '02220', 'JUAN GREGORIO REYNA ACHULLA', 'JUAN GREGORIO', 'REYNA', 'ACHULLA', null, 'jreyna-02220', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1876', '36', '3', '02221', '02221', 'CRUZ CHUPAN DE LA', 'CRUZ CHUPAN', 'DE', 'LA', null, 'cde-02221', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1877', '36', '3', '02222', '02222', 'MILAGROS RUEDA VILLAVICENCIO', 'MILAGROS', 'RUEDA', 'VILLAVICENCIO', null, 'mrueda-02222', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1878', '18', '3', '02225', '02225', 'GUADALUPE VASQUEZ MANTARI', 'GUADALUPE', 'VASQUEZ', 'MANTARI', null, 'gvasquez-02225', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1879', '36', '3', '02229', '02229', 'GINA INES LEON ACOSTA', 'GINA INES', 'LEON', 'ACOSTA', null, 'gleon-02229', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1880', '8', '3', '02237', '02237', 'ELIANA ZULETTY CHANAME GARCIA', 'ELIANA ZULETTY', 'CHANAME', 'GARCIA', null, 'echaname-02237', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1881', '19', '3', '02241', '02241', 'GERALDYNE MELISSA COBOS SHUPINGAHUA', 'GERALDYNE MELISSA', 'COBOS', 'SHUPINGAHUA', null, 'gcobos-02241', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1882', '10', '3', '02248', '02248', 'GRECIA MERITZELL SUNCION GOMEZ', 'GRECIA MERITZELL', 'SUNCION', 'GOMEZ', null, 'gsuncion-02248', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1883', '22', '3', '02250', '02250', 'JIMY RUBEN SURICHAQUI JAMJACHI', 'JIMY RUBEN', 'SURICHAQUI', 'JAMJACHI', null, 'jsurichaqui-022', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1884', '18', '3', '02255', '02255', 'LUCERO MONGE VALLADARES', 'LUCERO', 'MONGE', 'VALLADARES', null, 'lmonge-02255', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1885', '29', '3', '02257', '02257', 'PIERRE FIDEL LOPEZ HUALPA', 'PIERRE FIDEL', 'LOPEZ', 'HUALPA', null, 'plopez-02257', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1886', '29', '3', '02258', '02258', 'PRADO KELVIN DEL CARPIO', 'PRADO KELVIN', 'DEL', 'CARPIO', null, 'pdel-02258', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1887', '22', '3', '02259', '02259', 'KATHERINE MARTHA SAENZ ALVAREZ', 'KATHERINE MARTHA', 'SAENZ', 'ALVAREZ', null, 'ksaenz-02259', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1888', '29', '3', '02262', '02262', 'BRYAN WILSON MIRANDA PANTIGOSO', 'BRYAN WILSON', 'MIRANDA', 'PANTIGOSO', null, 'bmiranda-02262', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1889', '39', '3', '02263', '02263', 'EDUARDO JESUS CASTILLO ESPINOZA', 'EDUARDO JESUS', 'CASTILLO', 'ESPINOZA', null, 'ecastillo-02263', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1890', '19', '3', '02265', '02265', 'JHERIKA JHESMIN VILLENA GALARZA', 'JHERIKA JHESMIN', 'VILLENA', 'GALARZA', null, 'jvillena-02265', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1891', '22', '3', '02268', '02268', 'JHONNY ANTONIO SALAZAR SANCHEZ', 'JHONNY ANTONIO', 'SALAZAR', 'SANCHEZ', null, 'jsalazar-02268', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1892', '12', '3', '02269', '02269', 'CARLOS EDUARDO ABANTO LOBATON', 'CARLOS EDUARDO', 'ABANTO', 'LOBATON', null, 'cabanto-02269', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1893', '17', '3', '02272', '02272', 'SAMANTHA NICOLLE TORRES CASTAÃ‘EDA', 'SAMANTHA NICOLLE', 'TORRES', 'CASTAÃ‘EDA', null, 'storres-02272', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1894', '21', '3', '02278', '02278', 'JEINMY RANDY YQUIAPAZA NARVAEZ', 'JEINMY RANDY', 'YQUIAPAZA', 'NARVAEZ', null, 'jyquiapaza-0227', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1895', '24', '3', '02283', '02283', 'JERSON RONALD ABANTO INGA', 'JERSON RONALD', 'ABANTO', 'INGA', null, 'jabanto-02283', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1896', '36', '3', '02286', '02286', 'LAURA RITA TOCAS GIL', 'LAURA RITA', 'TOCAS', 'GIL', null, 'ltocas-02286', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1897', '39', '3', '02287', '02287', 'MANUEL FERNANDO LUJAN APARCANA', 'MANUEL FERNANDO', 'LUJAN', 'APARCANA', null, 'mlujan-02287', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1898', '36', '3', '02291', '02291', 'MIGUEL ANGEL CAJACURI QUIÃ‘ON', 'MIGUEL ANGEL', 'CAJACURI', 'QUIÃ‘ON', null, 'mcajacuri-02291', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1899', '20', '3', '02292', '02292', 'CARMEN VENTURA POMA', 'CARMEN', 'VENTURA', 'POMA', null, 'cventura-02292', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1900', '39', '3', '02294', '02294', 'MARIA CECILIA OSCCO MENESES', 'MARIA CECILIA', 'OSCCO', 'MENESES', null, 'moscco-02294', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1901', '36', '3', '02300', '02300', 'PEDRO JHERSON MORALES MENDOZA', 'PEDRO JHERSON', 'MORALES', 'MENDOZA', null, 'pmorales-02300', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1902', '28', '3', '02301', '02301', 'HENRY HERNAN ZAVALA REYMER', 'HENRY HERNAN', 'ZAVALA', 'REYMER', null, 'hzavala-02301', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1903', '19', '3', '02303', '02303', 'ALEJANDRO BRUCE LEON CHIPANA', 'ALEJANDRO BRUCE', 'LEON', 'CHIPANA', null, 'aleon-02303', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1904', '8', '3', '02307', '02307', 'NATALIA ESTEFANIA MADARIAGA ORJEDA', 'NATALIA ESTEFANIA', 'MADARIAGA', 'ORJEDA', null, 'nmadariaga-0230', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1905', '12', '3', '02311', '02311', 'VICTOR JAVIER CASTILLO SOLANO', 'VICTOR JAVIER', 'CASTILLO', 'SOLANO', null, 'vcastillo-02311', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1906', '22', '3', '02313', '02313', 'RAISA AIME ANTON REYNEL', 'RAISA AIME', 'ANTON', 'REYNEL', null, 'ranton-02313', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1907', '22', '3', '02316', '02316', 'ANTHONY GALA CHAIÃ‘A', 'ANTHONY', 'GALA', 'CHAIÃ‘A', null, 'agala-02316', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1908', '15', '3', '02317', '02317', 'SHIRLEY MILENE GALINDO PRIVAT', 'SHIRLEY MILENE', 'GALINDO', 'PRIVAT', null, 'sgalindo-02317', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1909', '15', '3', '02318', '02318', 'JAN FRANCO HOYOS AURAZO', 'JAN FRANCO', 'HOYOS', 'AURAZO', null, 'jhoyos-02318', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1910', '15', '3', '02319', '02319', 'JUAN AUGUSTO MINGUILLO RUBIO', 'JUAN AUGUSTO', 'MINGUILLO', 'RUBIO', null, 'jminguillo-0231', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1911', '15', '3', '02321', '02321', 'CARLA CONTRERAS MONDRAGON', 'CARLA', 'CONTRERAS', 'MONDRAGON', null, 'ccontreras-0232', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1912', '19', '3', '02325', '02325', 'LA TORRE LANAZCA DE', 'LA TORRE', 'LANAZCA', 'DE', null, 'llanazca-02325', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1913', '17', '3', '02328', '02328', 'MARIA ALEJANDRA LEON NORIEGA', 'MARIA ALEJANDRA', 'LEON', 'NORIEGA', null, 'mleon-02328', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1914', '24', '3', '02331', '02331', 'LUIS IVAN RADAS NICOLL', 'LUIS IVAN', 'RADAS', 'NICOLL', null, 'lradas-02331', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1915', '13', '3', '02334', '02334', 'ABEL JOSUE MASIAS PERALTA', 'ABEL JOSUE', 'MASIAS', 'PERALTA', null, 'amasias-02334', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1916', '21', '3', '02336', '02336', 'ALVARO MURQUIETIO YTUSACA', 'ALVARO', 'MURQUIETIO', 'YTUSACA', null, 'amurquietio-023', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1917', '18', '3', '02339', '02339', 'BRUCE LEONARD QUISPE ZARATE', 'BRUCE LEONARD', 'QUISPE', 'ZARATE', null, 'bquispe-02339', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1918', '20', '3', '02340', '02340', 'DAYANNA DEL LOZA CABREJOS', 'DAYANNA DEL', 'LOZA', 'CABREJOS', null, 'dloza-02340', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1919', '19', '3', '02342', '02342', 'LETICIA EUMELIA CALDAS ESCUDERO', 'LETICIA EUMELIA', 'CALDAS', 'ESCUDERO', null, 'lcaldas-02342', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1920', '19', '3', '02346', '02346', 'HAROLD DENNIS PANTOJA BANDA', 'HAROLD DENNIS', 'PANTOJA', 'BANDA', null, 'hpantoja-02346', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1921', '18', '3', '02347', '02347', 'JHONNY JEFFERSON YANCE RIVERA', 'JHONNY JEFFERSON', 'YANCE', 'RIVERA', null, 'jyance-02347', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1922', '19', '3', '02348', '02348', 'STEFANY MAILYN PEVEZ INFANTES', 'STEFANY MAILYN', 'PEVEZ', 'INFANTES', null, 'spevez-02348', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1923', '19', '3', '02349', '02349', 'FABIOLA MILUSKA FALCON CORDOVA', 'FABIOLA MILUSKA', 'FALCON', 'CORDOVA', null, 'ffalcon-02349', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1924', '4', '3', '02350', '02350', 'JORGE ESTEBAN DIAZ MONTERO', 'JORGE ESTEBAN', 'DIAZ', 'MONTERO', null, 'jdiaz-02350', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1925', '21', '3', '02351', '02351', 'JONATHAN ROLANDO AYORA LUCANA', 'JONATHAN ROLANDO', 'AYORA', 'LUCANA', null, 'jayora-02351', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1926', '30', '3', '02352', '02352', 'MAYRA ALEJANDRA OYOLA NEYRA', 'MAYRA ALEJANDRA', 'OYOLA', 'NEYRA', null, 'moyola-02352', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1927', '21', '3', '02354', '02354', 'ANDRES ORLANDO SOTO SANCHEZ', 'ANDRES ORLANDO', 'SOTO', 'SANCHEZ', null, 'asoto-02354', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1928', '19', '3', '02355', '02355', 'ERICSON MILTON MELENDEZ CRUZ', 'ERICSON MILTON', 'MELENDEZ', 'CRUZ', null, 'emelendez-02355', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1929', '19', '3', '02357', '02357', 'LANDEO JOSE DE LUCIO', 'LANDEO JOSE', 'DE', 'LUCIO', null, 'lde-02357', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1930', '19', '3', '02358', '02358', 'CAROL ROSSMERY OTOYA BRIONES', 'CAROL ROSSMERY', 'OTOYA', 'BRIONES', null, 'cotoya-02358', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1931', '19', '3', '02359', '02359', 'JESUS ANGEL GUZMAN BURGOS', 'JESUS ANGEL', 'GUZMAN', 'BURGOS', null, 'jguzman-02359', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1932', '3', '3', '02360', '02360', 'DAVID ENRIQUE VALDIVIA GUTIERREZ', 'DAVID ENRIQUE', 'VALDIVIA', 'GUTIERREZ', null, 'dvaldivia-02360', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1933', '39', '3', '02361', '02361', 'MELANNIE STEFFI GARCIA HURTADO', 'MELANNIE STEFFI', 'GARCIA', 'HURTADO', null, 'mgarcia-02361', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1934', '31', '3', '02364', '02364', 'ANGELICA LOURDES NIÃ‘O TEZEN', 'ANGELICA LOURDES', 'NIÃ‘O', 'TEZEN', null, 'aniã‘o-02364', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1935', '31', '3', '02366', '02366', 'CINTHIA LILIANA ASANZA CASTRO', 'CINTHIA LILIANA', 'ASANZA', 'CASTRO', null, 'casanza-02366', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1936', '31', '3', '02368', '02368', 'LEYDI YASMIN FEBRE OLIVA', 'LEYDI YASMIN', 'FEBRE', 'OLIVA', null, 'lfebre-02368', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1937', '22', '3', '02370', '02370', 'CARLOS ALICIA DEL VALLE', 'CARLOS ALICIA', 'DEL', 'VALLE', null, 'cdel-02370', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1938', '18', '3', '02371', '02371', 'MAYRA HELEN LUCAS LOAYZA', 'MAYRA HELEN', 'LUCAS', 'LOAYZA', null, 'mlucas-02371', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1939', '7', '3', '02372', '02372', 'JOHN EDUARD MARTINEZ PRADO', 'JOHN EDUARD', 'MARTINEZ', 'PRADO', null, 'jmartinez-02372', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1940', '12', '3', '02374', '02374', 'ROSARIO ESTEFANI JEADA PALACIOS', 'ROSARIO ESTEFANI', 'JEADA', 'PALACIOS', null, 'rjeada-02374', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1941', '19', '3', '02377', '02377', 'EDITH ELIANA PEZO CACHIQUE', 'EDITH ELIANA', 'PEZO', 'CACHIQUE', null, 'epezo-02377', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1942', '29', '3', '02378', '02378', 'RENATO FRANCO NEYRA TORRES', 'RENATO FRANCO', 'NEYRA', 'TORRES', null, 'rneyra-02378', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1943', '38', '3', '02379', '02379', 'JANETT DEL VALERA TOLEDO', 'JANETT DEL', 'VALERA', 'TOLEDO', null, 'jvalera-02379', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1944', '10', '3', '02380', '02380', 'VILLA FLORES VELEZ DE', 'VILLA FLORES', 'VELEZ', 'DE', null, 'vvelez-02380', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1945', '40', '3', '02384', '02384', 'JOEL ENRIQUE CLARIANA SAAVEDRA', 'JOEL ENRIQUE', 'CLARIANA', 'SAAVEDRA', null, 'jclariana-02384', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1946', '36', '3', '02386', '02386', 'HAYDEE CLARIZA POMAHUACRE DURAND', 'HAYDEE CLARIZA', 'POMAHUACRE', 'DURAND', null, 'hpomahuacre-023', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1947', '25', '3', '02387', '02387', 'JULIO CESAR SAAVEDRA LOPEZ', 'JULIO CESAR', 'SAAVEDRA', 'LOPEZ', null, 'jsaavedra-02387', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1948', '40', '3', '02388', '02388', 'LEON AVILA PONCE DE', 'LEON AVILA', 'PONCE', 'DE', null, 'lponce-02388', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1949', '22', '3', '02390', '02390', 'MARIA LUISA YANAC ROMAN', 'MARIA LUISA', 'YANAC', 'ROMAN', null, 'myanac-02390', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1950', '12', '3', '02391', '02391', 'KATTERINE KAREN GOMEZ GONZALES', 'KATTERINE KAREN', 'GOMEZ', 'GONZALES', null, 'kgomez-02391', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1951', '23', '3', '02392', '02392', 'ANAID DINA VICENTE DIAZ', 'ANAID DINA', 'VICENTE', 'DIAZ', null, 'avicente-02392', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1952', '29', '3', '02395', '02395', 'DIEGO DANIEL EDUARDO VILLAGRA', 'DIEGO DANIEL', 'EDUARDO', 'VILLAGRA', null, 'deduardo-02395', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1953', '36', '3', '02397', '02397', 'ANGELICA MARIA BETETA MIGUEL', 'ANGELICA MARIA', 'BETETA', 'MIGUEL', null, 'abeteta-02397', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1954', '40', '3', '02400', '02400', 'KATERIN ODALIS PEÃ‘A CAUSSO', 'KATERIN ODALIS', 'PEÃ‘A', 'CAUSSO', null, 'kpeã‘a-02400', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1955', '40', '3', '02401', '02401', 'BRYAM ELIEL VELARDE ROSALES', 'BRYAM ELIEL', 'VELARDE', 'ROSALES', null, 'bvelarde-02401', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1956', '40', '3', '02404', '02404', 'LIZ MARINA SERNA SANCHEZ', 'LIZ MARINA', 'SERNA', 'SANCHEZ', null, 'lserna-02404', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1957', '40', '3', '02405', '02405', 'GIANCARLO SIFUENTES ROSALES', 'GIANCARLO', 'SIFUENTES', 'ROSALES', null, 'gsifuentes-0240', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1958', '36', '3', '02406', '02406', 'LIZBETH ADRIANA BAUTISTA VARGAS', 'LIZBETH ADRIANA', 'BAUTISTA', 'VARGAS', null, 'lbautista-02406', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1959', '14', '3', '02408', '02408', 'JUAN DIEGO MORAN RODRIGUEZ', 'JUAN DIEGO', 'MORAN', 'RODRIGUEZ', null, 'jmoran-02408', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1960', '24', '3', '02409', '02409', 'LAURA DE PALOMINO CHUQUIBALA', 'LAURA DE', 'PALOMINO', 'CHUQUIBALA', null, 'lpalomino-02409', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1961', '10', '3', '02411', '02411', 'KELLY MIRELLA JUAREZ MATOS', 'KELLY MIRELLA', 'JUAREZ', 'MATOS', null, 'kjuarez-02411', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1962', '10', '3', '02412', '02412', 'ALEXANDER STEVE MARQUEZ TORRES', 'ALEXANDER STEVE', 'MARQUEZ', 'TORRES', null, 'amarquez-02412', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1963', '10', '3', '02413', '02413', 'DIANA VALDEZ CASAVILCA', 'DIANA', 'VALDEZ', 'CASAVILCA', null, 'dvaldez-02413', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1964', '14', '3', '02415', '02415', 'FREDY ALEXANDER CABANILLAS ZACARIAS', 'FREDY ALEXANDER', 'CABANILLAS', 'ZACARIAS', null, 'fcabanillas-024', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1965', '10', '3', '02417', '02417', 'CASTILLA MAGGI RUIZ DE', 'CASTILLA MAGGI', 'RUIZ', 'DE', null, 'cruiz-02417', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1966', '14', '3', '02418', '02418', 'JAIMMIE ZUHELLY IDROGO CABRERA', 'JAIMMIE ZUHELLY', 'IDROGO', 'CABRERA', null, 'jidrogo-02418', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1967', '14', '3', '02419', '02419', 'CLAUDIA GABRIELA PEREDA CRIBILLEROS', 'CLAUDIA GABRIELA', 'PEREDA', 'CRIBILLEROS', null, 'cpereda-02419', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1968', '31', '3', '02420', '02420', 'VALERIA REGINA RUIZ ROBLES', 'VALERIA REGINA', 'RUIZ', 'ROBLES', null, 'vruiz-02420', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1969', '4', '3', '02423', '02423', 'MARIA SOFIA RODRIGUEZ SOLANO', 'MARIA SOFIA', 'RODRIGUEZ', 'SOLANO', null, 'mrodriguez-0242', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1970', '36', '3', '02425', '02425', 'DIANA CUSI OCHOA QUISPE', 'DIANA CUSI', 'OCHOA', 'QUISPE', null, 'dochoa-02425', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1971', '40', '3', '02426', '02426', 'VICTOR JAIME PARDEVE SOTO', 'VICTOR JAIME', 'PARDEVE', 'SOTO', null, 'vpardeve-02426', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1972', '40', '3', '02428', '02428', 'HEIDY KATHIUSKA ROSAS ALBORNOZ', 'HEIDY KATHIUSKA', 'ROSAS', 'ALBORNOZ', null, 'hrosas-02428', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1973', '32', '3', '02429', '02429', 'CARINA COAGUILA TUNCAR', 'CARINA', 'COAGUILA', 'TUNCAR', null, 'ccoaguila-02429', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1974', '19', '3', '02430', '02430', 'FLOR LUCERITO ALARCON MORENO', 'FLOR LUCERITO', 'ALARCON', 'MORENO', null, 'falarcon-02430', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1975', '19', '3', '02431', '02431', 'JHASMIN YORIET ESPINOZA FALCON', 'JHASMIN YORIET', 'ESPINOZA', 'FALCON', null, 'jespinoza-02431', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1976', '19', '3', '02433', '02433', 'NICOLAS REYNALDO SALAZAR CHUNGA', 'NICOLAS REYNALDO', 'SALAZAR', 'CHUNGA', null, 'nsalazar-02433', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1977', '20', '3', '02435', '02435', 'VALLE GANOZA GONZALES DEL', 'VALLE GANOZA', 'GONZALES', 'DEL', null, 'vgonzales-02435', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1978', '19', '3', '02436', '02436', 'DIANA ENMA SILVA CONDORI', 'DIANA ENMA', 'SILVA', 'CONDORI', null, 'dsilva-02436', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1979', '28', '3', '02438', '02438', 'DIEGO JESUS GRADOS ROSAS', 'DIEGO JESUS', 'GRADOS', 'ROSAS', null, 'dgrados-02438', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1980', '28', '3', '02439', '02439', 'ELIZABETH LOPEZ RICARDI', 'ELIZABETH', 'LOPEZ', 'RICARDI', null, 'elopez-02439', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1981', '28', '3', '02441', '02441', 'SHARON MISHELL MELGAR LAJO', 'SHARON MISHELL', 'MELGAR', 'LAJO', null, 'smelgar-02441', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1982', '16', '3', '02443', '02443', 'ANNELIE ELIZABETH MORILLO ELIAS', 'ANNELIE ELIZABETH', 'MORILLO', 'ELIAS', null, 'amorillo-02443', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1983', '39', '3', '02445', '02445', 'GRETTEL MILAGROS CARHUAYO PEÃ‘A', 'GRETTEL MILAGROS', 'CARHUAYO', 'PEÃ‘A', null, 'gcarhuayo-02445', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1984', '29', '3', '02450', '02450', 'KIMBERLY SABINA MEDINA CANALES', 'KIMBERLY SABINA', 'MEDINA', 'CANALES', null, 'kmedina-02450', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1985', '29', '3', '02451', '02451', 'CLAUDIA MARICIELO YACO MAMANI', 'CLAUDIA MARICIELO', 'YACO', 'MAMANI', null, 'cyaco-02451', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1986', '31', '3', '02458', '02458', 'XENIA NATHALI CORONEL CASARIEGO', 'XENIA NATHALI', 'CORONEL', 'CASARIEGO', null, 'xcoronel-02458', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1987', '13', '3', '02460', '02460', 'JUAN DIEGO PACHECO SALAZAR', 'JUAN DIEGO', 'PACHECO', 'SALAZAR', null, 'jpacheco-02460', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1988', '10', '3', '02461', '02461', 'JOSELYN FABIOLA REYES LOPEZ', 'JOSELYN FABIOLA', 'REYES', 'LOPEZ', null, 'jreyes-02461', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1989', '32', '3', '02463', '02463', 'FIORELLA MERCEDES SUAREZ CRUZ', 'FIORELLA MERCEDES', 'SUAREZ', 'CRUZ', null, 'fsuarez-02463', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1990', '22', '3', '02465', '02465', 'CAROLINA SHERMINN GAMARRA ARCE', 'CAROLINA SHERMINN', 'GAMARRA', 'ARCE', null, 'cgamarra-02465', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1991', '10', '3', '02466', '02466', 'LOURDES SHIRLEY MURGA VILCA', 'LOURDES SHIRLEY', 'MURGA', 'VILCA', null, 'lmurga-02466', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1992', '21', '3', '02471', '02471', 'JESUS JEYSOM HIRPAHUANCA DUEÃ‘AS', 'JESUS JEYSOM', 'HIRPAHUANCA', 'DUEÃ‘AS', null, 'jhirpahuanca-02', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1993', '20', '3', '02472', '02472', 'FANNY SANCHEZ VASQUEZ', 'FANNY', 'SANCHEZ', 'VASQUEZ', null, 'fsanchez-02472', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1994', '2', '3', '02474', '02474', 'ERIKA PACHECO MENDOZA', 'ERIKA', 'PACHECO', 'MENDOZA', null, 'epacheco-02474', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1995', '22', '3', '02476', '02476', 'BOB ROBERT ALVARADO ECHEGARAY', 'BOB ROBERT', 'ALVARADO', 'ECHEGARAY', null, 'balvarado-02476', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1996', '28', '3', '02477', '02477', 'MISHELL PILAR FLORES CALLOAPAZA', 'MISHELL PILAR', 'FLORES', 'CALLOAPAZA', null, 'mflores-02477', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1997', '39', '3', '02478', '02478', 'ROLANDO RAUL RODAS RAMOS', 'ROLANDO RAUL', 'RODAS', 'RAMOS', null, 'rrodas-02478', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1998', '14', '3', '02480', '02480', 'LUIS EDUARDO CABANILLAS DEZA', 'LUIS EDUARDO', 'CABANILLAS', 'DEZA', null, 'lcabanillas-024', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('1999', '14', '3', '02481', '02481', 'STEPHANY LILY VERDEGUER JAUREGUI', 'STEPHANY LILY', 'VERDEGUER', 'JAUREGUI', null, 'sverdeguer-0248', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2000', '10', '3', '02483', '02483', 'CLAUDIA LIZETH COLOMA LAIMITO', 'CLAUDIA LIZETH', 'COLOMA', 'LAIMITO', null, 'ccoloma-02483', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2001', '15', '3', '02486', '02486', 'MARIELA STHEFANY MIRANDA ATOCHE', 'MARIELA STHEFANY', 'MIRANDA', 'ATOCHE', null, 'mmiranda-02486', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2002', '37', '3', '02487', '02487', 'LUIS MARTIN RIVERA MARILUZ', 'LUIS MARTIN', 'RIVERA', 'MARILUZ', null, 'lrivera-02487', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2003', '12', '3', '02488', '02488', 'CRISTHIAN ERICK CCOTO BATALLANOS', 'CRISTHIAN ERICK', 'CCOTO', 'BATALLANOS', null, 'cccoto-02488', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2004', '24', '3', '02489', '02489', 'JESSICA PIERINA SEGURA MORI', 'JESSICA PIERINA', 'SEGURA', 'MORI', null, 'jsegura-02489', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2005', '19', '3', '02490', '02490', 'JUAN JOSE FAILOC RODRIGUEZ', 'JUAN JOSE', 'FAILOC', 'RODRIGUEZ', null, 'jfailoc-02490', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2006', '36', '3', '02491', '02491', 'YESILYN RAYDA PALOMINO GARAY', 'YESILYN RAYDA', 'PALOMINO', 'GARAY', null, 'ypalomino-02491', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2007', '17', '3', '02492', '41259336', 'JAVIER TEODOCIO ROQUE ESPINOZA', 'JAVIER TEODOCIO', 'ROQUE', 'ESPINOZA', '', 'jroque-02492', '7c4a8d09ca3762af61e59520943dc26494f8941b', null, '0', null, null, 'act', '0000-00-00 00:00:00', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2008', '13', '3', '02493', '02493', 'JOHN RICHARD QUILLAS ASTUVILCA', 'JOHN RICHARD', 'QUILLAS', 'ASTUVILCA', null, 'jquillas-02493', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2009', '12', '3', '02495', '02495', 'MERCEDES VIRGINIA CABRERA CAMPOS', 'MERCEDES VIRGINIA', 'CABRERA', 'CAMPOS', null, 'mcabrera-02495', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2010', '19', '3', '02496', '02496', 'LIZBETH ESPERANZA SILVA MONTANO', 'LIZBETH ESPERANZA', 'SILVA', 'MONTANO', null, 'lsilva-02496', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2011', '19', '3', '02497', '02497', 'JOSSELYN YULIANA LARA ESCALANTE', 'JOSSELYN YULIANA', 'LARA', 'ESCALANTE', null, 'jlara-02497', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2012', '40', '3', '02498', '02498', 'KENNY JOHN SANCHEZ RUBINA', 'KENNY JOHN', 'SANCHEZ', 'RUBINA', null, 'ksanchez-02498', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2013', '40', '3', '02500', '02500', 'GLADIS PAOLA VELA GASPAR', 'GLADIS PAOLA', 'VELA', 'GASPAR', null, 'gvela-02500', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2014', '40', '3', '02501', '02501', 'KATHERINE YENNIFER PACHECO ESTEBAN', 'KATHERINE YENNIFER', 'PACHECO', 'ESTEBAN', null, 'kpacheco-02501', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2015', '31', '3', '02503', '02503', 'CLAUDIA PAOLA SEMINARIO TRELLES', 'CLAUDIA PAOLA', 'SEMINARIO', 'TRELLES', null, 'cseminario-0250', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2016', '31', '3', '02504', '02504', 'STEFANY VICTORIA LEON SERNAQUE', 'STEFANY VICTORIA', 'LEON', 'SERNAQUE', null, 'sleon-02504', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2017', '31', '3', '02507', '02507', 'CINTHIA GABRIELA GALVEZ GATTY', 'CINTHIA GABRIELA', 'GALVEZ', 'GATTY', null, 'cgalvez-02507', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2018', '31', '3', '02509', '02509', 'MARCO ANTONIO GUILLEN MORE', 'MARCO ANTONIO', 'GUILLEN', 'MORE', null, 'mguillen-02509', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2019', '19', '3', '02511', '02511', 'LIZANDRA XIOMARA FLORES QUIROZ', 'LIZANDRA XIOMARA', 'FLORES', 'QUIROZ', null, 'lflores-02511', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2020', '18', '3', '02514', '02514', 'MARIANA GUERE DIAZ', 'MARIANA', 'GUERE', 'DIAZ', null, 'mguere-02514', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2021', '12', '3', '02515', '02515', 'MARIA DEL ALIAGA BACA', 'MARIA DEL', 'ALIAGA', 'BACA', null, 'maliaga-02515', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2022', '40', '3', '02518', '02518', 'GERTHY SARETH MALPARTIDA QUISPE', 'GERTHY SARETH', 'MALPARTIDA', 'QUISPE', null, 'gmalpartida-025', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2023', '40', '3', '02519', '02519', 'MASSIEL ESTEFANY BERMUDEZ MORENO', 'MASSIEL ESTEFANY', 'BERMUDEZ', 'MORENO', null, 'mbermudez-02519', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2024', '22', '3', '02520', '02520', 'JORGE ANTONIO MORALES MORA', 'JORGE ANTONIO', 'MORALES', 'MORA', null, 'jmorales-02520', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2025', '22', '3', '02521', '02521', 'JOSE GASPAR TARAZONA BENITES', 'JOSE GASPAR', 'TARAZONA', 'BENITES', null, 'jtarazona-02521', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2026', '13', '3', '02522', '02522', 'JORGE SMITH HERRERA VALENZUELA', 'JORGE SMITH', 'HERRERA', 'VALENZUELA', null, 'jherrera-02522', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2027', '22', '3', '02523', '02523', 'KEYLA MILUSKA AYALA ALIAGA', 'KEYLA MILUSKA', 'AYALA', 'ALIAGA', null, 'kayala-02523', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2028', '10', '3', '02525', '02525', 'CELIA MILUSKA GARCIA MATELUNA', 'CELIA MILUSKA', 'GARCIA', 'MATELUNA', null, 'cgarcia-02525', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2029', '36', '3', '02529', '02529', 'CESAR ANTONIO JIMENEZ PALOMINO', 'CESAR ANTONIO', 'JIMENEZ', 'PALOMINO', null, 'cjimenez-02529', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2030', '16', '3', '02531', '02531', 'MARIA ALEJANDRA UBILLUS ESTRADA', 'MARIA ALEJANDRA', 'UBILLUS', 'ESTRADA', null, 'mubillus-02531', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2031', '31', '3', '02532', '02532', 'KATHERIN MILUSKA TELLO NEIRA', 'KATHERIN MILUSKA', 'TELLO', 'NEIRA', null, 'ktello-02532', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2032', '23', '3', '02533', '02533', 'CRISTIAN CIRILO HUAMAN TINEO', 'CRISTIAN CIRILO', 'HUAMAN', 'TINEO', null, 'chuaman-02533', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2033', '29', '3', '02534', '02534', 'YELIS IRELUI FLORES MONROY', 'YELIS IRELUI', 'FLORES', 'MONROY', null, 'yflores-02534', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2034', '36', '3', '02537', '02537', 'CONSUELO ELIZABETH GARCIA ORE', 'CONSUELO ELIZABETH', 'GARCIA', 'ORE', null, 'cgarcia-02537', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2035', '22', '3', '02538', '02538', 'CRISTIAN POOL QUISPE CORNELIO', 'CRISTIAN POOL', 'QUISPE', 'CORNELIO', null, 'cquispe-02538', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2036', '19', '1', '02540', '42680234', 'MARKO GONZALEZ DEL RIO', 'MARKO', 'GONZALEZ', 'DEL RIO', '', 'rgonzales-02540', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '0000-00-00 00:00:00', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2037', '19', '3', '02541', '02541', 'LUIS ALFREDO HUAMANI ALMENDRADES', 'LUIS ALFREDO', 'HUAMANI', 'ALMENDRADES', null, 'lhuamani-02541', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2038', '40', '3', '02542', '02542', 'RUDDY JHOJAN HIDALGO CASTAÃ‘EDA', 'RUDDY JHOJAN', 'HIDALGO', 'CASTAÃ‘EDA', null, 'rhidalgo-02542', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2039', '36', '3', '02543', '02543', 'EDUARDO CLEMENTE SANCHEZ CHIQUILLAN', 'EDUARDO CLEMENTE', 'SANCHEZ', 'CHIQUILLAN', null, 'esanchez-02543', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2040', '36', '3', '02544', '02544', 'LESLYE JAKELYNE CORZO PARIONA', 'LESLYE JAKELYNE', 'CORZO', 'PARIONA', null, 'lcorzo-02544', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2041', '19', '3', '02545', '02545', 'THALIA ELENA ORELLANA ADAUTO', 'THALIA ELENA', 'ORELLANA', 'ADAUTO', null, 'torellana-02545', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2042', '40', '3', '02546', '02546', 'ALFREDO MIGUEL GARAY ALVA', 'ALFREDO MIGUEL', 'GARAY', 'ALVA', null, 'agaray-02546', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2043', '18', '3', '02547', '02547', 'GRETGEN ASTRITH HUAMAN MENDOZA', 'GRETGEN ASTRITH', 'HUAMAN', 'MENDOZA', null, 'ghuaman-02547', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2044', '19', '3', '02549', '02549', 'MARCO ANTONIO MAYTA VILLAR', 'MARCO ANTONIO', 'MAYTA', 'VILLAR', null, 'mmayta-02549', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2045', '2', '3', '02551', '02551', 'KATTY AGUIRRE YERBA', 'KATTY', 'AGUIRRE', 'YERBA', null, 'kaguirre-02551', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2046', '10', '3', '02553', '02553', 'MIRIAM LORENA SIFUENTES MOTTA', 'MIRIAM LORENA', 'SIFUENTES', 'MOTTA', null, 'msifuentes-0255', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2047', '31', '3', '02554', '02554', 'MAX DUQUE BUSCAL', 'MAX', 'DUQUE', 'BUSCAL', null, 'mduque-02554', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2048', '39', '3', '02555', '02555', 'JOSE BRYAM TOLEDO HERNANDEZ', 'JOSE BRYAM', 'TOLEDO', 'HERNANDEZ', null, 'jtoledo-02555', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2049', '19', '3', '02556', '02556', 'LISSETE BEATRIZ DELGADO ROMERO', 'LISSETE BEATRIZ', 'DELGADO', 'ROMERO', null, 'ldelgado-02556', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2050', '19', '3', '02557', '02557', 'MAGDALENA STEPHANI GUADALUPE GONZALES', 'MAGDALENA STEPHANI', 'GUADALUPE', 'GONZALES', null, 'mguadalupe-0255', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2051', '19', '3', '02558', '02558', 'ALBERTO SANCHEZ RUPAY', 'ALBERTO', 'SANCHEZ', 'RUPAY', null, 'asanchez-02558', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2052', '20', '3', '02564', '02564', 'JANET YORKA CASTRO MODESTO', 'JANET YORKA', 'CASTRO', 'MODESTO', null, 'jcastro-02564', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2053', '29', '3', '02565', '02565', 'GABRIEL EDUARDO HERRERA TEJADA', 'GABRIEL EDUARDO', 'HERRERA', 'TEJADA', null, 'gherrera-02565', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2054', '29', '3', '02566', '02566', 'ALESSANDRA CECILIA SILVA LANCHIPA', 'ALESSANDRA CECILIA', 'SILVA', 'LANCHIPA', null, 'asilva-02566', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2055', '20', '3', '02567', '02567', 'BRAHAN  CRUZ HINOSTRAZA', 'BRAHAN ', 'CRUZ', 'HINOSTRAZA', null, 'bcruz-02567', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2056', '22', '3', '02568', '02568', 'MILAGROS DEL ANCHANTE REDHEAD', 'MILAGROS DEL', 'ANCHANTE', 'REDHEAD', null, 'manchante-02568', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2057', '22', '3', '02569', '02569', 'JOSEPH ALEXANDER MUÃ‘OZ DELGADO', 'JOSEPH ALEXANDER', 'MUÃ‘OZ', 'DELGADO', null, 'jmuã‘oz-02569', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2058', '21', '3', '02571', '02571', 'RICHAR ALEXANDER VALENCIA MAMANI', 'RICHAR ALEXANDER', 'VALENCIA', 'MAMANI', null, 'rvalencia-02571', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2059', '22', '3', '02572', '02572', 'GABRIELA LIZBEL GOMEZ PATRICIO', 'GABRIELA LIZBEL', 'GOMEZ', 'PATRICIO', null, 'ggomez-02572', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2060', '14', '3', '02573', '02573', 'ELSA JULISA VALLEJOS CATALAN', 'ELSA JULISA', 'VALLEJOS', 'CATALAN', null, 'evallejos-02573', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2061', '40', '3', '02574', '02574', 'MAOLY MORON RIOS', 'MAOLY', 'MORON', 'RIOS', null, 'mmoron-02574', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2062', '15', '3', '02575', '02575', 'SHEYLA ELIZABETH PRADO ROJAS', 'SHEYLA ELIZABETH', 'PRADO', 'ROJAS', null, 'sprado-02575', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2063', '36', '3', '02576', '02576', 'LISSET ELSY GALLARDO VIVAR', 'LISSET ELSY', 'GALLARDO', 'VIVAR', null, 'lgallardo-02576', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2064', '10', '3', '02577', '02577', 'IRIS SOLANGE PEREDO BARRON', 'IRIS SOLANGE', 'PEREDO', 'BARRON', null, 'iperedo-02577', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2065', '12', '3', '02578', '02578', 'JUAN MIGUEL CASTRO TORRES', 'JUAN MIGUEL', 'CASTRO', 'TORRES', null, 'jcastro-02578', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2066', '18', '3', '02580', '02580', 'JOEL CHICO GONZALES', 'JOEL', 'CHICO', 'GONZALES', null, 'jchico-02580', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2067', '18', '3', '02581', '02581', 'GIAN ANDRE SULCARAY CLEMENTE', 'GIAN ANDRE', 'SULCARAY', 'CLEMENTE', null, 'gsulcaray-02581', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2068', '21', '3', '02582', '02582', 'CLAY WIMNER MAZA MESTAS', 'CLAY WIMNER', 'MAZA', 'MESTAS', null, 'cmaza-02582', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2069', '14', '3', '02583', '02583', 'JOSE LUIS MONTENEGRO DUAREZ', 'JOSE LUIS', 'MONTENEGRO', 'DUAREZ', null, 'jmontenegro-025', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2070', '19', '3', '02584', '02584', 'LEO RODRIGUEZ YACTAYO', 'LEO', 'RODRIGUEZ', 'YACTAYO', null, 'lrodriguez-0258', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2071', '23', '3', '02585', '02585', 'JHONATAN ALEXANDER AVALOS GARCIA', 'JHONATAN ALEXANDER', 'AVALOS', 'GARCIA', null, 'javalos-02585', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2072', '10', '3', '02586', '02586', 'MISSY BRIGITTE PAUCAR HILARIO', 'MISSY BRIGITTE', 'PAUCAR', 'HILARIO', null, 'mpaucar-02586', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2073', '19', '3', '02587', '02587', 'JUNIOR LUYO PAUCAR', 'JUNIOR', 'LUYO', 'PAUCAR', null, 'jluyo-02587', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2074', '19', '3', '02588', '02588', 'MARIBEL ROCIO RIPAS HUAMANCHA', 'MARIBEL ROCIO', 'RIPAS', 'HUAMANCHA', null, 'mripas-02588', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2075', '14', '3', '02590', '02590', 'CARLOS OSCAR GONZALES GRADOS', 'CARLOS OSCAR', 'GONZALES', 'GRADOS', null, 'cgonzales-02590', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2076', '14', '3', '02591', '02591', 'MICHELLE LILY VILLACORTA GUEVARA', 'MICHELLE LILY', 'VILLACORTA', 'GUEVARA', null, 'mvillacorta-025', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2077', '18', '3', '02592', '02592', 'MELANI FIORELLA GUTIERREZ YUPANQUI', 'MELANI FIORELLA', 'GUTIERREZ', 'YUPANQUI', null, 'mgutierrez-0259', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2078', '18', '3', '02593', '02593', 'GERALDINE MARA LARRAZABAL POMA', 'GERALDINE MARA', 'LARRAZABAL', 'POMA', null, 'glarrazabal-025', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2079', '22', '3', '02594', '02594', 'WILLIAM FELIX TORRES MUÃ‘OZ', 'WILLIAM FELIX', 'TORRES', 'MUÃ‘OZ', null, 'wtorres-02594', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2080', '29', '3', '02596', '02596', 'BRENDA KELLY ESPINOZA CUENTAS', 'BRENDA KELLY', 'ESPINOZA', 'CUENTAS', null, 'bespinoza-02596', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2081', '39', '3', '02597', '02597', 'MARJHORIE STEFANY BAIOCCHI ROSAS', 'MARJHORIE STEFANY', 'BAIOCCHI', 'ROSAS', null, 'mbaiocchi-02597', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2082', '39', '3', '02598', '02598', 'SARIAH KATHLENE QUISPE FALCON', 'SARIAH KATHLENE', 'QUISPE', 'FALCON', null, 'squispe-02598', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2083', '40', '3', '02600', '02600', 'ISABEL ROSALIA JARA PLACIDO', 'ISABEL ROSALIA', 'JARA', 'PLACIDO', null, 'ijara-02600', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2084', '28', '3', '02601', '02601', 'VELIA ALEXANDRA URVIOLA ARAGON', 'VELIA ALEXANDRA', 'URVIOLA', 'ARAGON', null, 'vurviola-02601', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2085', '40', '3', '02602', '02602', 'VLADIMIR ERICK CABANILLAS ROSAS', 'VLADIMIR ERICK', 'CABANILLAS', 'ROSAS', null, 'vcabanillas-026', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2086', '17', '3', '02603', '02603', 'JHON EDWIN TAPIA BRONCALES', 'JHON EDWIN', 'TAPIA', 'BRONCALES', null, 'jtapia-02603', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2087', '4', '3', '02605', '02605', 'ALVARO GIOVANNI VILLALOBOS ARBAÃ‘IL', 'ALVARO GIOVANNI', 'VILLALOBOS', 'ARBAÃ‘IL', null, 'avillalobos-026', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2088', '13', '3', '02606', '02606', 'ARELY STEPHANY ROBLES MARCELO', 'ARELY STEPHANY', 'ROBLES', 'MARCELO', null, 'arobles-02606', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2089', '17', '3', '02607', '02607', 'CRISTHIAN ANIBAL SAENZ BOÃ‘ON', 'CRISTHIAN ANIBAL', 'SAENZ', 'BOÃ‘ON', null, 'csaenz-02607', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2090', '10', '3', '02608', '02608', 'LUZ FERNANDA ARTEAGA BUSTAMANTE', 'LUZ FERNANDA', 'ARTEAGA', 'BUSTAMANTE', null, 'larteaga-02608', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2091', '20', '3', '02609', '02609', 'MADELENN ROSSE CASTRO BRAVO', 'MADELENN ROSSE', 'CASTRO', 'BRAVO', null, 'mcastro-02609', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2092', '22', '3', '02611', '02611', 'ALAN JESUS DIAZ NUÃ‘EZ', 'ALAN JESUS', 'DIAZ', 'NUÃ‘EZ', null, 'adiaz-02611', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2093', '13', '3', '02612', '02612', 'JOSEPH WILLIAMS VALVERDE ALIAGA', 'JOSEPH WILLIAMS', 'VALVERDE', 'ALIAGA', null, 'jvalverde-02612', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2094', '29', '3', '02613', '02613', 'VILMA MAMANI CONDORI', 'VILMA', 'MAMANI', 'CONDORI', null, 'vmamani-02613', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2095', '19', '3', '02614', '02614', 'LEIDY BERTHA LOPEZ PARICAHUA', 'LEIDY BERTHA', 'LOPEZ', 'PARICAHUA', null, 'llopez-02614', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2096', '29', '3', '02617', '02617', 'JESSICA ALEXANDRA OBANDO SILVA', 'JESSICA ALEXANDRA', 'OBANDO', 'SILVA', null, 'jobando-02617', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2097', '10', '3', '02618', '02618', 'LA CRUZ ROCA DE', 'LA CRUZ', 'ROCA', 'DE', null, 'lroca-02618', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2098', '10', '3', '02619', '02619', 'ARIADNA GRAZYE YALICO MEZA', 'ARIADNA GRAZYE', 'YALICO', 'MEZA', null, 'ayalico-02619', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2099', '22', '3', '02620', '02620', 'SUSAN STEPHANY MORI ARZAPALO', 'SUSAN STEPHANY', 'MORI', 'ARZAPALO', null, 'smori-02620', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2100', '22', '3', '02621', '02621', 'JEAN PIERRE O`BRIEN BAIOCCHI', 'JEAN PIERRE', 'O`BRIEN', 'BAIOCCHI', null, 'jo`brien-02621', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2101', '12', '3', '02623', '02623', 'MARIANA DANIELA GUZMAN BARRIONUEVO', 'MARIANA DANIELA', 'GUZMAN', 'BARRIONUEVO', null, 'mguzman-02623', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2102', '12', '3', '02624', '02624', 'OSWALDO ANTHONY GALLEGOS VILCA', 'OSWALDO ANTHONY', 'GALLEGOS', 'VILCA', null, 'ogallegos-02624', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2103', '10', '3', '02625', '02625', 'JORGE ANDRES VILLANUEVA ARENAS', 'JORGE ANDRES', 'VILLANUEVA', 'ARENAS', null, 'jvillanueva-026', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2104', '31', '3', '02627', '02627', 'GERARDO MANUEL VALVERDE AVILA', 'GERARDO MANUEL', 'VALVERDE', 'AVILA', null, 'gvalverde-02627', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2105', '31', '3', '02628', '02628', 'GRACIA MERCEDES PALACIOS MONDRAGON', 'GRACIA MERCEDES', 'PALACIOS', 'MONDRAGON', null, 'gpalacios-02628', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2106', '31', '3', '02629', '02629', 'ANA BELEN TRELLES ROSADO', 'ANA BELEN', 'TRELLES', 'ROSADO', null, 'atrelles-02629', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2107', '31', '3', '02630', '02630', 'GLORIA DANIELA MEJIA AZCARATE', 'GLORIA DANIELA', 'MEJIA', 'AZCARATE', null, 'gmejia-02630', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2108', '31', '3', '02631', '02631', 'LUCRECIA MARIBEL CASTILLO RUIZ', 'LUCRECIA MARIBEL', 'CASTILLO', 'RUIZ', null, 'lcastillo-02631', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2109', '19', '3', '02632', '02632', 'WENDY LUCIA PAREDES PLASENCIA', 'WENDY LUCIA', 'PAREDES', 'PLASENCIA', null, 'wparedes-02632', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2110', '19', '3', '02633', '02633', 'IRDWIN ANDRES MEJIA URBINA', 'IRDWIN ANDRES', 'MEJIA', 'URBINA', null, 'imejia-02633', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2111', '19', '3', '02634', '02634', 'ANDREA ELIZABETH GODEFROY MASCARO', 'ANDREA ELIZABETH', 'GODEFROY', 'MASCARO', null, 'agodefroy-02634', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2112', '12', '3', '02636', '02636', 'NATALIA BEATRIZ POVIS CHAVEZ', 'NATALIA BEATRIZ', 'POVIS', 'CHAVEZ', null, 'npovis-02636', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2113', '10', '3', '02637', '02637', 'ROSARIO NATALIA GARCIA REYES', 'ROSARIO NATALIA', 'GARCIA', 'REYES', null, 'rgarcia-02637', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2114', '29', '3', '02638', '02638', 'YELVY DUCELY CECENARRO HUARACALLO', 'YELVY DUCELY', 'CECENARRO', 'HUARACALLO', null, 'ycecenarro-0263', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2115', '29', '3', '02639', '02639', 'YULEYSHI NAYSHA PINTO VILCA', 'YULEYSHI NAYSHA', 'PINTO', 'VILCA', null, 'ypinto-02639', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2116', '18', '3', '02640', '02640', 'FRANCOIS ARCHENTI VERASTEGUI', 'FRANCOIS', 'ARCHENTI', 'VERASTEGUI', null, 'farchenti-02640', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2117', '10', '3', '02641', '02641', 'BRAYAN BRANDON GUARNIZ HERRERA', 'BRAYAN BRANDON', 'GUARNIZ', 'HERRERA', null, 'bguarniz-02641', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2118', '10', '3', '02642', '02642', 'ADRIANA DALIZ REQUEJO LARA', 'ADRIANA DALIZ', 'REQUEJO', 'LARA', null, 'arequejo-02642', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2119', '39', '3', '02643', '02643', 'CINTHIA FABIOLA QUISPE APARCANA', 'CINTHIA FABIOLA', 'QUISPE', 'APARCANA', null, 'cquispe-02643', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2120', '39', '3', '02644', '02644', 'SOLANGE ZOBEIDA CUEVA GALLEGOS', 'SOLANGE ZOBEIDA', 'CUEVA', 'GALLEGOS', null, 'scueva-02644', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2121', '39', '3', '02645', '02645', 'GABRIELA ISABEL PAICO MIO', 'GABRIELA ISABEL', 'PAICO', 'MIO', null, 'gpaico-02645', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2122', '12', '3', '02646', '02646', 'BRENDA SAMANTHA RODRIGUEZ ESPINOZA', 'BRENDA SAMANTHA', 'RODRIGUEZ', 'ESPINOZA', null, 'brodriguez-0264', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2123', '13', '3', '02647', '02647', 'DANITZA XIOMARA CASTRO ASTUHUAMAN', 'DANITZA XIOMARA', 'CASTRO', 'ASTUHUAMAN', null, 'dcastro-02647', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2124', '10', '3', '02648', '02648', 'JESSICA KATHERINE CHAMBA CALLE', 'JESSICA KATHERINE', 'CHAMBA', 'CALLE', null, 'jchamba-02648', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2125', '20', '3', '1799', '1799', 'STEFFI MAGGI ROMERO ORTIZ', 'STEFFI MAGGI', 'ROMERO', 'ORTIZ', null, 'sromero-1799', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2126', '21', '3', '02042', '02042', 'PETER JESUS ZEGARRA CARDENAS', 'PETER JESUS', 'ZEGARRA', 'CARDENAS', null, 'pzegarra-02042', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2127', '15', '3', '02122', '02122', 'ALDO WILFREDO CASTRO GARCIA', 'ALDO WILFREDO', 'CASTRO', 'GARCIA', null, 'acastro-02122', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2128', '21', '3', '02216', '02216', 'LUIS MATEO HUAPAYA', 'LUIS', 'MATEO', 'HUAPAYA', null, 'lmateo-02216', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2129', '12', '3', '02227', '02227', 'TITO MEONO SANDOVAL', 'TITO', 'MEONO', 'SANDOVAL', null, 'tmeono-02227', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2130', '19', '3', '02333', '02333', 'JOSUE HUAÃ‘A ESPERME', 'JOSUE', 'HUAÃ‘A', 'ESPERME', null, 'jhuaã‘a-02333', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2131', '19', '3', '02459', '02459', 'ALEJANDRO JHONATAN MONTANO LEON', 'ALEJANDRO JHONATAN', 'MONTANO', 'LEON', null, 'amontano-02459', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2132', '21', '3', '02530', '02530', 'OSWALDO RODRIGUEZ CATACORA', 'OSWALDO', 'RODRIGUEZ', 'CATACORA', null, 'orodriguez-0253', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
INSERT INTO `hpl_user` VALUES ('2133', '40', '3', '02604', '02604', 'JOE HUMBERTO LUCAS PRUDENCIO', 'JOE HUMBERTO', 'LUCAS', 'PRUDENCIO', null, 'jlucas-02604', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
