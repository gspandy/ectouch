--
-- 后台权限控制
--

-- 
INSERT INTO `ecs_admin_action` VALUES ('201', '0', 'ext_wechat', '');
-- 
INSERT INTO `ecs_admin_action` VALUES ('147', '201', 'wechat_config', '');
INSERT INTO `ecs_admin_action` VALUES ('148', '201', 'wechat_masssend', '');
INSERT INTO `ecs_admin_action` VALUES ('149', '201', 'wechat_autoreply', '');
INSERT INTO `ecs_admin_action` VALUES ('150', '201', 'wechat_selfmenu', '');
INSERT INTO `ecs_admin_action` VALUES ('151', '201', 'wechat_tmplmsg', '');
INSERT INTO `ecs_admin_action` VALUES ('152', '201', 'wechat_contactmanage', '');
INSERT INTO `ecs_admin_action` VALUES ('153', '201', 'wechat_appmsg', '');
INSERT INTO `ecs_admin_action` VALUES ('154', '201', 'wechat_qrcode', '');
INSERT INTO `ecs_admin_action` VALUES ('155', '201', 'wechat_extends', '');
INSERT INTO `ecs_admin_action` VALUES ('157', '201', 'wechat_customer', '');
INSERT INTO `ecs_admin_action` (`action_id`,`parent_id`, `action_code`, `relevance`) VALUES
('158', '6', 'service_type', ''),
('159', '6', 'back_cause_list', ''),
('160', '6', 'aftermarket_list', ''),
('161', '6', 'add_return_cause', '');
INSERT INTO `ecs_admin_action` (`action_id`, `parent_id`, `action_code`, `relevance`) VALUES
(162, 0, 'menu_tools', ''),
(163, 162, 'navigator', ''),
(164, 162, 'authorization', ''),
(165, 162, 'mail_settings', ''),
(166, 162, 'view_sendlist', ''),
(167, 162, 'captcha_manage', ''),
(168, 162, 'upgrade', '');
--
-- 表的结构 `ecs_touch_activity`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_activity` (
  `act_id` int(10) NOT NULL,
  `act_banner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的结构 `ecs_touch_topic`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL DEFAULT '',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `data` text NOT NULL DEFAULT '',
  `template` varchar(255) NOT NULL DEFAULT '',
  `css` text NOT NULL DEFAULT '',
  `topic_img` varchar(255) DEFAULT NULL,
  `title_pic` varchar(255) DEFAULT NULL,
  `base_style` char(6) DEFAULT NULL,
  `htmls` mediumtext,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ecs_touch_ad`
--

INSERT INTO `ecs_ad` (`position_id`, `media_type`, `ad_name`, `ad_link`, `ad_code`, `start_time`, `end_time`, `link_man`, `link_email`, `link_phone`, `click_count`, `enabled`) VALUES
(255, 0, '1', '', 'index_banner_1.png', 1396339200, 1525161600, '', '', '', 0, 1),
(255, 0, '2', '', 'index_banner_2.png', 1396339200, 1525161600, '', '', '', 0, 1),
(255, 0, '3', '', 'index_banner_3.png', 1396339200, 1525161600, '', '', '', 0, 1);

--
-- 转存表中的数据 `ecs_touch_ad_position`
--
ALTER TABLE `ecs_ad_position` MODIFY COLUMN `position_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST;
DELETE FROM `ecs_ad_position` WHERE `position_id` = 255;
INSERT INTO `ecs_ad_position` (`position_id`, `position_name`, `ad_width`, `ad_height`, `position_desc`, `position_style`) VALUES
(255, '手机端首页Banner广告位', 360, 168, '', '{foreach from=$ads item=ad}<div class="swiper-slide">{$ad}</div>{/foreach}');

--
-- 表的结构 `ecs_touch_category`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned DEFAULT NULL COMMENT '外键',
  `cat_image` varchar(255) DEFAULT NULL COMMENT '分类ICO图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- 表的结构 `ecs_touch_feedback`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `msg_read` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- 表的结构 `ecs_touch_goods`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_goods` (
  `goods_id` int(10) unsigned default '0' COMMENT '外键',
  `sales_volume` int(10) unsigned default '0' COMMENT '销量统计',
  UNIQUE KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的结构 `ecs_touch_goods_activity`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_goods_activity` (
  `act_id` int(10) DEFAULT '0',
  `act_banner` varchar(255) DEFAULT NULL,
  `sales_count` int(10) DEFAULT '0',
  `click_num` int(10) NOT NULL DEFAULT '0',
  `cur_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `act_id` (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 表的结构 `ecs_touch_nav`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(10) DEFAULT NULL,
  `cid` smallint(5) unsigned DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `ifshow` tinyint(1) NOT NULL DEFAULT '0',
  `vieworder` tinyint(1) NOT NULL DEFAULT '0',
  `opennew` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `ifshow` (`ifshow`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ecs_touch_nav`
--

INSERT INTO `ecs_touch_nav` (`id`, `ctype`, `cid`, `name`, `ifshow`, `vieworder`, `opennew`, `url`, `pic`, `type`) VALUES
(1, '', 0, '全部分类', 1, 0, 0, 'index.php?c=category&amp;a=top_all', 'themes/default/images/nav/nav_0.png', 'middle'),
(2, '', 0, '我的订单', 1, 0, 0, 'index.php?c=user&amp;a=order_list', 'themes/default/images/nav/nav_1.png', 'middle'),
(3, '', 0, '最新团购', 1, 0, 0, 'index.php?c=groupbuy', 'themes/default/images/nav/nav_4.png', 'middle'),
(4, '', 0, '促销活动', 1, 0, 0, 'index.php?c=activity', 'themes/default/images/nav/nav_3.png', 'middle'),
(5, '', 0, '积分商城', 1, 0, 0, 'index.php?c=exchange', 'themes/default/images/nav/nav_6.png', 'middle'),
(6, '', 0, '品牌街', 1, 0, 0, 'index.php?c=brand', 'themes/default/images/nav/nav_2.png', 'middle'),
(7, '', 0, '个人中心', 1, 0, 0, 'index.php?c=user', 'themes/default/images/nav/nav_5.png', 'middle'),
(8, '', 0, '购物车', 1, 0, 0, 'index.php?c=flow&amp;a=cart', 'themes/default/images/nav/nav_7.png', 'middle');

-- ----------------------------
-- 增加短信接口配置项
-- ----------------------------
INSERT INTO `ecs_shop_config` (parent_id, code, type, store_range, store_dir, value, sort_order)VALUES (8, 'sms_ecmoban_user', 'text', '', '', '', 0);
INSERT INTO `ecs_shop_config` (parent_id, code, type, store_range, store_dir, value, sort_order)VALUES (8, 'sms_ecmoban_password', 'password', '', '', '', 0);
INSERT INTO `ecs_shop_config` (parent_id, code, type, store_range, store_dir, value, sort_order)VALUES (8, 'sms_signin', 'select', '1,0', '', '0', 1);

--
-- 表的结构 `ecs_touch_user`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_auth` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `auth_config` text NOT NULL DEFAULT '',
  `from` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='登录插件';

--
-- 表的结构 `ecs_touch_user_info`
--

CREATE TABLE IF NOT EXISTS `ecs_touch_user_info` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `aite_id` varchar(200) NOT NULL DEFAULT '' COMMENT '标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- 

ALTER TABLE `ecs_brand` ADD COLUMN `brand_banner` varchar(80)  DEFAULT '';
ALTER TABLE `ecs_goods_activity` ADD COLUMN `touch_img` VARCHAR (50)  DEFAULT '';
ALTER TABLE `ecs_favourable_activity` ADD COLUMN `touch_img` VARCHAR (50)  DEFAULT '';
