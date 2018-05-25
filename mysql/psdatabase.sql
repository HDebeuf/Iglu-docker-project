USE db_projectsend_project;
CREATE TABLE `tbl_actions_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `action` int(2) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_user` text,
  `affected_file` int(11) DEFAULT NULL,
  `affected_account` int(11) DEFAULT NULL,
  `affected_file_name` text,
  `affected_account_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `original_url` text NOT NULL,
  `filename` text NOT NULL,
  `description` text NOT NULL,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `uploader` varchar(60) NOT NULL,
  `expires` int(1) NOT NULL DEFAULT '0',
  `expiry_date` timestamp NOT NULL DEFAULT '2019-01-01 00:00:01',
  `public_allow` int(1) NOT NULL DEFAULT '0',
  `public_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(60) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `address` text,
  `phone` varchar(32) DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `contact` text,
  `created_by` varchar(60) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `account_requested` tinyint(1) NOT NULL DEFAULT '0',
  `account_denied` tinyint(1) NOT NULL DEFAULT '0',
  `max_file_size` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `public_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `tbl_groups` (`id`, `timestamp`, `created_by`, `name`, `description`, `public`, `public_token`) VALUES
(1, NULL,	'webmaster',	'Customers',	'',	1,	'o1ahbTBqFT5R1izuwi93suibXrZ3mu0A'),
(2,	NULL,	'webmaster',	'Stake holders',	'',	1,	'vOAmPPepgXyLq5E5SLvi6GoUI477DF2Z'),
(3,	NULL,	'webmaster',	'Marketing',	'',	1,	'xRsgOJbzBeeXcI6N1foc2HE8G8g90jJn'),
(4,	NULL,	'webmaster',	'Tech',	'',	1,	'xFmK5zGsB9frvNR7IgNVAPSq1wc8Z2qm');

CREATE TABLE `tbl_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(32) NOT NULL,
  `client_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `tbl_members_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_members_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_options` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

INSERT INTO `tbl_options` (`id`, `name`, `value`) VALUES
(1,	'base_uri',	'https://cloud.projectdomainurl'),
(2,	'max_thumbnail_width',	'100'),
(3,	'max_thumbnail_height',	'100'),
(4,	'thumbnails_folder',	'../../img/custom/thumbs/'),
(5,	'thumbnail_default_quality',	'90'),
(6,	'max_logo_width',	'300'),
(7,	'max_logo_height',	'300'),
(8,	'this_install_title',	'projectnamewithspaces cloud'),
(9,	'selected_clients_template',	'default'),
(10,	'logo_thumbnails_folder',	'/img/custom/thumbs'),
(11,	'timezone',	'Europe/Brussels'),
(12,	'timeformat',	'd/m/Y'),
(13,	'allowed_file_types',	'7z,ace,ai,avi,bin,bmp,cdr,doc,docm,docx,eps,fla,flv,gif,gz,gzip,htm,html,iso,jpeg,jpg,mp3,mp4,mpg,odt,oog,ppt,pptx,pptm,pps,ppsx,pdf,png,psd,rar,rtf,tar,tif,tiff,txt,wav,xls,xlsm,xlsx,zip'),
(14,	'logo_filename',	'logo.png'),
(15,	'admin_email_address',	'webmaster@projectdomainurl'),
(16,	'clients_can_register',	'1'),
(17,	'last_update',	'1053'),
(18,	'mail_system_use',	'smtp'),
(19,	'mail_smtp_host',	'smtp.projectdomainurl'),
(20,	'mail_smtp_port',	'587'),
(21,	'mail_smtp_user',	'noreply@projectdomainurl'),
(22,	'mail_smtp_pass',	'smtppassword'),
(23,	'mail_from_name',	'projectnamewithspaces cloud'),
(24,	'thumbnails_use_absolute',	'0'),
(25,	'mail_copy_user_upload',	'0'),
(26,	'mail_copy_client_upload',	'0'),
(27,	'mail_copy_main_user',	'0'),
(28,	'mail_copy_addresses',	''),
(29,	'version_last_check',	'23-05-2018'),
(30,	'version_new_found',	'0'),
(31,	'version_new_number',	''),
(32,	'version_new_url',	''),
(33,	'version_new_chlog',	''),
(34,	'version_new_security',	''),
(35,	'version_new_features',	''),
(36,	'version_new_important',	''),
(37,	'clients_auto_approve',	'0'),
(38,	'clients_auto_group',	'3'),
(39,	'clients_can_upload',	'1'),
(40,	'clients_can_set_expiration_date',	'0'),
(41,	'email_new_file_by_user_customize',	'0'),
(42,	'email_new_file_by_client_customize',	'0'),
(43,	'email_new_client_by_user_customize',	'0'),
(44,	'email_new_client_by_self_customize',	'0'),
(45,	'email_new_user_customize',	'0'),
(46,	'email_new_file_by_user_text',	''),
(47,	'email_new_file_by_client_text',	''),
(48,	'email_new_client_by_user_text',	''),
(49,	'email_new_client_by_self_text',	''),
(50,	'email_new_user_text',	''),
(51,	'email_header_footer_customize',	'0'),
(52,	'email_header_text',	''),
(53,	'email_footer_text',	'<p>Powered by IGLU</p>'),
(54,	'email_pass_reset_customize',	'0'),
(55,	'email_pass_reset_text',	''),
(56,	'expired_files_hide',	'1'),
(57,	'notifications_max_tries',	'2'),
(58,	'notifications_max_days',	'15'),
(59,	'file_types_limit_to',	'all'),
(60,	'pass_require_upper',	'0'),
(61,	'pass_require_lower',	'0'),
(62,	'pass_require_number',	'0'),
(63,	'pass_require_special',	'0'),
(64,	'mail_smtp_auth',	'tls'),
(65,	'use_browser_lang',	'0'),
(66,	'clients_can_delete_own_files',	'1'),
(67,	'google_client_id',	''),
(68,	'google_client_secret',	''),
(69,	'google_signin_enabled',	'0'),
(70,	'recaptcha_enabled',	'0'),
(71,	'recaptcha_site_key',	''),
(72,	'recaptcha_secret_key',	''),
(73,	'clients_can_select_group',	'public'),
(74,	'files_descriptions_use_ckeditor',	'0'),
(75,	'enable_landing_for_all_files',	'0'),
(76,	'footer_custom_enable',	'1'),
(77,	'footer_custom_content',	'Powered by IGLU'),
(78,	'email_new_file_by_user_subject_customize',	'0'),
(79,	'email_new_file_by_client_subject_customize',	'0'),
(80,	'email_new_client_by_user_subject_customize',	'0'),
(81,	'email_new_client_by_self_subject_customize',	'0'),
(82,	'email_new_user_subject_customize',	'0'),
(83,	'email_pass_reset_subject_customize',	'0'),
(84,	'email_new_file_by_user_subject',	''),
(85,	'email_new_file_by_client_subject',	''),
(86,	'email_new_client_by_user_subject',	''),
(87,	'email_new_client_by_self_subject',	''),
(88,	'email_new_user_subject',	''),
(89,	'email_pass_reset_subject',	''),
(90,	'privacy_noindex_site',	'1'),
(91,	'email_account_approve_subject_customize',	'0'),
(92,	'email_account_deny_subject_customize',	'0'),
(93,	'email_account_approve_customize',	'0'),
(94,	'email_account_deny_customize',	'0'),
(95,	'email_account_approve_subject',	''),
(96,	'email_account_deny_subject',	''),
(97,	'email_account_approve_text',	''),
(98,	'email_account_deny_text',	''),
(99,	'email_client_edited_subject_customize',	'0'),
(100,	'email_client_edited_customize',	'0'),
(101,	'email_client_edited_subject',	''),
(102,	'email_client_edited_text',	''),
(103,	'public_listing_page_enable',	'0'),
(104,	'public_listing_logged_only',	'1'),
(105,	'public_listing_show_all_files',	'1'),
(106,	'public_listing_use_download_link',	'1');

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `description` text,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `tbl_categories_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `tbl_categories` (`id`, `name`, `parent`, `description`, `created_by`, `timestamp`) VALUES
(1,	'Images',	NULL,	'All kind of images',	'webmaster', NULL),
(2,	'Documents',	NULL,	'All kind of documents',	'webmaster',	NULL),
(3,	'Reports',	NULL,	'All kind of reports',	'webmaster',	NULL),
(4,	'Analysis',	NULL,	'',	'webmaster',	NULL);

CREATE TABLE `tbl_categories_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `file_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `tbl_categories_relations_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_categories_relations_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `tbl_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `file_id` int(11) NOT NULL,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `remote_ip` varchar(45) DEFAULT NULL,
  `remote_host` text,
  `anonymous` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `tbl_downloads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_downloads_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `client_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `client_id` (`client_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `tbl_folders_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_folders_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_folders_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_files_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `file_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `hidden` int(1) NOT NULL,
  `download_count` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `client_id` (`client_id`),
  KEY `group_id` (`group_id`),
  KEY `folder_id` (`folder_id`),
  CONSTRAINT `tbl_files_relations_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_files_relations_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_files_relations_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_files_relations_ibfk_4` FOREIGN KEY (`folder_id`) REFERENCES `tbl_folders` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_members_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `requested_by` varchar(32) NOT NULL,
  `client_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `denied` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `tbl_members_requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_members_requests_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `file_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `upload_type` int(11) NOT NULL,
  `sent_status` int(2) NOT NULL,
  `times_failed` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `tbl_notifications_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_notifications_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_password_reset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `timestamp` timestamp DEFAULT CURRENT_TIMESTAMP,
  `used` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tbl_password_reset_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
