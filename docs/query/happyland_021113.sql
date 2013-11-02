/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : happyland

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-11-02 15:45:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hpl_daily_sales
-- ----------------------------
DROP TABLE IF EXISTS `hpl_daily_sales`;
CREATE TABLE `hpl_daily_sales` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_daily_sales
-- ----------------------------

-- ----------------------------
-- Table structure for hpl_daily_sales_detail
-- ----------------------------
DROP TABLE IF EXISTS `hpl_daily_sales_detail`;
CREATE TABLE `hpl_daily_sales_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `daily_sales_id` int(10) NOT NULL,
  `subsidiaries_id` int(10) DEFAULT NULL,
  `operator_id` int(10) NOT NULL,
  `type_of_entry` int(11) NOT NULL DEFAULT '1',
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
  KEY `fk_hpl_daily_sales_detail_hpl_subsidiaries1_idx` (`subsidiaries_id`),
  CONSTRAINT `fk_hpl_daily_sales_detail_hpl_daily_sales1` FOREIGN KEY (`daily_sales_id`) REFERENCES `hpl_daily_sales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hpl_daily_sales_detail_hpl_subsidiaries1` FOREIGN KEY (`subsidiaries_id`) REFERENCES `hpl_subsidiaries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_daily_sales_detail
-- ----------------------------

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
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hpl_module_hpl_module1_idx` (`parent_id`),
  CONSTRAINT `fk_hpl_module_hpl_module1` FOREIGN KEY (`parent_id`) REFERENCES `hpl_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_module
-- ----------------------------
INSERT INTO `hpl_module` VALUES ('1', null, 'Ventas Diarias', '', null, '0', '0', 'act', '2013-10-25 13:01:11', '0', null, null);
INSERT INTO `hpl_module` VALUES ('2', '1', 'Listado de Ventas Diarias', '', null, '0', '0', 'act', '2013-10-25 13:02:24', '0', null, null);
INSERT INTO `hpl_module` VALUES ('3', '1', 'Registrar Venta Diaria', '', null, '0', '0', 'act', '2013-10-25 13:02:40', '0', null, null);
INSERT INTO `hpl_module` VALUES ('4', null, 'Usuarios', '', null, '0', '0', 'act', '2013-10-25 14:07:13', '0', null, null);
INSERT INTO `hpl_module` VALUES ('5', '4', 'Listado de Usuarios', '', null, '0', '0', 'act', '2013-10-25 14:07:18', '0', null, null);
INSERT INTO `hpl_module` VALUES ('6', '4', 'Agregar Usuario', '', null, '0', '0', 'act', '2013-10-25 14:07:24', '0', null, null);
INSERT INTO `hpl_module` VALUES ('7', '4', 'Modificar Usuario', '', null, '0', '0', 'act', '2013-10-25 14:07:30', '0', null, null);
INSERT INTO `hpl_module` VALUES ('8', null, 'Perfiles', '', null, '0', '0', 'act', '2013-10-25 14:07:56', '0', null, null);
INSERT INTO `hpl_module` VALUES ('9', null, 'Listado de Perfiles', '', null, '0', '0', 'act', '2013-10-25 14:08:01', '0', null, null);
INSERT INTO `hpl_module` VALUES ('10', '9', 'Agregar Perfil', '', null, '0', '0', 'act', '2013-10-25 14:08:04', '0', null, null);
INSERT INTO `hpl_module` VALUES ('11', '9', 'Modificar Perfil', '', null, '0', '0', 'act', '2013-10-25 14:08:08', '0', null, null);

-- ----------------------------
-- Table structure for hpl_profile
-- ----------------------------
DROP TABLE IF EXISTS `hpl_profile`;
CREATE TABLE `hpl_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla perfiles de usuario',
  `name` varchar(50) NOT NULL,
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_profile
-- ----------------------------
INSERT INTO `hpl_profile` VALUES ('1', 'Administrador de Local', 'act', '0', '2013-10-25 11:44:38', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('2', 'Administrador del Sistema', 'act', '0', '2013-10-25 14:23:56', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('3', 'Operador', 'act', '0', '2013-10-25 14:24:00', '0', null, null);
INSERT INTO `hpl_profile` VALUES ('6', '', 'act', '0', '2013-10-25 17:25:03', '0', null, null);

-- ----------------------------
-- Table structure for hpl_profile_access
-- ----------------------------
DROP TABLE IF EXISTS `hpl_profile_access`;
CREATE TABLE `hpl_profile_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `profile_id` int(10) NOT NULL,
  `read` int(11) DEFAULT NULL,
  `write` int(11) DEFAULT NULL,
  `total_access` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`module_id`),
  KEY `fk_hpl_profile_access_hpl_profile1_idx` (`profile_id`),
  KEY `fk_hpl_profile_access_hpl_module1_idx` (`module_id`),
  CONSTRAINT `fk_hpl_profile_access_hpl_module1` FOREIGN KEY (`module_id`) REFERENCES `hpl_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hpl_profile_access_hpl_profile1` FOREIGN KEY (`profile_id`) REFERENCES `hpl_profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_profile_access
-- ----------------------------

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
-- Records of hpl_subsidiaries
-- ----------------------------
INSERT INTO `hpl_subsidiaries` VALUES ('2', null, 'CONTABILIDAD', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('3', null, 'OPERACIONES', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('4', null, 'LOGISTICA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('6', null, 'SISTEMAS', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('7', null, 'RECURSOS HUMANOS', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('8', null, 'MARKETING', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('9', null, 'ARQUITECTURA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('10', null, 'JOCKEY', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('12', null, 'BELLAVISTA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('13', null, 'PASCANA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('14', null, 'TRUJILLO', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('15', null, 'CHICLAYO', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('16', null, 'PIURA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('17', null, 'CAJAMARCA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('18', null, 'HUANCAYO', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('19', null, 'PLAZA NORTE', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('20', null, 'SANTA CLARA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('21', null, 'MANTENIMIENTO', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('22', null, 'CENTRO CIVICO', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('23', null, 'STRIP CENTER', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('24', null, 'PRO', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('25', null, 'PROYECTOS', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('28', null, 'AREQUIPA REAL', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('29', null, 'AREQUIPA MALL', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('30', null, 'CHIMBOTE', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('31', null, 'PIURA 2', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('32', null, 'REAL CHORRILLOS', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('33', null, 'CONTROL DE GESTION', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('35', null, 'PIURA MINKA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('36', null, 'SANTA ANITA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('37', null, 'TESORERIA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('38', null, 'ADMINISTRACION', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('39', null, 'ICA', 'act', '0', '2013-10-25 11:22:24', '0', null, null);
INSERT INTO `hpl_subsidiaries` VALUES ('40', null, 'HUANUCO', 'act', '0', '2013-10-25 11:22:24', '0', null, null);

-- ----------------------------
-- Table structure for hpl_type_of_sales
-- ----------------------------
DROP TABLE IF EXISTS `hpl_type_of_sales`;
CREATE TABLE `hpl_type_of_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subsidiaries_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `position_order` int(11) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(3) NOT NULL DEFAULT 'act',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_hpl_type_of_sales_hpl_subsidiaries1_idx` (`subsidiaries_id`),
  CONSTRAINT `fk_hpl_type_of_sales_hpl_subsidiaries1` FOREIGN KEY (`subsidiaries_id`) REFERENCES `hpl_subsidiaries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hpl_type_of_sales
-- ----------------------------
INSERT INTO `hpl_type_of_sales` VALUES ('1', null, 'Boleta', null, '1', '0', 'act', '2013-10-30 18:02:50', '1', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('2', null, 'Factura', null, '2', '0', 'act', '2013-10-30 18:02:53', '1', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('3', null, 'Venta Satélites', null, '3', '0', 'act', '2013-10-30 18:03:40', '1', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('4', null, 'Venta Zippers', null, '1', '0', 'act', '2013-10-30 18:04:12', '0', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('5', null, 'Cumpleaños (Venta de Contratos)', null, '1', '0', 'act', '2013-10-30 18:04:23', '0', null, null);
INSERT INTO `hpl_type_of_sales` VALUES ('6', null, 'Diferencia de Cajero', null, '1', '0', 'act', '2013-10-30 18:04:30', '0', null, null);

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
INSERT INTO `hpl_user` VALUES ('1601', '6', '3', '00001', '41259336', 'JOSE EDUARDO DEL ROSARIO RAMIREZ', 'JOSE EDUARDO', 'DEL ROSARIO', 'RAMIREZ', null, 'jdelrosario-000', 'db0f1692db526b1809a2dadb40a494738b144a56', '', '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
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
INSERT INTO `hpl_user` VALUES ('1743', '6', '3', '01531', '01531', 'DAVIS CLINTON SANTOS CAÃ‘ARI', 'DAVIS CLINTON', 'SANTOS', 'CAÃ‘ARI', null, 'dsantos-01531', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
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
INSERT INTO `hpl_user` VALUES ('2007', '6', '2', '02492', '02492', 'JAVIER TEODOCIO ROQUE ESPINOZA', 'JAVIER TEODOCIO', 'ROQUE', 'ESPINOZA', null, 'jroque-02492', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
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
INSERT INTO `hpl_user` VALUES ('2036', '6', '3', '02540', '02540', 'RIO MARKO GONZALES DEL', 'RIO MARKO', 'GONZALES', 'DEL', null, 'rgonzales-02540', 'db0f1692db526b1809a2dadb40a494738b144a56', null, '0', null, null, 'act', '2013-10-25 12:36:01', null, '0', '2013-10-25 12:36:01', '0', null, null);
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

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `cod_trab` varchar(10) DEFAULT NULL,
  `trabajdor` varchar(250) DEFAULT NULL,
  `local` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apaterno` varchar(50) DEFAULT NULL,
  `amaterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of temp
-- ----------------------------
INSERT INTO `temp` VALUES ('00001', 'DEL ROSARIO RAMIREZ JOSE EDUARDO', '06 : SISTEMAS', null, null, null);
INSERT INTO `temp` VALUES ('00016', 'BENAVIDES RODRIGUEZ CARLOS ALBERTO', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('00017', 'BERRIOS MESCUA RAUL ENRIQUE', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('00021', 'BURGOS HUANCA NELSON EDWIN', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('00024', 'CARCHERI CORONEL ENRIQUE', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00026', 'CARDENAS TIPISMANA SELENITA LUPE', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('00027', 'CARLOS ROJAS JOHN ALBERTO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00035', 'DE LA TORRE JARA GEANCARLO ANDREE', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('00037', 'ECHEVARRIA RICALDI JOSEF NILTON', '21 :  MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('00038', 'ELIAS GUERRERO KARLA FIORELLA', '16 : PIURA', null, null, null);
INSERT INTO `temp` VALUES ('00039', 'ESPINOZA PALMA SILVIA MARIA', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('00045', 'CRISTOBAL FELIX DENIS MAURO', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('00047', 'GUANILO VALENCIA ANDRES MARTIN', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('00050', 'HERRERA ZEÑA FEDERICO ALONSO', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('00052', 'JAUREGUI SANDOVAL JORGE FORTUNATO', '21 :  MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('00055', 'LOAYZA TIPISMANA LAURA SUJEY', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('00063', 'MATIAS AGUILAR INDIRA NATHALY', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('00077', 'PARISI ALVAREZ ROMELIA ROMANINA ROMA', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('00078', 'PERALTA CIGUEÑAS ALEXANDER GUILLERMO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00082', 'PORTAL CHALAN JORGE LUIS', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('00084', 'QUILCA CARRION JOSMELL IVAN', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('00091', 'RIVERA VIDAL JAVIER ANTHONY', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('00098', 'ROMAN ALDEA SERGIO CESAR', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('00108', 'SEGERSBOL SALOMON NIELS JONATHAN', '03 : OPERACIONES', null, null, null);
INSERT INTO `temp` VALUES ('00122', 'UBILLUS FLORES OSCAR ALBERTO', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('00123', 'VALDERRAMA LUJAN RODOLFO CHRISTOPHER', '03 : OPERACIONES', null, null, null);
INSERT INTO `temp` VALUES ('00124', 'VALLADOLID VALLADOLID RANDY RAFAEL', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('00130', 'VILCA RIMACHE WILMER', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('00157', 'TRINIDAD AMARILLO JOSAPHAT', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('00158', 'CASO MALDONADO JEAN SERAFIN', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('00159', 'ALANYA VILCA JOEL OSCAR', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('00165', 'ARCE GONZALES CESAR MIGUEL', '33 : CONTROL DE GESTION', null, null, null);
INSERT INTO `temp` VALUES ('00205', 'HUESEMBER IRARICA ORINSON', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('00224', 'SALCEDO ULLOA TOÑO GREGORIO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('00238', 'LUCERO ALARCON PAUL LEONARDO', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('00243', 'SALAS RAMOS JOSE VICENTE', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('00245', 'PONCE VALLADARES EDWIN ALFONZO', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('00246', 'FERNANDEZ CAIPO CYNTHIA MARIANA', '08 : MARKETING', null, null, null);
INSERT INTO `temp` VALUES ('00255', 'CALDERON VASQUEZ FARDY', '06 : SISTEMAS', null, null, null);
INSERT INTO `temp` VALUES ('00269', 'RAMOS PEREZ GISELLA', '23 : STRIP CENTER', null, null, null);
INSERT INTO `temp` VALUES ('00314', 'ALCOCER TAPIA SARA KATHERINE', '08 : MARKETING', null, null, null);
INSERT INTO `temp` VALUES ('00325', 'ZAPATA FERNANDEZ ANGHELLO ARMANDO', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('00337', 'SOTO RIVERA LUIS ENRIQUE', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('00358', 'GONZALES ARTEAGA YESENIA ABIGAIL', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('00383', 'PAREDES MORENO NIXTON RUIZ', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('00384', 'QUITO POLO OSCAR ANDRES', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('00406', 'MESONES SOUSA GERMAN', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00410', 'GUILLENA BURGA KEVIN DAVID', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00412', 'MONDRAGON AURAZO GISSELLY', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00420', 'LOAYZA TRONCOS ARCESIO ALEJANDRO', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('00422', 'AMAYA RUIZ JUAN GUSTAVO', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('00426', 'RIVADENEYRA OBLITAS JHOANA CAROLINA', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00427', 'PEREZ CARRANZA CRISTHIAN ERIK', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00430', 'CHERO CASIANO GABRIEL OMAR', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('00506', 'CHAVEZ URBINA VICTOR JOSE', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('00513', 'MALLQUI JANAMPA MIRIAN', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('00535', 'SICHA PEREZ GABRIEL GERARDO', '21 :  MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('00547', 'CHAVEZ MOROCCO BRUNO', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('00549', 'NUÑEZ CENTTY ADRIAN LEOPOLDO', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('00552', 'PASACHE SOLANO CARLA PAOLA', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('00560', 'BAZALAR MENDOZA RONALD RAUL', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('00585', 'CORDOVA IMAN CARLOS EDINSON', '16 : PIURA', null, null, null);
INSERT INTO `temp` VALUES ('00613', 'ARAGON CABALLERO WENDOLY', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('00617', 'RUIZ RIOS GUSTAVO ADOLFO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00684', 'PEREZ ALBARRAN MERVIN ADRIAN', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('00704', 'VELARDE BERNEDO RENSO LUIS', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('00705', 'VASQUEZ ALLASI JOHANN POOL', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('00725', 'VILCA ISLA KATHERINE ELIZABETH', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('00761', 'PRIETO REAÑO LUIS IVAN', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('00778', 'GOMEZ CLAVIJO DIANA RUBI', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('00795', 'MIRANDA MONTIEL BRIGGITTE STHEFANI', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00801', 'VASQUEZ PEREGRINO OMAR', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00804', 'GONZALES FERNANDEZ RICARDO', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('00815', 'PINTADO RIVERA JESUS ABIGAIL', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('00820', 'NOBLECILLA RUIZ ALEX XAVIER', '35 : PIURA MINKA', null, null, null);
INSERT INTO `temp` VALUES ('00833', 'CATUNTA NEYRA LILIANA MARLENI', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('00841', 'ODAR NECIOSUP ABNER JEFFERSON', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('00842', 'SAENZ DURAND JHACK CESAR', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('00854', 'CAMPOS TELLO CAROLINA ALEJANDRINA', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('00868', 'PALACIOS SERNAQUE MISAEL', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('00878', 'ZAPATA RODRIGUEZ CESAR AUGUSTO', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('00883', 'NAVEDA RISCO KARIN CLAUDIA', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('00899', 'MEZA VERASTEGUI ANDREA YESENIA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('00910', 'SOTOMAYOR LOPEZ DIANA CAROLINA', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('00925', 'CABEZAS BALTA CINTHIA DEBORA', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('00949', 'PINEDA SUAREZ DIEGO ARTURO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('00995', 'CUZCANO QUISPE ARTURO ITALO', '36 :  SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('00998', 'LINARES MARTINEZ MARYORI LIZ', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01006', 'VARGAS CUSTODIO AUGUSTO VALENTINO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01012', 'ELEUTERIO OLORTEGUI ESMERALDA', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('01016', 'GRADOS LEON ELI DAVID', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('01024', 'CHAUCAS RIVERA BENNY JOE', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('01033', 'FLORES PACHERRES CLARA LAURA', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('01049', 'MEZA MANCO MARTHA MERCEDES', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('01058', 'AYTE LIMA MARIELA', '29 :  AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01061', 'CHAVEZ CERNA VIVIAN FIORELLA', '37 : TESORERIA', null, null, null);
INSERT INTO `temp` VALUES ('01067', 'PARI NEYRA FIORELLA ROCIO', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01105', 'MEDINA ALVAN MARCOS FRANKLIN ANTONIO', '03 : OPERACIONES', null, null, null);
INSERT INTO `temp` VALUES ('01124', 'CARDENAS ARRASCO MARIA GRAZIA PATRICIA', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01128', 'ALZAMORA PACUTAYPE IRMA ROSA', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('01145', 'SOTO ESPINOZA ADAN ANTONIO', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('01158', 'MEZA CASTILLO CESAR EDUARDO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01192', 'MARTINEZ CARMEN JULIO CESAR', '31 :  PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('01198', 'ROMERO VALDERRAMA DENILSON ALDAIR', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('01230', 'OROPEZA ANGELES DANIKA LOURDES JHAZMIN', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('01275', 'GUTIERREZ   EDUARDO MARCIAL', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('01277', 'RUFINO PANTA MILTON CESAR', '09 : ARQUITECTURA', null, null, null);
INSERT INTO `temp` VALUES ('01290', 'NORIEGA LLONTO LUIS ALEJANDRO', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('01303', 'CAMPOS CABRERA PAUL MICHELL', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01331', 'QUISPE MENENDES MOISES', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('01345', 'RIVERA DE LA CRUZ ERICK CLAUDIO', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('01346', 'ORTIZ ARMENDARIZ ZHANDALY SALOME', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('01350', 'URQUIZO ALEJOS JOSE ALONSO', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('01355', 'ALFARO RODRIGUEZ DANIEL ANGELO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01371', 'CORMAN OSORIO KEVIN', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01374', 'VERA GOMEZ GEENA STEFAN', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('01375', 'HERRERA ESCATE ENRIQUE ALBERTO', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('01383', 'VIZCARDO SALAZAR CARLOS GONZALO', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('01387', 'PONCE SANCHEZ LUIS JEAN CARLOS', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('01388', 'CABRERA BARRIOS JULIO OSCAR', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('01393', 'ARANDA CHUQUILLANQUI POOL FERNANDO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01399', 'CASTAÑEDA RAMOS ELIHAN', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01402', 'SAMANIEGO TAMAYO RICHARD JHON', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01408', 'SOLDEVILLA LA ROSA SANDRA PAOLA', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('01410', 'DURAND HUAPAYA LUIS MIGUEL', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01412', 'GOMEZ BRAVO JONATHAN WILMER', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('01416', 'CASTILLO ARANDA ANGEL IVAN', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01423', 'GONZALES PINTO MIGUEL ANGEL', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('01424', 'MARCOVICH BARRUETO JOHN EDISON', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('01425', 'CACERES GARRIDO MONICA LUCIA', '07 : RECURSOS HUMANOS', null, null, null);
INSERT INTO `temp` VALUES ('01432', 'CHAÑI LAURA JUAN CHRISTIAN', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('01440', 'PALOMINO RUEDA YESSICA ROXANA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('01444', 'RAMIREZ LEVY CYNTHIA JAQUELINE', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('01445', 'URDANEGUI CROVETTO DANIEL', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01452', 'SISNIEGAS NORIEGA YESSICA FIORELLA', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('01463', 'LEON CONDE ARMANDO DAVID', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01471', 'CALERO LAZARO SINDAY PRESCILIA', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01474', 'YABAR BENITES MARCOS ANTONIO', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('01480', 'CONDOLO ZETA JOHN ANDERSON', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('01499', 'JULCA ESTELO DORIS', '38 : ADMINISTRACION', null, null, null);
INSERT INTO `temp` VALUES ('01504', 'ORTIZ VARGAS OMAYRA NADIR', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('01510', 'RUIZ MACEDA CHRIS JOANNA', '23 : STRIP CENTER', null, null, null);
INSERT INTO `temp` VALUES ('01531', 'SANTOS CAÑARI DAVIS CLINTON', '06 : SISTEMAS', null, null, null);
INSERT INTO `temp` VALUES ('01557', 'BARRIENTOS MALLMA JENNY ERIKA', '07 : RECURSOS HUMANOS', null, null, null);
INSERT INTO `temp` VALUES ('01565', 'AGAPITO PACHECO CRISTHIAN PAUL', '38 : ADMINISTRACION', null, null, null);
INSERT INTO `temp` VALUES ('01569', 'CARRERA OSPINO JUAN JOSE', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('01570', 'LIMAYMANTA MACHUCA CLEMENTE NOE', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01578', 'VIDAL REBATTA CYNTHIA STEPHANIE', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('01582', 'FLORES MENCHOLA JHONATAN LUISIN', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01583', 'SILVA RUBIO DAVID JAVIER', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01598', 'CALLE GARCIA PAUL FRANK', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01600', 'RISCO OCUPA WILSON ANTONIO', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('01622', 'SICHA MALDONADO FELIX', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01627', 'IZQUIERDO CHAUCA KATERINE EDITH', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('01629', 'LARREA OYARCE ALY LIZETH', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01630', 'QUILLATUPA ROJAS GERALDINNE ALEJANDRA', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('01635', 'ORMEÑO ENRIQUEZ KEILA SUELY', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('01637', 'MOLINA CENTENO GARY', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('01642', 'LINARES GARCIA LAURA LUZ', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01647', 'PASCUAL TRUJILLO GILBERTO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01660', 'CUBA BLANCAS LIDIA ESTHER', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('01677', 'PASTOR ZAVALETA CANDY YESENIA', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('01685', 'LIENDO RICKARD WALTER OMAR', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01700', 'TORRES PAHUACHO CHRISTIAN EDUARDO', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('01711', 'TAPIA MURILLO MARIA DEL PILAR', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('01713', 'PERCA GONZALES LUIS PAUL', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01714', 'JULCAPOMA USCO ANDRE ELOY', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('01718', 'COSAVALENTE VERGARA RENZO YAMIR', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('01719', 'MORENO HUAMAN KATHERINE LILIANA', '35 : PIURA MINKA', null, null, null);
INSERT INTO `temp` VALUES ('01726', 'NINAPAYTAN VARGAS IVONNE YESSENIA', '32 : REAL CHORRILLOS', null, null, null);
INSERT INTO `temp` VALUES ('01727', 'AGUADO HUACCHARAQUI TANIA ROSA', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('01729', 'HERNANDEZ HUANCA SAYDA ELITA', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('01732', 'CABEZAS LEON CAROL PAOLA', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('01744', 'ALEMAN ESTEVES CARLOS ENRIQUE', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('01747', 'ARROYO ARROYO FRANCIES JHOMPIER', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('01755', 'TRUJILLO TEJADA MELISSA IVONNE', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01762', 'LOPEZ LEON BETSABE', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('01770', 'GAMBOA CASTILLO JHONATAN EDICH', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('01771', 'HUAMAN ASTO HERLANDINA FLORA', '38 : ADMINISTRACION', null, null, null);
INSERT INTO `temp` VALUES ('01781', 'ESCARZA CHAVEZ ANAHY MARILIA', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('01787', 'TERRONES ALFARO NESTOR MIGUEL', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('01792', 'MEJIA SULLASI DANIELLA ROXANA', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('01794', 'SILVA REYES EVER JUNIOR', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('01801', 'SULCA PEREZ ANA LUCIA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('01809', 'NUÑEZ SANCHEZ MERY CRISTY', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('01811', 'LA CHIRA SANTA MARIA JAHIRO LEVI', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('01814', 'QUISPE TORRES RUDY', '07 : RECURSOS HUMANOS', null, null, null);
INSERT INTO `temp` VALUES ('01823', 'PUJALLA FRANCO GIANINA ELIZA ROSARIO', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('01825', 'MUÑOZ HERRERA MARIA YSABEL', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('01829', 'CARRASCO SOTOMAYOR VICTORIA LUZMILA', '32 : REAL CHORRILLOS', null, null, null);
INSERT INTO `temp` VALUES ('01834', 'GUERRA CHACALIAZA EDGAR', '07 : RECURSOS HUMANOS', null, null, null);
INSERT INTO `temp` VALUES ('01850', 'NAVARRO VILLENA STEFANNY DENNIS', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('01862', 'SUAREZ FREYRE JORGE ERNESTTO', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('01879', 'NAVARRO TITO CLAUDIA EDITH', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01897', 'ZELA CORIA LESLIE JANETH', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01898', 'AUBERT LLERENA MARJORIE NIKOL', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01906', 'RODRIGUEZ NAVA MARCOS RAUL', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('01909', 'NEIRA DE LA CRUZ VANESSA MASIEL', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('01911', 'VALLADARES BENTOCILLA DANIEL ALEXANDER', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01914', 'DURAND RAMIREZ ANGEL', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01916', 'VITA ORE KATIUSCA LUZ', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01919', 'VALDIVIANO MELGAREJO HENRY ALEX', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01920', 'CANALES SALDARRIAGA EDSON JOSUE', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('01926', 'ZELADA PUICON SHERIM LIZET', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('01929', 'OLIVERA ESPICHAN ENRIQUE AUGUSTO', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('01930', 'ESCALANTE ESPICHAN CYNTIA INES', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('01938', 'BEJAR VEGA UBALDO FABIO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('01942', 'FAUSTINO MUJICA NADDIA LUCIA', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('01945', 'AVELLANEDA ALANYA SUSAN EVELYN', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('01965', 'RODAS SANCHEZ GABI', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('01967', 'MARTOS TORRES SARA ZOILA', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('01974', 'ZEGARRA PAREDES ROSA ELVIRA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('01975', 'TORRES VELASQUEZ GLADYS', '32 : REAL CHORRILLOS', null, null, null);
INSERT INTO `temp` VALUES ('01977', 'ALAVE ALAVE CESAR ALEXANDER', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01979', 'SALAZAR ZAPANA LILIANA MARILYN', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('01983', 'SALGUERO LEON ANGEL DE JESUS', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('01995', 'ROJAS MAZUELOS WELVID VALOIS', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02001', 'DEZA MORALES BRAYAN MIRSHA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02005', 'FERNANDEZ CALVAY CARLOS MAX ALFONSO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02016', 'MATIAS HURTADO FERNANDO MANUEL', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02019', 'ROSAS RIOJA NELLY ANNE JOANNA', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02031', 'VILCA MEZA JOSE', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02032', 'LAZARO CASTILLO ALEX JAVIER', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02034', 'TRISTAN GOMEZ ALEX EDWARD', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('02036', 'SILVERIO GENEBROZO EMELY MARNY', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02040', 'VILLAVICENCIO ANTUNEZ JORGE ENRIQUE', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('02045', 'MONTES UTOS JOSE JOEL', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02049', 'ARISTA LEIVA PERCY', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02051', 'REQUEJO BOLIVAR CLAUDIA VANNESA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02062', 'CHAFALOTE OBESO LILIANA ELIZABETH', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('02075', 'DIAZ DELGADO STEPHANIE', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02078', 'DIAZ ZULUETA YATACO ROSSELY CARMENJULIA', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('02090', 'MARTINEZ CANDELA CAROLIN LIDIA TERESA', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('02099', 'RIVAS GALARZA RENZO ARTURO', '37 : TESORERIA', null, null, null);
INSERT INTO `temp` VALUES ('02102', 'LINARES RUIZ HENRY JACKSON', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02103', 'GAMBOA CUNEO BRUNELLA ALESSANDRA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02107', 'PRADO FLORES KATHERIN MERCEDES', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02114', 'DURAND URIBE HAROLD ARTURO', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02115', 'LUJAN DE LA CRUZ WENDY STEPHANIE', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02119', 'ORTECHO CORNEJO BRIAN', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02121', 'ARIAS HIRPAHUANCA FRANK', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02124', 'VASQUEZ BUSTAMANTE MAYRA YUBEL', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02128', 'HERNANDEZ LOZADA ANYELO ROBERTO', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02130', 'LOZANO CORNEJO EDUARDO LUIS', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02131', 'GONZALES JESUS JHOANA JOSSELYN', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02132', 'FLORES VEGA ANA CRISTINA', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('02139', 'CENTENO GALINDO GEORGETTE ALEXANDRA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02143', 'AYALA ALARCON DIEGO AUGUSTO', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02148', 'HUAMAN TAIPE GERALDINE ESTEFANIA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02149', 'ROMERO ZAMORA MERCEDES PAMELA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02151', 'ARGOMEDO TORRES SANTOS MARIANA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02154', 'CAJA DURAN ELIDA MARIA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02156', 'GUILLEN COMUN LILIANA MARIBEL', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02160', 'PAREDES SALAZAR NORMA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02164', 'RAMIREZ QUISPE ROSSMERY JOANA', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02171', 'MUNDACA SIESQUEN NIEVES', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02172', 'TABOADA MIMBELA CLAUDIA', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02175', 'ZAMORA CASTILLO MILAGROS RUBI', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('02176', 'ROMERO AGUERO JORDAN JOEL', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('02178', 'OJEDA SANCHEZ JOSE LUIS', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02179', 'LOPEZ RODRIGUEZ ALEXANDRA LISBHET', '07 : RECURSOS HUMANOS', null, null, null);
INSERT INTO `temp` VALUES ('02180', 'GARAY GUERRA LUZ ANGELICA', '38 : ADMINISTRACION', null, null, null);
INSERT INTO `temp` VALUES ('02182', 'CONDORI FLORES CAROLAY MONSERRATT', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('02190', 'ANDIA CIPRIANO ALEJANDRA', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02191', 'FLORES PECAR ROXANA MILAGROS', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02192', 'AMARO GUEVARA DAYRO LEONARDO', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02193', 'PAREDES BEJARANO NADIA ANDREA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02200', 'MORALES SALINAS JUAN DANIEL', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02201', 'SALAS LA ROSA TORO KATHYA', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02204', 'RAZA CONDOR JOHAN KRANKL', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02206', 'VERGARA MIRANDA AURORA ESTEFANIA', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('02207', 'CANO CONDOR NICOLAS', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02210', 'QUINTANA ARRIETA JHONATAN PAUL', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02219', 'ARTEAGA CASTRO PAULO CESAR', '33 : CONTROL DE GESTION', null, null, null);
INSERT INTO `temp` VALUES ('02220', 'REYNA ACHULLA JUAN GREGORIO', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('02221', 'DE LA CRUZ CHUPAN KELY CHANY', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02222', 'RUEDA VILLAVICENCIO MILAGROS', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02225', 'VASQUEZ MANTARI GUADALUPE', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02229', 'LEON ACOSTA GINA INES', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02237', 'CHANAME GARCIA ELIANA ZULETTY', '08 : MARKETING', null, null, null);
INSERT INTO `temp` VALUES ('02241', 'COBOS SHUPINGAHUA GERALDYNE MELISSA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02248', 'SUNCION GOMEZ GRECIA MERITZELL', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02250', 'SURICHAQUI JAMJACHI JIMY RUBEN', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02255', 'MONGE VALLADARES LUCERO', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02257', 'LOPEZ HUALPA PIERRE FIDEL', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02258', 'DEL CARPIO PRADO KELVIN WITMAN', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02259', 'SAENZ ALVAREZ KATHERINE MARTHA', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02262', 'MIRANDA PANTIGOSO BRYAN WILSON', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02263', 'CASTILLO ESPINOZA EDUARDO JESUS', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02265', 'VILLENA GALARZA JHERIKA JHESMIN', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02268', 'SALAZAR SANCHEZ JHONNY ANTONIO VICENTE', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02269', 'ABANTO LOBATON CARLOS EDUARDO', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02272', 'TORRES CASTAÑEDA SAMANTHA NICOLLE', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('02278', 'YQUIAPAZA NARVAEZ JEINMY RANDY', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02283', 'ABANTO INGA JERSON RONALD', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('02286', 'TOCAS GIL LAURA RITA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02287', 'LUJAN APARCANA MANUEL FERNANDO', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02291', 'CAJACURI QUIÑON MIGUEL ANGEL', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02292', 'VENTURA POMA CARMEN', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02294', 'OSCCO MENESES MARIA CECILIA DEL ROSARIO', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02300', 'MORALES MENDOZA PEDRO JHERSON', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02301', 'ZAVALA REYMER HENRY HERNAN', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02303', 'LEON CHIPANA ALEJANDRO BRUCE LEE', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02307', 'MADARIAGA ORJEDA NATALIA ESTEFANIA', '08 : MARKETING', null, null, null);
INSERT INTO `temp` VALUES ('02311', 'CASTILLO SOLANO VICTOR JAVIER', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02313', 'ANTON REYNEL RAISA AIME', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02316', 'GALA CHAIÑA ANTHONY', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02317', 'GALINDO PRIVAT SHIRLEY MILENE', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02318', 'HOYOS AURAZO JAN FRANCO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02319', 'MINGUILLO RUBIO JUAN AUGUSTO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02321', 'CONTRERAS MONDRAGON CARLA', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02325', 'LANAZCA DE LA TORRE ANGELA MERCEDEZ', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02328', 'LEON NORIEGA MARIA ALEJANDRA', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('02331', 'RADAS NICOLL LUIS IVAN', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('02334', 'MASIAS PERALTA ABEL JOSUE', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('02336', 'MURQUIETIO YTUSACA ALVARO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02339', 'QUISPE ZARATE BRUCE LEONARD', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02340', 'LOZA CABREJOS DAYANNA DEL CARMEN', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02342', 'CALDAS ESCUDERO LETICIA EUMELIA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02346', 'PANTOJA BANDA HAROLD DENNIS', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02347', 'YANCE RIVERA JHONNY JEFFERSON', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02348', 'PEVEZ INFANTES STEFANY MAILYN', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02349', 'FALCON CORDOVA FABIOLA MILUSKA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02350', 'DIAZ MONTERO JORGE ESTEBAN', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('02351', 'AYORA LUCANA JONATHAN ROLANDO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02352', 'OYOLA NEYRA MAYRA ALEJANDRA', '30 : CHIMBOTE', null, null, null);
INSERT INTO `temp` VALUES ('02354', 'SOTO SANCHEZ ANDRES ORLANDO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02355', 'MELENDEZ CRUZ ERICSON MILTON', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02357', 'DE LUCIO LANDEO JOSE GIANFRANCO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02358', 'OTOYA BRIONES CAROL ROSSMERY', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02359', 'GUZMAN BURGOS JESUS ANGEL', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02360', 'VALDIVIA GUTIERREZ DAVID ENRIQUE', '03 : OPERACIONES', null, null, null);
INSERT INTO `temp` VALUES ('02361', 'GARCIA HURTADO MELANNIE STEFFI', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02364', 'NIÑO TEZEN ANGELICA LOURDES', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02366', 'ASANZA CASTRO CINTHIA LILIANA', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02368', 'FEBRE OLIVA LEYDI YASMIN', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02370', 'DEL VALLE CARLOS ALICIA', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02371', 'LUCAS LOAYZA MAYRA HELEN', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02372', 'MARTINEZ PRADO JOHN EDUARD', '07 : RECURSOS HUMANOS', null, null, null);
INSERT INTO `temp` VALUES ('02374', 'JEADA PALACIOS ROSARIO ESTEFANI', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02377', 'PEZO CACHIQUE EDITH ELIANA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02378', 'NEYRA TORRES RENATO FRANCO', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02379', 'VALERA TOLEDO JANETT DEL PILAR', '38 : ADMINISTRACION', null, null, null);
INSERT INTO `temp` VALUES ('02380', 'VELEZ DE VILLA FLORES ITALO DIEGO', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02384', 'CLARIANA SAAVEDRA JOEL ENRIQUE', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02386', 'POMAHUACRE DURAND HAYDEE CLARIZA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02387', 'SAAVEDRA LOPEZ JULIO CESAR', '25 : PROYECTOS', null, null, null);
INSERT INTO `temp` VALUES ('02388', 'PONCE DE LEON AVILA SELA ISABEL', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02390', 'YANAC ROMAN MARIA LUISA', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02391', 'GOMEZ GONZALES KATTERINE KAREN', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02392', 'VICENTE DIAZ ANAID DINA', '23 : STRIP CENTER', null, null, null);
INSERT INTO `temp` VALUES ('02395', 'EDUARDO VILLAGRA DIEGO DANIEL', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02397', 'BETETA MIGUEL ANGELICA MARIA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02400', 'PEÑA CAUSSO KATERIN ODALIS', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02401', 'VELARDE ROSALES BRYAM ELIEL', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02404', 'SERNA SANCHEZ LIZ MARINA', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02405', 'SIFUENTES ROSALES GIANCARLO', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02406', 'BAUTISTA VARGAS LIZBETH ADRIANA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02408', 'MORAN RODRIGUEZ JUAN DIEGO', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02409', 'PALOMINO CHUQUIBALA LAURA DE JESUS', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('02411', 'JUAREZ MATOS KELLY MIRELLA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02412', 'MARQUEZ TORRES ALEXANDER STEVE', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02413', 'VALDEZ CASAVILCA DIANA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02415', 'CABANILLAS ZACARIAS FREDY ALEXANDER', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02417', 'RUIZ DE CASTILLA MAGGI CARLOS EMILIO', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02418', 'IDROGO CABRERA JAIMMIE ZUHELLY', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02419', 'PEREDA CRIBILLEROS CLAUDIA GABRIELA DE MARIA', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02420', 'RUIZ ROBLES VALERIA REGINA', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02423', 'RODRIGUEZ SOLANO MARIA SOFIA', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('02425', 'OCHOA QUISPE DIANA CUSI', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02426', 'PARDEVE SOTO VICTOR JAIME', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02428', 'ROSAS ALBORNOZ HEIDY KATHIUSKA', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02429', 'COAGUILA TUNCAR CARINA', '32 : REAL CHORRILLOS', null, null, null);
INSERT INTO `temp` VALUES ('02430', 'ALARCON MORENO FLOR LUCERITO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02431', 'ESPINOZA FALCON JHASMIN YORIET', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02433', 'SALAZAR CHUNGA NICOLAS REYNALDO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02435', 'GONZALES DEL VALLE GANOZA RAMON RAFAEL', '20 :  SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02436', 'SILVA CONDORI DIANA ENMA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02438', 'GRADOS ROSAS DIEGO JESUS', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02439', 'LOPEZ RICARDI ELIZABETH', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02441', 'MELGAR LAJO SHARON MISHELL', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02443', 'MORILLO ELIAS ANNELIE ELIZABETH DE LOS ANGELES', '16 : PIURA', null, null, null);
INSERT INTO `temp` VALUES ('02445', 'CARHUAYO PEÑA GRETTEL MILAGROS', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02450', 'MEDINA CANALES KIMBERLY SABINA', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02451', 'YACO MAMANI CLAUDIA MARICIELO', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02458', 'CORONEL CASARIEGO XENIA NATHALI', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02460', 'PACHECO SALAZAR JUAN DIEGO', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('02461', 'REYES LOPEZ JOSELYN FABIOLA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02463', 'SUAREZ CRUZ FIORELLA MERCEDES', '32 : REAL CHORRILLOS', null, null, null);
INSERT INTO `temp` VALUES ('02465', 'GAMARRA ARCE CAROLINA SHERMINN', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02466', 'MURGA VILCA LOURDES SHIRLEY', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02471', 'HIRPAHUANCA DUEÑAS JESUS JEYSOM', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02472', 'SANCHEZ VASQUEZ FANNY', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02474', 'PACHECO MENDOZA ERIKA', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('02476', 'ALVARADO ECHEGARAY BOB ROBERT', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02477', 'FLORES CALLOAPAZA MISHELL PILAR', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02478', 'RODAS RAMOS ROLANDO RAUL', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02480', 'CABANILLAS DEZA LUIS EDUARDO', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02481', 'VERDEGUER JAUREGUI STEPHANY LILY', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02483', 'COLOMA LAIMITO CLAUDIA LIZETH', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02486', 'MIRANDA ATOCHE MARIELA STHEFANY', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02487', 'RIVERA MARILUZ LUIS MARTIN', '37 : TESORERIA', null, null, null);
INSERT INTO `temp` VALUES ('02488', 'CCOTO BATALLANOS CRISTHIAN ERICK', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02489', 'SEGURA MORI JESSICA PIERINA', '24 : PRO', null, null, null);
INSERT INTO `temp` VALUES ('02490', 'FAILOC RODRIGUEZ JUAN JOSE', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02491', 'PALOMINO GARAY YESILYN RAYDA', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02492', 'ROQUE ESPINOZA JAVIER TEODOCIO', '06 : SISTEMAS', null, null, null);
INSERT INTO `temp` VALUES ('02493', 'QUILLAS ASTUVILCA JOHN RICHARD', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('02495', 'CABRERA CAMPOS MERCEDES VIRGINIA', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02496', 'SILVA MONTANO LIZBETH ESPERANZA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02497', 'LARA ESCALANTE JOSSELYN YULIANA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02498', 'SANCHEZ RUBINA KENNY JOHN', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02500', 'VELA GASPAR GLADIS PAOLA', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02501', 'PACHECO ESTEBAN KATHERINE YENNIFER', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02503', 'SEMINARIO TRELLES CLAUDIA PAOLA', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02504', 'LEON SERNAQUE STEFANY VICTORIA', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02507', 'GALVEZ GATTY CINTHIA GABRIELA', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02509', 'GUILLEN MORE MARCO ANTONIO', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02511', 'FLORES QUIROZ LIZANDRA XIOMARA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02514', 'GUERE DIAZ MARIANA', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02515', 'ALIAGA BACA MARIA DEL PILAR', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02518', 'MALPARTIDA QUISPE GERTHY SARETH', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02519', 'BERMUDEZ MORENO MASSIEL ESTEFANY', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02520', 'MORALES MORA JORGE ANTONIO', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02521', 'TARAZONA BENITES JOSE GASPAR', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02522', 'HERRERA VALENZUELA JORGE SMITH', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('02523', 'AYALA ALIAGA KEYLA MILUSKA', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02525', 'GARCIA MATELUNA CELIA MILUSKA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02529', 'JIMENEZ PALOMINO CESAR ANTONIO', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02531', 'UBILLUS ESTRADA MARIA ALEJANDRA', '16 : PIURA', null, null, null);
INSERT INTO `temp` VALUES ('02532', 'TELLO NEIRA KATHERIN MILUSKA', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02533', 'HUAMAN TINEO CRISTIAN CIRILO', '23 : STRIP CENTER', null, null, null);
INSERT INTO `temp` VALUES ('02534', 'FLORES MONROY YELIS IRELUI', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02537', 'GARCIA ORE CONSUELO ELIZABETH', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02538', 'QUISPE CORNELIO CRISTIAN POOL', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02540', 'GONZALES DEL RIO MARKO ANTONIO', '06 : SISTEMAS', null, null, null);
INSERT INTO `temp` VALUES ('02541', 'HUAMANI ALMENDRADES LUIS ALFREDO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02542', 'HIDALGO CASTAÑEDA RUDDY JHOJAN', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02543', 'SANCHEZ CHIQUILLAN EDUARDO CLEMENTE', '36 :  SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02544', 'CORZO PARIONA LESLYE JAKELYNE', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02545', 'ORELLANA ADAUTO THALIA ELENA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02546', 'GARAY ALVA ALFREDO MIGUEL', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02547', 'HUAMAN MENDOZA GRETGEN ASTRITH', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02549', 'MAYTA VILLAR MARCO ANTONIO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02551', 'AGUIRRE YERBA KATTY', '02 : CONTABILIDAD', null, null, null);
INSERT INTO `temp` VALUES ('02553', 'SIFUENTES MOTTA MIRIAM LORENA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02554', 'DUQUE BUSCAL MAX', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02555', 'TOLEDO HERNANDEZ JOSE BRYAM ANTONIO', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02556', 'DELGADO ROMERO LISSETE BEATRIZ', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02557', 'GUADALUPE GONZALES MAGDALENA STEPHANI', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02558', 'SANCHEZ RUPAY ALBERTO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02564', 'CASTRO MODESTO JANET YORKA', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02565', 'HERRERA TEJADA GABRIEL EDUARDO', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02566', 'SILVA LANCHIPA ALESSANDRA CECILIA', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02567', 'CRUZ HINOSTRAZA BRAHAN  BIRJOO', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02568', 'ANCHANTE REDHEAD MILAGROS DEL PILAR', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02569', 'MUÑOZ DELGADO JOSEPH ALEXANDER', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02571', 'VALENCIA MAMANI RICHAR ALEXANDER', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02572', 'GOMEZ PATRICIO GABRIELA LIZBEL', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02573', 'VALLEJOS CATALAN ELSA JULISA', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02574', 'MORON RIOS MAOLY', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02575', 'PRADO ROJAS SHEYLA ELIZABETH', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02576', 'GALLARDO VIVAR LISSET ELSY', '36 : SANTA ANITA', null, null, null);
INSERT INTO `temp` VALUES ('02577', 'PEREDO BARRON IRIS SOLANGE', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02578', 'CASTRO TORRES JUAN MIGUEL', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02580', 'CHICO GONZALES JOEL', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02581', 'SULCARAY CLEMENTE GIAN ANDRE', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02582', 'MAZA MESTAS CLAY WIMNER', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02583', 'MONTENEGRO DUAREZ JOSE LUIS', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02584', 'RODRIGUEZ YACTAYO LEO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02585', 'AVALOS GARCIA JHONATAN ALEXANDER JESUS', '23 : STRIP CENTER', null, null, null);
INSERT INTO `temp` VALUES ('02586', 'PAUCAR HILARIO MISSY BRIGITTE', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02587', 'LUYO PAUCAR JUNIOR', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02588', 'RIPAS HUAMANCHA MARIBEL ROCIO', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02590', 'GONZALES GRADOS CARLOS OSCAR EDUARDO', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02591', 'VILLACORTA GUEVARA MICHELLE LILY', '14 : TRUJILLO', null, null, null);
INSERT INTO `temp` VALUES ('02592', 'GUTIERREZ YUPANQUI MELANI FIORELLA', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02593', 'LARRAZABAL POMA GERALDINE MARA', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02594', 'TORRES MUÑOZ WILLIAM FELIX', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02596', 'ESPINOZA CUENTAS BRENDA KELLY', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02597', 'BAIOCCHI ROSAS MARJHORIE STEFANY', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02598', 'QUISPE FALCON SARIAH KATHLENE', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02600', 'JARA PLACIDO ISABEL ROSALIA', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02601', 'URVIOLA ARAGON VELIA ALEXANDRA', '28 : AREQUIPA REAL', null, null, null);
INSERT INTO `temp` VALUES ('02602', 'CABANILLAS ROSAS VLADIMIR ERICK', '40 : HUANUCO', null, null, null);
INSERT INTO `temp` VALUES ('02603', 'TAPIA BRONCALES JHON EDWIN', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('02605', 'VILLALOBOS ARBAÑIL ALVARO GIOVANNI', '04 : LOGISTICA', null, null, null);
INSERT INTO `temp` VALUES ('02606', 'ROBLES MARCELO ARELY STEPHANY', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('02607', 'SAENZ BOÑON CRISTHIAN ANIBAL', '17 : CAJAMARCA', null, null, null);
INSERT INTO `temp` VALUES ('02608', 'ARTEAGA BUSTAMANTE LUZ FERNANDA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02609', 'CASTRO BRAVO MADELENN ROSSE', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02611', 'DIAZ NUÑEZ ALAN JESUS', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02612', 'VALVERDE ALIAGA JOSEPH WILLIAMS', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('02613', 'MAMANI CONDORI VILMA', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02614', 'LOPEZ PARICAHUA LEIDY BERTHA OLGA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02617', 'OBANDO SILVA JESSICA ALEXANDRA', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02618', 'ROCA DE LA CRUZ PAOLA YOSELIN', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02619', 'YALICO MEZA ARIADNA GRAZYE', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02620', 'MORI ARZAPALO SUSAN STEPHANY', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02621', 'O`BRIEN BAIOCCHI JEAN PIERRE', '22 : CENTRO CIVICO', null, null, null);
INSERT INTO `temp` VALUES ('02623', 'GUZMAN BARRIONUEVO MARIANA DANIELA', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02624', 'GALLEGOS VILCA OSWALDO ANTHONY', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02625', 'VILLANUEVA ARENAS JORGE ANDRES', '10 :  JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02627', 'VALVERDE AVILA GERARDO MANUEL', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02628', 'PALACIOS MONDRAGON GRACIA MERCEDES', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02629', 'TRELLES ROSADO ANA BELEN', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02630', 'MEJIA AZCARATE GLORIA DANIELA ISABEL', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02631', 'CASTILLO RUIZ LUCRECIA MARIBEL', '31 : PIURA 2', null, null, null);
INSERT INTO `temp` VALUES ('02632', 'PAREDES PLASENCIA WENDY LUCIA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02633', 'MEJIA URBINA IRDWIN ANDRES', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02634', 'GODEFROY MASCARO ANDREA ELIZABETH CAROLYNA', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02636', 'POVIS CHAVEZ NATALIA BEATRIZ', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02637', 'GARCIA REYES ROSARIO NATALIA', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02638', 'CECENARRO HUARACALLO YELVY DUCELY', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02639', 'PINTO VILCA YULEYSHI NAYSHA', '29 : AREQUIPA MALL', null, null, null);
INSERT INTO `temp` VALUES ('02640', 'ARCHENTI VERASTEGUI FRANCOIS', '18 : HUANCAYO', null, null, null);
INSERT INTO `temp` VALUES ('02641', 'GUARNIZ HERRERA BRAYAN BRANDON', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02642', 'REQUEJO LARA ADRIANA DALIZ', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('02643', 'QUISPE APARCANA CINTHIA FABIOLA', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02644', 'CUEVA GALLEGOS SOLANGE ZOBEIDA MILAGROS', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02645', 'PAICO MIO GABRIELA ISABEL', '39 : ICA', null, null, null);
INSERT INTO `temp` VALUES ('02646', 'RODRIGUEZ ESPINOZA BRENDA SAMANTHA', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02647', 'CASTRO ASTUHUAMAN DANITZA XIOMARA', '13 : PASCANA', null, null, null);
INSERT INTO `temp` VALUES ('02648', 'CHAMBA CALLE JESSICA KATHERINE', '10 : JOCKEY', null, null, null);
INSERT INTO `temp` VALUES ('1799', 'ROMERO ORTIZ STEFFI MAGGI', '20 : SANTA CLARA', null, null, null);
INSERT INTO `temp` VALUES ('02042', 'ZEGARRA CARDENAS PETER JESUS', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02122', 'CASTRO GARCIA ALDO WILFREDO', '15 : CHICLAYO', null, null, null);
INSERT INTO `temp` VALUES ('02216', 'MATEO HUAPAYA LUIS', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02227', 'MEONO SANDOVAL TITO', '12 : BELLAVISTA', null, null, null);
INSERT INTO `temp` VALUES ('02333', 'HUAÑA ESPERME JOSUE', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02459', 'MONTANO LEON ALEJANDRO JHONATAN', '19 : PLAZA NORTE', null, null, null);
INSERT INTO `temp` VALUES ('02530', 'RODRIGUEZ CATACORA OSWALDO', '21 : MANTENIMIENTO', null, null, null);
INSERT INTO `temp` VALUES ('02604', 'LUCAS PRUDENCIO JOE HUMBERTO', '40 : HUANUCO', null, null, null);
