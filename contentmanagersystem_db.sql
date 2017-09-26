

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cc_resource`
-- ----------------------------
DROP TABLE IF EXISTS `cc_resource`;
CREATE TABLE `cc_resource` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_parentId` int(11) DEFAULT NULL,
  `res_name` varchar(50) NOT NULL,
  `res_status` int(11) DEFAULT NULL,
  `res_model_code` varchar(30) DEFAULT NULL COMMENT '模块标识',
  `res_link_address` varchar(200) DEFAULT NULL,
  `res_image` varchar(100) DEFAULT NULL,
  `res_level` int(11) DEFAULT NULL,
  `res_type` int(11) DEFAULT NULL,
  `res_display_order` int(11) DEFAULT NULL,
  `res_remark` varchar(200) DEFAULT NULL,
  `creator` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(40) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of cc_resource
-- ----------------------------
INSERT INTO `cc_resource` VALUES ('2', '5', '用户管理', '0', '7JMoS6yG', '/user/user_list.do', 'larry-10103', '3', '0', '11', '', 'admin', '2016-11-25 16:57:22', 'admin', '2017-08-15 11:27:40');
INSERT INTO `cc_resource` VALUES ('3', '5', '角色管理', '0', 'SPAn6H46', '/role/role_list.do', 'larry-jiaoseguanli1', '3', '0', '3', '配置系统角色信息', 'admin', '2016-11-25 16:57:25', null, null);
INSERT INTO `cc_resource` VALUES ('4', '5', '菜单管理', '0', '0rbT8g7m', '/res/res_list.do', 'larry-caidanguanli', '3', '0', '4', '', 'admin', '2016-11-25 16:57:31', 'admin', '2017-08-15 11:04:41');
INSERT INTO `cc_resource` VALUES ('5', '7', '系统设置', '0', '0rbT8g9m', null, 'larry-xitongshezhi1', '2', '0', '5', '配置系统菜单信息', 'admin', '2017-07-28 09:31:43', null, null);
INSERT INTO `cc_resource` VALUES ('7', null, '系统管理', '0', '0rbT8g8m', null, 'larry-xitongshezhi1', '1', '0', '6', '配置系统菜单信息', 'admin', '2017-07-28 13:24:57', null, null);
INSERT INTO `cc_resource` VALUES ('8', null, '微信公众', '0', '0rbT8g6m', null, 'larry-weixingongzhongpingtai', '1', '0', '7', '配置系统菜单信息', 'admin', '2017-07-28 13:26:50', null, null);
INSERT INTO `cc_resource` VALUES ('9', '7', '消息中心', '0', '0rbT8g2m', '', 'larry-gerenxinxi5', '2', '0', '8', '配置系统菜单信息', 'admin', '2017-07-28 14:23:35', 'admin', '2017-08-28 19:50:48');
INSERT INTO `cc_resource` VALUES ('10', '9', '公告管理', '0', '0rbT8t2m', '/announcement/announcement_list.do', 'larry-gonggaoguanli', '3', '0', '9', '配置系统菜单信息', 'admin', '2017-07-28 17:07:55', 'admin', '2017-09-04 11:07:18');
INSERT INTO `cc_resource` VALUES ('11', '8', '测试菜单', '0', '0rbT8t2D', '/res.do', 'larry-gerenxinxi1', '2', '0', '9', '', 'admin', '2017-08-14 15:30:15', 'admin', '2017-08-28 19:49:56');
INSERT INTO `cc_resource` VALUES ('12', '2', '用户新增', '0', '0rbT8t2P', '/user/user_add.do', 'larry-gerenxinxi1', '3', '1', '3', '', 'admin', '2017-08-14 16:47:12', 'admin', '2017-08-16 17:56:18');
INSERT INTO `cc_resource` VALUES ('13', '11', '测试菜单', '0', 'OglvPpeA', '/test.do', 'tuichu1', '3', '0', '2', '备注', 'admin', '2017-08-15 09:59:53', 'admin', '2017-08-16 16:10:48');
INSERT INTO `cc_resource` VALUES ('14', '11', '测试菜单2', '0', 'WEpcNYu3', '/test.do', 'larry-neirongguanli', '3', '0', null, '', 'admin', '2017-08-15 14:48:04', 'admin', '2017-08-22 14:37:47');
INSERT INTO `cc_resource` VALUES ('15', '2', '用户导出', '0', '0jOfTHGx', '/user/excel_users_export.do', 'larry-10103', '3', '1', null, '', 'admin', '2017-08-16 23:29:50', null, null);
INSERT INTO `cc_resource` VALUES ('16', '2', '用户修改', '0', 'fSv1B2kZ', '/user/user_update.do', 'larry-bianji2', '3', '1', null, '', 'admin', '2017-08-16 23:30:21', 'admin', '2017-08-22 14:37:55');
INSERT INTO `cc_resource` VALUES ('17', '2', '用户失效', '0', 'uBg9TdEr', '/user/ajax_user_fail.do', 'larry-10103', '3', '1', null, '', 'admin', '2017-08-16 23:30:46', null, null);
INSERT INTO `cc_resource` VALUES ('18', '2', '批量失效', '0', 'lBE3hz5c', '/user/ajax_user_batch_fail.do', 'caidanguanli', '3', '1', null, '', 'admin', '2017-08-16 23:31:09', null, null);
INSERT INTO `cc_resource` VALUES ('19', '2', '分配角色', '0', 'mScICO9G', '/user/user_grant.do', 'jiaoseguanli1', '3', '1', null, '', 'admin', '2017-08-16 23:31:37', null, null);
INSERT INTO `cc_resource` VALUES ('20', '3', '角色导出', '0', 'oCNcsKmk', '/role/excel_role_export.do', 'jiaoseguanli1', '3', '1', null, '', 'admin', '2017-08-16 23:32:29', null, null);
INSERT INTO `cc_resource` VALUES ('21', '3', '角色新增', '0', 'nxRVZA5i', '/role/role_add.do', 'caidanguanli', '3', '1', null, '', 'admin', '2017-08-16 23:33:01', null, null);
INSERT INTO `cc_resource` VALUES ('22', '3', '角色修改', '0', 'moHbdnjz', '/role/role_update.do', 'liuyan', '3', '1', null, '', 'admin', '2017-08-16 23:33:26', null, null);
INSERT INTO `cc_resource` VALUES ('23', '3', '角色失效', '0', 'tkwJk34z', '/role/ajax_role_fail.do', 'caidanguanli', '3', '1', null, '', 'admin', '2017-08-16 23:33:46', null, null);
INSERT INTO `cc_resource` VALUES ('24', '3', '批量失效', '0', 'qsieHTy4', '/role/ajax_role_batch_fail.do', 'liuyan', '3', '1', null, '', 'admin', '2017-08-16 23:34:04', 'admin', '2017-08-22 17:31:48');
INSERT INTO `cc_resource` VALUES ('25', '3', '角色赋权', '0', 'bSG7LAmU', '/role/role_grant.do', 'caidanguanli', '3', '1', null, '', 'admin', '2017-08-16 23:34:28', null, null);
INSERT INTO `cc_resource` VALUES ('26', '4', '菜单新增', '0', 'Mhtly5er', '/res/res_edit.do', 'larry-11', '3', '1', null, '', 'admin', '2017-08-22 13:41:27', null, null);
INSERT INTO `cc_resource` VALUES ('27', '4', '菜单编辑', '0', 'KxCQVzRq', '/res/res_update.do', 'larry-bianji5', '3', '1', null, '', 'admin', '2017-08-22 13:42:30', null, null);
INSERT INTO `cc_resource` VALUES ('28', '4', '菜单失效', '0', 'DK3uPfe7', '/res/ajax_res_fail.do', 'larry-shanchu8', '3', '1', null, '', 'admin', '2017-08-22 13:45:01', null, null);
INSERT INTO `cc_resource` VALUES ('29', '4', '菜单导出', '0', 'wPUNDGgZ', '/res/excel_res_export.do', 'larry-wangzhanneirong', '3', '1', null, '', 'admin', '2017-08-22 13:46:43', null, null);
INSERT INTO `cc_resource` VALUES ('30', '11', '测试菜单3', '0', '3T7k24R4', '/test.do', 'larry-nav', '3', '0', null, '', 'user_system', '2017-08-22 14:43:00', null, null);
INSERT INTO `cc_resource` VALUES ('51', '7', '日志中心', '0', 'gYFTwbQb', '', 'larry-gongzuoneirong', '2', '0', null, '', 'admin', '2017-08-30 17:58:16', 'admin', '2017-08-30 18:01:42');
INSERT INTO `cc_resource` VALUES ('52', '51', '日志管理', '0', 'oL6OcNAt', '/syslog/sys_log_list.do', 'larry-pingjiaguanli1', '3', '0', null, '', 'admin', '2017-08-30 18:03:00', 'admin', '2017-09-08 10:55:16');
INSERT INTO `cc_resource` VALUES ('53', '9', '消息管理', '0', 'H70iVoxC', '/test.do', 'larry-liuyan', '3', '0', null, '', 'admin', '2017-08-31 12:34:52', null, null);
INSERT INTO `cc_resource` VALUES ('54', '10', '新增公告', '0', '4JQVLmOd', '/announcement/announcement_add.do', 'larry-iconfontadd', '3', '1', null, '', 'admin', '2017-09-04 17:08:03', null, null);
INSERT INTO `cc_resource` VALUES ('55', '10', '删除公告', '0', 'eTDnjGAM', '/announcement/ajax_del_announcement.do', 'larry-shanchu9', '3', '1', null, '', 'admin', '2017-09-04 17:08:27', null, null);

-- ----------------------------
-- Table structure for cc_role
-- ----------------------------
DROP TABLE IF EXISTS `cc_role`;
CREATE TABLE `cc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_status` int(11) NOT NULL,
  `role_remark` varchar(255) DEFAULT NULL,
  `creator` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(40) DEFAULT NULL,
  `modifier_time` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cc_role
-- ----------------------------
INSERT INTO `cc_role` VALUES ('52', '只读角色', '0', '', 'admin', '2017-08-16 16:05:48', 'admin', '2017-08-16 16:22:57');
INSERT INTO `cc_role` VALUES ('55', '用户角色', '0', '', 'admin', '2017-08-22 13:50:41', 'user_system', '2017-08-22 16:12:41');

-- ----------------------------
-- Table structure for cc_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `cc_role_resource`;
CREATE TABLE `cc_role_resource` (
  `role_res_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `creator` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(40) DEFAULT NULL,
  `modifier_time` datetime DEFAULT NULL,
  PRIMARY KEY (`role_res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8 COMMENT='角色与资源关系表';

-- ----------------------------
-- Records of cc_role_resource
-- ----------------------------
INSERT INTO `cc_role_resource` VALUES ('552', '55', '7', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('553', '55', '5', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('554', '55', '2', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('555', '55', '12', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('556', '55', '15', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('557', '55', '16', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('558', '55', '3', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('559', '55', '20', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('560', '55', '21', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('561', '55', '22', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('562', '55', '4', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('563', '55', '26', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('564', '55', '9', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('565', '55', '10', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('566', '55', '8', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('567', '55', '11', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('568', '55', '13', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('569', '55', '14', 'admin', '2017-08-22 16:13:46', null, null);
INSERT INTO `cc_role_resource` VALUES ('570', '52', '7', 'admin', '2017-08-22 16:13:59', null, null);
INSERT INTO `cc_role_resource` VALUES ('571', '52', '5', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('572', '52', '2', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('573', '52', '3', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('574', '52', '4', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('575', '52', '9', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('576', '52', '10', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('577', '52', '8', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('578', '52', '11', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('579', '52', '13', 'admin', '2017-08-22 16:14:00', null, null);
INSERT INTO `cc_role_resource` VALUES ('580', '52', '14', 'admin', '2017-08-22 16:14:00', null, null);

-- ----------------------------
-- Table structure for cc_user
-- ----------------------------
DROP TABLE IF EXISTS `cc_user`;
CREATE TABLE `cc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login_name` varchar(50) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_status` bigint(20) NOT NULL,
  `creator` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cc_user
-- ----------------------------
INSERT INTO `cc_user` VALUES ('142', 'user_readonly', '只读用户', '123456', '0', 'admin', '2017-08-16 16:04:08', 'user_readonly', '2017-08-22 14:26:57');
INSERT INTO `cc_user` VALUES ('155', 'user_system', '系统管理员', '123456', '0', 'admin', '2017-08-22 14:30:53', 'user_system', '2017-08-22 16:12:36');
INSERT INTO `cc_user` VALUES ('8', 'admin', '超级管理员', '123456', '0', 'admin', '2017-08-22 14:30:53', 'admin', '2017-08-22 16:12:36');


-- ----------------------------
-- Table structure for cc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `cc_user_role`;
CREATE TABLE `cc_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `creator` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(40) DEFAULT NULL,
  `modifier_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8 COMMENT='用户和角色关系表';

-- ----------------------------
-- Records of cc_user_role
-- ----------------------------
INSERT INTO `cc_user_role` VALUES ('505', '142', '52', 'admin', '2017-08-22 14:39:28', null, null);
INSERT INTO `cc_user_role` VALUES ('506', '155', '55', 'admin', '2017-08-22 14:41:43', null, null);


-- ----------------------------
-- Table structure for `cc_announcement_info`
-- ----------------------------
DROP TABLE IF EXISTS `cc_announcement_info`;
CREATE TABLE `cc_announcement_info` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_type` int(11) DEFAULT NULL COMMENT '公告类型',
  `announcement_title` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `announcement_content` varchar(500) DEFAULT NULL COMMENT '公告内容',
  `announcement_author` varchar(50) DEFAULT NULL COMMENT '发布者',
  `announcement_time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `cc_announcement_info_user`
-- ----------------------------
DROP TABLE IF EXISTS `cc_announcement_info_user`;
CREATE TABLE `cc_announcement_info_user` (
  `announcement_info_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_id` int(11) DEFAULT NULL COMMENT '公告Id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `announcement_flag` int(11) DEFAULT NULL COMMENT '是否已读',
  PRIMARY KEY (`announcement_info_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `cc_sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `cc_sys_log`;
CREATE TABLE `cc_sys_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(20) DEFAULT NULL COMMENT '日志标题',
  `log_type` varchar(10) DEFAULT NULL COMMENT '日志类型 info error',
  `log_url` varchar(50) DEFAULT NULL COMMENT '日志请求url',
  `log_method` varchar(10) DEFAULT NULL COMMENT '请求方式 get post',
  `log_params` varchar(300) DEFAULT NULL COMMENT '请求参数',
  `log_exception` varchar(200) DEFAULT NULL COMMENT '请求异常',
  `log_user_name` varchar(50) DEFAULT NULL COMMENT '请求用户Id',
  `log_ip` varchar(20) DEFAULT NULL COMMENT '请求IP',
  `log_ip_address` varchar(40) DEFAULT NULL COMMENT '请求ip所在地',
  `log_start_time` datetime DEFAULT NULL COMMENT '请求开始时间',
  `log_elapsed_time` bigint(20) DEFAULT NULL COMMENT '请求耗时',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for cc_data_cleaning
-- ----------------------------
DROP TABLE IF EXISTS `cc_data_cleaning`;
CREATE TABLE `cc_data_cleaning` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_type` int(11) DEFAULT NULL COMMENT '数据类型',
  `data_time` varchar(50) DEFAULT NULL COMMENT '数据时间',
  `data_count` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`data_id`),
  UNIQUE KEY `unique_data_type_time` (`data_type`,`data_time`) COMMENT '数据类型、日期唯一建索引'
) ENGINE=InnoDB AUTO_INCREMENT=576 DEFAULT CHARSET=utf8;
