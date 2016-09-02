# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: blinds
# Generation Time: 2016-09-02 16:11:09 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table exp_accessories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_accessories`;

CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`)
VALUES
	(1,'Expressionengine_info_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.0'),
	(2,'Structure_acc','1|5|6|7|8','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','3.3.14.7'),
	(4,'Freeform_acc','1|5|6|7|8','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','4.2.2'),
	(5,'Cartthrob_acc','1|5|6|7|8','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.0');

/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_actions`;

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`)
VALUES
	(1,'Email','send_email',0),
	(2,'Search','do_search',1),
	(3,'Channel','submit_entry',0),
	(4,'Channel','filemanager_endpoint',0),
	(5,'Channel','smiley_pop',0),
	(6,'Channel','combo_loader',0),
	(7,'Member','registration_form',0),
	(8,'Member','register_member',0),
	(9,'Member','activate_member',0),
	(10,'Member','member_login',0),
	(11,'Member','member_logout',0),
	(12,'Member','send_reset_token',0),
	(13,'Member','process_reset_password',0),
	(14,'Member','send_member_email',0),
	(15,'Member','update_un_pw',0),
	(16,'Member','member_search',0),
	(17,'Member','member_delete',0),
	(26,'Rte','get_js',0),
	(19,'Tagger','tagger_router',0),
	(20,'Structure','ajax_move_set_data',0),
	(21,'Playa_mcp','filter_entries',0),
	(25,'Freeform','save_form',0),
	(27,'Cartthrob','delete_from_cart_action',0),
	(28,'Cartthrob','cart_action',0),
	(29,'Cartthrob','download_file_action',0),
	(30,'Cartthrob','add_to_cart_action',0),
	(31,'Cartthrob','update_cart_action',0),
	(32,'Cartthrob','add_coupon_action',0),
	(33,'Cartthrob','multi_add_to_cart_action',0),
	(34,'Cartthrob','update_live_rates_action',0),
	(35,'Cartthrob','delete_recurrent_billing_action',0),
	(36,'Cartthrob','update_recurrent_billing_action',0),
	(37,'Cartthrob','save_customer_info_action',0),
	(38,'Cartthrob','update_item_action',0),
	(39,'Cartthrob','checkout_action',0),
	(40,'Cartthrob','payment_return_action',0),
	(41,'Cartthrob','update_subscription_action',0),
	(42,'Cartthrob','change_gateway_fields_action',0),
	(43,'Cartthrob_mcp','save_price_modifier_presets_action',0),
	(44,'Cartthrob_mcp','garbage_collection',0),
	(45,'Cartthrob_mcp','email_test',0),
	(46,'Cartthrob_mcp','process_subscriptions',0),
	(47,'Cartthrob_mcp','crontabulous_get_pending_subscriptions',0),
	(48,'Cartthrob_mcp','crontabulous_process_subscription',0),
	(49,'Cartthrob_mcp','helpspot_create',0),
	(50,'Cartthrob_mcp','helpspot_update',0),
	(51,'Cartthrob_mcp','helpspot_ajax_fields',0),
	(52,'Cartthrob_mcp','configurator_ajax',0),
	(53,'Cartthrob_order_manager_mcp','refund',0),
	(54,'Cartthrob_order_manager_mcp','add_tracking_to_order',0),
	(55,'Cartthrob_order_manager_mcp','delete_order',0),
	(56,'Cartthrob_order_manager_mcp','update_order',0),
	(57,'Cartthrob_order_manager_mcp','resend_email',0),
	(58,'Cartthrob_order_manager_mcp','create_new_report',0),
	(59,'Cartthrob_order_manager_mcp','run_report',0),
	(60,'Cartthrob_order_manager_mcp','remove_report',0);

/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_captcha
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_captcha`;

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_cart`;

CREATE TABLE `exp_cartthrob_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart` text,
  `timestamp` int(11) DEFAULT '0',
  `url` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cartthrob_cart` WRITE;
/*!40000 ALTER TABLE `exp_cartthrob_cart` DISABLE KEYS */;

INSERT INTO `exp_cartthrob_cart` (`id`, `cart`, `timestamp`, `url`)
VALUES
	(23,'8NRq54S1U3VlDCIxfLj2xaIwMODsEUGGTNCdIitnLEN5ajH+KSS14hyDvAzMqU6vaY45KPYUZ72L7DIBuoA/k1fQp9QJtQDVOPTYh0+cTEA2SmM386lBd98dCsgvk99rern4TgKzqAdTNeJjFxVBpgQw85xmzr1pIfdK/GeNYJpx8wz3Mcho+TYqydF1DXuN3D/78Mcqp/4QT+SOVFLmPyp5J1C5+rwfzRToiGmU2nvRDZK+VKTfuGshHg3gTmswUa1uaiWC5W7vuEEvcXOZQnFolrtkdTuSkYFovS1AXMmRD5v/VL4KjAVK0TcBWfpUBcbK0VXdDDj/s/O7DLtarw6cSdYgAt5MhX9gz4eETMjzal5ftkVFj+FOQ3UejFDNw5nLSAk5uZrqdT3arB1FzTPI7Ms5iRxehgtJBpv8ONKc2NCVUxanqvtBQv7cmC3bY5XOILCGA1nPhEx/GEOxVmThfIhkeQ4yTDOqZFYVcU7tJdUPnt5M6ohf/U7Qp70H5GMhX7LN9blnvIHqNa8TMPEQMmIYGN1ZhF+JirRoh+vuAIdn+VTPFa4q5TJ1ZgleSRrqfuA6oCiam8+5NRJobD+5zoXi1N+TILoLZFtpnJqUGxXwAlXNPNXNzz/HSxT1dVHQl1Acz+zRaJwd22LVweACC70fr1xqJ2wdBSllzNTNTAzbovJfqdJIcoNzaW88y7ctHnXl357Yc+UfyeKkro5KwMIUDwvmz7PtGM1gqA7bS0dtCyVTFztTewRZ4TCJ2fxSLpql8WEcSS7mLXu005TQdBCYETUc2bb+LFezZ7AuzrPFCMEzivdE/tkH1jXj1YEMOIz0KWgeBs9TICrm9UnSpO3fB5+EsLWgFKxuDsz0M7qHtIz9nHqG8u83CtZLhH9IA/f8N4YnXAXSN+zHgOPLILGpXiTSNz3b0ZjAKiyAxcgUZa+HH67z+0Sr+z0Hly9krdyvyV7MFB5aCbjuU1/HJqGjiUZaiz+oVpIjIVh8R2k4iDxC21xFLUjvsAMUnZPGHJ6hsjHF8sjViUHp9CFZZdT6wa/jo1YtTmQb7mcBI9igJKbnvdklvJYIwqe8cmjcVhZRWg30jnv/bS5XvrC6DF2EcPVe3DfSeVZXhvXAcFt1G5lxiCvpcGaBkpa1QiULeY8jhFVxukTVhkPlSAJm02NF+C2gbtt5/kYukqwfoXnyI/Nh2aeDNyta97WCXWHlJ7U6Itf0ohm+wgbgDSe/T9/wqu6krG7jsBjz6Q1ArUbJBp56nTIzvZpaVPJf6JhzSqlRAo50qWZZJBhjP4fd3U9KMMcQ3zOX/QfQP8aB8tQqFpuFCY9JuPrgX/NoZt+1F9ONuzOJj/mFDwdrayb16ihwZyrDOUIUdVtEg9brBXL1rZdRg2jdZ9zEtwANUAivYLv4TpInydoC+qvHbGKgl+jLlmOPx3W7Gtq96fk3gzQKPxw7yrSqse+89gTUOnzb4RIkx39Fp+EXoyuJ3PnmM+QwjRj1UWxWZsXjvhHgUXczL1gqXDh/801srpzGpxQNJrxk+zv4BHDC1sLjDXB5Nkg7Whc/GixV9IArAQxwHvJV4rd9S8/TYT6NjOaKhdvEXlcS4xdHBVfUiPM1r6WWZMIX3OQcZBVHoK3OmWruqTllNiGxBEMkUMyN2IsaOZ556PB43b4W1LfmXk9oZLMIh1mEwQibcd0eHtNybWNfqrapIQIZ8XtnUNJVyBgIoFd563QJbawQaRMY8hNUXIYwas+BMYPW3mYf2zx+DwsYt0DrtyQYGUOa0aNXRFfgHqliBGjmxLgiFl3vmHllgc5/ES1IbuJkxb1NEY+yHEOktYfd4ewo9Y+X53ApJtcIckvdy8113bdtAkf/J5OvJ6QUdWlkJ1pcRYmAd2K9GxTiw2GZ6SRSMs8a6qrWeOGWsyaDevT11paMWpq7SEVMXIiCRow5YxXjDpY0/uUmWWKgr+tHrgILEFTdZuYhUZBU6xG8k/DBoVDYeKPA41dKPFQHVa2CAKEsVo4W8soEVUaUhxEOjsdV4e9eENVdJlHlV1fsx+96YuaFZq6Nd8nyLSxz/kp/HgtlqHBdfecAGjWdUgUFCCVcKyYbVnkElZ/SEqJwg1RmCCGNP6x78Qz8wcDLkn9nq8VQajAydeVM0wJYopQn+RLkRhF//PjR06E+5KgvrIogux5Bxl5hIimOjAJTnVPS63UKuiVu2Z6exNvaGP9xfWAOme1S6/Ud3Yb3oZuHSR0VTwBqPDPlk36+yZDs9RFwxB3McGYoQrT9vAlal3WwU1mSlsCYn0/UOouzGF1RuXh0ARXrNNlShv383iydS1xM/kMjbVpcWhIGXjjBE8u8k3fmX0mqv7b3FRLv5RVeE+k1x2fUPzYbHYZansXTg3d0ITe1IK5vTXNt2htyr3hxBvovagZVyntbqCymoAt3Q/j4FPk0xEzMU4Xgekha1Fi/I6aMKNsg/HWEHbv2e/7V+ZHjKOQEEnZ2SK/MkUxrx5HNx/B3AeOysd4ah7lgG51xxRho7iS7dKj0GJUV4TZ7A/LXJYuEtJaGsMOL8eklKJ/CDLbNy7WtcKLcxyKh/mecOvJuo5jmBmjpCgU=',1472672704,'http://localhost/blinds'),
	(22,'w8YnyF1nCS5/EkLatvEb4r00AGOb9n15sSn2fzLO0TVCNBJ9AYJdMaXAAso4PdG6Ek5Cv7E0CzacetmnmSGDv2vAYvMa1jjCIeAE0Yw12IwlHTigY3cYpK4yoodOmlhgBMg+jdBVJfXbeV5o2fs5qquDjsOr62DS7Yh+HXjSHIeo5e0rTL3Lx2PIfINRfB9ehBVFbnGM188ZtV1YUQo5SVT5AXW0BcO9Lh+YltlovluVYm4i5bEDkrHL7T8o51juA8ID+al22uY5bFy+MlH5unlMywSaYqEXiBBbsdq67zsb+TGYTqYEPEJRJ0RiVv5JLAOFQJmFedKYiAt8g9JAcPAkCGOD48ztDQPQEOgdnZw9qV3B+kOT2EZi3TJLSXoGgVchatry55TbOwrdykMrcEil8Vrw43Zv/QXyYFkDbtcTHcjbF4OxcigQrnArUZ8Ysa78B85UiYJe+3WZstXvqh68z7Kj6J1AhF44khdBnimMZE1UGmuyoJjcuMse1dFa+tgRvKCZg+Gl1wJTtQa+qe/8u4WHwqv3nlTqxk1xoidvOVuekXuRDDrSVwzchrEAYAS3tDbq06LDPLCL2lLWmoywztODXNiwFD2PinD977G682zKOig2BYFsLupazPUKocwOONMYWVYSupBnrWkst8lFooK4yO1x/15xg0rxWMQR3TLduZY8tSqtC2T1CoMurLuSIArPVGV1i7K/Xf3qgP+bSSHG21DqT92VHAZ8FzJTNCO6mCQ50wtGdihtWM1gyQQ2GrZSbr4oFEOZxHKx33fncUptFrz5gi6jwKESUix6e63DzwQbgixfmnlxmO8JaXsyKAr8yJtOtjK96+T3Khyf7P6r+XqK+ECf+vPipwF+8Osp4QZ9yvEleVuO/w40HeRtmWvqyZ7pcAbc9XvQAjs1UwkBeaZmJiM4qXejElBZTj+ZiFompWvEkWl95eNd76jplCKqibTkeKDQx0Lo0g+x/Q6nlZV5vFNVY2jfKiWnz5yYFd52wZYCUHNiRBlGhmZGgzKAebqBXr6I+zy3t24OdTFZo0ELucB2LmXjBHTpDCWfeG5B35KVZZKhlVIAowLzTlkY8al9T8XH6EouCx143iyfGYS9FJrCCOpuFwkljV4/nVIyYYqDQ9Wy/hTHEMCCAh4VSw+xV5sG4DlgmKtajC9vNqvKoWI03thaYOYfMR+4JyrBFPhaWkzi/wCaPB4oyAmN4hD/bLsOqsg0Z7SPrcFC7G8TKR+glPaL4lDqeMVtuU/fv6PKuwtRLPty3P25Le7nFAOgF6EC/V6T+mY8Pph4EDHeCuW+Mzls8BEbgqZsHdGopF5N9Vk077fZ5hH+0oTlFKxzzQyzPqM0hTERIzxvNH5jt1k0GcmGJQOrAkh6F1eG9xHZgBnxQLBFp2qjC5ZoTPETxbeksSrskP+46WkUTBwjTOd9n5qL2eFESNnaxsftgJP373xpF8cSvb+x02qeQGoIWDjtf4jI/00jiKSfmufA9agGOMVUqFiJk0nGCX1s1JxkvL3jWmGDwIOlqEKVkU6DiPf/VNz0SL8KyFnRUsJH+s/MVHs1Gbe4fXO6LXFrE5WJbFl5G8lMbhDGpw410YfvF/Cw7HdBh7LZbMRauzSDmJvNmjQseim32WRkbUr/PqtIet5bwat97mUe458+mB65joFaSO5VsNs55SC7Pp6Oo33W0jIA1LthLhJ0eTtqXi8ClWhbN9UPhT1OdoGbPFHQXrwirsvYmecLVraHxqGH3GDWRHXbqIKSKPmr1BsRMHVSJd8bHhMjG+/l1G6OR0BdCInU14OgP5jCFx5oARWj10fYi8Ul8BEbebKpYbgRHIbYA7cRIQJWYP3UGuAFoT2briS/bnZthwR2EGAfYR16m6zUKN7OQkhv8WAF0sQ57eBSIN6oM2/HTlP+Z+fLH3MGz5BkNmhm/QAyNCSvX7VlmjsiPHRS5gEheKFSQCMd1RlquaTD3xcAI/5t+50+y6D3CA6Er2oNoSMM2Ur5W4MNA9wAylrJUDRIlfYc76xB3Gp2cizqnfXLd62TZmsysNO6gsuGtfLdFwSZhBvo2678KgceJXBsT6ns+Xb1tI6w8ED6xJjrATWO9v6E2CFEOgRBAIAV5c/QW3q8atzt7U3QIA6S4UuKn9bLPBaEsjdjEbw/L5LIzB56qmNXT0F6U5SBckZGH24aEAUyHujjbi3EZIkeCfA6lN4egLhHuxGgKwp5D5GRcdqYPKN4a2hjcSULpBKHHZ6UejxDO1IU/M9TqvQvdq+kRX+gKsHP6CX5TQCVfJv1CQokfPDlpR8M6N0h1hfa29irsUxXJoyWMoNoCg2ZVbkeFtazhbqH2LUPi9715UN+a9ov8yKymEm+xvmTnPg4pwb0Ud+8NQhkbocDtogKYcNffM4rWyDge95usikpxBV6nv1kupWO5pnShkMEWGcNdj3AK+ODJjPxiDSsMFMeadgEbA4bW7s+2qpEqHj+lGirJNtE2CiChXj8d52soRRSBQ5qj0FvmphcIiaiSqh6diKVOodMh6B7EimFE58O5M1EDDscfOk4+HaQXBdPfomNV3tsyLeo3cU06wFwM9XsMA53RvA=',1472672156,'http://localhost/blinds');

/*!40000 ALTER TABLE `exp_cartthrob_cart` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cartthrob_email_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_email_log`;

CREATE TABLE `exp_cartthrob_email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` text,
  `from_name` text,
  `to` text,
  `message_template` text,
  `subject` text,
  `email_event` text,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_notification_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_notification_events`;

CREATE TABLE `exp_cartthrob_notification_events` (
  `application` varchar(255) DEFAULT NULL,
  `notification_event` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cartthrob_notification_events` WRITE;
/*!40000 ALTER TABLE `exp_cartthrob_notification_events` DISABLE KEYS */;

INSERT INTO `exp_cartthrob_notification_events` (`application`, `notification_event`)
VALUES
	('Cartthrob_order_manager','tracking_added_to_order');

/*!40000 ALTER TABLE `exp_cartthrob_notification_events` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cartthrob_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_order_items`;

CREATE TABLE `exp_cartthrob_order_items` (
  `row_id` int(10) NOT NULL AUTO_INCREMENT,
  `row_order` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `entry_id` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `site_id` int(10) DEFAULT NULL,
  `quantity` varchar(10) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `price_plus_tax` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `shipping` varchar(100) DEFAULT NULL,
  `no_tax` tinyint(1) DEFAULT '0',
  `no_shipping` tinyint(1) DEFAULT '0',
  `extra` text,
  `entry_date` int(11) DEFAULT '0',
  PRIMARY KEY (`row_id`),
  KEY `order_id` (`order_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cartthrob_order_items` WRITE;
/*!40000 ALTER TABLE `exp_cartthrob_order_items` DISABLE KEYS */;

INSERT INTO `exp_cartthrob_order_items` (`row_id`, `row_order`, `order_id`, `entry_id`, `title`, `site_id`, `quantity`, `price`, `price_plus_tax`, `weight`, `shipping`, `no_tax`, `no_shipping`, `extra`, `entry_date`)
VALUES
	(1,0,29,22,'Some Product',1,'1','20','24','0','0',0,0,'YToyOntzOjg6ImRpc2NvdW50IjtpOjA7czoxNzoiaXRlbV9kaW1lbnNpb25zXzEiO3M6OToiMTAwMHgxMDAwIjt9',1472065598);

/*!40000 ALTER TABLE `exp_cartthrob_order_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cartthrob_order_manager_reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_order_manager_reports`;

CREATE TABLE `exp_cartthrob_order_manager_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_title` varchar(255) DEFAULT 'Order Report',
  `type` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_order_manager_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_order_manager_settings`;

CREATE TABLE `exp_cartthrob_order_manager_settings` (
  `site_id` int(4) DEFAULT '1',
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `serialized` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_order_manager_table
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_order_manager_table`;

CREATE TABLE `exp_cartthrob_order_manager_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `track_event` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_permissions`;

CREATE TABLE `exp_cartthrob_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `sub_id` varchar(100) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_products`;

CREATE TABLE `exp_cartthrob_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url_title` varchar(65) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'open',
  `description` text,
  `sku` varchar(65) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT '0',
  `shipping` decimal(10,4) DEFAULT NULL,
  `shippable` tinyint(4) DEFAULT '0',
  `weight` decimal(10,4) DEFAULT NULL,
  `tax` decimal(10,4) DEFAULT NULL,
  `taxable` decimal(10,4) DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `store_cost` decimal(10,4) DEFAULT NULL,
  `sale_price` decimal(10,4) DEFAULT NULL,
  `sale_start` int(32) DEFAULT NULL,
  `sale_end` int(32) DEFAULT NULL,
  `images` text,
  `item_options` text,
  `option_groups` text,
  `keywords` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_sessions`;

CREATE TABLE `exp_cartthrob_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `cart_id` int(10) DEFAULT NULL,
  `fingerprint` varchar(40) DEFAULT '',
  `expires` int(11) DEFAULT '0',
  `member_id` int(10) DEFAULT NULL,
  `sess_key` varchar(40) DEFAULT '',
  `sess_expiration` int(11) DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `cart_id` (`cart_id`),
  KEY `fingerprint` (`fingerprint`),
  KEY `expires` (`expires`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cartthrob_sessions` WRITE;
/*!40000 ALTER TABLE `exp_cartthrob_sessions` DISABLE KEYS */;

INSERT INTO `exp_cartthrob_sessions` (`session_id`, `cart_id`, `fingerprint`, `expires`, `member_id`, `sess_key`, `sess_expiration`)
VALUES
	('6f9cf758e93308ab7e168809ed424e43',22,'32ec72f2632d9b093e3c3778085d33dd4d89d149',1472690460,16,'',0),
	('969c437cb6fbba5e79405d513e76cfdb',23,'32ec72f2632d9b093e3c3778085d33dd4d89d149',1472690704,0,'',0);

/*!40000 ALTER TABLE `exp_cartthrob_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cartthrob_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_settings`;

CREATE TABLE `exp_cartthrob_settings` (
  `site_id` int(4) DEFAULT '1',
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `serialized` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cartthrob_settings` WRITE;
/*!40000 ALTER TABLE `exp_cartthrob_settings` DISABLE KEYS */;

INSERT INTO `exp_cartthrob_settings` (`site_id`, `key`, `value`, `serialized`)
VALUES
	(1,'license_number','042a7028-c850-4483-b4c0-cf366762e211',0),
	(1,'product_channels','a:3:{i:0;s:1:\"7\";i:1;s:2:\"17\";i:2;s:2:\"12\";}',1),
	(1,'allow_products_more_than_once','1',0),
	(1,'product_split_items_by_quantity','0',0),
	(1,'send_inventory_email','0',0),
	(1,'low_stock_level','5',0),
	(1,'product_channel_fields','a:2:{i:17;a:1:{s:5:\"price\";s:3:\"130\";}i:12;a:5:{s:5:\"price\";s:2:\"62\";s:8:\"shipping\";s:2:\"65\";s:6:\"weight\";s:2:\"66\";s:9:\"inventory\";s:2:\"67\";s:15:\"price_modifiers\";a:3:{i:0;s:2:\"73\";i:1;s:2:\"74\";i:2;s:2:\"75\";}}}',1),
	(1,'coupon_code_field','title',0),
	(1,'coupon_code_channel','13',0),
	(1,'coupon_code_type','78',0),
	(1,'discount_channel','16',0),
	(1,'discount_type','127',0),
	(1,'save_orders','1',0),
	(1,'orders_channel','14',0),
	(1,'orders_items_field','79',0),
	(1,'orders_total_field','80',0),
	(1,'orders_subtotal_field','81',0),
	(1,'orders_subtotal_plus_tax_field','82',0),
	(1,'orders_shipping_field','83',0),
	(1,'orders_shipping_plus_tax_field','84',0),
	(1,'orders_tax_field','85',0),
	(1,'orders_coupon_codes','86',0),
	(1,'orders_shipping_option','87',0),
	(1,'orders_discount_field','88',0),
	(1,'orders_customer_name','89',0),
	(1,'orders_customer_phone','90',0),
	(1,'orders_customer_email','91',0),
	(1,'orders_full_billing_address','93',0),
	(1,'orders_full_shipping_address','94',0),
	(1,'orders_billing_first_name','95',0),
	(1,'orders_billing_address','96',0),
	(1,'orders_billing_address2','97',0),
	(1,'orders_billing_state','98',0),
	(1,'orders_billing_zip','99',0),
	(1,'orders_billing_city','100',0),
	(1,'orders_billing_last_name','101',0),
	(1,'orders_billing_company','102',0),
	(1,'orders_billing_country','103',0),
	(1,'orders_country_code','104',0),
	(1,'orders_shipping_first_name','105',0),
	(1,'orders_shipping_last_name','106',0),
	(1,'orders_shipping_address','107',0),
	(1,'orders_shipping_address2','108',0),
	(1,'orders_shipping_city','109',0),
	(1,'orders_shipping_state','110',0),
	(1,'orders_shipping_zip','111',0),
	(1,'orders_shipping_company','112',0),
	(1,'orders_shipping_country','113',0),
	(1,'orders_shipping_country_code','114',0),
	(1,'orders_error_message_field','115',0),
	(1,'orders_transaction_id','116',0),
	(1,'orders_last_four_digits','117',0),
	(1,'orders_customer_ip_address','118',0),
	(1,'orders_payment_gateway','119',0),
	(1,'orders_subscription_id','120',0),
	(1,'orders_vault_id','121',0),
	(1,'save_purchased_items','1',0),
	(1,'purchased_items_channel','15',0),
	(1,'purchased_items_id_field','122',0),
	(1,'purchased_items_quantity_field','123',0),
	(1,'purchased_items_price_field','124',0),
	(1,'purchased_items_order_id_field','125',0),
	(1,'logged_in','0',0),
	(1,'default_member_id','',0),
	(1,'session_expire','18000',0),
	(1,'show_debug','1',0),
	(1,'clear_cart_on_logout','1',0),
	(1,'clear_session_on_logout','0',0),
	(1,'allow_empty_cart_checkout','0',0),
	(1,'global_item_limit','0',0),
	(1,'enable_logging','0',0),
	(1,'cp_menu','1',0),
	(1,'cp_menu_label','',0),
	(1,'session_use_fingerprint','1',0),
	(1,'session_fingerprint_method','3',0),
	(1,'garbage_collection_cron','0',0),
	(1,'checkout_form_captcha','0',0),
	(1,'allow_fractional_quantities','0',0),
	(1,'admin_checkout_groups','a:1:{i:0;s:1:\"1\";}',1),
	(1,'msm_show_all','0',0),
	(1,'number_format_defaults_decimals','2',0),
	(1,'number_format_defaults_dec_point','.',0),
	(1,'number_format_defaults_thousands_sep',',',0),
	(1,'number_format_defaults_prefix','£',0),
	(1,'number_format_defaults_prefix_position','BEFORE',0),
	(1,'number_format_defaults_currency_code','GBP',0),
	(1,'rounding_default','standard',0),
	(1,'default_location','a:8:{s:5:\"state\";s:0:\"\";s:3:\"zip\";s:0:\"\";s:12:\"country_code\";s:3:\"GBR\";s:6:\"region\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:12:\"shipping_zip\";s:1:\"0\";s:21:\"shipping_country_code\";s:3:\"GBR\";s:15:\"shipping_region\";s:0:\"\";}',1),
	(1,'locales_countries','',0),
	(1,'last_order_number','1',0);

/*!40000 ALTER TABLE `exp_cartthrob_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cartthrob_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_status`;

CREATE TABLE `exp_cartthrob_status` (
  `entry_id` int(10) NOT NULL DEFAULT '0',
  `session_id` varchar(32) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'processing',
  `inventory_processed` int(2) DEFAULT '0',
  `discounts_processed` int(2) DEFAULT '0',
  `error_message` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `cart` text,
  `cart_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cartthrob_status` WRITE;
/*!40000 ALTER TABLE `exp_cartthrob_status` DISABLE KEYS */;

INSERT INTO `exp_cartthrob_status` (`entry_id`, `session_id`, `status`, `inventory_processed`, `discounts_processed`, `error_message`, `transaction_id`, `cart`, `cart_id`)
VALUES
	(29,NULL,'authorized',0,0,NULL,'OFFLINE PAYMENT',NULL,NULL);

/*!40000 ALTER TABLE `exp_cartthrob_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cartthrob_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_subscriptions`;

CREATE TABLE `exp_cartthrob_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `serialized_item` text NOT NULL,
  `vault_id` int(10) DEFAULT NULL,
  `start_date` int(11) DEFAULT '0',
  `modified` int(11) DEFAULT '0',
  `last_bill_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT '0',
  `status` varchar(10) DEFAULT 'closed',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `total_occurrences` int(5) DEFAULT NULL,
  `used_total_occurrences` int(5) DEFAULT NULL,
  `trial_occurrences` int(5) DEFAULT NULL,
  `used_trial_occurrences` int(5) DEFAULT NULL,
  `interval_length` int(4) DEFAULT NULL,
  `interval_units` varchar(32) DEFAULT NULL,
  `allow_modification` tinyint(1) DEFAULT '1',
  `price` varchar(100) DEFAULT NULL,
  `trial_price` varchar(100) DEFAULT NULL,
  `error_message` varchar(100) DEFAULT NULL,
  `sub_id` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `plan_id` varchar(100) DEFAULT NULL,
  `rebill_attempts` int(5) DEFAULT NULL,
  `next_bill_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_tax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_tax`;

CREATE TABLE `exp_cartthrob_tax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_name` text,
  `percent` varchar(5) DEFAULT NULL,
  `shipping_is_taxable` tinyint(1) DEFAULT '0',
  `special` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_cartthrob_vault
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cartthrob_vault`;

CREATE TABLE `exp_cartthrob_vault` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `token` varchar(128) DEFAULT NULL,
  `gateway` varchar(32) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `last_four` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_categories`;

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_category_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_field_data`;

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_category_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_fields`;

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_groups`;

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_posts`;

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_channel_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data`;

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_50` text,
  `field_ft_50` tinytext,
  `field_id_51` text,
  `field_ft_51` tinytext,
  `field_id_52` text,
  `field_ft_52` tinytext,
  `field_id_53` text,
  `field_ft_53` tinytext,
  `field_id_54` text,
  `field_ft_54` tinytext,
  `field_id_55` text,
  `field_ft_55` tinytext,
  `field_id_56` text,
  `field_ft_56` tinytext,
  `field_id_57` text,
  `field_ft_57` tinytext,
  `field_id_58` text,
  `field_ft_58` tinytext,
  `field_id_60` float DEFAULT '0',
  `field_ft_60` tinytext,
  `field_id_61` text NOT NULL,
  `field_ft_61` tinytext,
  `field_id_62` text NOT NULL,
  `field_ft_62` tinytext,
  `field_id_63` text NOT NULL,
  `field_ft_63` tinytext,
  `field_id_64` text NOT NULL,
  `field_ft_64` tinytext,
  `field_id_65` text NOT NULL,
  `field_ft_65` tinytext,
  `field_id_66` text NOT NULL,
  `field_ft_66` tinytext,
  `field_id_67` text NOT NULL,
  `field_ft_67` tinytext,
  `field_id_68` text NOT NULL,
  `field_ft_68` tinytext,
  `field_id_69` text NOT NULL,
  `field_ft_69` tinytext,
  `field_id_70` text NOT NULL,
  `field_ft_70` tinytext,
  `field_id_71` text NOT NULL,
  `field_ft_71` tinytext,
  `field_id_72` text NOT NULL,
  `field_ft_72` tinytext,
  `field_id_73` text NOT NULL,
  `field_ft_73` tinytext,
  `field_id_74` text NOT NULL,
  `field_ft_74` tinytext,
  `field_id_75` text NOT NULL,
  `field_ft_75` tinytext,
  `field_id_76` text NOT NULL,
  `field_ft_76` tinytext,
  `field_id_77` text NOT NULL,
  `field_ft_77` tinytext,
  `field_id_78` text NOT NULL,
  `field_ft_78` tinytext,
  `field_id_79` text NOT NULL,
  `field_ft_79` tinytext,
  `field_id_80` text NOT NULL,
  `field_ft_80` tinytext,
  `field_id_81` text NOT NULL,
  `field_ft_81` tinytext,
  `field_id_82` text NOT NULL,
  `field_ft_82` tinytext,
  `field_id_83` text NOT NULL,
  `field_ft_83` tinytext,
  `field_id_84` text NOT NULL,
  `field_ft_84` tinytext,
  `field_id_85` text NOT NULL,
  `field_ft_85` tinytext,
  `field_id_86` text NOT NULL,
  `field_ft_86` tinytext,
  `field_id_87` text NOT NULL,
  `field_ft_87` tinytext,
  `field_id_88` text NOT NULL,
  `field_ft_88` tinytext,
  `field_id_89` text NOT NULL,
  `field_ft_89` tinytext,
  `field_id_90` text NOT NULL,
  `field_ft_90` tinytext,
  `field_id_91` text NOT NULL,
  `field_ft_91` tinytext,
  `field_id_92` text NOT NULL,
  `field_ft_92` tinytext,
  `field_id_93` text NOT NULL,
  `field_ft_93` tinytext,
  `field_id_94` text NOT NULL,
  `field_ft_94` tinytext,
  `field_id_95` text NOT NULL,
  `field_ft_95` tinytext,
  `field_id_96` text NOT NULL,
  `field_ft_96` tinytext,
  `field_id_97` text NOT NULL,
  `field_ft_97` tinytext,
  `field_id_98` text NOT NULL,
  `field_ft_98` tinytext,
  `field_id_99` text NOT NULL,
  `field_ft_99` tinytext,
  `field_id_100` text NOT NULL,
  `field_ft_100` tinytext,
  `field_id_101` text NOT NULL,
  `field_ft_101` tinytext,
  `field_id_102` text NOT NULL,
  `field_ft_102` tinytext,
  `field_id_103` text NOT NULL,
  `field_ft_103` tinytext,
  `field_id_104` text NOT NULL,
  `field_ft_104` tinytext,
  `field_id_105` text NOT NULL,
  `field_ft_105` tinytext,
  `field_id_106` text NOT NULL,
  `field_ft_106` tinytext,
  `field_id_107` text NOT NULL,
  `field_ft_107` tinytext,
  `field_id_108` text NOT NULL,
  `field_ft_108` tinytext,
  `field_id_109` text NOT NULL,
  `field_ft_109` tinytext,
  `field_id_110` text NOT NULL,
  `field_ft_110` tinytext,
  `field_id_111` text NOT NULL,
  `field_ft_111` tinytext,
  `field_id_112` text NOT NULL,
  `field_ft_112` tinytext,
  `field_id_113` text NOT NULL,
  `field_ft_113` tinytext,
  `field_id_114` text NOT NULL,
  `field_ft_114` tinytext,
  `field_id_115` text NOT NULL,
  `field_ft_115` tinytext,
  `field_id_116` text NOT NULL,
  `field_ft_116` tinytext,
  `field_id_117` text NOT NULL,
  `field_ft_117` tinytext,
  `field_id_118` text NOT NULL,
  `field_ft_118` tinytext,
  `field_id_119` text NOT NULL,
  `field_ft_119` tinytext,
  `field_id_120` text NOT NULL,
  `field_ft_120` tinytext,
  `field_id_121` text NOT NULL,
  `field_ft_121` tinytext,
  `field_id_122` text NOT NULL,
  `field_ft_122` tinytext,
  `field_id_123` text NOT NULL,
  `field_ft_123` tinytext,
  `field_id_124` text NOT NULL,
  `field_ft_124` tinytext,
  `field_id_125` text NOT NULL,
  `field_ft_125` tinytext,
  `field_id_126` text NOT NULL,
  `field_ft_126` tinytext,
  `field_id_127` text NOT NULL,
  `field_ft_127` tinytext,
  `field_id_128` text NOT NULL,
  `field_ft_128` tinytext,
  `field_id_129` text NOT NULL,
  `field_ft_129` tinytext,
  `field_id_130` text NOT NULL,
  `field_ft_130` tinytext,
  `field_id_131` text NOT NULL,
  `field_ft_131` tinytext,
  `field_id_132` text,
  `field_ft_132` tinytext,
  `field_id_133` text,
  `field_ft_133` tinytext,
  `field_id_134` text,
  `field_ft_134` tinytext,
  `field_id_135` text,
  `field_ft_135` tinytext,
  `field_id_136` text,
  `field_ft_136` tinytext,
  `field_id_137` text,
  `field_ft_137` tinytext,
  `field_id_138` text,
  `field_ft_138` tinytext,
  `field_id_139` text,
  `field_ft_139` tinytext,
  `field_id_140` text,
  `field_ft_140` tinytext,
  `field_id_141` text,
  `field_ft_141` tinytext,
  `field_id_142` text,
  `field_ft_142` tinytext,
  `field_id_143` text,
  `field_ft_143` tinytext,
  `field_id_144` text,
  `field_ft_144` tinytext,
  `field_id_145` text,
  `field_ft_145` tinytext,
  `field_id_146` text,
  `field_ft_146` tinytext,
  `field_id_147` text,
  `field_ft_147` tinytext,
  `field_id_148` text,
  `field_ft_148` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_50`, `field_ft_50`, `field_id_51`, `field_ft_51`, `field_id_52`, `field_ft_52`, `field_id_53`, `field_ft_53`, `field_id_54`, `field_ft_54`, `field_id_55`, `field_ft_55`, `field_id_56`, `field_ft_56`, `field_id_57`, `field_ft_57`, `field_id_58`, `field_ft_58`, `field_id_60`, `field_ft_60`, `field_id_61`, `field_ft_61`, `field_id_62`, `field_ft_62`, `field_id_63`, `field_ft_63`, `field_id_64`, `field_ft_64`, `field_id_65`, `field_ft_65`, `field_id_66`, `field_ft_66`, `field_id_67`, `field_ft_67`, `field_id_68`, `field_ft_68`, `field_id_69`, `field_ft_69`, `field_id_70`, `field_ft_70`, `field_id_71`, `field_ft_71`, `field_id_72`, `field_ft_72`, `field_id_73`, `field_ft_73`, `field_id_74`, `field_ft_74`, `field_id_75`, `field_ft_75`, `field_id_76`, `field_ft_76`, `field_id_77`, `field_ft_77`, `field_id_78`, `field_ft_78`, `field_id_79`, `field_ft_79`, `field_id_80`, `field_ft_80`, `field_id_81`, `field_ft_81`, `field_id_82`, `field_ft_82`, `field_id_83`, `field_ft_83`, `field_id_84`, `field_ft_84`, `field_id_85`, `field_ft_85`, `field_id_86`, `field_ft_86`, `field_id_87`, `field_ft_87`, `field_id_88`, `field_ft_88`, `field_id_89`, `field_ft_89`, `field_id_90`, `field_ft_90`, `field_id_91`, `field_ft_91`, `field_id_92`, `field_ft_92`, `field_id_93`, `field_ft_93`, `field_id_94`, `field_ft_94`, `field_id_95`, `field_ft_95`, `field_id_96`, `field_ft_96`, `field_id_97`, `field_ft_97`, `field_id_98`, `field_ft_98`, `field_id_99`, `field_ft_99`, `field_id_100`, `field_ft_100`, `field_id_101`, `field_ft_101`, `field_id_102`, `field_ft_102`, `field_id_103`, `field_ft_103`, `field_id_104`, `field_ft_104`, `field_id_105`, `field_ft_105`, `field_id_106`, `field_ft_106`, `field_id_107`, `field_ft_107`, `field_id_108`, `field_ft_108`, `field_id_109`, `field_ft_109`, `field_id_110`, `field_ft_110`, `field_id_111`, `field_ft_111`, `field_id_112`, `field_ft_112`, `field_id_113`, `field_ft_113`, `field_id_114`, `field_ft_114`, `field_id_115`, `field_ft_115`, `field_id_116`, `field_ft_116`, `field_id_117`, `field_ft_117`, `field_id_118`, `field_ft_118`, `field_id_119`, `field_ft_119`, `field_id_120`, `field_ft_120`, `field_id_121`, `field_ft_121`, `field_id_122`, `field_ft_122`, `field_id_123`, `field_ft_123`, `field_id_124`, `field_ft_124`, `field_id_125`, `field_ft_125`, `field_id_126`, `field_ft_126`, `field_id_127`, `field_ft_127`, `field_id_128`, `field_ft_128`, `field_id_129`, `field_ft_129`, `field_id_130`, `field_ft_130`, `field_id_131`, `field_ft_131`, `field_id_132`, `field_ft_132`, `field_id_133`, `field_ft_133`, `field_id_134`, `field_ft_134`, `field_id_135`, `field_ft_135`, `field_id_136`, `field_ft_136`, `field_id_137`, `field_ft_137`, `field_id_138`, `field_ft_138`, `field_id_139`, `field_ft_139`, `field_id_140`, `field_ft_140`, `field_id_141`, `field_ft_141`, `field_id_142`, `field_ft_142`, `field_id_143`, `field_ft_143`, `field_id_144`, `field_ft_144`, `field_id_145`, `field_ft_145`, `field_id_146`, `field_ft_146`, `field_id_147`, `field_ft_147`, `field_id_148`, `field_ft_148`)
VALUES
	(15,1,7,'',NULL,'','xhtml','<p><img alt=\"\" src=\"{filedir_3}about-1-1.jpg\" style=\"width:100%\" /></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lobortis mi non ex auctor vulputate. Mauris lacus neque, dignissim et felis quis, imperdiet ultrices ligula. Duis rutrum malesuada ornare.</p>\n\n<p>Vestibulum sit amet felis fermentum, semper nulla sit amet, efficitur urna. Vivamus rutrum massa id diam tempor cursus.</p>\n\n<p>Proin ipsum urna, molestie non felis quis, maximus lobortis velit. Integer molestie pharetra gravida. Mauris eget ipsum sed velit lobortis dignissim auctor fringilla libero. Donec mattis turpis nibh, viverra ornare ipsum finibus ut. Nam lobortis elit non tempor tempus. Donec congue posuere diam.</p>','none','','none','','none','','none','','none','','none','','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(16,1,8,' ','xhtml','','xhtml','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(17,1,9,'',NULL,' ','xhtml','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(18,1,7,'',NULL,'',NULL,'<p>Blog</p>','none','','none','','none','','none','','none','','none','','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(19,1,10,'',NULL,'',NULL,'',NULL,'Lorem ipsum dolor sit amet, consectetur adipisc elit','none','Lorem ipsum dolor sit amet, consectetur adipisc elit. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum doloreLorem ipsum dolor sit amet, consectetur adipisc elit. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore','none','','none','','none','','none','','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(20,1,11,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_3}blog-thumbnail-4-1.jpg','none','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non accumsan turpis. Sed interdum turpis vitae risus ornare tristique. Integer vestibulum justo nec tellus venenatis venenatis. Quisque urna eros, varius sit amet odio sed, aliquet venenatis elit. Fusce id tincidunt lectus. Nulla facilisi. Vivamus venenatis ut urna et ornare.</p>\n\n<p>Curabitur posuere purus ante, in dictum ex sollicitudin sit amet. Cras venenatis scelerisque blandit. Integer lorem enim, tempus pulvinar quam sit amet, condimentum semper velit. Pellentesque quis magna pulvinar, rhoncus ipsum lobortis, posuere lacus. Quisque sit amet luctus ex. Quisque non viverra risus, non rutrum velit. Curabitur in libero tincidunt, consectetur metus vitae, consectetur mauris. Donec purus ante, consectetur at venenatis eu, consectetur nec nulla.</p>','none','','none','','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(21,1,11,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_3}blog-thumbnail-4-1.jpg','none','<p>Second Blog</p>','none','','none','','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(22,1,18,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>Test Product Description</p>','none',' ','xhtml',0,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','Red|Brown|Orange|Green','none','Diffused|Dimout|Blackout','none','Plain|Patterned','none','Thermal','none','','none','15','xhtml','','none','','xhtml','[24] [pricing-grid-1] Pricing Grid 1','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(23,1,7,'',NULL,'',NULL,'<p>Products Page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(24,1,19,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(25,1,7,'',NULL,'',NULL,'<p>Pricing Grids</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(26,1,7,'',NULL,'',NULL,'<p>Cart here</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(27,1,7,'',NULL,'',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam erat nisi, elementum eu velit nec, interdum vestibulum massa. Nulla rhoncus enim id nulla viverra, dignissim blandit dolor porttitor.</p>\n\n<p>Morbi ultrices dignissim magna. Etiam non ante justo. Donec laoreet velit sit amet fringilla laoreet. Morbi at lacus nec est convallis tincidunt. Fusce felis augue, vulputate a odio ac, cursus interdum enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi consectetur quam id rutrum blandit.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','xhtml','','none'),
	(28,1,7,'',NULL,'',NULL,'<p>Checkout Page</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','xhtml','','none'),
	(29,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'1','none','34.00','none','20.00','none','24.00','none','10.00','none','10.00','none','4.00','none','','none','','none','0.00','none',' ','none','','none','','none','','none','\r\n,  ','none','\r\n,  0','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','GBR','none','','none','','none','','none','','none','','none','','none','0','none','','none','','none','GBR','none','0','none','OFFLINE PAYMENT','none','0','none','::1','none','ct_offline_payments','none','0','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','none',NULL,NULL,'','xhtml','','none','','xhtml','','xhtml','','none'),
	(30,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'22','none','1','none','20','none','29','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1000x1000','none','','xhtml','','none','','xhtml','','xhtml','','none'),
	(31,1,20,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','Company Informations','none',' ','xhtml',' ','xhtml','{filedir_1}about-1-3.jpg','none');

/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_entries_autosave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_fields`;

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`)
VALUES
	(95,1,13,'order_billing_first_name','Billing First Name','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',17,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(94,1,13,'order_full_shipping_address','Full Shipping Address','','textarea','','0',0,0,4,128,'n','ltr','n','n','none','n',16,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(93,1,13,'order_full_billing_address','Full Billing Address','','textarea','','0',0,0,4,128,'n','ltr','n','n','none','n',15,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(92,1,13,'order_language','Customer Language Code','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',14,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(91,1,13,'order_customer_email','Customer Email','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',13,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(90,1,13,'order_customer_phone','Customer Phone','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',12,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(89,1,13,'order_customer_full_name','Customer Full Name','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',11,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(88,1,13,'order_discount','Order Discount','','cartthrob_price_simple','','0',0,0,6,128,'n','ltr','n','n','none','n',10,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(87,1,13,'order_shipping_option','Order Shipping Method','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',9,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(86,1,13,'order_coupons','Order Coupon Codes','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(85,1,13,'order_tax','Order Tax','','cartthrob_price_simple','','0',0,0,8,128,'n','ltr','n','n','none','n',7,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(83,1,13,'order_shipping','Order Shipping Cost','','cartthrob_price_simple','','0',0,0,8,128,'n','ltr','n','n','none','n',5,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(84,1,13,'order_shipping_plus_tax','Order Shipping Plus Tax','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(82,1,13,'order_subtotal_plus_tax','Order Subtotal Plus Tax','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(81,1,13,'order_subtotal','Order Subtotal','','cartthrob_price_simple','','0',0,0,8,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(80,1,13,'order_total','Order Total','','cartthrob_price_simple','','0',0,0,8,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(79,1,13,'order_items','Order Items','','cartthrob_order_items','','0',0,0,8,0,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(78,1,12,'coupon_code_type','Coupon Type','','cartthrob_discount','','n',0,0,6,128,'n','ltr','n','n','xhtml','y',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(77,1,11,'product_download_url','Download URL','If the product has an associated download URL, add it here. ','text','','0',0,0,6,300,'n','ltr','n','n','none','n',17,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(75,1,11,'product_color','Options - Color','','cartthrob_price_modifiers','','0',0,0,6,128,'n','ltr','n','n','none','n',15,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(76,1,11,'product_related_1','Related Product 1','','relationship','','0',0,0,6,128,'n','ltr','n','n','none','n',16,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToyOntpOjA7czoxOiI2IjtpOjE7czoxOiIxIjt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30'),
	(74,1,11,'product_options_other','Options - Other','','cartthrob_price_modifiers','','0',0,0,6,128,'n','ltr','n','n','none','n',14,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(69,1,11,'no_tax','Disable tax for this item?','','select','No\nYes','n',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(70,1,11,'no_shipping','Disable shipping for this item?','','select','No\nYes','n',0,0,6,128,'n','ltr','n','n','none','n',10,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(71,1,11,'product_thumbnail','Product Thumbnail','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',11,'image','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(72,1,11,'product_detail_image','Product Detail Image','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',12,'image','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(73,1,11,'product_size','Options - Size','','cartthrob_price_modifiers','','0',0,0,6,128,'n','ltr','n','n','none','n',13,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(68,1,11,'product_sku','SKU','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(67,1,11,'product_inventory','Inventory','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(66,1,11,'product_weight','Weight','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',6,'numeric','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(65,1,11,'product_shipping','Shipping','','cartthrob_price_simple','','0',0,0,8,128,'n','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(64,1,11,'product_cost','Store Cost','This is the wholesale cost','cartthrob_price_simple','','0',0,0,6,128,'n','ltr','n','y','none','n',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(63,1,11,'product_original_price','Original Price','','cartthrob_price_simple','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(62,1,11,'product_price','Price','The current product price (regular or sale price)','cartthrob_price_simple','','0',0,0,8,128,'n','ltr','n','n','none','n',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(61,1,11,'product_description1','Description','','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(60,1,10,'price','Price','Enter the base price. This will be the price for minimum dimensions','cartthrob_price_simple','','0',0,0,6,128,'y','ltr','n','n','none','n',4,'any','YTo3OntzOjEyOiJmaWVsZF9wcmVmaXgiO3M6MjoiwqMiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(58,1,10,'product_images','Product Images','Image Size Requirements: 570 x 765','grid','','0',0,0,6,128,'y','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjEiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(57,1,10,'product_description','Product Description','','wygwam','','0',0,0,6,128,'y','ltr','n','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(56,1,9,'blog_description','Blog Description','','wygwam','','0',0,0,6,128,'y','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(55,1,9,'blog_thumbnail','Blog Thumbnail','Image Size Requirements: 570 x 390','file','','0',0,0,6,128,'y','ltr','n','n','none','n',1,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjMiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(54,1,8,'description_home','Description','','textarea','','0',0,0,2,128,'y','ltr','n','n','none','n',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(52,1,5,'description','Description','','wygwam','','0',0,0,6,128,'y','ltr','n','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(53,1,8,'sub_title','Sub Title','','text','','0',0,0,6,128,'y','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(51,1,7,'panels','Panels','','grid','','0',0,0,6,128,'y','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjMiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiMyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(50,1,6,'slider_images','Slider Images','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjEiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(96,1,13,'order_billing_address','Billing Address','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',18,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(97,1,13,'order_billing_address2','Billing Address 2','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',19,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(98,1,13,'order_billing_state','Billing State','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',20,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(99,1,13,'order_billing_zip','Billing Zip','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',21,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(100,1,13,'order_billing_city','Billing City','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',22,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(101,1,13,'order_billing_last_name','Billing Last Name','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',23,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(102,1,13,'order_billing_company','Billing Company','','text','','0',0,0,6,128,'n','ltr','n','n','none','y',24,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(103,1,13,'order_billing_country','Billing Country','','text','','0',0,0,6,128,'n','ltr','n','n','none','y',25,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(104,1,13,'order_country_code','Billing Country Code','','text','','0',0,0,6,3,'n','ltr','n','n','none','y',26,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(105,1,13,'order_shipping_first_name','Shipping First Name','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',27,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(106,1,13,'order_shipping_last_name','Shipping Last Name','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',28,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(107,1,13,'order_shipping_address','Shipping Address','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',29,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(108,1,13,'order_shipping_address2','Shipping Address 2','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',30,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(109,1,13,'order_shipping_city','Shipping City','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',31,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(110,1,13,'order_shipping_state','Shipping State','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',32,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(111,1,13,'order_shipping_zip','Shipping Zip','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',33,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(112,1,13,'order_shipping_company','Shipping Company','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',34,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(113,1,13,'order_shipping_country','Shipping Country','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',35,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(114,1,13,'order_shipping_country_code','Shipping Country Code','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',36,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(115,1,13,'order_error_message','Payment: Error Message','','text','','0',0,0,6,255,'n','ltr','n','n','none','n',37,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(116,1,13,'order_transaction_id','Payment: Transaction ID','','text','','0',0,0,8,128,'n','ltr','n','n','none','n',38,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(117,1,13,'order_last_four','Payment: CC Last Four Digits','','text','','0',0,0,6,4,'n','ltr','n','n','none','n',39,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(118,1,13,'order_ip_address','Payment: IP Address','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',40,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(119,1,13,'order_payment_gateway','Payment: Payment Gateway','','text','','0',0,0,6,255,'n','ltr','n','n','none','n',41,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(120,1,13,'order_subscription_id','Payment: Subscription ID','','text','','0',0,0,6,255,'n','ltr','n','n','none','n',42,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(121,1,13,'order_vault_id','Payment: Vault ID','','text','','0',0,0,6,255,'n','ltr','n','n','none','n',43,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(122,1,14,'purchased_id','ID','','text','','n',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(123,1,14,'purchased_quantity','Quantity','','text','','n',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(124,1,14,'purchased_price','Price','','cartthrob_price_simple','','n',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(125,1,14,'purchased_order_id','Order Id','','text','','n',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(126,1,14,'purchased_license_number','License Number','','text','','0',0,0,6,128,'n','ltr','n','n','none','y',5,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
	(127,1,15,'discount_type','Discount Settings','','cartthrob_discount','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(128,1,16,'packages_packages','Packages','','cartthrob_package','','0',0,0,0,0,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(129,1,16,'packages_description','Description','','textarea','','0',0,0,6,0,'n','ltr','n','n','xhtml','n',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(130,1,16,'packages_price','Price','','cartthrob_price_simple','','0',0,0,0,12,'n','ltr','n','n','xhtml','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(131,1,16,'packages_images','Images','','file','','0',0,0,0,0,'n','ltr','n','n','none','n',4,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(132,1,10,'product_thumbnails','Product thumbnails','','grid','','0',0,0,6,128,'y','ltr','n','n','xhtml','n',4,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjIiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(133,1,10,'color','Color','','multi_select','White\nCream\nNatural\nRed\nBrown\nOrange\nYellow\nBlue\nGreen\nPurple\nPink\nBlack/Grey','n',0,0,6,128,'y','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(134,1,10,'opacity','Opacity','','multi_select','Diffused\nDimout\nBlackout','n',0,0,6,128,'y','ltr','n','n','none','n',6,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(135,1,10,'style','Style','','multi_select','Plain\nPatterned\nFloral\nChildren’s','n',0,0,6,128,'y','ltr','n','n','none','n',7,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(136,1,10,'special_features','Special Features','','multi_select','Reflective\nEasy Wipe\nThermal\nOffice Friendly\nMoisture Proof\nPVC\nFlame Retardant','n',0,0,6,128,'y','ltr','n','n','none','n',8,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(139,1,10,'how_to_measure','How to Measure','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',11,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(137,1,10,'technical_specification','Technical Specification','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
	(138,1,10,'fitting_instructions_and_how_to_','Fitting instructions','','structure','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',10,'any','YTo3OntzOjE5OiJzdHJ1Y3R1cmVfbGlzdF90eXBlIjtzOjU6InBhZ2VzIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(140,1,17,'price_grid','Price Grid','All dimensions must be in \'mm\'. We will dynamically calculate price for \'cm\' and \'inch\'','grid','','0',0,0,6,128,'y','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjEiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(141,1,10,'select_price_grid','Select Price Grid','','playa','','0',0,0,6,128,'y','ltr','n','n','none','n',4,'any','YToxNDp7czo1OiJtdWx0aSI7czoxOiJuIjtzOjc6ImV4cGlyZWQiO3M6MToibiI7czo2OiJmdXR1cmUiO3M6MToieSI7czo4OiJlZGl0YWJsZSI7czoxOiJuIjtzOjg6ImNoYW5uZWxzIjthOjE6e2k6MDtzOjI6IjE5Ijt9czo4OiJzdGF0dXNlcyI7YToxOntpOjA7czo0OiJvcGVuIjt9czo3OiJvcmRlcmJ5IjtzOjU6InRpdGxlIjtzOjQ6InNvcnQiO3M6MzoiQVNDIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(142,1,13,'item_dimensions','Item Dimensions','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',44,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(143,1,14,'item_dimensions_1','item_dimensions','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(144,1,18,'panel_1','Panel 1','','grid','','0',0,0,6,128,'y','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjEiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(145,1,18,'panel_2_title','Panel 2 Title','','text','','0',0,0,6,128,'y','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
	(146,1,18,'panel_2_list','Panel 2 List','','grid','','0',0,0,6,128,'y','ltr','n','n','xhtml','n',3,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjEiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiMyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(147,1,18,'panel_3','Panel 3','','grid','','0',0,0,6,128,'y','ltr','n','n','xhtml','n',4,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjEiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiNSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
	(148,1,18,'main_image','Main Image','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');

/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_form_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_form_settings`;

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) NOT NULL DEFAULT 'open',
  `require_captcha` char(1) NOT NULL DEFAULT 'n',
  `allow_guest_posts` char(1) NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_channel_grid_field_132
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_132`;

CREATE TABLE `exp_channel_grid_field_132` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_16` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_132` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_132` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_132` (`row_id`, `entry_id`, `row_order`, `col_id_16`)
VALUES
	(1,22,0,'{filedir_4}product-minimal-1.jpg'),
	(2,22,1,'{filedir_4}product-minimal-1.jpg');

/*!40000 ALTER TABLE `exp_channel_grid_field_132` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_140
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_140`;

CREATE TABLE `exp_channel_grid_field_140` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_17` float DEFAULT '0',
  `col_id_18` float DEFAULT '0',
  `col_id_19` float DEFAULT '0',
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_140` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_140` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_140` (`row_id`, `entry_id`, `row_order`, `col_id_17`, `col_id_18`, `col_id_19`)
VALUES
	(1,24,0,1000,625,16),
	(2,24,1,1000,750,17),
	(3,24,2,1000,875,19),
	(4,24,3,1000,1000,20),
	(5,24,4,1000,1125,23),
	(6,24,5,1250,625,16);

/*!40000 ALTER TABLE `exp_channel_grid_field_140` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_144
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_144`;

CREATE TABLE `exp_channel_grid_field_144` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_20` text,
  `col_id_21` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_144` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_144` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_144` (`row_id`, `entry_id`, `row_order`, `col_id_20`, `col_id_21`)
VALUES
	(1,31,0,'Which of us ever undertakes laborious physical exercise, except to obtain.','By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accu');

/*!40000 ALTER TABLE `exp_channel_grid_field_144` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_146
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_146`;

CREATE TABLE `exp_channel_grid_field_146` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_22` text,
  `col_id_23` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_146` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_146` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_146` (`row_id`, `entry_id`, `row_order`, `col_id_22`, `col_id_23`)
VALUES
	(1,31,0,'Premium UK delivery','By creating an account with our store, you will be able to mo'),
	(2,31,1,'Tailoring for free','By creating an account with our store, you will be able to move'),
	(3,31,2,'Online Ordering','By creating an account with our store, you will be able');

/*!40000 ALTER TABLE `exp_channel_grid_field_146` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_147
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_147`;

CREATE TABLE `exp_channel_grid_field_147` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_24` text,
  `col_id_25` text,
  `col_id_26` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_147` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_147` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_147` (`row_id`, `entry_id`, `row_order`, `col_id_24`, `col_id_25`, `col_id_26`)
VALUES
	(1,31,0,'How do I use a promotional code?','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit.</p>',NULL),
	(2,31,1,'Is there any possibility?','<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.</p>','Yes');

/*!40000 ALTER TABLE `exp_channel_grid_field_147` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_50
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_50`;

CREATE TABLE `exp_channel_grid_field_50` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  `col_id_3` text,
  `col_id_4` text,
  `col_id_5` text,
  `col_id_6` text,
  `col_id_7` text,
  `col_id_8` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_50` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_50` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_50` (`row_id`, `entry_id`, `row_order`, `col_id_1`, `col_id_2`, `col_id_3`, `col_id_4`, `col_id_5`, `col_id_6`, `col_id_7`, `col_id_8`)
VALUES
	(1,16,0,'CHECK OUT THIS WEEKEND','BLINDS SALE','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sodales risus ac tellus tempor, eu lacinia quam ultricies. ','Test Button','http://www.google.ie','Test Button 2','http://www.google.com','{filedir_1}wide-1.jpg');

/*!40000 ALTER TABLE `exp_channel_grid_field_50` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_51
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_51`;

CREATE TABLE `exp_channel_grid_field_51` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_9` text,
  `col_id_10` text,
  `col_id_11` text,
  `col_id_12` text,
  `col_id_13` text,
  `col_id_14` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_51` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_51` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_51` (`row_id`, `entry_id`, `row_order`, `col_id_9`, `col_id_10`, `col_id_11`, `col_id_12`, `col_id_13`, `col_id_14`)
VALUES
	(1,17,0,'Panel Heading','Panel 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.','Test Button 1','http://www.google.ie','{filedir_1}index.png'),
	(2,17,1,'Panel Heading','Panel 2','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.','Test Button 2','http://www.google.ie','{filedir_1}index.png'),
	(3,17,2,'Panel Heading','Panel 3','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.','Test Button 3','http://www.google.ie','{filedir_1}index.png');

/*!40000 ALTER TABLE `exp_channel_grid_field_51` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_58
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_58`;

CREATE TABLE `exp_channel_grid_field_58` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_15` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_grid_field_58` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_58` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_58` (`row_id`, `entry_id`, `row_order`, `col_id_15`)
VALUES
	(1,22,0,'{filedir_4}blog-thumbnail-4-1.jpg');

/*!40000 ALTER TABLE `exp_channel_grid_field_58` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_member_groups`;

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;

INSERT INTO `exp_channel_member_groups` (`group_id`, `channel_id`)
VALUES
	(1,6),
	(3,5),
	(3,6),
	(5,6),
	(6,6),
	(7,6),
	(8,1),
	(8,2),
	(8,3),
	(8,4),
	(8,6);

/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_titles`;

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`)
VALUES
	(19,1,10,16,NULL,'::1','Hello','hello','open','y',0,0,0,0,'n','n',1470421380,'2016','08','05',0,0,20160805182648,0,0),
	(20,1,11,16,NULL,'::1','Blog 1','blog-1','open','y',0,0,0,0,'n','n',1470485760,'2016','08','06',0,0,20160806121752,0,0),
	(17,1,9,16,NULL,'::1','Homepage Featured Panel','homepage-featured-panel','open','y',0,0,0,0,'n','n',1470249360,'2016','08','03',0,0,20160803183858,0,0),
	(18,1,7,16,NULL,'::1','Blog','blog','open','y',0,0,0,0,'n','n',1470339240,'2016','08','04',0,0,20160806121006,0,0),
	(16,1,8,16,NULL,'::1','Homepage Slider','homepage-slider','open','y',0,0,0,0,'n','n',1470164460,'2016','08','02',0,0,20160802191813,0,0),
	(15,1,7,16,NULL,'::1','Test','test','open','y',0,0,0,0,'n','n',1470164460,'2016','08','02',0,0,20160810191305,0,0),
	(21,1,11,16,NULL,'::1','Blog 2','blog-2','open','y',0,0,0,0,'n','n',1470570000,'2016','08','07',0,0,20160807114030,0,0),
	(22,1,18,16,NULL,'::1','Some Product','some-product','open','y',0,0,0,0,'n','n',1470937200,'2016','08','11',0,0,20160816192617,0,0),
	(23,1,7,16,NULL,'::1','Products','products','open','y',0,0,0,0,'n','n',1470937260,'2016','08','11',0,0,20160815180938,0,0),
	(24,1,19,16,NULL,'::1','Pricing Grid 1','pricing-grid-1','open','y',0,0,0,0,'n','n',1471373820,'2016','08','16',0,0,20160816210233,0,0),
	(25,1,7,16,NULL,'::1','Pricing Grids','pricing-grids','open','y',0,0,0,0,'n','n',1471374180,'2016','08','16',0,0,20160816190443,0,0),
	(26,1,7,16,NULL,'::1','Cart','cart','open','y',0,0,0,0,'n','n',1471462680,'2016','08','17',0,0,20160817195820,0,0),
	(27,1,7,16,NULL,'::1','About','about','open','y',0,0,0,0,'n','n',1471891260,'2016','08','22',0,0,20160822184206,0,0),
	(28,1,7,16,NULL,'::1','Checkout','checkout','open','y',0,0,0,0,'n','n',1471896720,'2016','08','22',0,0,20160822201252,0,0),
	(29,1,14,16,0,'::1','Order #1','order_1','open','y',0,0,0,0,'y','n',1472065538,'2016','08','24',0,0,20160824200638,NULL,0),
	(30,1,15,16,0,'::1','Some Product','some_product-57bdf03ec50740.35506927','closed','y',0,0,0,0,'y','n',1472065538,'2016','08','24',0,0,20160824200638,NULL,0),
	(31,1,20,16,NULL,'::1','Special Page','special-page','open','y',0,0,0,0,'n','n',1472493360,'2016','08','29',0,0,20160829180223,0,0);

/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels`;

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`)
VALUES
	(9,1,'homepage_featured_panel','Homepage Featured Panel','http://localhost/blinds/',NULL,'en',1,0,1470249360,0,'',1,'open',7,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),
	(10,1,'homepage_introduction','Homepage Introduction','http://localhost/blinds/',NULL,'en',1,0,1470421380,0,'',1,'open',8,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),
	(11,1,'blog','Blog','http://localhost/blinds/',NULL,'en',2,0,1470570000,0,'',1,'open',9,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),
	(8,1,'homepage_slider','Homepage Slider','http://localhost/blinds/',NULL,'en',1,0,1470164460,0,'',1,'open',6,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),
	(7,1,'standard_text','Standard Text','http://it3sixty.codelab.ie/',NULL,'en',7,0,1471896720,0,'',1,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),
	(12,1,'products','Store - Products','','','en',0,0,0,0,'',1,'open',11,0,'','y','y',0,'all','y','n','n','','','y','n','n','n',0,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),
	(13,1,'coupon_codes','Store - Coupon Codes','','','en',0,0,0,0,'',1,'open',12,0,'','y','y',0,'all','y','y','n','','','y','n','n','n',0,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),
	(14,1,'orders','Store - Orders','','','en',0,0,0,0,'',1,'open',13,0,'','y','y',0,'all','y','n','n','','','y','n','n','n',0,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),
	(15,1,'purchased_items','Store - Purchased Items','','','en',0,0,0,0,'1',1,'open',14,0,'','y','y',0,'all','y','n','n','','','y','n','n','n',0,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),
	(16,1,'discounts','Store - Discounts','','','en',0,0,0,0,'',1,'open',15,0,'','y','y',0,'all','y','y','n','','','y','n','n','n',0,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),
	(17,1,'store_packages','Store - Packages','','','en',0,0,0,0,'',1,'open',16,0,'','y','y',0,'all','y','y','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),
	(18,1,'products_manual','Products','http://localhost/blinds/',NULL,'en',1,0,1470937200,0,'',NULL,'open',10,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),
	(19,1,'pricing_grid','Pricing Grid','http://localhost/blinds/',NULL,'en',1,0,1471373820,0,'',1,'open',17,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),
	(20,1,'special_page','Special Page','http://localhost/blinds/',NULL,'en',1,0,1472493360,0,'',3,'open',18,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0);

/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_comment_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comment_subscriptions`;

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comments`;

CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`),
  KEY `comment_date_idx` (`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_content_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_content_types`;

CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_content_types` WRITE;
/*!40000 ALTER TABLE `exp_content_types` DISABLE KEYS */;

INSERT INTO `exp_content_types` (`content_type_id`, `name`)
VALUES
	(1,'grid'),
	(2,'channel');

/*!40000 ALTER TABLE `exp_content_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_log`;

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`)
VALUES
	(1,1,1,'Paul','127.0.0.1',1424131893,'Logged in'),
	(2,1,1,'Paul','127.0.0.1',1424132028,'Logged out'),
	(3,1,1,'Paul','127.0.0.1',1424132033,'Logged in'),
	(4,1,1,'Paul','127.0.0.1',1424132267,'Logged in'),
	(5,1,1,'Paul','127.0.0.1',1424208488,'Logged in'),
	(6,1,1,'Paul','127.0.0.1',1424620863,'Logged in'),
	(7,1,1,'Paul','127.0.0.1',1424620893,'Channel Created:&nbsp;&nbsp;Candidates'),
	(8,1,1,'Paul','127.0.0.1',1424620907,'Channel Created:&nbsp;&nbsp;Companies'),
	(9,1,1,'Paul','127.0.0.1',1424621009,'Channel Created:&nbsp;&nbsp;Company Pages'),
	(10,1,1,'Paul','127.0.0.1',1424621023,'Channel Created:&nbsp;&nbsp;Candidate Pages'),
	(11,1,1,'Paul','127.0.0.1',1424621049,'Field Group Created:&nbsp;Candidates'),
	(12,1,1,'Paul','127.0.0.1',1424621056,'Field Group Created:&nbsp;Companies'),
	(13,1,1,'Paul','127.0.0.1',1424635223,'Logged in'),
	(14,1,1,'Paul','127.0.0.1',1424638953,'Logged in'),
	(15,1,1,'Paul','127.0.0.1',1424729331,'Logged in'),
	(16,1,1,'Paul','127.0.0.1',1424731840,'Channel Created:&nbsp;&nbsp;Members'),
	(17,1,1,'Paul','127.0.0.1',1424731876,'Field Group Created:&nbsp;Members'),
	(18,1,1,'Paul','127.0.0.1',1424732024,'Channel Deleted:&nbsp;&nbsp;Zoo Visitor Members'),
	(19,1,1,'Paul','127.0.0.1',1424732037,'Field group Deleted:&nbsp;&nbsp;Zoo Visitor Fields'),
	(20,1,1,'Paul','127.0.0.1',1424732054,'Logged in'),
	(21,1,1,'Paul','127.0.0.1',1424732099,'Status Group Deleted:&nbsp;Zoo Visitor Membergroup'),
	(22,1,1,'Paul','127.0.0.1',1424732107,'Status Group Created:&nbsp;Members'),
	(23,1,1,'Paul','127.0.0.1',1424898752,'Logged in'),
	(24,1,1,'Paul','127.0.0.1',1424899903,'Custom Field Deleted:&nbsp;Candidate Email'),
	(25,1,1,'Paul','127.0.0.1',1424899909,'Custom Field Deleted:&nbsp;Candidate Email Confirm'),
	(26,1,1,'Paul','127.0.0.1',1424900026,'Member Group Created:&nbsp;&nbsp;Candidates'),
	(27,1,1,'Paul','127.0.0.1',1424900038,'Member Group Created:&nbsp;&nbsp;Companies'),
	(28,1,1,'Paul','127.0.0.1',1424900202,'Member Group Updated:&nbsp;&nbsp;Candidates'),
	(29,1,1,'Paul','127.0.0.1',1424900514,'Member Group Updated:&nbsp;&nbsp;Companies'),
	(30,1,1,'Paul','127.0.0.1',1424900544,'Member Group Updated:&nbsp;&nbsp;Guests'),
	(31,1,1,'Paul','127.0.0.1',1424900660,'Member Group Created:&nbsp;&nbsp;Align IT Staff'),
	(32,1,1,'Paul','127.0.0.1',1424901171,'Logged in'),
	(33,1,1,'Paul','127.0.0.1',1424912200,'Logged in'),
	(34,1,1,'Paul','127.0.0.1',1424912212,'Logged in'),
	(35,1,1,'Paul','127.0.0.1',1424993340,'Logged in'),
	(36,1,1,'Paul','127.0.0.1',1425415166,'Logged in'),
	(37,1,1,'Paul','127.0.0.1',1425421594,'Logged in'),
	(38,1,1,'Paul','127.0.0.1',1425426628,'Logged in'),
	(39,1,1,'Paul','127.0.0.1',1425585470,'Logged in'),
	(40,1,1,'Paul','127.0.0.1',1425585470,'Logged in'),
	(41,1,1,'Paul','127.0.0.1',1425590360,'Logged in'),
	(42,1,1,'Paul','127.0.0.1',1425666849,'Logged in'),
	(43,1,1,'Paul','127.0.0.1',1425666862,'Logged in'),
	(44,1,1,'Paul','127.0.0.1',1425677551,'Logged in'),
	(45,1,1,'Paul','127.0.0.1',1425774996,'Logged in'),
	(46,1,1,'Paul','127.0.0.1',1425846940,'Logged in'),
	(47,1,1,'Paul','217.112.147.12',1425901207,'Logged in'),
	(48,1,1,'Paul','217.112.147.12',1425997596,'Logged in'),
	(49,1,1,'Paul','217.112.147.12',1426000172,'Custom Field Deleted:&nbsp;Candidate Background'),
	(50,1,1,'Paul','217.112.147.12',1426002230,'Logged in'),
	(51,1,1,'Paul','217.112.147.12',1426002660,'Logged in'),
	(52,1,1,'Paul','217.112.147.12',1426002680,'Logged out'),
	(53,1,1,'Paul','217.112.147.12',1426002805,'Logged in'),
	(54,1,1,'Paul','217.112.147.12',1426003268,'Channel Created:&nbsp;&nbsp;Standard Text'),
	(55,1,1,'Paul','217.112.147.12',1426003281,'Field Group Created:&nbsp;Standard Page'),
	(56,1,1,'Paul','217.112.147.12',1426071293,'Logged in'),
	(57,1,1,'Paul','217.112.147.12',1426072311,'Member Group Updated:&nbsp;&nbsp;IT3Sixty Staff'),
	(58,1,1,'Paul','217.112.147.12',1426075633,'Logged in'),
	(59,1,1,'Paul','217.112.147.12',1426075896,'Member Group Updated:&nbsp;&nbsp;Employers'),
	(60,1,1,'Paul','127.0.0.1',1426083472,'Logged in'),
	(61,1,1,'Paul','127.0.0.1',1426088078,'Logged out'),
	(62,1,1,'Paul','127.0.0.1',1426088186,'Logged in'),
	(63,1,1,'Paul','127.0.0.1',1426088272,'Logged out'),
	(64,1,1,'Paul','127.0.0.1',1426088875,'Logged in'),
	(65,1,1,'Paul','127.0.0.1',1426088898,'Logged out'),
	(66,1,1,'Paul','127.0.0.1',1426090193,'Logged in'),
	(67,1,1,'Paul','127.0.0.1',1426090416,'Logged out'),
	(68,1,1,'Paul','127.0.0.1',1426091918,'Logged in'),
	(69,1,1,'Paul','127.0.0.1',1426091970,'Logged out'),
	(70,1,1,'Paul','127.0.0.1',1426091991,'Logged in'),
	(71,1,1,'Paul','127.0.0.1',1426092020,'Logged out'),
	(72,1,1,'Paul','127.0.0.1',1426093650,'Logged in'),
	(73,1,1,'Paul','127.0.0.1',1426094319,'Logged out'),
	(74,1,1,'Paul','127.0.0.1',1426346027,'Logged in'),
	(75,1,1,'Paul','127.0.0.1',1426716351,'Logged in'),
	(76,1,1,'Paul','127.0.0.1',1427641936,'Logged in'),
	(77,1,1,'Paul','127.0.0.1',1427663207,'Logged in'),
	(78,1,1,'Paul','::1',1469653083,'Logged in'),
	(79,1,1,'Paul','::1',1469653151,'Member profile created:&nbsp;&nbsp;blinds'),
	(80,1,1,'Paul','::1',1469653154,'Logged out'),
	(81,1,16,'blinds','::1',1469653156,'Logged in'),
	(82,1,16,'blinds','::1',1469653195,'Channel Deleted:&nbsp;&nbsp;Candidate Pages'),
	(83,1,16,'blinds','::1',1469653200,'Channel Deleted:&nbsp;&nbsp;Candidates'),
	(84,1,16,'blinds','::1',1469653205,'Channel Deleted:&nbsp;&nbsp;Company Pages'),
	(85,1,16,'blinds','::1',1469653209,'Channel Deleted:&nbsp;&nbsp;Employers'),
	(86,1,16,'blinds','::1',1469653214,'Channel Deleted:&nbsp;&nbsp;Members'),
	(87,1,16,'blinds','::1',1470163632,'Logged in'),
	(88,1,16,'blinds','::1',1470163773,'Field Group Created:&nbsp;Home Slider'),
	(89,1,16,'blinds','::1',1470164181,'Custom Field Deleted:&nbsp;Top Text'),
	(90,1,16,'blinds','::1',1470164386,'Channel Created:&nbsp;&nbsp;Homepage Slider'),
	(91,1,16,'blinds','::1',1470164393,'Field group Deleted:&nbsp;&nbsp;Candidates'),
	(92,1,16,'blinds','::1',1470164403,'Field group Deleted:&nbsp;&nbsp;Employers'),
	(93,1,16,'blinds','::1',1470164413,'Field group Deleted:&nbsp;&nbsp;Members'),
	(94,1,16,'blinds','::1',1470249009,'Logged in'),
	(95,1,16,'blinds','::1',1470249154,'Field Group Created:&nbsp;Featured Panel'),
	(96,1,16,'blinds','::1',1470249402,'Channel Created:&nbsp;&nbsp;Homepage Featured Panel'),
	(97,1,16,'blinds','::1',1470339242,'Logged in'),
	(98,1,16,'blinds','::1',1470421231,'Logged in'),
	(99,1,16,'blinds','::1',1470421258,'Field Group Created:&nbsp;Homepage Intro'),
	(100,1,16,'blinds','::1',1470421366,'Channel Created:&nbsp;&nbsp;Homepage Introduction'),
	(101,1,16,'blinds','::1',1470484712,'Logged in'),
	(102,1,16,'blinds','::1',1470484805,'Field Group Created:&nbsp;Blog'),
	(103,1,16,'blinds','::1',1470485129,'Upload Preference Deleted:&nbsp;&nbsp;Employers [local]'),
	(104,1,16,'blinds','::1',1470485366,'Channel Created:&nbsp;&nbsp;Blog'),
	(105,1,16,'blinds','::1',1470570012,'Logged in'),
	(106,1,16,'blinds','::1',1470856206,'Logged in'),
	(107,1,16,'blinds','::1',1470857448,'Field Group Created:&nbsp;products'),
	(108,1,16,'blinds','::1',1470858232,'Custom Field Deleted:&nbsp;Quantity'),
	(109,1,16,'blinds','::1',1470858394,'Channel Created:&nbsp;&nbsp;Products'),
	(110,1,16,'blinds','::1',1470936681,'Logged in'),
	(111,1,16,'blinds','::1',1470941223,'Logged in'),
	(112,1,16,'blinds','::1',1471283798,'Logged in'),
	(113,1,16,'blinds','::1',1471292917,'Logged in'),
	(114,1,16,'blinds','::1',1471373694,'Logged in'),
	(115,1,16,'blinds','::1',1471373727,'Field Group Created:&nbsp;price grid'),
	(116,1,16,'blinds','::1',1471373825,'Channel Created:&nbsp;&nbsp;Pricing Grid'),
	(117,1,16,'blinds','::1',1471381166,'Logged in'),
	(118,1,16,'blinds','::1',1471459177,'Logged in'),
	(119,1,16,'blinds','::1',1471462686,'Logged in'),
	(120,1,16,'blinds','::1',1471891285,'Logged in'),
	(121,1,16,'blinds','::1',1471896723,'Logged in'),
	(122,1,16,'blinds','::1',1472065629,'Logged in'),
	(123,1,16,'blinds','::1',1472492104,'Logged in'),
	(124,1,16,'blinds','::1',1472492164,'Field Group Created:&nbsp;Special Page'),
	(125,1,16,'blinds','::1',1472492721,'Channel Created:&nbsp;&nbsp;Special Page'),
	(126,1,16,'blinds','::1',1472672229,'Logged in'),
	(127,1,16,'blinds','::1',1472672310,'Logged in'),
	(128,1,16,'blinds','::1',1472672323,'Logged in'),
	(129,1,16,'blinds','::1',1472672460,'Logged in');

/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_search_index`;

CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_developer_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_developer_log`;

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  `hash` char(32) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;

INSERT INTO `exp_developer_log` (`log_id`, `timestamp`, `viewed`, `description`, `function`, `line`, `file`, `deprecated_since`, `use_instead`, `template_id`, `template_name`, `template_group`, `addon_module`, `addon_method`, `snippets`, `hash`)
VALUES
	(1,1425591667,'n',NULL,'restore_xid()',138,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,13,'registration','candidates','Zoo_visitor','registration_form','sn:members_registration','4a521c146e50464ee82a05649dae38d8'),
	(2,1427663563,'n',NULL,'secure_forms_check()',2039,'system/expressionengine/third_party/zoo_visitor/libraries/Zoo_visitor_lib.php','2.8',NULL,0,NULL,NULL,NULL,NULL,NULL,'cf444fed6ef362c58e9788e90c3c6ec2'),
	(3,1426715512,'n',NULL,'restore_xid()',138,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,0,NULL,NULL,NULL,NULL,NULL,'5ca4a37f662d574301cdcde706c30a8d'),
	(4,1472492155,'n',NULL,'add_to_head()',213,'system/expressionengine/third_party/structure/mcp.structure.php','2.8','CP::add_to_foot() for scripts',0,NULL,NULL,NULL,NULL,NULL,'69217894ce0af722c881edbde81fe471'),
	(5,1426069806,'n',NULL,'restore_xid()',138,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,17,'register','account','Zoo_visitor','registration_form','sn:members_registration','0ad28ea4aea382bde92d511a7829097a'),
	(6,1425422083,'n',NULL,'restore_xid()',134,'system/expressionengine/third_party/zoo_visitor/libraries/Zoo_visitor_lib.php','2.8',NULL,16,'index','account','Zoo_visitor','login_form','sn:members_login','88bc66e4c46c04a96212032001de23fe'),
	(7,1426035181,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,19,'profile','account','Zoo_visitor','update_form','sn:members_profile','b7c62db74a21c168595ec1bcb9c96b1e'),
	(8,1425427397,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,20,'password','account','Zoo_visitor','update_form',NULL,'ce7c712c7983ed2038395c6d94e77c44'),
	(9,1427645771,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,21,'email','account','Zoo_visitor','update_form',NULL,'61f95f1aac6308ed8db610fc84c25176'),
	(10,1425591604,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,4,'profile','zoo_visitor_example','Zoo_visitor','update_form',NULL,'5ab127a61fc1d5caae012315a6d5e763'),
	(11,1425592389,'n',NULL,'restore_xid()',138,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,19,'profile','account','Zoo_visitor','registration_form','sn:members_profile','85cd6ffdbd3ac56597b04ec416d0e0e8'),
	(12,1425596625,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,20,'password','account','Zoo_visitor','update_form','sn:members_password-change','a01769cfc6b7ebfae10c1f85e7671369'),
	(13,1425864458,'n',NULL,'restore_xid()',134,'system/expressionengine/third_party/zoo_visitor/libraries/zoo_visitor_lib.php','2.8',NULL,16,'index','account','Zoo_visitor','login_form','sn:members_login','4ebb7b11b6cdc27b1bb622279f4cbfa8'),
	(14,1425893495,'n',NULL,'secure_forms_check()',2039,'system/expressionengine/third_party/zoo_visitor/libraries/zoo_visitor_lib.php','2.8',NULL,0,NULL,NULL,NULL,NULL,NULL,'7713a201b4a627d84e3744e7b20604c7'),
	(15,1426082939,'n',NULL,'restore_xid()',138,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,17,'register','account','Zoo_visitor','registration_form','sn:members_registration|sn:account_registration|sn:employers_register','74bebeecec46f952e120d3fbcf0a5d74'),
	(16,1427663487,'n',NULL,'restore_xid()',138,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,17,'register','account','Zoo_visitor','registration_form','sn:account_registration','28013536fc957b078efba54a05896b4c'),
	(17,1427642545,'n',NULL,'add_to_head()',528,'system/expressionengine/third_party/field_editor/mcp.field_editor.php','2.8','CP::add_to_foot() for scripts',0,NULL,NULL,NULL,NULL,NULL,'590ef0aef679e519f4574e734c5999dd'),
	(18,1427642545,'n',NULL,'add_to_head()',530,'system/expressionengine/third_party/field_editor/mcp.field_editor.php','2.8','CP::add_to_foot() for scripts',0,NULL,NULL,NULL,NULL,NULL,'a7603e0cc0ccd3327ee8229186a97ad4'),
	(19,1426088022,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,19,'profile','account','Zoo_visitor','update_form','sn:members_profile|sn:candidates_profile','858ab1e308a2fc1be915cae300d97302'),
	(20,1426091784,'n',NULL,'restore_xid()',134,'system/expressionengine/third_party/zoo_visitor/libraries/Zoo_visitor_lib.php','2.8',NULL,16,'index','account','Zoo_visitor','login_form','sn:members_login|sn:account_login','bb61e2f056818ba0406e1b3c903c7619'),
	(21,1427642115,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,19,'profile','account','Zoo_visitor','update_form','sn:members_profile|sn:candidates_profile|sn:employers_profile','408f4045726b9279b11a36feb605983c'),
	(22,1427641981,'n',NULL,'restore_xid()',134,'system/expressionengine/third_party/zoo_visitor/libraries/Zoo_visitor_lib.php','2.8',NULL,16,'index','account','Zoo_visitor','login_form',NULL,'0a2f2d4a5609d96812d830ed90cbc68d'),
	(23,1427645775,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,20,'password','account','Zoo_visitor','update_form','sn:members_password-change|sn:account_password-change','ed7cac95025bd3d8fc81e17fa573934a'),
	(24,1427664319,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,19,'profile','account','Zoo_visitor','update_form','sn:candidates_profile','d1b937566efdb39a1c24855c5c7ac221'),
	(25,1427664319,'n',NULL,'restore_xid()',249,'system/expressionengine/third_party/zoo_visitor/mod.zoo_visitor.php','2.8',NULL,19,'profile','account','Zoo_visitor','update_form','sn:members_profile|sn:employers_profile','c7da476a5b1ce8278e13a23f04478ba3'),
	(26,1471463469,'n',NULL,'set_cookie()',188,'system/expressionengine/third_party/cartthrob/libraries/Languages.php','2.8','EE_Input::set_cookie()',0,NULL,NULL,NULL,NULL,NULL,'722d80cd8c4d2c47ec06288359d325f8');

/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_email_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache`;

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(75) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache_mg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_mg`;

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_cache_ml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_ml`;

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_console_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_console_cache`;

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(75) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_email_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_tracker`;

CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_entry_versioning
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_versioning`;

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_extensions`;

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`)
VALUES
	(37,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y'),
	(36,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),
	(3,'Zoo_visitor_ext','hook_sessions_end','sessions_end','',1,'1.3.32','y'),
	(4,'Zoo_visitor_ext','hook_member_member_register','member_member_register','',1,'1.3.32','y'),
	(5,'Zoo_visitor_ext','hook_member_member_register_start','member_member_register_start','',1,'1.3.32','y'),
	(6,'Zoo_visitor_ext','hook_member_register_validate_members','member_register_validate_members','',1,'1.3.32','y'),
	(7,'Zoo_visitor_ext','hook_cp_members_member_create','cp_members_member_create','',1,'1.3.32','y'),
	(8,'Zoo_visitor_ext','hook_cp_members_member_delete_end','cp_members_member_delete_end','',1,'1.3.32','y'),
	(9,'Zoo_visitor_ext','hook_cp_members_validate_members','cp_members_validate_members','',1,'1.3.32','y'),
	(10,'Zoo_visitor_ext','hook_safecracker_submit_entry_start','channel_form_submit_entry_start','',1,'1.3.32','y'),
	(11,'Zoo_visitor_ext','hook_safecracker_submit_entry_end','channel_form_submit_entry_end','',1,'1.3.32','y'),
	(12,'Zoo_visitor_ext','hook_entry_submission_end','entry_submission_end','',1,'1.3.32','y'),
	(13,'Zoo_visitor_ext','hook_cp_js_end','cp_js_end','',1,'1.3.32','y'),
	(14,'Zoo_visitor_ext','hook_membrr_subscribe','membrr_subscribe','',1,'1.3.32','y'),
	(15,'Zoo_visitor_ext','hook_membrr_expire','membrr_expire','',1,'1.3.32','y'),
	(16,'Snippet_sync_ext','sessions_end','sessions_end','a:7:{s:6:\"hashes\";a:1:{i:1;a:33:{s:16:\"sn:main_comments\";a:2:{i:0;s:32:\"8d4e413c58e30ad2561e2f2e2842c9ef\";i:1;s:10:\"1384634440\";}s:14:\"sn:main_footer\";a:2:{i:0;s:32:\"fc39ea9accbb7f877b790b5a6f970ca5\";i:1;s:10:\"1384380090\";}s:14:\"sn:main_header\";a:2:{i:0;s:32:\"6ff1df4d4e412c2b3b178ea3dd0fae86\";i:1;s:10:\"1384383099\";}s:19:\"sn:main_html-footer\";a:2:{i:0;s:32:\"7919d8d311e32af091446dde74bb49f6\";i:1;s:10:\"1384382475\";}s:19:\"sn:main_html-header\";a:2:{i:0;s:32:\"593ac19a5d0c3e77185c1b96de0f2b25\";i:1;s:10:\"1384385635\";}s:16:\"sn:global_footer\";a:2:{i:0;s:32:\"81a06557c4c6eb9fc08b66db0dad6772\";i:1;s:10:\"1472068333\";}s:16:\"sn:global_header\";a:2:{i:0;s:32:\"e6667be36738c052af4b7066bb95c5e0\";i:1;s:10:\"1472068245\";}s:21:\"sn:global_html-footer\";a:2:{i:0;s:32:\"f3a1a11d902fe49fc7e3c2e82a97b3c9\";i:1;s:10:\"1471893924\";}s:21:\"sn:global_html-header\";a:2:{i:0;s:32:\"854908c7becc158f1847168625ab2c26\";i:1;s:10:\"1469988828\";}s:16:\"sn:members_login\";a:2:{i:0;s:32:\"c5c6f3a1f9b972feacaed0afb486afc8\";i:1;s:10:\"1425595536\";}s:26:\"sn:members_password-change\";a:2:{i:0;s:32:\"acc46a5e619b2cbf0d45df923ce2e058\";i:1;s:10:\"1425597642\";}s:26:\"sn:members_password-forgot\";a:2:{i:0;s:32:\"30634868c705c8c04e7d1886225376b8\";i:1;s:10:\"1425597654\";}s:25:\"sn:members_password-reset\";a:2:{i:0;s:32:\"7589d9438ed735d0357768d0eb409842\";i:1;s:10:\"1425597662\";}s:18:\"sn:members_profile\";a:2:{i:0;s:32:\"82421dbb6070ab3768e8bcc5ac4de30a\";i:1;s:10:\"1426002196\";}s:23:\"sn:members_registration\";a:2:{i:0;s:32:\"9b878df97539ea046fff5808926c9ce1\";i:1;s:10:\"1426002197\";}s:16:\"sn:account_login\";a:2:{i:0;s:32:\"c5c6f3a1f9b972feacaed0afb486afc8\";i:1;s:10:\"1425901015\";}s:26:\"sn:account_password-change\";a:2:{i:0;s:32:\"acc46a5e619b2cbf0d45df923ce2e058\";i:1;s:10:\"1425901015\";}s:26:\"sn:account_password-forgot\";a:2:{i:0;s:32:\"30634868c705c8c04e7d1886225376b8\";i:1;s:10:\"1425901015\";}s:25:\"sn:account_password-reset\";a:2:{i:0;s:32:\"7589d9438ed735d0357768d0eb409842\";i:1;s:10:\"1425901015\";}s:23:\"sn:account_registration\";a:2:{i:0;s:32:\"2349e7bfe712314bda7e43b9addfda2a\";i:1;s:10:\"1427663461\";}s:21:\"sn:candidates_profile\";a:2:{i:0;s:32:\"fab32b3b64df8a3f3d293e02c141dd76\";i:1;s:10:\"1427664604\";}s:21:\"sn:employers_register\";a:2:{i:0;s:32:\"9b878df97539ea046fff5808926c9ce1\";i:1;s:10:\"1426073461\";}s:20:\"sn:employers_profile\";a:2:{i:0;s:32:\"a355e7dedf4dfcc428c0dec0fe737f07\";i:1;s:10:\"1427664705\";}s:17:\"sn:account_update\";a:2:{i:0;s:32:\"ae2ac739144629167a14545bf96501e8\";i:1;s:10:\"1426094254\";}s:20:\"sn:global_breadcrumb\";a:2:{i:0;s:32:\"26a5fe856eebb231d1eb7c49a4e3edc0\";i:1;s:10:\"1443949479\";}s:20:\"sn:global_navigation\";a:2:{i:0;s:32:\"696ec73d7390db93f057c47b67c7b4a9\";i:1;s:10:\"1443949480\";}s:17:\"sn:global_sidebar\";a:2:{i:0;s:32:\"cedc9a08be9e8a934ef0df144589aa62\";i:1;s:10:\"1443949481\";}s:14:\"sn:home_slider\";a:2:{i:0;s:32:\"36e482a206b3f2f7c2979a708bad2006\";i:1;s:10:\"1470937644\";}s:22:\"sn:home_featured-panel\";a:2:{i:0;s:32:\"dc773d90307bad6697e93156edbc0e16\";i:1;s:10:\"1470249946\";}s:16:\"sn:global_search\";a:2:{i:0;s:32:\"d936dfa4fc26444dfdceb970365ef7cf\";i:1;s:10:\"1470339591\";}s:22:\"sn:global_header-inner\";a:2:{i:0;s:32:\"e79e2589f6e6fa7a6cb8d04fabd99060\";i:1;s:10:\"1470343724\";}s:22:\"sn:global_footer-inner\";a:2:{i:0;s:32:\"a877f3b539b8141755a4d26eedeb1b44\";i:1;s:10:\"1470343391\";}s:14:\"sn:global_cart\";a:2:{i:0;s:32:\"78137fa4829442aa9849d971e52ed7a8\";i:1;s:10:\"1472065262\";}}}s:6:\"prefix\";s:3:\"sn:\";s:16:\"subfolder_suffix\";s:1:\"_\";s:19:\"suffix_as_separator\";s:1:\"n\";s:17:\"msm_shared_folder\";s:6:\"shared\";s:9:\"hide_menu\";s:1:\"n\";s:14:\"enable_cleanup\";s:1:\"n\";}',2,'1.3.5','y'),
	(17,'Snippet_sync_ext','show_full_control_panel_end','show_full_control_panel_end','a:7:{s:6:\"hashes\";a:1:{i:1;a:33:{s:16:\"sn:main_comments\";a:2:{i:0;s:32:\"8d4e413c58e30ad2561e2f2e2842c9ef\";i:1;s:10:\"1384634440\";}s:14:\"sn:main_footer\";a:2:{i:0;s:32:\"fc39ea9accbb7f877b790b5a6f970ca5\";i:1;s:10:\"1384380090\";}s:14:\"sn:main_header\";a:2:{i:0;s:32:\"6ff1df4d4e412c2b3b178ea3dd0fae86\";i:1;s:10:\"1384383099\";}s:19:\"sn:main_html-footer\";a:2:{i:0;s:32:\"7919d8d311e32af091446dde74bb49f6\";i:1;s:10:\"1384382475\";}s:19:\"sn:main_html-header\";a:2:{i:0;s:32:\"593ac19a5d0c3e77185c1b96de0f2b25\";i:1;s:10:\"1384385635\";}s:16:\"sn:global_footer\";a:2:{i:0;s:32:\"81a06557c4c6eb9fc08b66db0dad6772\";i:1;s:10:\"1472068333\";}s:16:\"sn:global_header\";a:2:{i:0;s:32:\"e6667be36738c052af4b7066bb95c5e0\";i:1;s:10:\"1472068245\";}s:21:\"sn:global_html-footer\";a:2:{i:0;s:32:\"f3a1a11d902fe49fc7e3c2e82a97b3c9\";i:1;s:10:\"1471893924\";}s:21:\"sn:global_html-header\";a:2:{i:0;s:32:\"854908c7becc158f1847168625ab2c26\";i:1;s:10:\"1469988828\";}s:16:\"sn:members_login\";a:2:{i:0;s:32:\"c5c6f3a1f9b972feacaed0afb486afc8\";i:1;s:10:\"1425595536\";}s:26:\"sn:members_password-change\";a:2:{i:0;s:32:\"acc46a5e619b2cbf0d45df923ce2e058\";i:1;s:10:\"1425597642\";}s:26:\"sn:members_password-forgot\";a:2:{i:0;s:32:\"30634868c705c8c04e7d1886225376b8\";i:1;s:10:\"1425597654\";}s:25:\"sn:members_password-reset\";a:2:{i:0;s:32:\"7589d9438ed735d0357768d0eb409842\";i:1;s:10:\"1425597662\";}s:18:\"sn:members_profile\";a:2:{i:0;s:32:\"82421dbb6070ab3768e8bcc5ac4de30a\";i:1;s:10:\"1426002196\";}s:23:\"sn:members_registration\";a:2:{i:0;s:32:\"9b878df97539ea046fff5808926c9ce1\";i:1;s:10:\"1426002197\";}s:16:\"sn:account_login\";a:2:{i:0;s:32:\"c5c6f3a1f9b972feacaed0afb486afc8\";i:1;s:10:\"1425901015\";}s:26:\"sn:account_password-change\";a:2:{i:0;s:32:\"acc46a5e619b2cbf0d45df923ce2e058\";i:1;s:10:\"1425901015\";}s:26:\"sn:account_password-forgot\";a:2:{i:0;s:32:\"30634868c705c8c04e7d1886225376b8\";i:1;s:10:\"1425901015\";}s:25:\"sn:account_password-reset\";a:2:{i:0;s:32:\"7589d9438ed735d0357768d0eb409842\";i:1;s:10:\"1425901015\";}s:23:\"sn:account_registration\";a:2:{i:0;s:32:\"2349e7bfe712314bda7e43b9addfda2a\";i:1;s:10:\"1427663461\";}s:21:\"sn:candidates_profile\";a:2:{i:0;s:32:\"fab32b3b64df8a3f3d293e02c141dd76\";i:1;s:10:\"1427664604\";}s:21:\"sn:employers_register\";a:2:{i:0;s:32:\"9b878df97539ea046fff5808926c9ce1\";i:1;s:10:\"1426073461\";}s:20:\"sn:employers_profile\";a:2:{i:0;s:32:\"a355e7dedf4dfcc428c0dec0fe737f07\";i:1;s:10:\"1427664705\";}s:17:\"sn:account_update\";a:2:{i:0;s:32:\"ae2ac739144629167a14545bf96501e8\";i:1;s:10:\"1426094254\";}s:20:\"sn:global_breadcrumb\";a:2:{i:0;s:32:\"26a5fe856eebb231d1eb7c49a4e3edc0\";i:1;s:10:\"1443949479\";}s:20:\"sn:global_navigation\";a:2:{i:0;s:32:\"696ec73d7390db93f057c47b67c7b4a9\";i:1;s:10:\"1443949480\";}s:17:\"sn:global_sidebar\";a:2:{i:0;s:32:\"cedc9a08be9e8a934ef0df144589aa62\";i:1;s:10:\"1443949481\";}s:14:\"sn:home_slider\";a:2:{i:0;s:32:\"36e482a206b3f2f7c2979a708bad2006\";i:1;s:10:\"1470937644\";}s:22:\"sn:home_featured-panel\";a:2:{i:0;s:32:\"dc773d90307bad6697e93156edbc0e16\";i:1;s:10:\"1470249946\";}s:16:\"sn:global_search\";a:2:{i:0;s:32:\"d936dfa4fc26444dfdceb970365ef7cf\";i:1;s:10:\"1470339591\";}s:22:\"sn:global_header-inner\";a:2:{i:0;s:32:\"e79e2589f6e6fa7a6cb8d04fabd99060\";i:1;s:10:\"1470343724\";}s:22:\"sn:global_footer-inner\";a:2:{i:0;s:32:\"a877f3b539b8141755a4d26eedeb1b44\";i:1;s:10:\"1470343391\";}s:14:\"sn:global_cart\";a:2:{i:0;s:32:\"78137fa4829442aa9849d971e52ed7a8\";i:1;s:10:\"1472065262\";}}}s:6:\"prefix\";s:3:\"sn:\";s:16:\"subfolder_suffix\";s:1:\"_\";s:19:\"suffix_as_separator\";s:1:\"n\";s:17:\"msm_shared_folder\";s:6:\"shared\";s:9:\"hide_menu\";s:1:\"n\";s:14:\"enable_cleanup\";s:1:\"n\";}',2,'1.3.5','y'),
	(18,'Republic_variables_ext','sessions_start','sessions_start','',10,'2.0.6','y'),
	(19,'Republic_variables_ext','template_post_parse','template_post_parse','',10,'2.0.6','y'),
	(20,'Structure_ext','entry_submission_redirect','entry_submission_redirect','',10,'3.3.14.7','y'),
	(21,'Structure_ext','cp_member_login','cp_member_login','',10,'3.3.14.7','y'),
	(22,'Structure_ext','sessions_start','sessions_start','',10,'3.3.14.7','y'),
	(23,'Structure_ext','channel_module_create_pagination','pagination_create','',9,'3.3.14.7','y'),
	(24,'Structure_ext','wygwam_config','wygwam_config','',10,'3.3.14.7','y'),
	(25,'Structure_ext','core_template_route','core_template_route','',10,'3.3.14.7','y'),
	(26,'Structure_ext','entry_submission_end','entry_submission_end','',10,'3.3.14.7','y'),
	(27,'Structure_ext','channel_form_submit_entry_end','channel_form_submit_entry_end','',10,'3.3.14.7','y'),
	(28,'Structure_ext','template_post_parse','template_post_parse','',10,'3.3.14.7','y'),
	(29,'Playa_ext','channel_entries_tagdata','channel_entries_tagdata','',9,'4.4.5','y'),
	(38,'Field_editor_ext','cp_menu_array','cp_menu_array','',10,'1.0.8','y'),
	(39,'Field_editor_ext','publish_form_channel_preferences','publish_form_channel_preferences','',10,'1.0.8','y'),
	(40,'Cartthrob_ext','member_member_logout','member_member_logout','',10,'2.71','y'),
	(41,'Cartthrob_ext','member_member_login','member_member_login_multi','',1,'2.71','y'),
	(42,'Cartthrob_ext','member_member_login','member_member_login_single','',1,'2.71','y'),
	(43,'Cartthrob_ext','member_member_login','cp_member_login','',1,'2.71','y'),
	(44,'Cartthrob_ext','cp_menu_array','cp_menu_array','',10,'2.71','y'),
	(45,'Cartthrob_ext','entry_submission_end','entry_submission_end','',10,'2.71','y'),
	(46,'Cartthrob_ext','publish_form_entry_data','publish_form_entry_data','',10,'2.71','y'),
	(47,'Cartthrob_ext','channel_form_submit_entry_start','channel_form_submit_entry_start','',10,'2.71','y'),
	(48,'Cartthrob_ext','channel_form_submit_entry_end','channel_form_submit_entry_end','',10,'2.71','y'),
	(49,'Cartthrob_order_manager_ext','cp_menu_array','cp_menu_array','',10,'2.71','y'),
	(50,'Cartthrob_order_manager_ext','cartthrob_addon_register','cartthrob_addon_register','',10,'2.71','y');

/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_formatting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_formatting`;

CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`)
VALUES
	(356,101,'none'),
	(355,100,'xhtml'),
	(354,100,'br'),
	(353,100,'none'),
	(352,99,'xhtml'),
	(351,99,'br'),
	(350,99,'none'),
	(349,98,'xhtml'),
	(348,98,'br'),
	(347,98,'none'),
	(346,97,'xhtml'),
	(345,97,'br'),
	(344,97,'none'),
	(343,96,'xhtml'),
	(342,96,'br'),
	(341,96,'none'),
	(340,95,'xhtml'),
	(339,95,'br'),
	(338,95,'none'),
	(337,94,'xhtml'),
	(336,94,'br'),
	(335,94,'none'),
	(334,93,'xhtml'),
	(333,93,'br'),
	(332,93,'none'),
	(331,92,'xhtml'),
	(330,92,'br'),
	(329,92,'none'),
	(328,91,'xhtml'),
	(327,91,'br'),
	(326,91,'none'),
	(325,90,'xhtml'),
	(324,90,'br'),
	(323,90,'none'),
	(322,89,'xhtml'),
	(321,89,'br'),
	(320,89,'none'),
	(319,88,'xhtml'),
	(318,88,'br'),
	(317,88,'none'),
	(316,87,'xhtml'),
	(315,87,'br'),
	(314,87,'none'),
	(313,86,'xhtml'),
	(312,86,'br'),
	(311,86,'none'),
	(310,85,'xhtml'),
	(309,85,'br'),
	(308,85,'none'),
	(307,84,'xhtml'),
	(306,84,'br'),
	(305,84,'none'),
	(304,83,'xhtml'),
	(303,83,'br'),
	(302,83,'none'),
	(301,82,'xhtml'),
	(300,82,'br'),
	(299,82,'none'),
	(298,81,'xhtml'),
	(297,81,'br'),
	(296,81,'none'),
	(295,80,'xhtml'),
	(294,80,'br'),
	(293,80,'none'),
	(292,79,'xhtml'),
	(291,79,'br'),
	(290,79,'none'),
	(289,78,'xhtml'),
	(288,78,'br'),
	(287,78,'none'),
	(286,77,'xhtml'),
	(285,77,'br'),
	(284,77,'none'),
	(283,76,'xhtml'),
	(282,76,'br'),
	(281,76,'none'),
	(280,75,'xhtml'),
	(279,75,'br'),
	(278,75,'none'),
	(277,74,'xhtml'),
	(276,74,'br'),
	(275,74,'none'),
	(274,73,'xhtml'),
	(273,73,'br'),
	(272,73,'none'),
	(271,72,'xhtml'),
	(270,72,'br'),
	(269,72,'none'),
	(268,71,'xhtml'),
	(267,71,'br'),
	(266,71,'none'),
	(265,70,'xhtml'),
	(264,70,'br'),
	(263,70,'none'),
	(262,69,'xhtml'),
	(261,69,'br'),
	(260,69,'none'),
	(259,68,'xhtml'),
	(258,68,'br'),
	(257,68,'none'),
	(256,67,'xhtml'),
	(255,67,'br'),
	(254,67,'none'),
	(253,66,'xhtml'),
	(252,66,'br'),
	(251,66,'none'),
	(250,65,'xhtml'),
	(249,65,'br'),
	(248,65,'none'),
	(247,64,'xhtml'),
	(246,64,'br'),
	(245,64,'none'),
	(244,63,'xhtml'),
	(243,63,'br'),
	(242,63,'none'),
	(241,62,'xhtml'),
	(240,62,'br'),
	(235,60,'xhtml'),
	(234,60,'markdown'),
	(233,60,'br'),
	(232,60,'none'),
	(239,62,'none'),
	(238,61,'xhtml'),
	(237,61,'br'),
	(236,61,'none'),
	(227,58,'xhtml'),
	(226,58,'markdown'),
	(225,58,'br'),
	(224,58,'none'),
	(223,57,'xhtml'),
	(222,57,'markdown'),
	(221,57,'br'),
	(220,57,'none'),
	(219,56,'xhtml'),
	(218,56,'markdown'),
	(217,56,'br'),
	(216,56,'none'),
	(215,55,'xhtml'),
	(214,55,'markdown'),
	(213,55,'br'),
	(212,55,'none'),
	(211,54,'xhtml'),
	(210,54,'markdown'),
	(209,54,'br'),
	(208,54,'none'),
	(207,53,'xhtml'),
	(206,53,'markdown'),
	(205,53,'br'),
	(204,53,'none'),
	(203,52,'xhtml'),
	(202,52,'markdown'),
	(201,52,'br'),
	(200,52,'none'),
	(199,51,'xhtml'),
	(198,51,'markdown'),
	(197,51,'br'),
	(196,51,'none'),
	(194,50,'markdown'),
	(193,50,'br'),
	(192,50,'none'),
	(195,50,'xhtml'),
	(357,101,'br'),
	(358,101,'xhtml'),
	(359,102,'none'),
	(360,102,'br'),
	(361,102,'xhtml'),
	(362,103,'none'),
	(363,103,'br'),
	(364,103,'xhtml'),
	(365,104,'none'),
	(366,104,'br'),
	(367,104,'xhtml'),
	(368,105,'none'),
	(369,105,'br'),
	(370,105,'xhtml'),
	(371,106,'none'),
	(372,106,'br'),
	(373,106,'xhtml'),
	(374,107,'none'),
	(375,107,'br'),
	(376,107,'xhtml'),
	(377,108,'none'),
	(378,108,'br'),
	(379,108,'xhtml'),
	(380,109,'none'),
	(381,109,'br'),
	(382,109,'xhtml'),
	(383,110,'none'),
	(384,110,'br'),
	(385,110,'xhtml'),
	(386,111,'none'),
	(387,111,'br'),
	(388,111,'xhtml'),
	(389,112,'none'),
	(390,112,'br'),
	(391,112,'xhtml'),
	(392,113,'none'),
	(393,113,'br'),
	(394,113,'xhtml'),
	(395,114,'none'),
	(396,114,'br'),
	(397,114,'xhtml'),
	(398,115,'none'),
	(399,115,'br'),
	(400,115,'xhtml'),
	(401,116,'none'),
	(402,116,'br'),
	(403,116,'xhtml'),
	(404,117,'none'),
	(405,117,'br'),
	(406,117,'xhtml'),
	(407,118,'none'),
	(408,118,'br'),
	(409,118,'xhtml'),
	(410,119,'none'),
	(411,119,'br'),
	(412,119,'xhtml'),
	(413,120,'none'),
	(414,120,'br'),
	(415,120,'xhtml'),
	(416,121,'none'),
	(417,121,'br'),
	(418,121,'xhtml'),
	(419,122,'none'),
	(420,122,'br'),
	(421,122,'xhtml'),
	(422,123,'none'),
	(423,123,'br'),
	(424,123,'xhtml'),
	(425,124,'none'),
	(426,124,'br'),
	(427,124,'xhtml'),
	(428,125,'none'),
	(429,125,'br'),
	(430,125,'xhtml'),
	(431,126,'none'),
	(432,126,'br'),
	(433,126,'xhtml'),
	(434,127,'none'),
	(435,127,'br'),
	(436,127,'xhtml'),
	(437,128,'none'),
	(438,128,'br'),
	(439,128,'xhtml'),
	(440,129,'none'),
	(441,129,'br'),
	(442,129,'xhtml'),
	(443,130,'none'),
	(444,130,'br'),
	(445,130,'xhtml'),
	(446,131,'none'),
	(447,131,'br'),
	(448,131,'xhtml'),
	(449,132,'none'),
	(450,132,'br'),
	(451,132,'markdown'),
	(452,132,'xhtml'),
	(453,133,'none'),
	(454,133,'br'),
	(455,133,'markdown'),
	(456,133,'xhtml'),
	(457,134,'none'),
	(458,134,'br'),
	(459,134,'markdown'),
	(460,134,'xhtml'),
	(461,135,'none'),
	(462,135,'br'),
	(463,135,'markdown'),
	(464,135,'xhtml'),
	(465,136,'none'),
	(466,136,'br'),
	(467,136,'markdown'),
	(468,136,'xhtml'),
	(469,137,'none'),
	(470,137,'br'),
	(471,137,'markdown'),
	(472,137,'xhtml'),
	(473,138,'none'),
	(474,138,'br'),
	(475,138,'markdown'),
	(476,138,'xhtml'),
	(477,139,'none'),
	(478,139,'br'),
	(479,139,'markdown'),
	(480,139,'xhtml'),
	(481,140,'none'),
	(482,140,'br'),
	(483,140,'markdown'),
	(484,140,'xhtml'),
	(485,141,'none'),
	(486,141,'br'),
	(487,141,'markdown'),
	(488,141,'xhtml'),
	(489,142,'none'),
	(490,142,'br'),
	(491,142,'markdown'),
	(492,142,'xhtml'),
	(493,143,'none'),
	(494,143,'br'),
	(495,143,'markdown'),
	(496,143,'xhtml'),
	(497,144,'none'),
	(498,144,'br'),
	(499,144,'markdown'),
	(500,144,'xhtml'),
	(501,145,'none'),
	(502,145,'br'),
	(503,145,'markdown'),
	(504,145,'xhtml'),
	(505,146,'none'),
	(506,146,'br'),
	(507,146,'markdown'),
	(508,146,'xhtml'),
	(509,147,'none'),
	(510,147,'br'),
	(511,147,'markdown'),
	(512,147,'xhtml'),
	(513,148,'none'),
	(514,148,'br'),
	(515,148,'markdown'),
	(516,148,'xhtml');

/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_groups`;

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`)
VALUES
	(8,1,'Homepage Intro'),
	(7,1,'Featured Panel'),
	(5,1,'Standard Page'),
	(6,1,'Home Slider'),
	(9,1,'Blog'),
	(10,1,'products'),
	(11,1,'Products1'),
	(12,1,'Coupon Codes'),
	(13,1,'Orders'),
	(14,1,'Purchased Items'),
	(15,1,'Discounts'),
	(16,1,'Packages'),
	(17,1,'price grid'),
	(18,1,'Special Page');

/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fieldtypes`;

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`)
VALUES
	(1,'select','1.0','YTowOnt9','n'),
	(2,'text','1.0','YTowOnt9','n'),
	(3,'textarea','1.0','YTowOnt9','n'),
	(4,'date','1.0','YTowOnt9','n'),
	(5,'file','1.0','YTowOnt9','n'),
	(6,'grid','1.0','YTowOnt9','n'),
	(7,'multi_select','1.0','YTowOnt9','n'),
	(8,'checkboxes','1.0','YTowOnt9','n'),
	(9,'radio','1.0','YTowOnt9','n'),
	(10,'relationship','1.0','YTowOnt9','n'),
	(26,'rte','1.0','YTowOnt9','n'),
	(12,'zoo_visitor','1.3.32','YTowOnt9','n'),
	(13,'fieldpack_checkboxes','2.2','YTowOnt9','n'),
	(14,'fieldpack_dropdown','2.2','YTowOnt9','n'),
	(15,'fieldpack_list','2.2','YTowOnt9','n'),
	(16,'fieldpack_multiselect','2.2','YTowOnt9','n'),
	(17,'fieldpack_pill','2.2','YTowOnt9','n'),
	(18,'fieldpack_radio_buttons','2.2','YTowOnt9','n'),
	(19,'fieldpack_radio_buttons','2.2','YTowOnt9','n'),
	(20,'fieldpack_switch','2.2','YTowOnt9','n'),
	(21,'tagger','3.2.1','YTowOnt9','n'),
	(22,'structure','3.3.14.7','YToxOntzOjE5OiJzdHJ1Y3R1cmVfbGlzdF90eXBlIjtzOjU6InBhZ2VzIjt9','n'),
	(23,'wygwam','3.3.3','YToyOntzOjExOiJsaWNlbnNlX2tleSI7czozNjoiN2U0Mzg1OGItNjIzYy00Njc1LWJmNzYtNTI3MDg4YzJkNDQ2IjtzOjEyOiJmaWxlX2Jyb3dzZXIiO3M6MjoiZWUiO30=','y'),
	(24,'playa','4.4.5','YTowOnt9','y'),
	(25,'freeform','4.2.2','YTowOnt9','n'),
	(27,'cartthrob_discount','2.71','YTowOnt9','n'),
	(28,'cartthrob_order_items','2.71','YTowOnt9','n'),
	(29,'cartthrob_price_modifiers','2.71','YTowOnt9','n'),
	(30,'cartthrob_price_quantity_thresholds','2.71','YTowOnt9','n'),
	(31,'cartthrob_price_simple','2.71','YTowOnt9','n'),
	(32,'cartthrob_package','2.71','YTowOnt9','n');

/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_file_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_categories`;

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_file_dimensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_dimensions`;

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_file_watermarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_watermarks`;

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_files`;

CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`)
VALUES
	(4,1,'blog-thumbnail-4-1.jpg',3,'/Applications/MAMP/htdocs/blinds/uploads/blog/blog-thumbnail-4-1.jpg','image/jpeg','blog-thumbnail-4-1.jpg',44698,NULL,NULL,NULL,16,1470485843,16,1470485843,'390 570'),
	(2,1,'wide-1.jpg',1,'/Applications/MAMP/htdocs/blinds/uploads/wide-1.jpg','image/jpeg','wide-1.jpg',209267,NULL,NULL,NULL,16,1470164667,16,1470857622,'1011 1800'),
	(3,1,'index.png',1,'/Applications/MAMP/htdocs/blinds/uploads/index.png','image/png','index.png',696439,NULL,NULL,NULL,16,1470249518,16,1470857622,'467 672'),
	(5,1,'about-1-1.jpg',3,'/Applications/MAMP/htdocs/blinds/uploads/blog/about-1-1.jpg','image/jpeg','about-1-1.jpg',90184,NULL,NULL,NULL,16,1470856368,16,1470856368,'480 1170'),
	(6,1,'blog-thumbnail-4-1.jpg',4,'/Applications/MAMP/htdocs/blinds/uploads/products/blog-thumbnail-4-1.jpg','image/jpeg','blog-thumbnail-4-1.jpg',44698,NULL,NULL,NULL,16,1470937284,16,1470937284,'390 570'),
	(7,1,'product-minimal-1.jpg',4,'/Applications/MAMP/htdocs/blinds/uploads/products/product-minimal-1.jpg','image/jpeg','product-minimal-1.jpg',12554,NULL,NULL,NULL,16,1470941542,16,1470941542,'290 210'),
	(8,1,'about-1-3.jpg',1,'/Applications/MAMP/htdocs/blinds/uploads/about-1-3.jpg','image/jpeg','about-1-3.jpg',90184,NULL,NULL,NULL,16,1472493554,16,1472493554,'480 1170');

/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_composer_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_composer_layouts`;

CREATE TABLE `exp_freeform_composer_layouts` (
  `composer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `composer_data` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `preview` char(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`composer_id`),
  KEY `preview` (`preview`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_composer_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_composer_templates`;

CREATE TABLE `exp_freeform_composer_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `template_name` varchar(150) NOT NULL DEFAULT 'default',
  `template_label` varchar(150) NOT NULL DEFAULT 'default',
  `template_description` text,
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_data` text,
  `param_data` text,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_email_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_email_logs`;

CREATE TABLE `exp_freeform_email_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(250) NOT NULL DEFAULT 'user',
  `success` char(1) NOT NULL DEFAULT 'y',
  `from` text,
  `from_name` text,
  `to` text,
  `subject` text,
  `message` text,
  `debug_info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_fields`;

CREATE TABLE `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `field_name` varchar(150) NOT NULL DEFAULT 'default',
  `field_label` varchar(150) NOT NULL DEFAULT 'default',
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `settings` text,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `required` char(1) NOT NULL DEFAULT 'n',
  `submissions_page` char(1) NOT NULL DEFAULT 'y',
  `moderation_page` char(1) NOT NULL DEFAULT 'y',
  `composer_use` char(1) NOT NULL DEFAULT 'y',
  `field_description` text,
  PRIMARY KEY (`field_id`),
  KEY `field_name` (`field_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_fields` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fields` DISABLE KEYS */;

INSERT INTO `exp_freeform_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_type`, `settings`, `author_id`, `entry_date`, `edit_date`, `required`, `submissions_page`, `moderation_page`, `composer_use`, `field_description`)
VALUES
	(1,1,'first_name','First Name','text','{\"field_length\":150,\"field_content_type\":\"any\"}',1,1425418823,0,'n','y','y','y','This field contains the user\'s first name.'),
	(2,1,'last_name','Last Name','text','{\"field_length\":150,\"field_content_type\":\"any\"}',1,1425418823,0,'n','y','y','y','This field contains the user\'s last name.'),
	(3,1,'email','Email','text','{\"field_length\":150,\"field_content_type\":\"email\"}',1,1425418823,0,'n','y','y','y','A basic email field for collecting stuff like an email address.'),
	(4,1,'user_message','Message','textarea','{\"field_ta_rows\":6}',1,1425418823,0,'n','y','y','y','This field contains the user\'s message.');

/*!40000 ALTER TABLE `exp_freeform_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_fieldtypes`;

CREATE TABLE `exp_freeform_fieldtypes` (
  `fieldtype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldtype_name` varchar(250) DEFAULT NULL,
  `settings` text,
  `default_field` char(1) NOT NULL DEFAULT 'n',
  `version` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`fieldtype_id`),
  KEY `fieldtype_name` (`fieldtype_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fieldtypes` DISABLE KEYS */;

INSERT INTO `exp_freeform_fieldtypes` (`fieldtype_id`, `fieldtype_name`, `settings`, `default_field`, `version`)
VALUES
	(1,'checkbox','[]','n','4.2.2'),
	(2,'checkbox_group','[]','n','4.2.2'),
	(3,'country_select','[]','n','4.2.2'),
	(4,'file_upload','[]','n','4.2.2'),
	(5,'hidden','[]','n','4.2.2'),
	(6,'mailinglist','[]','n','4.2.2'),
	(7,'multiselect','[]','n','4.2.2'),
	(8,'province_select','[]','n','4.2.2'),
	(9,'radio','[]','n','4.2.2'),
	(10,'select','[]','n','4.2.2'),
	(11,'state_select','[]','n','4.2.2'),
	(12,'text','[]','n','4.2.2'),
	(13,'textarea','[]','n','4.2.2');

/*!40000 ALTER TABLE `exp_freeform_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_file_uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_file_uploads`;

CREATE TABLE `exp_freeform_file_uploads` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_path` varchar(750) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_form_entries_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_form_entries_1`;

CREATE TABLE `exp_freeform_form_entries_1` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `complete` varchar(1) NOT NULL DEFAULT 'y',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `form_field_1` text,
  `form_field_2` text,
  `form_field_3` text,
  `form_field_4` text,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_form_entries_1` WRITE;
/*!40000 ALTER TABLE `exp_freeform_form_entries_1` DISABLE KEYS */;

INSERT INTO `exp_freeform_form_entries_1` (`entry_id`, `site_id`, `author_id`, `complete`, `ip_address`, `entry_date`, `edit_date`, `status`, `form_field_1`, `form_field_2`, `form_field_3`, `form_field_4`)
VALUES
	(1,1,0,'y','127.0.0.1',1425418823,0,'pending','Jake','Solspace','support@solspace.com','Welcome to Freeform. We hope that you will enjoy Solspace software.');

/*!40000 ALTER TABLE `exp_freeform_form_entries_1` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_forms`;

CREATE TABLE `exp_freeform_forms` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_name` varchar(150) NOT NULL DEFAULT 'default',
  `form_label` varchar(150) NOT NULL DEFAULT 'default',
  `default_status` varchar(150) NOT NULL DEFAULT 'default',
  `notify_user` char(1) NOT NULL DEFAULT 'n',
  `notify_admin` char(1) NOT NULL DEFAULT 'n',
  `user_email_field` varchar(150) NOT NULL DEFAULT '',
  `user_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_email` text,
  `form_description` text,
  `field_ids` text,
  `field_order` text,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `composer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`form_id`),
  KEY `form_name` (`form_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_forms` WRITE;
/*!40000 ALTER TABLE `exp_freeform_forms` DISABLE KEYS */;

INSERT INTO `exp_freeform_forms` (`form_id`, `site_id`, `form_name`, `form_label`, `default_status`, `notify_user`, `notify_admin`, `user_email_field`, `user_notification_id`, `admin_notification_id`, `admin_notification_email`, `form_description`, `field_ids`, `field_order`, `template_id`, `composer_id`, `author_id`, `entry_date`, `edit_date`, `settings`)
VALUES
	(1,1,'contact','Contact','pending','n','y','',0,1,'info@codelab.ie','This is a basic contact form.','1|2|3|4',NULL,0,0,1,1425418823,0,NULL);

/*!40000 ALTER TABLE `exp_freeform_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_multipage_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_multipage_hashes`;

CREATE TABLE `exp_freeform_multipage_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit` char(1) NOT NULL DEFAULT 'n',
  `data` text,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`),
  KEY `ip_address` (`ip_address`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_notification_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_notification_templates`;

CREATE TABLE `exp_freeform_notification_templates` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `notification_name` varchar(150) NOT NULL DEFAULT 'default',
  `notification_label` varchar(150) NOT NULL DEFAULT 'default',
  `notification_description` text,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `allow_html` char(1) NOT NULL DEFAULT 'n',
  `from_name` varchar(150) NOT NULL DEFAULT '',
  `from_email` varchar(250) NOT NULL DEFAULT '',
  `reply_to_email` varchar(250) NOT NULL DEFAULT '',
  `email_subject` varchar(128) NOT NULL DEFAULT 'default',
  `include_attachments` char(1) NOT NULL DEFAULT 'n',
  `template_data` text,
  PRIMARY KEY (`notification_id`),
  KEY `notification_name` (`notification_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_params
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_params`;

CREATE TABLE `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`params_id`),
  KEY `entry_date` (`entry_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_freeform_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_preferences`;

CREATE TABLE `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(80) DEFAULT NULL,
  `preference_value` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_id`),
  KEY `preference_name` (`preference_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `exp_freeform_preferences` WRITE;
/*!40000 ALTER TABLE `exp_freeform_preferences` DISABLE KEYS */;

INSERT INTO `exp_freeform_preferences` (`preference_id`, `preference_name`, `preference_value`, `site_id`)
VALUES
	(1,'ffp','y',0);

/*!40000 ALTER TABLE `exp_freeform_preferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_freeform_user_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_freeform_user_email`;

CREATE TABLE `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_count` int(10) unsigned NOT NULL DEFAULT '0',
  `email_addresses` text,
  PRIMARY KEY (`email_id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table exp_global_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_global_variables`;

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_grid_columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_grid_columns`;

CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_instructions` text,
  `col_required` char(1) DEFAULT NULL,
  `col_search` char(1) DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;

INSERT INTO `exp_grid_columns` (`col_id`, `field_id`, `content_type`, `col_order`, `col_type`, `col_label`, `col_name`, `col_instructions`, `col_required`, `col_search`, `col_width`, `col_settings`)
VALUES
	(1,50,'channel',0,'text','Top Text','top_text','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"128\",\"field_required\":\"n\"}'),
	(2,50,'channel',1,'text','Big Text','big_text','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"128\",\"field_required\":\"y\"}'),
	(3,50,'channel',2,'text','Bottom Text','bottom_text','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(4,50,'channel',3,'text','Button 1 Text','button_1_text','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(5,50,'channel',4,'text','Button 1 Link','button_1_link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(6,50,'channel',5,'text','Button 2 Text','button_2_text','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(7,50,'channel',6,'text','Button 2 Link','button_2_link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(8,50,'channel',7,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"num_existing\":\"50\",\"show_existing\":\"n\",\"field_required\":\"n\"}'),
	(9,51,'channel',0,'text','Top Text','top_text','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(10,51,'channel',1,'text','Main Text','main_text','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),
	(11,51,'channel',2,'text','Description','description','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(12,51,'channel',3,'text','Button Text','button_text','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),
	(13,51,'channel',4,'text','Button Link','button_link','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),
	(14,51,'channel',5,'file','Image','image','','y','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"num_existing\":\"50\",\"show_existing\":\"n\",\"field_required\":\"y\"}'),
	(15,58,'channel',0,'file','Image','image','','y','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"4\",\"num_existing\":\"50\",\"show_existing\":\"n\",\"field_required\":\"y\"}'),
	(16,132,'channel',0,'file','Image','image','','y','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"4\",\"num_existing\":\"50\",\"show_existing\":\"n\",\"field_required\":\"y\"}'),
	(17,140,'channel',0,'text','Max Width','max_width','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"numeric\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(18,140,'channel',1,'text','Max Drop','max_drop','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"numeric\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(19,140,'channel',2,'text','Price','price','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"numeric\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
	(20,144,'channel',0,'text','Title','title','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),
	(21,144,'channel',1,'wygwam','Description','description','','y','n',0,'{\"convert\":\"\",\"config\":\"1\",\"defer\":\"n\",\"field_required\":\"y\"}'),
	(22,146,'channel',0,'text','Title','title','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),
	(23,146,'channel',1,'text','Short Description','short_description','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),
	(24,147,'channel',0,'text','Title','title','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),
	(25,147,'channel',1,'wygwam','Description','description','','y','n',0,'{\"config\":\"1\",\"defer\":\"n\",\"field_required\":\"y\"}'),
	(26,147,'channel',2,'checkboxes','Is Popular?','is_popular','','n','n',0,'{\"field_fmt\":\"none\",\"field_list_items\":\"Yes\",\"field_required\":\"n\"}');

/*!40000 ALTER TABLE `exp_grid_columns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_helpspot_support
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_helpspot_support`;

CREATE TABLE `exp_helpspot_support` (
  `access_key` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_html_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_html_buttons`;

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`)
VALUES
	(1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),
	(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),
	(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),
	(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),
	(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');

/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_layout_publish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish`;

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_member_bulletin_board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_bulletin_board`;

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_member_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_data`;

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;

INSERT INTO `exp_member_data` (`member_id`)
VALUES
	(16);

/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_fields`;

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_groups`;

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`)
VALUES
	(1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),
	(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),
	(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),
	(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),
	(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');

/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_homepage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_homepage`;

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`)
VALUES
	(16,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0);

/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_search`;

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members`;

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `time_format` char(2) NOT NULL DEFAULT '12',
  `date_format` varchar(8) NOT NULL DEFAULT '%n/%j/%y',
  `include_seconds` char(1) NOT NULL DEFAULT 'n',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`)
VALUES
	(16,1,'blinds','Blinds','8398227aa43f0d0d4880e75193ee8b65bc32890cca40330abce3ba505bfad91095af6ff2f3e4dd054055a44c584bde88d13a4f312322405cd7bb747fc783aca4','gqP1PzH)Z^0cJ|B[K@\\7kUg0W@ZFHZcX%S(yG#\'T.4&8Z&:c<#O\'2sXPFVbE*}}An?1MU:2Lr=X-&D,I/eX,5y&}:^WAFRM`%|W#<mryg~/2\\u?H).SKa/Y6HdW\"DN)I','8204cc196734e81b641d5f6ae274ce256264ed96','1f7d96dbf5f4060be7b0bba7fa874a0cee100644',NULL,'sudhamshareddy@gmail.com','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1469653151,1472496477,1472672229,17,0,0,0,1472493558,0,0,0,'n','y','y','y','y','y','y','y','y','english','Europe/Dublin','eu','%n/%j/%y','n',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,'Structure|C=addons_modules&M=show_module_cp&module=structure|1','y',0,'y',0);

/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_attachments`;

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_message_copies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_copies`;

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_message_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_data`;

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_message_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_folders`;

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`)
VALUES
	(16,'InBox','Sent','','','','','','','','');

/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_listed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_listed`;

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_module_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_module_member_groups`;

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_module_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_module_member_groups` DISABLE KEYS */;

INSERT INTO `exp_module_member_groups` (`group_id`, `module_id`)
VALUES
	(8,7),
	(8,8);

/*!40000 ALTER TABLE `exp_module_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_modules`;

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  `settings` text,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`, `settings`)
VALUES
	(1,'Email','2.0','n','n',NULL),
	(2,'Search','2.2.2','n','n',NULL),
	(3,'Channel','2.0.1','n','n',NULL),
	(4,'Member','2.1','n','n',NULL),
	(5,'Stats','2.0','n','n',NULL),
	(18,'Rte','1.0.1','y','n',NULL),
	(7,'Zoo_visitor','1.3.32','y','n',NULL),
	(8,'Republic_variables','2.0.6','y','n',NULL),
	(9,'Tagger','3.2.1','y','n',NULL),
	(10,'Structure','3.3.14.7','y','y',NULL),
	(11,'Wygwam','3.3.3','y','n',NULL),
	(12,'Playa','4.4.5','n','n',NULL),
	(14,'Seo_lite','1.4.6.1','y','y',NULL),
	(16,'Freeform','4.2.2','y','n',NULL),
	(19,'Field_editor','1.0.8','y','n',NULL),
	(20,'Cartthrob','2.71','y','n',NULL),
	(21,'Cartthrob_order_manager','2.71','y','n',NULL);

/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_online_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_online_users`;

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_password_lockout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_password_lockout`;

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`)
VALUES
	(3,1469653072,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0','blinds');

/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_playa_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_playa_relationships`;

CREATE TABLE `exp_playa_relationships` (
  `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_entry_id` int(10) unsigned DEFAULT NULL,
  `parent_field_id` int(6) unsigned DEFAULT NULL,
  `parent_col_id` int(6) unsigned DEFAULT NULL,
  `parent_row_id` int(10) unsigned DEFAULT NULL,
  `parent_var_id` int(6) unsigned DEFAULT NULL,
  `parent_is_draft` int(1) unsigned DEFAULT '0',
  `child_entry_id` int(10) unsigned DEFAULT NULL,
  `rel_order` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `parent_entry_id` (`parent_entry_id`),
  KEY `parent_field_id` (`parent_field_id`),
  KEY `parent_col_id` (`parent_col_id`),
  KEY `parent_row_id` (`parent_row_id`),
  KEY `parent_var_id` (`parent_var_id`),
  KEY `child_entry_id` (`child_entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_playa_relationships` WRITE;
/*!40000 ALTER TABLE `exp_playa_relationships` DISABLE KEYS */;

INSERT INTO `exp_playa_relationships` (`rel_id`, `parent_entry_id`, `parent_field_id`, `parent_col_id`, `parent_row_id`, `parent_var_id`, `parent_is_draft`, `child_entry_id`, `rel_order`)
VALUES
	(1,22,141,NULL,NULL,NULL,0,24,0);

/*!40000 ALTER TABLE `exp_playa_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_relationships`;

CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_remember_me
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_remember_me`;

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_republic_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_republic_variables`;

CREATE TABLE `exp_republic_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `variable_group_id` int(6) DEFAULT '0',
  `variable_description` varchar(250) DEFAULT NULL,
  `variable_language` varchar(50) DEFAULT NULL,
  `variable_language_parent` int(6) DEFAULT '0',
  `variable_parse` varchar(1) DEFAULT 'n',
  `use_language` varchar(2) DEFAULT 'y',
  `save_to_file` varchar(2) DEFAULT 'n',
  PRIMARY KEY (`variable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_republic_variables_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_republic_variables_groups`;

CREATE TABLE `exp_republic_variables_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(250) DEFAULT NULL,
  `group_order` int(5) DEFAULT NULL,
  `group_access` varchar(500) DEFAULT 'a:0:{}',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_republic_variables_languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_republic_variables_languages`;

CREATE TABLE `exp_republic_variables_languages` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `language_name` varchar(250) DEFAULT NULL,
  `language_prefix` varchar(250) DEFAULT '',
  `language_postfix` varchar(250) DEFAULT '',
  `language_order` int(5) DEFAULT '999',
  `language_direction` varchar(5) DEFAULT 'ltr',
  PRIMARY KEY (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_republic_variables_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_republic_variables_settings`;

CREATE TABLE `exp_republic_variables_settings` (
  `settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `settings` longtext,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_republic_variables_settings` WRITE;
/*!40000 ALTER TABLE `exp_republic_variables_settings` DISABLE KEYS */;

INSERT INTO `exp_republic_variables_settings` (`settings_id`, `site_id`, `settings`)
VALUES
	(1,1,'YToxNjp7czoxMjoiZ3JvdXBfYWNjZXNzIjtzOjA6IiI7czozMjoib3ZlcndyaXRlX2RlZmF1bHRfdmFyaWFibGVfdmFsdWUiO3M6MDoiIjtzOjI3OiJzaG93X2RlZmF1bHRfdmFyaWFibGVfdmFsdWUiO3M6MToieSI7czoxNjoiZ3JvdXBzX2xpc3Rfb3BlbiI7czoxOiJ5IjtzOjE5OiJ2YXJpYWJsZXNfbGlzdF9vcGVuIjtzOjE6InkiO3M6MjI6ImVtcHR5X2dyb3Vwc19saXN0X29wZW4iO3M6MToieSI7czoxODoic2hvd192YXJpYWJsZV90ZXh0IjtzOjE6InkiO3M6MTY6ImRlZmF1bHRfbGFuZ3VhZ2UiO3M6MDoiIjtzOjI5OiJ1c2VfZGVmYXVsdF9sYW5ndWFnZV9vbl9lbXB0eSI7czoxOiJuIjtzOjIwOiJzaG93X2xhbmd1YWdlX3ByZWZpeCI7czoxOiJ5IjtzOjIxOiJzaG93X2xhbmd1YWdlX3Bvc3RmaXgiO3M6MToieSI7czoyMToiYXV0b19zeW5jX2dsb2JhbF92YXJzIjtzOjE6Im4iO3M6MjY6ImRlZmF1bHRfbGFuZ3VhZ2VfZGlyZWN0aW9uIjtzOjM6Imx0ciI7czoxODoic2F2ZV9vbl9wYWdlX2NsaWNrIjtzOjE6InkiO3M6MTk6InRlbXBsYXRlX2dyb3VwX25hbWUiO3M6OToidmFyaWFibGVzIjtzOjIyOiJhbGxvd190b19zYXZlX3RvX2ZpbGVzIjtzOjE6Im4iO30=');

/*!40000 ALTER TABLE `exp_republic_variables_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_reset_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_reset_password`;

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_revision_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_revision_tracker`;

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_revision_tracker` WRITE;
/*!40000 ALTER TABLE `exp_revision_tracker` DISABLE KEYS */;

INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`)
VALUES
	(1,48,'exp_templates','template_data',1471462882,16,'{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"view_cart\"}\n \n{embed=\"{template_group}/_header\" title=\"View Cart\" template_group=\"{template_group}\" template=\"{template}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n			{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n			{/exp:cartthrob:cart_items_info}\n				</div>\n\n			</div>\n\n			<div class=\"span9\">\n					<section id=\"shopping-cart\">\n					<h1>Shopping Cart</h1>\n					{if \"{exp:cartthrob:total_items_count}\"==0}<p>You have no items in your cart. <a href=\"{path={template_group}}\">Continue shopping.</a></p>{/if}\n					\n					{exp:cartthrob:update_cart_form \n						class=\"form-horizontal\"\n						id=\"update_cart_form\"\n		        		return=\"{template_group}/{template}\"}\n						{exp:cartthrob:cart_items_info}\n						<div class=\"row\">\n							<div class=\"span5\">\n									<h3>{title}</h3>\n									<h4>{item_price} {if quantity > 1}<small> x {quantity} = {item_subtotal}</small>{/if}</h4>\n								\n									\n	 								{if no_tax !=\"1\"}<small>Price including tax {item_price:plus_tax} x {quantity} = {item_subtotal:plus_tax}</small>{/if}\n									{if is_package}\n										{!-- Since the item is a package, you can offer a method of updating the item options\n											for each item in the package. --}\n											<h4>Packaged Items</h4>\n										{package}\n											<h5>{sub:title} - {sub:entry_id} <small>{sub:price}</small></h5>\n\n											{exp:cartthrob:item_options row_id=\"{sub:row_id}\"}\n								                {if options_exist}\n													{if allow_selection}\n 														<div class=\"control-group\">\n											                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n																<div class=\"controls\">\n																	{select} \n																		<option {selected} value=\"{option_value}\">\n																			{option_name}{if option_price_numeric != 0} +{option_price}{/if}\n																		</option>\n																	{/select}													\n																</div>\n			 											</div>\n													{if:else}\n 														{options}{if selected}<h6>{option_label}: {option_name} {if option_price_numeric != 0} +{option_price}{/if}</h6>{/if}{/options}\n													{/if}\n								                {/if}\n 											{/exp:cartthrob:item_options}\n										{/package}\n									\n									{if:else}\n											{exp:cartthrob:item_options row_id=\"{row_id}\"}\n											<div class=\"control-group\">\n									            {if dynamic}\n									                <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n									                <div class=\"controls\">{input}</div>\n									            {if:else}\n									                {if options_exist}\n									                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n													    <div class=\"controls\">\n									                    {select} \n									                        <option {selected} value=\"{option_value}\">\n									                            {option_name}{if option_price_numeric != 0} +{option_price}{/if}\n									                        </option>\n									                    {/select}\n														</div>\n									                {/if}\n									            {/if}\n											</div>\n									        {/exp:cartthrob:item_options}\n									{/if}\n								<div class=\"control-group\">\n							 		<label for=\"product_quantity\" class=\"control-label\">Quantity</label>\n								    <div class=\"controls\">\n										<input type=\"text\" id=\"product_quantity_{row_id}\" placeholder=\"1\" name=\"quantity[{row_id}]\" size=\"8\"  value=\"{quantity}\" /> \n									</div>\n			 					</div>\n\n\n								<div class=\"control-group\">\n									<div class=\"controls\">\n								      <label class=\"checkbox\">\n								        <input type=\"checkbox\" id=\"delete_this_{row_id}\" value=\"yes\" name=\"delete[{row_id}]\">\n										<span class=\"label\">Remove this item?</span> \n								      </label>\n								    </div>\n			 					</div>\n\n							</div>\n 							<div class=\"span2\">\n								{if product_thumbnail}\n								<div class=\"thumbnail\">\n									<a href=\"{entry_id_path=\'{template_group}/product_detail\'}\"><img src=\"{product_thumbnail}\" /></a>\n								</div>\n								{/if}\n							</div>\n						</div>\n							{if last_row}\n\n								<div class=\"control-group\">\n								    <div class=\"form-actions\">\n										<button type=\"submit\" value=\"{template_group}/view_cart\" name=\"return\" class=\"btn\">Update</button>\n								      	<button type=\"submit\" value=\"{template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\" name=\"return\" class=\"btn btn-primary\">Proceed to Checkout</button>\n									</div>\n								</div>\n							{/if}\n						{/exp:cartthrob:cart_items_info}\n					{/exp:cartthrob:update_cart_form}		\n 					</section>\n				</div>\n		</div>\n	</div>\n\n 	\n'),
	(2,48,'exp_templates','template_data',1471462897,16,'{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"view_cart\"}\n \n\n\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n			{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n			{/exp:cartthrob:cart_items_info}\n				</div>\n\n			</div>\n\n			<div class=\"span9\">\n					<section id=\"shopping-cart\">\n					<h1>Shopping Cart</h1>\n					{if \"{exp:cartthrob:total_items_count}\"==0}<p>You have no items in your cart. <a href=\"{path={template_group}}\">Continue shopping.</a></p>{/if}\n					\n					{exp:cartthrob:update_cart_form \n						class=\"form-horizontal\"\n						id=\"update_cart_form\"\n		        		return=\"{template_group}/{template}\"}\n						{exp:cartthrob:cart_items_info}\n						<div class=\"row\">\n							<div class=\"span5\">\n									<h3>{title}</h3>\n									<h4>{item_price} {if quantity > 1}<small> x {quantity} = {item_subtotal}</small>{/if}</h4>\n								\n									\n	 								{if no_tax !=\"1\"}<small>Price including tax {item_price:plus_tax} x {quantity} = {item_subtotal:plus_tax}</small>{/if}\n									{if is_package}\n										{!-- Since the item is a package, you can offer a method of updating the item options\n											for each item in the package. --}\n											<h4>Packaged Items</h4>\n										{package}\n											<h5>{sub:title} - {sub:entry_id} <small>{sub:price}</small></h5>\n\n											{exp:cartthrob:item_options row_id=\"{sub:row_id}\"}\n								                {if options_exist}\n													{if allow_selection}\n 														<div class=\"control-group\">\n											                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n																<div class=\"controls\">\n																	{select} \n																		<option {selected} value=\"{option_value}\">\n																			{option_name}{if option_price_numeric != 0} +{option_price}{/if}\n																		</option>\n																	{/select}													\n																</div>\n			 											</div>\n													{if:else}\n 														{options}{if selected}<h6>{option_label}: {option_name} {if option_price_numeric != 0} +{option_price}{/if}</h6>{/if}{/options}\n													{/if}\n								                {/if}\n 											{/exp:cartthrob:item_options}\n										{/package}\n									\n									{if:else}\n											{exp:cartthrob:item_options row_id=\"{row_id}\"}\n											<div class=\"control-group\">\n									            {if dynamic}\n									                <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n									                <div class=\"controls\">{input}</div>\n									            {if:else}\n									                {if options_exist}\n									                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n													    <div class=\"controls\">\n									                    {select} \n									                        <option {selected} value=\"{option_value}\">\n									                            {option_name}{if option_price_numeric != 0} +{option_price}{/if}\n									                        </option>\n									                    {/select}\n														</div>\n									                {/if}\n									            {/if}\n											</div>\n									        {/exp:cartthrob:item_options}\n									{/if}\n								<div class=\"control-group\">\n							 		<label for=\"product_quantity\" class=\"control-label\">Quantity</label>\n								    <div class=\"controls\">\n										<input type=\"text\" id=\"product_quantity_{row_id}\" placeholder=\"1\" name=\"quantity[{row_id}]\" size=\"8\"  value=\"{quantity}\" /> \n									</div>\n			 					</div>\n\n\n								<div class=\"control-group\">\n									<div class=\"controls\">\n								      <label class=\"checkbox\">\n								        <input type=\"checkbox\" id=\"delete_this_{row_id}\" value=\"yes\" name=\"delete[{row_id}]\">\n										<span class=\"label\">Remove this item?</span> \n								      </label>\n								    </div>\n			 					</div>\n\n							</div>\n 							<div class=\"span2\">\n								{if product_thumbnail}\n								<div class=\"thumbnail\">\n									<a href=\"{entry_id_path=\'{template_group}/product_detail\'}\"><img src=\"{product_thumbnail}\" /></a>\n								</div>\n								{/if}\n							</div>\n						</div>\n							{if last_row}\n\n								<div class=\"control-group\">\n								    <div class=\"form-actions\">\n										<button type=\"submit\" value=\"{template_group}/view_cart\" name=\"return\" class=\"btn\">Update</button>\n								      	<button type=\"submit\" value=\"{template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\" name=\"return\" class=\"btn btn-primary\">Proceed to Checkout</button>\n									</div>\n								</div>\n							{/if}\n						{/exp:cartthrob:cart_items_info}\n					{/exp:cartthrob:update_cart_form}		\n 					</section>\n				</div>\n		</div>\n	</div>\n\n 	\n'),
	(3,48,'exp_templates','template_data',1471463321,16,'{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"view_cart\"}\n \n\n\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n			{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n			{/exp:cartthrob:cart_items_info}\n				</div>\n\n			</div>\n\n			<div class=\"span9\">\n					<section id=\"shopping-cart\">\n					<h1>Shopping Cart</h1>\n					{if \"{exp:cartthrob:total_items_count}\"==0}<p>You have no items in your cart. <a href=\"{path={template_group}}\">Continue shopping.</a></p>{/if}\n					\n					{exp:cartthrob:update_cart_form \n						class=\"form-horizontal\"\n						id=\"update_cart_form\"\n		        		return=\"{template_group}/{template}\"}\n						{exp:cartthrob:cart_items_info}\n						<div class=\"row\">\n							<div class=\"span5\">\n									<h3>{title}</h3>\n									<p>{language}</p>\n									<h4>{item_price} {if quantity > 1}<small> x {quantity} = {item_subtotal}</small>{/if}</h4>\n								\n									\n	 								{if no_tax !=\"1\"}<small>Price including tax {item_price:plus_tax} x {quantity} = {item_subtotal:plus_tax}</small>{/if}\n									{if is_package}\n										{!-- Since the item is a package, you can offer a method of updating the item options\n											for each item in the package. --}\n											<h4>Packaged Items</h4>\n										{package}\n											<h5>{sub:title} - {sub:entry_id} <small>{sub:price}</small></h5>\n\n											{exp:cartthrob:item_options row_id=\"{sub:row_id}\"}\n								                {if options_exist}\n													{if allow_selection}\n 														<div class=\"control-group\">\n											                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n																<div class=\"controls\">\n																	{select} \n																		<option {selected} value=\"{option_value}\">\n																			{option_name}{if option_price_numeric != 0} +{option_price}{/if}\n																		</option>\n																	{/select}													\n																</div>\n			 											</div>\n													{if:else}\n 														{options}{if selected}<h6>{option_label}: {option_name} {if option_price_numeric != 0} +{option_price}{/if}</h6>{/if}{/options}\n													{/if}\n								                {/if}\n 											{/exp:cartthrob:item_options}\n										{/package}\n									\n									{if:else}\n											{exp:cartthrob:item_options row_id=\"{row_id}\"}\n											<div class=\"control-group\">\n									            {if dynamic}\n									                <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n									                <div class=\"controls\">{input}</div>\n									            {if:else}\n									                {if options_exist}\n									                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n													    <div class=\"controls\">\n									                    {select} \n									                        <option {selected} value=\"{option_value}\">\n									                            {option_name}{if option_price_numeric != 0} +{option_price}{/if}\n									                        </option>\n									                    {/select}\n														</div>\n									                {/if}\n									            {/if}\n											</div>\n									        {/exp:cartthrob:item_options}\n									{/if}\n								<div class=\"control-group\">\n							 		<label for=\"product_quantity\" class=\"control-label\">Quantity</label>\n								    <div class=\"controls\">\n										<input type=\"text\" id=\"product_quantity_{row_id}\" placeholder=\"1\" name=\"quantity[{row_id}]\" size=\"8\"  value=\"{quantity}\" /> \n									</div>\n			 					</div>\n\n\n								<div class=\"control-group\">\n									<div class=\"controls\">\n								      <label class=\"checkbox\">\n								        <input type=\"checkbox\" id=\"delete_this_{row_id}\" value=\"yes\" name=\"delete[{row_id}]\">\n										<span class=\"label\">Remove this item?</span> \n								      </label>\n								    </div>\n			 					</div>\n\n							</div>\n 							<div class=\"span2\">\n								{if product_thumbnail}\n								<div class=\"thumbnail\">\n									<a href=\"{entry_id_path=\'{template_group}/product_detail\'}\"><img src=\"{product_thumbnail}\" /></a>\n								</div>\n								{/if}\n							</div>\n						</div>\n							{if last_row}\n\n								<div class=\"control-group\">\n								    <div class=\"form-actions\">\n										<button type=\"submit\" value=\"{template_group}/view_cart\" name=\"return\" class=\"btn\">Update</button>\n								      	<button type=\"submit\" value=\"{template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\" name=\"return\" class=\"btn btn-primary\">Proceed to Checkout</button>\n									</div>\n								</div>\n							{/if}\n						{/exp:cartthrob:cart_items_info}\n					{/exp:cartthrob:update_cart_form}		\n 					</section>\n				</div>\n		</div>\n	</div>\n\n 	\n');

/*!40000 ALTER TABLE `exp_revision_tracker` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_rte_tools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_tools`;

CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_rte_tools` WRITE;
/*!40000 ALTER TABLE `exp_rte_tools` DISABLE KEYS */;

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`)
VALUES
	(1,'Blockquote','Blockquote_rte','y'),
	(2,'Bold','Bold_rte','y'),
	(3,'Headings','Headings_rte','y'),
	(4,'Image','Image_rte','y'),
	(5,'Italic','Italic_rte','y'),
	(6,'Link','Link_rte','y'),
	(7,'Ordered List','Ordered_list_rte','y'),
	(8,'Underline','Underline_rte','y'),
	(9,'Unordered List','Unordered_list_rte','y'),
	(10,'View Source','View_source_rte','y');

/*!40000 ALTER TABLE `exp_rte_tools` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_rte_toolsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_toolsets`;

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`)
VALUES
	(1,0,'Default','3|2|5|1|9|7|6|4|10','y');

/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search`;

CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search_log`;

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_security_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_security_hashes`;

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`)
VALUES
	(69,1426075634,'2f1f39b923c89f5277b4fdd6e923e934ad549879','2d48e5107b22f7f962108dd3ede81e17b0fe52d2'),
	(68,1426071295,'7518c7e28a2bec74df8eae131454132ab1fd7a48','a69da1d6f8796d4a8243eb39d3d4655b04a1b6b7'),
	(67,1426035181,'8297521cb10acd75e83c866fb0509f10a80b0a24','4aafade313b473235c0dbd3dcb9009eaeb25e52c'),
	(66,1426002805,'05f8f4e0282c36d478c24039eca43d500d8a2b80','e1960f1a574877b0fa1eedd61782518b1a05e499'),
	(65,1426002798,'3f142adbda373da02adfaf17601308b96633ab3b','95f64887e31e45b29ff6b1a926cd66f613ad5b71'),
	(62,1426002639,'ffa93de59e4b72e7c6053e494292e053a4fc0655','8cc3b307e57c29ab0768016da66421b40f49b157'),
	(61,1426002526,'46c67880fd62107b4c6ee3192a43f1a64bba5101','c804df9faad149afb526904692b7e5989a995cc5'),
	(78,1426716352,'c67fb384a38fe624cc03cd51e961e63f06796d33','0e16de41fb323111b87f14d06b2f14395c71d60e'),
	(79,1426721645,'e17968b167ba80c092c797b25c27138ec758c332','6592ff87d3e2867cb388aa16623aa9016ca895a5'),
	(80,1426724638,'dc9e14e20ce3b3885f2c5a097631a7b38cd8b7fc','210ba54d14ec5f12e0e7f0913f49aa3ef0d5308c'),
	(81,1426724638,'c3c71ea2b492ccc172b72de4b9a0a4f87e979f7f','fc84d90a0f8f0f1f74d7edef9c5e668239a95124'),
	(82,1426724638,'e35b3abfd3b65e16ea81bebcbbebef79ced0da23','6b40e1cfba96dda9b1e6f06b9380e6330e2066c0'),
	(83,1427641936,'89362f231634494e3e41f727070b1ef3f215d195','04a354410480fce067a9286f4731ef55a0e9505f'),
	(84,1427642115,'87e3523feb38ef7587628ee96652b8c9bd1742bd','7f5599a54af05437f80daf6a4e8c6506f425f41d'),
	(85,1427663207,'f6d1a0448f36fe60c89ac8a746d8e98150641d59','425f6c4b52cf1af555421e17bb50fab067c37a9d'),
	(87,1427663786,'300ad4df3121e447fc30f3f3302a6544b87a3a56','0a73f19b32b78326fdc5a0c248e2083126b809e2'),
	(89,1427664733,'dcf230a41d0c473f40a31012f21eaf8333a93ed5','ccee5124e304a4acc9a4cbc31592965506906b08'),
	(91,1427664769,'4355fbe7f030df3e6b96a6159a47106168cfc8ec','254186c4c13e9d5d5e3793bf3925c693aa560126'),
	(93,1469653156,'270304a8da8c5d88243bc7363af5c88f66411924','6063525743db1e3d2c09b238d186122cfdbc71b0'),
	(94,1470163634,'c1961ce4dfa6f9625274d08b7b18975a658d2c84','5f45f85c90f7c3bf5400ef87e41194fc279a0eb8'),
	(95,1470249009,'6cbc86c0239acf8d890babadb8edc3fb5dec5ff5','dcadb4238d384782e545453608532a1368b9a3e5'),
	(96,1470339243,'f90882dbdadcf311241a14b28d83f80ad6d47dc0','143bd966fe2682205aea2782521ee7bc6e8d12cb'),
	(97,1470421231,'06b77d7b51a8dfa4fca2099f4f82c7ba39a0e85b','d866b521224aee5a179f5190a2b3fea08a43c4a5'),
	(98,1470484712,'338efe03de14e4d403b2641ade7d5d9ca4743358','4d072fbd6749c6842f8daf394baea1f3f5195ce8'),
	(99,1470570013,'f514e7098272fb0378a0c859ad370c2cbaa63574','a2a43455430593154d45517d133dc5ff1c8e9d25'),
	(100,1470856208,'4c348b24bf930aef56442d6b851317f490745356','5c83cf5c09ce744f163b4975a1f2d23916d7952c'),
	(101,1470861440,'7452151a1be787b1e7ad91040f6d5df35a95fe02','3c4eb1498f463155c6101f80b15d6e52b8479566'),
	(102,1470861439,'3dee1db175dec1e1c4bc974aabdf8f121936c424','48656669756004206413ac55b4144858f9de04af'),
	(103,1470936682,'76599166e7f3f5c76e21c185d0d959172afa6a8b','77f5e8748d8eac1b9846e7c388c897e553e87651'),
	(104,1470941217,'f7af6a0d28dafa1a39cffcecb36f760fdb1b7fc2','6f61201005f6f968a5954676b949691da1ae59b7'),
	(105,1470941217,'069377607a4263ad3b7016094dde69703514543d','8e30956151a87d91218663e233e1c64ab4f7362b'),
	(106,1470941223,'06ebe0e1264e8c6877e32f0dd167b2daaa4ada5f','5bb193212d9d263114744b59b57832e7c2de8467'),
	(107,1471283799,'45f241d5bcaa2d02b08185b5ad9e156bae6eb161','d7d5d3c47172bbe56128e0fcbe4bd02d06c96f8a'),
	(108,1471292917,'7613a40d6b1d8a7c399b72de356d99f067b5067b','df9dfd73abd9ad51ed120b0c926f3a91d2c9d342'),
	(109,1471373694,'1d9a62a57ad5339f276bf7473e696e3b655d1fac','0b2be63eee5ae288bea6558fc8724cd46fb4b65d'),
	(110,1471381166,'f2dbc7a0daec4caf6a73e2717cf7629d7c29930f','ff73abe2aced8bc174961ca4ed93726fe09e7291'),
	(111,1471459177,'6e3e922caddca856a83896fc4784ad3a0cd68137','d1a0eec40c0bb731a954beb1dd2e058ec2c5edaf'),
	(112,1471462686,'74be00cb90da95bb7890761e0db4f8ee6da382e5','db4986eb41de29fe3d547e6fe3b0b64dce2ce575'),
	(113,1471891286,'e8d4817a7bcccd9a1ef63df9902fdadd33a51d07','b37bbea010e0e7fff3bf93b8afb060b1e7d7be26'),
	(114,1471895061,'76c19620e1976c9ece19db5b9d767d424bec0726','fe3304b64ce391d33f8ecd396757c9130fdd64a5'),
	(115,1471896724,'aee4d07daf48d4cdd3d892ff3e97a8b8dec08bc7','1dfc8cdbda1921c97ece64fe3ec0b8c4653c2747'),
	(116,1472065629,'9ad45738a817336efd9f7e8c1b0b68214cb89036','d494b64ec9e48b050a1c1d8100738d141f3044ca'),
	(117,1472492105,'dc098be148a509d7aedc99263df667e52931c644','1710eed6c88ebb84c58ec9968aaed40a65a29862'),
	(118,1472672229,'6d5467c6981c0fe6e1a386a4760a47906726ecb4','74745af6dfe5102e056890029ba03856b4dce739'),
	(119,1472672310,'2be5a10c4c5441afcc60b1cda5fdacb2b3da463c','9fd4568dacdc7a6d2f23081fd4270fbcc2446877'),
	(120,1472672323,'71749a565b448c3492ec1f0c0042d2cacf1cecb7','bcdcc0e881b4dc6fa6a76b16e675cd68378b1ca5'),
	(121,1472672460,'7fed8c75a01377d23b25ed0799b5441fb4717944','a7e7037d11b05943ec7e4c57c8a7f1f2c7d51783');

/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_seolite_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_seolite_config`;

CREATE TABLE `exp_seolite_config` (
  `seolite_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `template` text,
  `default_keywords` varchar(1024) NOT NULL,
  `default_description` varchar(1024) NOT NULL,
  `default_title_postfix` varchar(60) NOT NULL,
  PRIMARY KEY (`seolite_config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_seolite_config` WRITE;
/*!40000 ALTER TABLE `exp_seolite_config` DISABLE KEYS */;

INSERT INTO `exp_seolite_config` (`seolite_config_id`, `site_id`, `template`, `default_keywords`, `default_description`, `default_title_postfix`)
VALUES
	(1,1,'<title>{title}{site_name}</title>\n<meta name=\'keywords\' content=\'{meta_keywords}\' />\n<meta name=\'description\' content=\'{meta_description}\' />\n<link rel=\'canonical\' href=\'{canonical_url}\' />\n<!-- generated by seo_lite -->','your, default, keywords, here','Your default description here',' |&nbsp;');

/*!40000 ALTER TABLE `exp_seolite_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_seolite_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_seolite_content`;

CREATE TABLE `exp_seolite_content` (
  `seolite_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) NOT NULL,
  `entry_id` int(10) NOT NULL,
  `title` varchar(1024) DEFAULT NULL,
  `keywords` varchar(1024) NOT NULL,
  `description` text,
  PRIMARY KEY (`seolite_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_seolite_content` WRITE;
/*!40000 ALTER TABLE `exp_seolite_content` DISABLE KEYS */;

INSERT INTO `exp_seolite_content` (`seolite_content_id`, `site_id`, `entry_id`, `title`, `keywords`, `description`)
VALUES
	(1,1,3,'','',''),
	(2,1,11,'','',''),
	(3,1,15,'','',''),
	(4,1,16,'','',''),
	(5,1,17,'','',''),
	(6,1,18,'','',''),
	(7,1,19,'','',''),
	(8,1,20,'','',''),
	(9,1,21,'','',''),
	(10,1,22,'','',''),
	(11,1,23,'','',''),
	(12,1,24,'','',''),
	(13,1,25,'','',''),
	(14,1,26,'','',''),
	(15,1,27,'','',''),
	(16,1,28,'','',''),
	(17,1,31,'','','');

/*!40000 ALTER TABLE `exp_seolite_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sessions`;

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `fingerprint`, `sess_start`, `last_activity`)
VALUES
	('2be5a10c4c5441afcc60b1cda5fdacb2b3da463c',16,1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:48.0) Gecko/20100101 Firefox/48.0','6288909a24c364f630e7a3f48499aaa9',1472672310,1472672314),
	('6d5467c6981c0fe6e1a386a4760a47906726ecb4',16,1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:48.0) Gecko/20100101 Firefox/48.0','6288909a24c364f630e7a3f48499aaa9',1472672229,1472672304),
	('71749a565b448c3492ec1f0c0042d2cacf1cecb7',16,1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:48.0) Gecko/20100101 Firefox/48.0','6288909a24c364f630e7a3f48499aaa9',1472672323,1472672453),
	('7fed8c75a01377d23b25ed0799b5441fb4717944',16,1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:48.0) Gecko/20100101 Firefox/48.0','6288909a24c364f630e7a3f48499aaa9',1472672460,1472672528);

/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sites`;

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` longtext,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`)
VALUES
	(1,'Blinds','default_site',NULL,'YTo4OTp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6MjM6Imh0dHA6Ly9sb2NhbGhvc3QvYmxpbmRzIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0L2JsaW5kcy90aGVtZXMvIjtzOjE1OiJ3ZWJtYXN0ZXJfZW1haWwiO3M6MTU6ImluZm9AY29kZWxhYi5pZSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6MzY6Imh0dHA6Ly9hbGlnbi1pdC5kZXYvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjQyOiIvVXNlcnMvUGF1bC9TaXRlcy9hbGlnbml0L2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6InkiO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJ5IjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoyMDoid2Vic2l0ZV9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxNToiY3Bfc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoxMzoibG9nX3JlZmVycmVycyI7czoxOiJuIjtzOjEzOiJtYXhfcmVmZXJyZXJzIjtzOjM6IjUwMCI7czoxMToiZGF0ZV9mb3JtYXQiO3M6ODoiJW4vJWovJXkiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6IjEyIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjEzOiJFdXJvcGUvRHVibGluIjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czo4OiJjcF90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjIxOiJlbWFpbF9tb2R1bGVfY2FwdGNoYXMiO3M6MToibiI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6MzU6Imh0dHA6Ly9hbGlnbi1pdC5kZXYvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjQwOiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL2JsaW5kcy90aGVtZXMvIjtzOjEwOiJpc19zaXRlX29uIjtzOjE6InkiO3M6MTE6InJ0ZV9lbmFibGVkIjtzOjE6InkiO3M6MjI6InJ0ZV9kZWZhdWx0X3Rvb2xzZXRfaWQiO3M6MToiMSI7czoxMjoiY2FjaGVfZHJpdmVyIjtzOjQ6ImZpbGUiO30=','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToieSI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJuIjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6InkiO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjI0OiJwYXVsLmMucmVkbW9uZEBnbWFpbC5jb20iO3M6MjQ6InJlcXVpcmVfdGVybXNfb2Zfc2VydmljZSI7czoxOiJ5IjtzOjIyOiJ1c2VfbWVtYmVyc2hpcF9jYXB0Y2hhIjtzOjE6Im4iO3M6MjA6ImRlZmF1bHRfbWVtYmVyX2dyb3VwIjtzOjE6IjUiO3M6MTU6InByb2ZpbGVfdHJpZ2dlciI7czo0NDoiLS1zZGpoa2oybGZmZ3JlcmZ2bWRrbmRrZmlzb2xtZm1zZDE0MjU1OTc3MDciO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJuIjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjQzOiJodHRwOi8vYWxpZ24taXQuZGV2L3VwbG9hZHMvbWVtYmVyL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo0OToiL1VzZXJzL1BhdWwvU2l0ZXMvYWxpZ25pdC91cGxvYWRzL21lbWJlci9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czozOiIxMDAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6NDI6Imh0dHA6Ly9hbGlnbi1pdC5kZXYvdXBsb2Fkcy9tZW1iZXIvcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo0ODoiL1VzZXJzL1BhdWwvU2l0ZXMvYWxpZ25pdC91cGxvYWRzL21lbWJlci9waG90b3MvIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMjAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjIwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjM6IjIwMCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJ5IjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjU3OiJodHRwOi8vYWxpZ24taXQuZGV2L3VwbG9hZHMvbWVtYmVyL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTI6InNpZ19pbWdfcGF0aCI7czo2MzoiL1VzZXJzL1BhdWwvU2l0ZXMvYWxpZ25pdC91cGxvYWRzL21lbWJlci9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6NTU6Ii9Vc2Vycy9QYXVsL1NpdGVzL2FsaWduaXQvdXBsb2Fkcy9tZW1iZXIvcG1fYXR0YWNobWVudHMiO3M6MjM6InBydl9tc2dfbWF4X2F0dGFjaG1lbnRzIjtzOjE6IjMiO3M6MjI6InBydl9tc2dfYXR0YWNoX21heHNpemUiO3M6MzoiMjUwIjtzOjIwOiJwcnZfbXNnX2F0dGFjaF90b3RhbCI7czozOiIxMDAiO3M6MTk6InBydl9tc2dfaHRtbF9mb3JtYXQiO3M6NDoic2FmZSI7czoxODoicHJ2X21zZ19hdXRvX2xpbmtzIjtzOjE6InkiO3M6MTc6InBydl9tc2dfbWF4X2NoYXJzIjtzOjQ6IjYwMDAiO3M6MTk6Im1lbWJlcmxpc3Rfb3JkZXJfYnkiO3M6MTc6InRvdGFsX2ZvcnVtX3Bvc3RzIjtzOjIxOiJtZW1iZXJsaXN0X3NvcnRfb3JkZXIiO3M6NDoiZGVzYyI7czoyMDoibWVtYmVybGlzdF9yb3dfbGltaXQiO3M6MjoiMjAiO30=','YTo3OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6MDoiIjtzOjE5OiJzYXZlX3RtcGxfcmV2aXNpb25zIjtzOjE6Im4iO3M6MTg6Im1heF90bXBsX3JldmlzaW9ucyI7czoxOiI1IjtzOjE1OiJzYXZlX3RtcGxfZmlsZXMiO3M6MToibiI7czoxODoidG1wbF9maWxlX2Jhc2VwYXRoIjtzOjE6Ii8iO30=','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6NDI6Ii9BcHBsaWNhdGlvbnMvTUFNUC9odGRvY3MvYmxpbmRzL2luZGV4LnBocCI7czozMjoiYTQ1MmRhMWMzNmY4MTUxNzE3MWFkYzEwNzVjM2I4NjUiO30=','YToxOntpOjE7YTozOntzOjM6InVybCI7czoyNDoiaHR0cDovL2xvY2FsaG9zdC9ibGluZHMvIjtzOjQ6InVyaXMiO2E6MTI6e2k6MTU7czo2OiIvdGVzdC8iO2k6MTg7czo2OiIvYmxvZy8iO2k6MjA7czoxMzoiL2Jsb2cvYmxvZy0xLyI7aToyMTtzOjEzOiIvYmxvZy9ibG9nLTIvIjtpOjIzO3M6MTA6Ii9wcm9kdWN0cy8iO2k6MjI7czoyMzoiL3Byb2R1Y3RzL3NvbWUtcHJvZHVjdC8iO2k6MjU7czoxNToiL3ByaWNpbmctZ3JpZHMvIjtpOjI0O3M6MzA6Ii9wcmljaW5nLWdyaWRzL3ByaWNpbmctZ3JpZC0xLyI7aToyNjtzOjY6Ii9jYXJ0LyI7aToyNztzOjc6Ii9hYm91dC8iO2k6Mjg7czoxMDoiL2NoZWNrb3V0LyI7aTozMTtzOjE0OiIvc3BlY2lhbC1wYWdlLyI7fXM6OToidGVtcGxhdGVzIjthOjEyOntpOjE1O3M6MjoiMjYiO2k6MTg7czoyOiIyMyI7aToyMDtzOjI6IjI0IjtpOjIxO3M6MjoiMjQiO2k6MjM7czozOiIxMjkiO2k6MjI7czozOiIxMzAiO2k6MjU7czoyOiIyNiI7aToyNDtzOjI6IjI2IjtpOjI2O3M6MzoiMTMxIjtpOjI3O3M6MjoiMjYiO2k6Mjg7czozOiIxMzMiO2k6MzE7czozOiIxMzQiO319fQ==');

/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_snippets`;

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`)
VALUES
	(1,1,'snippet:main_comments',' <div id=\"disqus_thread\"></div>\n    <script type=\"text/javascript\">\n        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */\n        var disqus_shortname = \'codelabie\'; // required: replace example with your forum shortname\n\n        /* * * DON\'T EDIT BELOW THIS LINE * * */\n        (function() {\n            var dsq = document.createElement(\'script\'); dsq.type = \'text/javascript\'; dsq.async = true;\n            dsq.src = \'//\' + disqus_shortname + \'.disqus.com/embed.js\';\n            (document.getElementsByTagName(\'head\')[0] || document.getElementsByTagName(\'body\')[0]).appendChild(dsq);\n        })();\n    </script>\n    <noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\n    <a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a>\n    '),
	(2,1,'snippet:main_footer','			<div class=\"wrapper clearfix\">\n				<footer>\n					&copy; CodeLab 2013\n					Registered business #\n				</footer>\n			</div>'),
	(3,1,'snippet:main_header','		<div class=\"wrapper clearfix\">\n			<header>\n				<div id=\"logo\">\n					<h1>CodeLab</h1>\n				</div>\n				<nav role=\"navigation\">\n					<ul>\n						<li><a href=\"#\">Services</a></li>\n						<li><a href=\"#\">Portfolio</a></li> {!-- Have greyed out for now --}\n						<li><a href=\"#\">Journal</a></li>\n						<li><a href=\"#\">About</a></li>\n						<li><a href=\"#\">Contact</a></li>\n					</ul>\n				</nav>\n			</header>\n		</div>'),
	(4,1,'snippet:main_html-footer','	<script src=\"{site_url}/assets/js/main.js\"></script>'),
	(5,1,'snippet:main_html-header','	<head>\n		<meta charset=\"utf-8\">\n		<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n		{exp:seo_lite use_last_segment=\'yes\'\n		title_postfix=\'{embed:title_postfix}\'\n		default_title=\'{embed:default_title}\'\n		default_keywords=\'{embed:default_keywords}\'\n		default_description=\'{embed:default_description}\'\n		}\n		<meta name=\"description\" content=\"\">\n		<meta name=\"viewport\" content=\"width=device-width\">\n\n		<link rel=\"stylesheet\" href=\"{site_url}/assets/css/style.css\">\n\n		<link href=\'http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic|Maven+Pro:400,500,700\' rel=\'stylesheet\' type=\'text/css\'>\n\n		<!--[if lt IE 9]>\n			<script src=\"{site_url}js/vendor/modernizr-2.6.2-respond-1.1.0.min.js\"></script>\n		<![endif]-->\n	</head>'),
	(6,1,'sn:main_comments',' <div id=\"disqus_thread\"></div>\n    <script type=\"text/javascript\">\n        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */\n        var disqus_shortname = \'codelabie\'; // required: replace example with your forum shortname\n\n        /* * * DON\'T EDIT BELOW THIS LINE * * */\n        (function() {\n            var dsq = document.createElement(\'script\'); dsq.type = \'text/javascript\'; dsq.async = true;\n            dsq.src = \'//\' + disqus_shortname + \'.disqus.com/embed.js\';\n            (document.getElementsByTagName(\'head\')[0] || document.getElementsByTagName(\'body\')[0]).appendChild(dsq);\n        })();\n    </script>\n    <noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\n    <a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a>\n    '),
	(7,1,'sn:main_footer','			<div class=\"wrapper clearfix\">\n				<footer>\n					&copy; CodeLab 2013\n					Registered business #\n				</footer>\n			</div>'),
	(8,1,'sn:main_header','		<div class=\"wrapper clearfix\">\n			<header>\n				<div id=\"logo\">\n					<h1>CodeLab</h1>\n				</div>\n				<nav role=\"navigation\">\n					<ul>\n						<li><a href=\"#\">Services</a></li>\n						<li><a href=\"#\">Portfolio</a></li> {!-- Have greyed out for now --}\n						<li><a href=\"#\">Journal</a></li>\n						<li><a href=\"#\">About</a></li>\n						<li><a href=\"#\">Contact</a></li>\n					</ul>\n				</nav>\n			</header>\n		</div>'),
	(9,1,'sn:main_html-footer','	<script src=\"{site_url}/assets/js/main.js\"></script>'),
	(10,1,'sn:main_html-header','	<head>\n		<meta charset=\"utf-8\">\n		<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n		{exp:seo_lite use_last_segment=\'yes\'\n		title_postfix=\'{embed:title_postfix}\'\n		default_title=\'{embed:default_title}\'\n		default_keywords=\'{embed:default_keywords}\'\n		default_description=\'{embed:default_description}\'\n		}\n		<meta name=\"description\" content=\"\">\n		<meta name=\"viewport\" content=\"width=device-width\">\n\n		<link rel=\"stylesheet\" href=\"{site_url}/assets/css/style.css\">\n\n		<link href=\'http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic|Maven+Pro:400,500,700\' rel=\'stylesheet\' type=\'text/css\'>\n\n		<!--[if lt IE 9]>\n			<script src=\"{site_url}js/vendor/modernizr-2.6.2-respond-1.1.0.min.js\"></script>\n		<![endif]-->\n	</head>'),
	(11,1,'sn:global_footer','<div class=\"footer-wrapper style-5 style-7\">\n	<footer class=\"type-2\">\n		<div class=\"position-center\">\n			<img class=\"footer-logo\" src=\"{site_url}/assets/img/FooterLogo.png\" alt=\"\" />\n			<div class=\"footer-links\">\n				<a href=\"#\">Site Map</a>\n				<a href=\"#\" class=\"open-search-popup\">Search</a>\n				<a href=\"#\">Terms</a>\n				<a href=\"#\">Orders and Returns</a>\n				<a href=\"#\">Contact Us</a>\n			</div>\n		\n		</div>\n	</footer>\n</div>'),
	(15,1,'sn:members_login','{if logged_in}\n\n	You are already registered and logged in.\n\n{if:else}\n\n	{exp:zoo_visitor:login_form return=\"account/profile\"}\n\n		<div class=\"form-group\">\n			<label for=\"email\">Email:</label>\n			<input class=\"form-control\" type=\"text\" name=\"username\" id=\"username\" />\n		</div>\n		<div class=\"form-group\">\n			<label for=\"password\">Password:</label>\n			<input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" />\n		</div>\n\n		{if auto_login}\n		<div class=\"form-group\">\n			<label for=\"remember_me\">Remember me?</label>\n			<input class=\"form-control\" class=\'checkbox\' type=\'checkbox\' name=\'auto_login\' value=\'1\'  />\n		</div>\n		{/if}\n\n		<div class=\"form-group\">\n			<a class=\"btn btn-danger\" href=\"/\">Cancel</a>\n			<input class=\"btn btn-primary\" type=\"submit\" name=\"submit\" value=\"Log in\" />\n		</div>\n\n	{/exp:zoo_visitor:login_form}\n\n{/if}'),
	(16,1,'sn:members_password-change','<h2>Account - Change password</h2>\n\n{if logged_in AND segment_3 == \"success\"}\n\n	<div class=\"center\">\n		<p>Your password has been updated.</p>\n	</div>	\n\n{if:elseif logged_in}\n\n	{exp:zoo_visitor:update_form return=\"account/password/success\"}\n\n		<fieldset>\n			When changing your password, you will be asked to login again for security reasons.\n			<div class=\"form-group\">\n				<label for=\"current_password\" class=\"form-label\">Current password:</label>\n				<input type=\"password\" name=\"current_password\" id=\"current_password\" class=\"form-control form-text\"  />\n			</div>\n			<div class=\"form-group\">\n				<label for=\"new_password\" class=\"form-label\">New password</label>\n				<input type=\"password\" name=\"new_password\" id=\"new_password\" class=\"form-control form-text\"  />\n			</div>\n			<div class=\"form-group\">\n				<label for=\"new_password_confirm\" class=\"form-label\">Confirm New password</label>\n				<input type=\"password\" name=\"new_password_confirm\" id=\"new_password_confirm\" class=\"form-control form-text\"  />\n			</div>\n\n		</fieldset>\n\n		<div class=\"form-group\">\n			<a class=\"btn btn-danger\" href=\"account/\">Cancel</a>\n			<input type=\"submit\" value=\"Submit\" class=\"btn btn-primary\" />\n		</div>\n\n	{/exp:zoo_visitor:update_form}\n\n{if:else}\n\n	<p>You are not logged in. <a href=\"{path=account/login}\">Login</a> now.</p>\n\n{/if}'),
	(12,1,'sn:global_header','<!-- HEADER -->\n<div class=\"header-wrapper style-5 style-7\">\n<header class=\"type-2\">\n	<div class=\"navigation-vertical-align\">\n		<div class=\"cell-view logo-container\">\n			<a id=\"logo\" href=\"{site_url}\"><img src=\"{site_url}/assets/img/logo.png\" alt=\"\" style=\"margin-top: -10px;\" /></a>\n		</div>\n		<div class=\"cell-view nav-container\">\n			<div class=\"navigation\">\n				<div class=\"navigation-header responsive-menu-toggle-class\">\n					<div class=\"title\">Navigation</div>\n					<div class=\"close-menu\"></div>\n				</div>\n				<div class=\"nav-overflow\">\n					<nav>\n					<ul>\n						<li class=\"full-width\">\n							<a href=\"{site_url}\" class=\"active\">Home</a>\n						</li>\n						<li class=\"full-width-columns\">\n							<a href=\"{site_url}about\">About</a>\n						</li>\n						<li class=\"simple-list\">\n							<a href=\"{site_url}products\">Products</a>\n						</li>\n						<li class=\"column-1\">\n							<a href=\"portfolio-default.html\">Portfolio</a>\n						</li>\n						<li class=\"column-1\">\n							<a href={site_url}blog>Blog</a>\n						</li>\n						<li class=\"simple-list\">\n							<a>More</a>\n						</li>\n					\n						<li class=\"fixed-header-visible\">\n							<a class=\"fixed-header-square-button open-cart-popup\"><i class=\"fa fa-shopping-cart\"></i></a>\n							<a class=\"fixed-header-square-button open-search-popup\"><i class=\"fa fa-search\"></i></a>\n						</li>\n					</ul>\n					<div class=\"clear\"></div>\n\n					<a class=\"fixed-header-visible additional-header-logo\"><img src=\"{site_url}/assets/img/HeaderLogo.png\" alt=\"\"/></a>\n				</nav>\n					<div class=\"navigation-footer responsive-menu-toggle-class\">\n						<div class=\"socials-box\">\n							<a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n							<a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n							<a href=\"#\"><i class=\"fa fa-google-plus\"></i></a>\n							<a href=\"#\"><i class=\"fa fa-youtube\"></i></a>\n							<a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\n							<a href=\"#\"><i class=\"fa fa-instagram\"></i></a>\n							<a href=\"#\"><i class=\"fa fa-pinterest-p\"></i></a>\n							<div class=\"clear\"></div>\n						</div>\n					</div>\n				</div>\n			</div>\n			<div class=\"responsive-menu-toggle-class\">\n				<a href=\"#\" class=\"header-functionality-entry menu-button\"><i class=\"fa fa-reorder\"></i></a>\n				<a href=\"#\" class=\"header-functionality-entry open-cart-popup\"><i class=\"fa fa-shopping-cart\"></i></a>\n				<a href=\"#\" class=\"header-functionality-entry open-search-popup\"><i class=\"fa fa-search\"></i></a>\n			</div>\n		</div>\n	</div>\n	<div class=\"close-header-layer\"></div>\n</header>\n<div class=\"clear\"></div>\n</div>'),
	(13,1,'sn:global_html-footer','<script src=\"{site_url}/assets/js/jquery-2.1.3.min.js\"></script>\n<script src=\"{site_url}/assets/js/idangerous.swiper.min.js\"></script>\n<script src=\"{site_url}/assets/js/math.js\"  type=\"text/javascript\"></script>\n<script src=\"{site_url}/assets/js/script.js\"></script>\n<!-- custom scrollbar -->\n<script src=\"{site_url}/assets/js/jquery.mousewheel.js\"></script>\n<script src=\"{site_url}/assets/js/jquery.jscrollpane.min.js\"></script>\n\n    <script src=\"{site_url}/assets/js/idangerous.swiper.min.js\"></script>\n    <script src=\"{site_url}/assets/js/global.js\"></script>\n\n    <!-- custom scrollbar -->\n    <script src=\"{site_url}/assets/js/jquery.mousewheel.js\"></script>\n    <script src=\"{site_url}/assets/js/jquery.jscrollpane.min.js\"></script>\n\n    <!-- range slider -->\n    <script src=\"{site_url}/assets/js/jquery-ui.min.js\"></script>\n    <script>\n        $(document).ready(function(){\n            var minVal = parseInt($(\'.min-price span\').text());\n            var maxVal = parseInt($(\'.max-price span\').text());\n            $( \"#prices-range\" ).slider({\n                range: true,\n                min: minVal,\n                max: maxVal,\n                step: 5,\n                values: [ minVal, maxVal ],\n                slide: function( event, ui ) {\n                    $(\'.min-price span\').text(ui.values[ 0 ]);\n                    $(\'.max-price span\').text(ui.values[ 1 ]);\n                }\n            });\n        });\n    </script>'),
	(14,1,'sn:global_html-header','<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n<meta name=\"format-detection\" content=\"telephone=no\" />\n<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no, minimal-ui\"/>\n<link href=\"{site_url}/assets/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n<link href=\"{site_url}/assets/css/idangerous.swiper.css\" rel=\"stylesheet\" type=\"text/css\" />\n<link href=\"{site_url}/assets/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n<link href=\'http://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700%7CDancing+Script%7CMontserrat:400,700%7CMerriweather:400,300italic%7CLato:400,700,900\' rel=\'stylesheet\' type=\'text/css\' />\n<link href=\"{site_url}/assets/css/style.css\" rel=\"stylesheet\" type=\"text/css\" />\n<!--[if IE 9]>\n    <link href=\"{site_url}/assets/css/ie9.css\" rel=\"stylesheet\" type=\"text/css\" />\n<![endif]-->\n<link rel=\"shortcut icon\" href=\"{site_url}/assets/img/favicon-5.ico\" />\n{exp:seo_lite use_last_segment=\'yes\'}'),
	(17,1,'sn:members_password-forgot','{exp:zoo_visitor:forgot_password error_handling=\"inline\" reset_url=\"account/reset\" parse=\"inward\"}\n	{if password_sent}\n		<div class=\"center\">\n			<p>A password reset mail has been sent to the provided email address.</p>\n		</div>	\n	{if:else}\n		<fieldset>\n			<div class=\"form-group\">\n				<label for=\"email\" class=\"form-label\">Your email:</label>\n				<input class=\"form-control\" type=\"text\" name=\"email\" id=\"email\" class=\"form-text\" value=\"\" />\n			</p>\n			{error:email}\n		</fieldset>\n		<div class=\"form-group\">\n			<a class=\"btn btn-danger\" href=\"/account\">Cancel</a>\n			<input type=\"submit\" value=\"Retrieve password\" class=\"btn btn-primary\" />\n		</p>\n	{/if}\n{/exp:zoo_visitor:forgot_password}'),
	(18,1,'sn:members_password-reset','{exp:zoo_visitor:reset_password error_handling=\"inline\"}\n	{if password_reset}\n		<div class=\"center\">\n			<p>Your password has been reset. You can now <a href=\"account/login\"></a> with your new password.</p>\n		</div>	\n	{if:else}\n		<fieldset>\n			<div class=\"form-group\">\n			<label for=\"email\" class=\"form-label\">New Password:</label>\n				<input type=\"password\" name=\"password\" id=\"password\" class=\"form-control form-text\" value=\"\" />\n			</div>\n\n			<div class=\"form-group\">\n				<label for=\"email\" class=\"form-label\">Confirm New Password:</label>\n				<input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" class=\"form-control form-text\" value=\"\" />\n			</div>\n\n			{error:password}\n		</fieldset>\n		<div class=\"form-group\">\n			<input type=\"submit\" value=\"Reset your password\" class=\"btn btn-primary\" />\n		</div>\n	{/if}\n{/exp:zoo_visitor:reset_password}'),
	(19,1,'sn:members_profile','<h2>Account - Profile</h2>\n\n{if logged_in AND segment_3 == \"success\"}\n\n	<div class=\"center\">\n		<p>Your profile has been updated!</p>\n	</div>	\n\n{if:elseif logged_in}\n\n	{exp:zoo_visitor:update_form return=\"account/profile\"}\n\n	<p>Welcome {candidate_first_name} | <a href=\"{path=logout}\">Logout</a>.</p>\n\n	<p>\n		<a class=\"btn btn-default\" href=\"account/email\">Change email</a> <a class=\"btn btn-default\"  href=\"account/password\">Change password</a>\n	</p>\n\n<div role=\"tabpanel\">\n\n{!--   <!-- Nav tabs -->\n  <ul class=\"nav nav-tabs\" role=\"tablist\">\n    <li role=\"presentation\" class=\"active\"><a href=\"#personal-details\" aria-controls=\"personal-details\" role=\"tab\" data-toggle=\"tab\">Home</a></li>\n    <li role=\"presentation\"><a href=\"#online-cv\" aria-controls=\"online-cv\" role=\"tab\" data-toggle=\"tab\">Profile</a></li>\n    <li role=\"presentation\"><a href=\"#messages\" aria-controls=\"messages\" role=\"tab\" data-toggle=\"tab\">Messages</a></li>\n    <li role=\"presentation\"><a href=\"#settings\" aria-controls=\"settings\" role=\"tab\" data-toggle=\"tab\">Settings</a></li>\n  </ul>\n\n  <!-- Tab panes -->\n  <div class=\"tab-content\">\n    <div role=\"tabpanel\" class=\"tab-pane active\" id=\"home\">...</div>\n    <div role=\"tabpanel\" class=\"tab-pane\" id=\"profile\">...</div>\n    <div role=\"tabpanel\" class=\"tab-pane\" id=\"messages\">...</div>\n    <div role=\"tabpanel\" class=\"tab-pane\" id=\"settings\">...</div>\n  </div> --}\n\n</div>	\n\n	<fieldset>\n		<legend>My information</legend>\n		<p>\n			<label for=\"candidate_title\">{label:candidate_title}</label>\n			<select name=\"candidate_title\" id=\"candidate_title\">\n				{options:candidate_title}\n				<option value=\"{option_value}\" {selected}>{option_value}</option>\n				{/options:candidate_title}\n			</select>\n		</p>		\n\n		<div class=\"form-group\">\n			<label for=\"candidate_first_name\">{label:candidate_first_name}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_first_name\" id=\"candidate_first_name\" value=\"{candidate_first_name}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_last_name\">{label:candidate_last_name}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_last_name\" id=\"candidate_last_name\" value=\"{candidate_last_name}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_1\">{label:candidate_address_1}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_address_1\" id=\"candidate_address_1\" value=\"{candidate_address_1}\" />\n		</div>		\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_2\">{label:candidate_address_2}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_address_2\" id=\"candidate_address_2\" value=\"{candidate_address_2}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_3\">{label:candidate_address_3}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_address_3\" id=\"candidate_address_3\" value=\"{candidate_address_3}\" />\n		</div>	\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_4\">{label:candidate_address_4}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_address_4\" id=\"candidate_address_4\" value=\"{candidate_address_4}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_town_city\">{label:candidate_town_city}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_town_city\" id=\"candidate_town_city\" value=\"{candidate_town_city}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_state_region\">{label:candidate_state_region}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_state_region\" id=\"candidate_state_region\" value=\"{candidate_state_region}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_postal_zip_code\">{label:candidate_postal_zip_code}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_postal_zip_code\" id=\"candidate_postal_zip_code\" value=\"{candidate_postal_zip_code}\" />\n		</div>			\n\n		<div class=\"form-group\">\n			<label for=\"candidate_country\">{label:candidate_country}</label>\n			<select name=\"candidate_country\" class=\"form-control\" id=\"candidate_country\">\n				{options:candidate_country}\n				<option value=\"{option_value}\" {selected}>{option_value}</option>\n				{/options:candidate_country}\n			</select>\n		</div>\n\n		<div class=\"form-group\" id=\"otherCountry\" style=\"display: none;\">\n			<label for=\"candidate_other_county\">{label:candidate_other_county}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_other_county\" id=\"candidate_other_county\" value=\"{candidate_other_county}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_phone\">{label:candidate_phone}:</label>\n			<input type=\"tel\" class=\"form-control\" name=\"candidate_phone\" id=\"candidate_phone\" value=\"{candidate_phone}\" />\n		</div>		\n	</fieldset>\n\n	<hr>\n	\n	<fieldset>\n		<legend>My CV</legend>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_languages\">{label:candidate_languages}</label>\n			<select name=\"candidate_languages\" class=\"form-control\" id=\"candidate_languages\" multiple>\n				{options:candidate_languages}\n				<option value=\"{option_value}\" {selected}>{option_value}</option>\n				{/options:candidate_languages}\n			</select>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_nationality\">{label:candidate_nationality}</label>\n			<select name=\"candidate_nationality\" class=\"form-control\" id=\"candidate_nationality\">\n				{options:candidate_nationality}\n				<option value=\"{option_value}\" {selected}>{option_value}</option>\n				{/options:candidate_nationality}\n			</select>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_skype\">{label:candidate_skype}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_skype\" id=\"candidate_skype\" value=\"{if candidate_skype}{candidate_skype}{/if}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_comms_provider\">{label:candidate_comms_provider}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_comms_provider\" id=\"candidate_comms_provider\" value=\"{if candidate_comms_provider}{candidate_comms_provider}{/if}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_comms_id\">{label:candidate_comms_id}:</label>\n			<input type=\"text\" class=\"form-control\" name=\"candidate_comms_id\" id=\"candidate_comms_id\" value=\"{if candidate_comms_id}{candidate_comms_id}{/if}\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_employment\">{label:candidate_employment}</label>\n			<select name=\"candidate_employment\" class=\"form-control\" id=\"candidate_employment\">\n				{options:candidate_employment}\n				<option value=\"{option_value}\" {selected}>{option_value}</option>\n				{/options:candidate_employment}\n			</select>\n		</div>		\n\n		<div class=\"form-group\">\n			<label for=\"candidate_salary_expectation\">{label:candidate_salary_expectation}</label>\n			<select name=\"candidate_salary_expectation\" class=\"form-control\" id=\"candidate_salary_expectation\">\n				{options:candidate_salary_expectation}\n				<option value=\"{option_value}\" {selected}>{option_value}</option>\n				{/options:candidate_salary_expectation}\n			</select>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_educational_background\">{label:candidate_educational_background}:</label>\n			{field:candidate_educational_background}\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_qualifications\">{label:candidate_qualifications}:</label>\n			{field:candidate_qualifications}\n		</div>					\n\n		<div class=\"form-group\">\n			<label for=\"candidate_skills\">{label:candidate_skills}:</label>\n			{field:candidate_skills}\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_employment_history\">{label:candidate_employment_history}:</label>\n			{field:candidate_employment_history}\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_personal_interests\">{label:candidate_personal_interests}:</label>\n			{field:candidate_personal_interests}\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_professional_bodies\">{label:candidate_professional_bodies}:</label>\n			{field:candidate_professional_bodies}\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_references\">{label:candidate_references}:</label>\n			{field:candidate_references}\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidates_additional_info\">{label:candidates_additional_info}:</label>\n			{field:candidates_additional_info}\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_status\">{label:candidate_status}</label>\n			<select name=\"candidate_status\" class=\"form-control\" id=\"candidate_status\">\n				{options:candidate_status}\n				<option value=\"{option_value}\" {selected}>{option_value}</option>\n				{/options:candidate_status}\n			</select>\n		</div>		\n		\n	</fieldset>\n\n	<div class=\"form-group\">\n		<input class=\"form-submit btn btn-primary\" type=\"submit\" value=\"Update Profile\" />\n	</div>\n\n	{/exp:zoo_visitor:update_form}\n\n\n\n\n{if:else}\n	{!-- Redirect to sign in/register --}\n	{redirect=\'account\' status_code=\"301\"}\n{/if}'),
	(20,1,'sn:members_registration','{if last_segment == \"success\"}\n\n	<div class=\"center\">\n		<p>Your account has been created. Please confirm your email address and then you can <a href=\"/account/login\">sign in</a>.</p>\n	</div>\n\n{if:elseif logged_in}\n\n	You are already registered and logged in. <a href=\"{path=logout}\">Logout</a> or go to your <a href=\"{path=account/profile}\">profile</a>.\n\n{if:else}\n\n	{exp:zoo_visitor:registration_form allowed_groups=\"6\" return=\'account/register/success\'}\n\n	<h3>Candidate Registration</h3>\n	<fieldset>\n		<legend>Basic Details</legend>\n\n		<div class=\"form-group\">\n			<label for=\"email\">Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"email\" name=\"email\" id=\"email\" value=\"{if email}{email}{/if}\"/>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"email_confirm\">Confirm Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"email\" name=\"email_confirm\" id=\"email_confirm\" value=\"{if email_confirm}{email_confirm}{/if}\"/>\n		</div>		\n\n		<div class=\"form-group\">\n			<label for=\"password\">Password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" value=\"{if password}{password}{/if}\"/>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"password_confirm\">Confirm password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"password\" name=\"password_confirm\" id=\"password_confirm\" value=\"{if password_confirm}{password_confirm}{/if}\"/>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"terms_of_service\">Terms of service:</label>\n			<textarea name=\'terms_of_service\'  class=\"form-control\" rows=\"2\" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pretium sem a lorem pharetra vitae porttitor diam lacinia. Fusce iaculis, tortor nec condimentum vulputate, massa nulla iaculis ante, vitae scelerisque quam est a odio. In hac habitasse platea dictumst.</textarea>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"accept_terms\">Accept terms of service? <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input type=\'checkbox\' name=\'accept_terms\' value=\'y\' {if accept_terms == \"y\"}checked=\"checked\"{/if} />\n		</div>\n\n		{if captcha}\n		<div class=\"form-group\">\n			<label for=\"captcha\">{lang:captcha}*</label>\n			{captcha}<br/>\n			<input class=\"form-control\" type=\"text\" id=\"captcha\" name=\"captcha\" value=\"\" size=\"20\" maxlength=\"20\" style=\"width:140px;\"/>\n		</div>\n		{/if}\n	</fieldset>\n	<p></p>\n	<fieldset>\n		<legend>Personal Details</legend>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_title\">{label:candidate_title} <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<select class=\"form-control\" name=\"candidate_title\" id=\"candidate_title\">\n				{options:candidate_title}\n				<option value=\"{option_value}\">{option_value}</option>\n				{/options:candidate_title}\n			</select>\n		</div>	\n\n		<div class=\"form-group\">\n			<label for=\"candidate_first_name\">{label:candidate_first_name}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_first_name\" id=\"candidate_first_name\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_last_name\">{label:candidate_last_name}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_last_name\" id=\"candidate_last_name\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_1\">{label:candidate_address_1}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_1\" id=\"candidate_address_1\" />\n		</div>			\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_2\">{label:candidate_address_2}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_2\" id=\"candidate_address_2\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_3\">{label:candidate_address_3}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_3\" id=\"candidate_address_3\" />\n		</div>	\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_4\">{label:candidate_address_4}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_4\" id=\"candidate_address_4\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_town_city\">{label:candidate_town_city}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_town_city\" id=\"candidate_town_city\" />\n		</div>	\n\n		<div class=\"form-group\">\n			<label for=\"candidate_state_region\">{label:candidate_state_region}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_state_region\" id=\"candidate_state_region\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_postal_zip_code\">{label:candidate_postal_zip_code}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_postal_zip_code\" id=\"candidate_postal_zip_code\" />\n		</div>			\n\n		<div class=\"form-group\">\n			<label for=\"candidate_country\">{label:candidate_country}</label>\n			<select class=\"form-control\" name=\"candidate_country\" id=\"candidate_country\">\n				{options:candidate_country}\n				<option value=\"{option_value}\" {if \"{option_value}\" == \'United Kingdom\'}selected=\"selected\"{/if}>{option_value}</option>\n				{/options:candidate_country}\n			</select>\n		</div>\n\n		<div class=\"form-group\" id=\"otherCountry\" style=\"display: none;\">\n			<label for=\"candidate_other_county\">{label:candidate_other_county}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_other_county\" id=\"candidate_other_county\" />\n		</div>		\n\n		<div class=\"form-group\">\n			<label for=\"candidate_nationality\">{label:candidate_nationality} <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<select class=\"form-control\" name=\"candidate_nationality\" id=\"candidate_nationality\">\n				{options:candidate_nationality}\n				<option value=\"{option_value}\" {if \"{option_value}\" == \'British\'}selected{/if}>{option_value}</option>\n				{/options:candidate_nationality}\n			</select>\n		</div>			\n\n		<div class=\"form-group\">\n			<label for=\"candidate_phone\">{label:candidate_phone}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_phone\" id=\"candidate_phone\" />\n		</div>		\n	</fieldset>\n\n	<div class=\"form-group\">\n		<a class=\"btn btn-danger\" href=\"/\">Cancel</a>\n		<input class=\"btn btn-primary\" type=\"submit\" value=\"Register\" class=\"form-submit\"/>\n	</div>\n\n	{/exp:zoo_visitor:registration_form}\n\n{/if}'),
	(21,1,'sn:account_login','{if logged_in}\n\n	You are already registered and logged in.\n\n{if:else}\n\n	{exp:zoo_visitor:login_form return=\"account/profile\"}\n\n		<div class=\"form-group\">\n			<label for=\"email\">Email:</label>\n			<input class=\"form-control\" type=\"text\" name=\"username\" id=\"username\" />\n		</div>\n		<div class=\"form-group\">\n			<label for=\"password\">Password:</label>\n			<input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" />\n		</div>\n\n		{if auto_login}\n		<div class=\"form-group\">\n			<label for=\"remember_me\">Remember me?</label>\n			<input class=\"form-control\" class=\'checkbox\' type=\'checkbox\' name=\'auto_login\' value=\'1\'  />\n		</div>\n		{/if}\n\n		<div class=\"form-group\">\n			<a class=\"btn btn-danger\" href=\"/\">Cancel</a>\n			<input class=\"btn btn-primary\" type=\"submit\" name=\"submit\" value=\"Log in\" />\n		</div>\n\n	{/exp:zoo_visitor:login_form}\n\n{/if}'),
	(22,1,'sn:account_password-change','<h2>Account - Change password</h2>\n\n{if logged_in AND segment_3 == \"success\"}\n\n	<div class=\"center\">\n		<p>Your password has been updated.</p>\n	</div>	\n\n{if:elseif logged_in}\n\n	{exp:zoo_visitor:update_form return=\"account/password/success\"}\n\n		<fieldset>\n			When changing your password, you will be asked to login again for security reasons.\n			<div class=\"form-group\">\n				<label for=\"current_password\" class=\"form-label\">Current password:</label>\n				<input type=\"password\" name=\"current_password\" id=\"current_password\" class=\"form-control form-text\"  />\n			</div>\n			<div class=\"form-group\">\n				<label for=\"new_password\" class=\"form-label\">New password</label>\n				<input type=\"password\" name=\"new_password\" id=\"new_password\" class=\"form-control form-text\"  />\n			</div>\n			<div class=\"form-group\">\n				<label for=\"new_password_confirm\" class=\"form-label\">Confirm New password</label>\n				<input type=\"password\" name=\"new_password_confirm\" id=\"new_password_confirm\" class=\"form-control form-text\"  />\n			</div>\n\n		</fieldset>\n\n		<div class=\"form-group\">\n			<a class=\"btn btn-danger\" href=\"account/\">Cancel</a>\n			<input type=\"submit\" value=\"Submit\" class=\"btn btn-primary\" />\n		</div>\n\n	{/exp:zoo_visitor:update_form}\n\n{if:else}\n\n	<p>You are not logged in. <a href=\"{path=account/login}\">Login</a> now.</p>\n\n{/if}'),
	(23,1,'sn:account_password-forgot','{exp:zoo_visitor:forgot_password error_handling=\"inline\" reset_url=\"account/reset\" parse=\"inward\"}\n	{if password_sent}\n		<div class=\"center\">\n			<p>A password reset mail has been sent to the provided email address.</p>\n		</div>	\n	{if:else}\n		<fieldset>\n			<div class=\"form-group\">\n				<label for=\"email\" class=\"form-label\">Your email:</label>\n				<input class=\"form-control\" type=\"text\" name=\"email\" id=\"email\" class=\"form-text\" value=\"\" />\n			</p>\n			{error:email}\n		</fieldset>\n		<div class=\"form-group\">\n			<a class=\"btn btn-danger\" href=\"/account\">Cancel</a>\n			<input type=\"submit\" value=\"Retrieve password\" class=\"btn btn-primary\" />\n		</p>\n	{/if}\n{/exp:zoo_visitor:forgot_password}'),
	(24,1,'sn:account_password-reset','{exp:zoo_visitor:reset_password error_handling=\"inline\"}\n	{if password_reset}\n		<div class=\"center\">\n			<p>Your password has been reset. You can now <a href=\"account/login\"></a> with your new password.</p>\n		</div>	\n	{if:else}\n		<fieldset>\n			<div class=\"form-group\">\n			<label for=\"email\" class=\"form-label\">New Password:</label>\n				<input type=\"password\" name=\"password\" id=\"password\" class=\"form-control form-text\" value=\"\" />\n			</div>\n\n			<div class=\"form-group\">\n				<label for=\"email\" class=\"form-label\">Confirm New Password:</label>\n				<input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" class=\"form-control form-text\" value=\"\" />\n			</div>\n\n			{error:password}\n		</fieldset>\n		<div class=\"form-group\">\n			<input type=\"submit\" value=\"Reset your password\" class=\"btn btn-primary\" />\n		</div>\n	{/if}\n{/exp:zoo_visitor:reset_password}'),
	(25,1,'sn:account_registration','{if last_segment == \"candidate-success\"}\n\n	<div class=\"center\">\n		<p>Your account has been created. Please confirm your email address and then you can <a href=\"/account/login\">sign in</a>.</p>\n	</div>\n\n{if:elseif last_segment == \"employer-success\"}\n\n	<div class=\"center\">\n		<p>Your account has been created. An IT3Sixty staff member will review your submission. If your account is verified, you will be allowed to <a href=\"/account/login\">sign in</a>.</p>\n	</div>\n\n{!-- Candidates --}\n{if:elseif logged_in && group_id == \'6\'}\n\n	You are already registered and signed in. <a href=\"{path=logout}\">Sign out</a> or go to your <a href=\"{path=account/profile}\">account.</a>.\n\n{!-- Employers --}\n{if:elseif logged_in && group_id == \'7\'}\n\n	You are already registered and signed in. <a href=\"{path=logout}\">Sign out</a> or go to your <a href=\"{path=account/}\">account.</a>.\n\n{!-- Staff --}\n{if:elseif logged_in && group_id == \'8\'}\n\n	You are already registered and signed in. <a href=\"{path=logout}\">Sign out</a> or go to your <a href=\"{path=account/}\">account.</a>.\n\n{if:else}\n\n<div role=\"tabpanel\" class=\"registration\">\n\n  <!-- Nav tabs -->\n  <ul class=\"nav nav-tabs\" role=\"tablist\">\n    <li role=\"presentation\" class=\"active\"><a href=\"#candidate-form\" aria-controls=\"home\" role=\"tab\" data-toggle=\"tab\">Candidate</a></li>\n    <li role=\"presentation\"><a href=\"#employer-form\" aria-controls=\"profile\" role=\"tab\" data-toggle=\"tab\">Employer</a></li>\n  </ul>\n\n	\n	<div class=\"tab-content\">\n		<!-- Candidate Registration -->\n		<div role=\"tabpanel\" class=\"tab-pane fade in active\" id=\"candidate-form\">\n			{exp:zoo_visitor:registration_form allowed_groups=\"6\" return=\'account/register/candidate-success\' error_handling=\"inline\"}\n			<h3>Candidate Registration</h3>\n			<fieldset>\n				<legend>Account Details</legend>\n\n				{!-- Set group ID & type --}\n				<input type=\"hidden\" name=\"group_id\" value=\"6\" />\n				<input type=\"hidden\" name=\"member_type\" value=\"candidate\" />\n				\n				<ul>\n				{field_errors}\n					<li class=\"bg-danger error\">{error}</li>\n				{/field_errors}\n				</ul>\n\n				<div class=\"form-group\">\n					<label for=\"email\">Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"email\" name=\"email\" id=\"email_can\" value=\"{if email}{email}{/if}\"/>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"email_confirm\">Confirm Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"email\" name=\"email_confirm\" id=\"email_confirm_can\" value=\"{if email_confirm}{email_confirm}{/if}\"/>\n				</div>		\n\n				<div class=\"form-group\">\n					<label for=\"password\">Password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"password\" name=\"password\" id=\"password_can\" value=\"{if password}{password}{/if}\"/>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"password_confirm\">Confirm password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"password\" name=\"password_confirm\" id=\"password_confirm_can\" value=\"{if password_confirm}{password_confirm}{/if}\"/>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"terms_of_service\">Terms of service:</label>\n					<textarea name=\'terms_of_service\'  class=\"form-control\" rows=\"2\" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pretium sem a lorem pharetra vitae porttitor diam lacinia. Fusce iaculis, tortor nec condimentum vulputate, massa nulla iaculis ante, vitae scelerisque quam est a odio. In hac habitasse platea dictumst.</textarea>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"accept_terms\">Accept terms of service? <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input type=\'checkbox\' name=\'accept_terms\' value=\'y\' {if accept_terms == \"y\"}checked=\"checked\"{/if} />\n				</div>\n\n				{if captcha}\n				<div class=\"form-group\">\n					<label for=\"captcha\">{lang:captcha}*</label>\n					{captcha}<br/>\n					<input class=\"form-control\" type=\"text\" id=\"captcha_can\" name=\"captcha\" value=\"\" size=\"20\" maxlength=\"20\" style=\"width:140px;\"/>\n				</div>\n				{/if}\n			</fieldset>\n			<p></p>\n			<fieldset>\n				<legend>Personal Details</legend>\n\n				<div class=\"form-group\">\n					<label for=\"candidate_title\">{label:candidate_title} <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<select class=\"form-control\" name=\"candidate_title\" id=\"candidate_title\">\n						{options:candidate_title}\n						<option value=\"{option_value}\">{option_value}</option>\n						{/options:candidate_title}\n					</select>\n				</div>	\n\n				<div class=\"form-group\">\n					<label for=\"candidate_first_name\">{label:candidate_first_name}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"candidate_first_name\" id=\"candidate_first_name\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"candidate_last_name\">{label:candidate_last_name}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"candidate_last_name\" id=\"candidate_last_name\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"address_1\">{label:address_1}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"address_1\" id=\"address_1_can\" />\n				</div>			\n\n				<div class=\"form-group\">\n					<label for=\"address_2\">{label:address_2}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"address_2\" id=\"address_2_can\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"address_3\">{label:address_3}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"address_3\" id=\"address_3_can\" />\n				</div>	\n\n				<div class=\"form-group\">\n					<label for=\"address_4\">{label:address_4}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"address_4\" id=\"address_4_can\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"town_city\">{label:town_city}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"town_city\" id=\"town_city_can\" />\n				</div>	\n\n				<div class=\"form-group\">\n					<label for=\"state_region\">{label:state_region}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"state_region\" id=\"state_region\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"postal_zip_code\">{label:postal_zip_code}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"postal_zip_code\" id=\"postal_zip_code_can\" />\n				</div>			\n\n				<div class=\"form-group\">\n					<label for=\"country\">{label:country}</label>\n					<select class=\"form-control\" name=\"country\" id=\"country_can\">\n						<optgroup label=\"Select Country\">\n							{options:country}\n							<option value=\"{option_value}\" {if \"{option_value}\" == \'United Kingdom\'}selected=\"selected\"{/if}{if \"{option_value}\" == \'Other\'}style=\"display: none;\"{/if}>{option_value}</option>\n							{/options:country}\n						</optgroup>\n						<optgroup label=\"Other\">\n							<option value=\"Other\">Other</option>\n						</optgroup>	\n					</select>\n				</div>\n\n				<div class=\"form-group otherCountry\" style=\"display: none;\">\n					<label for=\"other_county\">{label:other_county}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"other_county\" id=\"other_county_can\" />\n				</div>		\n\n				<div class=\"form-group\">\n					<label for=\"candidate_nationality\">{label:candidate_nationality} <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<select class=\"form-control\" name=\"candidate_nationality\" id=\"candidate_nationality\">\n						{options:candidate_nationality}\n						<option value=\"{option_value}\" {if \"{option_value}\" == \'British\'}selected{/if}>{option_value}</option>\n						{/options:candidate_nationality}\n						<optgroup>Other</optgroup>\n					</select>\n				</div>			\n\n				<div class=\"form-group\">\n					<label for=\"candidate_phone\">{label:candidate_phone}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"candidate_phone\" id=\"candidate_phone\" />\n				</div>		\n			</fieldset>\n			<div class=\"form-group\">\n				<a class=\"btn btn-danger\" href=\"/\">Cancel</a>\n				<input class=\"btn btn-primary\" type=\"submit\" value=\"Register\" class=\"form-submit\"/>\n			</div>\n			{/exp:zoo_visitor:registration_form}    	\n	   </div>\n\n		<!-- Employer Registration -->\n		<div role=\"tabpanel\" class=\"tab-pane fade\" id=\"employer-form\">\n			{exp:zoo_visitor:registration_form allowed_groups=\"7\" return=\'account/register/employer-success\' error_handling=\"inline\"}\n			<h3>Employer Registration</h3>\n			<fieldset>\n				<legend>Account Details</legend>\n\n				{!-- Set group ID & type --}\n				<input type=\"hidden\" name=\"group_id\" value=\"4\" />\n				<input type=\"hidden\" name=\"member_type\" value=\"employer\" />\n\n				<ul>\n				{field_errors}\n					<li class=\"bg-danger error\">{error}</li>\n				{/field_errors}\n				</ul>\n\n				<div class=\"form-group\">\n					<label for=\"email\">Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"email\" name=\"email\" id=\"email_emp\" value=\"{if email}{email}{/if}\"/>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"email_confirm\">Confirm Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"email\" name=\"email_confirm\" id=\"email_confirm_emp\" value=\"{if email_confirm}{email_confirm}{/if}\"/>\n				</div>		\n\n				<div class=\"form-group\">\n					<label for=\"password\">Password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"password\" name=\"password\" id=\"password_emp\" value=\"{if password}{password}{/if}\"/>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"password_confirm\">Confirm password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"password\" name=\"password_confirm\" id=\"password_confirm_emp\" value=\"{if password_confirm}{password_confirm}{/if}\"/>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"terms_of_service\">Terms of service:</label>\n					<textarea name=\'terms_of_service\'  class=\"form-control\" rows=\"2\" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pretium sem a lorem pharetra vitae porttitor diam lacinia. Fusce iaculis, tortor nec condimentum vulputate, massa nulla iaculis ante, vitae scelerisque quam est a odio. In hac habitasse platea dictumst.</textarea>\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"accept_terms\">Accept terms of service? <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input type=\'checkbox\' name=\'accept_terms\' value=\'y\' {if accept_terms == \"y\"}checked=\"checked\"{/if} />\n				</div>\n\n				{if captcha}\n				<div class=\"form-group\">\n					<label for=\"captcha\">{lang:captcha}*</label>\n					{captcha}<br/>\n					<input class=\"form-control\" type=\"text\" id=\"captcha_emp\" name=\"captcha\" value=\"\" size=\"20\" maxlength=\"20\" style=\"width:140px;\"/>\n				</div>\n				{/if}\n			</fieldset>\n			<p></p>\n			<fieldset>\n				<legend>Employer Details</legend>\n				<div class=\"form-group\">\n					<label for=\"employer_name\">{label:employer_name} <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"employer_name\" id=\"employer_name\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"address_1\">{label:address_1}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"address_1\" id=\"address_1_emp\" />\n				</div>			\n\n				<div class=\"form-group\">\n					<label for=\"address_2\">{label:address_2}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"address_2\" id=\"address_2_emp\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"address_3\">{label:address_3}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"address_3\" id=\"address_3_emp\" />\n				</div>	\n\n				<div class=\"form-group\">\n					<label for=\"address_4\">{label:address_4}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"address_4\" id=\"address_4_emp\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"town_city\">{label:town_city}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"town_city\" id=\"town_city_emp\" />\n				</div>	\n\n				<div class=\"form-group\">\n					<label for=\"state_region\">{label:state_region}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"state_region\" id=\"state_region_emp\" />\n				</div>\n\n				<div class=\"form-group\">\n					<label for=\"postal_zip_code\">{label:postal_zip_code}:</label>\n					<input class=\"form-control\" type=\"text\" name=\"postal_zip_code\" id=\"postal_zip_code_emp\" />\n				</div>			\n\n				<div class=\"form-group\">\n					<label for=\"country\">{label:country}</label>\n					<select class=\"form-control\" name=\"country\" id=\"country_emp\">\n						<optgroup label=\"Select Country\">\n							{options:country}\n							<option value=\"{option_value}\" {if \"{option_value}\" == \'United Kingdom\'}selected=\"selected\"{/if}{if \"{option_value}\" == \'Other\'}style=\"display: none;\"{/if}>{option_value}</option>\n							{/options:country}\n						</optgroup>\n						<optgroup label=\"Other\">\n							<option value=\"Other\">Other</option>\n						</optgroup>	\n					</select>\n				</div>\n\n				<div class=\"form-group otherCountry\" style=\"display: none;\">\n					<label for=\"other_county\">{label:other_county}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n					<input class=\"form-control\" type=\"text\" name=\"other_county\" id=\"other_county_emp\" />\n				</div>	\n			</fieldset>\n			<div class=\"form-group\">\n				<a class=\"btn btn-danger\" href=\"/\">Cancel</a>\n				<input class=\"btn btn-primary\" type=\"submit\" value=\"Register\" class=\"form-submit\"/>\n			</div>\n			{/exp:zoo_visitor:registration_form}  \n		</div>\n	</div>\n</div>	\n\n{/if}'),
	(26,1,'sn:candidates_profile','{if segment_3 == \"success\"}\n\n	<div class=\"center\">\n		<p>Your profile has been updated!</p>\n	</div>	\n\n{if:else}\n\n	<div class=\"profile\">\n	  <!-- Nav tabs -->\n		<ul class=\"nav nav-tabs\" role=\"tablist\">\n			<li role=\"presentation\" class=\"active\"><a href=\"#home-panel\" aria-controls=\"home\" role=\"tab\" data-toggle=\"tab\">Home</a></li>\n			<li role=\"presentation\"><a href=\"#account-panel\" aria-controls=\"account\" role=\"tab\" data-toggle=\"tab\">Account</a></li>\n			<li role=\"presentation\"><a href=\"#profile-panel\" aria-controls=\"profile-panel\" role=\"tab\" data-toggle=\"tab\">Online CV</a></li>\n		</ul>\n\n		<div class=\"tab-content\">\n			<div role=\"tabpanel\" class=\"tab-pane fade in active\" id=\"home-panel\">\n				<h2>Welcome {screen_name} <a href=\"{path=logout}\" class=\"btn btn-warning btn-small\">Logout</a></h2>\n			</div>\n			<div role=\"tabpanel\" class=\"tab-pane fade\" id=\"account-panel\">\n				{!-- Generic account update --}\n				{sn:account_update}\n			</div>\n			<div role=\"tabpanel\" class=\"tab-pane fade\" id=\"profile-panel\">\n				{exp:zoo_visitor:update_form return=\"account/profile\"}\n					<fieldset>\n						<legend>My CV</legend>\n\n						{if candidate_languages || candidate_nationality || candidates_additional_info || candidate_salary_expectation || candidate_educational_background || candidate_qualifications || candidate_skills || candidate_employment_history || candidate_personal_interests || candidate_professional_bodies || candidate_references || candidates_additional_info || candidate_status == \'\' }\n						<p class=\"bg-warning\">Your online CV is not complete. You cannot apply for a position until all fields have been completed.</p>\n						{/if}\n\n						<div class=\"form-group\">\n							<label for=\"candidate_languages[]\">{label:candidate_languages}</label>\n							<select name=\"candidate_languages[]\" class=\"form-control\" id=\"candidate_languages\" multiple>\n								{options:candidate_languages}\n								<option value=\"{option_name}\" {selected}>{option_name}</option>\n								{/options:candidate_languages}\n							</select>\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_nationality\">{label:candidate_nationality}</label>\n							<select name=\"candidate_nationality\" class=\"form-control\" id=\"candidate_nationality\">\n								{options:candidate_nationality}\n								<option value=\"{option_value}\" {selected}>{option_value}</option>\n								{/options:candidate_nationality}\n							</select>\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_skype\">{label:candidate_skype}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"candidate_skype\" id=\"candidate_skype\" value=\"{if candidate_skype}{candidate_skype}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_comms_provider\">{label:candidate_comms_provider}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"candidate_comms_provider\" id=\"candidate_comms_provider\" value=\"{if candidate_comms_provider}{candidate_comms_provider}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_comms_id\">{label:candidate_comms_id}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"candidate_comms_id\" id=\"candidate_comms_id\" value=\"{if candidate_comms_id}{candidate_comms_id}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_employment\">{label:candidate_employment}</label>\n							<select name=\"candidate_employment\" class=\"form-control\" id=\"candidate_employment\">\n								{options:candidate_employment}\n								<option value=\"{option_value}\" {selected}>{option_value}</option>\n								{/options:candidate_employment}\n							</select>\n						</div>		\n\n						<div class=\"form-group\">\n							<label for=\"candidate_salary_expectation\">{label:candidate_salary_expectation}</label>\n							<select name=\"candidate_salary_expectation\" class=\"form-control\" id=\"candidate_salary_expectation\">\n								{options:candidate_salary_expectation}\n								<option value=\"{option_value}\" {selected}>{option_value}</option>\n								{/options:candidate_salary_expectation}\n							</select>\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_educational_background\">{label:candidate_educational_background}:</label>\n							{field:candidate_educational_background}\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_qualifications\">{label:candidate_qualifications}:</label>\n							{field:candidate_qualifications}\n						</div>					\n\n						<div class=\"form-group\">\n							<label for=\"candidate_skills\">{label:candidate_skills}:</label>\n							{field:candidate_skills}\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_employment_history\">{label:candidate_employment_history}:</label>\n							{field:candidate_employment_history}\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_personal_interests\">{label:candidate_personal_interests}:</label>\n							{field:candidate_personal_interests}\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_professional_bodies\">{label:candidate_professional_bodies}:</label>\n							{field:candidate_professional_bodies}\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_references\">{label:candidate_references}:</label>\n							{field:candidate_references}\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidates_additional_info\">{label:candidates_additional_info}:</label>\n							{field:candidates_additional_info}\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"candidate_status\">{label:candidate_status}</label>\n							<select name=\"candidate_status\" class=\"form-control\" id=\"candidate_status\">\n								{options:candidate_status}\n								<option value=\"{option_value}\" {selected}>{option_value}</option>\n								{/options:candidate_status}\n							</select>\n						</div>\n					</fieldset>\n					<div class=\"form-group\">\n						<input class=\"form-submit btn btn-primary\" type=\"submit\" id=\"updateProfile\" value=\"Update Profile\" />\n					</div>\n				{/exp:zoo_visitor:update_form}	\n			</div>		\n		</div>\n	</div>\n\n{/if}'),
	(28,1,'sn:employers_profile','{if segment_3 == \"success\"}\n\n	<div class=\"center\">\n		<p>Your profile has been updated!</p>\n	</div>	\n\n{if:else}\n\n	<div class=\"profile\">\n	  <!-- Nav tabs -->\n		<ul class=\"nav nav-tabs\" role=\"tablist\">\n			<li role=\"presentation\" class=\"active\"><a href=\"#home-panel\" aria-controls=\"home\" role=\"tab\" data-toggle=\"tab\">Home</a></li>\n			<li role=\"presentation\"><a href=\"#account-panel\" aria-controls=\"account\" role=\"tab\" data-toggle=\"tab\">Account</a></li>\n			<li role=\"presentation\"><a href=\"#profile-panel\" aria-controls=\"profile-panel\" role=\"tab\" data-toggle=\"tab\">Employer Profile</a></li>\n		</ul>\n\n		<div class=\"tab-content\">\n			<div role=\"tabpanel\" class=\"tab-pane fade in active\" id=\"home-panel\">\n				<h2>Welcome {screen_name} <a href=\"{path=logout}\" class=\"btn btn-warning btn-small\">Logout</a></h2>\n				<div>\n					{if employer_logo}{employer_logo}{/if}\n				</div>\n			</div>\n			<div role=\"tabpanel\" class=\"tab-pane fade\" id=\"account-panel\">\n				{!-- Generic account update --}\n				{sn:account_update}\n			</div>\n			<div role=\"tabpanel\" class=\"tab-pane fade\" id=\"profile-panel\">\n				{exp:zoo_visitor:update_form return=\"account/profile\"}\n					<fieldset>\n						<legend>Employer Profile</legend>\n\n						<div class=\"form-group\">\n							<label for=\"employer_website\">{label:employer_website}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"employer_website\" id=\"employer_website\" value=\"{if employer_website}{employer_website}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"employer_name\">{label:employer_name}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"employer_name\" id=\"employer_name\" value=\"{if employer_name}{employer_name}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"employer_phone\">{label:employer_phone}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"employer_phone\" id=\"employer_phone\" value=\"{if employer_phone}{employer_phone}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"employer_position\">{label:employer_position}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"employer_position\" id=\"employer_position\" value=\"{if employer_position}{employer_position}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"employer_contact_name\">{label:employer_contact_name}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"employer_contact_name\" id=\"employer_contact_name\" value=\"{if employer_contact_name}{employer_contact_name}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"employer_contact_email\">{label:employer_contact_email}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"employer_contact_email\" id=\"employer_contact_email\" value=\"{if employer_contact_email}{employer_contact_email}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"employer_contact_phone\">{label:employer_contact_phone}:</label>\n							<input type=\"text\" class=\"form-control\" name=\"employer_contact_phone\" id=\"employer_contact_phone\" value=\"{if employer_contact_phone}{employer_contact_phone}{/if}\" />\n						</div>\n\n						<div class=\"form-group\">\n							<label for=\"employer_hex\">{label:employer_hex}:</label>\n							<div class=\"input-group\">\n								<div class=\"input-group-addon\">#</div>\n								<input type=\"text\" class=\"form-control\" name=\"employer_hex\" id=\"employer_hex\" maxlength=\"6\" value=\"{if employer_hex}{employer_hex}{/if}\" />\n							</div>	\n						</div>								\n\n						<div class=\"form-group\">\n							<label for=\"employer_logo\">{label:employer_logo}:</label>\n							{field:employer_logo}\n							<br>\n							<div class=\"alert alert-info warning\" role=\"alert\">\n								<p>Images should be no larger than 1MB. You can upload jpg, png or gif images.</p>\n							</div>							\n						</div>															\n\n					</fieldset>\n					<div class=\"form-group\">\n						<input class=\"form-submit btn btn-primary\" type=\"submit\" id=\"updateProfile\" value=\"Update Profile\" />\n					</div>	\n				{/exp:zoo_visitor:update_form}	\n			</div>		\n		</div>\n	</div>\n\n{/if}'),
	(27,1,'sn:employers_register','{if last_segment == \"success\"}\n\n	<div class=\"center\">\n		<p>Your account has been created. Please confirm your email address and then you can <a href=\"/account/login\">sign in</a>.</p>\n	</div>\n\n{if:elseif logged_in}\n\n	You are already registered and logged in. <a href=\"{path=logout}\">Logout</a> or go to your <a href=\"{path=account/profile}\">profile</a>.\n\n{if:else}\n\n	{exp:zoo_visitor:registration_form allowed_groups=\"6\" return=\'account/register/success\'}\n\n	<h3>Candidate Registration</h3>\n	<fieldset>\n		<legend>Basic Details</legend>\n\n		<div class=\"form-group\">\n			<label for=\"email\">Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"email\" name=\"email\" id=\"email\" value=\"{if email}{email}{/if}\"/>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"email_confirm\">Confirm Email: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"email\" name=\"email_confirm\" id=\"email_confirm\" value=\"{if email_confirm}{email_confirm}{/if}\"/>\n		</div>		\n\n		<div class=\"form-group\">\n			<label for=\"password\">Password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" value=\"{if password}{password}{/if}\"/>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"password_confirm\">Confirm password: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"password\" name=\"password_confirm\" id=\"password_confirm\" value=\"{if password_confirm}{password_confirm}{/if}\"/>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"terms_of_service\">Terms of service:</label>\n			<textarea name=\'terms_of_service\'  class=\"form-control\" rows=\"2\" readonly>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pretium sem a lorem pharetra vitae porttitor diam lacinia. Fusce iaculis, tortor nec condimentum vulputate, massa nulla iaculis ante, vitae scelerisque quam est a odio. In hac habitasse platea dictumst.</textarea>\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"accept_terms\">Accept terms of service? <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input type=\'checkbox\' name=\'accept_terms\' value=\'y\' {if accept_terms == \"y\"}checked=\"checked\"{/if} />\n		</div>\n\n		{if captcha}\n		<div class=\"form-group\">\n			<label for=\"captcha\">{lang:captcha}*</label>\n			{captcha}<br/>\n			<input class=\"form-control\" type=\"text\" id=\"captcha\" name=\"captcha\" value=\"\" size=\"20\" maxlength=\"20\" style=\"width:140px;\"/>\n		</div>\n		{/if}\n	</fieldset>\n	<p></p>\n	<fieldset>\n		<legend>Personal Details</legend>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_title\">{label:candidate_title} <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<select class=\"form-control\" name=\"candidate_title\" id=\"candidate_title\">\n				{options:candidate_title}\n				<option value=\"{option_value}\">{option_value}</option>\n				{/options:candidate_title}\n			</select>\n		</div>	\n\n		<div class=\"form-group\">\n			<label for=\"candidate_first_name\">{label:candidate_first_name}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_first_name\" id=\"candidate_first_name\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_last_name\">{label:candidate_last_name}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_last_name\" id=\"candidate_last_name\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_1\">{label:candidate_address_1}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_1\" id=\"candidate_address_1\" />\n		</div>			\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_2\">{label:candidate_address_2}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_2\" id=\"candidate_address_2\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_3\">{label:candidate_address_3}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_3\" id=\"candidate_address_3\" />\n		</div>	\n\n		<div class=\"form-group\">\n			<label for=\"candidate_address_4\">{label:candidate_address_4}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_address_4\" id=\"candidate_address_4\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_town_city\">{label:candidate_town_city}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_town_city\" id=\"candidate_town_city\" />\n		</div>	\n\n		<div class=\"form-group\">\n			<label for=\"candidate_state_region\">{label:candidate_state_region}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_state_region\" id=\"candidate_state_region\" />\n		</div>\n\n		<div class=\"form-group\">\n			<label for=\"candidate_postal_zip_code\">{label:candidate_postal_zip_code}:</label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_postal_zip_code\" id=\"candidate_postal_zip_code\" />\n		</div>			\n\n		<div class=\"form-group\">\n			<label for=\"candidate_country\">{label:candidate_country}</label>\n			<select class=\"form-control\" name=\"candidate_country\" id=\"candidate_country\">\n				{options:candidate_country}\n				<option value=\"{option_value}\" {if \"{option_value}\" == \'United Kingdom\'}selected=\"selected\"{/if}>{option_value}</option>\n				{/options:candidate_country}\n			</select>\n		</div>\n\n		<div class=\"form-group\" id=\"otherCountry\" style=\"display: none;\">\n			<label for=\"candidate_other_county\">{label:candidate_other_county}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_other_county\" id=\"candidate_other_county\" />\n		</div>		\n\n		<div class=\"form-group\">\n			<label for=\"candidate_nationality\">{label:candidate_nationality} <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<select class=\"form-control\" name=\"candidate_nationality\" id=\"candidate_nationality\">\n				{options:candidate_nationality}\n				<option value=\"{option_value}\" {if \"{option_value}\" == \'British\'}selected{/if}>{option_value}</option>\n				{/options:candidate_nationality}\n			</select>\n		</div>			\n\n		<div class=\"form-group\">\n			<label for=\"candidate_phone\">{label:candidate_phone}: <span style=\"margin-left: 6px;\" class=\"btn btn-danger btn-xs\">Required</span></label>\n			<input class=\"form-control\" type=\"text\" name=\"candidate_phone\" id=\"candidate_phone\" />\n		</div>		\n	</fieldset>\n\n	<div class=\"form-group\">\n		<a class=\"btn btn-danger\" href=\"/\">Cancel</a>\n		<input class=\"btn btn-primary\" type=\"submit\" value=\"Register\" class=\"form-submit\"/>\n	</div>\n\n	{/exp:zoo_visitor:registration_form}\n\n{/if}'),
	(29,1,'sn:account_update','<div>\n	<a class=\"btn btn-default\" href=\"account/email\">Change email</a> <a class=\"btn btn-default\"  href=\"account/password\">Change password</a>\n</div>			'),
	(30,1,'sn:global_breadcrumb','<div id=\"breadcrumb_wrap\">\n	<div class=\"crumb_wrap\">\n\n		<div class=\"crumbs\"> 	\n			{exp:structure:breadcrumb here_as_title=\"yes\"}\n		</div>\n		\n		<p id=\"user_name\">\n\n			{if logged_in && group_id == \'7\'}\n				{exp:zoo_visitor:details}\n				{if visitor:main_employer}\n					<span>{screen_name}</span>\n				{if:else}\n					<span><a href=\"/employers-a-z/detail/{visitor:url_title}\" style=\"color: #fff;\n  text-decoration: none;\">{screen_name}</a></span>\n				{/if}\n				{/exp:zoo_visitor:details}\n			{if:elseif logged_in}\n				<span>{screen_name}</span>\n			{/if}\n\n			<a href=\"{if logged_in}/dashboard/{if:else}/login/{/if}\">\n				<img src=\"/assets/images/settings-icon.png\" alt=\"{screen_name}\" height=\"30\" width=\"30\" />\n			</a>\n\n		</p>\n\n	</div>\n\n</div>\n'),
	(33,1,'sn:home_slider','<div class=\"parallax-slide\">\n<div class=\"swiper-container\" data-autoplay=\"5000\" data-loop=\"1\" data-speed=\"500\" data-center=\"0\" data-slides-per-view=\"1\">\n    <div class=\"swiper-wrapper\">\n       {exp:channel:entries channel=\"homepage_slider\" limit=\"1\" dynamic=\"no\" disable=\"categories|category_fields|member_data\"}\n       {slider_images}\n        <div class=\"swiper-slide active\" data-val=\"0\" style=\"background-image: url({slider_images:image});\"> \n            <div class=\"parallax-vertical-align\">\n                <div class=\"parallax-article\">\n                    {if slider_images}<h2 class=\"subtitle\">{slider_images:top_text}</h2>{/if}\n                    <h1 class=\"title\">{slider_images:big_text}</h1>\n                    {if slider_images:bottom_text}<div class=\"description\">{slider_images:bottom_text}</div>{/if}\n                    <div class=\"info\">\n                        {if slider_images:button_1_text}<a href=\"{slider_images:button_1_link}\" target=\"_blank\" class=\"button style-8\">{slider_images:button_1_text}</a>{/if}\n                        {if slider_images:button_2_text}<a href=\"{slider_images:button_2_link}\" class=\"button style-8\">{slider_images:button_2_text}</a>{/if}\n                    </div>\n                </div>\n            </div>\n        </div>\n        {/slider_images}\n        {/exp:channel:entries}\n        \n    </div>\n    <div class=\"pagination\"></div>\n</div>\n</div>'),
	(35,1,'sn:global_search','<div class=\"search-box popup\">\n        <form>\n            <div class=\"search-button\">\n                <i class=\"fa fa-search\"></i>\n                <input type=\"submit\" />\n            </div>\n            <div class=\"search-drop-down\">\n                <div class=\"title\"><span>All categories</span><i class=\"fa fa-angle-down\"></i></div>\n                <div class=\"list\">\n                    <div class=\"overflow\">\n                        <div class=\"category-entry\">Category 1</div>\n                        <div class=\"category-entry\">Category 2</div>\n                        <div class=\"category-entry\">Category 2</div>\n                        <div class=\"category-entry\">Category 4</div>\n                        <div class=\"category-entry\">Category 5</div>\n                        <div class=\"category-entry\">Lorem</div>\n                        <div class=\"category-entry\">Ipsum</div>\n                        <div class=\"category-entry\">Dollor</div>\n                        <div class=\"category-entry\">Sit Amet</div>\n                    </div>\n                </div>\n            </div>\n            <div class=\"search-field\">\n                <input type=\"text\" value=\"\" placeholder=\"Search for product\" />\n            </div>\n        </form>\n    </div>'),
	(31,1,'sn:global_navigation','{if logged_in}\n	{if segment_1 == \'\'}\n	<a class=\"settings-cog\" href=\"/dashboard\"></a>\n	{/if}\n{/if}\n<ul>\n				\n	<li><a href=\"/\" {if segment_1==\"\"}class=\"active\"{/if}>Home</a></li>\n\n	<li><a {if segment_1==\"about-us\"}class=\"active\"{/if} href=\"/about-us\">About Us</a></li>\n\n	<li><a {if segment_1==\"why-northern-ireland\"}class=\"active\"{/if} href=\"/why-northern-ireland\">Why N.Ireland</a></li>\n\n	{if logged_in && group_id == \'6\'}\n		<li><a {if segment_1==\"employers\"}class=\"active\"{/if}href=\"/employers-a-z\">Employers</a></li>\n	{if:else}\n		<li><a {if segment_1==\"employers\"}class=\"active\"{/if}href=\"/employers\">Employers</a></li>\n	{/if}\n\n	{if logged_in && group_id == \'7\'}\n		<li><a {if segment_1==\"candidates\"}class=\"active\"{/if}href=\"/dashboard/search-for-candidates\">Candidates</a></li>\n	{if:else}\n		<li><a {if segment_1==\"candidates\"}class=\"active\"{/if}href=\"/candidates\">Candidates</a></li>\n	{/if}\n	\n\n	<li><a {if segment_1==\"events\"}class=\"active\"{/if}href=\"/events\">Events</a></li>\n\n	<li class=\"last\">\n		{if logged_in}\n			<a class=\"login\" href=\"{path=logout}\">\n				logout\n				<i class=\"icon-lock-open-alt\"></i>\n			</a>\n		{if:else}\n			<a class=\"login\" href=\"/login\">\n				Login\n				<i class=\"icon-lock-open-alt\"></i>\n			</a>\n		{/if}\n	</li>\n\n</ul>'),
	(32,1,'sn:global_sidebar','<aside id=\"standard-sidebar\" style=\"padding-right: 10px\">\n	\n	{!-- Candidates Help--}\n	{if logged_in && group_id == \'6\' && segment_1 == \"candidate-help\"}\n\n		<div class=\"sidebar-module job-listing lightest_grey\">\n\n			<header>\n				<h4>Help</h4>\n			</header>\n\n			<div class=\"job_body\">\n				<ul>\n					<li>\n						<a href=\"#\" {if segment_1 == \"\" && segment_2 ==\"\"} class=\"active-state\"{/if}>\n							Help Page\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n				</ul>\n			</div>\n		</div>\n\n	{!-- Employers Help --}\n	{if:elseif logged_in && group_id == \'7\' && segment_1 == \"employer-help\"}\n\n		<div class=\"sidebar-module job-listing lightest_grey\">\n\n			<header>\n				<h4>Help</h4>\n			</header>\n\n			<div class=\"job_body\">\n				<ul>\n					<li>\n						<a href=\"#\" {if segment_1 == \"\" && segment_2 ==\"\"} class=\"active-state\"{/if}>\n							Help Page\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n				</ul>\n			</div>\n			\n		</div>\n\n	{/if}\n\n	{if segment_1 == \"why-northern-ireland\"}\n\n		<div class=\"sidebar-module job-listing lightest_grey\">\n\n			<header>\n				<h4>Reasons</h4>\n			</header>\n\n			<div class=\"job_body\">\n				<ul>\n					<li>\n						<a href=\"/why-northern-ireland/\" {if segment_1 == \"why-northern-ireland\" && segment_2 ==\"\"} class=\"active-state\"{/if}>\n							Why Northern Ireland?\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n					<li>\n						<a href=\"/why-northern-ireland/job-opportunities\" {if segment_2 == \"job-opportunities\"} class=\"active-state\"{/if}>\n							Job Opportunities\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n					<li>\n						<a href=\"/why-northern-ireland/cost-of-living\" {if segment_2 == \"cost-of-living\"} class=\"active-state\"{/if}>\n							Cost Of living\n							<div class=\"area\">\n								\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n					<li>\n						<a href=\"/why-northern-ireland/lifestyle\" {if segment_2 == \"lifestyle\"} class=\"active-state\"{/if}>\n							Lifestyle\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n					<li>\n						<a href=\"/why-northern-ireland/eating-out\" {if segment_2 == \"eating-out\"} class=\"active-state\"{/if}>\n							Eating Out\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n					<li>\n						<a href=\"/why-northern-ireland/socialising\" {if segment_2 == \"socialising\"} class=\"active-state\"{/if}>\n							Socialising\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n					<li>\n						<a href=\"/why-northern-ireland/sports\" {if segment_2 == \"sports\"} class=\"active-state\"{/if}>\n							Sports\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li> \n					<li>\n						<a href=\"/why-northern-ireland/travel\"{if segment_2 == \"travel\"} class=\"active-state\"{/if}>\n							Travel\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li> \n					<li>\n						<a href=\"/why-northern-ireland/culture\" {if segment_2 == \"culture\"} class=\"active-state\"{/if}>\n							Culture\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li> \n					<li>\n						<a href=\"/why-northern-ireland/tv-movies\" {if segment_2 == \"tv-movies\"} class=\"active-state\"{/if}>\n							TV &amp; Movies\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li> \n					<li>\n						<a href=\"/why-northern-ireland/retail\" {if segment_2 == \"retail\"} class=\"active-state\"{/if}>\n							Retail\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li> \n					<li>\n						<a href=\"/why-northern-ireland/education\" {if segment_2 == \"education\"} class=\"active-state\"{/if}>\n							Education\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li> \n					<li>\n						<a href=\"/why-northern-ireland/healthcare\" {if segment_2 == \"healthcare\"} class=\"active-state\"{/if}>\n							Healthcare\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li> \n				</ul>\n			</div>\n		</div>\n\n	{if:else}\n		{if segment_2 == \"job-search\" || segment_2 == \"job-profile-match\"}\n			<div class=\"sidebar-module lightest_grey\">\n				<header>\n					<h4>Search</h4>\n				</header>\n					{exp:search:simple_form channel=\"job\" search_in=\"entries\" form_id=\"standard_search\" result_page=\"jobs/search\" no_result_page=\"jobs/search-noresults\"}\n						<fieldset>\n							<input type=\"search\" name=\"keywords\" placeholder=\"Search here..\"/>\n							<input type=\"submit\" name=\"submit\" value=\"Go\"/>\n						</fieldset>\n					{/exp:search:simple_form}\n{!-- \n					{exp:search:simple_form search_in=\"entries\" channel=\"job\" form_id=\"advanced_search\"}\n					<fieldset>\n						<legend>\n							<a href=\"javascript:void(0)\">\n								Advanced search\n							</a>\n						</legend>\n						<div>\n							<input type=\"search\" name=\"search\" placeholder=\"Advanced Search field..\"/>\n							<input type=\"search\" name=\"search\" placeholder=\"Advanced Search field..\"/>\n							<input type=\"search\" name=\"search\" placeholder=\"Advanced Search field..\"/>\n							<input type=\"search\" name=\"search\" placeholder=\"Advanced Search field..\"/>\n							<input type=\"submit\" name=\"submit\" value=\"Go\"/>\n						</div>\n					</fieldset>\n				</form> --}\n			</div>\n		{/if}\n\n		<div class=\"sidebar-module lightest_grey\">\n\n			<header>\n				<h4>Latest Jobs</h4>\n			</header>\n\n			<div class=\"job_body\">\n\n				<ul>\n					{exp:channel:entries channel=\"job\" limit=\"6\" dynamic=\"off\" disable=\"member_data\"}\n\n					<li>\n						<a href=\"{page_url}\">\n							{exp:eehive_hacksaw chars=\"40\" append=\"...\"}\n								{title}\n							{/exp:eehive_hacksaw}\n							<div class=\"area\">\n								<i class=\"icon-right-circle\"></i>\n							</div>\n						</a>\n					</li>\n\n					{/exp:channel:entries}	\n				</ul>\n\n			</div>\n\n		</div>\n\n	{/if}\n\n	<div class=\"sidebar-module glossary-sidebar\">\n		<header>\n			<h4><a href=\"/employers-a-z\">A-Z Companies</a></h4>\n		</header>\n		{!-- <div class=\"a_z\">\n			<table>\n				<tr>\n				    <td class=\"selected\"><a href=\"#\">A</a></td>\n				    <td><a href=\"#\">B</a></td>\n				    <td><a href=\"#\">C</a></td>\n				    <td><a href=\"#\">D</a></td>\n				    <td><a href=\"#\">E</a></td>\n				    <td><a href=\"#\">F</a></td>\n				    <td><a href=\"#\">G</a></td>\n				</tr>\n			  	<tr>\n				    <td><a href=\"#\">H</a></td>\n				    <td><a href=\"#\">I</a></td>\n				    <td><a href=\"#\">J</a></td>\n				    <td><a href=\"#\">K</a></td>\n				    <td><a href=\"#\">L</a></td>\n				    <td><a href=\"#\">M</a></td>\n				    <td><a href=\"#\">N</a></td>\n				</tr>\n				<tr>\n				    <td><a href=\"#\">O</a></td>\n				    <td><a href=\"#\">P</a></td>\n				    <td><a href=\"#\">Q</a></td>\n				    <td><a href=\"#\">R</a></td>\n				    <td><a href=\"#\">S</a></td>\n				    <td><a href=\"#\">T</a></td>\n				    <td><a href=\"#\">U</a></td>\n				</tr>\n				<tr>\n				    <td><a href=\"#\">V</a></td>\n				    <td><a href=\"#\">W</a></td>\n				    <td><a href=\"#\">X</a></td>\n				    <td><a href=\"#\">Y</a></td>\n				    <td><a href=\"#\">Z</a></td>\n				    <td><a href=\"#\"></a></td>\n				    <td><a href=\"#\"></a></td>\n				</tr>\n			</table>\n		</div> --}\n	</div>\n\n	<div id=\"social-module\">\n\n		<div>\n			<a href=\"https://www.facebook.com/IT3Sixty\">\n				<i class=\"icon-facebook-squared\"></i>\n				<p>Like us on\n					<span>Facebook</span>\n				</p>\n			</a>\n		</div>\n\n		<div>\n			<a href=\"https://twitter.com/@IT3Sixty_NI\">\n				<i class=\"icon-twitter-squared\"></i>\n				<p>Follow us on\n					<span>Twitter</span>\n				</p>\n			</a>\n		</div>\n\n		<div>\n			<a href=\"http://linkd.in/1Ftuvzw\">\n				<i class=\"icon-linkedin-squared\"></i>\n				<p>Connect @ \n					<span>Linked In</span>\n				</p>\n			</a>\n		</div>\n\n	</div>\n	\n</aside>'),
	(38,1,'sn:global_cart','<div class=\"cart-box popup\">\n        <div class=\"popup-container\">\n        {exp:cartthrob:cart_items_info}\n        \n        {if no_results}\n                <p>There are no products in your cart</p>\n                <br/><br/>\n        {/if}\n            <div class=\"cart-entry\">\n                <a class=\"image\" href=\"{site_url}products/{url_title}\">{embed=\"shop/thumb\" entry_id=\"{entry_id}\"}</a>\n                <div class=\"content\">\n                    <a class=\"title\" href=\"{site_url}products/{url_title}\">{title}</a>\n                     <div class=\"inline-description\"><strong>Size</strong>: {item_options:item_dimensions_1}</div>\n                    <div class=\"quantity\">Quantity: {quantity}</div>\n                    <div class=\"price\">{item_subtotal}</div>\n                </div>\n                <div class=\"button-x\"><i class=\"fa fa-close\"></i></div>\n            </div>\n        {/exp:cartthrob:cart_items_info}\n         \n         {exp:cartthrob:cart_items_info limit=\"1\"}\n            <div class=\"summary\">\n                <div class=\"grandtotal\">Subtotal <span>{cart_subtotal}</span></div>\n            </div>\n         {/exp:cartthrob:cart_items_info}\n            <div class=\"cart-buttons\">\n                <div class=\"column\">\n                    <a class=\"button style-3\" href=\"{site_url}cart\">view cart</a>\n                    <div class=\"clear\"></div>\n                </div>\n                <div class=\"column\">\n                    <a class=\"button style-4\" href=\"{site_url}cart\">checkout</a>\n                    <div class=\"clear\"></div>\n                </div>\n                <div class=\"clear\"></div>\n            </div>\n        </div>\n    </div>'),
	(34,1,'sn:home_featured-panel','<div class=\"row nopadding\">\n    {exp:channel:entries channel=\"homepage_featured_panel\" limit=\"1\" disable=\"categories|category_fields|member_data\"}\n    {panels}\n    <div class=\"col-sm-4 nopadding creative-square-box\">\n        <div class=\"background-box\" style=\"background-image: url({panels:image});\"></div>\n        <div class=\"cell-view\">\n            <div class=\"parallax-article\">\n                {if panels:top_text}<h2 class=\"subtitle\">{panels:top_text}</h2>{/if}\n                <h1 class=\"title\">{panels:main_text}</h1>\n                {if panels:description}<div class=\"description\">{panels:description}</div>{/if}\n                <div class=\"info\">\n                    <a href=\"{panels:button_link}\" class=\"button style-8\">{panels:button_text}</a>\n                </div>\n            </div>\n        </div>\n    </div>\n    {/panels}\n    {/exp:channel:entries}\n\n</div>'),
	(36,1,'sn:global_header-inner','<div class=\"header-wrapper style-10\">\n                <header class=\"type-1\">\n\n                    <div class=\"header-product\">\n                        <div class=\"logo-wrapper\">\n                            <a href=\"{site_url}\" id=\"logo\"><img alt=\"\" src=\"{site_url}/assets/img/logo-9.png\"></a>\n                        </div>\n                        <div class=\"product-header-message\">\n                            FREE SHIPPING ON ALL UK ORDERS this week\n                        </div>\n                        <div class=\"product-header-content\">\n                            <div class=\"line-entry\">\n                                <div class=\"menu-button responsive-menu-toggle-class\"><i class=\"fa fa-reorder\"></i></div>\n                                <div class=\"header-top-entry increase-icon-responsive open-search-popup\">\n                                    <div class=\"title\"><i class=\"fa fa-search\"></i> <span>Search</span></div>\n                                </div>\n                                <div class=\"header-top-entry increase-icon-responsive\">\n                                    <div class=\"title\"><i class=\"fa fa-user\"></i> <span>My Account</span></div>\n                                </div>\n                                <div class=\"header-top-entry\">\n                                    <div class=\"title\"><img alt=\"\" src=\"{site_url}/assets/img/flag-lang-1.png\">English<i class=\"fa fa-caret-down\"></i></div>\n                                    <div class=\"list\">\n                                        <a class=\"list-entry\" href=\"#\"><img alt=\"\" src=\"{site_url}/assets/img/flag-lang-2.png\">French</a>\n                                        <a class=\"list-entry\" href=\"#\"><img alt=\"\" src=\"{site_url}/assets/img/flag-lang-3.png\">Spanish</a>\n                                    </div>\n                                </div>\n                                <div class=\"header-top-entry\">\n                                    <div class=\"title\">$ USD <i class=\"fa fa-caret-down\"></i></div>\n                                    <div class=\"list\">\n                                        <a class=\"list-entry\" href=\"#\">$ CAD</a>\n                                        <a class=\"list-entry\" href=\"#\">€ EUR</a>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"middle-line\"></div>\n                            <div class=\"line-entry\">\n                                <a href=\"#\" class=\"header-functionality-entry\"><i class=\"fa fa-copy\"></i><span>Compare</span></a>\n                                <a href=\"#\" class=\"header-functionality-entry\"><i class=\"fa fa-heart-o\"></i><span>Wishlist</span></a>\n                                <a href=\"#\" class=\"header-functionality-entry open-cart-popup\"><i class=\"fa fa-shopping-cart\"></i><span>My Cart</span> <b>$255,99</b></a>\n                            </div>\n                        </div>\n                    </div>\n\n                    <div class=\"close-header-layer\"></div>\n                    <div class=\"navigation\">\n                        <div class=\"navigation-header responsive-menu-toggle-class\">\n                            <div class=\"title\">Navigation</div>\n                            <div class=\"close-menu\"></div>\n                        </div>\n                        <div class=\"nav-overflow\">\n                            <nav>\n                                <ul>\n                                    <li class=\"full-width\">\n                                        <a href=\"#\" class=\"active\">Home</a><i class=\"fa fa-chevron-down\"></i>\n                                        <div class=\"submenu\">\n                                            <div class=\"full-width-menu-items-right\">\n                                                <div class=\"menu-slider-arrows\">\n                                                    <a class=\"left\"><i class=\"fa fa-chevron-left\"></i></a>\n                                                    <a class=\"right\"><i class=\"fa fa-chevron-right\"></i></a>\n                                                </div>\n                                                <div class=\"submenu-list-title\"><a href=\"#\">Reccomended Products</a><span class=\"toggle-list-button\"></span></div>\n                                                <div class=\"menu-slider-out\">\n                                                    <div class=\"menu-slider-in\">\n                                                        <div class=\"menu-slider-entry\">\n                                                            <div class=\"product-slide-entry\">\n                                                                <div class=\"product-image\">\n                                                                    <img src=\"{site_url}/assets/img/product-minimal-1.jpg\" alt=\"\" />\n                                                                    <div class=\"bottom-line left-attached\">\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-shopping-cart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-heart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-retweet\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-expand\"></i></a>\n                                                                    </div>\n                                                                </div>\n                                                                <a href=\"#\" class=\"title\">1.Pullover Batwing Sleeve Zigzag</a>\n                                                                <div class=\"price\">\n                                                                    <div class=\"prev\">$199,99</div>\n                                                                    <div class=\"current\">$119,99</div>\n                                                                </div>\n                                                            </div>\n                                                        </div>\n                                                        <div class=\"menu-slider-entry\">\n                                                            <div class=\"product-slide-entry\">\n                                                                <div class=\"product-image\">\n                                                                    <img src=\"{site_url}/assets/img/product-minimal-2.jpg\" alt=\"\" />\n                                                                    <div class=\"bottom-line left-attached\">\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-shopping-cart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-heart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-retweet\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-expand\"></i></a>\n                                                                    </div>\n                                                                </div>\n                                                                <a href=\"#\" class=\"title\">2.Pullover Batwing Sleeve Zigzag</a>\n                                                                <div class=\"price\">\n                                                                    <div class=\"prev\">$199,99</div>\n                                                                    <div class=\"current\">$119,99</div>\n                                                                </div>\n                                                            </div>\n                                                        </div>\n                                                        <div class=\"menu-slider-entry\">\n                                                            <div class=\"product-slide-entry\">\n                                                                <div class=\"product-image\">\n                                                                    <img src=\"{site_url}/assets/img/product-minimal-3.jpg\" alt=\"\" />\n                                                                    <div class=\"bottom-line left-attached\">\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-shopping-cart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-heart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-retweet\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-expand\"></i></a>\n                                                                    </div>\n                                                                </div>\n                                                                <a href=\"#\" class=\"title\">3.Pullover Batwing Sleeve Zigzag</a>\n                                                                <div class=\"price\">\n                                                                    <div class=\"prev\">$199,99</div>\n                                                                    <div class=\"current\">$119,99</div>\n                                                                </div>\n                                                            </div>\n                                                        </div>\n                                                        <div class=\"menu-slider-entry\">\n                                                            <div class=\"product-slide-entry\">\n                                                                <div class=\"product-image\">\n                                                                    <img src=\"{site_url}/assets/img/product-minimal-4.jpg\" alt=\"\" />\n                                                                    <div class=\"bottom-line left-attached\">\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-shopping-cart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-heart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-retweet\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-expand\"></i></a>\n                                                                    </div>\n                                                                </div>\n                                                                <a href=\"#\" class=\"title\">4.Pullover Batwing Sleeve Zigzag</a>\n                                                                <div class=\"price\">\n                                                                    <div class=\"prev\">$199,99</div>\n                                                                    <div class=\"current\">$119,99</div>\n                                                                </div>\n                                                            </div>\n                                                        </div>\n                                                        <div class=\"menu-slider-entry\">\n                                                            <div class=\"product-slide-entry\">\n                                                                <div class=\"product-image\">\n                                                                    <img src=\"{site_url}/assets/img/product-minimal-5.jpg\" alt=\"\" />\n                                                                    <div class=\"bottom-line left-attached\">\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-shopping-cart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-heart\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-retweet\"></i></a>\n                                                                        <a class=\"bottom-line-a square\"><i class=\"fa fa-expand\"></i></a>\n                                                                    </div>\n                                                                </div>\n                                                                <a href=\"#\" class=\"title\">5.Pullover Batwing Sleeve Zigzag</a>\n                                                                <div class=\"price\">\n                                                                    <div class=\"prev\">$199,99</div>\n                                                                    <div class=\"current\">$119,99</div>\n                                                                </div>\n                                                            </div>\n                                                        </div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"full-width-menu-items-left\">\n                                                <div class=\"row\">\n                                                    <div class=\"col-lg-6\">\n                                                        <div class=\"submenu-list-title\"><a href=\"index-wide.html\">Homepages <span class=\"menu-label blue\">new</span></a><span class=\"toggle-list-button\"></span></div>\n                                                        <ul class=\"list-type-1 toggle-list-container\">\n                                                            <li><a href=\"index-wide.html\"><i class=\"fa fa-angle-right\"></i>Mango - Wide Header</a></li>\n                                                            <li><a href=\"index-electronic.html\"><i class=\"fa fa-angle-right\"></i>Mango - Electronic</a></li>\n                                                            <li><a href=\"index-everything.html\"><i class=\"fa fa-angle-right\"></i>Mango - Everything</a></li>\n                                                            <li><a href=\"index-fullwidthheader.html\"><i class=\"fa fa-angle-right\"></i>Mango - Fullwidth Header</a></li>\n                                                            <li><a href=\"index-food.html\"><i class=\"fa fa-angle-right\"></i>Mango - Food</a></li>\n                                                            <li><a href=\"index-underwear.html\"><i class=\"fa fa-angle-right\"></i>Mango - Underwear</a></li>\n                                                            <li><a href=\"index-bags.html\"><i class=\"fa fa-angle-right\"></i>Mango - Bags</a></li>\n                                                            <li><a href=\"index-fullwidth-noslider.html\"><i class=\"fa fa-angle-right\"></i>Mango - Fullwidth No Slider</a></li>\n                                                            <li><a href=\"index-lookbook.html\"><i class=\"fa fa-angle-right\"></i>Mango - Lookbook</a></li>\n                                                            <li><a href=\"index-wine-left.html\"><i class=\"fa fa-angle-right\"></i>Mango - Wine</a></li>\n                                                            <li><a href=\"index-fullwidth.html\"><i class=\"fa fa-angle-right\"></i>Mango - Fullwidth</a></li>\n                                                            <li><a href=\"index-fullwidth-left.html\"><i class=\"fa fa-angle-right\"></i>Mango - Fullwidth Left Sidebar</a></li>\n                                                        </ul>\n                                                    </div>\n                                                    <div class=\"col-lg-6\">\n                                                        <div class=\"submenu-list-title\"><a href=\"index-wide.html\">Homepages <span class=\"menu-label blue\">new</span></a><span class=\"toggle-list-button\"></span></div>\n                                                        <ul class=\"list-type-1 toggle-list-container\">\n                                                            <li><a href=\"index-parallax.html\"><i class=\"fa fa-angle-right\"></i>Mango - Parallax</a></li>\n                                                            <li><a href=\"index-grid.html\"><i class=\"fa fa-angle-right\"></i>Mango - Grid Light</a></li>\n                                                            <li><a href=\"index-leftsidebar.html\"><i class=\"fa fa-angle-right\"></i>Mango - Grid Left Sidebar</a></li>\n                                                            <li><a href=\"index-minimal.html\"><i class=\"fa fa-angle-right\"></i>Mango - Minimal</a></li>\n                                                            <li><a href=\"index-toys.html\"><i class=\"fa fa-angle-right\"></i>Mango - Toys</a></li>\n                                                            <li><a href=\"index-furniture.html\"><i class=\"fa fa-angle-right\"></i>Mango - Furniture</a></li>\n                                                            <li><a href=\"index-jewellery.html\"><i class=\"fa fa-angle-right\"></i>Mango - Jewellery</a></li>\n                                                            <li><a href=\"index-mini.html\"><i class=\"fa fa-angle-right\"></i>Mango - Mini</a></li>\n                                                            <li><a href=\"index-presentation.html\"><i class=\"fa fa-angle-right\"></i>Mango - Presentation</a></li>\n                                                            <li><a href=\"index-parallax-fullwidth.html\"><i class=\"fa fa-angle-right\"></i>Mango - Parallax Fullwidth</a></li>\n                                                            <li><a href=\"index-parallax-boxed.html\"><i class=\"fa fa-angle-right\"></i>Mango - Parallax Boxed</a></li>\n                                                        </ul>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"submenu-links-line\">\n                                                <div class=\"submenu-links-line-container\">\n                                                    <div class=\"cell-view\">\n                                                        <div class=\"line-links\"><b>Quicklinks:</b>  <a href=\"#\">Blazers</a>, <a href=\"#\">Jackets</a>, <a href=\"#\">Shoes</a>, <a href=\"#\">Bags</a>, <a href=\"#\">Special offers</a>, <a href=\"#\">Sales and discounts</a></div>\n                                                    </div>\n                                                    <div class=\"cell-view\">\n                                                        <div class=\"red-message\"><b>-20% sale only this week. Don’t miss buy something!</b></div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </li>\n                                    <li class=\"full-width-columns\">\n                                        <a href=\"#\">Pages</a><i class=\"fa fa-chevron-down\"></i>\n                                        <div class=\"submenu\">\n                                            <div class=\"product-column-entry\">\n                                                <div class=\"image\"><img alt=\"\" src=\"{site_url}/assets/img/product-menu-2.jpg\"></div>\n                                                <div class=\"submenu-list-title\"><a href=\"contact.html\">Contact Us</a><span class=\"toggle-list-button\"></span></div>\n                                                <div class=\"description toggle-list-container\">\n                                                    <ul class=\"list-type-1\">\n                                                        <li><a href=\"contact.html\"><i class=\"fa fa-angle-right\"></i>Contact Us 1</a></li>\n                                                        <li><a href=\"contact-2.html\"><i class=\"fa fa-angle-right\"></i>Contact Us 2</a></li>\n                                                        <li><a href=\"contact-3.html\"><i class=\"fa fa-angle-right\"></i>Contact Us 3</a></li>\n                                                        <li><a href=\"contact-4.html\"><i class=\"fa fa-angle-right\"></i>Contact Us 4</a></li>\n                                                    </ul>\n                                                </div>\n                                                <div class=\"hot-mark\">hot</div>\n                                            </div>\n                                            <div class=\"product-column-entry\">\n                                                <div class=\"image\"><img alt=\"\" src=\"{site_url}/assets/img/product-menu-4.jpg\"></div>\n                                                <div class=\"submenu-list-title\"><a href=\"about-1.html\">About Us</a><span class=\"toggle-list-button\"></span></div>\n                                                <div class=\"description toggle-list-container\">\n                                                    <ul class=\"list-type-1\">\n                                                        <li><a href=\"about-1.html\"><i class=\"fa fa-angle-right\"></i>About Us Fullwidth 1</a></li>\n                                                        <li><a href=\"about-2.html\"><i class=\"fa fa-angle-right\"></i>About Us Fullwidth 2</a></li>\n                                                        <li><a href=\"about-3.html\"><i class=\"fa fa-angle-right\"></i>About Us Fullwidth 3</a></li>\n                                                        <li><a href=\"about-4.html\"><i class=\"fa fa-angle-right\"></i>About Us Sidebar 1</a></li>\n                                                        <li><a href=\"about-5.html\"><i class=\"fa fa-angle-right\"></i>About Us Sidebar 2</a></li>\n                                                    </ul>\n                                                </div>\n                                                <div class=\"hot-mark yellow\">sale</div>\n                                            </div>\n                                            <div class=\"product-column-entry\">\n                                                <div class=\"image\"><img alt=\"\" src=\"{site_url}/assets/img/product-menu-3.jpg\"></div>\n                                                <div class=\"submenu-list-title\"><a href=\"cart.html\">Cart</a><span class=\"toggle-list-button\"></span></div>\n                                                <div class=\"description toggle-list-container\">\n                                                    <ul class=\"list-type-1\">\n                                                        <li><a href=\"cart.html\"><i class=\"fa fa-angle-right\"></i>Cart</a></li>\n                                                        <li><a href=\"cart-traditional.html\"><i class=\"fa fa-angle-right\"></i>Cart Traditional</a></li>\n                                                        <li><a href=\"checkout.html\"><i class=\"fa fa-angle-right\"></i>Checkout</a></li>\n                                                    </ul>\n                                                </div>\n                                            </div>\n                                            <div class=\"product-column-entry\">\n                                                <div class=\"image\"><img alt=\"\" src=\"{site_url}/assets/img/product-menu-5.jpg\"></div>\n                                                <div class=\"submenu-list-title\"><a href=\"teaser-background.html\">Coming Soon</a><span class=\"toggle-list-button\"></span></div>\n                                                <div class=\"description toggle-list-container\">\n                                                    <ul class=\"list-type-1\">\n                                                        <li><a href=\"teaser-background.html\"><i class=\"fa fa-angle-right\"></i>Coming Soon 1</a></li>\n                                                        <li><a href=\"teaser-background-2.html\"><i class=\"fa fa-angle-right\"></i>Coming Soon 2</a></li>\n                                                        <li><a href=\"teaser-simple.html\"><i class=\"fa fa-angle-right\"></i>Coming Soon 3</a></li>\n                                                    </ul>\n                                                </div>\n                                                <div class=\"hot-mark\">hot</div>\n                                            </div>\n                                            <div class=\"product-column-entry\">\n                                                <div class=\"image\"><img alt=\"\" src=\"{site_url}/assets/img/product-menu-2.jpg\"></div>\n                                                <div class=\"submenu-list-title\"><a href=\"shop.html\">Products</a><span class=\"toggle-list-button\"></span></div>\n                                                <div class=\"description toggle-list-container\">\n                                                    <ul class=\"list-type-1\">\n                                                        <li><a href=\"shop.html\"><i class=\"fa fa-angle-right\"></i>Shop</a></li>\n                                                        <li><a href=\"product.html\"><i class=\"fa fa-angle-right\"></i>Product</a></li>\n                                                        <li><a href=\"product-nosidebar.html\"><i class=\"fa fa-angle-right\"></i>No Sidebar</a></li>\n                                                        <li><a href=\"product-tabnosidebar.html\"><i class=\"fa fa-angle-right\"></i>Tab No Sidebar</a></li>\n                                                    </ul>\n                                                </div>\n                                            </div>\n                                            <div class=\"submenu-links-line\">\n                                                <div class=\"submenu-links-line-container\">\n                                                    <div class=\"cell-view\">\n                                                        <div class=\"line-links\"><b>Quicklinks:</b>  <a href=\"shop.html\">Blazers</a>, <a href=\"shop.html\">Jackets</a>, <a href=\"shop.html\">Shoes</a>, <a href=\"shop.html\">Bags</a>, <a href=\"shop.html\">Special offers</a>, <a href=\"shop.html\">Sales and discounts</a></div>\n                                                    </div>\n                                                    <div class=\"cell-view\">\n                                                        <div class=\"red-message\"><b>-20% sale only this week. Don’t miss buy something!</b></div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </li>\n                                    <li class=\"simple-list\">\n                                        <a href=\"shop.html\">Products</a><i class=\"fa fa-chevron-down\"></i>\n                                        <div class=\"submenu\">\n                                            <ul class=\"simple-menu-list-column\">\n                                                <li><a href=\"shop.html\"><i class=\"fa fa-angle-right\"></i>Shop</a></li>\n                                                <li><a href=\"product.html\"><i class=\"fa fa-angle-right\"></i>Product</a></li>\n                                                <li><a href=\"product-nosidebar.html\"><i class=\"fa fa-angle-right\"></i>No Sidebar</a></li>\n                                                <li><a href=\"product-tabnosidebar.html\"><i class=\"fa fa-angle-right\"></i>Tab No Sidebar</a></li>\n                                            </ul>\n                                        </div>\n                                    </li>\n                                    <li class=\"column-1\">\n                                        <a href=\"portfolio-default.html\">Portfolio</a><i class=\"fa fa-chevron-down\"></i>\n                                        <div class=\"submenu\">\n                                            <div class=\"full-width-menu-items-left\">\n                                                <img class=\"submenu-background\" src=\"{site_url}/assets/img/product-menu-7.jpg\" alt=\"\" />\n                                                <div class=\"row\">\n                                                    <div class=\"col-md-12\">\n                                                        <div class=\"submenu-list-title\"><a href=\"portfolio-default.html\">Our Portfolio</a><span class=\"toggle-list-button\"></span></div>\n                                                        <ul class=\"list-type-1 toggle-list-container\">\n                                                            <li><a href=\"portfolio-default.html\"><i class=\"fa fa-angle-right\"></i>Portfolio Default</a></li>\n                                                            <li><a href=\"portfolio-simple.html\"><i class=\"fa fa-angle-right\"></i>Portfolio Simple</a></li>\n                                                            <li><a href=\"portfolio-custom.html\"><i class=\"fa fa-angle-right\"></i>Portfolio Custom</a></li>\n                                                            <li><a href=\"portfolio-customfullwidth.html\"><i class=\"fa fa-angle-right\"></i>Fullwidth Custom</a></li>\n                                                            <li><a href=\"portfolio-simplefullwidth.html\"><i class=\"fa fa-angle-right\"></i>Fullwidth Simple</a></li>\n                                                            <li><a href=\"project-default.html\"><i class=\"fa fa-angle-right\"></i>Project Default</a></li>\n                                                            <li><a href=\"project-fullwidth.html\"><i class=\"fa fa-angle-right\"></i>Project Fullwidth</a></li>\n                                                        </ul>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"submenu-links-line\">\n                                                <div class=\"submenu-links-line-container\">\n                                                    <div class=\"cell-view\">\n                                                        <div class=\"line-links\"><b>Quicklinks:</b>  <a href=\"shop.html\">Blazers</a>, <a href=\"shop.html\">Jackets</a>, <a href=\"shop.html\">Shoes</a>, <a href=\"shop.html\">Bags</a></div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </li>\n                                    <li class=\"column-1\">\n                                        <a href=\"blog.html\">Blog</a><i class=\"fa fa-chevron-down\"></i>\n                                        <div class=\"submenu\">\n                                            <div class=\"full-width-menu-items-left\">\n                                                <img class=\"submenu-background\" src=\"{site_url}/assets/img/product-menu-8.jpg\" alt=\"\" />\n                                                <div class=\"row\">\n                                                    <div class=\"col-md-12\">\n                                                        <div class=\"submenu-list-title\"><a href=\"blog.html\">Blog <span class=\"menu-label blue\">new</span></a><span class=\"toggle-list-button\"></span></div>\n                                                        <ul class=\"list-type-1 toggle-list-container\">\n                                                            <li><a href=\"blog.html\"><i class=\"fa fa-angle-right\"></i>Blog Default</a></li>\n                                                            <li><a href=\"blog-grid.html\"><i class=\"fa fa-angle-right\"></i>Blog Grid</a></li>\n                                                            <li><a href=\"blog-timeline.html\"><i class=\"fa fa-angle-right\"></i>Blog Timeline</a></li>\n                                                            <li><a href=\"blog-list.html\"><i class=\"fa fa-angle-right\"></i>Blog List</a></li>\n                                                            <li><a href=\"blog-biggrid.html\"><i class=\"fa fa-angle-right\"></i>Blog Big Grid</a></li>\n                                                            <li><a href=\"blog-detail.html\"><i class=\"fa fa-angle-right\"></i>Single Post</a></li>\n                                                        </ul>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                            <div class=\"submenu-links-line\">\n                                                <div class=\"submenu-links-line-container\">\n                                                    <div class=\"cell-view\">\n                                                        <div class=\"line-links\"><b>Quicklinks:</b>  <a href=\"shop.html\">Blazers</a>, <a href=\"shop.html\">Jackets</a>, <a href=\"shop.html\">Shoes</a>, <a href=\"shop.html\">Bags</a></div>\n                                                    </div>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </li>\n                                    <li class=\"simple-list\">\n                                        <a>More</a><i class=\"fa fa-chevron-down\"></i>\n                                        <div class=\"submenu\">\n                                            <ul class=\"simple-menu-list-column\">\n                                                <li><a href=\"login.html\"><i class=\"fa fa-angle-right\"></i>Login</a></li>\n                                                <li><a href=\"error.html\"><i class=\"fa fa-angle-right\"></i>Error</a></li>\n                                                <li><a href=\"faq.html\"><i class=\"fa fa-angle-right\"></i>Faq</a></li>\n                                                <li><a href=\"compare.html\"><i class=\"fa fa-angle-right\"></i>Compare</a></li>\n                                                <li><a href=\"wishlist.html\"><i class=\"fa fa-angle-right\"></i>Wishlist</a></li>\n                                                <li><a href=\"shortcodes.html\"><i class=\"fa fa-angle-right\"></i>Shortcodes</a></li>\n                                                <li><a href=\"elements-headers.html\"><i class=\"fa fa-angle-right\"></i>Elements - Headers</a></li>\n                                                <li><a href=\"elements-footers.html\"><i class=\"fa fa-angle-right\"></i>Elements - Footers</a></li>\n                                                <li><a href=\"elements-breadcrumbs.html\"><i class=\"fa fa-angle-right\"></i>Elements - Breadcrumbs</a></li>\n                                            </ul>\n                                        </div>\n                                    </li>\n                                </ul>\n\n                                <ul>\n                                    <li><a href=\"http://themeforest.net/item/mango-responsive-ecommerce-html5-template/12050763?ref=8theme\">Buy this theme</a></li>\n                                    <li class=\"fixed-header-visible\">\n                                        <a class=\"fixed-header-square-button open-cart-popup\"><i class=\"fa fa-shopping-cart\"></i></a>\n                                        <a class=\"fixed-header-square-button open-search-popup\"><i class=\"fa fa-search\"></i></a>\n                                    </li>\n                                </ul>\n                                <div class=\"clear\"></div>\n\n                                <a class=\"fixed-header-visible additional-header-logo\"><img src=\"{site_url}/assets/img/logo-9.png\" alt=\"\"/></a>\n                            </nav>\n                            <div class=\"navigation-footer responsive-menu-toggle-class\">\n                                <div class=\"socials-box\">\n                                    <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n                                    <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n                                    <a href=\"#\"><i class=\"fa fa-google-plus\"></i></a>\n                                    <a href=\"#\"><i class=\"fa fa-youtube\"></i></a>\n                                    <a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\n                                    <a href=\"#\"><i class=\"fa fa-instagram\"></i></a>\n                                    <a href=\"#\"><i class=\"fa fa-pinterest-p\"></i></a>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"navigation-copyright\">Created by <a href=\"#\">8theme</a>. All rights reserved</div>\n                            </div>\n                        </div>\n                    </div>\n                </header>\n                <div class=\"clear\"></div>\n            </div>'),
	(37,1,'sn:global_footer-inner','<!-- FOOTER -->\n                <div class=\"footer-wrapper style-10\">\n                    <footer class=\"type-1\">\n                        <div class=\"footer-columns-entry\">\n                            <div class=\"row\">\n                                <div class=\"col-md-3\">\n                                    <img class=\"footer-logo\" src=\"img/logo-9.png\" alt=\"\" />\n                                    <div class=\"footer-description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</div>\n                                    <div class=\"footer-address\">30 South Avenue San Francisco<br/>\n                                        Phone: +78 123 456 789<br/>\n                                        Email: <a href=\"mailto:Support@blanco.com\">Support@blanco.com</a><br/>\n                                        <a href=\"www.inmedio.com\"><b>www.inmedio.com</b></a>\n                                    </div>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"col-md-2 col-sm-4\">\n                                    <h3 class=\"column-title\">Our Services</h3>\n                                    <ul class=\"column\">\n                                        <li><a href=\"#\">About us</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                        <li><a href=\"#\">Custom Service</a></li>\n                                        <li><a href=\"#\">Terms &amp; Condition</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                    </ul>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"col-md-2 col-sm-4\">\n                                    <h3 class=\"column-title\">Our Services</h3>\n                                    <ul class=\"column\">\n                                        <li><a href=\"#\">About us</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                        <li><a href=\"#\">Custom Service</a></li>\n                                        <li><a href=\"#\">Terms &amp; Condition</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                    </ul>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"col-md-2 col-sm-4\">\n                                    <h3 class=\"column-title\">Our Services</h3>\n                                    <ul class=\"column\">\n                                        <li><a href=\"#\">About us</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                        <li><a href=\"#\">Custom Service</a></li>\n                                        <li><a href=\"#\">Terms &amp; Condition</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                    </ul>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"clearfix visible-sm-block\"></div>\n                                <div class=\"col-md-3\">\n                                    <h3 class=\"column-title\">Company working hours</h3>\n                                    <div class=\"footer-description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</div>\n                                    <div class=\"footer-description\">\n                                        <b>Monday-Friday:</b> 8.30 a.m. - 5.30 p.m.<br/>\n                                        <b>Saturday:</b> 9.00 a.m. - 2.00 p.m.<br/>\n                                        <b>Sunday:</b> Closed\n                                    </div>\n                                    <div class=\"clear\"></div>\n                                </div>\n                            </div>\n                        </div>\n                        <div class=\"footer-bottom-navigation\">\n                            <div class=\"cell-view\">\n                                <div class=\"footer-links\">\n                                    <a href=\"#\">Site Map</a>\n                                    <a href=\"#\">Search</a>\n                                    <a href=\"#\">Terms</a>\n                                    <a href=\"#\">Advanced Search</a>\n                                    <a href=\"#\">Orders and Returns</a>\n                                    <a href=\"#\">Contact Us</a>\n                                </div>\n                                <div class=\"copyright\">Created with by <a href=\"#\">8theme</a>. All right reserved</div>\n                            </div>\n                            <div class=\"cell-view\">\n                                <div class=\"payment-methods\">\n                                    <a href=\"#\"><img src=\"img/payment-method-1.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-2.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-3.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-4.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-5.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-6.png\" alt=\"\" /></a>\n                                </div>\n                            </div>\n                        </div>\n                    </footer>\n                </div>\n            </div>');

/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_specialty_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_specialty_templates`;

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`)
VALUES
	(1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
	(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
	(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
	(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n'),
	(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
	(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
	(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
	(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
	(9,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
	(10,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
	(11,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
	(12,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
	(13,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
	(14,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
	(15,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_stats`;

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`)
VALUES
	(1,1,1,16,'Blinds',16,0,0,0,1472493360,0,0,0,0,0,1473098465);

/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_groups`;

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`)
VALUES
	(1,1,'Statuses'),
	(3,1,'Members');

/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_no_access`;

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses`;

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`)
VALUES
	(1,1,1,'open',1,'009933'),
	(2,1,1,'closed',2,'990000'),
	(10,1,3,'Candidate',3,'000000'),
	(9,1,3,'closed',2,'990000'),
	(8,1,3,'open',1,'009933'),
	(11,1,3,'Company',4,'000000');

/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure`;

CREATE TABLE `exp_structure` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `listing_cid` int(6) unsigned NOT NULL DEFAULT '0',
  `lft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rgt` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dead` varchar(100) NOT NULL,
  `hidden` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure` WRITE;
/*!40000 ALTER TABLE `exp_structure` DISABLE KEYS */;

INSERT INTO `exp_structure` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `listing_cid`, `lft`, `rgt`, `dead`, `hidden`)
VALUES
	(0,0,0,0,0,1,18,'root','n'),
	(1,15,0,7,0,2,3,'','n'),
	(1,18,0,7,11,4,5,'','n'),
	(1,23,0,7,18,6,7,'','n'),
	(1,25,0,7,19,8,9,'','n'),
	(1,26,0,7,0,10,11,'','n'),
	(1,27,0,7,0,12,13,'','n'),
	(1,28,0,7,0,14,15,'','n'),
	(1,31,0,20,0,16,17,'','n');

/*!40000 ALTER TABLE `exp_structure` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_channels`;

CREATE TABLE `exp_structure_channels` (
  `site_id` smallint(5) unsigned NOT NULL,
  `channel_id` mediumint(8) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `type` enum('page','listing','asset','unmanaged') NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`site_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure_channels` WRITE;
/*!40000 ALTER TABLE `exp_structure_channels` DISABLE KEYS */;

INSERT INTO `exp_structure_channels` (`site_id`, `channel_id`, `template_id`, `type`, `split_assets`, `show_in_page_selector`)
VALUES
	(1,8,0,'asset','y','y'),
	(1,7,26,'page','n','y'),
	(1,9,0,'asset','y','y'),
	(1,10,0,'asset','y','y'),
	(1,11,24,'listing','n','y'),
	(1,18,130,'listing','n','y'),
	(1,13,0,'unmanaged','n','y'),
	(1,16,0,'unmanaged','n','y'),
	(1,14,0,'unmanaged','n','y'),
	(1,17,0,'unmanaged','n','y'),
	(1,12,0,'unmanaged','n','y'),
	(1,15,0,'unmanaged','n','y'),
	(1,19,26,'listing','n','y'),
	(1,20,134,'page','n','y');

/*!40000 ALTER TABLE `exp_structure_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_listings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_listings`;

CREATE TABLE `exp_structure_listings` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `template_id` int(6) unsigned NOT NULL DEFAULT '0',
  `uri` varchar(75) NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure_listings` WRITE;
/*!40000 ALTER TABLE `exp_structure_listings` DISABLE KEYS */;

INSERT INTO `exp_structure_listings` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `template_id`, `uri`)
VALUES
	(1,20,18,11,24,'blog-1'),
	(1,21,18,11,24,'blog-2'),
	(1,22,23,18,130,'some-product'),
	(1,24,25,19,26,'pricing-grid-1');

/*!40000 ALTER TABLE `exp_structure_listings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_members`;

CREATE TABLE `exp_structure_members` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `nav_state` text,
  PRIMARY KEY (`site_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_structure_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_settings`;

CREATE TABLE `exp_structure_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) NOT NULL,
  `var_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_structure_settings` WRITE;
/*!40000 ALTER TABLE `exp_structure_settings` DISABLE KEYS */;

INSERT INTO `exp_structure_settings` (`id`, `site_id`, `var`, `var_value`)
VALUES
	(1,0,'action_ajax_move','20'),
	(2,0,'module_id','10'),
	(3,1,'show_picker','y'),
	(4,1,'show_view_page','y'),
	(5,1,'show_global_add_page','y'),
	(6,1,'hide_hidden_templates','y'),
	(7,1,'redirect_on_login','n'),
	(8,1,'redirect_on_publish','n'),
	(9,1,'add_trailing_slash','y');

/*!40000 ALTER TABLE `exp_structure_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_tagger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tagger`;

CREATE TABLE `exp_tagger` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  `site_id` tinyint(3) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '1',
  `entry_date` int(10) unsigned DEFAULT '1',
  `edit_date` int(10) unsigned DEFAULT '1',
  `hits` int(10) unsigned DEFAULT '0',
  `total_entries` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`tag_id`),
  KEY `tag_name` (`tag_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_tagger_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tagger_groups`;

CREATE TABLE `exp_tagger_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_title` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_desc` varchar(255) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT '0',
  `site_id` tinyint(3) unsigned DEFAULT '1',
  `order` mediumint(8) unsigned DEFAULT '1',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_tagger_groups` WRITE;
/*!40000 ALTER TABLE `exp_tagger_groups` DISABLE KEYS */;

INSERT INTO `exp_tagger_groups` (`group_id`, `group_title`, `group_name`, `group_desc`, `parent_id`, `site_id`, `order`)
VALUES
	(1,'Languages','languages','',0,1,1),
	(2,'Skills','skills','',0,1,1);

/*!40000 ALTER TABLE `exp_tagger_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_tagger_groups_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tagger_groups_entries`;

CREATE TABLE `exp_tagger_groups_entries` (
  `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned DEFAULT '0',
  `group_id` int(10) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`rel_id`),
  KEY `group_id` (`group_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_tagger_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_tagger_links`;

CREATE TABLE `exp_tagger_links` (
  `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` tinyint(3) unsigned DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` smallint(5) unsigned DEFAULT '0',
  `field_id` mediumint(8) unsigned DEFAULT '0',
  `tag_id` int(10) unsigned DEFAULT '0',
  `author_id` int(10) unsigned DEFAULT '1',
  `type` smallint(5) unsigned DEFAULT '1',
  `tag_order` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`rel_id`),
  KEY `tag_id` (`tag_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_template_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups`;

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`)
VALUES
	(1,1,'zoo_visitor_example',0,'n'),
	(2,1,'embeds',2,'n'),
	(3,1,'main',3,'y'),
	(4,1,'candidates',4,'n'),
	(5,1,'companies',5,'n'),
	(6,1,'account',6,'n'),
	(7,1,'blog',7,'n'),
	(8,1,'store',0,'n'),
	(9,1,'cart_examples',1,'n'),
	(10,1,'cart_functions',8,'n'),
	(11,1,'shop',11,'n');

/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_member_groups`;

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_template_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_member_groups` DISABLE KEYS */;

INSERT INTO `exp_template_member_groups` (`group_id`, `template_group_id`)
VALUES
	(3,6),
	(8,1),
	(8,2),
	(8,3),
	(8,4),
	(8,5);

/*!40000 ALTER TABLE `exp_template_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_no_access`;

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_template_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_routes`;

CREATE TABLE `exp_template_routes` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `route` varchar(512) DEFAULT NULL,
  `route_parsed` varchar(512) DEFAULT NULL,
  `route_required` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates`;

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `protect_javascript` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`)
VALUES
	(1,1,1,'index','n','webpage','<h3>Welcome to Zoo Visitor</h3>\n\n{embed=\"zoo_visitor_example/menu\"}',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(2,1,1,'menu','n','webpage','<h2>Zoo Visitor Example</h2>\n<ul>\n	<li><a href=\"{path=zoo_visitor_example/login}\">Login</a></li>\n	<li><a href=\"{path=zoo_visitor_example/login_ajax}\">AJAX Login</a></li>\n	<li><a href=\"{path=zoo_visitor_example/change_password}\">Change password</a></li>\n	<li><a href=\"{path=zoo_visitor_example/change_login}\">Change login</a></li>\n	<li><a href=\"{path=zoo_visitor_example/profile}\">Edit Profile</a></li>\n	<li><a href=\"{path=zoo_visitor_example/register}\">Register</a></li>\n	<li><a href=\"{path=zoo_visitor_example/forgot_password}\">Forgot password</a></li>\n</ul>',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(3,1,1,'register','n','webpage','{embed=\"zoo_visitor_example/menu\"}\n{if last_segment == \"success\"}\nAccount created. You can <a href=\"{path=zoo_visitor_example/login}\">login</a> now. Depending on your member activation settings you will receive an email to confirm your registration.\n{if:elseif logged_in}\nYou are already registered and logged in. <a href=\"{path=logout}\">Logout</a> or go to your <a href=\"{path=zoo_visitor_example/profile}\">profile</a>.\n{if:else}\n{exp:zoo_visitor:registration_form return=\'zoo_visitor_example/register/success\'}\n\n<h3>Register</h3>\n<fieldset>\n	<h4>Extra fields</h4>\n\n	<p>\n		<label for=\"member_firstname\">{label:member_firstname}:</label>\n		<input type=\"text\" name=\"member_firstname\" id=\"member_firstname\" value=\"{if member_firstname}{member_firstname}{/if}\"/>\n	</p>\n\n	<p>\n		<label for=\"member_lastname\">{label:member_lastname}:</label>\n		<input type=\"text\" name=\"member_lastname\" id=\"member_lastname\" value=\"{if member_lastname}{member_lastname}{/if}\"/>\n	</p>\n\n	<p>\n		<label for=\"member_gender\">{label:member_gender}</label>\n		{options:member_gender}\n		<input type=\"radio\" id=\"member_gender\" name=\"member_gender\" value=\"{option_value}\" {checked} />{option_value}\n		{/options:member_gender}\n	</p>\n\n	<p>\n		<label for=\"member_address\">{label:member_birthday}</label>\n		<input type=\"text\" name=\"member_birthday\" id=\"member_birthday\" value=\"{member_birthday}\" maxlength=\"23\" size=\"25\"/>\n	</p>\n</fieldset>\n<br/>\n<fieldset>\n	<legend>Native member field</legend>\n	<p>Mative member fields like location, url, signature, etc... can be handled by creating a channel field with the same name prefixed with \"_member\"\n		For example member_signature will sync to the signature field. Custom member fields can be handled in the same way. Just create a channel field prefixed with \"member_\" and the value\n		will also be saved to the profile.</p>\n\n	<p>\n		<label for=\"member_signature\">Native member signature</label>\n		<input type=\"text\" name=\"member_signature\" id=\"member_signature\" value=\"{if member_signature}{member_signature}{/if}\"/>\n	</p>\n\n</fieldset>\n\n<fieldset>\n	<h4>Login details</h4>\n\n	<p>\n		<label for=\"username\">Email*:</label>\n		<input type=\"text\" name=\"email\" id=\"email\" value=\"{if email}{email}{/if}\"/>\n		<br/>(this will be your login/username if \'use email as username\' has been set)\n	</p>\n\n	<p>\n		<label for=\"password\">Password*:</label>\n		<input type=\"password\" name=\"password\" id=\"password\" value=\"{if password}{password}{/if}\"/>\n	</p>\n\n	<p>\n		<label for=\"password_confirm\">Confirm password*:</label>\n		<input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" value=\"{if password_confirm}{password_confirm}{/if}\"/>\n	</p>\n\n	<p>\n		<label for=\"terms_of_service\">Terms of service:</label>\n		<textarea name=\'terms\' rows=\'4\' readonly>All messages posted at this site express the views of the author, and do not necessarily reflect the views of the owners and administrators\n			of this site.By registering at this site you agree not to post any messages that are obscene, vulgar, slanderous, hateful, threatening, or that violate any laws. We will\n			permanently ban all users who do so.We reserve the right to remove, edit, or move any messages for any reason.</textarea>\n	</p>\n\n	<p>\n		<label for=\"accept_terms\">Accept terms of service?*</label>\n		<input type=\'checkbox\' name=\'accept_terms\' value=\'y\' {if accept_terms == \"y\"}checked=\"checked\"{/if} />\n	</p>\n\n	{if captcha}\n	<p>\n		<label for=\"captcha\">{lang:captcha}*</label>\n		{captcha}<br/>\n		<input type=\"text\" id=\"captcha\" name=\"captcha\" value=\"\" size=\"20\" maxlength=\"20\" style=\"width:140px;\"/>\n	</p>\n	{/if}\n</fieldset>\n<p>\n	<input type=\"submit\" value=\"Register\" class=\"form-submit\"/>\n</p>\n<p>* Required fields</p>\n\n{/exp:zoo_visitor:registration_form}\n{/if}',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(4,1,1,'profile','n','webpage','{embed=\"zoo_visitor_example/menu\"}\n<h2>Account - Profile</h2>\n{if logged_in AND segment_3 == \"success\"}\n<h3>Profile updated</h3>\n{if:elseif logged_in}\n<h3>Edit profile</h3>\n\n\n{exp:zoo_visitor:update_form return=\"zoo_visitor_example/profile/success\"}\n<fieldset>\n	<p>\n		<label for=\"member_firstname\">{label:member_firstname}</label>\n		<input type=\"text\" name=\"member_firstname\" id=\"member_firstname\" value=\"{if member_firstname}{member_firstname}{/if}\"/>\n	</p>\n\n	<p>\n		<label for=\"member_lastname\">{label:member_lastname}</label>\n		<input type=\"text\" name=\"member_lastname\" id=\"member_lastname\" value=\"{if member_lastname}{member_lastname}{/if}\"/>\n	</p>\n\n	<p>\n		<label for=\"member_birthday\">{label:member_birthday}</label>\n		<input type=\"text\" name=\"member_birthday\" id=\"member_birthday\" value=\"{member_birthday}\" maxlength=\"23\" size=\"25\"/>\n	</p>\n\n	<p>\n		<label for=\"member_gender\">{label:member_gender}</label>\n		{options:member_gender}\n		<input type=\"radio\" id=\"member_gender\" name=\"member_gender\" value=\"{option_value}\"{checked} />{option_value}\n		{/options:member_gender}\n	</p>\n\n</fieldset>\n<br/>\n<fieldset>\n	<legend>Native member field</legend>\n	<p>Native member fields like location, url, signature, etc... can be handled by creating a channel field with the same name prefixed with \"_member\"\n		For example member_signature will sync to the signature field. Custom member fields can be handled in the same way. Just create a channel field prefixed with \"member_\" and the value\n		will also be saved to the profile.</p>\n\n	<p>\n		<label for=\"member_signature\">Native member signature</label>\n		<input type=\"text\" name=\"member_signature\" id=\"member_signature\" value=\"{if member_signature}{member_signature}{/if}\"/>\n	</p>\n\n</fieldset>\n\n<p>\n	<input type=\"hidden\" name=\"title\" value=\"{username}\">\n	<input type=\"submit\" value=\"Submit\" class=\"button\"/>\n</p>\n\n{/exp:zoo_visitor:update_form}\n{if:else}\nYou are not logged in. <a href=\"{path=zoo_visitor_example/login}\">Login</a> now.\n{/if}',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(5,1,1,'login','n','webpage','{embed=\"zoo_visitor_example/menu\"}\n{if logged_in}\n	You are already registered and logged in. <a href=\"{path=logout}\">Logout</a> or go to your <a href=\"{path=zoo_visitor_example/profile}\">profile</a>.\n{if:else}\n	{exp:zoo_visitor:login_form return=\"zoo_visitor_example/profile\"}\n		<p>\n			<label for=\"email\">Email:</label>\n			<input type=\"text\" name=\"username\" id=\"username\" />\n		</p>\n		<p>\n			<label for=\"password\">Password:</label>\n			<input type=\"password\" name=\"password\" id=\"password\" />\n		</p>\n		\n		{if auto_login}\n		<p>\n			<label for=\"remember_me\">Remember me?</label>\n			<input class=\'checkbox\' type=\'checkbox\' name=\'auto_login\' value=\'1\'  />\n		</p>\n		{/if}\n		\n		<input type=\"submit\" name=\"submit\" value=\"Log in\" />\n	{/exp:zoo_visitor:login_form}\n{/if}',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(6,1,1,'login_ajax','n','webpage','<html>\n<head>\n	{exp:jquery:script_tag}\n\n	<!--using the jQuery Form plugin http://jquery.malsup.com/form/-->\n	<script src=\"http://malsup.github.com/jquery.form.js\" type=\"text/javascript\"></script>\n\n	<script type=\"text/javascript\">\n		$(document).ready(function(){\n			$(\'#loginForm\').ajaxForm({\n				dataType: \'json\',\n				success: function(data) {\n					if (data.success) {\n						alert(\'You are now logged in. You can add additional actions in the js script.\');\n					} else {\n						alert(\'Failed with the following errors: \'+data.errors.login);\n					}\n				}\n			});\n		});\n	</script>\n</head>\n<body>\n{embed=\"zoo_visitor_example/menu\"}\n\n<h2>Account - AJAX login</h2>\n\n{exp:zoo_visitor:login_form id=\"loginForm\" json=\"yes\"}\n{error:login}\nEmail: <input id=\"username\" name=\"username\" type=\"text\" />\nPassword: <input id=\"password\" name=\"password\" type=\"password\" />\n{if auto_login}\nRemember me? <input class=\"checkbox\" name=\"auto_login\" type=\"checkbox\" value=\"1\" />\n{/if}\n<input name=\"submit\" type=\"submit\" value=\"Log in\" />\n{/exp:zoo_visitor:login_form}\n</body>\n</html>',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(7,1,1,'change_password','n','webpage','{embed=\"zoo_visitor_example/menu\"}\n<h2>Account - Change password</h2>\n{if logged_in AND segment_3 == \"success\"}\n		<h3>Password updated</h3>\n{if:elseif logged_in}\n	{exp:zoo_visitor:update_form return=\"zoo_visitor_example/change_password/success\"}\n			<fieldset>\n				When changing your password, you will be asked to login again for security reasons.\n				<p>\n					<label for=\"current_password\" class=\"form-label\">Current password:</label>\n					<input type=\"text\" name=\"current_password\" id=\"current_password\" class=\"form-text\"  />\n				</p>\n				<p>\n                    <label for=\"new_password\" class=\"form-label\">New password</label>\n                    <input type=\"password\" name=\"new_password\" id=\"new_password\" class=\"form-text\"  />\n                </p>\n                <p>\n                    <label for=\"new_password_confirm\" class=\"form-label\">Confirm New password</label>\n					<input type=\"password\" name=\"new_password_confirm\" id=\"new_password_confirm\" class=\"form-text\"  />\n				</p>\n				\n			</fieldset>\n                <p>\n                    <input type=\"submit\" value=\"Submit\" class=\"button\" />\n                </p>\n            \n	{/exp:zoo_visitor:update_form}\n{if:else}\n	You are not logged in. <a href=\"{path=zoo_visitor_example/login}\">Login</a> now.\n{/if}',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(8,1,1,'change_login','n','webpage','{embed=\"zoo_visitor_example/menu\"}\n<h2>Account - Change login</h2>\n{if logged_in AND segment_3 == \"success\"}\n		<h3>Login updated</h3>\n{if:elseif logged_in}\n	{exp:zoo_visitor:update_form return=\"zoo_visitor_example/change_login/success\"}\n\n		<fieldset>				\n		<p>\n			<label for=\"EE_email\" class=\"form-label\">Your login email:</label>\n			<input type=\"text\" name=\"username\" id=\"username\" class=\"form-text\" value=\"{username}\" />\n		</p>\n		<p>\n			<label for=\"current_password\" class=\"form-label\">In order to change your password, please provide your current password:</label>\n			<input type=\"text\" name=\"current_password\" id=\"current_password\" class=\"form-text\"  />\n		</p>\n	\n		</fieldset>\n		<p>\n	         <input type=\"submit\" value=\"Submit\" class=\"button\" />\n		 </p>\n		 </fieldset>\n\n	{/exp:zoo_visitor:update_form}\n\n{if:else}\n    You are not logged in\n{/if}\n\n',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(9,1,1,'forgot_password','n','webpage','{embed=\"zoo_visitor_example/menu\"}\n<h2>Account - Forgot password</h2>\n{if logged_in}\n	You are already registered and logged in. <a href=\"{path=logout}\">Logout</a> or go to your <a href=\"{path=zoo_visitor_example/profile}\">profile</a>.\n{if:else}\n{exp:zoo_visitor:forgot_password error_handling=\"inline\" reset_url=\"/zoo_visitor_example/reset_password\" }\n	{if password_sent}\n		<h3>A password reset mail has been sent to the provided email.</h3>\n	{if:else}\n		<fieldset>\n			<p>\n				<label for=\"email\" class=\"form-label\">Your email:</label>\n				<input type=\"text\" name=\"email\" id=\"email\" class=\"form-text\" value=\"\" />\n			</p>\n			{error:email}\n		</fieldset>\n		<p>\n	        	<input type=\"submit\" value=\"Retrieve password\" class=\"button\" />\n		</p>\n	{/if}\n{/exp:zoo_visitor:forgot_password}\n\n{/if}\n\n',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(10,1,1,'reset_password','n','webpage','{embed=\"zoo_visitor_example/menu\"}\n<h2>Account - Reset password</h2>\n<p>Link to this page in the forgot password email</p>\n{if logged_in}\nYou are already registered and logged in. <a href=\"{path=logout}\">Logout</a> or go to your <a href=\"{path=zoo_visitor_example/profile}\">profile</a>.\n{if:else}\n{exp:zoo_visitor:reset_password error_handling=\"inline\"}\n{if password_reset}\n<h3>Your password has been reset. You can now login with your new password</h3>\n{if:else}\n<fieldset>\n	<p>\n	<label for=\"email\" class=\"form-label\">Password :</label>\n		<input type=\"password\" name=\"password\" id=\"password\" class=\"form-text\" value=\"\" />\n	</p>\n\n	<p>\n	<label for=\"email\" class=\"form-label\">Confirm Password  :</label>\n	<input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" class=\"form-text\" value=\"\" />\n	</p>\n\n	{error:password}\n</fieldset>\n<p>\n	<input type=\"submit\" value=\"Reset your password\" class=\"button\" />\n</p>\n{/if}\n{/exp:zoo_visitor:reset_password}\n\n{/if}\n\n',NULL,1424621192,0,'n',0,'','n','n','o',0,'n'),
	(11,1,2,'index','y','webpage','',NULL,1424733969,1,'n',0,'','n','n','o',0,'n'),
	(12,1,3,'index','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n			<h2>Main</h2>\n		</div>\n\n		{sn:global_footer}\n\n		{sn:global_html-footer}\n		\n	</body>\n</html>',NULL,1424733969,1,'n',0,'','n','n','o',0,'n'),
	(13,1,4,'registration','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n			{sn:members_registration}\n		</div>\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1424734668,1,'n',0,'','n','n','o',0,'n'),
	(14,1,4,'index','y','webpage','',NULL,1424734668,1,'n',0,'','n','n','o',0,'n'),
	(15,1,5,'index','y','webpage','',NULL,1424734668,1,'n',0,'','n','n','o',0,'n'),
	(16,1,6,'index','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n		{if logged_in}\n			{!-- Redirect to sign in/register --}\n			{redirect=\'account/profile\' status_code=\"301\"}\n		{/if}\n		{if logged_out}\n		  Are you a member? Please <a href=\"{path=\'account/login\'}\">log-in</a>.<br>\n		  Not a member? <a href=\"{path=\'account/register\'}\">Register</a>.<br>\n		  Have you <a href=\"{path=\'account/forgot\'}\">forgotten your password</a>?\n		{/if}\n		</div>\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1425420861,1,'n',0,'','n','n','o',0,'n'),
	(17,1,6,'register','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n		{if logged_in}\n			{!-- Redirect to sign in/register --}\n			{redirect=\'account/profile\' status_code=\"301\"}\n		{/if}\n		{if logged_out}\n			{sn:members_registration}\n		{/if}\n		</div>\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1425420969,1,'n',0,'','n','n','o',0,'n'),
	(18,1,6,'forgot','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n		{if logged_in}\n			{!-- Redirect to sign in/register --}\n			{redirect=\'account/profile\' status_code=\"301\"}\n		{/if}\n		{if logged_out}\n			{sn:members_password-forgot}\n		{/if}\n		</div>\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1425420978,1,'n',0,'','n','n','o',0,'n'),
	(19,1,6,'profile','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n			{sn:members_profile}\n		</div>\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1425422083,1,'n',0,'','n','n','o',0,'n'),
	(20,1,6,'password','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n		<h2>Account - Change password</h2>\n		{if logged_in AND segment_3 == \"success\"}\n		<h3>Password updated</h3>\n		{if:elseif logged_in}\n			{exp:zoo_visitor:update_form return=\"account/password/success\"}\n			<fieldset>\n				When changing your password, you will be asked to login again for security reasons.\n				<p>\n					<label for=\"current_password\" class=\"form-label\">Current password:</label>\n					<input type=\"text\" name=\"current_password\" id=\"current_password\" class=\"form-text\"  />\n				</p>\n				<p>\n					<label for=\"new_password\" class=\"form-label\">New password</label>\n					<input type=\"password\" name=\"new_password\" id=\"new_password\" class=\"form-text\"  />\n				</p>\n				<p>\n					<label for=\"new_password_confirm\" class=\"form-label\">Confirm New password</label>\n					<input type=\"password\" name=\"new_password_confirm\" id=\"new_password_confirm\" class=\"form-text\"  />\n				</p>\n\n			</fieldset>\n			<p>\n				<input type=\"submit\" value=\"Submit\" class=\"button\" />\n			</p>\n\n			{/exp:zoo_visitor:update_form}\n		{if:else}\n			{redirect=\'account\' status_code=\"301\"}\n		{/if}\n		</div>\n\n\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1425427397,1,'n',0,'','n','n','o',0,'n'),
	(21,1,6,'email','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n		{if logged_in AND segment_3 == \"success\"}\n			<h3>Login updated</h3>\n		{if:elseif logged_in}\n			{exp:zoo_visitor:update_form return=\"account/email/success\"}\n			<fieldset>\n				<p>\n					<label for=\"EE_email\" class=\"form-label\">Your login email:</label>\n					<input type=\"text\" name=\"username\" id=\"username\" class=\"form-text\" value=\"{username}\" />\n				</p>\n				<p>\n					<label for=\"current_password\" class=\"form-label\">In order to change your password, please provide your current password:</label>\n					<input type=\"text\" name=\"current_password\" id=\"current_password\" class=\"form-text\"  />\n				</p>\n			</fieldset>\n			<p>\n				<input type=\"submit\" value=\"Submit\" class=\"button\" />\n			</p>\n\n			{/exp:zoo_visitor:update_form}\n		{if:else}\n			{redirect=\'account\' status_code=\"301\"}\n		{/if}	\n		</div>\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1425427458,1,'n',0,'','n','n','o',0,'n'),
	(22,1,6,'reset','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n	{sn:global_html-header}\n\n	<body>\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{sn:global_header}\n\n		<div class=\"wrapper clearfix\">\n		{if logged_in}\n			{!-- Redirect to sign in/register --}\n			{redirect=\'account/profile\' status_code=\"301\"}\n		{/if}\n		{if logged_out}\n			{sn:members_password-reset}\n		{/if}\n		</div>\n\n		{sn:global_footer}\n\n	</body>\n</html>',NULL,1425596530,1,'n',0,'','n','n','o',0,'n'),
	(23,1,7,'index','y','webpage','<!DOCTYPE html>\n<html>\nsn:global_html-header}\n<body class=\"style-10\">\n\n    <!-- LOADER -->\n    <div id=\"loader-wrapper\">\n        <div class=\"bubbles\">\n            <div class=\"title\">loading</div>\n            <span></span>\n            <span id=\"bubble2\"></span>\n            <span id=\"bubble3\"></span>\n        </div>\n    </div>\n\n    <div id=\"content-block\">\n\n        <div class=\"content-center fixed-header-margin\">\n            <!-- HEADER -->\n            {sn:global_header}\n\n            <div class=\"content-push\">\n\n                <div class=\"breadcrumb-box\">\n                    <a href=\"#\">Home</a>\n                    <a href=\"#\">Blog Grid</a>\n                </div>\n\n                <div class=\"information-blocks\">\n                    <div class=\"row\">\n                        \n                        <div class=\"col-md-12 information-entry\">\n                            <div class=\"blog-landing-box type-4 columns-3\">\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-4.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-5.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-6.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-7.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-8.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-9.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-10.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-11.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                                <div class=\"blog-entry\">\n                                    <a class=\"image hover-class-1\" href=\"#\"><img src=\"img/blog-thumbnail-12.jpg\" alt=\"\" /><span class=\"hover-label\">Read More</span></a>\n                                    <div class=\"date\">25 <span>dec</span></div>\n                                    <div class=\"content\">\n                                        <a class=\"title\" href=\"#\">Fresh review of coming trends for Summer \'15</a>\n                                        <div class=\"subtitle\"><a href=\"#\"><b>Admin</b></a>  /  Category: <a href=\"#\">Fashion</a>, <a href=\"#\">Dresses</a></div>\n                                        <div class=\"description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet.</div>\n                                        <a class=\"readmore\" href=\"#\">read more</a>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"page-selector\">\n                                <div class=\"description\">Showing: 1-3 of 16</div>\n                                <div class=\"pages-box\">\n                                    <a class=\"square-button active\" href=\"#\">1</a>\n                                    <a class=\"square-button\" href=\"#\">2</a>\n                                    <a class=\"square-button\" href=\"#\">3</a>\n                                    <div class=\"divider\">...</div>\n                                    <a class=\"square-button\" href=\"#\"><i class=\"fa fa-angle-right\"></i></a>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n                        </div>\n\n                    </div>\n                </div>\n\n                \n                <div class=\"information-blocks\">\n                    <div class=\"row\">\n                        <div class=\"col-sm-4 information-entry\">\n                            <h3 class=\"block-title inline-product-column-title\">Featured products</h3>\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-2.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-3.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n                        </div>\n                        <div class=\"col-sm-4 information-entry\">\n                            <h3 class=\"block-title inline-product-column-title\">Featured products</h3>\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-2.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-3.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n                        </div>\n                        <div class=\"col-sm-4 information-entry\">\n                            <h3 class=\"block-title inline-product-column-title\">Featured products</h3>\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-2.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-3.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                \n                <!-- FOOTER -->\n                {sn:global_footer}\n\n        </div>\n        <div class=\"clear\"></div>\n\n    </div>\n\n    <div class=\"search-box popup\">\n        <form>\n            <div class=\"search-button\">\n                <i class=\"fa fa-search\"></i>\n                <input type=\"submit\" />\n            </div>\n            <div class=\"search-drop-down\">\n                <div class=\"title\"><span>All categories</span><i class=\"fa fa-angle-down\"></i></div>\n                <div class=\"list\">\n                    <div class=\"overflow\">\n                        <div class=\"category-entry\">Category 1</div>\n                        <div class=\"category-entry\">Category 2</div>\n                        <div class=\"category-entry\">Category 2</div>\n                        <div class=\"category-entry\">Category 4</div>\n                        <div class=\"category-entry\">Category 5</div>\n                        <div class=\"category-entry\">Lorem</div>\n                        <div class=\"category-entry\">Ipsum</div>\n                        <div class=\"category-entry\">Dollor</div>\n                        <div class=\"category-entry\">Sit Amet</div>\n                    </div>\n                </div>\n            </div>\n            <div class=\"search-field\">\n                <input type=\"text\" value=\"\" placeholder=\"Search for product\" />\n            </div>\n        </form>\n    </div>\n\n    <div class=\"cart-box popup\">\n        <div class=\"popup-container\">\n            <div class=\"cart-entry\">\n                <a class=\"image\"><img src=\"img/product-menu-1.jpg\" alt=\"\" /></a>\n                <div class=\"content\">\n                    <a class=\"title\" href=\"#\">Pullover Batwing Sleeve Zigzag</a>\n                    <div class=\"quantity\">Quantity: 4</div>\n                    <div class=\"price\">$990,00</div>\n                </div>\n                <div class=\"button-x\"><i class=\"fa fa-close\"></i></div>\n            </div>\n            <div class=\"cart-entry\">\n                <a class=\"image\"><img src=\"img/product-menu-1_.jpg\" alt=\"\" /></a>\n                <div class=\"content\">\n                    <a class=\"title\" href=\"#\">Pullover Batwing Sleeve Zigzag</a>\n                    <div class=\"quantity\">Quantity: 4</div>\n                    <div class=\"price\">$990,00</div>\n                </div>\n                <div class=\"button-x\"><i class=\"fa fa-close\"></i></div>\n            </div>\n            <div class=\"summary\">\n                <div class=\"subtotal\">Subtotal: $990,00</div>\n                <div class=\"grandtotal\">Grand Total <span>$1029,79</span></div>\n            </div>\n            <div class=\"cart-buttons\">\n                <div class=\"column\">\n                    <a class=\"button style-3\">view cart</a>\n                    <div class=\"clear\"></div>\n                </div>\n                <div class=\"column\">\n                    <a class=\"button style-4\">checkout</a>\n                    <div class=\"clear\"></div>\n                </div>\n                <div class=\"clear\"></div>\n            </div>\n        </div>\n    </div>\n\n    {sn:global_html-footer}\n</body>\n</html>\n',NULL,1470339252,16,'n',0,'','n','n','o',0,'n'),
	(24,1,7,'view','y','webpage','',NULL,1470339252,16,'n',0,'','n','n','o',0,'n'),
	(25,1,3,'contact-us','y','webpage','',NULL,1470339252,16,'n',0,'','n','n','o',0,'n'),
	(26,1,3,'standard','y','webpage','<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n\n	{!-- GLOBAL HTML-HEADER SNIPPET --}\n\n	{sn:global_html-header}\n\n\n	<body>\n\n		<!--[if lt IE 7]>\n			<p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n		<![endif]-->\n\n		{!-- GLOBAL HEADER SNIPPET --}\n\n		{sn:global_header}\n\n\n		{!-- GLOBAL BREADCRUMB SNIPPET --}\n\n		{sn:global_breadcrumb}\n\n\n		<div id=\"content\" class=\"remove_border\">\n\n			<section id=\"standard\" class=\"padded\">\n\n				{exp:channel:entries channel=\"standard_text\" limit=\"1\" disable=\"categories|category_fields|member_data\"}\n\n					<h1>\n						{if alternative_title}\n							{alternative_title}\n						{if:else}\n							{title}\n						{/if}\n					</h1>\n\n					<div id=\"main\">\n\n						{standard_content}\n\n						{if standard_video}\n							{standard_video}\n						{/if}\n\n					</div>\n\n				{/exp:channel:entries}\n\n				{!-- GLOBAL SIDEBAR SNIPPET --}\n\n				{sn:global_sidebar}\n\n			</section>\n\n		</div>\n\n		{!-- GLOBAL FOOTER SNIPPET --}\n\n		{sn:global_footer}\n\n	</body>\n\n</html>',NULL,1470339252,16,'n',0,'','n','n','o',0,'n'),
	(27,1,8,'about','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n\n\n{embed=\"{template_group}/_header\" title=\"About Us\" template_group=\"{template_group}\" template=\"{template}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n					{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\"}\n				</div>\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"about-us\">\n					<div class=\"row\">\n						<div class=\"span6\">\n							<h1>About Us</h1>\n								{exp:cartthrob:view_setting store_about_us=\"yes\"}\n							\n						</div>\n						<div class=\"span3\">\n							\n							<div class=\"thumbnail\">\n							<img src=\"{theme_folder_url}third_party/cartthrob/store_themes/basic_white/images/main_pic.jpg\" />\n								<div class=\"caption\">\n									<small>A sweet caption for that sweet placeholder pic.</small>\n							    </div>\n							</div>\n\n						</div>\n					</div>\n				</section>\n				</div>\n		</div>\n	</div>\n\n	 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(28,1,8,'account','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n\n\n{embed=\"{template_group}/_header\" title=\"Account / Purchased Items\" template_group=\"{template_group}\" template=\"{template}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n					{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\"}\n				</div>\n			\n			\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"account\">\n					{exp:channel:entries channel=\"purchased_items\" limit=\"30\" dynamic=\"off\" author_id=\"CURRENT_USER\" status=\"open|Complete\" }\n						\n						{exp:cartthrob:order_items order_id=\"{purchased_order_id}\" entry_id=\"{purchased_id}\" }\n							<div class=\"product\">\n								<h3>{item:title}</h3>\n								{if item:product_thumbnail}\n								<a href=\"{path=\'{template_group}/product_detail/{item:entry_id}\'}\">\n									<img src=\"{item:product_thumbnail}\" />\n								</a>\n								{/if}\n								<p>\n									Purchase Price: {item:price} (w/ tax: {item:price_plus_tax})\n								<br /><a href=\"{path={template_group}/product_detail/{item:entry_id}}\">Review &raquo;</a>\n								<br /><a href=\"{path={template_group}/invoice}/{exp:cartthrob:view_encrypted_string string=\'{purchased_order_id}\'}\">View invoice &raquo; </a></p>\n								{if item:product_download_url}\n									{exp:cartthrob:download_file_form field=\"product_download_url\" entry_id=\"{item:entry_id}\" }\n										<input type=\"submit\" value=\"Download Now!\" /> \n									{/exp:cartthrob:download_file_form}\n								{/if}\n								\n								{if purchased_license_number}\n									<p>License number: {purchased_license_number}</p>\n								{/if}\n							</div>\n						{/exp:cartthrob:order_items}\n						{if no_results}\n					        You haven\'t made any purchases yet. \n					    {/if}\n					{/exp:channel:entries}\n				</section>\n				</div>\n		</div>\n	</div>\n\n	 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(29,1,8,'ajax_cart_form','y','webpage','{!-- some of the sample JS posts the selected gateway file\'s name to this page when the customer\nupdates the selected gateway\nthe selected gateway fields tag is smart enough to output the selected gateway fields based \non the posted value \n--}\n{exp:cartthrob:selected_gateway_fields}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(30,1,8,'cart.js','y','js','/////////////////  CARTTHROB JS //////////////////////////	\n// holding text used when updating totals\nvar updating = \'<div class=\"progress progress-striped active\"><div class=\"bar\" style=\"width: 100%;\"></div></div>\';\n\n// if set to true, hidden forms will be shown, and all json data will be printed to your javascript console log (if available)\nvar ct_debug = false;\n// list of all CT fields that might change\nvar ct_billing_fields = new   Array(\'first_name\',\'last_name\',\'address\',\'address2\',\'city\',\'state\',\'zip\',\'country_code\',\'company\',\'phone\',\'email_address\',\'use_billing_info\',\'card_type\',\'expiration_month\',\'expiration_year\',\'begin_month\',\'begin_year\',\'currency_code\',\'language\',\'region\', \'gateway\');\n\nvar ct_shipping_fields = new   Array(\'shipping_first_name\',\'shipping_last_name\',\'shipping_address\',\'shipping_address2\',\'shipping_city\',\'shipping_state\',\'shipping_zip\',\'shipping_country_code\',\'shipping_company\',\'shipping_option\');\n\n// setting all customer information into a variables. \n{exp:cartthrob:customer_info}\n	var first_name = \'{customer_first_name}\'; \n	var last_name = \'{customer_last_name}\'; \n	var address = \'{customer_address}\'; \n	var address2 = \'{customer_address2}\'; \n	var city = \'{customer_city}\'; \n	var state = \'{customer_state}\'; \n	var zip = \'{customer_zip}\'; \n	var country_code = \'{customer_country_code}\'; \n	var company = \'{customer_company}\'; \n	var phone = \'{customer_phone}\'; \n	var email_address = \'{customer_email_address}\'; \n	var use_billing_info = \'{customer_use_billing_info}\'; \n	var shipping_first_name = \'{customer_shipping_first_name}\'; \n	var shipping_last_name = \'{customer_shipping_last_name}\'; \n	var shipping_address = \'{customer_shipping_address}\'; \n	var shipping_address2 = \'{customer_shipping_address2}\'; \n	var shipping_city = \'{customer_shipping_city}\'; \n	var shipping_state = \'{customer_shipping_state}\'; \n	var shipping_zip = \'{customer_shipping_zip}\'; \n	var shipping_country_code = \'{customer_shipping_country_code}\'; \n	var shipping_company = \'{customer_shipping_company}\'; \n	var card_type = \'{customer_card_type}\'; \n	var expiration_month = \'{customer_expiration_month}\'; \n	var expiration_year = \'{customer_expiration_year}\'; \n	var begin_month = \'{customer_begin_month}\'; \n	var begin_year = \'{customer_begin_year}\'; \n	var currency_code = \'{customer_currency_code}\'; \n	var language = \'{customer_language}\'; \n	var shipping_option = \'{customer_shipping_option}\'; \n	var region = \'{customer_region}\';\n	var gateway_name =\"\"; \n{/exp:cartthrob:customer_info}\n\n// cartthrob form options\n{!-- <!-- see this article for more about using AJAX with CartThrob  https://vimeo.com/37499431	-->  --} \nvar cart_form_options = { \n	success: update_cart,  // post-submit callback\n	dataType: \'json\' \n};\n\n// cartthrob updating function\nfunction update_cart(data, statusText, xhr, $form)  {   \n    if (data.success) {                                                   \n\n		// update the CSRF_TOKEN hash so we don\'t run afoul of EE\'s secure forms\n		//jQuery(\"input[name=csrf_token]\").val(data.CSRF_TOKEN);\n		// using the json data object\'s data to update various totals\n		jQuery(\'.cart_tax\')			.html( data.cart_tax );\n		jQuery(\'.cart_total\')		.html( data.cart_total );\n		jQuery(\'.cart_shipping\')		.html( data.cart_shipping );\n		jQuery(\'.cart_subtotal\')		.html( data.cart_subtotal );\n		jQuery(\'.cart_discount\')		.html( data.cart_discount );\n\n		// if debugging is turned on, all data will be output to the js console log\n		if (ct_debug)\n		{\n			jQuery.each(data, function(index, item){\n			  console.log(index + \": \" +item);\n			});  \n			jQuery.each(data.errors, function(index, item){\n			  console.log(index + \": \" +item);\n			});\n		}\n    }  \n	return true; \n}\n\njQuery(document).ready(function($){\n\n	// add \'use billing info\' to checkout fields. \n	// using JS to do this so that it\'s easier to track whether this is set or not and output the appropriately clicked\n	// set of radio buttons\n	// do not use a CHECKBOX to set this, as there will then be no method to UNCHECK this selection\n	// when a checkbox is sent via a form, an unchecked state is the same as sending nothing, so CT won\'t see that it\'s unchecked, \n	// and will therefore never notice that the value should be unset\n	function add_billing_info()\n	{\n		// add use_billing_info box if it doesn\'t exist. hide and show shipping fields\n		if ($(\"fieldset.billing\").length > 0 && $(\"fieldset.shipping\").length > 0 && $(\"fieldset.billing > label.use_billing_info\").length == 0)\n		{\n			ht = \'<div class=\"control-group\">\'; \n			ht += \'<label class=\"use_billing_info radio\">Copy billing info to shipping\'; \n			ht += \'<div class=\"controls\">\';\n			if (use_billing_info == \"1\" || use_billing_info ==\"yes\")\n			{\n				ht += \'<label class=\"radio\">Yes <input type=\"radio\" name=\"use_billing_info\" value=\"yes\" checked=\"checked\"/></label> \';\n				ht += \'<label class=\"radio\">No <input type=\"radio\" name=\"use_billing_info\" value=\"no\"  /></label>\' ; \n				$(\"fieldset.shipping\").hide(); \n			}\n			else\n			{\n				ht += \'<label class=\"radio\">Yes <input type=\"radio\" name=\"use_billing_info\" value=\"yes\" /></label> \';\n				ht += \'<label class=\"radio\">No <input type=\"radio\" name=\"use_billing_info\" value=\"no\" checked=\"checked\" /></label> \' ; \n				$(\"fieldset.shipping\").show(); \n			}\n			ht+=\'</label></div></div>\';\n			$(\'fieldset.billing\').append( ht );\n		}\n	}\n	add_billing_info(); \n	\n	// showing a login form when the login button is clicked. \n	$(\"#login_bttn\").click(function(){\n		$(\"#login_form\").show();\n		return false;\n	});\n	\n	// if you allow someone to select a gateway, it\'s very possible that the gateway fields will need to \n	// change to support the other gateway. THis function loads in gateway fields dynamically\n	$(\"#gateway\").live(\'change\', function(){\n 		$.post(\"{path=store/ajax_cart_form/}\", { gateway: $(this).val(), csrf_token : $(this).closest(\"form\").find(\"input[name=csrf_token]\").val()  },\n			function(data) {\n				// $(this).closest(\"form\").find(\"input[name=csrf_token]\").val(data.CSRF_TOKEN); \n				$( \"#checkout_form_gateway_fields\" ).empty().append( $(data) );\n	   }).complete(function() { add_billing_info();  });\n	}); \n	\n	\n	// when any field is updated, check to see if it\'s a CT form field and dynamically update \n	$(\"input[type=text], input[type=radio], select\").live(\'change\', function(){\n		\n		var input_name = $(this).attr(\"name\");    \n		var input_val = $(this).val(); \n		\n		if ( $.inArray(input_name, ct_billing_fields) != -1 || $.inArray( input_name , ct_shipping_fields)!= -1  )\n		{\n 			if (input_name ==\"use_billing_info\")\n			{\n				input_val = $(\'input[name=\'+input_name+\']:checked\').val(); \n				if (input_val== \"yes\" || input_val == \"1\")\n				{\n					$(ct_shipping_fields).each(function(index, data) {  \n						var new_value = null;\n						new_value = $(\"input[name=\"+ data.replace(\"shipping_\", \"\") +\"]\").val(); \n						$(\"input[name=\"+ data +\"]\").val( new_value ); \n					});\n					use_billing_info = 1; \n					$(\"fieldset.shipping\").hide(); \n				}\n				else\n				{\n					use_billing_info = 0; \n					$(\"fieldset.shipping\").show();\n					$(ct_shipping_fields).each(function(index, data) {  \n						var new_value = null;\n						new_value = (new Function(\"return \" + data ))();\n						$(\"input[name=\"+ data +\"]\").val( new_value ); \n					});\n				}\n			}  \n\n			form_name = \"#hidden_save_customer_info_form\";\n			var form = $(form_name); \n			var closest_form = $(this).closest(\"form\"); \n\n			// generate a new input \n			new_input = \"<input type=\'text\' name=\'\"+ input_name +\"\' value=\'\"+ input_val +\"\' />\" \n\n			if ($(\"input[name=create_user]\").val() != \"yes\")\n			{\n				// add this field to the form without classes, ids, etc. don\'t need em.\n				$(form_name + \' > .cart_data\').empty().append(new_input); \n			}\n			else\n			{\n				// we do not want to ajax update any create_user related fields\n				var ct_create_user_fields = new   Array(\'email_address\',\'username\',\'password\',\'password_confirm\',\'screen_name\');\n				if ( $.inArray(input_name, ct_create_user_fields) == -1)\n				{\n					$(form_name + \' > .cart_data\').empty().append(new_input); \n				}\n				\n			}\n			 \n			$(form).ajaxForm(cart_form_options);\n			$(form).submit(); \n			\n			/*\n			// alternate method... ajax submit any form but checkout.\n			// this is too dangerous, but this is a good example of how easy it is to ajax submit forms\n			\n			var closest_form = $(this).closest(\"form\"); \n			\n			if ($(closest_form).attr(\"id\") != \"checkout_form\")\n			{\n				$(form).ajaxForm(cart_form_options);\n                $(form).submit(); \n			}\n			*/ \n		}\n		\n	});    \n	\n	if (ct_debug)\n	{\n 		 $(\"#hidden_save_customer_info_form_wrapper\").css(\"display\", \"inline\"); \n	}\n 	// disable the checkout button on click\n	$(\'#checkout_form\').submit(function(){\n   		 $(\'input[type=submit]\', this).attr(\'disabled\', \'disabled\').addClass(\'disabled\').val(\"Submitting...\");\n	});\n	// reenable the checkout button once the customer has gone offsite\n	// otherwise on a back click, the button\'s unclickable\n 	$(window).unload(function() {\n   		 $(\'#complete_checkout\').removeAttr(\'disabled\').removeClass(\'disabled\').val(\"Complete Checkout\");\n	});\n	/////////////////  END CARTTHROB JS //////////////////////////\n	\n	// Twitter Bootstrap\n	    // side bar\n    var $window = $(window)\n\n    $(\'.bs-docs-sidenav\').affix({\n      offset: {\n        top: function () { return $window.width() <= 980 ? 290 : 120 }\n      , bottom: 230\n      }\n    });\n}); \n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(31,1,8,'checkout','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n \n{embed=\"{template_group}/_header\" title=\"Checkout\" template_group=\"{template_group}\" template=\"{template}\" }\n\n</head>\n<body>\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			\n			{!-- we\'re going to load the \"also purchased\" info for the last item added to the cart--}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\"}\n			{/exp:cartthrob:cart_items_info}\n			\n				</div>\n\n 			</div>\n\n			<div class=\"span9\">\n					<section id=\"checkout-section\">\n					{if \"{exp:cartthrob:total_items_count}\" > 0}\n	 					<h1>Checkout</h1>\n\n	  					<p>{exp:cartthrob:view_setting store_shipping_estimate=\"yes\"}</p>\n						\n						{!-- see  http://cartthrob.com/docs/tags/global_form_settings/index.html#inline-errors --}\n						\n						{exp:cartthrob:checkout_form \n								error_handling=\"inline\" \n								class=\"form-horizontal\"\n								required=\"first_name\";\n								create_user=\"yes\" group_id=\"5\"\n								return=\"{template_group}/order_info\"}\n\n								<div class=\"alert alert-info\">\n									<span class=\"help-block\">*All fields are required</span>\n								</div>\n \n								{!-- the next part handles inline errors. the error_handling=inline parameter is set\n									so standard error messages will not be shown\n									 --}\n								{if errors_exist}\n								<div class=\"control-group\">\n									{!-- not a fan of inline JS, but the if_errors conditional works only inside the checkout form \n										so if you want to use JS, you\'ll need to use inline JS.\n										--}\n									<script type=\"text/javascript\">\n										jQuery(document).ready(function($){\n								 			{errors}\n												{if field_error}\n													$(\"#{field}\").closest(\".control-group\").addClass(\"error\");\n													$(\"#{field}\").after(\'<span class=\"help-inline\">{error}</span>\');\n												{/if} \n											{/errors}\n										});\n									</script>\n									{errors}\n										{if first_error}\n										<div class=\"alert alert-error\">\n										<strong>Alert</strong> There are <span class=\"badge badge-warning\">{error:total_results}</span> error(s). Please correct the errors listed below\n										</div>\n										{/if}\n											\n											<p>\n												{if field_error}<span class=\"label label-important\">{field}</span>{/if} \n												{if global_error}<span class=\"label label-important\">Error</span>{/if} \n												{error}\n											</p>\n 									{/errors}\n									\n								</div>\n								{/if}\n							{if {exp:cartthrob:view_setting allow_gateway_selection=\"yes\"}}\n							\n							{!-- note: stripe payment gateway does not work well with this gateway switching method\n								stripe adds its own JS after the form close, and even when changing the gateway, this JS \n								is not removed, which can lead to erroneous error messages. \n								--}\n								<div class=\"control-group\">\n							 		<label for=\"gateway\" class=\"control-label\">Select a payment method</label>\n								    <div class=\"controls\">\n										{exp:cartthrob:customer_info}{exp:cartthrob:gateway_select id=\"gateway\" selected=\"{gateway}\"}{/exp:cartthrob:customer_info} \n									</div>\n			 					</div>\n							{/if}\n\n							<div id=\"checkout_form_gateway_fields\">\n								{gateway_fields}\n							</div>\n\n							{if logged_out}\n								<fieldset>\n									<legend>Member Registration</legend>\n									{exp:cartthrob:customer_info}\n									<div class=\"control-group\">\n										<label for=\"gateway\" class=\"control-label\">Username</label>\n										<div class=\"controls\">\n											<input type=\"text\" value=\"{username}\" name=\"username\" /> \n 										</div>\n									</div>\n									\n									<div class=\"control-group\">\n										<label for=\"gateway\" class=\"control-label\">Password</label>\n										<div class=\"controls\">\n											<input type=\"password\" value=\"\" name=\"password\" /> \n 										</div>\n									</div>\n 									{/exp:cartthrob:customer_info}\n								</fieldset>\n							{/if}\n							<div class=\"control-group\">\n	 						    <div class=\"form-actions\">\n								{!-- do not add a name attribute to your submit button if you want it to work with stripe payment gateway --}\n								    <input type=\"submit\" id=\"checkout_complete\" class=\"btn btn-success\"  value=\"Complete Checkout\" />\n								</div>\n		 					</div>\n\n	 					{/exp:cartthrob:checkout_form}\n	 			{if:else}	\n	 					<h1>Checkout</h1>\n						 <p>You have no items in your cart. </p>\n						<a href=\"{path={template_group}}\" class=\"btn btn-primary btn-small\">Continue shopping.</a> \n				{/if}\n					</section>\n				</div>\n		</div>\n	</div>\n\n 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(32,1,8,'contact','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n\n\n{embed=\"{template_group}/_header\" title=\"Contact Us\" template_group=\"{template_group}\" template=\"{template}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n					{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\"}\n				</div>\n\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"about-us\">\n					<div class=\"row\">\n						<div class=\"span6\">\n							<h1>Contact Us</h1>\n							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat .</p>\n							\n							{exp:email:contact_form user_recipients=\"false\" recipients=\"info@mightybigrobot.com\" charset=\"utf-8\" class=\'form-horizontal\'}\n							<fieldset id=\"contact_fields\" class=\'form-horizontal\'>\n\n 							<div class=\"control-group\">\n								<label class=\"control-label\" for=\"from\">\n								Your Email:\n								</label>\n								<div class=\"controls\">\n									<div class=\"input-prepend\">\n										<span class=\"add-on\"><i class=\"icon-envelope\"></i></span>\n										<input type=\"text\" id=\"from\" name=\"from\"  value=\"{member_email}\" placeholder=\"Your Email\" />\n									</div>\n								</div>\n							</div> \n\n\n 							<div class=\"control-group\">\n								<label class=\"control-label\"  for=\"subject\">\n								Subject\n								</label>\n								<div class=\"controls\">\n									<input type=\"text\" id=\"subject\" name=\"subject\" size=\"40\" placeholder=\"Subject\" />\n								</div>\n							</div> \n\n \n							<div class=\"control-group\">\n								<label class=\"control-label\"  for=\"message\">\n								Message\n								</label>\n								<div class=\"controls\">\n									<textarea id=\"message\" name=\"message\" rows=\"6\" >Email from: {if member_name}{member_name}{if:else}Guest{/if}, Sent at: {current_time format=\"%Y %m %d\"}</textarea>\n								</div> \n							</div>\n							<div class=\"control-group\">\n							<span class=\"help-block\">We will never pass on your details to third parties.</span>\n								<div class=\"form-actions\">\n									\n									<button type=\"submit\" class=\"btn btn-primary\">Submit</button>\n								</div>\n							</div>\n							\n							</fieldset>\n							{/exp:email:contact_form}						\n						</div>\n						<div class=\"span3\">\n							<address>\n							<h3>Address</h3>\n									 <p>\n										{if \'{exp:cartthrob:view_setting store_phone=\"yes\"}\'!=\'\'}{exp:cartthrob:view_setting store_phone=\"yes\"}<br><br>{/if}\n										{exp:cartthrob:view_setting store_address1=\"yes\"}<br />\n										{if \'{exp:cartthrob:view_setting store_address2=\"yes\"}\'!=\'\'}{exp:cartthrob:view_setting store_address2=\"yes\" param=\"1\"}<br />{/if}\n 										{exp:cartthrob:view_setting store_city=\"yes\"}, {exp:cartthrob:view_setting store_state=\"yes\"}<br />\n										{exp:cartthrob:view_setting store_zip=\"yes\"}<br>\n										{exp:cartthrob:view_setting store_country=\"yes\"}\n										 </p>\n							</address>\n						</div>\n					</div>\n				</section>\n				</div>\n		</div>\n	</div>\n\n	 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(33,1,8,'donate','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n \n{embed=\"{template_group}/_header\" title=\"Make a Donation\" template_group=\"{template_group}\" template=\"{template}\" }\n\n</head>\n<body>\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			{!-- we\'re going to load the \"also purchased\" info for the last item added to the cart--}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\"}\n			{/exp:cartthrob:cart_items_info}\n				</div>\n			\n			</div>\n\n			<div class=\"span9\">\n			    <section id=\"donation\">\n					<h1>Make a donation</h1>\n					<p>Thank you for your donation. Please feel free to leave a note with your donation</p>\n					{!-- you can manually add items to the cart using on_the_fly options. You can either set prices as a parameter, or allow_user_price if you\'d like the user to be able to set the price--}\n 					{exp:cartthrob:add_to_cart_form \n					    return=\"{template_group}/view_cart\" \n						class=\'form-horizontal\' \n						allow_user_price=\"yes\"\n						title=\"Donation\"\n						no_shipping=\"yes\"\n						no_tax=\"yes\"\n					    on_the_fly=\"true\"  \n\n						}\n \n						<div class=\"control-group\">\n					 		<label for=\"add_donation\" class=\"control-label\">Donation Amount</label>\n						    <div class=\"controls\">\n								<div class=\"input-prepend\">\n								  <span class=\"add-on\">{exp:cartthrob:view_setting prefix=\"yes\"}</span>\n									<input type=\"text\" maxlength=\"7\"  class=\"input-medium\"  name=\"price\">\n 								</div>\n								\n 							</div>\n						</div>\n						\n						<div class=\"control-group\">\n					 		<label for=\"add_donation\" class=\"control-label\">Donation Note</label>\n						    <div class=\"controls\">\n								{!-- you can add anything to item options. Just use item_options[your_option_name]  when adding items to the cart --}\n								<input type=\"text\" value=\"\" name=\"item_options[donation_note]\"  /> \n  							</div>\n						</div>\n						\n						<div class=\"control-group\">\n							<div class=\"form-actions\">\n								<button type=\"submit\" class=\"btn btn-primary\">Add to Cart</button>\n				      		</div>\n						</div>\n						\n					{/exp:cartthrob:add_to_cart_form}\n				</section>\n				</div>\n		</div>\n	</div>\n\n 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(34,1,8,'email_admin','y','webpage','{preload_replace:headline=\"ORDER INFORMATION\"}\n	{exp:cartthrob:submitted_order_info}\n		<table width=\"600\" cellpadding=\"5\" cellspacing=\"0\">\n			<tr>\n				<td valign=\"top\" align=\"left\" style=\"font-size:12px;color:#000000;font-family:arial, sans-serif;\"><br>\n					<p> <span style=\"font-size:16px;font-weight:bold;\">{headline}</span> </p>\n					<table cellspacing=\"0\" cellpadding=\"2\" bgcolor=\"#000000\" width=\"100%\">\n						<tr>\n							<td><span style=\"color:#ffffff;font-size:14px;\">Order Data</span></td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px;font-weight:bold;\">Order Date: </span> \n								<span style=\"font-size:12px;\">{entry_date format=\"%M %d, %Y\"}</span>\n							</td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px; font-weight:bold;\">Order ID: </span> \n								<span style=\"font-size:12px;\">{title}</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td width=\"250\" valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold; \">Billing</span><br>\n								<span style=\"font-size:12px; \">   \n									{order_billing_first_name} {order_billing_last_name}<br>\n									{order_billing_address}<br>\n									{if order_billing_address2}{order_billing_address2}<br>{/if}\n									{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n									{if order_country_code}{order_country_code}<br>{/if}\n									{order_customer_email}<br>\n									{order_customer_phone}\n								</span>\n							</td>\n							<td valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold;\">Shipping</span><br>\n								<span style=\"font-size:12px; \">   \n									{if order_shipping_address}\n										{order_shipping_first_name} {order_shipping_last_name}<br>\n										{order_shipping_address}<br>\n										{if order_shipping_address2}{order_shipping_address2}<br>{/if}\n										{order_shipping_city}, {order_shipping_state} {order_shipping_zip}\n										{if order_shipping_country_code}{order_shipping_country_code}{/if}\n									{if:else}\n										{order_billing_first_name} {order_billing_last_name}<br>\n										{order_billing_address}<br>\n										{if order_billing_address2}{order_billing_address2}<br>{/if}\n										{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n										{if order_country_code}{order_country_code}<br>{/if}\n										{order_customer_email}<br>\n										{order_customer_phone}\n									{/if}\n								</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n\n					Total number of purchased items: {order_items:total_results}.\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<thead>\n							<tr>\n								<td><span style=\"font-size:12px;font-weight:bold;\">ID</span></td>\n								<td><span style=\"font-size:12px;font-weight:bold;\">Description</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Qty</span></td>\n								<td align=\"center\">&nbsp;</td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Price</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Item Total</span></td>\n							</tr>\n						</thead>\n						<tbody>\n							{exp:cartthrob:order_items order_id=\"{entry_id}\" }\n								<tr class=\"{item:switch=\"odd|even\"}\">\n									<td><span style=\"font-size:12px;\">{item:entry_id}</span></td>\n									<td><span style=\"font-size:12px;\">\n										{item:title}\n										{if is_package}\n											<p>\n 											<span style=\"font-size:9px;\">\n											{packages}\n												{sub:title}<br /> \n											{/packages}\n											</span>\n											</p>\n										{/if}\n										</span></td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:quantity}</span></td>\n									<td align=\"center\">&nbsp;</td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:price}<br />(w/ tax: {item:price_plus_tax})</span></td>\n									<td align=\"right\">\n										<span style=\"font-size:12px;\">\n											{item:subtotal}<br />(w/ tax: {item:subtotal_plus_tax})\n										</span>\n									</td>\n								</tr>\n							{/exp:cartthrob:order_items}\n							<tr>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td colspan=\"3\">&nbsp;</td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td align=\"center\">&nbsp;</td>\n							</tr>\n						</tbody>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td align=\"right\">\n								<table cellspacing=\"0\" cellpadding=\"2\">\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Shipping:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_shipping}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Tax:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_tax}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\">&nbsp;</td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\"></span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">Total:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">{order_total}</span></td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	{/exp:cartthrob:submitted_order_info}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(35,1,8,'email_customer','y','webpage','{preload_replace:headline=\"THANK YOU FOR YOUR ORDER\"}\n 	{exp:cartthrob:submitted_order_info}\n		<table width=\"600\" cellpadding=\"5\" cellspacing=\"0\">\n			<tr>\n				<td valign=\"top\" align=\"left\" style=\"font-size:12px;color:#000000;font-family:arial, sans-serif;\"><br>\n					<p> <span style=\"font-size:16px;font-weight:bold;\">{headline}</span> </p>\n					<table cellspacing=\"0\" cellpadding=\"2\" bgcolor=\"#000000\" width=\"100%\">\n						<tr>\n							<td><span style=\"color:#ffffff;font-size:14px;\">Order Data</span></td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px;font-weight:bold;\">Order Date: </span> \n								<span style=\"font-size:12px;\">{entry_date format=\"%M %d, %Y\"}</span>\n							</td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px; font-weight:bold;\">Order ID: </span> \n								<span style=\"font-size:12px;\">{title}</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td width=\"250\" valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold; \">Billing</span><br>\n								<span style=\"font-size:12px; \">   \n									{order_billing_first_name} {order_billing_last_name}<br>\n									{order_billing_address}<br>\n									{if order_billing_address2}{order_billing_address2}<br>{/if}\n									{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n									{if order_country_code}{order_country_code}<br>{/if}\n									{order_customer_email}<br>\n									{order_customer_phone}\n								</span>\n							</td>\n							<td valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold;\">Shipping</span><br>\n								<span style=\"font-size:12px; \">   \n									{if order_shipping_address}\n										{order_shipping_first_name} {order_shipping_last_name}<br>\n										{order_shipping_address}<br>\n										{if order_shipping_address2}{order_shipping_address2}<br>{/if}\n										{order_shipping_city}, {order_shipping_state} {order_shipping_zip}\n										{if order_shipping_country_code}{order_shipping_country_code}{/if}\n									{if:else}\n										{order_billing_first_name} {order_billing_last_name}<br>\n										{order_billing_address}<br>\n										{if order_billing_address2}{order_billing_address2}<br>{/if}\n										{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n										{if order_country_code}{order_country_code}<br>{/if}\n										{order_customer_email}<br>\n										{order_customer_phone}\n									{/if}\n								</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n\n					Total number of purchased items: {order_items:total_results}.\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<thead>\n							<tr>\n								<td><span style=\"font-size:12px;font-weight:bold;\">ID</span></td>\n								<td><span style=\"font-size:12px;font-weight:bold;\">Description</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Qty</span></td>\n								<td align=\"center\">&nbsp;</td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Price</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Item Total</span></td>\n								<td align=\"center\">&nbsp;</td>\n							</tr>\n						</thead>\n						<tbody>\n							{exp:cartthrob:order_items order_id=\"{entry_id}\" }\n								<tr class=\"{item:switch=\"odd|even\"}\">\n									<td><span style=\"font-size:12px;\">{item:entry_id}</span></td>\n									<td><span style=\"font-size:12px;\">\n										{item:title}\n										{if is_package}\n											<p>\n 											<span style=\"font-size:9px;\">\n											{packages}\n												{sub:title}<br /> \n											{/packages}\n											</span>\n											</p>\n										{/if}\n										</span></td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:quantity}</span></td>\n									<td align=\"center\">&nbsp;</td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:price}<br />(w/ tax: {item:price_plus_tax})</span></td>\n									<td align=\"right\">\n										<span style=\"font-size:12px;\">\n											{item:subtotal}<br />(w/ tax: {item:subtotal_plus_tax})\n										</span>\n									</td>\n									<td align=\"right\">\n										{if item:product_download_url}\n										<span style=\"font-size:12px;\"><a href=\"{exp:cartthrob:get_download_link field=\'product_download_url\' entry_id=\'{item:entry_id}\'}\">Download</a></span>\n										{/if}\n									</td>\n								</tr>\n							{/exp:cartthrob:order_items}\n							<tr>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td colspan=\"3\">&nbsp;</td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n							</tr>\n						</tbody>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td align=\"right\">\n								<table cellspacing=\"0\" cellpadding=\"2\">\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Shipping:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_shipping}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Tax:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_tax}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\">&nbsp;</td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\"></span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">Total:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">{order_total}</span></td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	{/exp:cartthrob:submitted_order_info}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(36,1,8,'email_low_stock','y','webpage','Low stock notification for item number {entry_id}. Stock level is currently at {inventory}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(37,1,8,'email_status_change','y','webpage','Your order\'s status has changed: \n\nOrder Id: {entry_id} <br />\nCurrent Status: {status} <br />\nPrevious Status:{previous_status} <br />\nChannel ID {channel_id} <br />\nURL title {url_title} <br />\n\n{exp:channel:entries entry_id=\"{entry_id}\"}\n\n{title}\n\n{/exp:channel:entries}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(38,1,8,'index','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n \n{embed=\"{template_group}/_header\" title=\"Shopping Cart\" template_group=\"{template_group}\" template=\"{template}\" }\n \n</head>\n<body>\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n				</div>\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"main\">\n					{exp:channel:entries channel=\"products\" limit=\"30\"  dynamic=\"no\"}\n						{if count==1}<h2>Available Products</h2><ul class=\"thumbnails\">{/if}\n							{switch=\"<div class=\'row\'>||\"}\n							<li class=\"span3\">						\n 							\n						<div class=\"thumbnail\">\n							{if product_thumbnail}\n									<a class=\'\' href=\"{entry_id_path=\'{template_group}/product_detail\'}\"><img src=\"{product_thumbnail}\" /></a>\n							{if:else}\n							<a class=\'\' href=\"{entry_id_path=\'{template_group}/product_detail\'}\"><img src=\"http://placehold.it/300x200\" alt=\"\"></a>\n							{/if}\n							<div class=\"caption\">\n								<h3>{title}</h3>\n							\n								<p>\n									{if product_original_price && product_original_price > product_price}\n										<h4>{product_price} <small><strong>Sale Price</strong> <i class=\"icon-tags\"></i></small></h4>\n											<div class=\"alert alert-info\">\n												<del><small>Regular Price: <strong>{product_original_price}</strong></small></del>\n											</div>\n									{if:else}\n									<h4>{product_price} <small><strong>Regular Price</strong></small></h4>\n									{/if}\n\n									{if no_tax !=\"Yes\"}<small>including tax: {product_price:plus_tax}</small>{/if}\n						\n								</p>\n								 <a class=\'btn btn-primary btn-mini\' href=\"{entry_id_path={template_group}/product_detail}\">Learn more &raquo;</a>\n							</div>\n						</div>\n						</li>\n						{switch=\"||</div>\"}\n						{if count==total_results}</ul><!-- end row -->{/if}\n					{/exp:channel:entries}\n					\n					{exp:channel:entries channel=\"store_packages\" limit=\"30\"  dynamic=\"no\"}\n					{if count==1}<h2>Available Packages</h2><ul class=\"thumbnails\">{/if}\n						{switch=\"<div class=\'row\'>||\"}\n						\n						<li class=\"span3\">						\n						\n						<div class=\"thumbnail\">\n							{if packages_images}\n									<a href=\"{entry_id_path=\'{template_group}/package_detail\'}\"><img src=\"{packages_images}\" /></a>\n							{if:else}\n								<a class=\'\' href=\"{entry_id_path=\'{template_group}/package_detail\'}\"><img src=\"http://placehold.it/300x200\" alt=\"\"></a>\n							{/if}\n							<div class=\"caption\">\n								<h3>{title}</h3>\n								{if packages_images}\n										<a href=\"{entry_id_path=\'{template_group}/package_detail\'}\"><img src=\"{packages_images}\" /></a>\n								{/if}\n\n								<h4>{packages_packages:price} <small><strong>Regular Price</strong></small></h4>\n \n								<small>including tax: {packages_packages:plus_tax}</small>\n \n								<p><strong>Package Features: </strong><br />\n									{packages_packages}\n						 				- {title}<br /> \n									{/packages_packages}\n								</p>\n								<a class=\'btn btn-primary btn-mini\'  href=\"{entry_id_path={template_group}/package_detail}\">Learn more &raquo;</a></p>\n							</div>\n						</div>\n						</li>\n						{switch=\"||</div>\"}\n						\n						{if count==total_results}</ul><!-- end row -->{/if}\n						\n					{/exp:channel:entries}\n					</section>\n				</div>\n		</div>\n	</div>\n\n 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(39,1,8,'invoice','y','webpage','{!-- the account template sends the ID of the entry encrypted. In this template, the ID is being decrypted. If found, it will load the invoice template that contains the data\n	Using this method, you can share the invoice link with someone that is not logged in.\n	 --}\n{preload_replace:template_group=\"store\"}\n{if \"{exp:cartthrob:view_decrypted_string string=\'{segment_3}\' parse_inward=\'yes\'}\" !=\"\" }\n	{embed=\"{template_group}/_invoice\" entry_id=\"{exp:cartthrob:view_decrypted_string string=\'{segment_3}\' parse_inward=\"yes\"}\"}\n{if:elseif entry_id}\n	{embed=\"{template_group}/_invoice\" entry_id=\"{entry_id}\"}\n\n{if:else}\n	Invoice could not be found\n{/if}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(40,1,8,'main.css','y','css','/* Add additional stylesheets below\n-------------------------------------------------- */\n/*\n  Bootstrap\'s documentation styles\n  Special styles for presenting Bootstrap\'s documentation and examples\n*/\n\n\n\n/* Body and structure\n-------------------------------------------------- */\n\nbody {\n  position: relative;\n  padding-top: 40px;\n}\n\n/* Code in headings */\nh3 code {\n  font-size: 14px;\n  font-weight: normal;\n}\n\n\n\n/* Tweak navbar brand link to be super sleek\n-------------------------------------------------- */\n\nbody > .navbar {\n  font-size: 13px;\n}\n\n/* Change the brand */\nbody > .navbar .brand {\n  padding-right: 0;\n  padding-left: 0;\n  margin-left: 20px;\n  float: right;\n  font-weight: bold;\n  color: #cfcfcf;\n  text-shadow: 0 1px 0 rgba(255,255,255,.1), 0 0 30px rgba(255,255,255,.125);\n  -webkit-transition: all .2s linear;\n     -moz-transition: all .2s linear;\n          transition: all .2s linear;\n}\nbody > .navbar .brand:hover {\n  text-decoration: none;\n  text-shadow: 0 1px 0 rgba(255,255,255,.1), 0 0 30px rgba(255,255,255,.4);\n}\n\n#leftnav{\n  margin: 30px 0 0;\n  }\n\n.affix {\n    top: 20px; \n }\n/* Sections\n-------------------------------------------------- */\n\n/* padding for in-page bookmarks and fixed navbar */\nsection {\n  padding-top: 30px;\n}\n\nsection > ul li {\n  margin-bottom: 5px;\n}\n \n/* Faded out hr */\nhr.soften {\n  height: 1px;\n  margin: 70px 0;\n  background-image: -webkit-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.1), rgba(0,0,0,0));\n  background-image:    -moz-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.1), rgba(0,0,0,0));\n  background-image:     -ms-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.1), rgba(0,0,0,0));\n  background-image:      -o-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.1), rgba(0,0,0,0));\n  border: 0;\n}\n\n\n\n/* Jumbotrons\n-------------------------------------------------- */\n\n/* Base class\n------------------------- */\n.jumbotron {\n  position: relative;\n  padding: 15px 0;\n  color: #fff;\n  text-align: center;\n  \n  text-shadow: 0 1px 3px rgba(0,0,0,.4), 0 0 30px rgba(0,0,0,.075);\n  \nbackground: #103c51; /* Old browsers */\nbackground: -moz-linear-gradient(45deg, #103c51 0%, #5a89a8 68%); /* FF3.6+ */\nbackground: -webkit-gradient(linear, left bottom, right top, color-stop(0%,#103c51), color-stop(68%,#5a89a8)); /* Chrome,Safari4+ */\nbackground: -webkit-linear-gradient(45deg, #103c51 0%,#5a89a8 68%); /* Chrome10+,Safari5.1+ */\nbackground: -o-linear-gradient(45deg, #103c51 0%,#5a89a8 68%); /* Opera 11.10+ */\nbackground: -ms-linear-gradient(45deg, #103c51 0%,#5a89a8 68%); /* IE10+ */\nbackground: linear-gradient(45deg, #103c51 0%,#5a89a8 68%); /* W3C */\nfilter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#103c51\', endColorstr=\'#5a89a8\',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */\n  -webkit-box-shadow: inset 0 3px 7px rgba(0,0,0,.2), inset 0 -3px 7px rgba(0,0,0,.2);\n     -moz-box-shadow: inset 0 3px 7px rgba(0,0,0,.2), inset 0 -3px 7px rgba(0,0,0,.2);\n          box-shadow: inset 0 3px 7px rgba(0,0,0,.2), inset 0 -3px 7px rgba(0,0,0,.2);\n}\n\n\n.jumbotron.purple{\n  position: relative;\n  padding: 15px 0;\n  color: #fff;\n  text-align: center;\n  \n  text-shadow: 0 1px 3px rgba(0,0,0,.4), 0 0 30px rgba(0,0,0,.075);\n  \n  background: #020031; /* Old browsers */\n  background: -moz-linear-gradient(45deg,  #020031 0%, #6d3353 100%); /* FF3.6+ */\n  background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,#020031), color-stop(100%,#6d3353)); /* Chrome,Safari4+ */\n  background: -webkit-linear-gradient(45deg,  #020031 0%,#6d3353 100%); /* Chrome10+,Safari5.1+ */\n  background: -o-linear-gradient(45deg,  #020031 0%,#6d3353 100%); /* Opera 11.10+ */\n  background: -ms-linear-gradient(45deg,  #020031 0%,#6d3353 100%); /* IE10+ */\n  background: linear-gradient(45deg,  #020031 0%,#6d3353 100%); /* W3C */\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#020031\', endColorstr=\'#6d3353\',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */\n  -webkit-box-shadow: inset 0 3px 7px rgba(0,0,0,.2), inset 0 -3px 7px rgba(0,0,0,.2);\n     -moz-box-shadow: inset 0 3px 7px rgba(0,0,0,.2), inset 0 -3px 7px rgba(0,0,0,.2);\n          box-shadow: inset 0 3px 7px rgba(0,0,0,.2), inset 0 -3px 7px rgba(0,0,0,.2);\n	\n}\n.jumbotron h1 {\n  font-size: 60px;\n  font-weight: bold;\n  letter-spacing: -1px;\n  line-height: 1;\n}\n.jumbotron p {\n  font-size: 19px;\n  font-weight: 300;\n  line-height: 1.25;\n  margin-bottom: 30px;\n}\n\n/* Link styles (used on .masthead-links as well) */\n.jumbotron a {\n  color: #fff;\n  color: rgba(255,255,255,.5);\n  -webkit-transition: all .2s ease-in-out;\n     -moz-transition: all .2s ease-in-out;\n          transition: all .2s ease-in-out;\n}\n.jumbotron a:hover {\n  color: #fff;\n  text-shadow: 0 0 10px rgba(255,255,255,.25);\n}\n\n/* Pattern overlay\n------------------------- */\n.jumbotron .container {\n  position: relative;\n  z-index: 2;\n}\n.jumbotron:after {\n  content: \'\';\n  display: block;\n  position: absolute;\n  top: 0;\n  right: 0;\n  bottom: 0;\n  left: 0;\n  background: url(../img/bs-docs-masthead-pattern.png) repeat center center;\n  opacity: .4;\n}\n \n/* Subhead\n------------------------- */\n.subhead {\n  text-align: left;\n  border-bottom: 1px solid #ddd;\n}\n.subhead h1 {\n  font-size: 35px;\n}\n.subhead p {\n  margin-bottom: 12px;\n}\n.subhead .navbar {\n  display: none;\n}\n\n\n\n/* Footer\n-------------------------------------------------- */\n\n.footer {\n  padding: 70px 0;\n  margin-top: 70px;\n  border-top: 1px solid #e5e5e5;\n  background-color: #f5f5f5;\n}\n.footer p {\n  margin-bottom: 0;\n  color: #777;\n}\n.footer-links {\n  margin: 10px 0;\n}\n.footer-links li {\n  display: inline;\n  padding: 0 2px;\n}\n.footer-links li:first-child {\n  padding-left: 0;\n}\n\n\n/* Misc\n-------------------------------------------------- */\n\n/* Make tables spaced out a bit more */\nh2 + table,\nh3 + table,\nh4 + table,\nh2 + .row {\n  margin-top: 5px;\n}\n\n\n\n\n/* Responsive\n-------------------------------------------------- */\n\n\n/* Desktop\n------------------------- */\n@media (max-width: 980px) {\n  /* Unfloat brand */\n  body > .navbar-fixed-top .brand {\n    float: left;\n    margin-left: 0;\n    padding-left: 10px;\n    padding-right: 10px;\n  }\n}\n\n/* Tablet to desktop\n------------------------- */\n@media (min-width: 768px) and (max-width: 980px) {\n  /* Remove any padding from the body */\n  body {\n    padding-top: 0;\n  }\n  /* Widen masthead and social buttons to fill body padding */\n  .jumbotron {\n    margin-top: -20px; /* Offset bottom margin on .navbar */\n  }\n}\n\n/* Tablet\n------------------------- */\n@media (max-width: 767px) {\n  /* Remove any padding from the body */\n  body {\n    padding-top: 0;\n  }\n\n  /* Widen masthead and social buttons to fill body padding */\n  .jumbotron {\n    padding: 40px 20px;\n    margin-top:   -20px; /* Offset bottom margin on .navbar */\n    margin-right: -20px;\n    margin-left:  -20px;\n  }\n  /* Unfloat the back to top link in footer */\n  .footer {\n    margin-left: -20px;\n    margin-right: -20px;\n    padding-left: 20px;\n    padding-right: 20px;\n  }\n  .footer p {\n    margin-bottom: 9px;\n  }\n}\n\n/* Landscape phones\n------------------------- */\n@media (max-width: 480px) {\n  /* Remove padding above jumbotron */\n  body {\n    padding-top: 0;\n  }\n\n  /* Change up some type stuff */\n  h2 small {\n    display: block;\n  }\n\n  /* Downsize the jumbotrons */\n  .jumbotron h1 {\n    font-size: 45px;\n  }\n  .jumbotron p,\n  .jumbotron .btn {\n    font-size: 18px;\n  }\n  .jumbotron .btn {\n    display: block;\n    margin: 0 auto;\n  }\n\n  /* center align subhead text like the masthead */\n  .subhead h1,\n  .subhead p {\n    text-align: center;\n  }\n\n  /* Tighten up footer */\n  .footer {\n    padding-top: 20px;\n    padding-bottom: 20px;\n  }\n  /* Unfloat the back to top in footer to prevent odd text wrapping */\n  .footer .pull-right {\n    float: none;\n  }\n}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(41,1,8,'order_info','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n \n{embed=\"{template_group}/_header\" title=\"Order Results\" template_group=\"{template_group}\" template=\"{template}\" }\n\n</head>\n<body>\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			{!-- we\'re going to load the \"also purchased\" info for the last item added to the cart--}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\"}\n			{/exp:cartthrob:cart_items_info}\n				</div>\n			\n			</div>\n\n			<div class=\"span9\">\n			    \n				{exp:cartthrob:submitted_order_info}\n 				        {if authorized}\n							<h1>Payment successful</h1>\n				            Your transaction is complete!<br />\n				            Transaction ID: {transaction_id}<br />\n				            Your total: {cart_total}<br />\n				            Your order ID: {order_id}<br /><br />\n\n					    <a href=\"{path={template_group}/account}\">Order History &raquo;</a><br>\n					\n						{!-- encrypting a link to this invoice so it can be stored and shared --}\n						<a target=\"_blank\" href=\"{path={template_group}/invoice}/{exp:cartthrob:view_encrypted_string string=\'{order_id}\'}\">View invoice &raquo; </a>\n					\n				        {if:elseif processing}\n							<h1>Payment is processing</h1>\n				            Your Order is Currently being processed: {error_message}<br />\n				            Transaction ID: {transaction_id}<br />\n				            <br />Order processing is generally completed within 48 hours depending on your payment method. \n				        {if:elseif declined}\n				            <h1>Payment was declined</h1>\n							\n							Your credit card was declined: {error_message}\n				            <a href=\"{path={template_group}/checkout}\">Try checking out again &raquo;</a>\n				        {if:elseif failed}\n				            <h1>Payment failed</h1>\n							\n							Your payment failed: {error_message}\n				            <a href=\"{path={template_group}/checkout}\">Try checking out again &raquo;</a>\n				        {/if}\n 				{/exp:cartthrob:submitted_order_info}\n\n				</div>\n		</div>\n	</div>\n\n 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(42,1,8,'package_detail','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n\n\n{exp:channel:entries \n	channel=\"store_packages\" \n	limit=\"1\"}\n	 \n{embed=\"{template_group}/_header\" title=\"{title} - Package Detail\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n					{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n				</div>\n\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"package-info\">\n					<div class=\"row\">\n						<div class=\"span6\">\n							<h1>{title}</h1>\n							{packages_description}\n							<h4>{packages_packages:price} <small><strong>Price</strong></small></h4>\n\n							<p>Price including tax {packages_packages:plus_tax}</p> \n\n							{!-- using twitter bootstrap here to lay out the form niceley... hence the form-horizontal class set here --}\n							{exp:cartthrob:add_to_cart_form \n								class=\'form-horizontal\' \n								entry_id=\"{entry_id}\" \n								no_tax=\"{no_tax}\"\n								no_shipping = \"{no_shipping}\"\n								return=\"{template_group}/view_cart\"} \n								{packages_packages}\n\n								<div class=\"control-group\">\n								<h3>{sub:title}</h3>\n								{exp:cartthrob:item_options row_id=\"{sub:row_id}\"  entry_id=\"{entry_id}\"}\n							            {if dynamic}\n							                <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n							                {input}\n							            {if:else}\n							                {if options_exist}\n							                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n											    <div class=\"controls\">\n							                    {select} \n							                        <option {selected} value=\"{option_value}\">\n							                            {option_name}{if option_price_numeric != 0} +{option_price}{/if}\n							                        </option>\n							                    {/select}\n												</div>\n							                {/if}\n							            {/if}\n							        {/exp:cartthrob:item_options}\n								</div>\n								{/packages_packages}\n\n								<div class=\"control-group\">\n								{if \"{inventory}\" == \"0\" }\n									<p><strong>This item is out of stock</strong></p>\n							 	{if:else}\n							 		<label for=\"product_quantity\" class=\"control-label\">Quantity</label>\n								    <div class=\"controls\">\n										<input type=\"text\" id=\"product_quantity\" name=\"quantity\" size=\"8\"  />\n									</div>\n								{/if}\n								</div>\n\n								<div class=\"control-group\">\n									<div class=\"form-actions\">\n										<button type=\"submit\" class=\"btn btn-primary\">Add to Cart</button>\n						      		</div>\n								</div>\n							{/exp:cartthrob:add_to_cart_form}\n							\n						</div>\n \n						<div class=\"span3\">\n							<ul class=\"thumbnails\">\n								<li class=\"span3\">						\n									<div class=\"thumbnail\">\n									{if packages_images}\n										<img src=\"{packages_images}\" />\n									{if:else}\n										<img src=\"{theme_folder_url}third_party/cartthrob/store_themes/basic_white/images/main_pic.jpg\" />\n									{/if}\n									</div>\n								</li>\n							</ul>\n							\n						</div>\n						\n					</div>\n				</section>\n				</div>\n		</div>\n	</div>\n\n	 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\" entry_id=\"{entry_id}\"}\n\n	{/exp:channel:entries}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(43,1,8,'packing_slip','y','webpage','\n{!--This template\'s entry id is sent by the Cartthrob Order Manager --}\n\n{exp:channel:entries channel=\"orders\" limit=\"1\" status=\"not none\" dynamic=\"no\" entry_id=\"{entry_id}\" show_future_entries=\"yes\" }\n{if no_results}This invoice could not be found{/if}\n{!-- invoice template  Add your store information somewhere on this invoice! --}\n		<table width=\"600\" cellpadding=\"5\" cellspacing=\"0\">\n			<tr>\n				<td valign=\"top\" align=\"left\" style=\"font-size:12px;color:#000000;font-family:arial, sans-serif;\"><br>\n					<p> <span style=\"font-size:16px;font-weight:bold;\">Packing Slip</span> </p>\n					<table cellspacing=\"0\" cellpadding=\"2\" bgcolor=\"#000000\" width=\"100%\">\n						<tr>\n							<td><span style=\"color:#ffffff;font-size:14px;\">Order Data</span></td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px;font-weight:bold;\">Order Date: </span> \n								<span style=\"font-size:12px;\">{entry_date format=\"%M %D %Y\"}</span>\n							</td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px; font-weight:bold;\">Order ID: </span> \n								<span style=\"font-size:12px;\">{title}</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td width=\"250\" valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold; \">Billing</span><br>\n								<span style=\"font-size:12px; \">   \n									{order_billing_first_name} {order_billing_last_name}<br>\n									{order_billing_address}<br>\n									{if order_billing_address2}{order_billing_address2}<br>{/if}\n									{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n									{if order_country_code}{order_country_code}<br>{/if}\n									{order_customer_email}<br>\n									{order_customer_phone}\n								</span>\n							</td>\n							<td valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold;\">Shipping</span><br>\n								<span style=\"font-size:12px; \">   \n									{if order_shipping_address}\n										{order_shipping_first_name} {order_shipping_last_name}<br>\n										{order_shipping_address}<br>\n										{if order_shipping_address2}{order_shipping_address2}<br>{/if}\n										{order_shipping_city}, {order_shipping_state} {order_shipping_zip}\n										{if order_shipping_country_code}{order_shipping_country_code}{/if}\n									{if:else}\n										{order_billing_first_name} {order_billing_last_name}<br>\n										{order_billing_address}<br>\n										{if order_billing_address2}{order_billing_address2}<br>{/if}\n										{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n										{if order_country_code}{order_country_code}<br>{/if}\n										{order_customer_email}<br>\n										{order_customer_phone}\n									{/if}\n								</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n\n					<p>Total number of purchased items: {order_items:total_results}.</p>\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<thead>\n							<tr>\n								<td><span style=\"font-size:12px;font-weight:bold;\">ID</span></td>\n								<td><span style=\"font-size:12px;font-weight:bold;\">Description</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Qty</span></td>\n								<td align=\"center\">&nbsp;</td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Price</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Item Total</span></td>\n								<td align=\"center\">&nbsp;</td>\n							</tr>\n						</thead>\n						<tbody>\n							{exp:cartthrob:order_items order_id=\"{entry_id}\" }\n								<tr class=\"{item:switch=\"odd|even\"}\">\n									<td><span style=\"font-size:12px;\">{item:entry_id}</span></td>\n									<td><span style=\"font-size:12px;\">\n										{item:title}\n										{if is_package}\n											<p>\n 											<span style=\"font-size:9px;\">\n											{packages}\n												{sub:title}<br /> \n											{/packages}\n											</span>\n											</p>\n										{/if}\n										</span></td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:quantity}</span></td>\n									<td align=\"center\">&nbsp;</td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:price}<br />(w/ tax: {item:price_plus_tax})</span></td>\n									<td align=\"right\">\n										<span style=\"font-size:12px;\">\n											{item:subtotal}<br />(w/ tax: {item:subtotal_plus_tax})\n										</span>\n									</td>\n									<td align=\"right\">\n										{if item:product_download_url}\n										<span style=\"font-size:12px;\"><a href=\"{exp:cartthrob:get_download_link field=\'product_download_url\' entry_id=\'{item:entry_id}\'}\">Download</a></span>\n										{/if}\n									</td>\n								</tr>\n							{/exp:cartthrob:order_items}\n							<tr>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td colspan=\"3\">&nbsp;</td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n							</tr>\n						</tbody>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td align=\"right\">\n								<table cellspacing=\"0\" cellpadding=\"2\">\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Shipping:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_shipping}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Tax:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_tax}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\">&nbsp;</td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\"></span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">Total:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">{order_total}</span></td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	{/exp:channel:entries}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(44,1,8,'privacy_policy','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n\n\n{embed=\"{template_group}/_header\" title=\"Privacy Policy\" template_group=\"{template_group}\" template=\"{template}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n					{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\"}\n				</div>\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"privacy-policy\">\n					<h1>Privacy Policy</h1>\n					<p>We will not share any information with any third parties</p>\n				</section>\n				</div>\n		</div>\n	</div>\n\n	 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(45,1,8,'product_detail','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n\n\n{exp:channel:entries \n	channel=\"products\" \n	limit=\"1\"}\n	 \n{embed=\"{template_group}/_header\" title=\"{title} - Product Detail\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n					{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n				</div>\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"product-info\">\n					<div class=\"row\">\n						<div class=\"span6\">\n										<h1>{title}</h1>\n										{if product_sku}#{product_sku}{/if}\n										{product_description}\n										{if product_original_price && product_original_price > product_price}\n											<h4>{product_price} <small><strong>Sale Price</strong> <i class=\"icon-tags\"></i></small></h4>\n												<div class=\"alert alert-info\">\n													<del><small>Regular Price: <strong>{product_original_price}</strong></small></del>\n												</div>\n										{if:else}\n										<h4>{product_price} <small><strong>Regular Price</strong></small></h4>\n										{/if}\n											{if no_tax !=\"Yes\"}<p>Price including tax <strong>{product_price:plus_tax}</strong></p>{/if}\n\n										{!-- using twitter bootstrap here to lay out the form niceley... hence the form-horizontal class set here --}\n										{exp:cartthrob:add_to_cart_form \n											class=\'form-horizontal\' \n											entry_id=\"{entry_id}\" \n											no_tax=\"{no_tax}\"\n											no_shipping = \"{no_shipping}\"\n											return=\"{template_group}/view_cart\"} \n												{exp:cartthrob:item_options entry_id=\"{entry_id}\"}\n											  	  {if dynamic}\n										          <div class=\"control-group\">\n										                <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n										                <div class=\"controls\">\n													    {input}\n														</div>\n													</div>\n										            {if:else}\n										                {if options_exist}\n											          <div class=\"control-group\">\n										\n										                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n														    <div class=\"controls\">\n										                    {select class=\"input-medium\"} \n										                        <option {selected} value=\"{option_value}\">\n										                            {option_name}{if option_price_numeric != 0} +{option_price}{/if}\n										                        </option>\n										                    {/select}\n															</div>\n														</div>\n										                {/if}\n										            {/if}\n										        {/exp:cartthrob:item_options}\n\n											<div class=\"control-group\">\n											{if \"{inventory}\" == \"0\" }\n												<p><strong>This item is out of stock</strong></p>\n										 	{if:else}\n										 		<label for=\"product_quantity\" class=\"control-label\">Quantity</label>\n											    <div class=\"controls\">\n													<input type=\"text\" id=\"product_quantity\" class=\"input-medium\"  placeholder=\'1\' name=\"quantity\" size=\"8\"  />\n												</div>\n											{/if}\n											</div>\n\n											<div class=\"control-group\">\n												<div class=\"form-actions\">\n													<button type=\"submit\" class=\"btn btn-primary\">Add to Cart</button>\n									      		</div>\n											</div>\n										{/exp:cartthrob:add_to_cart_form}\n						</div>\n						<div class=\"span3\">\n							<ul class=\"thumbnails\">\n								<li class=\"span3\">						\n									<div class=\"thumbnail\">\n									{if product_detail_image}\n										<img src=\"{product_detail_image}\" />\n									{if:else}\n										<img src=\"{theme_folder_url}third_party/cartthrob/store_themes/basic_white/images/main_pic.jpg\" />\n									{/if}\n									</div>\n								</li>\n							</ul>\n							\n						</div>\n					</div>\n	\n				</section>\n				</div>\n		</div>\n	</div>\n\n	 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\" entry_id=\"{entry_id}\"}\n\n	{/exp:channel:entries}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(46,1,8,'return_policy','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n\n\n{embed=\"{template_group}/_header\" title=\"Return Policy\" template_group=\"{template_group}\" template=\"{template}\" }\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n					{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n					{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\"}\n				</div>\n			</div>\n\n			<div class=\"span9\">\n				<section id=\"return-policy\">\n					<h1>Return Policy</h1>\n					<p>Returns are not accepted</p>\n				</section>\n				</div>\n		</div>\n	</div>\n\n	 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(47,1,8,'shipping','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"index\"}\n \n{embed=\"{template_group}/_header\" title=\"Checkout - Shipping\" template_group=\"{template_group}\" template=\"{template}\" }\n\n</head>\n<body>\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n			{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			\n			{!-- we\'re going to load the \"also purchased\" info for the last item added to the cart--}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\"}\n			{/exp:cartthrob:cart_items_info}\n				</div>\n\n			</div>\n\n			<div class=\"span9\">\n					<section id=\"shipping-section\">\n					{if \"{exp:cartthrob:total_items_count}\" > 0}\n	 					<h1>Shipping</h1>\n\n	  					<p>{exp:cartthrob:view_setting store_shipping_estimate=\"yes\"}</p>\n						\n						{!-- see  http://cartthrob.com/docs/tags/global_form_settings/index.html#inline-errors --}\n						\n						{exp:cartthrob:update_cart_form \n								error_handling=\"inline\" \n								id=\"shipping_form\" \n								class=\"form-horizontal\"\n								return=\"{template_group}/checkout\"}\n\n								<div class=\"alert alert-info\">\n									<span class=\"help-block\">*All fields are required</span>\n								</div>\n								{if errors_exist}\n								<div class=\"control-group\">\n									{!-- not a fan of inline JS, but the if_errors conditional works only inside the checkout form \n										so if you want to use JS, you\'ll need to use inline JS.\n										--}\n									<script type=\"text/javascript\">\n										jQuery(document).ready(function($){\n								 			{errors}\n												{if field_error}\n													$(\"#{field}\").closest(\".control-group\").addClass(\"error\");\n													$(\"#{field}\").after(\'<span class=\"help-inline\">{error}</span>\');\n												{/if} \n											{/errors}\n										});\n									</script>\n									{errors}\n										{if first_error}\n										<div class=\"alert alert-error\">\n										<strong>Alert</strong> There are <span class=\"badge badge-warning\">{error:total_results}</span> error(s). Please correct the errors listed below\n										</div>\n										{/if}\n											\n											<p>\n												{if field_error}<span class=\"label label-important\">{field}</span>{/if} \n												{if global_error}<span class=\"label label-important\">Error</span>{/if} \n												{error}\n											</p>\n 									{/errors}\n									\n								</div>\n								{/if}\n							\n							\n							{exp:cartthrob:customer_info}\n								<div class=\"control-group\">\n									<label class=\"control-label\" for=\"shipping_first_name\">Shipping First Name: </label>\n									\n		 						    <div class=\"controls\">\n										<input type=\"text\" name=\"shipping_first_name\" id=\"shipping_first_name\" value=\"{customer_shipping_first_name}\" /><br />\n									</div>\n			 					</div>\n			\n								<div class=\"control-group\">\n									<label  class=\"control-label\" for=\"shipping_last_name\">Shipping Last Name: </label>\n\n									<div class=\"controls\">\n										<input type=\"text\" name=\"shipping_last_name\" id=\"shipping_last_name\" value=\"{customer_shipping_last_name}\" /><br />\n									</div>\n								</div>\n\n								<div class=\"control-group\">\n									<label class=\"control-label\" for=\"email_address\">Email Address:</label>\n\n									<div class=\"controls\">\n										<input type=\"text\" id=\"email_address\" name=\"email_address\" value=\"{customer_email_address}\" /><br />\n									</div>\n								</div>\n								\n								<div class=\"control-group\">\n									<label class=\"control-label\" for=\"shipping_state\">Shipping State:</label>\n\n									<div class=\"controls\">\n										{exp:cartthrob:state_select name=\"shipping_state\" id=\"shipping_state\" selected=\"{customer_shipping_state}\"}<br />\n									</div>\n								</div>\n								\n								<div class=\"control-group\">\n									<label class=\"control-label\" for=\"shipping_country_code\">Shipping Country:</label>\n\n									<div class=\"controls\">\n										{exp:cartthrob:country_select name=\"shipping_country_code\" id=\"shipping_country_code\" selected=\"{customer_shipping_country_code}\"}<br />\n									</div>\n								</div>	\n\n								<div class=\"control-group\">\n									<label class=\"control-label\" for=\"shipping_zip\">Shipping Zip:</label>\n\n									<div class=\"controls\">\n										<input type=\"text\" name=\"shipping_zip\" id=\"shipping_zip\" value=\"{customer_shipping_zip}\" /><br />\n									</div>\n								</div>			\n								\n								<div class=\"control-group\">\n									\n									<div class=\"controls\">\n									{exp:cartthrob:get_shipping_options}\n									</div>\n								</div>												\n							{/exp:cartthrob:customer_info}\n\n\n							<div class=\"control-group\">\n	 						    <div class=\"form-actions\">\n								    <input type=\"submit\" class=\"btn btn-success\" value=\"Continue Checkout\" />\n								</div>\n		 					</div>\n\n	 					{/exp:cartthrob:update_cart_form}\n	 			{if:else}	\n\n	 					<h1>Shipping</h1>\n						 <p>You have no items in your cart. </p>\n						<a href=\"{path={template_group}}\" class=\"btn btn-primary btn-small\">Continue shopping.</a> \n				{/if}\n					</section>\n				</div>\n		</div>\n	</div>\n\n 	{embed=\"{template_group}/_footer\" template=\"{template}\" template_group=\"{template_group}\"}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(48,1,8,'view_cart','y','webpage','{preload_replace:template_group=\"store\"}\n{preload_replace:template=\"view_cart\"}\n \n\n\n \n</head>\n<body data-spy=\"scroll\" data-target=\".bs-docs-sidebar\">\n	{embed=\"{template_group}/_navbar\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{embed=\"{template_group}/_subhead\" template_group=\"{template_group}\" template=\"{template}\"}\n\n	{!-- since we\'re using twitter bootstrap, the main content area is designated \"container\", or some other specific classes depending on your requirements--}\n	<div class=\"container\">\n		{!-- twitter bootstrap breaks up content into rows. The main section of this template is all one row. Rows can also be broken up into more rows --}\n		<div class=\"row\">\n\n			{!-- twitter bootstrap breaks up (by default) pages into a 12 column grid. span3, span9 designate how much space these sections will take up --}\n			<div class=\"span3\">\n				<div class=\"bs-docs-sidenav\">\n			{embed=\"{template_group}/_leftnav\" template_group=\"{template_group}\" template=\"{template}\"}\n			{exp:cartthrob:cart_items_info limit=\"1\" order_by=\"entry_id\" sort=\"desc\"}\n				{embed=\"{template_group}/_also_purchased\" template_group=\"{template_group}\" template=\"{template}\" entry_id=\"{entry_id}\" }\n			{/exp:cartthrob:cart_items_info}\n				</div>\n\n			</div>\n\n			<div class=\"span9\">\n					<section id=\"shopping-cart\">\n					<h1>Shopping Cart</h1>\n					{if \"{exp:cartthrob:total_items_count}\"==0}<p>You have no items in your cart. <a href=\"{path={template_group}}\">Continue shopping.</a></p>{/if}\n					\n					{exp:cartthrob:update_cart_form \n						class=\"form-horizontal\"\n						id=\"update_cart_form\"\n		        		return=\"{template_group}/{template}\"}\n						{exp:cartthrob:cart_items_info}\n						<div class=\"row\">\n							<div class=\"span5\">\n									<h3>{title}</h3>\n									<p>{language}</p>\n									<h4>{item_price} {if quantity > 1}<small> x {quantity} = {item_subtotal}</small>{/if}</h4>\n								\n									\n	 								{if no_tax !=\"1\"}<small>Price including tax {item_price:plus_tax} x {quantity} = {item_subtotal:plus_tax}</small>{/if}\n									{if is_package}\n										{!-- Since the item is a package, you can offer a method of updating the item options\n											for each item in the package. --}\n											<h4>Packaged Items</h4>\n										{package}\n											<h5>{sub:title} - {sub:entry_id} <small>{sub:price}</small></h5>\n\n											{exp:cartthrob:item_options row_id=\"{sub:row_id}\"}\n								                {if options_exist}\n													{if allow_selection}\n 														<div class=\"control-group\">\n											                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n																<div class=\"controls\">\n																	{select} \n																		<option {selected} value=\"{option_value}\">\n																			{option_name}{if option_price_numeric != 0} +{option_price}{/if}\n																		</option>\n																	{/select}													\n																</div>\n			 											</div>\n													{if:else}\n 														{options}{if selected}<h6>{option_label}: {option_name} {if option_price_numeric != 0} +{option_price}{/if}</h6>{/if}{/options}\n													{/if}\n								                {/if}\n 											{/exp:cartthrob:item_options}\n										{/package}\n									\n									{if:else}\n											{exp:cartthrob:item_options row_id=\"{row_id}\"}\n											<div class=\"control-group\">\n									            {if dynamic}\n									                <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n									                <div class=\"controls\">{input}</div>\n									            {if:else}\n									                {if options_exist}\n									                    <label class=\"control-label\" for=\"{option_field}\">{option_label}</label>\n													    <div class=\"controls\">\n									                    {select} \n									                        <option {selected} value=\"{option_value}\">\n									                            {option_name}{if option_price_numeric != 0} +{option_price}{/if}\n									                        </option>\n									                    {/select}\n														</div>\n									                {/if}\n									            {/if}\n											</div>\n									        {/exp:cartthrob:item_options}\n									{/if}\n								<div class=\"control-group\">\n							 		<label for=\"product_quantity\" class=\"control-label\">Quantity</label>\n								    <div class=\"controls\">\n										<input type=\"text\" id=\"product_quantity_{row_id}\" placeholder=\"1\" name=\"quantity[{row_id}]\" size=\"8\"  value=\"{quantity}\" /> \n									</div>\n			 					</div>\n\n\n								<div class=\"control-group\">\n									<div class=\"controls\">\n								      <label class=\"checkbox\">\n								        <input type=\"checkbox\" id=\"delete_this_{row_id}\" value=\"yes\" name=\"delete[{row_id}]\">\n										<span class=\"label\">Remove this item?</span> \n								      </label>\n								    </div>\n			 					</div>\n\n							</div>\n 							<div class=\"span2\">\n								{if product_thumbnail}\n								<div class=\"thumbnail\">\n									<a href=\"{entry_id_path=\'{template_group}/product_detail\'}\"><img src=\"{product_thumbnail}\" /></a>\n								</div>\n								{/if}\n							</div>\n						</div>\n							{if last_row}\n\n								<div class=\"control-group\">\n								    <div class=\"form-actions\">\n										<button type=\"submit\" value=\"{template_group}/view_cart\" name=\"return\" class=\"btn\">Update</button>\n								      	<button type=\"submit\" value=\"{template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\" name=\"return\" class=\"btn btn-primary\">Proceed to Checkout</button>\n									</div>\n								</div>\n							{/if}\n						{/exp:cartthrob:cart_items_info}\n					{/exp:cartthrob:update_cart_form}		\n 					</section>\n				</div>\n		</div>\n	</div>\n\n 	\n','',1471463321,16,'n',0,'','n','n','o',0,'n'),
	(131,1,11,'cart','y','webpage','{exp:channel:entries channel=\"products_manual\" limit=\"1\"}\n<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n{sn:global_html-header}\n<body class=\"style-10\">\n\n    <!-- LOADER -->\n    <div id=\"loader-wrapper\">\n        <div class=\"bubbles\">\n            <div class=\"title\">loading</div>\n            <span></span>\n            <span id=\"bubble2\"></span>\n            <span id=\"bubble3\"></span>\n        </div>\n    </div>\n\n    <div id=\"content-block\">\n\n        <div class=\"content-center fixed-header-margin\">\n            <!-- HEADER -->\n            {sn:global_header}\n\n             <div class=\"content-push\">\n\n                <div class=\"breadcrumb-box\">\n                    <a href=\"#\">Home</a>\n                    <a href=\"#\">Shop</a>\n                    <a href=\"#\">Shopping Cart</a>\n                </div>\n\n                <div class=\"information-blocks\">\n                    <div class=\"row\">\n                        <div class=\"col-sm-9 information-entry\">\n                            <h3 class=\"cart-column-title size-1\">Products</h3>\n                            <div class=\"traditional-cart-entry style-1\">\n                                <a class=\"image\" href=\"#\"><img alt=\"\" src=\"img/product-minimal-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a class=\"tag\" href=\"#\">woman clothing</a>\n                                        <a class=\"title\" href=\"#\">Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"inline-description\">S / Dirty Pink</div>\n                                        <div class=\"inline-description\">Zigzag Clothing</div>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                        <div class=\"quantity-selector detail-info-entry\">\n                                            <div class=\"detail-info-entry-title\">Quantity</div>\n                                            <div class=\"entry number-minus\">&nbsp;</div>\n                                            <div class=\"entry number\">10</div>\n                                            <div class=\"entry number-plus\">&nbsp;</div>\n                                            <a class=\"button style-17\">remove</a>\n                                            <a class=\"button style-15\">Update Cart</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"traditional-cart-entry style-1\">\n                                <a class=\"image\" href=\"#\"><img alt=\"\" src=\"img/product-minimal-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a class=\"tag\" href=\"#\">woman clothing</a>\n                                        <a class=\"title\" href=\"#\">Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"inline-description\">S / Dirty Pink</div>\n                                        <div class=\"inline-description\">Zigzag Clothing</div>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                        <div class=\"quantity-selector detail-info-entry\">\n                                            <div class=\"detail-info-entry-title\">Quantity</div>\n                                            <div class=\"entry number-minus\">&nbsp;</div>\n                                            <div class=\"entry number\">10</div>\n                                            <div class=\"entry number-plus\">&nbsp;</div>\n                                            <a class=\"button style-17\">remove</a>\n                                            <a class=\"button style-15\">Update Cart</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"traditional-cart-entry style-1\">\n                                <a class=\"image\" href=\"#\"><img alt=\"\" src=\"img/product-minimal-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a class=\"tag\" href=\"#\">woman clothing</a>\n                                        <a class=\"title\" href=\"#\">Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"inline-description\">S / Dirty Pink</div>\n                                        <div class=\"inline-description\">Zigzag Clothing</div>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                        <div class=\"quantity-selector detail-info-entry\">\n                                            <div class=\"detail-info-entry-title\">Quantity</div>\n                                            <div class=\"entry number-minus\">&nbsp;</div>\n                                            <div class=\"entry number\">10</div>\n                                            <div class=\"entry number-plus\">&nbsp;</div>\n                                            <a class=\"button style-17\">remove</a>\n                                            <a class=\"button style-15\">Update Cart</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n\n\n                            <div class=\"row\">\n                                <div class=\"information-entry col-md-6\">\n                                    <div class=\"sale-entry\">\n                                        <div class=\"hot-mark red\">hot</div>\n                                        <div class=\"sale-price\"><span>-40%</span> winter Sale</div>\n                                        <div class=\"sale-description\">Lorem ipsum dolor sit amet, consectetur adipisc elit, sed do</div>\n                                    </div>\n                                </div>\n                                <div class=\"information-entry col-md-6\">\n                                    <div class=\"sale-entry\">\n                                        <div class=\"hot-mark red\">hot</div>\n                                        <div class=\"sale-price\"><span>FREE</span> UK delivery</div>\n                                        <div class=\"sale-description\">Lorem ipsum dolor sit amet, consectetur adipisc elit, sed do</div>\n                                    </div>\n                                </div>\n                            </div>\n\n                        </div>\n                        <div class=\"col-sm-3 information-entry\">\n                            <h3 class=\"cart-column-title size-1\" style=\"text-align: center;\">Subtotal</h3>\n                            <div class=\"sidebar-subtotal\">\n                                <div class=\"price-data\">\n                                    <div class=\"main\">$129.99</div>\n                                    <div class=\"title\">Excluding tax &amp; shipping</div>\n                                    <div class=\"subtitle\">ORDERS WILL BE PROCESSED IN USD</div>\n                                </div>\n                                <div class=\"additional-data\">\n                                    <div class=\"title\"><span class=\"inline-label red\">Promotion</span> Additional Notes</div>\n                                    <textarea class=\"simple-field size-1\"></textarea>\n                                    <a class=\"button style-10\">Checkout</a>\n                                </div>\n                            </div>\n                            <div class=\"block-title size-1\">Get shipping estimates</div>\n                            <form>\n                                <label>Country</label>\n                                <div class=\"simple-drop-down simple-field size-1\">\n                                    <select>\n                                        <option>United States</option>\n                                        <option>Great Britain</option>\n                                        <option>Canada</option>\n                                    </select>\n                                </div>\n                                <label>State</label>\n                                <div class=\"simple-drop-down simple-field size-1\">\n                                    <select>\n                                        <option>Alabama</option>\n                                        <option>Alaska</option>\n                                        <option>Idaho</option>\n                                    </select>\n                                </div>\n                                <label>Zip Code</label>\n                                <input type=\"text\" value=\"\" placeholder=\"Zip Code\" class=\"simple-field size-1\">\n                                <div class=\"button style-16\" style=\"display: block; margin-top: 10px;\">calculate shipping<input type=\"submit\"/></div>\n                            </form>\n                        </div>\n                    </div>\n                </div>\n\n                <div class=\"information-blocks\">\n                    <div class=\"row\">\n                        <div class=\"col-sm-4 information-entry\">\n                            <h3 class=\"block-title inline-product-column-title\">Featured products</h3>\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-2.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-3.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n                        </div>\n                        <div class=\"col-sm-4 information-entry\">\n                            <h3 class=\"block-title inline-product-column-title\">Featured products</h3>\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-2.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-3.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n                        </div>\n                        <div class=\"col-sm-4 information-entry\">\n                            <h3 class=\"block-title inline-product-column-title\">Featured products</h3>\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-1.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-2.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n\n                            <div class=\"inline-product-entry\">\n                                <a href=\"#\" class=\"image\"><img alt=\"\" src=\"img/product-image-inline-3.jpg\"></a>\n                                <div class=\"content\">\n                                    <div class=\"cell-view\">\n                                        <a href=\"#\" class=\"title\">Ladies Pullover Batwing Sleeve Zigzag</a>\n                                        <div class=\"price\">\n                                            <div class=\"prev\">$199,99</div>\n                                            <div class=\"current\">$119,99</div>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class=\"clear\"></div>\n                            </div>\n                        </div>\n                    </div>\n                </div>                \n\n                <!-- FOOTER -->\n                <div class=\"footer-wrapper style-10\">\n                    <footer class=\"type-1\">\n                        <div class=\"footer-columns-entry\">\n                            <div class=\"row\">\n                                <div class=\"col-md-3\">\n                                    <img class=\"footer-logo\" src=\"img/logo-9.png\" alt=\"\" />\n                                    <div class=\"footer-description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</div>\n                                    <div class=\"footer-address\">30 South Avenue San Francisco<br/>\n                                        Phone: +78 123 456 789<br/>\n                                        Email: <a href=\"mailto:Support@blanco.com\">Support@blanco.com</a><br/>\n                                        <a href=\"www.inmedio.com\"><b>www.inmedio.com</b></a>\n                                    </div>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"col-md-2 col-sm-4\">\n                                    <h3 class=\"column-title\">Our Services</h3>\n                                    <ul class=\"column\">\n                                        <li><a href=\"#\">About us</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                        <li><a href=\"#\">Custom Service</a></li>\n                                        <li><a href=\"#\">Terms &amp; Condition</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                    </ul>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"col-md-2 col-sm-4\">\n                                    <h3 class=\"column-title\">Our Services</h3>\n                                    <ul class=\"column\">\n                                        <li><a href=\"#\">About us</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                        <li><a href=\"#\">Custom Service</a></li>\n                                        <li><a href=\"#\">Terms &amp; Condition</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                    </ul>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"col-md-2 col-sm-4\">\n                                    <h3 class=\"column-title\">Our Services</h3>\n                                    <ul class=\"column\">\n                                        <li><a href=\"#\">About us</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                        <li><a href=\"#\">Custom Service</a></li>\n                                        <li><a href=\"#\">Terms &amp; Condition</a></li>\n                                        <li><a href=\"#\">Order History</a></li>\n                                        <li><a href=\"#\">Returns</a></li>\n                                    </ul>\n                                    <div class=\"clear\"></div>\n                                </div>\n                                <div class=\"clearfix visible-sm-block\"></div>\n                                <div class=\"col-md-3\">\n                                    <h3 class=\"column-title\">Company working hours</h3>\n                                    <div class=\"footer-description\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</div>\n                                    <div class=\"footer-description\">\n                                        <b>Monday-Friday:</b> 8.30 a.m. - 5.30 p.m.<br/>\n                                        <b>Saturday:</b> 9.00 a.m. - 2.00 p.m.<br/>\n                                        <b>Sunday:</b> Closed\n                                    </div>\n                                    <div class=\"clear\"></div>\n                                </div>\n                            </div>\n                        </div>\n                        <div class=\"footer-bottom-navigation\">\n                            <div class=\"cell-view\">\n                                <div class=\"footer-links\">\n                                    <a href=\"#\">Site Map</a>\n                                    <a href=\"#\">Search</a>\n                                    <a href=\"#\">Terms</a>\n                                    <a href=\"#\">Advanced Search</a>\n                                    <a href=\"#\">Orders and Returns</a>\n                                    <a href=\"#\">Contact Us</a>\n                                </div>\n                                <div class=\"copyright\">Created with by <a href=\"#\">8theme</a>. All right reserved</div>\n                            </div>\n                            <div class=\"cell-view\">\n                                <div class=\"payment-methods\">\n                                    <a href=\"#\"><img src=\"img/payment-method-1.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-2.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-3.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-4.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-5.png\" alt=\"\" /></a>\n                                    <a href=\"#\"><img src=\"img/payment-method-6.png\" alt=\"\" /></a>\n                                </div>\n                            </div>\n                        </div>\n                    </footer>\n                </div>\n            </div>\n\n        </div>\n        <div class=\"clear\"></div>\n\n    </div>\n    \n  \n        \n        \n        <!-- FOOTER -->\n        {sn:global_footer}\n\n        {sn:global_search}\n    \n        {sn:global_cart}\n         \n        {sn:global_html-footer}\n        \n       {/exp:channel:entries}',NULL,1471463879,16,'n',0,'','n','n','o',0,'n'),
	(49,1,8,'_also_purchased','y','webpage','	{exp:cartthrob:also_purchased entry_id=\"{embed:entry_id}\" limit=\"7\"}\n		{if count==1}\n 		<h5>Customers Also Purchased</h5>\n		<ul  class=\"nav nav-tabs nav-stacked\">\n		{/if}\n		<li>\n			<a href=\"{entry_id_path=\'{embed:template_group}/product_detail\'}\">\n				<i class=\"icon-chevron-right pull-right\"></i>\n				{title} \n				<strong> {if product_price}{product_price}{if:elseif packages_price}{packages_price}{/if}</strong>\n				{if no_tax !=\"Yes\"} \n					 {if \"{product_price:plus_tax}\" !=\"\"}<small><br>(inc tax: {product_price:plus_tax})</small>{/if}\n				{if:elseif packages_price}\n					<br>{packages_price:plus_tax}\n				{/if}\n			</a>\n		</li>\n		{if count==total_results}\n		</ul>\n 		{/if}\n	{/exp:cartthrob:also_purchased}\n\n	{exp:channel:entries channel=\"products\" limit=\"1\" entry_id=\"{embed:entry_id}\" }\n	{!-- new relationship syntax for EE 2.6+ --}\n	{product_related_1}\n			{if product_related_1:count==1}\n				<h5>You Might Also Like</h5>\n				<ul  class=\"nav nav-tabs nav-stacked\">\n			{/if}\n			<li>\n				{if product_related_1:product_price}\n					<a href=\"{product_related_1:entry_id_path=\'{embed:template_group}/product_detail\'}\">\n						<i class=\"icon-chevron-right\"></i>\n						{if product_related_1:product_thumbnail}<img src=\"{product_related_1:product_thumbnail}\" />{/if}\n						{product_related_1:title}<br />\n						{product_related_1:product_price} &raquo;\n					</a>\n				{if:elseif product_related_1:packages_price}\n					<a href=\"{product_related_1:entry_id_path=\'{embed:template_group}/package_detail\'}\">\n						<i class=\"icon-chevron-right\"></i>\n						{if product_related_1:packages_thumbnail}<img src=\"{product_related_1:packages_thumbnail}\" />{/if}\n						{product_related_1:title}<br />\n						{product_related_1:packages_price} &raquo;\n					</a>\n				{/if}\n			</li>\n			{if product_related_1:count==product_related_1:total_results}\n				</ul>\n			{/if}\n	{/product_related_1}\n	{!-- end new relationship syntax --}	\n	\n	{!-- Below is the old relationship method for use with versions less than EE2.5 --}\n	{!-- start old syntax\n	{if product_related_1 OR product_related_2 OR product_related_3}\n 		<h5>You Might Also Like</h5>\n		<ul  class=\"nav nav-tabs nav-stacked\">\n	{/if}\n	{related_entries id=\"product_related_1\"}\n		<li>\n			<a href=\"{entry_id_path=\'{embed:template_group}/product_detail\'}\">\n				<i class=\"icon-chevron-right\"></i>\n				<img src=\"{product_thumbnail}\" />\n				{title}<br />\n				{if product_price}{product_price}{if:elseif packages_price}{packages_price}{/if} &raquo;\n			</a>\n		</li>\n	{/related_entries}\n\n	{related_entries id=\"product_related_2\"}\n		<li>\n			<a href=\"{entry_id_path=\'{embed:template_group}/product_detail\'}\">\n				<i class=\"icon-chevron-right\"></i>\n				<img src=\"{product_thumbnail}\" />\n				{title}<br />\n				{if product_price}{product_price}{if:elseif packages_price}{packages_price}{/if} &raquo;\n			</a>\n		</li>\n	{/related_entries}\n	\n	{related_entries id=\"product_related_3\"}\n		<li>\n			<a href=\"{entry_id_path=\'{embed:template_group}/product_detail\'}\">\n				<i class=\"icon-chevron-right\"></i>\n				<img src=\"{product_thumbnail}\" />\n				{title}<br />\n				{if product_price}{product_price}{if:elseif packages_price}{packages_price}{/if} &raquo;\n			</a>\n		</li>\n	{/related_entries}\n	\n	{if product_related_1 OR product_related_2 OR product_related_3}\n			</ul>\n 	{/if}	\n	end old syntax --}\n{/exp:channel:entries}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(50,1,8,'_footer','y','webpage','	<!-- Footer\n	================================================== -->\n	<footer class=\"footer\">\n	  <div class=\"container\">\n	    <p class=\"pull-right\"><a href=\"#\">Back to top</a></p>\n\n	    <p>&copy;{current_time format=\"%Y\"} {exp:cartthrob:view_setting store_name=\"yes\"}</p>\n		<p>powered by <a href=\"http://cartthrob.com\">CartThrob eCommerce</a></p>\n	\n	    <ul class=\"footer-links\">\n		  <li><a href=\'{site_url}\'>Home</a></li>\n	      <li class=\"muted\">&middot;</li>\n	      <li><a href=\"{path=\'{embed:template_group}/privacy_policy\'}\">Privacy Policy</a></li>\n	      <li class=\"muted\">&middot;</li>\n	      <li><a href=\"{path=\'{embed:template_group}/return_policy\'}\">Return Policy</a></li>\n	      <li class=\"muted\">&middot;</li>\n		  <li><a href=\"{path=\'{embed:template_group}/about\'}\">About Us</a></li>\n	    </ul>\n	  </div>\n	</footer>\n	\n	{!-- this form is used for hidden ajax submissions by CartThrob. D--}\n	<div style=\"display:none\" id=\"hidden_save_customer_info_form_wrapper\">\n		{!-- Data input in other forms is copied to this form, and submitted \n			if debug is turned on in the javascript file, this form should be automatically shown.\n			--}\n		{exp:cartthrob:save_customer_info_form return=\"\" id=\"hidden_save_customer_info_form\" }\n			<div class=\"cart_data\">\n\n			</div>\n		<input type=\"submit\" name=\"Submit\" /> \n		{/exp:cartthrob:save_customer_info_form}\n	</div>\n\n\n<div class=\"modal hide fade\" id=\"login\">\n		{exp:member:login_form return=\"{path={segment_1}/{segment_2}/{segment_3}/{segment_4}}\" class=\"form-horizontal\"}\n	<div class=\"modal-header\">\n		<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n		<h3>Login</h3>\n	</div>\n	<div class=\"modal-body\">\n		<label>Username</label> <input type=\"text\" class=\'input-medium\' name=\"username\" value=\"\" placeholder=\'Username\' /> \n		<label>Password</label> <input type=\"password\" class=\'input-medium\' name=\"password\" value=\"\" placeholder=\"Password\"   /> \n	</div>\n	<div class=\"modal-footer\">\n		<a href=\"#\" class=\"btn\">Close</a>\n		<input type=\"submit\" name=\"submit\" value=\"Login\" class=\"btn btn-primary\" /> \n	</div>\n	{/exp:member:login_form}\n</div>	\n\n{!-- if you\'ve set the google analytics code in the backend, this will output the google analytics tag --}\n{if \'{exp:cartthrob:view_setting store_google_code=\"yes\"}\'!=\'\'}\n<script type=\"text/javascript\">\n\n  var _gaq = _gaq || [];\n  _gaq.push([\'_setAccount\', \'{exp:cartthrob:view_setting store_google_code=\"yes\"}\']);\n  _gaq.push([\'_trackPageview\']);\n\n  (function() {\n    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;\n    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';\n    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);\n  })();\n\n</script>\n{/if}\n</body>\n</html>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(51,1,8,'_header','y','webpage','{!-- we\'re setting the doctype specifically like this so that we can use Twitter Bootstrap.\nhttp://twitter.github.com/bootstrap/scaffolding.html#global\n --}\n<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n	<meta charset=\"UTF-8\">\n	<title>{embed:title} - {site_name}</title>\n\n	{!-- ///////// SAMPLE TEMPLATE //////////////// --}\n	{!-- CT ajax uses jQuery. Include your own or EE\'s included version --}\n	{exp:jquery:script_tag}\n	{!-- CT uses jQuery form for ajax form submissions --}\n	<script type=\"text/javascript\" src=\"{theme_folder_url}third_party/cartthrob/scripts/jquery.form.js\" ></script>\n	{!-- CT sample templates  form for ajax form submissions --}\n	<script type=\"text/javascript\" src=\"{path=\'{embed:template_group}/cart.js\'}\" ></script>\n\n\n	{!-- CT template CSS files --}\n	<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"{stylesheet={embed:template_group}/main.css}\" />\n    \n	{!-- ///////// TWITTER BOOSTRAP //////////////// --}\n	{!-- http://twitter.github.com/bootstrap/getting-started.html --}\n\n	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n	\n	{!-- Twitter Boostrap CSS files. The sample templates use Twitter Bootstrap for layout, styles and some JS functionality. --}\n	<link href=\"{theme_folder_url}third_party/cartthrob/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\">\n	\n	{!-- NOTE: if you don\'t like things to move around on the page, comment this out. This enables responsive layout, \n		and the contents of the page flow to fit the viewport --}\n	<link href=\"{theme_folder_url}third_party/cartthrob/bootstrap/css/bootstrap-responsive.css\" rel=\"stylesheet\">\n<script type=\"text/javascript\" src=\"{theme_folder_url}third_party/cartthrob/bootstrap/js/bootstrap.js\" ></script>\n\n	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->\n	<!--[if lt IE 9]>\n	  <script src=\"http://html5shim.googlecode.com/svn/trunk/html5.js\"></script>\n	<![endif]-->\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(52,1,8,'_invoice','y','webpage','{!--This template is embedded so that we can decrypt and pass the invoice ID to it so that it can be viewed offline --}\n\n{exp:channel:entries channel=\"orders\" limit=\"1\" status=\"not none\" dynamic=\"no\" entry_id=\"{embed:entry_id}\" parse_inward=\"yes\" show_future_entries=\"yes\" }\n{if no_results}This invoice could not be found{/if}\n{!-- invoice template  Add your store information somewhere on this invoice! --}\n		<table width=\"600\" cellpadding=\"5\" cellspacing=\"0\">\n			<tr>\n				<td valign=\"top\" align=\"left\" style=\"font-size:12px;color:#000000;font-family:arial, sans-serif;\"><br>\n					<p> <span style=\"font-size:16px;font-weight:bold;\">INVOICE</span> </p>\n					<table cellspacing=\"0\" cellpadding=\"2\" bgcolor=\"#000000\" width=\"100%\">\n						<tr>\n							<td><span style=\"color:#ffffff;font-size:14px;\">Order Data</span></td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px;font-weight:bold;\">Order Date: </span> \n								<span style=\"font-size:12px;\">{entry_date format=\"%M %D %Y\"}</span>\n							</td>\n						</tr>\n					</table>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td valign=\"top\">\n								<span style=\"font-size:12px; font-weight:bold;\">Order ID: </span> \n								<span style=\"font-size:12px;\">{title}</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td width=\"250\" valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold; \">Billing</span><br>\n								<span style=\"font-size:12px; \">   \n									{order_billing_first_name} {order_billing_last_name}<br>\n									{order_billing_address}<br>\n									{if order_billing_address2}{order_billing_address2}<br>{/if}\n									{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n									{if order_country_code}{order_country_code}<br>{/if}\n									{order_customer_email}<br>\n									{order_customer_phone}\n								</span>\n							</td>\n							<td valign=\"top\">\n								<span style=\"font-size:14px; font-weight:bold;\">Shipping</span><br>\n								<span style=\"font-size:12px; \">   \n									{if order_shipping_address}\n										{order_shipping_first_name} {order_shipping_last_name}<br>\n										{order_shipping_address}<br>\n										{if order_shipping_address2}{order_shipping_address2}<br>{/if}\n										{order_shipping_city}, {order_shipping_state} {order_shipping_zip}\n										{if order_shipping_country_code}{order_shipping_country_code}{/if}\n									{if:else}\n										{order_billing_first_name} {order_billing_last_name}<br>\n										{order_billing_address}<br>\n										{if order_billing_address2}{order_billing_address2}<br>{/if}\n										{order_billing_city}, {order_billing_state} {order_billing_zip}<br>\n										{if order_country_code}{order_country_code}<br>{/if}\n										{order_customer_email}<br>\n										{order_customer_phone}\n									{/if}\n								</span>\n							</td>\n						</tr>\n					</table>\n					<hr>\n\n					<p>Total number of purchased items: {order_items:total_results}.</p>\n					<table cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n						<thead>\n							<tr>\n								<td><span style=\"font-size:12px;font-weight:bold;\">ID</span></td>\n								<td><span style=\"font-size:12px;font-weight:bold;\">Description</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Qty</span></td>\n								<td align=\"center\">&nbsp;</td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Price</span></td>\n								<td align=\"right\"><span style=\"font-size:12px;font-weight:bold;\">Item Total</span></td>\n								<td align=\"center\">&nbsp;</td>\n							</tr>\n						</thead>\n						<tbody>\n							{exp:cartthrob:order_items order_id=\"{entry_id}\" }\n								<tr class=\"{item:switch=\"odd|even\"}\">\n									<td><span style=\"font-size:12px;\">{item:entry_id}</span></td>\n									<td><span style=\"font-size:12px;\">\n										{item:title}\n										{if is_package}\n											<p>\n 											<span style=\"font-size:9px;\">\n											{packages}\n												{sub:title}<br /> \n											{/packages}\n											</span>\n											</p>\n										{/if}\n										</span></td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:quantity}</span></td>\n									<td align=\"center\">&nbsp;</td>\n									<td align=\"right\"><span style=\"font-size:12px;\">{item:price}<br />(w/ tax: {item:price_plus_tax})</span></td>\n									<td align=\"right\">\n										<span style=\"font-size:12px;\">\n											{item:subtotal}<br />(w/ tax: {item:subtotal_plus_tax})\n										</span>\n									</td>\n									<td align=\"right\">\n										{if item:product_download_url}\n										<span style=\"font-size:12px;\"><a href=\"{exp:cartthrob:get_download_link field=\'product_download_url\' entry_id=\'{item:entry_id}\'}\">Download</a></span>\n										{/if}\n									</td>\n								</tr>\n							{/exp:cartthrob:order_items}\n							<tr>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td colspan=\"3\">&nbsp;</td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n								<td><span style=\"font-size:12px;\">&nbsp;</span></td>\n							</tr>\n						</tbody>\n					</table>\n					<hr>\n					<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n						<tr>\n							<td align=\"right\">\n								<table cellspacing=\"0\" cellpadding=\"2\">\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Shipping:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_shipping}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">Tax:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\">{order_tax}</span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\">&nbsp;</td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:12px;\"></span></td>\n									</tr>\n									<tr>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">Total:</span></td>\n										<td valign=\"top\" align=\"right\"></td>\n										<td valign=\"top\" align=\"right\"><span style=\"font-size:14px;font-weight:bold;\">{order_total}</span></td>\n									</tr>\n								</table>\n							</td>\n						</tr>\n					</table>\n				</td>\n			</tr>\n		</table>\n	{/exp:channel:entries}\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(53,1,8,'_leftnav','y','webpage','<!-- Left nav\n================================================== -->\n		<ul class=\"nav nav-list\">\n		<li>						\n			<a href=\"{path=\"{embed:template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\"}\">\n				<strong>Total</strong>\n			<span class=\"sale_price pull-right\"><span class=\"cart_total\">{exp:cartthrob:cart_total}</span></span>\n			</a>\n		</li>\n		<li>\n			<a href=\"{path=\"{embed:template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\"}\">\n			<small><strong>Subtotal</strong></small>\n			<span class=\"cart_subtotal pull-right\">{exp:cartthrob:cart_subtotal}</span>\n			</a>\n		</li>\n		<li>\n			<a href=\"{path=\"{embed:template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\"}\">\n			<small><strong>Shipping</strong></small>\n			<span class=\"cart_shipping pull-right\">{exp:cartthrob:cart_shipping}</span>\n			</a>\n		\n		</li>\n		<li>\n			<a href=\"{path=\"{embed:template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\"}\">\n			<small><strong>Tax</strong></small>\n			<span class=\"cart_tax pull-right\">{exp:cartthrob:cart_tax}</span>\n			</a>\n		</li>\n		<li>\n			<a href=\"{path=\"{embed:template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\"}\">\n			<small><strong>Discount</strong></small>\n			<span class=\"cart_discount pull-right\">{exp:cartthrob:cart_discount}</span>\n			</a>\n		</li>\n		<li>\n			<a href=\"{path=\'{embed:template_group}/view_cart\'}\">\n			<i class=\"icon-shopping-cart\"></i> <small><strong>View Cart</strong></small> <span class=\"badge badge-info\">{exp:cartthrob:total_items_count}</span> \n 			</a>\n		\n		</li>\n		\n 		</ul>\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(54,1,8,'_navbar','y','webpage','<!-- Navbar\n================================================== -->\n<div class=\"navbar navbar-inverse navbar-fixed-top\">\n  <div class=\"navbar-inner\">\n    <div class=\"container\">\n      <button type=\"button\" class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".nav-collapse\">\n        <span class=\"icon-bar\"></span>\n        <span class=\"icon-bar\"></span>\n        <span class=\"icon-bar\"></span>\n      </button>\n      <a class=\"brand\" href=\"{site_url}\">{exp:cartthrob:view_setting store_name=\'yes\'}</a>\n      <div class=\"nav-collapse collapse\" style=\"height: 0px\" >\n        <ul class=\"nav\">\n          <li {if segment_2==\"\"}class=\"active\"{if:else}class=\'\'{/if} >\n            <a href=\"{path=\'{embed:template_group}/\'}\">Store</a>\n          </li>\n          <li {if segment_2==\"about\"}class=\"active\"{if:else}class=\'\'{/if} >\n            <a href=\"{path=\'{embed:template_group}/about\'}\">About Us</a>\n          </li>\n          <li  {if segment_2==\"contact\"}class=\"active\"{if:else}class=\'\'{/if} >\n            <a href=\"{path=\'{embed:template_group}/contact\'}\">Contact</a>\n          </li>\n          <li  {if segment_2==\"donate\"}class=\"active\"{if:else}class=\'\'{/if} >\n            <a href=\"{path=\'{embed:template_group}/donate\'}\">Donate</a>\n          </li>\n          <li  {if segment_2==\"view_cart\"}class=\"active\"{if:else}class=\'\'{/if} ><a href=\"{path=\'{embed:template_group}/view_cart\'}\"><i class=\"icon-shopping-cart icon-white\"></i> Cart ({exp:cartthrob:total_items_count}) <span class=\"cart_total\">{exp:cartthrob:cart_total}</span></a>\n          </li>\n          <li  {if segment_2==\"checkout\" OR segment_2==\"shipping\"}class=\"active\"{if:else}class=\'\'{/if}  ><a href=\"{path=\'{embed:template_group}/{exp:cartthrob:view_setting store_checkout_page=\'yes\'}\'}\"><i class=\"icon-barcode icon-white\" ></i> Checkout</a>\n          </li>\n		{if logged_out}\n		<li  {if segment_2==\"register\"}class=\"active\"{if:else}class=\'\'{/if} ><a href=\"{path=\'member/register\'}\"><i class=\"icon-user icon-white\" ></i> Create an Account</a>\n        </li>\n		<li  {if segment_2==\"login\"}class=\"active\"{if:else}class=\'\'{/if} ><a href=\"#login\" role=\"button\" data-toggle=\"modal\" id=\"login_loader\"><i class=\"icon-ok icon-white\" ></i> Login</a>\n          </li>\n		{/if}\n		{if logged_in}\n		<li  {if segment_2==\"account\"}class=\"active\"{if:else}class=\'\'{/if} ><a href=\"{path=\'{embed:template_group}/account\'}\"><i class=\"icon-user icon-white\" ></i> Welcome {screen_name}</a>\n        </li>\n		<li class=\'\'><a href=\"{path=\'LOGOUT\'}\"><i class=\"icon-remove icon-white\" ></i> Logout</a>\n          </li>\n		{/if}\n        </ul>\n      </div>\n    </div>\n  </div>\n</div>\n \n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(55,1,8,'_subhead','y','webpage','<!-- Subhead\n================================================== -->\n<header class=\"jumbotron subhead\" id=\"overview\">\n  <div class=\"container\">\n    <h1>{exp:cartthrob:view_setting store_name=\'yes\'}</h1>\n    <p class=\"lead\">{exp:cartthrob:view_setting store_description=\'yes\'}</p>\n  </div>\n</header>\n','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(56,1,9,'donations','y','webpage','{preload_replace:template_group=\"cart_examples\"}\n{preload_replace:template=\"donations\"}\n{embed=cart_examples/include_header title=\"Taking Donations\" }\n</head>\n<body>\n	\n	<h1>Taking Donations</h1>\n	<p>This page shows an example of how to take donations of any amount</p>\n\n	{!-- ADD A PRODUCT --}\n    <div class=\"store_block\">\n	<h2>Make a Donation</h2>\n{!-- \n	This \"product\" is created on the fly. The parameters below all relate to \n	adding products to the cart that aren\'t stored in a channel\n	\n	parameters\n	return: the redirect location\n	allow_user_price: allows the user to set a price. If not set, user price is ignored for security\'s sake \n	title: adds a title to this dynamic product\n	no_shipping: controls whether shipping is applied to this product\n	no_tax: controls whether tax is applied\n	on_the_fly: creates a dynamic product \n--}\n	{exp:cartthrob:add_to_cart_form \n	    return=\"{template_group}/{template}\" \n		allow_user_price=\"yes\"\n		title=\"Donation\"\n		no_shipping=\"yes\"\n		no_tax=\"yes\"\n	    on_the_fly=\"true\"  \n		}\n		<p>\n			Donation Amount:  <input type=\"text\" maxlength=\"7\" size=\"5\" name=\"price\"> \n			\n			{!-- Adding a personal_message to the donation. No field called personal_message exists,\n				but if you are using the \"Cartthrob Order Items\" custom field type in your Orders channel... \n				this message will still be dynamically added to the order data. \n				See the add_to_cart_form documentation for more details\n				 --}\n			Donation Note: {item_options:input:personal_message value=\"\" }<br />\n		</p>\n	    <input type=\"submit\" value=\"Submit\" />\n	{/exp:cartthrob:add_to_cart_form}\n	</div>\n\n	{embed=\"cart_examples/include_view_cart\" template_group=\"{template_group}\" template=\"{template}\" }\n\n	<div class=\"store_block\">\n		<h2>Tags used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/add_to_cart_form\">add_to_cart_form</a></li>\n		</ul>\n		\n		<h2>Concepts used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/sub_pages/purchased_items_overview\">Purchased Items channel</a></li>\n			<li><a href=\"http://cartthrob.com/docs/sub_pages/orders_overview\">Orders channel</a></li>\n		</ul>\n	</div>\n	<div class=\"store_block\">\n		{embed=cart_examples/include_footer}\n	</div>\n\n</body>\n</html>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(57,1,9,'register_at_checkout','y','webpage','{preload_replace:template_group=\"cart_examples\"}\n{preload_replace:template=\"register_at_checkout\"}\n{embed=cart_examples/include_header title=\"Create Member During Checkout\" }\n</head>\n<body>\n	<h1>Create Member At Checkout</h1>\n	<p>Use this form to create a member during checkout. \n		Please review the standard checkout_form first for additional details</p>\n	{if segment_3 !=\"order_complete\"}\n		{!-- CHECKOUT --}\n		<div class=\"store_block\">\n		<h2>Checkout</h2>\n		{!-- \n			parameters\n			\n			group_id: the group_id you would like to add your customer to.\n			Any group_ids lower than 5 are automatically changed to 5 for security purposes. \n			Leaving this value blank in conjunction with create_user, will make new users part of the \"member\" group (5).\n			create_user: whether a user should be created or not. \n			--}\n		{if logged_out}\n			{exp:cartthrob:checkout_form \n				group_id=\"6\"\n				create_user=\"TRUE\"\n				return=\"{template_group}/{template}/order_complete\"}\n\n				{gateway_fields}\n			\n				{!-- In addition to the standard gateway fields, \n					you will need the following fields to create a user during checkout.\n					--}\n					<p>	\n						Username: 								\n						<input type=\"text\" name=\"username\" />									\n					</p>\n					<p>									\n						Screen Name: <input type=\"text\" name=\"screen_name\" />\n					</p>									\n					<p>\n						Password: \n						<input type=\"password\" name=\"password\" />\n						<input type=\"password\" name=\"password_confirm\" />\n					</p>									\n					<p>\n						Email: \n						<input type=\"text\" name=\"email_address\" />\n					</p>	\n				<input type=\"submit\" value=\"Checkout\" />\n			{/exp:cartthrob:checkout_form}\n		{if:else}\n			You are logged in as {screen_name}\n			{exp:cartthrob:checkout_form \n				return=\"{template_group}/{template}/order_complete\"}\n\n				{gateway_fields}\n			\n				<input type=\"submit\" value=\"Checkout\" />\n			{/exp:cartthrob:checkout_form}\n		{/if}\n		</div>\n	{if:else}\n\n		{exp:cartthrob:submitted_order_info}\n		    <div class=\"store_block\">\n				{if authorized}\n					Your transaction is complete!<br />\n			        Transaction ID: {transaction_id}<br />\n			        Your total: {cart_total}<br />\n			        Your order ID: {order_id}\n			    {if:elseif processing}\n					Your transaction is being processed!<br />\n			        Transaction ID: {transaction_id}<br />\n			        Your total: {cart_total}<br />\n			        Your order ID: {order_id}\n			    {if:elseif declined}\n			        Your credit card was declined: {error_message}\n			    {if:elseif failed}\n			        Your payment failed: {error_message}\n			    {if:else}\n			        Your payment failed: {error_message}\n			    {/if}\n			</div>\n		{/exp:cartthrob:submitted_order_info}\n	{/if}\n\n	<div class=\"store_block\">\n		<h2>Tags used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/checkout_form\">checkout_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/submitted_order_info\">submitted_order_info</a></li>\n		</ul>\n	</div>\n	\n	<div class=\"store_block\">\n		{embed=cart_examples/include_footer}\n	</div>\n</body>\n</html>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(58,1,9,'single_page_checkout','y','webpage','{preload_replace:template_group=\"cart_examples\"}\n{preload_replace:template=\"single_page_checkout\"}\n{embed=cart_examples/include_header title=\"Single Page Store\" }\n</head>\n<body>\n \n	<h1>Single Page Store</h1>\n	<p>This single page is an example of how you can use one page to add, update, and delete items, as well as checkout. \n		This is the most in depth single page sample \n	\n	</p>\n 	\n	{!-- ORDER COMPLETE MESSAGES --}\n	{!-- the submitted_order_info tag outputs information from the last attempted order.\n		Even if the customer leaves this page and returns, the information from the customer\'s \n		last attempted purchase will be output. \n		 --}\n	{exp:cartthrob:submitted_order_info}\n	    <div class=\"store_block\">\n			{if authorized}\n			{!-- This content displays if the purchase was successful--}\n				Your transaction is complete!<br />\n		        Transaction ID: {transaction_id}<br />\n		        Your total: {cart_total}<br />\n		        Your order ID: {order_id}\n			{!-- This content displays if the purchase is only partly completed--}\n		    {if:elseif processing}\n				Your transaction is being processed!<br />\n		        Transaction ID: {transaction_id}<br />\n		        Your total: {cart_total}<br />\n		        Your order ID: {order_id}\n		    {if:elseif declined}\n			{!-- This content displays if the purchase was declined--}\n		        Your credit card was declined: {error_message}\n		    {if:elseif failed}\n			{!-- This content displays if the purchase completely fails--}\n		        Your payment failed: {error_message}\n		    {/if}\n		</div>\n	{/exp:cartthrob:submitted_order_info}\n\n	{!-- ADD A PRODUCT --}\n    <div class=\"store_block\">\n	<h2>Add Products</h2>\n	{!-- outputting products stored in one of the \"products\" channels. \n		Product channels are no different than standard channels. --}\n	{exp:channel:entries channel=\"products\" limit=\"10\"}\n 		{!-- \n			 The add_to_cart_form adds 1 or more of a product to the cart\n\n			parameters\n			return: the page the customer will be redirected to after adding this item to the cart\n			entry_id: the product\'s entry_id\n		--}\n		\n		{exp:cartthrob:add_to_cart_form \n			entry_id=\"{entry_id}\" \n			return=\"{template_group}/{template}\"}\n			<p>\n				Product name: {title} Price: {product_price}<br />\n				Quantity: <input type=\"text\" name=\"quantity\" size=\"5\" value=\"\" /> \n				<br />\n				<input type=\"submit\" value=\"Add to Cart\">\n			</p>\n		{/exp:cartthrob:add_to_cart_form}\n	{/exp:channel:entries}\n	</div>\n\n	{!-- VIEW CART CONTENTS / UPDATE QUANTITIES --}\n	<div class=\"store_block\">\n	<h2>Cart Contents</h2>\n \n	{!-- cart_items_info outputs information about your current cart, including products in the cart, weight, and prices. \n		you can combine this with update_cart_form, to output cart item data, and update cart info\n		--}\n		{exp:cartthrob:cart_items_info}\n 		\n			{if no_results}\n			    <p>There is nothing in your cart</p>\n			{/if}\n		{!-- outputting content that\'s only applicable for the first item. --}\n		{if first_row}\n			{!-- adding an update_cart_form to the first row. --}\n			{!-- update_cart_form allows you to edit the information of one or more items in the cart at the same time\n				as well as save customer information, and shipping options. --}\n			{exp:cartthrob:update_cart_form \n				return=\"{template_group}/{template}\"}\n		\n			<h3>Customer Info</h3>\n			{!-- customer_info outputs customer info that is current stored in session.\n				update_cart_form, checkout_form, save_customer_info form and other forms\n				can all save customer data.\n				 --}\n				\n			{exp:cartthrob:customer_info}\n				First Name: <input type=\"text\" name=\"first_name\" value=\"{customer_first_name}\" /><br />\n				Last Name: <input type=\"text\" name=\"last_name\" value=\"{customer_last_name}\" /><br />\n				Email Address:	<input type=\"text\" name=\"email_address\" value=\"{customer_email_address}\" /><br />\n				State: <input type=\"text\" name=\"state\" value=\"{customer_state}\" /><br />\n				Country: <input type=\"text\" name=\"country_code\" value=\"{customer_country_code}\" /><br />\n				Zip: <input type=\"text\" name=\"zip\" value=\"{customer_zip}\" /><br />\n			{/exp:cartthrob:customer_info}\n		    <table>\n		        <thead>\n		            <tr>\n		                <td>Item</td>\n		                <td colspan=\"2\">Quantity</td>\n		            </tr>\n		        </thead>\n		        <tbody>\n				{/if}\n		        <tr>\n	                <td>{title}</td>\n	                <td>\n						{!-- you can reference products by entry_id and row_id. If you sell configurable \n							items (like t-shirts with multiple sizes) you should use row_id to edit and \n							delete items, otherwise, all items with that entry id\n							are affected, regardless of configuration --}\n                       	<input type=\"text\" name=\"quantity[{row_id}]\" size=\"2\" value=\"{quantity}\" />\n	                </td>\n	                <td>\n						{!-- This deletes one item (row_id) at a time--}\n						<input type=\"checkbox\" name=\"delete[{row_id}]\"> Delete this item\n	                </td>\n	            </tr>\n				{if last_row}\n				{!-- outputting content that\'s only applicable for the last item. --}\n		            <tr>\n		                <td>\n							{!-- these are just some of the variables available within the cart_items_info tag --}\n		                    <p>\n								Subtotal: {cart_subtotal}<br />\n			                    Shipping: {cart_shipping}<br />\n			                    Tax: {cart_tax}<br /> \n								{!--tax is updated based on user\'s location. To create a default tax price, set a default tax region in the backend --}\n								Shipping Option: {shipping_option}<br />\n								Tax Name: {cart_tax_name}<br />\n								Tax %: {cart_tax_rate}<br />\n 								Discount: {cart_discount}<br />\n			                    <strong>Total: {cart_total}</strong>\n							</p>\n							<p>\n								{!-- total quantity of all items in cart --}\n								Total Items: {exp:cartthrob:total_items_count}<br />\n								{!-- total items in cart --}\n								Total Unique Items: {exp:cartthrob:unique_items_count}\n							</p>\n		                </td>\n		                <td colspan=\"2\">&nbsp;</td>\n		            </tr>\n		        </tbody>\n		    </table>\n			<input type=\"submit\" value=\"Update Cart\" />\n			{/exp:cartthrob:update_cart_form}\n		{/if}\n	{/exp:cartthrob:cart_items_info}\n	</div>\n\n	{!-- ADD COUPON --}\n	<div class=\"store_block\">\n	<h2>Add Coupon</h2>\n	{!--  add_coupon_form tag outputs an add_coupon form--}\n	{exp:cartthrob:add_coupon_form \n		return=\"{template_group}/{template}\"}\n		<input type=\"text\" name=\"coupon_code\" /> use code 5_off if you\'re demoing this on CartThrob.net<br />\n		<input type=\"submit\" value=\"Add\" />\n	{/exp:cartthrob:add_coupon_form}\n	</div>\n	\n	{!-- CHECKOUT --}\n	<div class=\"store_block\">\n	<h2>Checkout</h2>\n	{!-- checkout_form tag outputs a checkout form--}\n	{!-- There are many parameters available for the checkout form. \n			gateway: you can manually set the gateway. If this parameter isn\'t set, the default gateway will be used\n		  --}\n	{exp:cartthrob:checkout_form \n 		return=\"{template_group}/{template}/order_complete\"}\n		\n		{!-- The gateway_fields template variable to output fields required by your currently selected gateway \n			what you see on the front end changes based on the gateway\'s requirements.--}\n		{gateway_fields}\n		<br />\n		<input type=\"submit\" value=\"Checkout\" />\n	{/exp:cartthrob:checkout_form}\n	</div>\n 	\n	<div class=\"store_block\">\n		<h2>Tags used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/add_to_cart_form\">add_to_cart_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/add_coupon_form\">add_coupon_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/cart_items_info\">cart_items_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/checkout_form\">checkout_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/customer_info\">customer_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/save_customer_info_form\">save_customer_info_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/submitted_order_info\">submitted_order_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/update_cart_form\">update_cart_form</a></li>\n		</ul>\n	</div>\n	<div class=\"store_block\">\n		{embed=cart_examples/include_footer}\n	</div>\n</body>\n</html>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(59,1,9,'software','y','webpage','{preload_replace:template_group=\"cart_examples\"}\n{preload_replace:template=\"software\"}\n{embed=cart_examples/include_header title=\"Software Store\" }\n\n</head>\n<body>\n \n	<h1>Software Store</h1>\n	<p>This page shows an example of how you can protect your downloadable products</p>\n \n	<div class=\"store_block\">\n		<h2>Your Previous Software Purchases</h2>\n		{exp:channel:entries channel=\"purchased_items\" author=\"CURRENT_USER\" search:purchased_product_download_url=\"not IS_EMPTY\"}\n			{if no_results}\n				<h3>You have not purchased any software, but here\'s a link anyway</h3>\n				{!-- this is where you would add a link to the file the customer just purchased \n				to keep things simple, i\'ve just added a link to a file that ships with \n				CartThrob so you can test the download & encryption. \n				--}\n				{exp:cartthrob:download_file_form \n					file=\"{theme_folder_url}third_party/cartthrob/images/cartthrob_logo_bg.jpg\" }\n					<input type=\"submit\" value=\"submit\" /> \n				{/exp:cartthrob:download_file_form}\n 			{/if}\n			{!-- \n				There are 2 methods for providing downloads: download_file_form, and get_download_link. \n				Download_file_form has the advantage of hiding the link. \n				get_download_link will allow you to output an encrypted link that can be tied to a group or member id.\n				 --}\n			<a href=\"{exp:cartthrob:get_download_link \n						file=\'{theme_folder_url}third_party/cartthrob/images/cartthrob_logo_bg.jpg\'\n						member_id =\'{logged_in_member_id}\'}\"> download {title}</a>\n			<br />\n		{/exp:channel:entries}\n	</div>	\n \n	\n	<div class=\"store_block\">\n		<h2>Tags used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/download_file_form\">download_file_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/get_download_link\">get_download_link</a></li>\n		</ul>\n		<h2>Concepts used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/sub_pages/purchased_items_overview\">Purchased Items channel</a></li>\n		</ul>\n	</div>\n	<div class=\"store_block\">\n		{embed=cart_examples/include_footer}\n	</div>\n\n</body>\n</html>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(60,1,9,'tshirt','y','webpage','{preload_replace:template_group=\"cart_examples\"}\n{preload_replace:template=\"tshirt\"}\n{embed=cart_examples/include_header title=\"T-Shirt Store\" }\n</head>\n<body>\n	<h1>T-Shirt Store</h1>\n	<p>This example shows how you can add options that your customers can select, some options affect the price, and some do not.</p>\n\n	{!-- ADD A PRODUCT --}\n    <div class=\"store_block\">\n		<h2>Add T-Shirts</h2>\n\n		{!-- outputting products stored in one of the \"products\" channels. These are exactly the same as normal \n			product channels, so the channel names may be different from what is listed below --}\n		{exp:channel:entries channel=\"products\" limit=\"10\"}\n			{!-- The add_to_cart_form adds 1 or more of a product to the cart --}\n			{exp:cartthrob:add_to_cart_form \n				entry_id=\"{entry_id}\" \n				return=\"{template_group}/{template}\"}\n				<p>\n					T-Shirt name: {title} Tee  -- Price: {product_price}<br />\n					Quantity: <input type=\"text\" name=\"quantity\" size=\"5\" value=\"\" /> \n					<input type=\"submit\" value=\"Add to Cart\">\n					<br />\n					{item_options:select:product_size}\n						<option value=\"{option_value}\">{option_name} {price}</option>\n					{/item_options:select:product_size}\n					{item_options:select:product_color}\n						<option value=\"{option_value}\">{option_name} {price}</option>\n					{/item_options:select:product_color}\n					{item_options:select:product_options}\n						<option value=\"{option_value}\">{option_name} {price}</option>\n					{/item_options:select:product_options}\n					\n					{!-- Some major magic happens here. This is the item_options variable.\n						It can be used in conjunction with a \"Cartthrob Price Modifiers\" field from your channel, \n						and can automatically create and populate input and select fields with the data from that custom field. \n						\n						A. \n						It can be used singly like this: \n						{item_options:select:YOUR_FIELD_NAME}\n						and a select dropdown with your values will be output\n\n						B. \n						You can use it as a variable pair like this: \n						 {item_options:select:YOUR_FIELD_NAME}\n							<option value=\"{option_value}\">{option_name} $ {price}</option>\n						{/item_options:select:YOUR_FIELD_NAME}\n						option, option_name, and price are variables associated with the Cartthrob Price Modifiers custom field type.\n						Associated prices are automatically figured. \n						\n						C.\n						OR, you can add optoions on the fly like this: \n						<select name=\"item_options[whatevs]\">\n							<option value=\"S\">Small</option>\n							<option value=\"M\">Medium</option>\n							<option value=\"L\">Large</option>\n						</select>\n						\n						D. \n						OR This:  \n						{item_options:select:size class=\"size_box\" values=\"S:Small|M:Medium|L:Large\" attr:rel=\"external\"}\n						In both option C and D above, prices aren\'t modified dynamically. \n						\n						There are lots of ways to use the item_options variable. It\'s one of the most powerful features of CartThrob, \n						but possibly a bit complicated to grasp at first. Please feel free to post questions in the CartThrob forums\n						--}\n				</p>\n			{/exp:cartthrob:add_to_cart_form}\n		{/exp:channel:entries}\n	</div>\n\n	{!-- VIEW CART CONTENTS / UPDATE QUANTITIES --}\n	<div class=\"store_block\">\n	<h2>Cart Contents</h2>\n	{!-- cart_items_info outputs information about your current cart, including products in the cart, weight, and prices. --}\n	{exp:cartthrob:cart_items_info}\n		{if no_results}\n		    <p>There is nothing in your cart</p>\n		{/if}\n		{!-- outputting data that\'s only applicable for the first item. --}\n		{if first_row}\n			{!-- update_cart_form allows you to edit the information of one or more items in the cart at the same time\n				as well as save customer information, and shipping options. --}\n    		{exp:cartthrob:update_cart_form \n				return=\"{template_group}/{template}\"\n				}\n 		{/if}\n			<p>\n				{if item_options:product_color  } Color: {item_options:product_color}{/if} \n				{if item_options:product_size  } Size: {item_options:product_size}{/if}\n{if item_options:product_options}{item_options:product_options:label}{/if}\n			</p>\n			<strong>{title}</strong> -- {item_price}\n			{!-- The following will generate a item_options select boxes. With the parameter row_id=\"true\" \n				the select boxes will automatically add the all-important row_id to the output. The final select box will look\n				something like this: \n				<select name=\"item_options[1][product_size]\">\n				--}\n{!--\n			{item_options:select:product_size row_id=\"{row_id}\"}\n			{item_options:select:product_color row_id=\"{row_id}\"}\n--}\n\n			{!-- you can reference products by entry_id and row_id. If you sell configurable \n				items (like t-shirts with multiple sizes) you should use row_id to edit and \n				delete items, otherwise, all items with that entry id\n				are affected, regardless of configuration --}\n				<input type=\"text\" name=\"quantity[{row_id}]\" size=\"2\" value=\"{quantity}\" />\n			{!-- This deletes one item (row_id) at a time--}\n				<input type=\"checkbox\" name=\"delete[{row_id}]\"> Delete this item\n			{!-- outputting data that\'s only applicable for the last item. --}\n			\n		{if last_row}\n			{!-- a clear_cart input can be used to remove all items in the cart --}\n	    	<input type=\"submit\" name=\"clear_cart\" value=\"Empty Cart\" />\n	    	<input type=\"submit\" value=\"Update Cart\" />\n			{/exp:cartthrob:update_cart_form}\n		{/if}\n	{/exp:cartthrob:cart_items_info}\n	</div>\n\n 	<div class=\"store_block\">\n		<h2>Tags used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/add_to_cart_form\">add_to_cart_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/add_to_cart_form/#var_item_options:select:your_option_name\">add_to_cart_form: item_options</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/cart_items_info\">cart_items_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/cart_items_info/#var_item_options:your_option\">cart_items_info: item_options</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/submitted_order_info\">submitted_order_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/update_cart_form\">update_cart_form</a></li>\n		</ul>\n		<h2>Concepts used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/sub_pages/price_modifiers/\">Price Modifiers</a></li>\n		</ul>\n	</div>\n	<div class=\"store_block\">\n		{embed=cart_examples/include_footer}\n	</div>\n\n</body>\n</html>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(61,1,9,'dynamic_product','y','webpage','{exp:cartthrob:add_to_cart_form \nentry_id=\"123\"\nquantity=\"2\"\non_the_fly=\"y\"\ntitle=\"Red T-Shirt\"\nprice=\"9.95\"\nshipping=\"4.95\"\nweight=\"20\"\nno_tax=\"yes\"\nno_shipping=\"yes\"\nallow_user_price=\"yes\"\nallow_user_shipping=\"yes\"\nallow_user_weight=\"yes\"\nlicense_number=\"yes\"\nitem_options:shirt_size=\"XXL\"\nitem_options:shirt_color=\"red\"\nexpiration_date=\"365\"\nreturn=\"cart_examples/dynamic_product\"\n}\n\n<input type=\"submit\" value=\"Add dynamic product to cart\" /> \n\n{/exp:cartthrob:add_to_cart_form}\n\n\n{exp:cartthrob:add_to_cart_form \non_the_fly=\"y\"\nallow_user_price=\"yes\"\nallow_user_shipping=\"yes\"\nallow_user_weight=\"yes\"\nlicense_number=\"yes\"\nexpiration_date=\"365\"\n	return=\"cart_examples/dynamic_product\"\n}\n\n<input type=\"text\" name=\"quantity\" value=\"2\" /> \n<input type=\"text\" name=\"title\" value=\"Red T-Shirt\" />\n<input type=\"text\" name=\"price\" value=\"9.95\"/>\n<input type=\"text\" name=\"shipping\" value=\"4.95\"/>\n<input type=\"text\" name=\"weight\" value=\"20\"/>\n<input type=\"text\" name=\"item_options[shirt_size]\" value=\"XXL\"/>\n<input type=\"text\" name=\"item_options[shirt_color]\" value=\"red\"/>\n\n\n<input type=\"submit\" value=\"Add donation type product to cart\" /> \n\n{/exp:cartthrob:add_to_cart_form}\n\n\n\n<h2>Cart Items</h2>\n{exp:cartthrob:cart_items_info}\nentry_id                {entry_id}                <br />\ntitle                   {title}                   <br />\nurl_title               {url_title}               <br />\nquantity                {quantity}                <br />\nrow_id                  {row_id}                  <br />\nitem_price              {item_price}              <br />\nitem_subtotal           {item_subtotal}           <br />\nitem_shipping           {item_shipping}           <br />\nitem_weight             {item_weight}             <br />\ntotal_items             {total_items}             <br />\ntotal_unique_items      {total_unique_items}      <br />\ncart_total              {cart_total}              <br />\ncart_subtotal           {cart_subtotal}           <br />\ncart_tax                {cart_tax}                <br />\ncart_shipping           {cart_shipping}           <br />\ncart_tax_name           {cart_tax_name}           <br />\ncart_discount           {cart_discount}           <br />\ncart_count              {cart_count}              <br />\nentry_id_path           {entry_id_path}           <br />\nrow_id_path             {row_id_path}             <br />\nitem_options:shirt_size {item_options:shirt_size} <br />\nitem_options:shirt_color {item_options:shirt_color}<br />\nswitch                  {switch}                  <br />\n\n\n\n<hr />\n{/exp:cartthrob:cart_items_info}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(62,1,9,'shipping_test','y','webpage','{embed=cart_examples/include_header title=\"Single Page Store\" }\n</head>\n<body>\n	<h1>Single Page Store</h1>\n	<p>This single page is an example of how you can use one page to add, update, and delete items, as well as checkout</p>\n\n	{!-- ORDER COMPLETE MESSAGES --}\n	{!-- The \"return\" paramater of the checkout form below is set back to this page with \"order_complete\" in the URL. \n		This saves creating a template specifically to handle order info. --}\n	{if segment_2==\"order_complete\"}\n		{!-- the submitted_order_info tag returns information from the last attempted order. --}\n		{exp:cartthrob:submitted_order_info}\n		    <div class=\"store_block\">\n				{if authorized}\n					Your transaction is complete!<br />\n			        Transaction ID: {transaction_id}<br />\n			        Your total: {cart_total}<br />\n			        Your order ID: {order_id}\n			    {if:elseif processing}\n					Your transaction is being processed!<br />\n			        Transaction ID: {transaction_id}<br />\n			        Your total: {cart_total}<br />\n			        Your order ID: {order_id}\n				{if:elseif declined}\n			        Your credit card was declined: {error_message}\n			    {if:elseif failed}\n			        Your payment failed: {error_message}\n			    {if:else}\n			        Your payment failed: {error_message}\n			    {/if}\n			</div>\n		{/exp:cartthrob:submitted_order_info}\n	{/if}\n\n	{!-- ADD A PRODUCT --}\n    <div class=\"store_block\">\n	<h2>Add Products</h2>\n	{!-- outputting products stored in one of the \"products\" channels. These are exactly the same as normal \n		product channels, so the channel names may be different from what is listed below --}\n	{exp:channel:entries channel=\"products\" limit=\"10\"}\n		{!-- The add_to_cart_form adds 1 or more of a product to the cart --}\n		{exp:cartthrob:add_to_cart_form \n			entry_id=\"{entry_id}\" \n			return=\"cart_examples/shipping_test\"}\n				<p>Product name: {title} <br />\n				Quantity: <input type=\"text\" name=\"quantity\" size=\"5\" value=\"\" /> <input type=\"submit\" value=\"Add to Cart\">\n				<br />\n				Price: ${product_price}<br />\n				\n				</p>\n		{/exp:cartthrob:add_to_cart_form}\n	{/exp:channel:entries}\n	</div>\n\n	{!-- VIEW CART CONTENTS / UPDATE QUANTITIES --}\n\n	<div class=\"store_block\">\n	<h2>Cart Contents</h2>\n	{!-- cart_items_info outputs information about your current cart, including products in the cart, weight, and prices. --}\n		{exp:cartthrob:cart_items_info}\n		{if no_results}\n		    <p>There is nothing in your cart</p>\n		{/if}\n		{!-- outputting data that\'s only applicable for the first item. --}\n		{if first_row}\n			{exp:cartthrob:update_cart_form \n				return=\"cart_examples/shipping_test\"}\n		\n			<h3>Customer Info</h3>\n				{exp:cartthrob:customer_info}\n					First Name: <input type=\"text\" name=\"first_name\" value=\"{customer_first_name}\" /><br />\n					Last Name: <input type=\"text\" name=\"last_name\" value=\"{customer_last_name}\" /><br />\n					Email Address:	<input type=\"text\" name=\"email_address\" value=\"{customer_email_address}\" /><br />\n					State: {exp:cartthrob:state_select name=\"state\" selected=\"{customer_state}\"}<br />\n					Country: {exp:cartthrob:country_select name=\"country_code\" selected=\"{customer_country_code}\"}<br />\n					Zip: <input type=\"text\" name=\"zip\" value=\"{customer_zip}\" /><br />\n				{/exp:cartthrob:customer_info}\n\n			{!-- update_cart_form allows you to edit the information of one or more items in the cart at the same time\n				as well as save customer information, and shipping options. --}\n\n\n				\n			    <table>\n			        <thead>\n			            <tr>\n			                <td>Item</td>\n			                <td colspan=\"2\">Quantity</td>\n			            </tr>\n			        </thead>\n			        <tbody>\n		{/if}\n			        <tr>\n		                <td>{title}</td>\n		                <td>\n								{!-- you can reference products by entry_id and row_id. If you sell configurable \n									items (like t-shirts with multiple sizes) you should use row_id to edit and \n									delete items, otherwise, all items with that entry id\n									are affected, regardless of configuration --}\n\n	                        	<input type=\"text\" name=\"quantity[{row_id}]\" size=\"2\" value=\"{quantity}\" />\n		                </td>\n		                <td>\n							{!-- This deletes one item (row_id) at a time--}\n								<input type=\"checkbox\" name=\"delete[{row_id}]\"> Delete this item\n		                </td>\n		            </tr>\n		{if last_row}\n		{!-- outputting data that\'s only applicable for the last item. --}\n			            <tr>\n			                <td>\n								{!-- these are just some of the variables available within the cart_items_info tag --}\n			                    <p>Subtotal: {cart_subtotal}<br />\n			                    Shipping: {cart_shipping}<br />\n			                    Tax: {cart_tax}<br /> \n								{!--tax is updated based on user\'s location. To create a default tax price, set a default tax region in the backend --}\n\n								Shipping Option: {shipping_option}<br />\n								Tax Name: {cart_tax_name}<br />\n								Tax %: {cart_tax_rate}<br />\n 								Discount: {cart_discount}<br />\n			\n			                    <strong>Total: {cart_total}</strong></p>\n								<p>\n								{!-- total quantity of all items in cart --}\n								Total Items: {exp:cartthrob:total_items_count}<br />\n								{!-- total items in cart --}\n								Total Unique Items: {exp:cartthrob:unique_items_count}</p>\n\n			                </td>\n			                <td colspan=\"2\">&nbsp;</td>\n			\n			            </tr>\n			        </tbody>\n			    </table>\n	<input type=\"submit\" value=\"Update Cart\" />\n\n				{/exp:cartthrob:update_cart_form}\n			\n			\n		{/if}\n	{/exp:cartthrob:cart_items_info}\n    \n	\n	</div>\n\n	{!-- ADD COUPON --}\n	<div class=\"store_block\">\n	<h2>Add Coupon</h2>\n	{!--  add_coupon_form tag outputs an add_coupon form--}\n	{exp:cartthrob:add_coupon_form \n		return=\"cart_examples/shipping_test\"}\n		<input type=\"text\" name=\"coupon_code\" /> use code 5_off if you\'re demoing this on CartThrob.net<br />\n		<input type=\"submit\" value=\"Add\" />\n	{/exp:cartthrob:add_coupon_form}\n	</div>\n\n	{!-- SAVE CUSTOMER INFO --}\n	<div class=\"store_block\">\n	<h2>Save Customer Info</h2>\n	\n	{exp:cartthrob:save_customer_info_form \n		id=\"myform_id\" \n		name=\"myform_name\" \n		class=\"myform_class\" \n		return=\"cart_examples/shipping_test\"}\n 		{exp:cartthrob:customer_info}\n			First Name: <input type=\"text\" name=\"first_name\" value=\"{customer_first_name}\" /><br />\n			Last Name: <input type=\"text\" name=\"last_name\" value=\"{customer_last_name}\" /><br />\n			Email Address:	<input type=\"text\" name=\"email_address\" value=\"{customer_email_address}\" /><br />\n			State: {exp:cartthrob:state_select name=\"state\" selected=\"{customer_state}\"}<br />\n			Country: {exp:cartthrob:country_select name=\"country_code\" selected=\"{customer_country_code}\"}<br />\n			Zip: <input type=\"text\" name=\"zip\" value=\"{customer_zip}\" /><br />\n		{/exp:cartthrob:customer_info}\n		\n		<br />\n		<input type=\"submit\" value=\"Save\" />\n	{/exp:cartthrob:save_customer_info_form}\n	\n	</div>\n\n	\n	{!-- CHECKOUT --}\n	<div class=\"store_block\">\n	<h2>Checkout</h2>\n	{!--  checkout_form tag outputs a checkout form--}\n	{!--- There are many parameters available for the checkout form. You may want to note: cart_empty_redirect \n		this parameter will redirect customer if there are no products in their cart.  --}\n	{exp:cartthrob:checkout_form \n		gateway=\"dev_template\"\n		return=\"cart_examples/shipping_test\"}\n		{!-- The gateway_fields template variable to output fields required by your currently selected gateway \n			what you see on the front end changes based on the gateway\'s requirements.--}\n		{gateway_fields}\n		<br />\n		{!-- you can add a coupon code using the \"add_coupon_form\" or you can add a code right here in the checkout_form --}\n		Add a coupon code: <input type=\"text\" name=\"coupon_code\" /> <br />\n		<input type=\"submit\" value=\"Checkout\" />\n	{/exp:cartthrob:checkout_form}\n	</div>\n	<div class=\"store_block\">\n		<h2>Tags used in this template</h2>\n		<ul>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/add_to_cart_form\">add_to_cart_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/add_coupon_form\">add_coupon_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/cart_items_info\">cart_items_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/checkout_form\">checkout_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/customer_info\">customer_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/save_customer_info_form\">save_customer_info_form</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/submitted_order_info\">submitted_order_info</a></li>\n			<li><a href=\"http://cartthrob.com/docs/tags_detail/update_cart_form\">update_cart_form</a></li>\n		</ul>\n	</div>\n	<div class=\"store_block\">\n		{embed=cart_examples/include_footer}\n	</div>\n</body>\n</html>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(63,1,9,'index','y','webpage','','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(64,1,9,'include_cart_shipping','y','webpage','{exp:cartthrob:cart_shipping}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(65,1,9,'include_cart_tax','y','webpage','{exp:cartthrob:cart_tax}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(66,1,9,'include_cart_total','y','webpage','{exp:cartthrob:cart_total}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(67,1,9,'include_checkout','y','webpage','{!-- CHECKOUT --}\n	<div class=\"store_block\">\n	<h2>Checkout</h2>\n	{!-- the checkout_form  outputs a checkout form--}\n	{!-- overriding the chosen gateway with the the dev_template gateway here --}\n	{exp:cartthrob:checkout_form gateway=\"dev_template\" return=\"{embed:template_group}/{embed:template}/order_complete\"}\n		{!-- The gateway_fields template variable to output fields required by your currently selected gateway \n			what you see on the front end changes based on the gateway\'s requirements.--}\n		{gateway_fields}\n		<input type=\"submit\" value=\"Checkout\" />\n	{/exp:cartthrob:checkout_form}\n	</div>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(68,1,9,'include_items_in_cart','y','webpage','{exp:cartthrob:cart_items_info}\n	{title} {item_price} x {quantity}<br />\n	discount: {cart_discount}\n{/exp:cartthrob:cart_items_info}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(69,1,9,'include_view_cart','y','webpage','{!-- VIEW CART CONTENTS / UPDATE QUANTITIES --}\n	<div class=\"store_block\">\n		<h2>Cart Contents</h2>\n		\n	{!-- cart_items_info outputs information about your current cart, including products in the cart, weight, and prices. --}\n	{exp:cartthrob:cart_items_info}\n		{if no_results}\n		<p>Your cart is empty</p>\n		{/if}\n		{!-- outputting data that\'s only applicable for the first item. --}\n		{if first_row}\n			<h2>Thank You.</h2>\n			<p>Thank you for your donation commitment, please pay for your donation now.</p>\n		{/if}\n		<p>Title: {title} <br />\n\n			Personal Message: {item_options:personal_message}<br />\n			{!-- The delete URL links back to this page. \n			The segments activate the delete_from_cart tag at the top of this template.--}\n			<a href=\"{path=cart_examples/include_delete_from_cart/{row_id}/{embed:template_group}/{embed:template}}\">Delete</a><br />\n			</p>\n		\n		{if last_row}\n			{!-- these are just some of the variables available within the cart_items_info tag --}\n			<p><strong>Total: {cart_total}</strong></p>\n		{/if}\n	{/exp:cartthrob:cart_items_info}\n	</div>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(70,1,9,'include_footer','y','webpage','<h2>Basic Store Templates for CartThrob 2</h2>\n<ul>\n<li><a href=\"{path=cart_examples/single_page_checkout}\">Single Page Checkout</a></li>\n<li><a href=\"{path=cart_examples/donations}\">Taking Donations</a></li>\n<li><a href=\"{path=cart_examples/software}\">Selling Software</a></li>\n<li><a href=\"{path=cart_examples/tshirt}\">Selling Configurable Products (t-shirts)</a></li>\n<li><a href=\"{path=cart_multi_page_checkout}\">Multi-Page Checkout</a></li>\n</ul>\n\n<h2>Ajax Examples</h2>\n<ul>\n<li><a href=\"{path=cart_ajax_examples}\">Selecting Gateway Dynamically</a></li>\n<li><a href=\"{path=cart_ajax_examples}\">Update checkout fields with gateway change</a></li>\n<li><a href=\"{path=cart_ajax_examples}\">Update shipping with location change</a></li>\n<li><a href=\"{path=cart_ajax_examples}\">Update tax with location change</a></li>\n</ul>\n\n\n<h2>Administrative Templates</h2>\n<ul>\n<li><a href=\"{path=cart_orders}\">Admin Reports</a></li>\n<li><a href=\"{path=cart_gateway_test}\">Gateway Test</a></li>\n</ul>		\n\n \n\n\n{!-- uncomment to activate \n{exp:cartthrob:debug_info}\n--}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(71,1,9,'include_header','y','webpage','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\n\"http://www.w3.org/TR/html4/strict.dtd\">\n<head>\n	<title>{embed:title}</title>\n  	<style type=\"text/css\">\n	body{\n			font: 11px \"Lucida Grande\", Lucida, Verdana, sans-serif;\n		}\n		h1{\n			font-size: 18px;\n			font-weight: bold;\n		}\n		h2{\n			font-size: 16px;\n			font-weight: bold;\n		}\n		h3{\n			font-size: 13px;\n			font-weight: bold;\n		}\n		h4{\n			font-size: 12px;\n			font-weight: bold;\n		}\n		.store_block{\n			padding:12px;\n			margin-top: 12px;\n			margin-bottom:12px;\n		background-color: #e1fefd;\n	}\n	</style>','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(72,1,9,'include_delete_from_cart','y','webpage','{exp:cartthrob:delete_from_cart row_id=\"{segment_3}\" return=\"{segment_4}/{segment_5}\"}','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(73,1,10,'add_to_cart_form','y','webpage','{exp:channel:entries channel=\"products\" limit=\"1\"}\nProduct Name: {title} {product_price}\n    {exp:cartthrob:add_to_cart_form return=\"cart_examples/single_page_checkout\" entry_id=\"{entry_id}\"}\n	Quantity <input type=\"text\" name=\"quantity\"/>\n	<input type=\"submit\" /> \n    {/exp:cartthrob:add_to_cart_form}\n{/exp:channel:entries}\n\n<br />Creates a form for adding products to the cart\n<br />NOTE: example requires \"products\" channel and entries\n<br />http://cartthrob.com/docs/tags_detail/add_to_cart_form/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(74,1,10,'add_to_cart','y','webpage','{exp:cartthrob:add_to_cart entry_id=\"1\" quantity=\"1\" return=\"cart_examples/single_page_checkout\"}\n\n<br />This tag will add a product to the cart just automatically. \n<br />NOTE: example requires product with entry_id:1\n<br />NOTE: This will redirect you to another page. \n<br />http://cartthrob.com/docs/tags_detail/add_to_cart/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(75,1,10,'also_purchased','y','webpage','{exp:cartthrob:also_purchased entry_id=\"1\" limit=\"3\"}\n	You might also like:  {entry_id}<br /> \n{/exp:cartthrob:also_purchased}\n\n<br />Outputs entry_ids based on customer\'s past purchases.\n<br />NOTE: example requires product with entry_id:1, and an existing order history\n<br />http://cartthrob.com/docs/tags_detail/also_purchased/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(76,1,10,'arithmetic','y','webpage','Item Subtotal: {exp:cartthrob:arithmetic operator=\"*\" num1=\"123\" num2=\"1.3\"} (should equal 159.90)\n\n\n<br />Very simple calculations tag. For more advanced calculations, we suggest using 3rd party math plugins\n<br />http://cartthrob.com/docs/tags_detail/arithmetic/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(77,1,10,'cart_discount','y','webpage','{exp:cartthrob:cart_discount}\n\n<br />Outputs current discount value\n<br />NOTE: example requires that a discount/coupon be active. Refer to add_coupon_code_form\n<br />http://cartthrob.com/docs/tags_detail/cart_discount/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(78,1,10,'cart_empty_redirect','y','webpage','{exp:cartthrob:cart_empty_redirect return=\"cart_examples/single_page_checkout\"}\nIf you\'re reading this... your cart has items in it\n<a href=\"{path=cart_examples}\">Go delete some items here &raquo; </a>\n\n<br />Redirects customer to an alternate page if cart is empty\n<br />NOTE: this will redirect to another page if the cart is empty.\n<br />http://cartthrob.com/docs/tags_detail/cart_empty_redirect/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(79,1,10,'cart_entry_ids','y','webpage','{exp:cartthrob:cart_entry_ids}\n\n<br />Outputs a pipe-delimited list of entry_ids currently in the cart. \n<br />http://cartthrob.com/docs/tags_detail/cart_entry_ids/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(80,1,10,'cart_info','y','webpage','{exp:cartthrob:cart_info}\n	Total Items: {total_items} <br />\n	Total Unique Items: {total_unique_items} <br />\n	Cart Entry IDs: {cart_entry_ids} <br />\n	Cart Shipping: {cart_shipping} <br />\n	Cart Tax Rate: {cart_tax_rate} <br />\n	Cart Tax: {cart_tax} <br />\n	Cart Subtotal: {cart_subtotal} <br />\n	Cart Total: {cart_total} <br />\n{/exp:cartthrob:cart_info}\n\n<br />Outputs general information about the cart. For item specific information, use cart_items_info\n<br />NOTE: example requires items in cart.\n<br />http://cartthrob.com/docs/tags_detail/cart_info/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(81,1,10,'cart_items_info','y','webpage','<pre>\n{exp:cartthrob:cart_items_info}\n{if no_results}There\'s nothing in your cart{/if}\n	{entry_id}\n	{title}\n	{url_title}\n	{quantity}\n	{row_id}\n	{item_price}\n	{item_subtotal}\n	{item_shipping}\n	{item_weight}\n	{total_items}\n	{total_unique_items}\n	{cart_total}\n	{cart_subtotal}\n	{cart_tax}\n	{cart_shipping}\n	{cart_tax_name}\n	{cart_discount}\n	{cart_count}\n	{entry_id_path=product/detail}\n	{row_id_path=cart/delete_from_cart}\n	{item_options:your_option}\n	{item_options:your_option:option_name}\n	{item_options:your_option:price}\n	{switch=\"odd|even\"}\n{/exp:cartthrob:cart_items_info}\n<pre>\n\n<br />Outputs information about items in the cart\n<br />NOTE: example requires items in cart\n<br />http://cartthrob.com/docs/tags_detail/cart_items_info/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(82,1,10,'cart_shipping','y','webpage','{exp:cartthrob:cart_shipping}\n\n<br />Outputs cart shipping cost\n<br />http://cartthrob.com/docs/tags_detail/cart_shipping/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(83,1,10,'cart_subtotal','y','webpage','{exp:cartthrob:cart_subtotal}\n\n<br />Outputs cart subtotal\n<br />http://cartthrob.com/docs/tags_detail/cart_subtotal/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(84,1,10,'cart_total','y','webpage','{exp:cartthrob:cart_total}\n\n<br />Outputs cart total\n<br />http://cartthrob.com/docs/tags_detail/cart_total/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(85,1,10,'duplicate_item','y','webpage','{exp:cartthrob:duplicate_item entry_id=\"1\"}\n\n<br />Duplicates an item in the cart\n<br />NOTE: example requires that entry_id:1 be an item in the cart.\n<br />http://cartthrob.com/docs/tags_detail/duplicate_item/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(86,1,10,'multi_add_to_cart_form','y','webpage','{exp:channel:entries channel=\"products\" limit=\"5\"}\n	{if count == 1}\n		{exp:cartthrob:multi_add_to_cart_form return=\"cart_examples/single_page_checkout\"}\n	{/if}\n\n		Product Name: {title} {product_price}\n		<input type=\"hidden\" name=\"entry_id[{count}]\" value=\"{entry_id}\" />\n		<input type=\"text\" name=\"item_options[{count}][notes]\"  />\n		<input type=\"text\" name=\"quantity[{count}]\"  />\n\n	{if count == total_results}\n			<input type=\"submit\" /> \n		{/exp:cartthrob:multi_add_to_cart_form}\n	{/if}\n{/exp:channel:entries}\n\n<br />Outputs a form that allows you to add multiple items to the cart at the same time.\n<br />NOTE: example requires \"products\" channel. \n<br />http://cartthrob.com/docs/tags_detail/multi_add_to_cart_form/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(87,1,10,'clear_cart','y','webpage','{exp:cartthrob:clear_cart return=\"cart_examples/single_page_checkout\"}\n\n<br />Clears entire cart contents\n<br />NOTE: example requires items to be in cart. \n<br />NOTE: This will redirect you to another page when viewing.  \n<br />http://cartthrob.com/docs/tags_detail/clear_cart/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(88,1,10,'clear_coupon_codes','y','webpage','{exp:cartthrob:clear_coupon_codes return=\"cart_examples/single_page_checkout\"}\n\n<br />Clears coupon codes\n<br />http://cartthrob.com/docs/tags_detail/clear_coupon_codes/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(89,1,10,'delete_from_cart','y','webpage','{exp:cartthrob:delete_from_cart entry_id=\"1\" return=\"cart_examples/single_page_checkout\"}\n\n<br />Deletes items from the cart\n<br />NOTE: example requires that item with entry_id:1 be in cart\n<br />NOTE: This will redirect you to a different page when this template is viewed\n<br />http://cartthrob.com/docs/tags_detail/delete_from_cart/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(90,1,10,'cart_tax','y','webpage','{exp:cartthrob:cart_tax}\n\n<br />Outputs cart tax\n<br />http://cartthrob.com/docs/tags_detail/cart_tax/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(91,1,10,'countries','y','webpage','<select name=\"country_code\">\n	{exp:cartthrob:countries}\n		<option value=\"{country_code}\">{country}</option>\n	{/exp:cartthrob:countries}\n</select>\n\n<br />Outputs list of countries using standard 3 character country codes\n<br />http://cartthrob.com/docs/tags_detail/countries/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(92,1,10,'country_select','y','webpage','{exp:cartthrob:country_select name=\"country_code\" selected=\"USA\"}\n\n<br />Generates a country select\n<br />http://cartthrob.com/docs/tags_detail/country_select/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(93,1,10,'cart_subtotal_plus_shipping','y','webpage','{exp:cartthrob:cart_subtotal_plus_shipping}\n\n<br />Outputs cart subtotal plus shipping cost\n<br />http://cartthrob.com/docs/tags_detail/cart_subtotal_plus_shipping/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(94,1,10,'checkout_form','y','webpage','<h2>Standard Checkout</h2>\n{exp:cartthrob:checkout_form  \n	gateway=\"dev_template\"\n	return=\"cart/order_info\" \n	}\n 	\n	{gateway_fields}\n\n	<input type=\"submit\" value=\"Submit\" />\n{/exp:cartthrob:checkout_form}\n\n<h2>Create User During Checkout</h2>\n{exp:cartthrob:checkout_form \n    	create_user=\"yes\"\n	gateway=\"dev_template\"\n	group_id=\"6\"}\n            Username: <input type=\"text\" class=\"required\" name=\"username\" value=\"\" />\n            Email Address: <input type=\"text\" class=\"required\" name=\"email_address\" value=\"\" />\n            Screen Name: <input type=\"text\" name=\"screen_name\" value=\"\" />\n            Password: <input type=\"password\" name=\"password\"  value=\"\" />\n            Confirm Password: <input type=\"password\" name=\"password_confirm\" value=\"\" /> \n 	\n	{gateway_fields}\n\n	<input type=\"submit\" value=\"Submit\" />\n{/exp:cartthrob:checkout_form}\n\n<br />Generates a checkout form\n<br />http://cartthrob.com/docs/tags_detail/checkout_form/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(95,1,10,'customer_info','y','webpage','{exp:cartthrob:customer_info}\nfirst_name           	{first_name}\n<br />last_name            	{last_name}\n<br />address              	{address}\n<br />address2             	{address2}\n<br />city                 	{city}\n<br />state                	{state}\n<br />zip                  	{zip}\n<br />company              	{company}\n<br />country              	{country}\n<br />country_code         	{country_code}\n<br />region               	{region}\n<br />phone                	{phone}\n<br />email_address        	{email_address}\n<br />shipping_first_name  	{shipping_first_name}\n<br />shipping_last_name   	{shipping_last_name}\n<br />shipping_address     	{shipping_address}\n<br />shipping_address2    	{shipping_address2}\n<br />shipping_city        	{shipping_city}\n<br />shipping_state       	{shipping_state}\n<br />shipping_zip         	{shipping_zip}\n<br />shipping_company     	{shipping_company}\n<br />shipping_country     	{shipping_country}\n<br />shipping_country_code	{shipping_country_code}\n<br />shipping_company     	{shipping_company}\n<br />ip_address           	{ip_address}\n<br />weight_unit          	{weight_unit}\n<br />language             	{language}\n<br />use_billing_info     	{use_billing_info}\n<br />description          	{description}\n<br />card_type            	{card_type}\n<br />expiration_month     	{expiration_month}\n<br />expiration_year      	{expiration_year}\n<br />po_number            	{po_number}\n<br />card_code            	{card_code}\n<br />CVV2                 	{CVV2}\n<br />issue_number         	{issue_number}\n<br />transaction_type     	{transaction_type}\n<br />bank_account_number  	{bank_account_number}\n<br />check_type           	{check_type}\n<br />account_type         	{account_type}\n<br />routing_number       	{routing_number}\n<br />begin_month          	{begin_month}\n<br />begin_year           	{begin_year}\n<br />bday_month           	{bday_month}\n<br />bday_day             	{bday_day}\n<br />bday_year            	{bday_year}\n<br />currency_code        	{currency_code}\n<br />shipping_option      	{shipping_option}\n<br />success_return       	{success_return}\n<br />cancel_return        	{cancel_return}\n<br />username             	{username}\n<br />screen_name          	{screen_name}\n             \n	you need to save this data first using save_customer_info_form 	{custom_data:your_data_field_name} \n{/exp:cartthrob:customer_info}\n\n<br />Outputs saved customer info\n<br />NOTE: example requires that some customer data be available see save_customer_info_form \n<br />http://cartthrob.com/docs/tags_detail/customer_info/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(96,1,10,'debug_info','y','webpage','{exp:cartthrob:debug_info view_all=\"yes\"}\n\n<br />Outputs cart/customer information from current cart, and optionally ALL cartthrob settings\n<br />View all parameter will show EVERYTHING in CartThrob\'s settings... not recommended during normal testing. \n<br />http://cartthrob.com/docs/tags_detail/debug_info/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(97,1,10,'download_file_form','y','webpage','{exp:cartthrob:download_file_form file=\"{theme_folder_url}third_party/cartthrob/images/cartthrob_logo_bg.jpg\" }\n	<input type=\"submit\" value=\"submit\" /> \n{/exp:cartthrob:download_file_form}\n\n<br />Outputs a form used for downloading files in a more secure fashion than a standard link\n<br />http://cartthrob.com/docs/tags_detail/download_file_form/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(98,1,10,'get_download_link','y','webpage','<a href=\"{exp:cartthrob:get_download_link  free_file=\"{theme_folder_url}third_party/cartthrob/images/cartthrob_logo_bg.jpg\"}\" }\"> download free file</a>\n<br />\n<a href=\"{exp:cartthrob:get_download_link group_id=\"1\" file=\"{theme_folder_url}third_party/cartthrob/images/cartthrob_logo_bg.jpg\"}\"> download file restricted to group 1</a>\n\n\n<br />Generates an encrypted download link\n<br />NOTE: Standard downloads require at least a member id OR a group id. If you want no restriction use free_file parameter. \n<br />http://cartthrob.com/docs/tags_detail/get_download_link/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(99,1,10,'get_items_in_range','y','webpage','{exp:cartthrob:get_items_in_range price_min=\"10\" price_max=\"55\"}\n\n<br />Searches all product channels for items within the price range and outputs as a pipe-delimited list.\n<br />http://cartthrob.com/docs/tags_detail/get_items_in_range/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(100,1,10,'get_shipping_options','y','webpage','{exp:cartthrob:get_shipping_options}\n\n<br />Gets available shipping_options from selected shipping plugin. If no options are available, nothing is returned.\n<br />http://cartthrob.com/docs/tags_detail/get_shipping_options/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(101,1,10,'is_in_cart','y','webpage','{if {exp:cartthrob:is_in_cart entry_id=\"1\"}}\n	This item is already in your cart!\n{/if}\n\n<br />Outputs \"1\" if a specific item is in the cart\n<br />NOTE: example requires item with entry_id:1 be in cart \n<br />http://cartthrob.com/docs/tags_detail/is_in_cart/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(102,1,10,'is_purchased_item','y','webpage','{if \'{exp:cartthrob:is_purchased_item entry_id=\"1\"}\' }\n You have already purchased this item!\n{/if}\n\n<br />Outputs \"1\" if a specific item is in the customer\'s history\n<br />NOTE: example requires item with entry_id:1 be customer\'s history. Requires that customer be logged in. \n<br />http://cartthrob.com/docs/tags_detail/is_purchased_item/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(103,1,10,'order_totals','y','webpage','{exp:cartthrob:order_totals}\n\n<br />Outputs order_totals\n<br />NOTE: example requires that previous orders have been made.\n<br />http://cartthrob.com/docs/tags_detail/order_totals/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(104,1,10,'selected_shipping_option','y','webpage','{exp:cartthrob:selected_shipping_option}\n\n<br />Outputs the selected shipping option\n<br />NOTE: will not display if no shipping option has been set\n<br />http://cartthrob.com/docs/tags_detail/selected_shipping_option/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(105,1,10,'selected_gateway_fields','y','webpage','{exp:cartthrob:selected_gateway_fields gateway=\"authorize_net\"}\n\n<br />Outputs the fields connected with a specific gateway\n<br />http://cartthrob.com/docs/tags_detail/selected_gateway_fields/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(106,1,10,'save_customer_info_form','y','webpage','{exp:cartthrob:save_customer_info_form return=\"cart_functions/customer_info\"} \nfirst_name                        	<input type=\"text\" name=\"first_name\" value=\"\" /> <br />\nlast_name                         	<input type=\"text\" name=\"last_name\" value=\"\" /> <br />\naddress                           	<input type=\"text\" name=\"address\" value=\"\" /> <br />\naddress2                          	<input type=\"text\" name=\"address2\" value=\"\" /> <br />\ncity                              	<input type=\"text\" name=\"city\" value=\"\" /> <br />\nstate                             	<input type=\"text\" name=\"state\" value=\"\" /> <br />\nzip                               	<input type=\"text\" name=\"zip\" value=\"\" /> <br />\ncountry                           	<input type=\"text\" name=\"country\" value=\"\" /> <br />\ncountry_code                      	<input type=\"text\" name=\"country_code\" value=\"\" /> <br />\ncompany                           	<input type=\"text\" name=\"company\" value=\"\" /> <br />\nphone                             	<input type=\"text\" name=\"phone\" value=\"\" /> <br />\nemail_address                     	<input type=\"text\" name=\"email_address\" value=\"\" /> <br />\nip_address                        	<input type=\"text\" name=\"ip_address\" value=\"\" /> <br />\ndescription                       	<input type=\"text\" name=\"description\" value=\"\" /> <br />\nuse_billing_info                  	<input type=\"text\" name=\"use_billing_info\" value=\"\" /> <br />\nshipping_first_name               	<input type=\"text\" name=\"shipping_first_name\" value=\"\" /> <br />\nshipping_last_name                	<input type=\"text\" name=\"shipping_last_name\" value=\"\" /> <br />\nshipping_address                  	<input type=\"text\" name=\"shipping_address\" value=\"\" /> <br />\nshipping_address2                 	<input type=\"text\" name=\"shipping_address2\" value=\"\" /> <br />\nshipping_city                     	<input type=\"text\" name=\"shipping_city\" value=\"\" /> <br />\nshipping_state                    	<input type=\"text\" name=\"shipping_state\" value=\"\" /> <br />\nshipping_zip                      	<input type=\"text\" name=\"shipping_zip\" value=\"\" /> <br />\nshipping_country                  	<input type=\"text\" name=\"shipping_country\" value=\"\" /> <br />\nshipping_country_code             	<input type=\"text\" name=\"shipping_country_code\" value=\"\" /> <br />\nshipping_company                  	<input type=\"text\" name=\"shipping_company\" value=\"\" /> <br />\nCVV2                              	<input type=\"text\" name=\"CVV2\" value=\"\" /> <br />\ncard_type                         	<input type=\"text\" name=\"card_type\" value=\"\" /> <br />\nexpiration_month                  	<input type=\"text\" name=\"expiration_month\" value=\"\" /> <br />\nexpiration_year                   	<input type=\"text\" name=\"expiration_year\" value=\"\" /> <br />\npo_number                         	<input type=\"text\" name=\"po_number\" value=\"\" /> <br />\ncard_code                         	<input type=\"text\" name=\"card_code\" value=\"\" /> <br />\nissue_number                      	<input type=\"text\" name=\"issue_number\" value=\"\" /> <br />\ntransaction_type                  	<input type=\"text\" name=\"transaction_type\" value=\"\" /> <br />\nbank_account_number               	<input type=\"text\" name=\"bank_account_number\" value=\"\" /> <br />\ncheck_type                        	<input type=\"text\" name=\"check_type\" value=\"\" /> <br />\naccount_type                      	<input type=\"text\" name=\"account_type\" value=\"\" /> <br />\nrouting_number                    	<input type=\"text\" name=\"routing_number\" value=\"\" /> <br />\nbegin_month                       	<input type=\"text\" name=\"begin_month\" value=\"\" /> <br />\nbegin_year                        	<input type=\"text\" name=\"begin_year\" value=\"\" /> <br />\nbday_month                        	<input type=\"text\" name=\"bday_month\" value=\"\" /> <br />\nbday_day                          	<input type=\"text\" name=\"bday_day\" value=\"\" /> <br />\nbday_year                         	<input type=\"text\" name=\"bday_year\" value=\"\" /> <br />\ncurrency_code                     	<input type=\"text\" name=\"currency_code\" value=\"\" /> <br />\nlanguage                          	<input type=\"text\" name=\"language\" value=\"\" /> <br />\nshipping_option                   	<input type=\"text\" name=\"shipping_option\" value=\"\" /> <br />\nweight_unit                       	<input type=\"text\" name=\"weight_unit\" value=\"\" /> <br />\nregion                            	<input type=\"text\" name=\"region\" value=\"\" /> <br />\nsuccess_return                    	<input type=\"text\" name=\"success_return\" value=\"\" /> <br />\ncancel_return                     	<input type=\"text\" name=\"cancel_return\" value=\"\" /> <br />\nusername                          	<input type=\"text\" name=\"username\" value=\"\" /> <br />\nscreen_name                       	<input type=\"text\" name=\"screen_name\" value=\"\" /> <br />\ncustom_data[your_custom_data_name]	<input type=\"text\" name=\"custom_data[your_custom_data_name]\" value=\"\"/><br />\n	<input type=\"submit\" value=\"submit\" />\n{/exp:cartthrob:save_customer_info_form}\n<br />Outputs a form to capture customer data in the cart<br />\nBackend settings allow you to save this data into custom member fields<br />\nhttp://cartthrob.com/docs/tags_detail/save_customer_info_form/<br />','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(107,1,10,'set_config','y','webpage','{exp:cartthrob:set_config}\n	{if group_id == 7}\n		{set_price_field channel=\"products\" field=\"product_discounted_price\"}\n	{if:else}\n		{set_price_field channel=\"products\" field=\"product_price\"}\n	{/if}\n{/exp:cartthrob:set_config}\n\n<br />Allows you to override some cart settings on the fly\n<br />NOTE: example requires that you have a group_id:7, a \"products\" channel, \"product_price and \"product_discounted_price\" fields\n<br />http://cartthrob.com/docs/tags_detail/set_config/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(108,1,10,'state_select','y','webpage','{exp:cartthrob:state_select name=\"state\" selected=\"MO\"}\n\n<br />Outputs a select containing all US states\n<br />http://cartthrob.com/docs/tags_detail/state_select/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(109,1,10,'states','y','webpage','<select name=\"state\">\n{exp:cartthrob:states}\n    <option value=\"{abbrev}\">{state}</option>\n{/exp:cartthrob:states}\n</select>\n\n<br />Outputs a list of US States\n<br />http://cartthrob.com/docs/tags_detail/states/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(110,1,10,'total_items_count','y','webpage','{exp:cartthrob:total_items_count}\n\n<br />Outputs total number of all items in cart \n<br />http://cartthrob.com/docs/tags_detail/total_items_count/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(111,1,10,'unique_items_count','y','webpage','{exp:cartthrob:unique_items_count}\n\n<br />Outputs total number of unique items in the cart\n<br />http://cartthrob.com/docs/tags_detail/unique_items_count/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(112,1,10,'update_cart_form','y','webpage','{exp:cartthrob:cart_items_info}\n	{if first_row}\n		{exp:cartthrob:update_cart_form  return=\"cart/index\"}\n	{/if}\n	{title}\n	<input type=\"text\" name=\"quantity[{row_id}]\" size=\"2\" value=\"{quantity}\" />\n	{!-- This deletes lets you select multiple row_ids --}\n	<input type=\"checkbox\" name=\"delete[{row_id}]\"> Delete this item\n	{if last_row}\n    	<input type=\"submit\" value=\"Update Cart\" />\n		{/exp:cartthrob:update_cart_form}\n		\n	{/if}\n{/exp:cartthrob:cart_items_info}\n\n<br />Outputs a form to update items in cart\n<br />NOTE: example requires that items be in cart\n<br />http://cartthrob.com/docs/tags_detail/update_cart_form/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(113,1,10,'view_converted_currency','y','webpage','{exp:cartthrob:view_converted_currency price=\"10\" currency_code=\"USD\" new_currency_code=\"GBP\" api_key=\"YOUR_KEY_HERE\"}\n\n<br />Uses xurrency.com to convert prices on the fly\n<br />NOTE: requires an API key to use\n<br />http://cartthrob.com/docs/tags_detail/view_converted_currency/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(114,1,10,'view_country_name','y','webpage','{exp:cartthrob:view_country_name country_code=\"USA\"}\n\n<br />Converts a country code to a country name\n<br />http://cartthrob.com/docs/tags_detail/view_country_name/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(115,1,10,'view_decrypted_string','y','webpage','{exp:cartthrob:view_decrypted_string string=\"ZE83M2FBVndWanhSVitkRWxsckNBbko1Qm81Rzh0RUpnNE1hUG1Qak14STlZY20wSy9OdHhUQ1QwYVhhNG1RSm5ZYkVCL2l3MGQ3SFBJV3l1MHdhQWc9PQ%3D%3D\" key=\"10asl15bajkls8bb\"}\n\n<br />Will decrypt content encrypted with the specified key\n<br />http://cartthrob.com/docs/tags_detail/view_decrypted_string/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(116,1,10,'view_encrypted_string','y','webpage','{exp:cartthrob:view_encrypted_string string=\"hello world\" key=\"10asl15bajkls8bb\"}\n\n<br />Will encrypt content using the specified key\n<br />http://cartthrob.com/docs/tags_detail/view_encrypted_string/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(117,1,10,'view_formatted_number','y','webpage','{exp:cartthrob:view_formatted_number number=\"12.1234\" prefix=\"$\" decimals=\"2\" }\n\n<br />Formats a number\n<br />http://cartthrob.com/docs/tags_detail/view_formatted_number/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(118,1,10,'view_setting','y','webpage','{exp:cartthrob:view_setting prefix=\"yes\"}10\n\n<br />Outputs stored settings values\n<br />http://cartthrob.com/docs/tags_detail/view_setting/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(119,1,10,'fieldtype_order_items','y','webpage','{exp:channel:entries channel=\"orders\"}\n	{order_items}\n		Entry Id: {item:entry_id}<br />\n		Title: {item:title}<br />\n		Quantity: {item:quantity}<br /><br />\n	{/order_items}\n{/exp:channel:entries}\n\n<br />Outputs content from a CartThrob Order Items fieldtype\n<br />NOTE: example requires an \"orders\" channel, \"order_items\" field, and previous orders\n<br />http://cartthrob.com/docs/tags_detail/order_items/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(120,1,10,'fieldtype_price_modifiers','y','webpage','{exp:channel:entries channel=\"products\" limit=\"10\" }\ntitle: {title}<br />\n	{product_size}\n		{option_name}-{option_value}-{price}<br />\n	{/product_size}\n<hr />\n{/exp:channel:entries}\n\n\n<br />Generates a select box based on the contents of a CartThrob Price Modifiers custom fieldtype\n<br />NOTE: example requires \"products\" channel and \"product_color\" price modifier field\nhttp://cartthrob.com/docs/tags_detail/price_modifiers/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(121,1,10,'year_select','y','webpage','{exp:cartthrob:year_select years=\"6\"}\n\n<br />Outputs a select list of years\n<br />http://cartthrob.com/docs/tags_detail/year_select/','',1470858266,1,'n',0,'','n','n','o',0,'n');

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`)
VALUES
	(122,1,10,'years','y','webpage','<select name=\"expiration_year\">\n{exp:cartthrob:years years=\"6\"}\n    <option value=\"{year}\">{year}</option>\n{/exp:cartthrob:years}\n</select>\n\n<br />Outputs a list of years\n<br />http://cartthrob.com/docs/tags_detail/years/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(123,1,10,'_README','y','webpage','The templates contained in this template group are purely instructional. \nThey are the simplest possible examples available, and do not reference\nevery variable and parameter. Each template contains basic notes about\nwhat the tag is for, and a link to the full online documentation','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(124,1,10,'submitted_order_info','y','webpage','{exp:cartthrob:submitted_order_info}\n	{if authorized}\n		Your payment is a success!\n		Transaction ID: {transaction_id}\n		Your total: {cart_total}\n		Your order ID: {order_id}\n    {if:elseif processing}\n		Your transaction is being processed!<br />\n        Transaction ID: {transaction_id}<br />\n        Your total: {cart_total}<br />\n        Your order ID: {order_id}\n	{if:elseif declined}\n		Your credit card was declined: {error_message}\n	{if:elseif failed}\n		Your payment failed: {error_message}\n	{/if}\n{/exp:cartthrob:submitted_order_info}\n\n\n<br />Outputs the results of a checkout_form submission. \n<br />NOTE: example requires that a checkout be attempted before any results will display\n<br />http://cartthrob.com/docs/tags_detail/submitted_order_info/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(125,1,10,'cart_weight','y','webpage','{exp:cartthrob:cart_weight}\n\n<br />Outputs cart weight\n<br />http://cartthrob.com/docs/tags_detail/cart_weight/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(126,1,10,'item_options','y','webpage','{exp:cartthrob:cart_items_info}\n	{if no_results}Your cart is empty{/if}\n	 <div><h2>Item: {entry_id}</h2>\n	{exp:cartthrob:item_options entry_id = \"{entry_id}\" row_id=\"{row_id}\" }\n		{if no_results}\n			There are no options for this item\n		{/if}\n		Option {item_options:option_label}\n		<br />\n		{item_options:list}\n			{if dynamic}dynamically added options!{/if}\n			LIST ITEM: {if option_selected}selected{/if} {option} {option_name}  price: {price}<br />\n		{/item_options:list}\n		<br />\n		{item_options:select row_id=\"{row_id}\" id=\"{option_field_name}\"}\n			<option {selected} value=\"{option}\">{option_name} {price}</option>\n		{/item_options:select}\n		<br /><br /><br />\n	{/exp:cartthrob:item_options}\n	</div>\n{/exp:cartthrob:cart_items_info}\n\n\n<br />Will pull up all item options for a specific entry. Can be used singly, or in combination with cart items info to pull up information about a specific item in the basket\n<br />NOTE: example requires \"products\" channel and \"product_color\" price modifier field\nhttp://cartthrob.com/docs/tags_detail/price_modifiers/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(127,1,10,'fieldtype_price_with_quantity','y','webpage','{exp:channel:entries channel=\"products\" limit=\"10\" }\n	title: {title}<br />\n	{price_with_quantity}\n    		{if \"{row_count}\" == \"1\"}Total Rows {total_rows}<br />{/if}\n     		   <span style=\"{row_switch=\"inline|none|none\"}\">{from_quantity} - {up_to_quantity} {price} Row count {row_count}<br /></span>\n    		<br />\n	{/price_with_quantity} \n<hr />\n{/exp:channel:entries}\n\n\n<br />The price with quantity fieldtype allows you to set price breaks when purchasing multiples of one item. This tag outputs the prices & their related quantities\n<br />NOTE: example requires \"products\" channel, a field called price_with_quantity mapped as a price field, and data in that field\nhttp://cartthrob.com/docs/tags_detail/price_with_quantity/','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(128,1,10,'index','y','webpage','','',1470858266,1,'n',0,'','n','n','o',0,'n'),
	(129,1,11,'index','y','webpage','{exp:channel:entries channel=\"products_manual\"}\n    {title}\n    \n            {exp:cartthrob:add_to_cart_form \n            entry_id=\"{entry_id}\"\n            on_the_fly=\"y\"\n            allow_user_price=\"yes\"\n            return=\"/cart\"}\n                \n                    T-Shirt name: {title} Tee<br />\n                    <input type=\"hidden\" maxlength=\"7\" size=\"5\" value=\"10\" name=\"price\">\n                    Quantity: <input type=\"text\" name=\"quantity\" size=\"5\" value=\"\" /> \n                    <input type=\"submit\" value=\"Add to Cart\">\n                    <br />\n                    Price: {product_price}<br />\n                \n        {/exp:cartthrob:add_to_cart_form}\n{/exp:channel:entries}',NULL,1470937300,16,'n',0,'','n','n','o',0,'n'),
	(130,1,11,'view','y','webpage','',NULL,1470937300,16,'n',0,'','n','n','o',0,'n'),
	(132,1,11,'thumb','y','webpage','',NULL,1471466102,1,'n',0,'','n','n','o',0,'n'),
	(133,1,11,'checkout','y','webpage','{exp:channel:entries channel=\"standard_text\" limit=\"1\" disable=\"categories|category_fields|member_data\"}\n<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n{sn:global_html-header}\n<body class=\"style-10\">\n\n    <!-- LOADER -->\n    <div id=\"loader-wrapper\">\n        <div class=\"bubbles\">\n            <div class=\"title\">loading</div>\n            <span></span>\n            <span id=\"bubble2\"></span>\n            <span id=\"bubble3\"></span>\n        </div>\n    </div>\n\n    <div id=\"content-block\">\n\n        <div class=\"content-center fixed-header-margin\">\n             <!-- HEADER -->\n            {sn:global_header}\n\n            <div class=\"content-push\">\n\n                <div class=\"breadcrumb-box\">\n                    {exp:structure:breadcrumb here_as_title=\"yes\"}\n                </div>\n\n                <div class=\"information-blocks\">\n                    <div class=\"row\">\n                        <div class=\"col-md-12\">\n                            <div class=\"blog-landing-box type-1 detail-post\">\n                                <div class=\"blog-entry\">\n                                    <div class=\"content\">\n                                        <h1 class=\"title\">{title}</h1>\n                                        <div class=\"article-container style-1\">\n                                            {description}\n                                        </div>\n                                        \n                                    </div>\n                                </div>\n                            \n                                </div>\n                        </div>\n                    </div>\n                </div>\n           {/exp:channel:entries} \n            <div class=\"information-blocks\">\n                    <div class=\"accordeon size-1\">\n                        <div class=\"accordeon-title\"><span class=\"number\">1</span>Checkout Method</div>\n                        <div style=\"display: none;\" class=\"accordeon-entry\">\n                            <div class=\"article-container style-1\">\n                                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n                            </div>\n                        </div>\n                        <div class=\"accordeon-title\"><span class=\"number\">2</span>Billing Information</div>\n                        <div style=\"display: none;\" class=\"accordeon-entry\">\n                            <div class=\"article-container style-1\">\n                                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n                            </div>\n                        </div>\n                        <div class=\"accordeon-title\"><span class=\"number\">3</span>Shipping Information</div>\n                        <div class=\"accordeon-entry\">\n                            <div class=\"article-container style-1\">\n                                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n                            </div>\n                        </div>\n                        <div class=\"accordeon-title\"><span class=\"number\">4</span>Shipping Method</div>\n                        <div class=\"accordeon-entry\">\n                            <div class=\"article-container style-1\">\n                                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n                            </div>\n                        </div>\n                        <div class=\"accordeon-title\"><span class=\"number\">5</span>Payment Information</div>\n                        <div class=\"accordeon-entry\">\n                            <div class=\"article-container style-1\">\n                                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n                            </div>\n                        </div>\n                        <div class=\"accordeon-title\"><span class=\"number\">6</span>Order Review</div>\n                        <div class=\"accordeon-entry\">\n                            <div class=\"article-container style-1\">\n                                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            <div class=\"clear\"></div>\n            </div>\n\n    </div>\n                \n               \n                <!-- FOOTER -->\n        {sn:global_footer}\n\n        {sn:global_search}\n        \n        {sn:global_cart}\n         \n        {sn:global_html-footer}\n</body>\n</html>\n',NULL,1471896761,16,'n',0,'','n','n','o',0,'n'),
	(134,1,3,'special_page','y','webpage','{exp:channel:entries channel=\"special_page\" limit=\"1\" disable=\"categories|category_fields|member_data\"}\n<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->	\n{sn:global_html-header}\n<body class=\"style-10\">\n\n    <!-- LOADER -->\n    <div id=\"loader-wrapper\">\n        <div class=\"bubbles\">\n            <div class=\"title\">loading</div>\n            <span></span>\n            <span id=\"bubble2\"></span>\n            <span id=\"bubble3\"></span>\n        </div>\n    </div>\n\n    <div id=\"content-block\">\n\n        <div class=\"content-center fixed-header-margin\">\n             <!-- HEADER -->\n            {sn:global_header}\n\n        <div class=\"content-push\">\n\n                <div class=\"breadcrumb-box\">\n                    {exp:structure:breadcrumb here_as_title=\"yes\"}\n                </div>\n\n                <div class=\"information-blocks\">\n                    {main_image}<img class=\"project-thumbnail\" src=\"{main_image}\" alt=\"{title}\">{/if}\n                    <div class=\"row\">\n                        <div class=\"col-md-4 information-entry\">\n                            <div class=\"article-container style-1\">\n                                {panel_1}\n                                    <h2>{panel_1:title}</h2>\n                                    {panel_1:description}\n                                {/panel_1}\n                            </div>\n                        </div>\n                        <div class=\"col-md-4 information-entry\">\n                            <h3 class=\"block-title\">{panel_2_title}</h3>\n                            {panel_2_list}\n                            <div class=\"article-container style-1\">\n                                <h5>{panel_2_list:title}</h5>\n                                <p>{panel_2_list:short_description}</p>\n                            </div>\n                            {/panel_2_list}\n                        </div>\n                        <div class=\"col-md-4 information-entry\">\n                            <div class=\"accordeon\">\n                                {panel_3}\n                                <div class=\"accordeon-title\">{panel_3:title}</div>\n                                <div class=\"accordeon-entry\" style=\"display: none;\">\n                                    <div class=\"article-container style-1\">\n                                        {panel_3:description}\n                                    </div>\n                                </div>\n                                {/panel_3}\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                \n            </div>\n\n        </div>\n                \n               \n                <!-- FOOTER -->\n        {sn:global_footer}\n\n        {sn:global_search}\n        \n        {sn:global_cart}\n         \n        {sn:global_html-footer}\n</body>\n</html>\n{/exp:channel:entries}',NULL,1472493336,16,'n',0,'','n','n','o',0,'n');

/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_throttle`;

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_upload_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_no_access`;

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table exp_upload_prefs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs`;

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`)
VALUES
	(1,1,'Candidates','/Users/Paul/Sites/alignit/uploads/candidates/','http://align-it.dev/uploads/candidates/','all','','','','','','','','','','',NULL),
	(3,1,'Blinds Blog','/Applications/MAMP/htdocs/blinds/uploads/blog/','http://localhost/blinds/uploads/blog/','all','','','','','','','','','','',NULL),
	(4,1,'Products','/Applications/MAMP/htdocs/blinds/uploads/products/','http://localhost/blinds/uploads/products/','all','','','','','','','','','','',NULL);

/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_wygwam_configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_wygwam_configs`;

CREATE TABLE `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_wygwam_configs` WRITE;
/*!40000 ALTER TABLE `exp_wygwam_configs` DISABLE KEYS */;

INSERT INTO `exp_wygwam_configs` (`config_id`, `config_name`, `settings`)
VALUES
	(1,'Basic','YTo2OntzOjc6InRvb2xiYXIiO2E6MTA6e2k6MDtzOjQ6IkJvbGQiO2k6MTtzOjY6Ikl0YWxpYyI7aToyO3M6OToiVW5kZXJsaW5lIjtpOjM7czoxMjoiTnVtYmVyZWRMaXN0IjtpOjQ7czoxMjoiQnVsbGV0ZWRMaXN0IjtpOjU7czo0OiJMaW5rIjtpOjY7czo2OiJVbmxpbmsiO2k6NztzOjY6IkFuY2hvciI7aTo4O3M6NToiSW1hZ2UiO2k6OTtzOjEwOiJNZWRpYUVtYmVkIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czoxMDoidXBsb2FkX2RpciI7czowOiIiO3M6MTM6InJlc3RyaWN0X2h0bWwiO3M6MToieSI7fQ=='),
	(2,'Full','YTo3OntzOjc6InRvb2xiYXIiO2E6Mjk6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6MzoiQ3V0IjtpOjI7czo0OiJDb3B5IjtpOjM7czo1OiJQYXN0ZSI7aTo0O3M6OToiUGFzdGVUZXh0IjtpOjU7czoxMzoiUGFzdGVGcm9tV29yZCI7aTo2O3M6NDoiVW5kbyI7aTo3O3M6NDoiUmVkbyI7aTo4O3M6NToiU2NheXQiO2k6OTtzOjQ6IkJvbGQiO2k6MTA7czo2OiJJdGFsaWMiO2k6MTE7czo2OiJTdHJpa2UiO2k6MTI7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjEzO3M6MTI6Ik51bWJlcmVkTGlzdCI7aToxNDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6MTU7czo3OiJPdXRkZW50IjtpOjE2O3M6NjoiSW5kZW50IjtpOjE3O3M6MTA6IkJsb2NrcXVvdGUiO2k6MTg7czo0OiJMaW5rIjtpOjE5O3M6NjoiVW5saW5rIjtpOjIwO3M6NjoiQW5jaG9yIjtpOjIxO3M6NToiSW1hZ2UiO2k6MjI7czo1OiJUYWJsZSI7aToyMztzOjE0OiJIb3Jpem9udGFsUnVsZSI7aToyNDtzOjExOiJTcGVjaWFsQ2hhciI7aToyNTtzOjg6IlJlYWRNb3JlIjtpOjI2O3M6NjoiU3R5bGVzIjtpOjI3O3M6NjoiRm9ybWF0IjtpOjI4O3M6ODoiTWF4aW1pemUiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjk6InBhcnNlX2NzcyI7YjowO3M6MTM6InJlc3RyaWN0X2h0bWwiO3M6MToieSI7czoxMDoidXBsb2FkX2RpciI7czowOiIiO30='),
	(3,'Candidates','YTo2OntzOjc6InRvb2xiYXIiO2E6ODp7aTowO3M6NDoiQm9sZCI7aToxO3M6NjoiSXRhbGljIjtpOjI7czo5OiJVbmRlcmxpbmUiO2k6MztzOjEyOiJOdW1iZXJlZExpc3QiO2k6NDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NTtzOjQ6IkxpbmsiO2k6NjtzOjY6IlVubGluayI7aTo3O3M6NjoiQW5jaG9yIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czoxMDoidXBsb2FkX2RpciI7czoxOiIxIjtzOjEzOiJyZXN0cmljdF9odG1sIjtzOjE6InkiO30=');

/*!40000 ALTER TABLE `exp_wygwam_configs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_zoo_visitor_activation_membergroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_zoo_visitor_activation_membergroup`;

CREATE TABLE `exp_zoo_visitor_activation_membergroup` (
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_zoo_visitor_activation_membergroup` WRITE;
/*!40000 ALTER TABLE `exp_zoo_visitor_activation_membergroup` DISABLE KEYS */;

INSERT INTO `exp_zoo_visitor_activation_membergroup` (`member_id`, `group_id`)
VALUES
	(9,7),
	(10,7),
	(11,7),
	(12,7),
	(13,7);

/*!40000 ALTER TABLE `exp_zoo_visitor_activation_membergroup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_zoo_visitor_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_zoo_visitor_settings`;

CREATE TABLE `exp_zoo_visitor_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) NOT NULL,
  `var_value` text NOT NULL,
  `var_fieldtype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exp_zoo_visitor_settings` WRITE;
/*!40000 ALTER TABLE `exp_zoo_visitor_settings` DISABLE KEYS */;

INSERT INTO `exp_zoo_visitor_settings` (`id`, `site_id`, `var`, `var_value`, `var_fieldtype`)
VALUES
	(1,1,'member_channel_id','6','select'),
	(2,1,'anonymous_member_id','2','select'),
	(3,1,'redirect_after_activation','no','select'),
	(4,1,'redirect_location','','textinput'),
	(5,1,'email_is_username','yes','select'),
	(6,1,'email_confirmation','yes','select'),
	(7,1,'password_confirmation','yes','select'),
	(8,1,'use_screen_name','no','select'),
	(9,1,'new_entry_status','incomplete_profile','textinput'),
	(10,1,'incomplete_status','incomplete_profile','textinput'),
	(11,1,'screen_name_override','field_id_7 field_id_8 field_id_46','textinput'),
	(12,1,'title_override','field_id_7 field_id_8 field_id_46','textinput'),
	(13,1,'sync_standard_member_fields','','textinput'),
	(14,1,'sync_custom_member_fields','','textinput'),
	(15,1,'hide_link_to_existing_member','no','textinput'),
	(16,1,'redirect_view_all_members','no','select'),
	(17,1,'membergroup_as_status','yes','select'),
	(18,1,'delete_member_when_deleting_entry','no','select'),
	(19,1,'redirect_member_edit_profile_to_edit_channel_entry','no','select');

/*!40000 ALTER TABLE `exp_zoo_visitor_settings` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
