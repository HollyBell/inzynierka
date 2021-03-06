-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 15 Sty 2014, 02:16
-- Wersja serwera: 5.5.34-0ubuntu0.13.04.1
-- Wersja PHP: 5.5.7-1+sury.org~raring+1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Baza danych: `inzynierka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_ai1ec_events`
--

CREATE TABLE IF NOT EXISTS `wp_ai1ec_events` (
  `post_id` bigint(20) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `allday` tinyint(1) NOT NULL,
  `recurrence_rules` longtext,
  `exception_rules` longtext,
  `recurrence_dates` longtext,
  `exception_dates` longtext,
  `venue` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  `show_map` tinyint(1) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(32) DEFAULT NULL,
  `contact_email` varchar(128) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `ical_feed_url` varchar(255) DEFAULT NULL,
  `ical_source_url` varchar(255) DEFAULT NULL,
  `ical_organizer` varchar(255) DEFAULT NULL,
  `ical_contact` varchar(255) DEFAULT NULL,
  `ical_uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_ai1ec_event_category_colors`
--

CREATE TABLE IF NOT EXISTS `wp_ai1ec_event_category_colors` (
  `term_id` bigint(20) NOT NULL,
  `term_color` varchar(255) NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_ai1ec_event_feeds`
--

CREATE TABLE IF NOT EXISTS `wp_ai1ec_event_feeds` (
  `feed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feed_url` varchar(255) NOT NULL,
  `feed_category` bigint(20) NOT NULL,
  `feed_tags` varchar(255) NOT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_ai1ec_event_instances`
--

CREATE TABLE IF NOT EXISTS `wp_ai1ec_event_instances` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_calendar`
--

CREATE TABLE IF NOT EXISTS `wp_calendar` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_begin` date NOT NULL,
  `event_end` date NOT NULL,
  `event_title` varchar(30) NOT NULL,
  `event_desc` text NOT NULL,
  `event_time` time DEFAULT NULL,
  `event_recur` char(1) DEFAULT NULL,
  `event_repeats` int(3) DEFAULT NULL,
  `event_author` bigint(20) unsigned DEFAULT NULL,
  `event_category` bigint(20) unsigned NOT NULL DEFAULT '1',
  `event_link` text,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `wp_calendar`
--

INSERT INTO `wp_calendar` (`event_id`, `event_begin`, `event_end`, `event_title`, `event_desc`, `event_time`, `event_recur`, `event_repeats`, `event_author`, `event_category`, `event_link`) VALUES
(1, '2014-01-15', '2014-01-15', 'Test', 'Testowy', '02:14:00', 'S', 0, 1, 1, ''),
(2, '2014-01-15', '2014-01-15', 'test2', 'test2', '02:15:00', 'S', 0, 1, 1, ''),
(3, '2014-01-15', '2014-01-15', 'test3', 'test3', '02:15:00', 'S', 0, 1, 1, ''),
(4, '2014-01-15', '2014-01-15', 'test4', 'test4', '02:15:00', 'S', 0, 1, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_calendar_categories`
--

CREATE TABLE IF NOT EXISTS `wp_calendar_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `category_colour` varchar(30) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `wp_calendar_categories`
--

INSERT INTO `wp_calendar_categories` (`category_id`, `category_name`, `category_colour`) VALUES
(1, 'General', '#F6F79B');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_calendar_config`
--

CREATE TABLE IF NOT EXISTS `wp_calendar_config` (
  `config_item` varchar(30) NOT NULL,
  `config_value` text NOT NULL,
  PRIMARY KEY (`config_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wp_calendar_config`
--

INSERT INTO `wp_calendar_config` (`config_item`, `config_value`) VALUES
('calendar_style', '    .calnk a:hover {\r\n        background-position:0 0;\r\n        text-decoration:none;  \r\n        color:#000000;\r\n        border-bottom:1px dotted #000000;\r\n     }\r\n    .calnk a:visited {\r\n        text-decoration:none;\r\n        color:#000000;\r\n        border-bottom:1px dotted #000000;\r\n    }\r\n    .calnk a {\r\n        text-decoration:none; \r\n        color:#000000; \r\n        border-bottom:1px dotted #000000;\r\n    }\r\n    .calnk a span { \r\n        display:none; \r\n    }\r\n    .calnk a:hover span {\r\n        color:#333333; \r\n        background:#F6F79B; \r\n        display:block;\r\n        position:absolute; \r\n        margin-top:1px; \r\n        padding:5px; \r\n        width:150px; \r\n        z-index:100;\r\n        line-height:1.2em;\r\n    }\r\n    .calendar-table {\r\n        border:0 !important;\r\n        width:100% !important;\r\n        border-collapse:separate !important;\r\n        border-spacing:2px !important;\r\n    }\r\n    .calendar-heading {\r\n        height:25px;\r\n        text-align:center;\r\n        border:1px solid #D6DED5;\r\n        background-color:#E4EBE3;\r\n        color:#000;\r\n    }\r\n    .calendar-next {\r\n        width:25%;\r\n        text-align:center;\r\n    }\r\n    .calendar-prev {\r\n        width:25%;\r\n        text-align:center;\r\n    }\r\n    .calendar-month {\r\n        width:50%;\r\n        text-align:center;\r\n        font-weight:bold;\r\n    }\r\n    .normal-day-heading {\r\n        text-align:center;\r\n        width:25px;\r\n        height:25px;\r\n        font-size:0.8em;\r\n        border:1px solid #DFE6DE;\r\n        background-color:#aaa;\r\n    }\r\n    .weekend-heading {\r\n        text-align:center;\r\n        width:25px;\r\n        height:25px;\r\n        font-size:0.8em;\r\n        border:1px solid #DFE6DE;\r\n        background-color:#EBF2EA;\r\n        color:#FF0000;\r\n    }\r\n    .day-with-date {\r\n        vertical-align:text-top;\r\n        text-align:left;\r\n        width:60px;\r\n        height:60px;\r\ncolor:#fff;\r\n        border:1px solid #DFE6DE;\r\n    }\r\n    .no-events {\r\n\r\n    }\r\n    .day-without-date {\r\n        width:60px;\r\n        height:60px;\r\n        border:1px solid #E9F0E8;\r\n    }\r\n    span.weekend {\r\n        color:#FF0000;\r\n    }\r\n    .current-day {\r\n        vertical-align:text-top;\r\n        text-align:left;\r\n        width:60px;\r\n        height:60px;\r\ncolor:#fff\r\n        border:1px solid red;\r\n        background-color:#777;\r\n    }\r\n    span.event {\r\n        font-size:0.75em;\r\n    }\r\n    .kjo-link {\r\n        font-size:0.75em;\r\n        text-align:center;\r\n    }\r\n    .calendar-date-switcher {\r\n        height:25px;\r\n        text-align:center;\r\n        border:1px solid #D6DED5;\r\n        background-color:#E4EBE3;\r\n    }\r\n    .calendar-date-switcher form {\r\n        margin:2px;\r\n    }\r\n    .calendar-date-switcher input {\r\n        border:1px #D6DED5 solid;\r\n        margin:0;\r\n    }\r\n    .calendar-date-switcher select {\r\n        border:1px #D6DED5 solid;\r\n        margin:0;\r\n    }\r\n    .calnk a:hover span span.event-title {\r\n        padding:0;\r\n        text-align:center;\r\n        font-weight:bold;\r\n        font-size:1.2em;\r\n        margin-left:0px;\r\n    }\r\n    .calnk a:hover span span.event-title-break {\r\n        width:96%;\r\n        text-align:center;\r\n        height:1px;\r\n        margin-top:5px;\r\n        margin-right:2%;\r\n        padding:0;\r\n        background-color:#000000;\r\n        margin-left:0px;\r\n    }\r\n    .calnk a:hover span span.event-content-break {\r\n        width:96%;\r\n        text-align:center;\r\n        height:1px;\r\n        margin-top:5px;\r\n        margin-right:2%;\r\n        padding:0;\r\n        background-color:#000000;\r\n        margin-left:0px;\r\n    }\r\n    .page-upcoming-events {\r\n        font-size:80%;\r\n    }\r\n    .page-todays-events {\r\n        font-size:80%;\r\n    }\r\n    .calendar-table table,tbody,tr,td {\r\n        margin:0 !important;\r\n        padding:0 !important;\r\n    }\r\n    table.calendar-table {\r\n        margin-bottom:5px !important;\r\n    }\r\n    .cat-key {\r\n        width:100%;\r\n        margin-top:30px;\r\n        padding:5px;\r\n        border:0 !important;\r\n    }\r\n    .cal-separate {\r\n       border:0 !important;\r\n       margin-top:10px;\r\n    }\r\n    table.cat-key {\r\n       margin-top:5px !important;\r\n       border:1px solid #DFE6DE !important;\r\n       border-collapse:separate !important;\r\n       border-spacing:4px !important;\r\n       margin-left:2px !important;\r\n       width:99.5% !important;\r\n       margin-bottom:5px !important;\r\n    }\r\n    .cat-key td {\r\n       border:0 !important;\r\n    }'),
('calendar_version', '1.2'),
('can_manage_events', 'edit_posts'),
('display_author', 'false'),
('display_jump', 'false'),
('display_todays', 'true'),
('display_upcoming', 'true'),
('display_upcoming_days', '7'),
('enable_categories', 'false');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_guestbook`
--

CREATE TABLE IF NOT EXISTS `wp_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Zrzut danych tabeli `wp_guestbook`
--

INSERT INTO `wp_guestbook` (`id`, `nickname`, `email`, `content`) VALUES
(1, 'fwqef', 'efw@o2.pl', 'efw'),
(2, 'Andrzej', 'arhimenrius@gmail.com', 'vdvs'),
(3, 'andrzej', 'test@koszmial.pl', 'test'),
(4, 'Andrzej Wojtyś', 'arhimenrius@gmail.com', 'test'),
(5, 'tak', 'arhimenrius@gmail.com', 'tak'),
(6, 'test', 'test@test.pl', 'test'),
(7, 'test', 'test@test.pl', 'test'),
(8, 'test2', 'te2@koszmail.pl', 'test'),
(9, 'test2', 'te2@koszmail.pl', 'test');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=874 ;

--
-- Zrzut danych tabeli `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://inzynierka.local', 'yes'),
(2, 'blogname', 'Praca Inżynierska', 'yes'),
(3, 'blogdescription', 'Kolejna witryna oparta na WordPressie', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'krzysztof.siwek2@gmail.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'j F Y', 'yes'),
(23, 'time_format', 'H:i', 'yes'),
(24, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '/%postname%/', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:3:{i:0;s:19:"bbpress/bbpress.php";i:1;s:21:"calendar/calendar.php";i:2;s:23:"guestbook/guestbook.php";}', 'yes'),
(36, 'home', 'http://inzynierka.local', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '0', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', '', 'no'),
(44, 'template', 'inzynierka', 'yes'),
(45, 'stylesheet', 'inzynierka', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '1', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '25824', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'posts', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:0:{}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:0:{}', 'no'),
(86, 'timezone_string', 'Europe/Warsaw', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '0', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '25824', 'yes'),
(92, 'wp_user_roles', 'a:11:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:79:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:16:"read_ai1ec_event";b:1;s:16:"edit_ai1ec_event";b:1;s:17:"edit_ai1ec_events";b:1;s:24:"edit_others_ai1ec_events";b:1;s:25:"edit_private_ai1ec_events";b:1;s:27:"edit_published_ai1ec_events";b:1;s:18:"delete_ai1ec_event";b:1;s:19:"delete_ai1ec_events";b:1;s:26:"delete_others_ai1ec_events";b:1;s:29:"delete_published_ai1ec_events";b:1;s:27:"delete_private_ai1ec_events";b:1;s:20:"publish_ai1ec_events";b:1;s:25:"read_private_ai1ec_events";b:1;s:24:"manage_events_categories";b:1;s:18:"manage_ai1ec_feeds";b:1;s:19:"switch_ai1ec_themes";b:1;s:20:"manage_ai1ec_options";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:49:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:16:"read_ai1ec_event";b:1;s:16:"edit_ai1ec_event";b:1;s:17:"edit_ai1ec_events";b:1;s:24:"edit_others_ai1ec_events";b:1;s:25:"edit_private_ai1ec_events";b:1;s:27:"edit_published_ai1ec_events";b:1;s:18:"delete_ai1ec_event";b:1;s:19:"delete_ai1ec_events";b:1;s:26:"delete_others_ai1ec_events";b:1;s:29:"delete_published_ai1ec_events";b:1;s:27:"delete_private_ai1ec_events";b:1;s:20:"publish_ai1ec_events";b:1;s:25:"read_private_ai1ec_events";b:1;s:24:"manage_events_categories";b:1;s:18:"manage_ai1ec_feeds";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:25:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:16:"read_ai1ec_event";b:1;s:16:"edit_ai1ec_event";b:1;s:17:"edit_ai1ec_events";b:1;s:24:"edit_others_ai1ec_events";b:1;s:25:"edit_private_ai1ec_events";b:1;s:27:"edit_published_ai1ec_events";b:1;s:18:"delete_ai1ec_event";b:1;s:19:"delete_ai1ec_events";b:1;s:26:"delete_others_ai1ec_events";b:1;s:29:"delete_published_ai1ec_events";b:1;s:27:"delete_private_ai1ec_events";b:1;s:20:"publish_ai1ec_events";b:1;s:25:"read_private_ai1ec_events";b:1;s:24:"manage_events_categories";b:1;s:18:"manage_ai1ec_feeds";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:13:"bbp_keymaster";a:2:{s:4:"name";s:9:"Keymaster";s:12:"capabilities";a:29:{s:9:"keep_gate";b:1;s:8:"spectate";b:1;s:11:"participate";b:1;s:8:"moderate";b:1;s:8:"throttle";b:1;s:10:"view_trash";b:1;s:14:"publish_forums";b:1;s:11:"edit_forums";b:1;s:18:"edit_others_forums";b:1;s:13:"delete_forums";b:1;s:20:"delete_others_forums";b:1;s:19:"read_private_forums";b:1;s:18:"read_hidden_forums";b:1;s:14:"publish_topics";b:1;s:11:"edit_topics";b:1;s:18:"edit_others_topics";b:1;s:13:"delete_topics";b:1;s:20:"delete_others_topics";b:1;s:19:"read_private_topics";b:1;s:15:"publish_replies";b:1;s:12:"edit_replies";b:1;s:19:"edit_others_replies";b:1;s:14:"delete_replies";b:1;s:21:"delete_others_replies";b:1;s:20:"read_private_replies";b:1;s:17:"manage_topic_tags";b:1;s:15:"edit_topic_tags";b:1;s:17:"delete_topic_tags";b:1;s:17:"assign_topic_tags";b:1;}}s:13:"bbp_spectator";a:2:{s:4:"name";s:9:"Spectator";s:12:"capabilities";a:1:{s:8:"spectate";b:1;}}s:11:"bbp_blocked";a:2:{s:4:"name";s:7:"Blocked";s:12:"capabilities";a:28:{s:8:"spectate";b:0;s:11:"participate";b:0;s:8:"moderate";b:0;s:8:"throttle";b:0;s:10:"view_trash";b:0;s:14:"publish_forums";b:0;s:11:"edit_forums";b:0;s:18:"edit_others_forums";b:0;s:13:"delete_forums";b:0;s:20:"delete_others_forums";b:0;s:19:"read_private_forums";b:0;s:18:"read_hidden_forums";b:0;s:14:"publish_topics";b:0;s:11:"edit_topics";b:0;s:18:"edit_others_topics";b:0;s:13:"delete_topics";b:0;s:20:"delete_others_topics";b:0;s:19:"read_private_topics";b:0;s:15:"publish_replies";b:0;s:12:"edit_replies";b:0;s:19:"edit_others_replies";b:0;s:14:"delete_replies";b:0;s:21:"delete_others_replies";b:0;s:20:"read_private_replies";b:0;s:17:"manage_topic_tags";b:0;s:15:"edit_topic_tags";b:0;s:17:"delete_topic_tags";b:0;s:17:"assign_topic_tags";b:0;}}s:13:"bbp_moderator";a:2:{s:4:"name";s:9:"Moderator";s:12:"capabilities";a:25:{s:8:"spectate";b:1;s:11:"participate";b:1;s:8:"moderate";b:1;s:8:"throttle";b:1;s:10:"view_trash";b:1;s:14:"publish_forums";b:1;s:11:"edit_forums";b:1;s:19:"read_private_forums";b:1;s:18:"read_hidden_forums";b:1;s:14:"publish_topics";b:1;s:11:"edit_topics";b:1;s:18:"edit_others_topics";b:1;s:13:"delete_topics";b:1;s:20:"delete_others_topics";b:1;s:19:"read_private_topics";b:1;s:15:"publish_replies";b:1;s:12:"edit_replies";b:1;s:19:"edit_others_replies";b:1;s:14:"delete_replies";b:1;s:21:"delete_others_replies";b:1;s:20:"read_private_replies";b:1;s:17:"manage_topic_tags";b:1;s:15:"edit_topic_tags";b:1;s:17:"delete_topic_tags";b:1;s:17:"assign_topic_tags";b:1;}}s:15:"bbp_participant";a:2:{s:4:"name";s:11:"Participant";s:12:"capabilities";a:8:{s:8:"spectate";b:1;s:11:"participate";b:1;s:19:"read_private_forums";b:1;s:14:"publish_topics";b:1;s:11:"edit_topics";b:1;s:15:"publish_replies";b:1;s:12:"edit_replies";b:1;s:17:"assign_topic_tags";b:1;}}s:21:"ai1ec_event_assistant";a:2:{s:4:"name";s:17:"Event Contributor";s:12:"capabilities";a:4:{s:4:"read";b:1;s:7:"level_0";b:1;s:17:"edit_ai1ec_events";b:1;s:18:"delete_ai1ec_event";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:3:{i:2;a:1:{s:5:"title";s:0:"";}i:3;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:7:{s:18:"orphaned_widgets_1";a:7:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";i:6;s:7:"pages-2";}s:12:"home_right_1";a:1:{i:0;s:8:"search-3";}s:19:"wp_inactive_widgets";a:0:{}s:18:"bottom_widget_area";a:1:{i:0;s:18:"guestbook_widget-2";}s:17:"forum_widget_area";a:4:{i:0;s:18:"bbp_login_widget-2";i:1;s:18:"bbp_stats_widget-2";i:2;s:18:"bbp_views_widget-2";i:3;s:20:"bbp_replies_widget-2";}s:19:"sidebar_widget_area";a:1:{i:0;s:20:"widget_wpmemwidget-2";}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:6:{i:1389764104;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1389764982;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1389765600;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1389779731;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1389833998;a:1:{s:10:"ai1ec_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:2:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:39:"https://wordpress.org/wordpress-3.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:39:"https://wordpress.org/wordpress-3.8.zip";s:10:"no_content";s:50:"https://wordpress.org/wordpress-3.8-no-content.zip";s:11:"new_bundled";s:51:"https://wordpress.org/wordpress-3.8-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"3.8";s:7:"version";s:3:"3.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":10:{s:8:"response";s:10:"autoupdate";s:8:"download";s:39:"https://wordpress.org/wordpress-3.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:39:"https://wordpress.org/wordpress-3.8.zip";s:10:"no_content";s:50:"https://wordpress.org/wordpress-3.8-no-content.zip";s:11:"new_bundled";s:51:"https://wordpress.org/wordpress-3.8-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"3.8";s:7:"version";s:3:"3.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1389744827;s:15:"version_checked";s:5:"3.7.1";s:12:"translations";a:0:{}}', 'yes'),
(105, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1389744835;s:7:"checked";a:2:{s:10:"inzynierka";s:0:"";s:14:"twentythirteen";s:3:"1.1";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(108, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:23:"http://inzynierka.local";s:4:"link";s:99:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://inzynierka.local/";s:3:"url";s:129:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://wordpress.loc/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:25:"Blog o rozwoju WordPressa";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:41:"Pozostałe nowości dotyczące WordPressa";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(109, 'can_compress_scripts', '0', 'yes'),
(179, 'theme_mods_twentythirteen', 'a:2:{s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1384086230;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:7:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";i:6;s:7:"pages-2";}s:9:"sidebar-2";a:0:{}}}}', 'yes'),
(180, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(189, 'recently_activated', 'a:1:{s:51:"admin_panel_user_filter/admin_panel_user_filter.php";i:1389747191;}', 'yes'),
(246, 'widget_pages', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:6:"sortby";s:10:"post_title";s:7:"exclude";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(291, '_transient_random_seed', '8da058448ad093298d511e77e84f0043', 'yes'),
(296, 'current_theme', '', 'yes'),
(297, 'theme_mods_inzynierka', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:5:{s:9:"Main-menu";i:2;s:10:"Teams-menu";i:3;s:14:"Documents-menu";i:4;s:17:"Informations-menu";i:5;s:12:"Gallery-menu";i:6;}}', 'yes'),
(298, 'theme_switched', '', 'yes'),
(360, '_site_transient_timeout_browser_bbe3114ca0e8997649f53de7eaf63d63', '1385905038', 'yes'),
(361, '_site_transient_browser_bbe3114ca0e8997649f53de7eaf63d63', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"29.0.1547.76";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(426, 'widget_guestbook_widget', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(476, '_site_transient_timeout_browser_bb8e13ff23f637df7af9eaffa7452f0c', '1386628274', 'yes'),
(477, '_site_transient_browser_bb8e13ff23f637df7af9eaffa7452f0c', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"31.0.1650.57";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(615, '_bbp_private_forums', 'a:0:{}', 'yes'),
(616, '_bbp_hidden_forums', 'a:0:{}', 'yes'),
(617, '_bbp_db_version', '250', 'yes'),
(623, 'widget_bbp_login_widget', 'a:2:{i:2;a:3:{s:5:"title";s:12:"Zaloguj się";s:8:"register";s:0:"";s:8:"lostpass";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(624, 'widget_bbp_forums_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(625, 'widget_bbp_views_widget', 'a:2:{i:2;a:1:{s:5:"title";s:14:"Lista tematów";}s:12:"_multiwidget";i:1;}', 'yes'),
(639, 'widget_bbp_stats_widget', 'a:2:{i:2;a:1:{s:5:"title";s:10:"Statystyki";}s:12:"_multiwidget";i:1;}', 'yes'),
(640, 'widget_bbp_search_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(641, 'widget_bbp_replies_widget', 'a:2:{i:2;a:4:{s:5:"title";s:14:"Ostatnie posty";s:9:"show_date";b:0;s:9:"show_user";b:0;s:9:"max_shown";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(692, 'wpmembers_settings', 'a:12:{i:0;s:6:"2.8.10";i:1;s:1:"1";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;i:10;i:0;i:11;i:0;}', 'yes'),
(693, 'wpmembers_fields', 'a:12:{i:0;a:8:{i:0;i:1;i:1;s:5:"Imię";i:2;s:10:"first_name";i:3;s:4:"text";i:4;s:1:"y";i:5;s:1:"y";i:6;s:1:"y";i:7;s:0:"";}i:1;a:8:{i:0;i:2;i:1;s:8:"Nazwisko";i:2;s:9:"last_name";i:3;s:4:"text";i:4;s:1:"y";i:5;s:1:"y";i:6;s:1:"y";i:7;s:0:"";}i:2;a:8:{i:0;i:3;i:1;s:5:"Email";i:2;s:10:"user_email";i:3;s:4:"text";i:4;s:1:"y";i:5;s:1:"y";i:6;s:1:"y";i:7;s:0:"";}i:3;a:8:{i:0;i:4;i:1;s:18:"Strona internetowa";i:2;s:8:"user_url";i:3;s:4:"text";i:4;s:0:"";i:5;s:0:"";i:6;s:1:"y";i:7;s:0:"";}i:4;a:8:{i:0;i:5;i:1;s:3:"AIM";i:2;s:3:"aim";i:3;s:4:"text";i:4;s:0:"";i:5;s:0:"";i:6;s:1:"y";i:7;s:0:"";}i:5;a:8:{i:0;i:6;i:1;s:8:"Yahoo IM";i:2;s:3:"yim";i:3;s:4:"text";i:4;s:0:"";i:5;s:0:"";i:6;s:1:"y";i:7;s:0:"";}i:6;a:8:{i:0;i:7;i:1;s:18:"Jabber/Google Talk";i:2;s:6:"jabber";i:3;s:4:"text";i:4;s:0:"";i:5;s:0:"";i:6;s:1:"y";i:7;s:0:"";}i:7;a:8:{i:0;i:8;i:1;s:17:"Biographical Info";i:2;s:11:"description";i:3;s:8:"textarea";i:4;s:0:"";i:5;s:0:"";i:6;s:1:"y";i:7;s:0:"";}i:8;a:8:{i:0;i:9;i:1;s:8:"Drużyna";i:2;s:7:"druzyna";i:3;s:6:"select";i:4;s:1:"y";i:5;s:1:"y";i:6;s:1:"n";i:7;a:5:{i:0;s:23:"<---- Select One ---->|";i:1;s:19:"1Dignitas|1Dignitas";i:2;s:15:"8Viator|8Viator";i:3;s:19:"6Tenebris|6Tenebris";i:4;s:19:"Chochliki|Chochliki";}}i:9;a:8:{i:0;i:10;i:1;s:7:"Zastęp";i:2;s:6:"zastep";i:3;s:4:"text";i:4;s:1:"y";i:5;s:1:"y";i:6;s:1:"n";i:7;s:0:"";}i:10;a:8:{i:0;i:11;i:1;s:8:"Stopień";i:2;s:7:"stopien";i:3;s:6:"select";i:4;s:1:"y";i:5;s:1:"y";i:6;s:1:"n";i:7;a:6:{i:0;s:23:"<---- Select One ---->|";i:1;s:42:"Młodzik / Ochotniczka|mlodzik_ochotniczka";i:2;s:47:"Wywiadowca / Tropicielka|wywiadowca_tropicielka";i:3;s:36:"Ćwik / Samarytanka|cwik_samarytanka";i:4;s:33:"Harcerz Orli / Harcerka Orla|orli";i:5;s:66:"Harcerz Rzeczpospolitej / Harcerka Rzeczpospolitej|rzeczpospolitej";}}i:11;a:8:{i:0;i:12;i:1;s:6:"O mnie";i:2;s:6:"o_mnie";i:3;s:8:"textarea";i:4;s:1:"y";i:5;s:0:"";i:6;s:1:"n";i:7;s:0:"";}}', 'yes'),
(694, 'wpmembers_dialogs', 'a:9:{i:0;s:176:"Zawartość jest dostępna tylko dla zarejestrowanych osób. Jeżeli jesteś zarejestrowany/a, prosimy o zalogowanie się. Nowi użytkownicy mogą się zarejestrować poniżej.";i:1;s:90:"Przepraszamy, wybrana nazwa użytkownika jest już zajęta, spróbuj wybrać inną nazwę.";i:2;s:87:"Przepraszamy, ten adres email jest już zarejestrowany.<br />Prosimy o wpisanie innego.";i:3;s:150:"Gratulacje! Rejestracja przebiegła pomyślnie.<br /><br />Możesz teraz się zalogować używając hasła które zostało wysłane do Ciebie emailem.";i:4;s:41:"Zmiany w Twoich danych zostały zapisane!";i:5;s:70:"Podane hasła różnią się.<br /><br />Prosimy spróbować ponownie.";i:6;s:107:"Twoje hasło zostało zmienione!<br /><br />Musisz teraz zalogować się ponownie używając nowego hasła.";i:7;s:66:"Nazwa użytkownika lub email nie występuje w naszej bazie danych.";i:8;s:184:"Hasło zostało zresetowane.<br /><br />Nowe hasło zostało wysłane na adres email podany przy rejestracji. Po zalogowaniu możesz zmienić wygenerowane hasło na bardziej przyjazne.";}', 'yes'),
(695, 'wpmembers_tos', 'Put your TOS (Terms of Service) text here.  You can use HTML markup.', 'yes'),
(696, 'wpmembers_email_newreg', 'a:2:{s:4:"subj";s:37:"Your registration info for [blogname]";s:4:"body";s:268:"Thank you for registering for [blogname]\r\n\r\nYour registration information is below.\r\nYou may wish to retain a copy for your records.\r\n\r\nusername: [username]\r\npassword: [password]\r\n\r\nYou may login here:\r\n[reglink]\r\n\r\nYou may change your password here:\r\n[members-area]\r\n";}', 'yes'),
(697, 'wpmembers_email_newmod', 'a:2:{s:4:"subj";s:40:"Thank you for registering for [blogname]";s:4:"body";s:173:"Thank you for registering for [blogname]. \r\nYour registration has been received and is pending approval.\r\nYou will receive login instructions upon approval of your account\r\n";}', 'yes'),
(698, 'wpmembers_email_appmod', 'a:2:{s:4:"subj";s:50:"Your registration for [blogname] has been approved";s:4:"body";s:299:"Your registration for [blogname] has been approved.\r\n\r\nYour registration information is below.\r\nYou may wish to retain a copy for your records.\r\n\r\nusername: [username]\r\npassword: [password]\r\n\r\nYou may login and change your password here:\r\n[members-area]\r\n\r\nYou originally registered at:\r\n[reglink]\r\n";}', 'yes'),
(699, 'wpmembers_email_repass', 'a:2:{s:4:"subj";s:34:"Your password reset for [blogname]";s:4:"body";s:157:"Your password for [blogname] has been reset\r\n\r\nYour new password is included below. You may wish to retain a copy for your records.\r\n\r\npassword: [password]\r\n";}', 'yes'),
(700, 'wpmembers_email_notify', 'a:2:{s:4:"subj";s:36:"New user registration for [blogname]";s:4:"body";s:221:"The following user registered for [blogname] (and is pending approval)\r\n	\r\nusername: [username]\r\nemail: [email]\r\n\r\n[fields]\r\nThis user registered here:\r\n[reglink]\r\n\r\nuser IP: [user-ip]\r\n	\r\nactivate user: [activate-user]\r\n";}', 'yes'),
(701, 'wpmembers_email_footer', '----------------------------------\r\nThis is an automated message from [blogname]\r\nPlease do not reply to this address', 'yes'),
(702, 'wpmembers_style', 'http://inzynierka.local/wp-content/plugins/wp-members/css/wp-members-2014.css', 'yes'),
(703, 'widget_widget_wpmemwidget', 'a:2:{i:2;a:1:{s:5:"title";s:6:"Status";}s:12:"_multiwidget";i:1;}', 'yes'),
(708, 'wpmembers_attrib', '0', 'yes'),
(709, 'wpmembers_regurl', 'http://inzynierka.local/register/', 'yes'),
(710, 'wpmembers_autoex', 'a:2:{s:7:"auto_ex";i:0;s:11:"auto_ex_len";s:0:"";}', 'yes'),
(711, 'wpmembers_msurl', 'http://inzynierka.local/user-profile/', 'yes'),
(712, 'wpmembers_utfields', '', 'yes'),
(760, '_transient_timeout_feed_5a25458da46a336967a55e430a3eace5', '1389299621', 'no'),
(761, '_transient_feed_5a25458da46a336967a55e430a3eace5', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:36:"\n	\n	\n	\n	\n	\n	\n		\n		\n	\n	\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"RocketGeek Interactive";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:21:"http://rocketgeek.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:60:"Home of WP-Members, The Original WordPress Membership Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 09 Jan 2014 05:07:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:27:"http://wordpress.org/?v=3.8";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:5:{i:0;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:66:"Multiple Selection Checkboxes – Add A Section Heading (Advanced)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:96:"http://rocketgeek.com/filter-hooks/multiple-selection-checkboxes-add-a-section-heading-advanced/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:104:"http://rocketgeek.com/filter-hooks/multiple-selection-checkboxes-add-a-section-heading-advanced/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 09 Jan 2014 04:49:28 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:7:"Filters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"filters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"str_replace";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:4:"tips";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:19:"wpmem_register_form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"http://rocketgeek.com/?p=3787";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:326:"This tutorial is an extension of the tutorial on creating Multiple Selection Checkboxes.  This tutorial will add a little snippet to one of the functions in that tutorial to show you how to add a section heading to your group of checkboxes. The end result is to have a heading for the group of checkboxes, followed [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Chad Butler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:101:"http://rocketgeek.com/filter-hooks/multiple-selection-checkboxes-add-a-section-heading-advanced/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"Multiple Selection Checkboxes – Add A Section Heading (Basic)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://rocketgeek.com/filter-hooks/multiple-selection-checkboxes-add-a-section-heading-basic/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:101:"http://rocketgeek.com/filter-hooks/multiple-selection-checkboxes-add-a-section-heading-basic/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 07 Jan 2014 19:21:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:7:"Filters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"filters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"str_replace";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:4:"tips";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:19:"wpmem_register_form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"http://rocketgeek.com/?p=3768";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:323:"This tutorial is an extension of the tutorial on creating Multiple Selection Checkboxes.  This tutorial will add a little snippet to one of the functions in that tutorial to show you how to add a section heading to your group of checkboxes. This is a basic tutorial.  There is also a more advanced tutorial that [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Chad Butler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:98:"http://rocketgeek.com/filter-hooks/multiple-selection-checkboxes-add-a-section-heading-basic/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:36:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"WP-Members 2.8.10 released";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://rocketgeek.com/release-announcements/wp-members-2-8-10-released/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:79:"http://rocketgeek.com/release-announcements/wp-members-2-8-10-released/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 07 Jan 2014 03:08:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:21:"Release Announcements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"http://rocketgeek.com/?p=3755";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:363:"WP-Members 2.8.10 was released today.  This was an unexpected, but important security update. Some of you may have noticed that for a period of time today, WP-Members was unavailable in the wordpress.org repository.  This was because there was a security vulnerability discovered in the plugin.  It is the policy of wordpress.org to remove any plugin [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Chad Butler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:76:"http://rocketgeek.com/release-announcements/wp-members-2-8-10-released/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:39:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"WP-Members 2.8.9 release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://rocketgeek.com/uncategorized/wp-members-2-8-9-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:69:"http://rocketgeek.com/uncategorized/wp-members-2-8-9-release/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 31 Dec 2013 16:40:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:21:"Release Announcements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:13:"Uncategorized";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"http://rocketgeek.com/?p=3722";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:302:"I had initially expected that 2.8.8 would wrap up 2.8.x and the next release would be begin 2.9.  But it looks like we need one more update to get through the period before 2.9 will be ready. 2.8.9 contains a couple of fixes, some updates to deal with the new Twenty Fourteen theme, and some [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Chad Butler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:66:"http://rocketgeek.com/uncategorized/wp-members-2-8-9-release/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n		\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:4:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"Workaround for WP-Members front end login when using SI CAPTCHA on the WP login form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:121:"http://rocketgeek.com/uncategorized/workaround-for-wp-members-front-end-login-when-using-si-captcha-on-the-wp-login-form/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:129:"http://rocketgeek.com/uncategorized/workaround-for-wp-members-front-end-login-when-using-si-captcha-on-the-wp-login-form/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Dec 2013 18:04:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:13:"Uncategorized";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:10:"add_filter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:12:"authenticate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:13:"remove_filter";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:10:"workaround";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"http://rocketgeek.com/?p=3690";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:378:"If you use SI CAPTCHA and have enabled it to implement a CAPTCHA on the WordPress login form (the backend login, wp-login.php), you will find that this is incompatible with WP-Members. What happens is that SI CAPTCHA removes the function wp_authenticate_username_password from the authenticate process with remove_filter.  This allows SI CAPTCHA then to implement its [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Chad Butler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:126:"http://rocketgeek.com/uncategorized/workaround-for-wp-members-front-end-login-when-using-si-captcha-on-the-wp-login-form/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:27:"http://rocketgeek.com/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:4:"date";s:29:"Thu, 09 Jan 2014 08:33:40 GMT";s:6:"server";s:6:"Apache";s:10:"x-pingback";s:35:"http://rocketgeek.com/wp/xmlrpc.php";s:4:"etag";s:34:""3115263bb79592dbf44a1546dd63dbc5"";s:13:"last-modified";s:29:"Thu, 09 Jan 2014 05:07:45 GMT";s:4:"vary";s:15:"Accept-Encoding";s:16:"content-encoding";s:4:"gzip";s:14:"content-length";s:4:"1804";s:10:"connection";s:5:"close";s:12:"content-type";s:23:"text/xml; charset=UTF-8";}s:5:"build";s:14:"20131105214922";}', 'no'),
(762, '_transient_timeout_feed_mod_5a25458da46a336967a55e430a3eace5', '1389299622', 'no'),
(763, '_transient_feed_mod_5a25458da46a336967a55e430a3eace5', '1389256422', 'no'),
(809, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1389687148', 'no'),
(810, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>Błąd RSS</strong>: WP HTTP Error: Recv failure: Connection reset by peer</p></div>', 'no'),
(811, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1389687148', 'no'),
(812, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>Błąd RSS</strong>: WP HTTP Error: Recv failure: Connection reset by peer</p></div>', 'no'),
(813, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1389687149', 'no'),
(814, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>Błąd RSS</strong>: WP HTTP Error: Recv failure: Connection reset by peer</p>', 'no'),
(815, '_transient_timeout_plugin_slugs', '1389834467', 'no'),
(816, '_transient_plugin_slugs', 'a:5:{i:0;s:19:"akismet/akismet.php";i:1;s:19:"bbpress/bbpress.php";i:2;s:21:"calendar/calendar.php";i:3;s:23:"guestbook/guestbook.php";i:4;s:9:"hello.php";}', 'no'),
(817, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1389687159', 'no'),
(818, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no'),
(833, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1389748058;s:7:"checked";a:5:{s:19:"akismet/akismet.php";s:5:"2.5.9";s:19:"bbpress/bbpress.php";s:5:"2.5.2";s:21:"calendar/calendar.php";s:5:"1.3.3";s:23:"guestbook/guestbook.php";s:3:"1.0";s:9:"hello.php";s:3:"1.6";}s:8:"response";a:1:{s:19:"bbpress/bbpress.php";O:8:"stdClass":5:{s:2:"id";s:5:"11780";s:4:"slug";s:7:"bbpress";s:11:"new_version";s:5:"2.5.3";s:3:"url";s:38:"https://wordpress.org/plugins/bbpress/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/bbpress.2.5.3.zip";}}s:12:"translations";a:0:{}}', 'yes'),
(834, 'wpfc_theme', '1', 'yes'),
(835, 'wpfc_theme_css', 'http://inzynierka.local/wp-content/plugins/wp-fullcalendar/includes/css/ui-themes/ui-lightness.css', 'yes'),
(836, 'wpfc_limit', '3', 'yes'),
(837, 'wpfc_limit_txt', 'more ...', 'yes'),
(838, 'wpfc_qtips', '1', 'yes'),
(839, 'wpfc_qtips_style', 'light', 'yes'),
(840, 'wpfc_qtips_my', 'top center', 'yes'),
(841, 'wpfc_qtips_at', 'bottom center', 'yes'),
(842, 'wpfc_qtips_rounded', '0', 'yes'),
(843, 'wpfc_qtips_image', '1', 'yes'),
(844, 'wpfc_qtips_image_w', '75', 'yes'),
(845, 'wpfc_qtips_image_h', '75', 'yes'),
(846, 'wpfc_timeFormat', 'h(:mm)t', 'yes'),
(847, 'wpfc_defaultView', 'month', 'yes'),
(848, 'wpfc_available_views', 'a:3:{i:0;s:5:"month";i:1;s:9:"basicWeek";i:2;s:8:"basicDay";}', 'yes'),
(849, 'wpfc_version', '1.0.1', 'yes'),
(850, 'wpfc_default_type', 'post', 'yes'),
(851, 'wpfc_qtips_shadow', '0', 'yes'),
(852, 'wpfc_scripts_limit', '', 'yes'),
(853, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(855, 'wpfc_post_taxonomies', 'a:1:{s:4:"post";a:3:{s:8:"category";s:1:"1";s:8:"post_tag";s:1:"1";s:11:"post_format";s:1:"1";}}', 'yes'),
(862, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1389758280', 'yes'),
(863, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"3898";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"2456";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"2344";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"1930";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"1856";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1583";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1329";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1325";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1310";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1260";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1225";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1121";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1000";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:3:"982";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:3:"974";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:3:"950";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:3:"844";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:3:"821";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:3:"780";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"722";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"686";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"681";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"678";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"623";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"615";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"595";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"572";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"570";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"541";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"539";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"530";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"522";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"506";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"505";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"471";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"458";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"453";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"452";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"436";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"432";}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(864, 'ai1ec_settings', 'O:14:"Ai1ec_Settings":30:{s:16:"calendar_page_id";i:0;s:21:"default_calendar_view";s:5:"month";s:14:"week_start_day";s:1:"1";s:22:"agenda_events_per_page";s:2:"10";s:21:"calendar_css_selector";s:0:"";s:21:"include_events_in_rss";b:0;s:25:"allow_publish_to_facebook";b:0;s:20:"facebook_credentials";N;s:26:"user_role_can_create_event";N;s:9:"cron_freq";s:5:"daily";s:8:"timezone";s:13:"Europe/Warsaw";s:19:"exclude_from_search";b:0;s:19:"show_publish_button";b:0;s:23:"hide_maps_until_clicked";b:0;s:22:"agenda_events_expanded";b:0;s:24:"show_create_event_button";b:0;s:29:"turn_off_subscription_buttons";b:0;s:17:"inject_categories";b:0;s:17:"input_date_format";s:3:"def";s:14:"input_24h_time";b:0;s:13:"settings_page";N;s:10:"feeds_page";N;s:18:"geo_region_biasing";b:0;s:22:"show_data_notification";b:1;s:16:"show_intro_video";b:1;s:16:"allow_statistics";b:0;s:22:"disable_autocompletion";b:0;s:22:"show_location_in_title";b:1;s:25:"show_year_in_agenda_dates";b:0;s:20:"show_standard_notice";b:1;}', 'yes'),
(865, 'ai1ec_db_version', '109', 'yes'),
(866, 'ai1ec_cron_version', '105', 'yes'),
(869, 'rewrite_rules', 'a:174:{s:9:"forums/?$";s:25:"index.php?post_type=forum";s:39:"forums/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=forum&feed=$matches[1]";s:34:"forums/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=forum&feed=$matches[1]";s:26:"forums/page/([0-9]{1,})/?$";s:43:"index.php?post_type=forum&paged=$matches[1]";s:9:"topics/?$";s:25:"index.php?post_type=topic";s:39:"topics/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=topic&feed=$matches[1]";s:34:"topics/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=topic&feed=$matches[1]";s:26:"topics/page/([0-9]{1,})/?$";s:43:"index.php?post_type=topic&paged=$matches[1]";s:28:"forums/forum/([^/]+)/edit/?$";s:34:"index.php?forum=$matches[1]&edit=1";s:28:"forums/topic/([^/]+)/edit/?$";s:34:"index.php?topic=$matches[1]&edit=1";s:28:"forums/reply/([^/]+)/edit/?$";s:34:"index.php?reply=$matches[1]&edit=1";s:32:"forums/topic-tag/([^/]+)/edit/?$";s:38:"index.php?topic-tag=$matches[1]&edit=1";s:47:"forums/user/([^/]+)/topics/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_tops=1&paged=$matches[2]";s:48:"forums/user/([^/]+)/replies/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_reps=1&paged=$matches[2]";s:50:"forums/user/([^/]+)/favorites/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_favs=1&paged=$matches[2]";s:54:"forums/user/([^/]+)/subscriptions/page/?([0-9]{1,})/?$";s:59:"index.php?bbp_user=$matches[1]&bbp_subs=1&paged=$matches[2]";s:29:"forums/user/([^/]+)/topics/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_tops=1";s:30:"forums/user/([^/]+)/replies/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_reps=1";s:32:"forums/user/([^/]+)/favorites/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_favs=1";s:36:"forums/user/([^/]+)/subscriptions/?$";s:41:"index.php?bbp_user=$matches[1]&bbp_subs=1";s:27:"forums/user/([^/]+)/edit/?$";s:37:"index.php?bbp_user=$matches[1]&edit=1";s:22:"forums/user/([^/]+)/?$";s:30:"index.php?bbp_user=$matches[1]";s:40:"forums/view/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?bbp_view=$matches[1]&paged=$matches[2]";s:27:"forums/view/([^/]+)/feed/?$";s:47:"index.php?bbp_view=$matches[1]&feed=$matches[2]";s:22:"forums/view/([^/]+)/?$";s:30:"index.php?bbp_view=$matches[1]";s:34:"forums/search/page/?([0-9]{1,})/?$";s:27:"index.php?paged=$matches[1]";s:16:"forums/search/?$";s:20:"index.php?bbp_search";s:14:"ai1ec_event/?$";s:31:"index.php?post_type=ai1ec_event";s:44:"ai1ec_event/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=ai1ec_event&feed=$matches[1]";s:39:"ai1ec_event/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=ai1ec_event&feed=$matches[1]";s:31:"ai1ec_event/page/([0-9]{1,})/?$";s:49:"index.php?post_type=ai1ec_event&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:38:"forums/forum/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:48:"forums/forum/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:68:"forums/forum/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"forums/forum/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:63:"forums/forum/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"forums/forum/(.+?)/trackback/?$";s:32:"index.php?forum=$matches[1]&tb=1";s:51:"forums/forum/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?forum=$matches[1]&feed=$matches[2]";s:46:"forums/forum/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?forum=$matches[1]&feed=$matches[2]";s:39:"forums/forum/(.+?)/page/?([0-9]{1,})/?$";s:45:"index.php?forum=$matches[1]&paged=$matches[2]";s:46:"forums/forum/(.+?)/comment-page-([0-9]{1,})/?$";s:45:"index.php?forum=$matches[1]&cpage=$matches[2]";s:31:"forums/forum/(.+?)(/[0-9]+)?/?$";s:44:"index.php?forum=$matches[1]&page=$matches[2]";s:40:"forums/topic/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"forums/topic/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"forums/topic/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/topic/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/topic/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"forums/topic/([^/]+)/trackback/?$";s:32:"index.php?topic=$matches[1]&tb=1";s:53:"forums/topic/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?topic=$matches[1]&feed=$matches[2]";s:48:"forums/topic/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?topic=$matches[1]&feed=$matches[2]";s:41:"forums/topic/([^/]+)/page/?([0-9]{1,})/?$";s:45:"index.php?topic=$matches[1]&paged=$matches[2]";s:48:"forums/topic/([^/]+)/comment-page-([0-9]{1,})/?$";s:45:"index.php?topic=$matches[1]&cpage=$matches[2]";s:33:"forums/topic/([^/]+)(/[0-9]+)?/?$";s:44:"index.php?topic=$matches[1]&page=$matches[2]";s:29:"forums/topic/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"forums/topic/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"forums/topic/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/topic/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/topic/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"forums/reply/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"forums/reply/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"forums/reply/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/reply/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"forums/reply/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"forums/reply/([^/]+)/trackback/?$";s:32:"index.php?reply=$matches[1]&tb=1";s:41:"forums/reply/([^/]+)/page/?([0-9]{1,})/?$";s:45:"index.php?reply=$matches[1]&paged=$matches[2]";s:48:"forums/reply/([^/]+)/comment-page-([0-9]{1,})/?$";s:45:"index.php?reply=$matches[1]&cpage=$matches[2]";s:33:"forums/reply/([^/]+)(/[0-9]+)?/?$";s:44:"index.php?reply=$matches[1]&page=$matches[2]";s:29:"forums/reply/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"forums/reply/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"forums/reply/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/reply/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"forums/reply/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:57:"forums/topic-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?topic-tag=$matches[1]&feed=$matches[2]";s:52:"forums/topic-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?topic-tag=$matches[1]&feed=$matches[2]";s:45:"forums/topic-tag/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?topic-tag=$matches[1]&paged=$matches[2]";s:27:"forums/topic-tag/([^/]+)/?$";s:31:"index.php?topic-tag=$matches[1]";s:42:"forums/search/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?bbp_search=$matches[1]&paged=$matches[2]";s:24:"forums/search/([^/]+)/?$";s:32:"index.php?bbp_search=$matches[1]";s:58:"events_categories/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?events_categories=$matches[1]&feed=$matches[2]";s:53:"events_categories/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?events_categories=$matches[1]&feed=$matches[2]";s:46:"events_categories/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?events_categories=$matches[1]&paged=$matches[2]";s:28:"events_categories/([^/]+)/?$";s:39:"index.php?events_categories=$matches[1]";s:52:"events_tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?events_tags=$matches[1]&feed=$matches[2]";s:47:"events_tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?events_tags=$matches[1]&feed=$matches[2]";s:40:"events_tags/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?events_tags=$matches[1]&paged=$matches[2]";s:22:"events_tags/([^/]+)/?$";s:33:"index.php?events_tags=$matches[1]";s:53:"events_feeds/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:51:"index.php?events_feeds=$matches[1]&feed=$matches[2]";s:48:"events_feeds/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:51:"index.php?events_feeds=$matches[1]&feed=$matches[2]";s:41:"events_feeds/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?events_feeds=$matches[1]&paged=$matches[2]";s:23:"events_feeds/([^/]+)/?$";s:34:"index.php?events_feeds=$matches[1]";s:39:"ai1ec_event/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:49:"ai1ec_event/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"ai1ec_event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ai1ec_event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"ai1ec_event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"ai1ec_event/([^/]+)/trackback/?$";s:38:"index.php?ai1ec_event=$matches[1]&tb=1";s:52:"ai1ec_event/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?ai1ec_event=$matches[1]&feed=$matches[2]";s:47:"ai1ec_event/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?ai1ec_event=$matches[1]&feed=$matches[2]";s:40:"ai1ec_event/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?ai1ec_event=$matches[1]&paged=$matches[2]";s:47:"ai1ec_event/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?ai1ec_event=$matches[1]&cpage=$matches[2]";s:32:"ai1ec_event/([^/]+)(/[0-9]+)?/?$";s:50:"index.php?ai1ec_event=$matches[1]&page=$matches[2]";s:28:"ai1ec_event/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:38:"ai1ec_event/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:58:"ai1ec_event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ai1ec_event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"ai1ec_event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(870, '_site_transient_timeout_theme_roots', '1389749781', 'yes'),
(871, '_site_transient_theme_roots', 'a:2:{s:10:"inzynierka";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(872, '_site_transient_timeout_wporg_theme_feature_list', '1389758783', 'yes'),
(873, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:8:"Features";a:19:{i:1;s:8:"blavatar";i:2;s:10:"buddypress";i:3;s:17:"custom-background";i:4;s:13:"custom-colors";i:5;s:13:"custom-header";i:6;s:11:"custom-menu";i:7;s:12:"editor-style";i:8;s:21:"featured-image-header";i:9;s:15:"featured-images";i:10;s:15:"flexible-header";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}}', 'yes');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=588 ;

--
-- Zrzut danych tabeli `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(20, 6, '_menu_item_type', 'custom'),
(21, 6, '_menu_item_menu_item_parent', '0'),
(22, 6, '_menu_item_object_id', '6'),
(23, 6, '_menu_item_object', 'custom'),
(24, 6, '_menu_item_target', ''),
(25, 6, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(26, 6, '_menu_item_xfn', ''),
(27, 6, '_menu_item_url', 'http://inzynierka.local/'),
(38, 8, '_menu_item_type', 'custom'),
(39, 8, '_menu_item_menu_item_parent', '0'),
(40, 8, '_menu_item_object_id', '8'),
(41, 8, '_menu_item_object', 'custom'),
(42, 8, '_menu_item_target', ''),
(43, 8, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(44, 8, '_menu_item_xfn', ''),
(45, 8, '_menu_item_url', '#'),
(46, 9, '_menu_item_type', 'custom'),
(47, 9, '_menu_item_menu_item_parent', '0'),
(48, 9, '_menu_item_object_id', '9'),
(49, 9, '_menu_item_object', 'custom'),
(50, 9, '_menu_item_target', ''),
(51, 9, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(52, 9, '_menu_item_xfn', ''),
(53, 9, '_menu_item_url', '#'),
(55, 10, '_menu_item_type', 'custom'),
(56, 10, '_menu_item_menu_item_parent', '0'),
(57, 10, '_menu_item_object_id', '10'),
(58, 10, '_menu_item_object', 'custom'),
(59, 10, '_menu_item_target', ''),
(60, 10, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(61, 10, '_menu_item_xfn', ''),
(62, 10, '_menu_item_url', '#'),
(64, 11, '_menu_item_type', 'custom'),
(65, 11, '_menu_item_menu_item_parent', '0'),
(66, 11, '_menu_item_object_id', '11'),
(67, 11, '_menu_item_object', 'custom'),
(68, 11, '_menu_item_target', ''),
(69, 11, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(70, 11, '_menu_item_xfn', ''),
(71, 11, '_menu_item_url', '#'),
(120, 18, '_edit_last', '1'),
(121, 18, '_edit_lock', '1388966308:1'),
(122, 21, '_edit_last', '1'),
(123, 21, '_edit_lock', '1388966326:1'),
(124, 23, '_edit_last', '1'),
(125, 23, '_edit_lock', '1388966316:1'),
(126, 25, '_edit_last', '1'),
(127, 25, '_edit_lock', '1388966312:1'),
(128, 27, '_edit_last', '1'),
(129, 27, '_edit_lock', '1388966331:1'),
(130, 29, '_edit_last', '1'),
(131, 29, '_edit_lock', '1389746734:1'),
(132, 31, '_edit_last', '1'),
(133, 31, '_edit_lock', '1388966344:1'),
(134, 33, '_edit_last', '1'),
(135, 33, '_edit_lock', '1388966349:1'),
(136, 35, '_edit_last', '1'),
(137, 35, '_edit_lock', '1388966356:1'),
(138, 37, '_edit_last', '1'),
(139, 37, '_edit_lock', '1388966361:1'),
(140, 39, '_edit_last', '1'),
(141, 39, '_edit_lock', '1388966465:1'),
(142, 41, '_edit_last', '1'),
(143, 41, '_edit_lock', '1388966471:1'),
(144, 43, '_edit_last', '1'),
(145, 43, '_edit_lock', '1388966476:1'),
(146, 45, '_edit_last', '1'),
(147, 45, '_edit_lock', '1388966481:1'),
(148, 47, '_edit_last', '1'),
(149, 47, '_edit_lock', '1389746715:1'),
(150, 49, '_edit_last', '1'),
(151, 49, '_edit_lock', '1388966294:1'),
(152, 51, '_edit_last', '1'),
(153, 51, '_edit_lock', '1388966300:1'),
(154, 53, '_menu_item_type', 'post_type'),
(155, 53, '_menu_item_menu_item_parent', '11'),
(156, 53, '_menu_item_object_id', '51'),
(157, 53, '_menu_item_object', 'page'),
(158, 53, '_menu_item_target', ''),
(159, 53, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(160, 53, '_menu_item_xfn', ''),
(161, 53, '_menu_item_url', ''),
(163, 54, '_menu_item_type', 'post_type'),
(164, 54, '_menu_item_menu_item_parent', '11'),
(165, 54, '_menu_item_object_id', '49'),
(166, 54, '_menu_item_object', 'page'),
(167, 54, '_menu_item_target', ''),
(168, 54, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(169, 54, '_menu_item_xfn', ''),
(170, 54, '_menu_item_url', ''),
(172, 55, '_menu_item_type', 'post_type'),
(173, 55, '_menu_item_menu_item_parent', '9'),
(174, 55, '_menu_item_object_id', '37'),
(175, 55, '_menu_item_object', 'page'),
(176, 55, '_menu_item_target', ''),
(177, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(178, 55, '_menu_item_xfn', ''),
(179, 55, '_menu_item_url', ''),
(181, 56, '_menu_item_type', 'post_type'),
(182, 56, '_menu_item_menu_item_parent', '9'),
(183, 56, '_menu_item_object_id', '35'),
(184, 56, '_menu_item_object', 'page'),
(185, 56, '_menu_item_target', ''),
(186, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(187, 56, '_menu_item_xfn', ''),
(188, 56, '_menu_item_url', ''),
(190, 57, '_menu_item_type', 'post_type'),
(191, 57, '_menu_item_menu_item_parent', '9'),
(192, 57, '_menu_item_object_id', '33'),
(193, 57, '_menu_item_object', 'page'),
(194, 57, '_menu_item_target', ''),
(195, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(196, 57, '_menu_item_xfn', ''),
(197, 57, '_menu_item_url', ''),
(199, 58, '_menu_item_type', 'post_type'),
(200, 58, '_menu_item_menu_item_parent', '9'),
(201, 58, '_menu_item_object_id', '31'),
(202, 58, '_menu_item_object', 'page'),
(203, 58, '_menu_item_target', ''),
(204, 58, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(205, 58, '_menu_item_xfn', ''),
(206, 58, '_menu_item_url', ''),
(208, 59, '_menu_item_type', 'post_type'),
(209, 59, '_menu_item_menu_item_parent', '10'),
(210, 59, '_menu_item_object_id', '41'),
(211, 59, '_menu_item_object', 'page'),
(212, 59, '_menu_item_target', ''),
(213, 59, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(214, 59, '_menu_item_xfn', ''),
(215, 59, '_menu_item_url', ''),
(217, 60, '_menu_item_type', 'post_type'),
(218, 60, '_menu_item_menu_item_parent', '10'),
(219, 60, '_menu_item_object_id', '43'),
(220, 60, '_menu_item_object', 'page'),
(221, 60, '_menu_item_target', ''),
(222, 60, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(223, 60, '_menu_item_xfn', ''),
(224, 60, '_menu_item_url', ''),
(226, 61, '_menu_item_type', 'post_type'),
(227, 61, '_menu_item_menu_item_parent', '10'),
(228, 61, '_menu_item_object_id', '45'),
(229, 61, '_menu_item_object', 'page'),
(230, 61, '_menu_item_target', ''),
(231, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(232, 61, '_menu_item_xfn', ''),
(233, 61, '_menu_item_url', ''),
(235, 62, '_menu_item_type', 'post_type'),
(236, 62, '_menu_item_menu_item_parent', '8'),
(237, 62, '_menu_item_object_id', '25'),
(238, 62, '_menu_item_object', 'page'),
(239, 62, '_menu_item_target', ''),
(240, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(241, 62, '_menu_item_xfn', ''),
(242, 62, '_menu_item_url', ''),
(244, 63, '_menu_item_type', 'post_type'),
(245, 63, '_menu_item_menu_item_parent', '8'),
(246, 63, '_menu_item_object_id', '23'),
(247, 63, '_menu_item_object', 'page'),
(248, 63, '_menu_item_target', ''),
(249, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(250, 63, '_menu_item_xfn', ''),
(251, 63, '_menu_item_url', ''),
(253, 64, '_menu_item_type', 'post_type'),
(254, 64, '_menu_item_menu_item_parent', '8'),
(255, 64, '_menu_item_object_id', '21'),
(256, 64, '_menu_item_object', 'page'),
(257, 64, '_menu_item_target', ''),
(258, 64, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(259, 64, '_menu_item_xfn', ''),
(260, 64, '_menu_item_url', ''),
(262, 65, '_menu_item_type', 'post_type'),
(263, 65, '_menu_item_menu_item_parent', '8'),
(264, 65, '_menu_item_object_id', '27'),
(265, 65, '_menu_item_object', 'page'),
(266, 65, '_menu_item_target', ''),
(267, 65, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(268, 65, '_menu_item_xfn', ''),
(269, 65, '_menu_item_url', ''),
(274, 67, '_edit_last', '1'),
(275, 67, '_edit_lock', '1389746863:1'),
(278, 69, '_edit_last', '1'),
(279, 69, '_edit_lock', '1383982544:1'),
(280, 71, '_menu_item_type', 'post_type'),
(281, 71, '_menu_item_menu_item_parent', '0'),
(282, 71, '_menu_item_object_id', '69'),
(283, 71, '_menu_item_object', 'page'),
(284, 71, '_menu_item_target', ''),
(285, 71, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(286, 71, '_menu_item_xfn', ''),
(287, 71, '_menu_item_url', ''),
(288, 10, '', ''),
(289, 77, '_edit_lock', '1388939651:1'),
(290, 77, '_edit_last', '1'),
(291, 77, '_bbp_last_active_time', '2014-01-05 18:02:57'),
(292, 77, '_bbp_forum_subforum_count', '0'),
(293, 77, '_bbp_reply_count', '1'),
(294, 77, '_bbp_total_reply_count', '1'),
(295, 77, '_bbp_topic_count', '0'),
(296, 77, '_bbp_total_topic_count', '0'),
(297, 77, '_bbp_topic_count_hidden', '1'),
(298, 79, '_edit_last', '1'),
(299, 79, '_edit_lock', '1388938493:1'),
(300, 79, '_bbp_last_active_time', '2014-01-05 17:11:29'),
(301, 79, '_bbp_forum_subforum_count', '0'),
(302, 79, '_bbp_reply_count', '0'),
(303, 79, '_bbp_total_reply_count', '0'),
(304, 79, '_bbp_topic_count', '0'),
(305, 79, '_bbp_total_topic_count', '0'),
(306, 79, '_bbp_topic_count_hidden', '0'),
(307, 79, '_bbp_forum_type', 'category'),
(308, 81, '_edit_last', '1'),
(309, 81, '_bbp_forum_id', '77'),
(310, 81, '_bbp_topic_id', '81'),
(311, 81, '_bbp_author_ip', '127.0.0.1'),
(312, 81, '_bbp_last_active_time', '2014-01-05 17:13:08'),
(313, 81, '_bbp_reply_count', '0'),
(314, 81, '_bbp_reply_count_hidden', '0'),
(315, 77, '_bbp_last_reply_id', '95'),
(316, 81, '_bbp_last_active_id', '81'),
(317, 81, '_bbp_voice_count', '1'),
(318, 77, '_bbp_last_topic_id', '87'),
(319, 77, '_bbp_last_active_id', '95'),
(320, 81, '_edit_lock', '1388938517:1'),
(322, 79, '_wp_trash_meta_status', 'publish'),
(323, 79, '_wp_trash_meta_time', '1388938497'),
(324, 85, '_edit_last', '1'),
(325, 85, '_edit_lock', '1388938795:1'),
(326, 85, '_bbp_forum_id', '77'),
(327, 85, '_bbp_topic_id', '0'),
(328, 85, '_bbp_author_ip', '127.0.0.1'),
(329, 77, '_bbp_forum_type', 'forum'),
(330, 81, '_wp_trash_meta_status', 'publish'),
(331, 81, '_wp_trash_meta_time', '1388939061'),
(332, 87, '_edit_last', '1'),
(333, 87, '_edit_lock', '1388965913:1'),
(334, 87, '_bbp_forum_id', '77'),
(335, 87, '_bbp_topic_id', '87'),
(336, 87, '_bbp_author_ip', '127.0.0.1'),
(337, 87, '_bbp_last_active_time', '2014-01-05 18:02:57'),
(338, 87, '_bbp_reply_count', '1'),
(339, 87, '_bbp_reply_count_hidden', '0'),
(340, 87, '_bbp_last_active_id', '95'),
(341, 87, '_bbp_voice_count', '1'),
(342, 90, '_edit_lock', '1389747804:1'),
(343, 90, '_edit_last', '1'),
(344, 93, '_menu_item_type', 'post_type'),
(345, 93, '_menu_item_menu_item_parent', '0'),
(346, 93, '_menu_item_object_id', '90'),
(347, 93, '_menu_item_object', 'page'),
(348, 93, '_menu_item_target', ''),
(349, 93, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(350, 93, '_menu_item_xfn', ''),
(351, 93, '_menu_item_url', ''),
(355, 95, '_bbp_forum_id', '77'),
(356, 95, '_bbp_topic_id', '87'),
(357, 95, '_bbp_author_ip', '127.0.0.1'),
(358, 87, '_bbp_last_reply_id', '95'),
(360, 90, '_wp_page_template', 'default'),
(363, 47, '_wp_page_template', 'template-page-documents.php'),
(364, 49, '_wp_page_template', 'template-page-documents.php'),
(365, 51, '_wp_page_template', 'template-page-documents.php'),
(366, 18, '_wp_page_template', 'template-page-teams.php'),
(367, 25, '_wp_page_template', 'template-page-teams.php'),
(368, 23, '_wp_page_template', 'template-page-teams.php'),
(369, 21, '_wp_page_template', 'template-page-teams.php'),
(370, 27, '_wp_page_template', 'template-page-teams.php'),
(371, 29, '_wp_page_template', 'template-page-gallery.php'),
(372, 31, '_wp_page_template', 'template-page-gallery.php'),
(373, 33, '_wp_page_template', 'template-page-gallery.php'),
(374, 35, '_wp_page_template', 'template-page-gallery.php'),
(375, 37, '_wp_page_template', 'template-page-gallery.php'),
(376, 39, '_wp_page_template', 'template-page-informations.php'),
(377, 41, '_wp_page_template', 'template-page-informations.php'),
(378, 43, '_wp_page_template', 'template-page-informations.php'),
(379, 45, '_wp_page_template', 'template-page-informations.php'),
(380, 33, '_oembed_d8b85aff293a06d4140a07f06aedb2f5', '{{unknown}}'),
(381, 21, '_oembed_babb510a68891230b3481787983401e1', '{{unknown}}'),
(391, 116, '_menu_item_type', 'post_type'),
(392, 116, '_menu_item_menu_item_parent', '0'),
(393, 116, '_menu_item_object_id', '25'),
(394, 116, '_menu_item_object', 'page'),
(395, 116, '_menu_item_target', ''),
(396, 116, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(397, 116, '_menu_item_xfn', ''),
(398, 116, '_menu_item_url', ''),
(400, 117, '_menu_item_type', 'post_type'),
(401, 117, '_menu_item_menu_item_parent', '0'),
(402, 117, '_menu_item_object_id', '23'),
(403, 117, '_menu_item_object', 'page'),
(404, 117, '_menu_item_target', ''),
(405, 117, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(406, 117, '_menu_item_xfn', ''),
(407, 117, '_menu_item_url', ''),
(409, 118, '_menu_item_type', 'post_type'),
(410, 118, '_menu_item_menu_item_parent', '0'),
(411, 118, '_menu_item_object_id', '21'),
(412, 118, '_menu_item_object', 'page'),
(413, 118, '_menu_item_target', ''),
(414, 118, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(415, 118, '_menu_item_xfn', ''),
(416, 118, '_menu_item_url', ''),
(418, 119, '_menu_item_type', 'post_type'),
(419, 119, '_menu_item_menu_item_parent', '0'),
(420, 119, '_menu_item_object_id', '27'),
(421, 119, '_menu_item_object', 'page'),
(422, 119, '_menu_item_target', ''),
(423, 119, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(424, 119, '_menu_item_xfn', ''),
(425, 119, '_menu_item_url', ''),
(427, 35, '_oembed_7a3805fc06a65bf8aef43dcac74b5169', '{{unknown}}'),
(428, 120, '_menu_item_type', 'post_type'),
(429, 120, '_menu_item_menu_item_parent', '0'),
(430, 120, '_menu_item_object_id', '47'),
(431, 120, '_menu_item_object', 'page'),
(432, 120, '_menu_item_target', ''),
(433, 120, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(434, 120, '_menu_item_xfn', ''),
(435, 120, '_menu_item_url', ''),
(437, 121, '_menu_item_type', 'post_type'),
(438, 121, '_menu_item_menu_item_parent', '0'),
(439, 121, '_menu_item_object_id', '51'),
(440, 121, '_menu_item_object', 'page'),
(441, 121, '_menu_item_target', ''),
(442, 121, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(443, 121, '_menu_item_xfn', ''),
(444, 121, '_menu_item_url', ''),
(446, 122, '_menu_item_type', 'post_type'),
(447, 122, '_menu_item_menu_item_parent', '0'),
(448, 122, '_menu_item_object_id', '49'),
(449, 122, '_menu_item_object', 'page'),
(450, 122, '_menu_item_target', ''),
(451, 122, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(452, 122, '_menu_item_xfn', ''),
(453, 122, '_menu_item_url', ''),
(464, 124, '_menu_item_type', 'post_type'),
(465, 124, '_menu_item_menu_item_parent', '0'),
(466, 124, '_menu_item_object_id', '45'),
(467, 124, '_menu_item_object', 'page'),
(468, 124, '_menu_item_target', ''),
(469, 124, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(470, 124, '_menu_item_xfn', ''),
(471, 124, '_menu_item_url', ''),
(473, 125, '_menu_item_type', 'post_type'),
(474, 125, '_menu_item_menu_item_parent', '0'),
(475, 125, '_menu_item_object_id', '43'),
(476, 125, '_menu_item_object', 'page'),
(477, 125, '_menu_item_target', ''),
(478, 125, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(479, 125, '_menu_item_xfn', ''),
(480, 125, '_menu_item_url', ''),
(482, 126, '_menu_item_type', 'post_type'),
(483, 126, '_menu_item_menu_item_parent', '0'),
(484, 126, '_menu_item_object_id', '41'),
(485, 126, '_menu_item_object', 'page'),
(486, 126, '_menu_item_target', ''),
(487, 126, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(488, 126, '_menu_item_xfn', ''),
(489, 126, '_menu_item_url', ''),
(491, 45, '_oembed_6835bf5deda115f83ffa6e72c5be9f89', '{{unknown}}'),
(492, 51, '_oembed_04a4ee729f0277a37eecf5982946181f', '{{unknown}}'),
(493, 127, '_menu_item_type', 'post_type'),
(494, 127, '_menu_item_menu_item_parent', '0'),
(495, 127, '_menu_item_object_id', '29'),
(496, 127, '_menu_item_object', 'page'),
(497, 127, '_menu_item_target', ''),
(498, 127, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(499, 127, '_menu_item_xfn', ''),
(500, 127, '_menu_item_url', ''),
(502, 128, '_menu_item_type', 'post_type'),
(503, 128, '_menu_item_menu_item_parent', '0'),
(504, 128, '_menu_item_object_id', '37'),
(505, 128, '_menu_item_object', 'page'),
(506, 128, '_menu_item_target', ''),
(507, 128, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(508, 128, '_menu_item_xfn', ''),
(509, 128, '_menu_item_url', ''),
(511, 129, '_menu_item_type', 'post_type'),
(512, 129, '_menu_item_menu_item_parent', '0'),
(513, 129, '_menu_item_object_id', '35'),
(514, 129, '_menu_item_object', 'page'),
(515, 129, '_menu_item_target', ''),
(516, 129, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(517, 129, '_menu_item_xfn', ''),
(518, 129, '_menu_item_url', ''),
(520, 130, '_menu_item_type', 'post_type'),
(521, 130, '_menu_item_menu_item_parent', '0'),
(522, 130, '_menu_item_object_id', '33'),
(523, 130, '_menu_item_object', 'page'),
(524, 130, '_menu_item_target', ''),
(525, 130, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(526, 130, '_menu_item_xfn', ''),
(527, 130, '_menu_item_url', ''),
(529, 131, '_menu_item_type', 'post_type'),
(530, 131, '_menu_item_menu_item_parent', '0'),
(531, 131, '_menu_item_object_id', '31'),
(532, 131, '_menu_item_object', 'page'),
(533, 131, '_menu_item_target', ''),
(534, 131, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(535, 131, '_menu_item_xfn', ''),
(536, 131, '_menu_item_url', ''),
(538, 37, '_oembed_982d1c48761c4fe84e3f05278ae842da', '{{unknown}}'),
(539, 132, '_menu_item_type', 'post_type'),
(540, 132, '_menu_item_menu_item_parent', '0'),
(541, 132, '_menu_item_object_id', '39'),
(542, 132, '_menu_item_object', 'page'),
(543, 132, '_menu_item_target', ''),
(544, 132, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(545, 132, '_menu_item_xfn', ''),
(546, 132, '_menu_item_url', ''),
(548, 133, '_menu_item_type', 'post_type'),
(549, 133, '_menu_item_menu_item_parent', '0'),
(550, 133, '_menu_item_object_id', '18'),
(551, 133, '_menu_item_object', 'page'),
(552, 133, '_menu_item_target', ''),
(553, 133, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(554, 133, '_menu_item_xfn', ''),
(555, 133, '_menu_item_url', ''),
(557, 41, '_oembed_5f94aa63b61e3d308ec3998fb880679a', '{{unknown}}'),
(558, 49, '_oembed_8643c0472e87e9aa6de3f2a1cd102d39', '{{unknown}}'),
(559, 69, '_oembed_4bb781e2a16a5919c36ba3276042b330', '{{unknown}}'),
(560, 47, '_oembed_1403aad0e9e88d87cc7fb64a1c0a06ca', '{{unknown}}'),
(561, 134, '_edit_last', '1'),
(562, 134, '_edit_lock', '1389137397:1'),
(563, 134, '_wp_page_template', 'default'),
(564, 137, '_edit_last', '1'),
(565, 137, '_edit_lock', '1389137585:1'),
(566, 137, '_wp_page_template', 'default'),
(567, 139, '_edit_last', '1'),
(568, 139, '_wp_page_template', 'default'),
(569, 139, '_edit_lock', '1389137601:1'),
(570, 142, '_edit_last', '1'),
(571, 142, '_wp_page_template', 'default'),
(572, 142, '_edit_lock', '1389748525:1'),
(573, 145, '_menu_item_type', 'post_type'),
(574, 145, '_menu_item_menu_item_parent', '0'),
(575, 145, '_menu_item_object_id', '142'),
(576, 145, '_menu_item_object', 'page'),
(577, 145, '_menu_item_target', ''),
(578, 145, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(579, 145, '_menu_item_xfn', ''),
(580, 145, '_menu_item_url', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=157 ;

--
-- Zrzut danych tabeli `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(6, 1, '2013-11-07 06:40:55', '2013-11-07 05:40:55', 'http://inzynierka.local/?p=6', 'Strona główna', '', 'publish', 'open', 'open', '', 'strona-glowna', '', '', '2014-01-15 01:18:56', '2014-01-15 00:18:56', '', 0, 'http://wordpress.loc/?p=6', 1, 'nav_menu_item', '', 0),
(8, 1, '2013-11-07 06:41:24', '2013-11-07 05:41:24', 'http://inzynierka.local/?p=8', 'Drużyny', '', 'publish', 'open', 'open', '', 'druzyny', '', '', '2014-01-15 01:18:56', '2014-01-15 00:18:56', '', 0, 'http://wordpress.loc/?p=8', 2, 'nav_menu_item', '', 0),
(9, 1, '2013-11-07 06:48:52', '2013-11-07 05:48:52', 'http://inzynierka.local/?p=9', 'Galeria', '', 'publish', 'open', 'open', '', 'galeria', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 0, 'http://wordpress.loc/?p=9', 7, 'nav_menu_item', '', 0),
(10, 1, '2013-11-07 06:48:52', '2013-11-07 05:48:52', 'http://inzynierka.local/?p=10', 'Informacje', '', 'publish', 'open', 'open', '', 'informacje', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 0, 'http://wordpress.loc/?p=10', 12, 'nav_menu_item', '', 0),
(11, 1, '2013-11-07 06:48:52', '2013-11-07 05:48:52', 'http://inzynierka.local/?p=11', 'Dokumenty', '', 'publish', 'open', 'open', '', 'dokumenty', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 0, 'http://wordpress.loc/?p=11', 16, 'nav_menu_item', '', 0),
(18, 1, '2013-11-07 06:50:04', '2013-11-07 05:50:04', 'http://inzynierka.local/?page_id=18', 'Drużyny', '', 'publish', 'open', 'closed', '', 'druzyny', '', '', '2014-01-06 00:58:27', '2014-01-05 23:58:27', '', 0, 'http://wordpress.loc/?page_id=18', 0, 'page', '', 0),
(19, 1, '2013-11-07 06:50:04', '2013-11-07 05:50:04', 'http://inzynierka.local/?p=19', 'Drużyny', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2013-11-07 06:50:04', '2013-11-07 05:50:04', '', 18, 'http://wordpress.loc/?p=19', 0, 'revision', '', 0),
(20, 1, '2013-11-07 06:50:31', '2013-11-07 05:50:31', 'http://inzynierka.local/?p=20', 'Drużynyny', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2013-11-07 06:50:31', '2013-11-07 05:50:31', '', 18, 'http://wordpress.loc/?p=20', 0, 'revision', '', 0),
(21, 1, '2013-11-07 06:50:44', '2013-11-07 05:50:44', 'http://inzynierka.local/?page_id=21', '8Viator', '', 'publish', 'open', 'closed', '', '8viator', '', '', '2014-01-06 00:58:46', '2014-01-05 23:58:46', '', 18, 'http://wordpress.loc/?page_id=21', 0, 'page', '', 0),
(22, 1, '2013-11-07 06:50:44', '2013-11-07 05:50:44', 'http://inzynierka.local/?p=22', '8Viator', '', 'inherit', 'open', 'open', '', '21-revision-v1', '', '', '2013-11-07 06:50:44', '2013-11-07 05:50:44', '', 21, 'http://wordpress.loc/?p=22', 0, 'revision', '', 0),
(23, 1, '2013-11-07 06:50:57', '2013-11-07 05:50:57', 'http://inzynierka.local/?page_id=23', '6Tenebris', '', 'publish', 'open', 'closed', '', '6tenebris', '', '', '2014-01-06 00:58:36', '2014-01-05 23:58:36', '', 18, 'http://wordpress.loc/?page_id=23', 0, 'page', '', 0),
(24, 1, '2013-11-07 06:50:57', '2013-11-07 05:50:57', 'http://inzynierka.local/?p=24', '6Tenebris', '', 'inherit', 'open', 'open', '', '23-revision-v1', '', '', '2013-11-07 06:50:57', '2013-11-07 05:50:57', '', 23, 'http://wordpress.loc/?p=24', 0, 'revision', '', 0),
(25, 1, '2013-11-07 06:51:07', '2013-11-07 05:51:07', 'http://inzynierka.local/?page_id=25', '1Dignitas', '', 'publish', 'open', 'closed', '', '1dignitas', '', '', '2014-01-06 00:58:32', '2014-01-05 23:58:32', '', 18, 'http://wordpress.loc/?page_id=25', 0, 'page', '', 0),
(26, 1, '2013-11-07 06:51:07', '2013-11-07 05:51:07', 'http://inzynierka.local/?p=26', '1Dignitas', '', 'inherit', 'open', 'open', '', '25-revision-v1', '', '', '2013-11-07 06:51:07', '2013-11-07 05:51:07', '', 25, 'http://wordpress.loc/?p=26', 0, 'revision', '', 0),
(27, 1, '2013-11-07 06:51:23', '2013-11-07 05:51:23', 'http://inzynierka.local/?page_id=27', 'Chochliki', '', 'publish', 'open', 'closed', '', 'chochliki', '', '', '2014-01-06 00:58:51', '2014-01-05 23:58:51', '', 18, 'http://wordpress.loc/?page_id=27', 0, 'page', '', 0),
(28, 1, '2013-11-07 06:51:23', '2013-11-07 05:51:23', 'http://inzynierka.local/?p=28', 'Chochliki', '', 'inherit', 'open', 'open', '', '27-revision-v1', '', '', '2013-11-07 06:51:23', '2013-11-07 05:51:23', '', 27, 'http://wordpress.loc/?p=28', 0, 'revision', '', 0),
(29, 1, '2013-11-07 06:51:34', '2013-11-07 05:51:34', 'http://inzynierka.local/?page_id=29', 'Galeria', '', 'publish', 'open', 'closed', '', 'galeria', '', '', '2014-01-06 00:58:59', '2014-01-05 23:58:59', '', 0, 'http://wordpress.loc/?page_id=29', 0, 'page', '', 0),
(30, 1, '2013-11-07 06:51:34', '2013-11-07 05:51:34', 'http://inzynierka.local/?p=30', 'Galeria', '', 'inherit', 'open', 'open', '', '29-revision-v1', '', '', '2013-11-07 06:51:34', '2013-11-07 05:51:34', '', 29, 'http://wordpress.loc/?p=30', 0, 'revision', '', 0),
(31, 1, '2013-11-07 06:51:43', '2013-11-07 05:51:43', 'http://inzynierka.local/?page_id=31', '2013', '', 'publish', 'open', 'closed', '', '2013-2', '', '', '2014-01-06 00:59:04', '2014-01-05 23:59:04', '', 29, 'http://wordpress.loc/?page_id=31', 1, 'page', '', 0),
(32, 1, '2013-11-07 06:51:43', '2013-11-07 05:51:43', 'http://inzynierka.local/?p=32', '2013', '', 'inherit', 'open', 'open', '', '31-revision-v1', '', '', '2013-11-07 06:51:43', '2013-11-07 05:51:43', '', 31, 'http://wordpress.loc/?p=32', 0, 'revision', '', 0),
(33, 1, '2013-11-07 06:51:52', '2013-11-07 05:51:52', 'http://inzynierka.local/?page_id=33', '2012', '', 'publish', 'open', 'closed', '', '2012-2', '', '', '2014-01-06 00:59:09', '2014-01-05 23:59:09', '', 29, 'http://wordpress.loc/?page_id=33', 2, 'page', '', 0),
(34, 1, '2013-11-07 06:51:52', '2013-11-07 05:51:52', 'http://inzynierka.local/?p=34', '2012', '', 'inherit', 'open', 'open', '', '33-revision-v1', '', '', '2013-11-07 06:51:52', '2013-11-07 05:51:52', '', 33, 'http://wordpress.loc/?p=34', 0, 'revision', '', 0),
(35, 1, '2013-11-07 06:52:01', '2013-11-07 05:52:01', 'http://inzynierka.local/?page_id=35', '2011', '', 'publish', 'open', 'closed', '', '2011-2', '', '', '2014-01-06 00:59:15', '2014-01-05 23:59:15', '', 29, 'http://wordpress.loc/?page_id=35', 3, 'page', '', 0),
(36, 1, '2013-11-07 06:52:01', '2013-11-07 05:52:01', 'http://inzynierka.local/?p=36', '2011', '', 'inherit', 'open', 'open', '', '35-revision-v1', '', '', '2013-11-07 06:52:01', '2013-11-07 05:52:01', '', 35, 'http://wordpress.loc/?p=36', 0, 'revision', '', 0),
(37, 1, '2013-11-07 06:52:08', '2013-11-07 05:52:08', 'http://inzynierka.local/?page_id=37', '2010', '', 'publish', 'open', 'closed', '', '2010-2', '', '', '2014-01-06 00:59:21', '2014-01-05 23:59:21', '', 29, 'http://wordpress.loc/?page_id=37', 4, 'page', '', 0),
(38, 1, '2013-11-07 06:52:08', '2013-11-07 05:52:08', 'http://inzynierka.local/?p=38', '2010', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2013-11-07 06:52:08', '2013-11-07 05:52:08', '', 37, 'http://wordpress.loc/?p=38', 0, 'revision', '', 0),
(39, 1, '2013-11-07 06:53:35', '2013-11-07 05:53:35', 'http://inzynierka.local/?page_id=39', 'Informacje', '', 'publish', 'open', 'closed', '', 'informacje', '', '', '2014-01-06 01:01:05', '2014-01-06 00:01:05', '', 0, 'http://wordpress.loc/?page_id=39', 0, 'page', '', 0),
(40, 1, '2013-11-07 06:53:35', '2013-11-07 05:53:35', 'http://inzynierka.local/?p=40', 'Informacje', '', 'inherit', 'open', 'open', '', '39-revision-v1', '', '', '2013-11-07 06:53:35', '2013-11-07 05:53:35', '', 39, 'http://wordpress.loc/?p=40', 0, 'revision', '', 0),
(41, 1, '2013-11-07 06:53:54', '2013-11-07 05:53:54', 'http://inzynierka.local/?page_id=41', 'Stopnie', '', 'publish', 'open', 'closed', '', 'stopnie', '', '', '2014-01-06 01:01:11', '2014-01-06 00:01:11', '', 39, 'http://wordpress.loc/?page_id=41', 1, 'page', '', 0),
(42, 1, '2013-11-07 06:53:54', '2013-11-07 05:53:54', 'http://inzynierka.local/?p=42', 'Stopnie', '', 'inherit', 'open', 'open', '', '41-revision-v1', '', '', '2013-11-07 06:53:54', '2013-11-07 05:53:54', '', 41, 'http://wordpress.loc/?p=42', 0, 'revision', '', 0),
(43, 1, '2013-11-07 06:54:05', '2013-11-07 05:54:05', 'http://inzynierka.local/?page_id=43', 'Historia ZHP', '', 'publish', 'open', 'closed', '', 'historia-zhp', '', '', '2014-01-06 01:01:16', '2014-01-06 00:01:16', '', 39, 'http://wordpress.loc/?page_id=43', 2, 'page', '', 0),
(44, 1, '2013-11-07 06:54:05', '2013-11-07 05:54:05', 'http://inzynierka.local/?p=44', 'Historia ZHP', '', 'inherit', 'open', 'open', '', '43-revision-v1', '', '', '2013-11-07 06:54:05', '2013-11-07 05:54:05', '', 43, 'http://wordpress.loc/?p=44', 0, 'revision', '', 0),
(45, 1, '2013-11-07 06:54:27', '2013-11-07 05:54:27', 'http://inzynierka.local/?page_id=45', 'Władze Szczepu', '', 'publish', 'open', 'closed', '', 'wladze-szczepu', '', '', '2014-01-06 01:01:21', '2014-01-06 00:01:21', '', 39, 'http://wordpress.loc/?page_id=45', 3, 'page', '', 0),
(46, 1, '2013-11-07 06:54:27', '2013-11-07 05:54:27', 'http://inzynierka.local/?p=46', 'Władze Szczepu', '', 'inherit', 'open', 'open', '', '45-revision-v1', '', '', '2013-11-07 06:54:27', '2013-11-07 05:54:27', '', 45, 'http://wordpress.loc/?p=46', 0, 'revision', '', 0),
(47, 1, '2013-11-07 06:54:42', '2013-11-07 05:54:42', 'http://inzynierka.local/?page_id=47', 'Dokumenty', '', 'publish', 'open', 'open', '', 'dokumenty', '', '', '2014-01-06 00:57:55', '2014-01-05 23:57:55', '', 0, 'http://wordpress.loc/?page_id=47', 0, 'page', '', 0),
(48, 1, '2013-11-07 06:54:42', '2013-11-07 05:54:42', 'http://inzynierka.local/?p=48', 'Dokumenty', '', 'inherit', 'open', 'open', '', '47-revision-v1', '', '', '2013-11-07 06:54:42', '2013-11-07 05:54:42', '', 47, 'http://wordpress.loc/?p=48', 0, 'revision', '', 0),
(49, 1, '2013-11-07 06:54:53', '2013-11-07 05:54:53', 'http://inzynierka.local/?page_id=49', 'Rozkazy', '', 'publish', 'open', 'closed', '', 'test', '', '', '2014-01-06 00:58:14', '2014-01-05 23:58:14', '', 47, 'http://wordpress.loc/?page_id=49', 1, 'page', '', 0),
(50, 1, '2013-11-07 06:54:53', '2013-11-07 05:54:53', 'http://inzynierka.local/?p=50', 'Rozkazy', '', 'inherit', 'open', 'open', '', '49-revision-v1', '', '', '2013-11-07 06:54:53', '2013-11-07 05:54:53', '', 49, 'http://wordpress.loc/?p=50', 0, 'revision', '', 0),
(51, 1, '2013-11-07 06:55:21', '2013-11-07 05:55:21', 'http://inzynierka.local/?page_id=51', 'Wymagania na stopnie', '', 'publish', 'open', 'closed', '', 'wymagania-na-stopnie', '', '', '2014-01-06 00:58:20', '2014-01-05 23:58:20', '', 47, 'http://wordpress.loc/?page_id=51', 2, 'page', '', 0),
(52, 1, '2013-11-07 06:55:21', '2013-11-07 05:55:21', 'http://inzynierka.local/?p=52', 'Wymagania na stopnie', '', 'inherit', 'open', 'open', '', '51-revision-v1', '', '', '2013-11-07 06:55:21', '2013-11-07 05:55:21', '', 51, 'http://wordpress.loc/?p=52', 0, 'revision', '', 0),
(53, 1, '2013-11-07 06:57:53', '2013-11-07 05:57:53', 'http://inzynierka.local/?p=53', '', '', 'publish', 'open', 'open', '', '53', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 47, 'http://wordpress.loc/?p=53', 18, 'nav_menu_item', '', 0),
(54, 1, '2013-11-07 06:57:53', '2013-11-07 05:57:53', 'http://inzynierka.local/?p=54', '', '', 'publish', 'open', 'open', '', '54', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 47, 'http://wordpress.loc/?p=54', 17, 'nav_menu_item', '', 0),
(55, 1, '2013-11-07 06:57:51', '2013-11-07 05:57:51', 'http://inzynierka.local/?p=55', '', '', 'publish', 'open', 'open', '', '55', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 29, 'http://wordpress.loc/?p=55', 8, 'nav_menu_item', '', 0),
(56, 1, '2013-11-07 06:57:52', '2013-11-07 05:57:52', 'http://inzynierka.local/?p=56', '', '', 'publish', 'open', 'open', '', '56', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 29, 'http://wordpress.loc/?p=56', 9, 'nav_menu_item', '', 0),
(57, 1, '2013-11-07 06:57:52', '2013-11-07 05:57:52', 'http://inzynierka.local/?p=57', '', '', 'publish', 'open', 'open', '', '57', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 29, 'http://wordpress.loc/?p=57', 10, 'nav_menu_item', '', 0),
(58, 1, '2013-11-07 06:57:52', '2013-11-07 05:57:52', 'http://inzynierka.local/?p=58', '', '', 'publish', 'open', 'open', '', '58', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 29, 'http://wordpress.loc/?p=58', 11, 'nav_menu_item', '', 0),
(59, 1, '2013-11-07 06:57:52', '2013-11-07 05:57:52', 'http://inzynierka.local/?p=59', '', '', 'publish', 'open', 'open', '', '59', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 39, 'http://wordpress.loc/?p=59', 13, 'nav_menu_item', '', 0),
(60, 1, '2013-11-07 06:57:52', '2013-11-07 05:57:52', 'http://inzynierka.local/?p=60', '', '', 'publish', 'open', 'open', '', '60', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 39, 'http://wordpress.loc/?p=60', 14, 'nav_menu_item', '', 0),
(61, 1, '2013-11-07 06:57:53', '2013-11-07 05:57:53', 'http://inzynierka.local/?p=61', '', '', 'publish', 'open', 'open', '', '61', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 39, 'http://wordpress.loc/?p=61', 15, 'nav_menu_item', '', 0),
(62, 1, '2013-11-07 06:57:51', '2013-11-07 05:57:51', 'http://inzynierka.local/?p=62', '', '', 'publish', 'open', 'open', '', '62', '', '', '2014-01-15 01:18:56', '2014-01-15 00:18:56', '', 18, 'http://wordpress.loc/?p=62', 5, 'nav_menu_item', '', 0),
(63, 1, '2013-11-07 06:57:51', '2013-11-07 05:57:51', 'http://inzynierka.local/?p=63', '', '', 'publish', 'open', 'open', '', '63', '', '', '2014-01-15 01:18:56', '2014-01-15 00:18:56', '', 18, 'http://wordpress.loc/?p=63', 4, 'nav_menu_item', '', 0),
(64, 1, '2013-11-07 06:57:51', '2013-11-07 05:57:51', 'http://inzynierka.local/?p=64', '', '', 'publish', 'open', 'open', '', '64', '', '', '2014-01-15 01:18:56', '2014-01-15 00:18:56', '', 18, 'http://wordpress.loc/?p=64', 3, 'nav_menu_item', '', 0),
(65, 1, '2013-11-07 06:57:51', '2013-11-07 05:57:51', 'http://inzynierka.local/?p=65', '', '', 'publish', 'open', 'open', '', '65', '', '', '2014-01-15 01:18:56', '2014-01-15 00:18:56', '', 18, 'http://wordpress.loc/?p=65', 6, 'nav_menu_item', '', 0),
(67, 1, '2013-11-07 07:02:41', '2013-11-07 06:02:41', '[forum]', 'Pierwsza aktualność', '', 'publish', 'open', 'open', '', 'pierwsza-aktualnosc', '', '', '2014-01-15 01:44:48', '2014-01-15 00:44:48', '', 0, 'http://wordpress.loc/?p=67', 0, 'post', '', 0),
(68, 1, '2013-11-07 07:02:41', '2013-11-07 06:02:41', 'http://inzynierka.local/?p=68', 'Pierwsza aktualność', '', 'inherit', 'open', 'open', '', '67-revision-v1', '', '', '2013-11-07 07:02:41', '2013-11-07 06:02:41', '', 67, 'http://wordpress.loc/?p=68', 0, 'revision', '', 0),
(69, 1, '2013-11-09 08:36:58', '2013-11-09 07:36:58', 'http://inzynierka.local/?page_id=69', 'Gra', '', 'publish', 'open', 'open', '', 'gra', '', '', '2013-11-09 08:36:58', '2013-11-09 07:36:58', '', 0, 'http://wordpress.loc/?page_id=69', 0, 'page', '', 0),
(70, 1, '2013-11-09 08:36:58', '2013-11-09 07:36:58', 'http://inzynierka.local/?p=70', 'Gra', '', 'inherit', 'open', 'open', '', '69-revision-v1', '', '', '2013-11-09 08:36:58', '2013-11-09 07:36:58', '', 69, 'http://wordpress.loc/?p=70', 0, 'revision', '', 0),
(71, 1, '2013-11-09 08:38:02', '2013-11-09 07:38:02', 'http://inzynierka.local/?p=71', '', '', 'publish', 'open', 'open', '', '71', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 0, 'http://wordpress.loc/?p=71', 20, 'nav_menu_item', '', 0),
(73, 1, '2013-11-13 00:24:09', '2013-11-12 23:24:09', 'http://inzynierka.local/?p=73', 'Drużyny', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2013-11-13 00:24:09', '2013-11-12 23:24:09', '', 18, 'http://wordpress.loc/?p=73', 0, 'revision', '', 0),
(77, 1, '2014-01-05 17:11:17', '2014-01-05 16:11:17', '', 'test', '', 'publish', 'closed', 'open', '', 'test', '', '', '2014-01-05 17:25:29', '2014-01-05 16:25:29', '', 0, 'http://inzynierka.local/?post_type=forum&#038;p=77', 1, 'forum', '', 0),
(78, 1, '2014-01-05 17:11:17', '2014-01-05 16:11:17', '', 'test', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-01-05 17:11:17', '2014-01-05 16:11:17', '', 77, 'http://inzynierka.local/?p=78', 0, 'revision', '', 0),
(79, 1, '2014-01-05 17:11:36', '2014-01-05 16:11:36', '', 'test2', '', 'trash', 'closed', 'open', '', 'test2', '', '', '2014-01-05 17:14:57', '2014-01-05 16:14:57', '', 77, 'http://inzynierka.local/?post_type=forum&#038;p=79', 0, 'forum', '', 0),
(80, 1, '2014-01-05 17:11:36', '2014-01-05 16:11:36', '', 'test2', '', 'inherit', 'open', 'open', '', '79-revision-v1', '', '', '2014-01-05 17:11:36', '2014-01-05 16:11:36', '', 79, 'http://inzynierka.local/?p=80', 0, 'revision', '', 0),
(81, 1, '2014-01-05 17:13:06', '2014-01-05 16:13:06', '', 'troll', '', 'trash', 'closed', 'open', '', 'troll', '', '', '2014-01-05 17:24:21', '2014-01-05 16:24:21', '', 77, 'http://inzynierka.local/?post_type=topic&#038;p=81', 0, 'topic', '', 0),
(82, 1, '2014-01-05 17:13:06', '2014-01-05 16:13:06', '', 'troll', '', 'inherit', 'open', 'open', '', '81-revision-v1', '', '', '2014-01-05 17:13:06', '2014-01-05 16:13:06', '', 81, 'http://inzynierka.local/?p=82', 0, 'revision', '', 0),
(85, 1, '2014-01-05 17:15:39', '2014-01-05 16:15:39', 'tag', 'tag', '', 'publish', 'closed', 'open', '', 'tag', '', '', '2014-01-05 17:15:39', '2014-01-05 16:15:39', '', 0, 'http://inzynierka.local/?post_type=reply&#038;p=85', 0, 'reply', '', 0),
(86, 1, '2014-01-05 17:15:39', '2014-01-05 16:15:39', 'tag', 'tag', '', 'inherit', 'open', 'open', '', '85-revision-v1', '', '', '2014-01-05 17:15:39', '2014-01-05 16:15:39', '', 85, 'http://inzynierka.local/?p=86', 0, 'revision', '', 0),
(87, 1, '2014-01-05 17:25:13', '2014-01-05 16:25:13', 'rerxqwxerrrwxewx', 'troll', '', 'publish', 'closed', 'open', '', 'test', '', '', '2014-01-05 17:26:49', '2014-01-05 16:26:49', '', 77, 'http://inzynierka.local/?post_type=topic&#038;p=87', 0, 'topic', '', 0),
(88, 1, '2014-01-05 17:25:13', '2014-01-05 16:25:13', 'rerxqwxerrrwxewx', 'test', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-01-05 17:25:13', '2014-01-05 16:25:13', '', 87, 'http://inzynierka.local/?p=88', 0, 'revision', '', 0),
(89, 1, '2014-01-05 17:26:49', '2014-01-05 16:26:49', 'rerxqwxerrrwxewx', 'troll', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-01-05 17:26:49', '2014-01-05 16:26:49', '', 87, 'http://inzynierka.local/?p=89', 0, 'revision', '', 0),
(90, 1, '2014-01-05 17:30:33', '2014-01-05 16:30:33', '', 'Forums', '', 'publish', 'open', 'closed', '', 'forums', '', '', '2014-01-15 01:51:02', '2014-01-15 00:51:02', '', 0, 'http://inzynierka.local/?page_id=90', 0, 'page', '', 0),
(91, 1, '2014-01-05 17:30:33', '2014-01-05 16:30:33', '', 'Forum', '', 'inherit', 'open', 'open', '', '90-revision-v1', '', '', '2014-01-05 17:30:33', '2014-01-05 16:30:33', '', 90, 'http://inzynierka.local/90-revision-v1/', 0, 'revision', '', 0),
(92, 1, '2014-01-05 17:31:45', '2014-01-05 16:31:45', '', 'Forums', '', 'inherit', 'open', 'open', '', '90-revision-v1', '', '', '2014-01-05 17:31:45', '2014-01-05 16:31:45', '', 90, 'http://inzynierka.local/90-revision-v1/', 0, 'revision', '', 0),
(93, 1, '2014-01-05 17:33:07', '2014-01-05 16:33:07', ' ', '', '', 'publish', 'open', 'open', '', '93', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 0, 'http://inzynierka.local/?p=93', 21, 'nav_menu_item', '', 0),
(94, 1, '2014-01-05 17:35:21', '2014-01-05 16:35:21', '[bbp-forum-index]', 'Forums', '', 'inherit', 'open', 'open', '', '90-revision-v1', '', '', '2014-01-05 17:35:21', '2014-01-05 16:35:21', '', 90, 'http://inzynierka.local/90-revision-v1/', 0, 'revision', '', 0),
(95, 1, '2014-01-05 18:02:56', '2014-01-05 17:02:56', 'Haha. Bardzo kurwa zabawne.', '', '', 'publish', 'closed', 'open', '', '95', '', '', '2014-01-05 18:02:56', '2014-01-05 17:02:56', '', 87, 'http://inzynierka.local/forums/reply/95/', 1, 'reply', '', 0),
(96, 1, '2014-01-05 20:17:09', '2014-01-05 19:17:09', '', 'Forums', '', 'inherit', 'open', 'open', '', '90-revision-v1', '', '', '2014-01-05 20:17:09', '2014-01-05 19:17:09', '', 90, 'http://inzynierka.local/90-revision-v1/', 0, 'revision', '', 0),
(97, 1, '2014-01-05 20:29:39', '2014-01-05 19:29:39', 'http://inzynierka.local/?page_id=49', 'Rozkazy', '', 'inherit', 'open', 'open', '', '49-revision-v1', '', '', '2014-01-05 20:29:39', '2014-01-05 19:29:39', '', 49, 'http://inzynierka.local/49-revision-v1/', 0, 'revision', '', 0),
(99, 1, '2014-01-06 00:57:55', '2014-01-05 23:57:55', 'http://inzynierka.local/?page_id=47', 'Dokumenty', '', 'inherit', 'open', 'open', '', '47-revision-v1', '', '', '2014-01-06 00:57:55', '2014-01-05 23:57:55', '', 47, 'http://inzynierka.local/47-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2014-01-06 00:58:20', '2014-01-05 23:58:20', 'http://inzynierka.local/?page_id=51', 'Wymagania na stopnie', '', 'inherit', 'open', 'open', '', '51-revision-v1', '', '', '2014-01-06 00:58:20', '2014-01-05 23:58:20', '', 51, 'http://inzynierka.local/51-revision-v1/', 0, 'revision', '', 0),
(101, 1, '2014-01-06 00:58:27', '2014-01-05 23:58:27', 'http://inzynierka.local/?page_id=18', 'Drużyny', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2014-01-06 00:58:27', '2014-01-05 23:58:27', '', 18, 'http://inzynierka.local/18-revision-v1/', 0, 'revision', '', 0),
(102, 1, '2014-01-06 00:58:32', '2014-01-05 23:58:32', 'http://inzynierka.local/?page_id=25', '1Dignitas', '', 'inherit', 'open', 'open', '', '25-revision-v1', '', '', '2014-01-06 00:58:32', '2014-01-05 23:58:32', '', 25, 'http://inzynierka.local/25-revision-v1/', 0, 'revision', '', 0),
(103, 1, '2014-01-06 00:58:36', '2014-01-05 23:58:36', 'http://inzynierka.local/?page_id=23', '6Tenebris', '', 'inherit', 'open', 'open', '', '23-revision-v1', '', '', '2014-01-06 00:58:36', '2014-01-05 23:58:36', '', 23, 'http://inzynierka.local/23-revision-v1/', 0, 'revision', '', 0),
(104, 1, '2014-01-06 00:58:41', '2014-01-05 23:58:41', 'http://inzynierka.local/?page_id=21', '8Viator', '', 'inherit', 'open', 'open', '', '21-revision-v1', '', '', '2014-01-06 00:58:41', '2014-01-05 23:58:41', '', 21, 'http://inzynierka.local/21-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2014-01-06 00:58:51', '2014-01-05 23:58:51', 'http://inzynierka.local/?page_id=27', 'Chochliki', '', 'inherit', 'open', 'open', '', '27-revision-v1', '', '', '2014-01-06 00:58:51', '2014-01-05 23:58:51', '', 27, 'http://inzynierka.local/27-revision-v1/', 0, 'revision', '', 0),
(106, 1, '2014-01-06 00:58:59', '2014-01-05 23:58:59', 'http://inzynierka.local/?page_id=29', 'Galeria', '', 'inherit', 'open', 'open', '', '29-revision-v1', '', '', '2014-01-06 00:58:59', '2014-01-05 23:58:59', '', 29, 'http://inzynierka.local/29-revision-v1/', 0, 'revision', '', 0),
(107, 1, '2014-01-06 00:59:04', '2014-01-05 23:59:04', 'http://inzynierka.local/?page_id=31', '2013', '', 'inherit', 'open', 'open', '', '31-revision-v1', '', '', '2014-01-06 00:59:04', '2014-01-05 23:59:04', '', 31, 'http://inzynierka.local/31-revision-v1/', 0, 'revision', '', 0),
(108, 1, '2014-01-06 00:59:09', '2014-01-05 23:59:09', 'http://inzynierka.local/?page_id=33', '2012', '', 'inherit', 'open', 'open', '', '33-revision-v1', '', '', '2014-01-06 00:59:09', '2014-01-05 23:59:09', '', 33, 'http://inzynierka.local/33-revision-v1/', 0, 'revision', '', 0),
(109, 1, '2014-01-06 00:59:15', '2014-01-05 23:59:15', 'http://inzynierka.local/?page_id=35', '2011', '', 'inherit', 'open', 'open', '', '35-revision-v1', '', '', '2014-01-06 00:59:15', '2014-01-05 23:59:15', '', 35, 'http://inzynierka.local/35-revision-v1/', 0, 'revision', '', 0),
(110, 1, '2014-01-06 00:59:21', '2014-01-05 23:59:21', 'http://inzynierka.local/?page_id=37', '2010', '', 'inherit', 'open', 'open', '', '37-revision-v1', '', '', '2014-01-06 00:59:21', '2014-01-05 23:59:21', '', 37, 'http://inzynierka.local/37-revision-v1/', 0, 'revision', '', 0),
(111, 1, '2014-01-06 01:01:05', '2014-01-06 00:01:05', 'http://inzynierka.local/?page_id=39', 'Informacje', '', 'inherit', 'open', 'open', '', '39-revision-v1', '', '', '2014-01-06 01:01:05', '2014-01-06 00:01:05', '', 39, 'http://inzynierka.local/39-revision-v1/', 0, 'revision', '', 0),
(112, 1, '2014-01-06 01:01:11', '2014-01-06 00:01:11', 'http://inzynierka.local/?page_id=41', 'Stopnie', '', 'inherit', 'open', 'open', '', '41-revision-v1', '', '', '2014-01-06 01:01:11', '2014-01-06 00:01:11', '', 41, 'http://inzynierka.local/41-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2014-01-06 01:01:16', '2014-01-06 00:01:16', 'http://inzynierka.local/?page_id=43', 'Historia ZHP', '', 'inherit', 'open', 'open', '', '43-revision-v1', '', '', '2014-01-06 01:01:16', '2014-01-06 00:01:16', '', 43, 'http://inzynierka.local/43-revision-v1/', 0, 'revision', '', 0),
(114, 1, '2014-01-06 01:01:21', '2014-01-06 00:01:21', 'http://inzynierka.local/?page_id=45', 'Władze Szczepu', '', 'inherit', 'open', 'open', '', '45-revision-v1', '', '', '2014-01-06 01:01:21', '2014-01-06 00:01:21', '', 45, 'http://inzynierka.local/45-revision-v1/', 0, 'revision', '', 0),
(116, 1, '2014-01-06 01:18:40', '2014-01-06 00:18:40', ' ', '', '', 'publish', 'open', 'open', '', '116', '', '', '2014-01-06 01:48:24', '2014-01-06 00:48:24', '', 18, 'http://inzynierka.local/?p=116', 2, 'nav_menu_item', '', 0),
(117, 1, '2014-01-06 01:18:41', '2014-01-06 00:18:41', ' ', '', '', 'publish', 'open', 'open', '', '117', '', '', '2014-01-06 01:48:24', '2014-01-06 00:48:24', '', 18, 'http://inzynierka.local/?p=117', 3, 'nav_menu_item', '', 0),
(118, 1, '2014-01-06 01:18:41', '2014-01-06 00:18:41', ' ', '', '', 'publish', 'open', 'open', '', '118', '', '', '2014-01-06 01:48:24', '2014-01-06 00:48:24', '', 18, 'http://inzynierka.local/?p=118', 4, 'nav_menu_item', '', 0),
(119, 1, '2014-01-06 01:18:41', '2014-01-06 00:18:41', ' ', '', '', 'publish', 'open', 'open', '', '119', '', '', '2014-01-06 01:48:24', '2014-01-06 00:48:24', '', 18, 'http://inzynierka.local/?p=119', 5, 'nav_menu_item', '', 0),
(120, 1, '2014-01-06 01:20:04', '2014-01-06 00:20:04', ' ', '', '', 'publish', 'open', 'open', '', '120', '', '', '2014-01-06 01:47:44', '2014-01-06 00:47:44', '', 0, 'http://inzynierka.local/?p=120', 2, 'nav_menu_item', '', 0),
(121, 1, '2014-01-06 01:20:04', '2014-01-06 00:20:04', ' ', '', '', 'publish', 'open', 'open', '', '121', '', '', '2014-01-06 01:47:44', '2014-01-06 00:47:44', '', 47, 'http://inzynierka.local/?p=121', 1, 'nav_menu_item', '', 0),
(122, 1, '2014-01-06 01:20:04', '2014-01-06 00:20:04', ' ', '', '', 'publish', 'open', 'open', '', '122', '', '', '2014-01-06 01:47:44', '2014-01-06 00:47:44', '', 47, 'http://inzynierka.local/?p=122', 3, 'nav_menu_item', '', 0),
(124, 1, '2014-01-06 01:20:49', '2014-01-06 00:20:49', ' ', '', '', 'publish', 'open', 'open', '', '124', '', '', '2014-01-06 01:48:05', '2014-01-06 00:48:05', '', 39, 'http://inzynierka.local/?p=124', 2, 'nav_menu_item', '', 0),
(125, 1, '2014-01-06 01:20:49', '2014-01-06 00:20:49', ' ', '', '', 'publish', 'open', 'open', '', '125', '', '', '2014-01-06 01:48:05', '2014-01-06 00:48:05', '', 39, 'http://inzynierka.local/?p=125', 3, 'nav_menu_item', '', 0),
(126, 1, '2014-01-06 01:20:50', '2014-01-06 00:20:50', ' ', '', '', 'publish', 'open', 'open', '', '126', '', '', '2014-01-06 01:48:05', '2014-01-06 00:48:05', '', 39, 'http://inzynierka.local/?p=126', 4, 'nav_menu_item', '', 0),
(127, 1, '2014-01-06 01:24:37', '2014-01-06 00:24:37', ' ', '', '', 'publish', 'open', 'open', '', '127', '', '', '2014-01-06 01:47:20', '2014-01-06 00:47:20', '', 0, 'http://inzynierka.local/?p=127', 1, 'nav_menu_item', '', 0),
(128, 1, '2014-01-06 01:24:37', '2014-01-06 00:24:37', ' ', '', '', 'publish', 'open', 'open', '', '128', '', '', '2014-01-06 01:47:20', '2014-01-06 00:47:20', '', 29, 'http://inzynierka.local/?p=128', 2, 'nav_menu_item', '', 0),
(129, 1, '2014-01-06 01:24:37', '2014-01-06 00:24:37', ' ', '', '', 'publish', 'open', 'open', '', '129', '', '', '2014-01-06 01:47:20', '2014-01-06 00:47:20', '', 29, 'http://inzynierka.local/?p=129', 3, 'nav_menu_item', '', 0),
(130, 1, '2014-01-06 01:24:38', '2014-01-06 00:24:38', ' ', '', '', 'publish', 'open', 'open', '', '130', '', '', '2014-01-06 01:47:20', '2014-01-06 00:47:20', '', 29, 'http://inzynierka.local/?p=130', 4, 'nav_menu_item', '', 0),
(131, 1, '2014-01-06 01:24:38', '2014-01-06 00:24:38', ' ', '', '', 'publish', 'open', 'open', '', '131', '', '', '2014-01-06 01:47:20', '2014-01-06 00:47:20', '', 29, 'http://inzynierka.local/?p=131', 5, 'nav_menu_item', '', 0),
(132, 1, '2014-01-06 01:48:05', '2014-01-06 00:48:05', ' ', '', '', 'publish', 'open', 'open', '', '132', '', '', '2014-01-06 01:48:05', '2014-01-06 00:48:05', '', 0, 'http://inzynierka.local/?p=132', 1, 'nav_menu_item', '', 0),
(133, 1, '2014-01-06 01:48:23', '2014-01-06 00:48:23', ' ', '', '', 'publish', 'open', 'open', '', '133', '', '', '2014-01-06 01:48:23', '2014-01-06 00:48:23', '', 0, 'http://inzynierka.local/?p=133', 1, 'nav_menu_item', '', 0),
(134, 1, '2014-01-08 00:18:11', '2014-01-07 23:18:11', '[wp-members page="register"]', 'Register', '', 'publish', 'open', 'open', '', 'register', '', '', '2014-01-08 00:19:23', '2014-01-07 23:19:23', '', 0, 'http://inzynierka.local/?page_id=134', 0, 'page', '', 0),
(135, 1, '2014-01-08 00:18:11', '2014-01-07 23:18:11', '[register]', 'Register', '', 'inherit', 'open', 'open', '', '134-revision-v1', '', '', '2014-01-08 00:18:11', '2014-01-07 23:18:11', '', 134, 'http://inzynierka.local/134-revision-v1/', 0, 'revision', '', 0),
(136, 1, '2014-01-08 00:19:23', '2014-01-07 23:19:23', '[wp-members page="register"]', 'Register', '', 'inherit', 'open', 'open', '', '134-revision-v1', '', '', '2014-01-08 00:19:23', '2014-01-07 23:19:23', '', 134, 'http://inzynierka.local/134-revision-v1/', 0, 'revision', '', 0),
(137, 1, '2014-01-08 00:30:32', '2014-01-07 23:30:32', '[wp-members page="user-profile"]', 'User Profile', '', 'publish', 'open', 'open', '', 'user-profile', '', '', '2014-01-08 00:30:32', '2014-01-07 23:30:32', '', 0, 'http://inzynierka.local/?page_id=137', 0, 'page', '', 0),
(138, 1, '2014-01-08 00:30:32', '2014-01-07 23:30:32', '[wp-members page="user-profile"]', 'User Profile', '', 'inherit', 'open', 'open', '', '137-revision-v1', '', '', '2014-01-08 00:30:32', '2014-01-07 23:30:32', '', 137, 'http://inzynierka.local/137-revision-v1/', 0, 'revision', '', 0),
(139, 1, '2014-01-08 00:33:20', '2014-01-07 23:33:20', '[wp-members page="user-list" search="false" nav="false" number="5]', 'User List', '', 'publish', 'open', 'open', '', 'user-list', '', '', '2014-01-08 00:33:20', '2014-01-07 23:33:20', '', 0, 'http://inzynierka.local/?page_id=139', 0, 'page', '', 0),
(140, 1, '2014-01-08 00:33:20', '2014-01-07 23:33:20', '[wp-members page="user-list" search="false" nav="false" number="5]', 'User List', '', 'inherit', 'open', 'open', '', '139-revision-v1', '', '', '2014-01-08 00:33:20', '2014-01-07 23:33:20', '', 139, 'http://inzynierka.local/139-revision-v1/', 0, 'revision', '', 0),
(141, 1, '2014-01-13 21:12:22', '0000-00-00 00:00:00', '', 'Automatycznie zapisany szkic', '', 'auto-draft', 'open', 'open', '', '', '', '', '2014-01-13 21:12:22', '0000-00-00 00:00:00', '', 0, 'http://inzynierka.local/?p=141', 0, 'post', '', 0),
(142, 1, '2014-01-15 01:18:16', '2014-01-15 00:18:16', '{CALENDAR}', 'Kalendarz', '', 'publish', 'open', 'open', '', 'kalendarz', '', '', '2014-01-15 02:08:43', '2014-01-15 01:08:43', '', 0, 'http://inzynierka.local/?page_id=142', 0, 'page', '', 0),
(143, 1, '2014-01-15 01:18:16', '2014-01-15 00:18:16', '', 'Kalendarz', '', 'inherit', 'open', 'open', '', '142-revision-v1', '', '', '2014-01-15 01:18:16', '2014-01-15 00:18:16', '', 142, 'http://inzynierka.local/142-revision-v1/', 0, 'revision', '', 0),
(144, 1, '2014-01-15 01:18:28', '2014-01-15 00:18:28', '[fullcalendar]', 'Kalendarz', '', 'inherit', 'open', 'open', '', '142-revision-v1', '', '', '2014-01-15 01:18:28', '2014-01-15 00:18:28', '', 142, 'http://inzynierka.local/142-revision-v1/', 0, 'revision', '', 0),
(145, 1, '2014-01-15 01:18:57', '2014-01-15 00:18:57', ' ', '', '', 'publish', 'open', 'open', '', '145', '', '', '2014-01-15 01:18:57', '2014-01-15 00:18:57', '', 0, 'http://inzynierka.local/?p=145', 19, 'nav_menu_item', '', 0),
(146, 1, '2014-01-15 01:28:59', '2014-01-15 00:28:59', '[fullcalendar]', 'Kalendarz', '', 'inherit', 'open', 'open', '', '142-autosave-v1', '', '', '2014-01-15 01:28:59', '2014-01-15 00:28:59', '', 142, 'http://inzynierka.local/142-autosave-v1/', 0, 'revision', '', 0),
(147, 1, '2014-01-15 01:22:54', '2014-01-15 00:22:54', '[fullcalendar]dupa', 'Kalendarz', '', 'inherit', 'open', 'open', '', '142-revision-v1', '', '', '2014-01-15 01:22:54', '2014-01-15 00:22:54', '', 142, 'http://inzynierka.local/142-revision-v1/', 0, 'revision', '', 0),
(148, 1, '2014-01-15 01:25:34', '2014-01-15 00:25:34', '[fullcalendar type="post"]', 'Kalendarz', '', 'inherit', 'open', 'open', '', '142-revision-v1', '', '', '2014-01-15 01:25:34', '2014-01-15 00:25:34', '', 142, 'http://inzynierka.local/142-revision-v1/', 0, 'revision', '', 0),
(149, 1, '2014-01-15 01:29:08', '2014-01-15 00:29:08', '[fullcalendar]', 'Pierwsza aktualność', '', 'inherit', 'open', 'open', '', '67-revision-v1', '', '', '2014-01-15 01:29:08', '2014-01-15 00:29:08', '', 67, 'http://inzynierka.local/67-revision-v1/', 0, 'revision', '', 0),
(150, 1, '2014-01-15 01:44:32', '2014-01-15 00:44:32', '[events_fullcalendar]', 'Pierwsza aktualność', '', 'inherit', 'open', 'open', '', '67-revision-v1', '', '', '2014-01-15 01:44:32', '2014-01-15 00:44:32', '', 67, 'http://inzynierka.local/67-revision-v1/', 0, 'revision', '', 0),
(151, 1, '2014-01-15 01:44:45', '2014-01-15 00:44:45', '[forum]', 'Pierwsza aktualność', '', 'inherit', 'open', 'open', '', '67-autosave-v1', '', '', '2014-01-15 01:44:45', '2014-01-15 00:44:45', '', 67, 'http://inzynierka.local/67-autosave-v1/', 0, 'revision', '', 0),
(152, 1, '2014-01-15 01:44:48', '2014-01-15 00:44:48', '[forum]', 'Pierwsza aktualność', '', 'inherit', 'open', 'open', '', '67-revision-v1', '', '', '2014-01-15 01:44:48', '2014-01-15 00:44:48', '', 67, 'http://inzynierka.local/67-revision-v1/', 0, 'revision', '', 0),
(153, 1, '2014-01-15 01:48:28', '2014-01-15 00:48:28', '', 'Forums', '', 'inherit', 'open', 'open', '', '90-autosave-v1', '', '', '2014-01-15 01:48:28', '2014-01-15 00:48:28', '', 90, 'http://inzynierka.local/90-autosave-v1/', 0, 'revision', '', 0),
(154, 1, '2014-01-15 01:48:48', '2014-01-15 00:48:48', '[fullcalendar]', 'Forums', '', 'inherit', 'open', 'open', '', '90-revision-v1', '', '', '2014-01-15 01:48:48', '2014-01-15 00:48:48', '', 90, 'http://inzynierka.local/90-revision-v1/', 0, 'revision', '', 0),
(155, 1, '2014-01-15 01:51:02', '2014-01-15 00:51:02', '', 'Forums', '', 'inherit', 'open', 'open', '', '90-revision-v1', '', '', '2014-01-15 01:51:02', '2014-01-15 00:51:02', '', 90, 'http://inzynierka.local/90-revision-v1/', 0, 'revision', '', 0),
(156, 1, '2014-01-15 02:08:43', '2014-01-15 01:08:43', '{CALENDAR}', 'Kalendarz', '', 'inherit', 'open', 'open', '', '142-revision-v1', '', '', '2014-01-15 02:08:43', '2014-01-15 01:08:43', '', 142, 'http://inzynierka.local/142-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Bez kategorii', 'bez-kategorii', 0),
(2, 'Primary Menu', 'primary-menu', 0),
(3, 'Teams Menu', 'teams-menu', 0),
(4, 'Documents Menu', 'documents-menu', 0),
(5, 'Informations Menu', 'informations-menu', 0),
(6, 'Gallery Menu', 'gallery-menu', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(6, 2, 0),
(8, 2, 0),
(9, 2, 0),
(10, 2, 0),
(11, 2, 0),
(53, 2, 0),
(54, 2, 0),
(55, 2, 0),
(56, 2, 0),
(57, 2, 0),
(58, 2, 0),
(59, 2, 0),
(60, 2, 0),
(61, 2, 0),
(62, 2, 0),
(63, 2, 0),
(64, 2, 0),
(65, 2, 0),
(67, 1, 0),
(71, 2, 0),
(93, 2, 0),
(116, 3, 0),
(117, 3, 0),
(118, 3, 0),
(119, 3, 0),
(120, 4, 0),
(121, 4, 0),
(122, 4, 0),
(124, 5, 0),
(125, 5, 0),
(126, 5, 0),
(127, 6, 0),
(128, 6, 0),
(129, 6, 0),
(130, 6, 0),
(131, 6, 0),
(132, 5, 0),
(133, 3, 0),
(145, 2, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Zrzut danych tabeli `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 21),
(3, 3, 'nav_menu', '', 0, 5),
(4, 4, 'nav_menu', '', 0, 3),
(5, 5, 'nav_menu', '', 0, 4),
(6, 6, 'nav_menu', '', 0, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Zrzut danych tabeli `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', 'tag'),
(2, 1, 'last_name', 'tag2'),
(3, 1, 'nickname', 'admin'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:2:{s:13:"administrator";b:1;s:13:"bbp_keymaster";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '141'),
(15, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(16, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(17, 1, 'wp_user-settings', 'mfold=o'),
(18, 1, 'wp_user-settings-time', '1383802794'),
(19, 1, 'nav_menu_recently_edited', '2'),
(20, 2, 'first_name', ''),
(21, 2, 'last_name', ''),
(22, 2, 'nickname', 'test'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'comment_shortcuts', 'false'),
(26, 2, 'admin_color', 'fresh'),
(27, 2, 'use_ssl', '0'),
(28, 2, 'show_admin_bar_front', 'true'),
(29, 2, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(30, 2, 'wp_user_level', '3'),
(31, 2, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(32, 2, 'wp_user-settings', 'mfold=o'),
(33, 2, 'wp_user-settings-time', '1383989203'),
(34, 3, 'first_name', 'hg'),
(35, 3, 'last_name', ''),
(36, 3, 'nickname', 'iuhiuhiuh'),
(37, 3, 'description', ''),
(38, 3, 'rich_editing', 'true'),
(39, 3, 'comment_shortcuts', 'false'),
(40, 3, 'admin_color', 'fresh'),
(41, 3, 'use_ssl', '0'),
(42, 3, 'show_admin_bar_front', 'true'),
(44, 3, 'wp_user_level', '3'),
(45, 3, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(46, 4, 'first_name', ''),
(47, 4, 'last_name', ''),
(48, 4, 'nickname', 'huuihiuh'),
(49, 4, 'description', ''),
(50, 4, 'rich_editing', 'true'),
(51, 4, 'comment_shortcuts', 'false'),
(52, 4, 'admin_color', 'fresh'),
(53, 4, 'use_ssl', '0'),
(54, 4, 'show_admin_bar_front', 'true'),
(55, 4, 'wp_capabilities', 'a:1:{s:11:"contributor";b:1;}'),
(56, 4, 'wp_user_level', '1'),
(57, 4, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(58, 1, 'closedpostboxes_page', 'a:0:{}'),
(59, 1, 'metaboxhidden_page', 'a:3:{i:0;s:10:"postcustom";i:1;s:16:"commentstatusdiv";i:2;s:9:"authordiv";}'),
(60, 1, 'nie', 'może');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B3ppok/1aoMSo0uRsA3TXrMezhYUNt/', 'admin', 'krzysztof.siwek2@gmail.com', '', '2013-11-05 21:55:20', '', 0, 'admin'),
(2, 'test', '$P$BDuN907wznhHR8hu82Uvit5xh.09SB0', 'test', 'test@test.pl', '', '2013-11-09 09:24:45', '', 0, 'test'),
(3, 'iuhiuhiuh', '$P$B53T1x860MNYQec13PxRRuNzWmC8LX.', 'iuhiuhiuh', 'arhimenrius@gmail.com', '', '2013-11-10 12:06:07', '', 0, 'hg'),
(4, 'huuihiuh', '$P$BnjImUF0Jp1sf3HMpPq./7BEyr8Qcv1', 'huuihiuh', 'szgftrn@o2.pl', '', '2013-11-10 12:10:41', '', 0, 'huuihiuh');
