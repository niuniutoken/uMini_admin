/*
Navicat MySQL Data Transfer

Source Server         : 39.107.237.39
Source Server Version : 50721
Source Host           : 39.107.237.39:3306
Source Database       : meizi

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-11-18 13:11:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_menu`;
CREATE TABLE `t_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上一级ID',
  `name` varchar(30) NOT NULL COMMENT '节点名称',
  `controller` varchar(60) NOT NULL DEFAULT '#' COMMENT '控制器名',
  `action` varchar(60) NOT NULL DEFAULT '#' COMMENT '方法名',
  `show` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示菜单（0为不显示1为显示）',
  `icon` varchar(30) DEFAULT NULL COMMENT '节点图标',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='接口节点表';

-- ----------------------------
-- Records of t_admin_menu
-- ----------------------------
INSERT INTO `t_admin_menu` VALUES ('20', '0', '管理员管理', '#', '#', '1', 'layui-icon-username', '1535336214', '1535336214');
INSERT INTO `t_admin_menu` VALUES ('21', '20', '管理员管理', 'admin', 'index', '1', '', '1535336253', '1535591082');
INSERT INTO `t_admin_menu` VALUES ('22', '20', '菜单管理', 'menu', 'index', '1', null, '1535336278', '1535336278');
INSERT INTO `t_admin_menu` VALUES ('26', '20', '角色管理', 'role', 'index', '1', null, '1535439520', '1535439520');
INSERT INTO `t_admin_menu` VALUES ('27', '21', '添加管理员  ', 'admin', 'add', '0', null, '1535507352', '1535507352');
INSERT INTO `t_admin_menu` VALUES ('28', '21', '删除管理员', 'admin', 'del', '0', null, '1535507383', '1535507383');
INSERT INTO `t_admin_menu` VALUES ('29', '22', '添加菜单', 'menu', 'add', '0', null, '1535538842', '1535538842');
INSERT INTO `t_admin_menu` VALUES ('30', '22', '删除菜单', 'menu', 'del', '0', '', '1535538856', '1535894172');
INSERT INTO `t_admin_menu` VALUES ('31', '26', '添加角色', 'role', 'add', '0', null, '1535538891', '1535538891');
INSERT INTO `t_admin_menu` VALUES ('32', '0', '接口管理', '#', '#', '1', 'layui-icon-layer', '1535556405', '1536674828');
INSERT INTO `t_admin_menu` VALUES ('33', '32', '分组管理', 'group', 'index', '1', '', '1535556426', '1536674953');
INSERT INTO `t_admin_menu` VALUES ('37', '33', '添加接口分组', 'group', 'add', '0', '', '1535556530', '1536921605');
INSERT INTO `t_admin_menu` VALUES ('38', '33', '编辑接口分组', 'group', 'edit', '0', '', '1535556536', '1536921896');
INSERT INTO `t_admin_menu` VALUES ('41', '21', '管理员列表', 'admin', 'lst', '0', null, '1536586191', '1536586191');
INSERT INTO `t_admin_menu` VALUES ('42', '33', '接口分组详情', 'group', 'info', '0', '', '1536921731', '1540546139');
INSERT INTO `t_admin_menu` VALUES ('43', '33', '删除接口分组', 'group', 'del', '0', '', '1536921765', '1536922925');
INSERT INTO `t_admin_menu` VALUES ('44', '32', '接口管理', 'apiroute', 'index', '1', '', '1536921852', '1537706455');
INSERT INTO `t_admin_menu` VALUES ('47', '0', '数据库管理', '#', '#', '1', 'layui-icon-template-1', '1539406635', '1539406635');
INSERT INTO `t_admin_menu` VALUES ('48', '47', '数据库列表', 'data', 'index', '1', '', '1539406730', '1540545917');
INSERT INTO `t_admin_menu` VALUES ('49', '47', '数据库还原', 'data', 'import', '1', null, '1539700706', '1539700706');
INSERT INTO `t_admin_menu` VALUES ('50', '0', '文章管理', '#', '#', '1', 'layui-icon-template', '1539831417', '1539831417');
INSERT INTO `t_admin_menu` VALUES ('51', '50', '文章列表', 'article', 'index', '1', '', '1539831465', '1540545780');
INSERT INTO `t_admin_menu` VALUES ('53', '50', '文章数据集', 'article', 'lst', '0', '', '1539831546', '1540545766');
INSERT INTO `t_admin_menu` VALUES ('54', '50', '添加文章', 'article', 'add', '0', null, '1539831570', '1539831570');
INSERT INTO `t_admin_menu` VALUES ('56', '44', '添加接口', 'interroute ', 'add', '0', '', '1540288717', '1540288776');
INSERT INTO `t_admin_menu` VALUES ('57', '44', '接口详情', 'interroute ', 'info', '0', '', '1540288760', '1540288787');
INSERT INTO `t_admin_menu` VALUES ('58', '44', '接口编辑', 'interroute', 'edit', '0', null, '1540288844', '1540288844');
INSERT INTO `t_admin_menu` VALUES ('66', '44', '接口集', 'apiroute', 'lst', '0', '', '1540525403', '1540525464');
INSERT INTO `t_admin_menu` VALUES ('67', '26', '角色列表', 'role', 'lst', '0', null, '1540534328', '1540534328');
INSERT INTO `t_admin_menu` VALUES ('68', '26', '编辑角色', 'role', 'edit', '0', '', '1540534458', '1540534815');
INSERT INTO `t_admin_menu` VALUES ('70', '26', '角色信息', 'role', 'info', '0', null, '1540534876', '1540534876');
INSERT INTO `t_admin_menu` VALUES ('71', '26', '角色删除', 'role', 'del', '0', null, '1540534985', '1540534985');
INSERT INTO `t_admin_menu` VALUES ('72', '26', '角色权限信息', 'role', 'rbacLst', '0', null, '1540535125', '1540535125');
INSERT INTO `t_admin_menu` VALUES ('73', '26', '编辑角色权限信息', 'role', 'rbacEdit', '0', null, '1540535199', '1540535199');
INSERT INTO `t_admin_menu` VALUES ('78', '21', '管理员详情', 'admin', 'info', '0', '', '1540545086', '1540545305');
INSERT INTO `t_admin_menu` VALUES ('79', '21', '编辑管理员', 'admin', 'editpwd', '0', '', '1540545280', '1540879909');
INSERT INTO `t_admin_menu` VALUES ('80', '50', '文章详情', 'article', 'info', '0', null, '1540545652', '1540545652');
INSERT INTO `t_admin_menu` VALUES ('81', '50', '编辑文章', 'article', 'edit', '0', null, '1540545682', '1540545682');
INSERT INTO `t_admin_menu` VALUES ('82', '50', '删除文章', 'article', 'del', '0', null, '1540545701', '1540545701');
INSERT INTO `t_admin_menu` VALUES ('83', '47', '数据库数据集', 'data', 'lst', '0', null, '1540545948', '1540545948');
INSERT INTO `t_admin_menu` VALUES ('84', '47', '数据库备份', 'data', 'export', '0', null, '1540545986', '1540545986');
INSERT INTO `t_admin_menu` VALUES ('85', '47', '数据库优化', 'data', 'optimize', '0', null, '1540546015', '1540546015');
INSERT INTO `t_admin_menu` VALUES ('86', '47', '数据库修复', 'data', 'repair', '0', null, '1540546041', '1540546041');
INSERT INTO `t_admin_menu` VALUES ('87', '22', '菜单详情', 'menu', 'info', '0', null, '1540546254', '1540546254');
INSERT INTO `t_admin_menu` VALUES ('88', '22', '修改菜单', 'menu', 'edit', '0', null, '1540546286', '1540546286');
INSERT INTO `t_admin_menu` VALUES ('89', '32', '接口列表', 'apiroute', 'lookup', '1', null, '1540703211', '1540703211');
INSERT INTO `t_admin_menu` VALUES ('90', '89', '接口数据集', 'apiRoute', 'lst', '0', '', '1540703256', '1540703308');
INSERT INTO `t_admin_menu` VALUES ('91', '89', '接口返回码', 'code', 'index', '1', null, '1540703427', '1540703427');
INSERT INTO `t_admin_menu` VALUES ('92', '89', '接口详情表', 'apiroute', 'look_details', '0', '', '1540703704', '1540703959');
INSERT INTO `t_admin_menu` VALUES ('93', '89', '接口详情', 'apiRoute', 'info', '0', '', '1540704016', '1540704026');
INSERT INTO `t_admin_menu` VALUES ('94', '33', '接口分组数据列表', 'group', 'lst', '0', null, '1540708899', '1540708899');
INSERT INTO `t_admin_menu` VALUES ('101', '20', '网站配置', 'admin', 'config', '1', '', '1540782080', '1540782109');
INSERT INTO `t_admin_menu` VALUES ('102', '101', '配置信息', 'config', 'lst', '0', null, '1540782338', '1540782338');
INSERT INTO `t_admin_menu` VALUES ('103', '101', '更新配置信息', 'config', 'edit', '0', null, '1540782364', '1540782364');
INSERT INTO `t_admin_menu` VALUES ('104', '0', '日志管理', '#', '#', '1', 'layui-icon-list', '1540865305', '1540865305');
INSERT INTO `t_admin_menu` VALUES ('105', '104', '日志管理', 'log', 'index', '1', null, '1540865323', '1540865323');
INSERT INTO `t_admin_menu` VALUES ('106', '105', '日志列表', 'log', 'lst', '0', null, '1540865343', '1540865343');
INSERT INTO `t_admin_menu` VALUES ('107', '105', '删除日志', 'log', 'del', '0', null, '1540865364', '1540865364');

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES ('1', '超级管理员', '456546567', '465465466');
INSERT INTO `t_admin_role` VALUES ('6', '前端接入组', '1540288608', '1540288642');
INSERT INTO `t_admin_role` VALUES ('7', '后端接口组', '1540288624', '1540288624');
INSERT INTO `t_admin_role` VALUES ('8', '编辑管理员', '1541912520', '1541912520');

-- ----------------------------
-- Table structure for t_admin_role_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role_rule`;
CREATE TABLE `t_admin_role_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `roleid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `ruleid` varchar(200) NOT NULL COMMENT '权限ID',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

-- ----------------------------
-- Records of t_admin_role_rule
-- ----------------------------
INSERT INTO `t_admin_role_rule` VALUES ('1', '2', '20,21,27,28,41,22,29,30,26,31,37,38,43,60', '1655115', '1540361599');
INSERT INTO `t_admin_role_rule` VALUES ('2', '3', '37,38', '1535868681', '1535868681');
INSERT INTO `t_admin_role_rule` VALUES ('3', '4', '37,38', '1535955276', '1535955276');
INSERT INTO `t_admin_role_rule` VALUES ('4', '6', '89,90,91,92,93', '1540346413', '1540704067');
INSERT INTO `t_admin_role_rule` VALUES ('5', '7', '32,33,37,38,42,43,94,44,56,57,58,66,89,90,91,92,93', '1540361648', '1540708915');
INSERT INTO `t_admin_role_rule` VALUES ('6', '1', '20,21,27,28,41,78,79,22,29,30,87,88,26,31,67,68,70,71,72,73,32,33,37,38,42,43,44,56,57,58,60,66,47,48,49,83,84,85,86,50,51,53,54,80,81,82', '1540533484', '1540546333');
INSERT INTO `t_admin_role_rule` VALUES ('7', '8', '50,51,53,54,80,81,82', '1541918835', '1541918835');

-- ----------------------------
-- Table structure for t_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user`;
CREATE TABLE `t_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(70) NOT NULL COMMENT '密码',
  `salt` varchar(6) DEFAULT NULL COMMENT '盐值',
  `avatar` varchar(250) DEFAULT '' COMMENT '头像',
  `status` int(1) unsigned DEFAULT '1' COMMENT '状态（1为启用，0为禁用）',
  `login_number` int(10) unsigned DEFAULT '0' COMMENT '登录次数',
  `last_login_ip` char(60) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='接口管理表';

-- ----------------------------
-- Records of t_admin_user
-- ----------------------------
INSERT INTO `t_admin_user` VALUES ('1', 'root', 'a215347da0252c8d2e729c227e63b40e', 'uNMf8d', '/public/uploads/20181103/307434cd12beec8ddb65f7b1a057aa73.png', '1', '19', '59.33.230.204', '1542516276', '1537455505', '1542516276');
INSERT INTO `t_admin_user` VALUES ('91', '测试阿拉拉了', '12eccbdd9b32918131341f38907cbbb5', null, null, '1', '0', null, null, '1535177351', '1535177500');
INSERT INTO `t_admin_user` VALUES ('92', '蔡少芬的', '6abba5d8ab1f4f32243e174beb754661', null, null, '1', '0', null, null, '1535191347', '1535191347');
INSERT INTO `t_admin_user` VALUES ('93', '京东将从', 'e391925fac8db7c2563aad0a8028bda9', null, null, '1', '0', null, null, '1535271894', '1535271894');
INSERT INTO `t_admin_user` VALUES ('95', '', 'd41d8cd98f00b204e9800998ecf8427e', null, null, '1', '0', null, null, '1537455496', '1537455496');
INSERT INTO `t_admin_user` VALUES ('97', '啊啊啊', '0fd7c4881ba64b74ed72433fb38cefd7', 'hulOEo', null, '1', '0', null, null, '1540019374', '1540019374');
INSERT INTO `t_admin_user` VALUES ('100', 'test', '42001b4a190d8c4ae6e797ebde73eee7', 'zgTFHJ', null, '1', '0', null, null, '1540020259', '1540020259');
INSERT INTO `t_admin_user` VALUES ('103', 'aaa', 'e5da7700e409dc407e1b66249049e57b', 'RHqJaF', '/public/uploads/20181024/d5018c5c0fd8e74509ff953c404f5474.png', '1', '0', null, null, '1540373366', '1540373366');
INSERT INTO `t_admin_user` VALUES ('105', 'html', '87d6c0a04e3f09d2d0331ec78e9a6643', '8poUEa', '/public/uploads/20181103/7f2dbeccd152c857959b45544e12147d.png', '1', '3', '183.25.131.251', '1541237806', '1540431350', '1541237806');
INSERT INTO `t_admin_user` VALUES ('109', 'route', '7f6645ddb6b1717c4a71c2423791cf04', 'OSP1Hb', '/public/uploads/20181028/c4760a4ac33b0311e76508be7739a304.jpg', '1', '1', '127.0.0.1', '1541237620', '1540708626', '1541237620');
INSERT INTO `t_admin_user` VALUES ('111', 'article', 'a4bb384cb5158856f8b2fffb09690013', 'YNSXUb', '/public/uploads/20181111/e8bf10e284c4fce6909be4307fe9d09a.jpg', '1', '1', '113.81.2.174', '1541919277', '1541913458', '1541919277');

-- ----------------------------
-- Table structure for t_admin_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user_rule`;
CREATE TABLE `t_admin_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `roleid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Records of t_admin_user_rule
-- ----------------------------
INSERT INTO `t_admin_user_rule` VALUES ('1', '102', '2', '32435', '5465465');
INSERT INTO `t_admin_user_rule` VALUES ('2', '104', '2', '1540373419', '1540373419');
INSERT INTO `t_admin_user_rule` VALUES ('3', '105', '6', '1540431350', '1540431350');
INSERT INTO `t_admin_user_rule` VALUES ('4', '106', '1', '1540533676', '1540533676');
INSERT INTO `t_admin_user_rule` VALUES ('5', '107', '1', '1540533846', '1540533846');
INSERT INTO `t_admin_user_rule` VALUES ('6', '108', '3', '1540544994', '1540544994');
INSERT INTO `t_admin_user_rule` VALUES ('7', '109', '7', '1540708626', '1540708626');
INSERT INTO `t_admin_user_rule` VALUES ('8', '110', '7', '1540711556', '1540711556');
INSERT INTO `t_admin_user_rule` VALUES ('9', '1', '1', '46126263', '64164656');
INSERT INTO `t_admin_user_rule` VALUES ('10', '111', '8', '1541913458', '1541913458');

-- ----------------------------
-- Table structure for t_api_group
-- ----------------------------
DROP TABLE IF EXISTS `t_api_group`;
CREATE TABLE `t_api_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `name` varchar(50) NOT NULL COMMENT '组名',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='接口分组表';

-- ----------------------------
-- Records of t_api_group
-- ----------------------------
INSERT INTO `t_api_group` VALUES ('4', '测试接口组', '1540453770', '1540453770');

-- ----------------------------
-- Table structure for t_api_inter_param
-- ----------------------------
DROP TABLE IF EXISTS `t_api_inter_param`;
CREATE TABLE `t_api_inter_param` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `route_id` int(10) unsigned NOT NULL COMMENT '路由id',
  `param_name` varchar(50) NOT NULL COMMENT '参数名称',
  `param_type` varchar(10) NOT NULL COMMENT '参数类型',
  `is_required` int(1) unsigned DEFAULT '1' COMMENT '是否必须（1为是，2为否）',
  `param_comment` text COMMENT '参数解释',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='接口参数表';

-- ----------------------------
-- Records of t_api_inter_param
-- ----------------------------
INSERT INTO `t_api_inter_param` VALUES ('54', '20', 'username', 'string', '1', '用户账号', '1542516424', '1542516424');
INSERT INTO `t_api_inter_param` VALUES ('55', '20', 'password', 'string', '1', '用户密码', '1542516424', '1542516424');

-- ----------------------------
-- Table structure for t_api_inter_route
-- ----------------------------
DROP TABLE IF EXISTS `t_api_inter_route`;
CREATE TABLE `t_api_inter_route` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `group_id` int(10) unsigned NOT NULL COMMENT '组id',
  `route_name` varchar(50) NOT NULL COMMENT '路由名称',
  `route_action` varchar(50) NOT NULL COMMENT '路由路径',
  `return_param` text COMMENT '返回参数',
  `remark` text COMMENT '备注信息',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='接口路由表';

-- ----------------------------
-- Records of t_api_inter_route
-- ----------------------------
INSERT INTO `t_api_inter_route` VALUES ('16', '0', '', '', '', '', '1539010701', '1539010701', null);
INSERT INTO `t_api_inter_route` VALUES ('17', '0', '', '', '', '', '1539010703', '1539010703', null);
INSERT INTO `t_api_inter_route` VALUES ('20', '4', '用户登录', 'login.login', '{ \n       \"code\": 10000, \n       \"msg\": \"登录成功\",\n        \"data\": {\n        \"user_token\": \"213ce8c3ddc93870d8756e1100c183ba9a7c5a41\"\n       } \n}', 'user_token     用户的user_token', '1540456131', '1542516424', '1');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `title` varchar(120) DEFAULT NULL COMMENT '文章标题',
  `cover` varchar(250) DEFAULT NULL COMMENT '文章封面',
  `desc` varchar(250) DEFAULT NULL COMMENT '文章描述',
  `keyword` varchar(250) DEFAULT NULL COMMENT '文章关键字',
  `content` text COMMENT '文章内容',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1为发布，2为不发布）',
  `from` varchar(250) NOT NULL COMMENT '文章来源',
  `author` varchar(250) NOT NULL COMMENT '文章作者',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('9', '说很久以前 写很久以后', '/public/uploads/20181111/d48adea47af659ea79589689a46d7f00.jpg', '说很久以前 写很久以后', '说很久以前 写很久以后', '<p>&nbsp; &nbsp; &nbsp; 很久以前，我以为，只要我对别人好，能忍让，就会换来同样的回报。</p><p><a href=\"http://www.duwenzhang.com/wenzhang/shenghuosuibi/shenghuoganwu/20130604/257333.html\"><img border=\"0\" alt=\"说很久以前 写很久以后\" align=\"right\" src=\"http://www.duwenzhang.com/upimg/130604/1_170738.jpg\" width=\"234\" height=\"175\"></a>　　很久以后，我终于<a href=\"http://www.duwenzhang.com/huati/xiangxin/index1.html\">相信</a>，有些东西，任凭自己怎么<a href=\"http://www.duwenzhang.com/huati/nuli/index1.html\">努力</a>，依旧抓不住，所以我学着不再期待。</p><p>　　很久以前，我的脑子里装满了安徒生笔下的王子公主灰姑娘骑士，偷偷的想着谁会是我的谁谁谁。</p><p>　　很久以后，我依旧相信着安徒生写的那些童话<a href=\"http://www.duwenzhang.com/\">故事</a>里<a href=\"http://www.duwenzhang.com/huati/meihao/index1.html\">美好</a>的结局，却再也不期待我的谁谁谁会在几时出现。</p><p>　　于是，我知道，有些期待，在淡淡的时光隧道，被抹杀殆尽。完全，再也不见。</p><p>　　很久以前，听《十年》，想着陈奕迅怎么那么倒霉，不是<a href=\"http://www.duwenzhang.com/huati/shilian/index1.html\">失恋</a>就是被抛弃。</p><p>　　很久以后，听《十年》，看到的不再是陈奕迅的<a href=\"http://www.duwenzhang.com/wenzhang/xinqingriji/\">心情</a>，而是自己的心情。</p><p>　　于是，我知道，有些事情，必须要自己经历过后才能体会到那种辛酸。</p><p>　　很久以前，久到我还不认识某某某们的时候，我会把那些跟我一样不安分的ABCD当成挚友，自以为拍拍手掌就真的能做到“有福同享有难同当”。</p><p>　　很久以后，久到我看着她们一个个地脱离我的世界，淡出我的舞台，才恍然间明白，对于<a href=\"http://www.duwenzhang.com/huati/shijian/index1.html\">时间</a>和距离这两个概念，作为人，充满了<a href=\"http://www.duwenzhang.com/huati/wunai/index1.html\">无奈</a>。</p><p>　　于是，我知道，永远不能相信所谓的一成不变。因为世界上根本就没有。</p><p>　　很久以前，我看着郭小四的《梦里花落知多少》，为陆叙的死<a href=\"http://www.duwenzhang.com/huati/nanguo/index1.html\">难过</a>落泪；看《<a href=\"http://www.duwenzhang.com/huati/fendou/index1.html\">奋斗</a>》，为米莱的偏执感到难堪。</p><p>　　很久以后，再看一次，心里难过的却是姚姗姗打林岚时顾小北的无动于衷，甚至护在姚姗姗前面；为米莱的偏执不再感到难堪，而是心疼。</p><p>　　于是，我知道，一个前前后后的差距，也许久不到一个人的黑发变白，却是一个真正<a href=\"http://www.duwenzhang.com/wenzhang/shenghuosuibi/chengzhang/\">成长</a>的过程。心，在成长，在变化。</p><p>　　很久以前，听一个<a href=\"http://www.duwenzhang.com/huati/pengyou/index1.html\">朋友</a>说：我这辈子非他不嫁了。</p><p>　　很久以后，听这个朋友说：绕了一大圈，发现最适合自己的却另有其人。</p><p>　　于是，我知道，在年少时，我们都做<a href=\"http://www.duwenzhang.com/huati/cuoguo/index1.html\">错过</a>什么，终于有这么一天，我也可以放下心中的执念，重新选择。</p><p>　　很久以前，发生了太多，就像冬天的雪，经过彻骨的寒冷，经过刺心的疼痛，什么也不再。甚至连伤疤，都只是一种奢侈。</p><p>　　很久以后，我发现我不再拼命寻找那些所谓的过去了，或者是真的看到了自己的未来了。或者是真的不想在参与那些刻苦铭心。</p><p>　　于是，我发现，那些过了太久的事情，慢慢的，就被沉淀了。于是我告诉自己，我还是太年轻，还没遇到能让自己坚持一辈子的东西。</p><p>　　于是，我说，让我自己，慢慢的体会这个世界的黑暗，人心的叵测。</p><p>　　于是，我想，只要世界还在，一切就都有机会存在。</p><p>　　于是，我祈祷，让我一直在需要我的人身边，永远不<a href=\"http://www.duwenzhang.com/huati/likai/index1.html\">离开</a>。</p><p>　　很久以前，我会毫不掩饰地大笑，不会去想猜测别人的想法，不会再这里发表这些感叹。</p><p>　　很久以后，我的字里行间，充满了别人读不懂的心事。</p><p>　　很久以后，我终于发现，自己不是停滞不前，只是那些成长，突然就让自己冷了心。</p><p>　　我不想挣扎在那些从前和以后中。我不想沉浸在得到和<a href=\"http://www.duwenzhang.com/huati/shiqu/index1.html\">失去</a>中。</p><p>　　所以，我告诉自己，即使世界曾经荒芜如沙漠，即使那些从前曾经让我湿了眼眶红了眼圈，即使岁月的雕刻让我的心棱角不再分明不再清澈，即使年华老去，也要走出过往。</p><p>　　纪念某某<a href=\"http://www.duwenzhang.com/huati/dengdai/index1.html\">等待</a>的故事。</p><p>　　纪念一切可纪念的。</p><p>　　从前的，以后的。</p>', '1', '1', '百度搜索', '佚名', '1541923278', '1541923278');

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `key` varchar(120) DEFAULT NULL COMMENT '配置名称',
  `value` text COMMENT '配置值',
  `comment` varchar(250) DEFAULT NULL COMMENT '配置描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='网站配置表';

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('1', 'website_title', '媚子博客', '网标题');
INSERT INTO `t_config` VALUES ('2', 'website_describe', '媚子技术博客', '网站描述');
INSERT INTO `t_config` VALUES ('3', 'website_keywords', '媚子，博客', '网站关键字');
INSERT INTO `t_config` VALUES ('4', 'website_record', '陇ICP备15002349号-1', '网站备案号');
INSERT INTO `t_config` VALUES ('5', 'copyright_information', 'Copyright © 2018 uMini_admin后台管理系统 All rights reserved.', '版权信息');
INSERT INTO `t_config` VALUES ('6', 'website_status', '1', '网站状态（1为开，0为关）');
INSERT INTO `t_config` VALUES ('7', 'website_limit_ip', '', '禁止网站访问的ip');

-- ----------------------------
-- Table structure for t_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_index_banner`;
CREATE TABLE `t_index_banner` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_index_banner
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `admin_id` int(5) unsigned NOT NULL COMMENT '用户ID',
  `admin_name` varchar(50) NOT NULL COMMENT '用户名称',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1成功 2失败',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', '1', 'huang', '用户【huang】登录成功', '127.0.0.1', '1', '1540807159');
INSERT INTO `t_log` VALUES ('2', '1', 'huang', '用户【huang】登录成功', '127.0.0.1', '1', '1540807159');
INSERT INTO `t_log` VALUES ('3', '1', 'huang', '用户【huang】登录成功', '127.0.0.1', '1', '1540807159');
INSERT INTO `t_log` VALUES ('4', '1', 'huang', '用户【huang】登录成功', '127.0.0.1', '1', '1540807159');
INSERT INTO `t_log` VALUES ('5', '1', 'huang', '用户【huang】登录成功', '127.0.0.1', '1', '1540807159');
INSERT INTO `t_log` VALUES ('9', '1', 'huang', '用户【huang】登录成功', '183.25.128.145', '1', '1540900798');
INSERT INTO `t_log` VALUES ('10', '1', 'huang', '用户【huang】登录失败：密码错误', '183.25.131.251', '2', '1541216363');
INSERT INTO `t_log` VALUES ('11', '1', 'huang', '用户【huang】登录失败：密码错误', '183.25.131.251', '2', '1541216375');
INSERT INTO `t_log` VALUES ('12', '105', 'html', '用户【html】登录成功', '183.25.131.251', '1', '1541216392');
INSERT INTO `t_log` VALUES ('13', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541217252');
INSERT INTO `t_log` VALUES ('14', '105', 'html', '用户【html】登录失败：密码错误', '127.0.0.1', '2', '1541217271');
INSERT INTO `t_log` VALUES ('15', '105', 'html', '用户【html】登录失败：密码错误', '127.0.0.1', '2', '1541217285');
INSERT INTO `t_log` VALUES ('16', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541217307');
INSERT INTO `t_log` VALUES ('17', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541217330');
INSERT INTO `t_log` VALUES ('18', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541217424');
INSERT INTO `t_log` VALUES ('19', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541217448');
INSERT INTO `t_log` VALUES ('20', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541217556');
INSERT INTO `t_log` VALUES ('21', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541218408');
INSERT INTO `t_log` VALUES ('22', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541231879');
INSERT INTO `t_log` VALUES ('23', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541231898');
INSERT INTO `t_log` VALUES ('24', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541231912');
INSERT INTO `t_log` VALUES ('25', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541232005');
INSERT INTO `t_log` VALUES ('26', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541232094');
INSERT INTO `t_log` VALUES ('27', '1', 'root', '用户【root】登录失败：密码错误', '127.0.0.1', '2', '1541232124');
INSERT INTO `t_log` VALUES ('28', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541232236');
INSERT INTO `t_log` VALUES ('29', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541232251');
INSERT INTO `t_log` VALUES ('30', '105', 'html', '用户【html】登录成功', '127.0.0.1', '1', '1541233330');
INSERT INTO `t_log` VALUES ('31', '1', 'root', '用户【root】登录成功', '127.0.0.1', '1', '1541237588');
INSERT INTO `t_log` VALUES ('32', '109', 'route', '用户【route】登录成功', '127.0.0.1', '1', '1541237620');
INSERT INTO `t_log` VALUES ('33', '1', 'root', '用户【root】登录成功', '183.25.131.251', '1', '1541237719');
INSERT INTO `t_log` VALUES ('34', '105', 'html', '用户【html】登录成功', '183.25.131.251', '1', '1541237806');
INSERT INTO `t_log` VALUES ('35', '1', 'root', '用户【root】登录成功', '113.81.2.218', '1', '1541909862');
INSERT INTO `t_log` VALUES ('36', '111', 'article', '用户【article】登录成功', '113.81.2.174', '1', '1541919277');
INSERT INTO `t_log` VALUES ('37', '1', 'root', '用户【root】登录成功', '183.25.130.114', '1', '1541986726');
INSERT INTO `t_log` VALUES ('38', '1', 'root', '用户【root】登录成功', '113.81.2.174', '1', '1542032347');
INSERT INTO `t_log` VALUES ('39', '1', 'root', '用户【root】登录成功', '183.25.131.85', '1', '1542442027');
INSERT INTO `t_log` VALUES ('40', '1', 'root', '用户【root】登录成功', '59.33.230.204', '1', '1542516276');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自动增长id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `user_token` varchar(120) NOT NULL COMMENT '用户user_token',
  `salt` varchar(6) NOT NULL COMMENT '盐值',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '修改时间',
  `avatar` varchar(250) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_token` (`user_token`) COMMENT 'user_token唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'huang', '31856cd7d895e886578fe7e143ac4ad2', '213ce8c3ddc93870d8756e1100c183ba9a7c5a41', 'GgQBSm', '0', '0', null);
