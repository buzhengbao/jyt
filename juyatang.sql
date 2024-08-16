/*
 Navicat MySQL Data Transfer

 Source Server         : New Program
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : juyatang

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 14/06/2024 23:34:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `activity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '活动名',
  `activity_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '活动图片路径',
  `activity_begintime` date NOT NULL COMMENT '活动开始时间',
  `activity_endtime` date NOT NULL COMMENT '活动结束时间',
  `activity_addtime` datetime(0) NOT NULL COMMENT '活动添加时间',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (5, '宝宝黄金专场', 'https://img.picui.cn/free/2024/06/14/666c03d727357.jpg', '2024-06-01', '2025-07-01', '2024-06-14 16:55:58');

-- ----------------------------
-- Table structure for activity_list
-- ----------------------------
DROP TABLE IF EXISTS `activity_list`;
CREATE TABLE `activity_list`  (
  `activity_list_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动列表ID',
  `activity_id` bigint(20) NULL DEFAULT NULL COMMENT '活动ID',
  `commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`activity_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `commodity_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `commodity_num` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品款号',
  `commodity_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `commodity_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '商品封面地址',
  `commodity_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `commodity_fineness` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品成色',
  `commodity_weight` decimal(10, 2) NOT NULL COMMENT '商品重量',
  `commodity_inventory` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品库存',
  `commodity_tag_id` bigint(20) NULL DEFAULT NULL COMMENT '商品标签ID',
  `commodity_wage` decimal(10, 2) NOT NULL COMMENT '商品工费',
  `commodity_addtime` datetime(0) NOT NULL COMMENT '商品添加时间',
  `commodity_type_id` int(11) NULL DEFAULT NULL COMMENT '商品类Id',
  `commodity_style_id` int(11) NULL DEFAULT NULL COMMENT '商品款式Id',
  `commodity_activity_id` int(11) NULL DEFAULT NULL COMMENT '商品活动Id',
  PRIMARY KEY (`commodity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (34, 'AB3DSC00424', '宝宝手绳丰衣足食手串', 'https://img.picui.cn/free/2024/06/14/666c074b169ea.jpg', 843.38, '足金', 1.47, '19', NULL, 12.50, '2024-06-14 17:05:25', 6, 1, 5);

-- ----------------------------
-- Table structure for commodity_img
-- ----------------------------
DROP TABLE IF EXISTS `commodity_img`;
CREATE TABLE `commodity_img`  (
  `commodity_img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `commodity_img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品Id',
  PRIMARY KEY (`commodity_img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_img
-- ----------------------------
INSERT INTO `commodity_img` VALUES (11, 'https://img.picui.cn/free/2024/06/14/666c074b169ea.jpg', 34);
INSERT INTO `commodity_img` VALUES (12, 'https://img.picui.cn/free/2024/06/14/666c082922377.jpg', 34);
INSERT INTO `commodity_img` VALUES (13, 'https://img.picui.cn/free/2024/06/14/666c0839cacf5.jpg', 34);

-- ----------------------------
-- Table structure for commodity_img_list
-- ----------------------------
DROP TABLE IF EXISTS `commodity_img_list`;
CREATE TABLE `commodity_img_list`  (
  `commodity_img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  `commodity_img_url_id` bigint(20) NULL DEFAULT NULL COMMENT '商品图片ID',
  PRIMARY KEY (`commodity_img_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commodity_style
-- ----------------------------
DROP TABLE IF EXISTS `commodity_style`;
CREATE TABLE `commodity_style`  (
  `commodity_style_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品款式ID',
  `commodity_style_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品款式名称',
  `commodity_style_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品款式照片路径',
  `commodity_style_addtime` datetime(0) NOT NULL COMMENT '商品款式添加时间',
  PRIMARY KEY (`commodity_style_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '商品款式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_style
-- ----------------------------
INSERT INTO `commodity_style` VALUES (1, '手串', 'https://img.picui.cn/free/2024/06/14/666bb1858f792.png', '2024-05-21 20:20:12');
INSERT INTO `commodity_style` VALUES (2, '耳饰', 'https://img.picui.cn/free/2024/06/14/666bb198cc2c8.png', '2024-05-21 20:20:42');
INSERT INTO `commodity_style` VALUES (3, '摆件', 'https://img.picui.cn/free/2024/06/14/666bb1a59c262.png', '2024-05-21 20:21:11');
INSERT INTO `commodity_style` VALUES (4, '金条', 'https://img.picui.cn/free/2024/06/14/666bb1adde0e0.png', '2024-05-21 20:21:53');
INSERT INTO `commodity_style` VALUES (5, '项链', 'https://img.picui.cn/free/2024/06/14/666bb1b5edebf.png', '2024-05-21 20:22:00');
INSERT INTO `commodity_style` VALUES (6, '贵金属礼品', 'https://img.picui.cn/free/2024/06/14/666bb1c1a82b2.png', '2024-05-21 20:22:25');
INSERT INTO `commodity_style` VALUES (7, '吊坠', 'https://img.picui.cn/free/2024/06/14/666bb1cba956f.png', '2024-05-21 20:23:15');
INSERT INTO `commodity_style` VALUES (8, '戒指', 'https://img.picui.cn/free/2024/06/14/666bb1d64dc30.png', '2024-05-21 20:23:42');
INSERT INTO `commodity_style` VALUES (9, '套链', 'https://img.picui.cn/free/2024/06/14/666bb1de193ca.png', '2024-05-21 20:24:09');
INSERT INTO `commodity_style` VALUES (10, '手镯', 'https://img.picui.cn/free/2024/06/14/666bb1e9df12e.png', '2024-05-21 20:24:42');
INSERT INTO `commodity_style` VALUES (11, '套装', 'https://img.picui.cn/free/2024/06/14/666bb1f7d9d9e.png', '2024-05-21 20:25:05');

-- ----------------------------
-- Table structure for commodity_style_list
-- ----------------------------
DROP TABLE IF EXISTS `commodity_style_list`;
CREATE TABLE `commodity_style_list`  (
  `commodity_style_list_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品款式列表ID',
  `commodity_style_id` bigint(20) NULL DEFAULT NULL COMMENT '商品款式ID',
  `commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`commodity_style_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commodity_tag
-- ----------------------------
DROP TABLE IF EXISTS `commodity_tag`;
CREATE TABLE `commodity_tag`  (
  `commodity_tag_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品标签ID',
  `commodity_tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '商品标签名称',
  `commodity_tag_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '商品标签颜色',
  PRIMARY KEY (`commodity_tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_tag
-- ----------------------------
INSERT INTO `commodity_tag` VALUES (1, '3D硬金', 'danger');
INSERT INTO `commodity_tag` VALUES (2, '预定', 'primary');
INSERT INTO `commodity_tag` VALUES (3, '水贝预展', 'success');
INSERT INTO `commodity_tag` VALUES (4, '意大隆', 'info');
INSERT INTO `commodity_tag` VALUES (5, '古法金', 'danger');
INSERT INTO `commodity_tag` VALUES (6, '金条', 'warning');
INSERT INTO `commodity_tag` VALUES (12, '成品配饰', 'danger');

-- ----------------------------
-- Table structure for commodity_tag_list
-- ----------------------------
DROP TABLE IF EXISTS `commodity_tag_list`;
CREATE TABLE `commodity_tag_list`  (
  `commodity_tag_list_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品标签列表ID',
  `commodity_tag_id` bigint(20) NULL DEFAULT NULL COMMENT '商品标签ID',
  `commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`commodity_tag_list_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_tag_list
-- ----------------------------
INSERT INTO `commodity_tag_list` VALUES (8, 12, 34);
INSERT INTO `commodity_tag_list` VALUES (9, 3, 34);

-- ----------------------------
-- Table structure for commodity_type
-- ----------------------------
DROP TABLE IF EXISTS `commodity_type`;
CREATE TABLE `commodity_type`  (
  `commodity_type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品类ID',
  `commodity_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品类名',
  `commodity_type_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品类图片路径',
  `commodity_type_addtime` datetime(0) NOT NULL COMMENT '商品类添加时间',
  PRIMARY KEY (`commodity_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '商品类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_type
-- ----------------------------
INSERT INTO `commodity_type` VALUES (6, '足金999', 'https://img.picui.cn/free/2024/06/14/666c16f1c8ce2.jpg', '2024-06-14 18:10:24');
INSERT INTO `commodity_type` VALUES (7, '足金999.9', 'https://img.picui.cn/free/2024/06/14/666c17055766a.jpg', '2024-06-14 18:10:45');
INSERT INTO `commodity_type` VALUES (8, '足金999.99', 'https://img.picui.cn/free/2024/06/14/666c17163609b.jpg', '2024-06-14 18:11:00');
INSERT INTO `commodity_type` VALUES (9, '精品黄金', 'https://img.picui.cn/free/2024/06/14/666c1732ccf60.jpg', '2024-06-14 18:11:17');
INSERT INTO `commodity_type` VALUES (10, '5G黄金', 'https://img.picui.cn/free/2024/06/14/666c1743dc108.jpg', '2024-06-14 18:11:46');
INSERT INTO `commodity_type` VALUES (11, '古法金', 'https://img.picui.cn/free/2024/06/14/666c175219ae2.jpg', '2024-06-14 18:12:00');

-- ----------------------------
-- Table structure for commodity_type_list
-- ----------------------------
DROP TABLE IF EXISTS `commodity_type_list`;
CREATE TABLE `commodity_type_list`  (
  `commodity_type_list_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品类列表ID',
  `commodity_type_id` bigint(20) NULL DEFAULT NULL COMMENT '商品类ID',
  `commodity_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`commodity_type_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '商品类列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '微信端执行' COMMENT '操作人',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作人IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 707 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (219, '获取日志', '2024-06-13 21:30:29', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (220, '获取订单', '2024-06-13 21:30:30', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (221, '获取日志', '2024-06-13 21:30:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (222, '查询订单', '2024-06-13 21:30:35', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (223, '获取标签数量', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (224, '获取用户数量', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (225, '获取商品款式数量', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (226, '获取商品类型数量', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (227, '获取活动数量', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (228, '获取商品数量', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (229, '获取全部标签', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (230, '获取全部类型', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (231, '获取全部款式', '2024-06-14 09:52:31', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (232, '获取商品款式数量', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (233, '获取活动数量', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (234, '获取商品数量', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (235, '获取用户数量', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (236, '获取标签数量', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (237, '获取商品类型数量', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (238, '获取全部标签', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (239, '获取全部类型', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (240, '获取全部款式', '2024-06-14 09:52:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (241, '获取商品数量', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (242, '获取活动数量', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (243, '获取商品类型数量', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (244, '获取用户数量', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (245, '获取商品款式数量', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (246, '获取标签数量', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (247, '获取全部类型', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (248, '获取全部款式', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (249, '获取全部标签', '2024-06-14 09:57:06', '张三', '127.0.0.1');
INSERT INTO `log` VALUES (250, '登录后台', '2024-06-14 09:57:41', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (251, '获取商品数量', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (252, '获取活动数量', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (253, '获取商品款式数量', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (254, '获取用户数量', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (255, '获取标签数量', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (256, '获取商品类型数量', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (257, '获取全部类型', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (258, '获取全部标签', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (259, '获取全部款式', '2024-06-14 09:57:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (260, '获取商品数量', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (261, '获取商品款式数量', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (262, '获取商品类型数量', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (263, '获取活动数量', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (264, '获取标签数量', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (265, '获取用户数量', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (266, '获取全部类型', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (267, '获取全部款式', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (268, '获取全部标签', '2024-06-14 09:57:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (269, '获取用户列表', '2024-06-14 09:58:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (270, '获取款式', '2024-06-14 10:00:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (271, '获取活动', '2024-06-14 10:00:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (272, '获取类型', '2024-06-14 10:00:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (273, '获取商品', '2024-06-14 10:00:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (274, '获取类型', '2024-06-14 10:10:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (275, '获取活动', '2024-06-14 10:10:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (276, '获取款式', '2024-06-14 10:10:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (277, '获取商品', '2024-06-14 10:10:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (278, '获取活动', '2024-06-14 10:11:24', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (279, '获取活动', '2024-06-14 10:12:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (280, '获取类型', '2024-06-14 10:12:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (281, '获取款式', '2024-06-14 10:12:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (282, '获取商品', '2024-06-14 10:12:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (283, '获取款式', '2024-06-14 10:24:56', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (284, '获取活动', '2024-06-14 10:24:56', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (285, '获取类型', '2024-06-14 10:24:56', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (286, '获取商品', '2024-06-14 10:24:56', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (287, '获取类型', '2024-06-14 10:25:14', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (288, '获取款式', '2024-06-14 10:25:14', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (289, '获取商品', '2024-06-14 10:25:14', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (290, '获取活动', '2024-06-14 10:25:14', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (291, '获取款式', '2024-06-14 10:25:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (292, '获取活动', '2024-06-14 10:25:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (293, '获取商品', '2024-06-14 10:25:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (294, '获取类型', '2024-06-14 10:25:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (295, '获取款式', '2024-06-14 10:28:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (296, '获取活动', '2024-06-14 10:28:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (297, '获取类型', '2024-06-14 10:28:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (298, '获取商品', '2024-06-14 10:28:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (299, '获取商品', '2024-06-14 10:29:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (300, '获取类型', '2024-06-14 10:29:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (301, '获取活动', '2024-06-14 10:29:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (302, '获取款式', '2024-06-14 10:29:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (303, '获取款式', '2024-06-14 10:30:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (304, '获取类型', '2024-06-14 10:30:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (305, '获取商品', '2024-06-14 10:30:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (306, '获取活动', '2024-06-14 10:30:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (307, '获取类型', '2024-06-14 10:30:52', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (308, '获取款式', '2024-06-14 10:30:52', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (309, '获取活动', '2024-06-14 10:30:52', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (310, '获取商品', '2024-06-14 10:30:52', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (311, '获取类型', '2024-06-14 10:31:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (312, '获取款式', '2024-06-14 10:31:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (313, '获取活动', '2024-06-14 10:31:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (314, '获取商品', '2024-06-14 10:31:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (315, '获取类型', '2024-06-14 10:31:27', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (316, '获取款式', '2024-06-14 10:31:27', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (317, '获取商品', '2024-06-14 10:31:27', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (318, '获取活动', '2024-06-14 10:31:27', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (319, '获取款式', '2024-06-14 10:31:31', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (320, '获取商品', '2024-06-14 10:31:31', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (321, '获取活动', '2024-06-14 10:31:31', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (322, '获取类型', '2024-06-14 10:31:31', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (323, '获取活动', '2024-06-14 10:33:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (324, '获取商品', '2024-06-14 10:33:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (325, '获取款式', '2024-06-14 10:33:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (326, '获取类型', '2024-06-14 10:33:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (327, '获取商品', '2024-06-14 10:35:17', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (328, '获取活动', '2024-06-14 10:35:17', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (329, '获取类型', '2024-06-14 10:35:17', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (330, '获取款式', '2024-06-14 10:35:17', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (331, '获取款式', '2024-06-14 10:36:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (332, '获取活动', '2024-06-14 10:36:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (333, '获取类型', '2024-06-14 10:36:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (334, '获取商品', '2024-06-14 10:36:21', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (335, '获取活动', '2024-06-14 10:37:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (336, '获取类型', '2024-06-14 10:37:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (337, '获取款式', '2024-06-14 10:37:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (338, '获取商品', '2024-06-14 10:37:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (339, '获取商品', '2024-06-14 10:37:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (340, '获取款式', '2024-06-14 10:37:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (341, '获取活动', '2024-06-14 10:37:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (342, '获取类型', '2024-06-14 10:37:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (343, '更新商品', '2024-06-14 10:38:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (344, '获取商品', '2024-06-14 10:38:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (345, '获取款式', '2024-06-14 10:38:18', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (346, '获取类型', '2024-06-14 10:38:18', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (347, '获取活动', '2024-06-14 10:38:18', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (348, '获取商品', '2024-06-14 10:38:18', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (349, '更新商品', '2024-06-14 10:38:49', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (350, '获取商品', '2024-06-14 10:38:49', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (351, '获取款式', '2024-06-14 10:38:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (352, '获取款式', '2024-06-14 10:49:08', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (353, '获取款式', '2024-06-14 10:55:14', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (354, '获取款式', '2024-06-14 10:55:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (355, '获取款式', '2024-06-14 10:55:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (356, '获取款式', '2024-06-14 10:56:16', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (357, '获取款式', '2024-06-14 10:57:31', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (358, '更新款式', '2024-06-14 10:57:39', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (359, '获取款式', '2024-06-14 10:57:39', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (360, '获取款式', '2024-06-14 10:57:49', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (361, '更新款式', '2024-06-14 10:57:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (362, '获取款式', '2024-06-14 10:57:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (363, '更新款式', '2024-06-14 10:58:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (364, '获取款式', '2024-06-14 10:58:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (365, '更新款式', '2024-06-14 10:58:19', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (366, '获取款式', '2024-06-14 10:58:19', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (367, '更新款式', '2024-06-14 10:58:27', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (368, '获取款式', '2024-06-14 10:58:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (369, '更新款式', '2024-06-14 10:58:39', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (370, '获取款式', '2024-06-14 10:58:39', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (371, '更新款式', '2024-06-14 10:58:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (372, '获取款式', '2024-06-14 10:58:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (373, '更新款式', '2024-06-14 10:58:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (374, '获取款式', '2024-06-14 10:58:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (375, '更新款式', '2024-06-14 10:59:09', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (376, '获取款式', '2024-06-14 10:59:09', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (377, '更新款式', '2024-06-14 10:59:19', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (378, '获取款式', '2024-06-14 10:59:19', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (379, '更新款式', '2024-06-14 10:59:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (380, '获取款式', '2024-06-14 10:59:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (381, '获取日志', '2024-06-14 10:59:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (382, '获取款式', '2024-06-14 10:59:56', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (383, '获取类型', '2024-06-14 10:59:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (384, '获取商品类型数量', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (385, '获取标签数量', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (386, '获取商品数量', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (387, '获取用户数量', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (388, '获取商品款式数量', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (389, '获取活动数量', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (390, '获取全部款式', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (391, '获取全部类型', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (392, '获取全部标签', '2024-06-14 16:38:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (393, '获取类型', '2024-06-14 16:39:00', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (394, '获取活动', '2024-06-14 16:39:00', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (395, '获取商品', '2024-06-14 16:39:00', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (396, '获取款式', '2024-06-14 16:39:00', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (397, '获取活动', '2024-06-14 16:39:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (398, '获取活动', '2024-06-14 16:40:08', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (399, '获取活动', '2024-06-14 16:41:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (400, '获取活动', '2024-06-14 16:43:12', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (401, '获取活动', '2024-06-14 16:43:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (402, '获取活动', '2024-06-14 16:43:43', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (403, '获取活动', '2024-06-14 16:44:44', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (404, '获取活动', '2024-06-14 16:46:18', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (405, '登录后台', '2024-06-14 16:46:28', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (406, '获取商品数量', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (407, '获取活动数量', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (408, '获取用户数量', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (409, '获取标签数量', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (410, '获取商品款式数量', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (411, '获取商品类型数量', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (412, '获取全部类型', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (413, '获取全部标签', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (414, '获取全部款式', '2024-06-14 16:46:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (415, '获取商品数量', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (416, '获取活动数量', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (417, '获取标签数量', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (418, '获取用户数量', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (419, '获取商品款式数量', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (420, '获取商品类型数量', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (421, '获取全部标签', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (422, '获取全部款式', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (423, '获取全部类型', '2024-06-14 16:46:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (424, '获取类型', '2024-06-14 16:46:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (425, '获取款式', '2024-06-14 16:46:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (426, '获取活动', '2024-06-14 16:46:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (427, '获取商品', '2024-06-14 16:46:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (428, '获取活动', '2024-06-14 16:46:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (429, '获取活动', '2024-06-14 16:47:27', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (430, '获取活动', '2024-06-14 16:47:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (431, '按照名称获取活动', '2024-06-14 16:47:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (432, '获取活动', '2024-06-14 16:47:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (433, '获取活动', '2024-06-14 16:48:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (434, '获取活动', '2024-06-14 16:48:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (435, '获取活动', '2024-06-14 16:49:09', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (436, '获取活动', '2024-06-14 16:49:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (437, '获取活动', '2024-06-14 16:51:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (438, '获取活动', '2024-06-14 16:54:08', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (439, '获取活动', '2024-06-14 16:54:09', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (440, '获取活动', '2024-06-14 16:54:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (441, '获取活动', '2024-06-14 16:54:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (442, '获取活动', '2024-06-14 16:55:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (443, '新增活动', '2024-06-14 16:55:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (444, '获取活动', '2024-06-14 16:55:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (445, '删除活动', '2024-06-14 16:56:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (446, '获取活动', '2024-06-14 16:56:30', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (447, '删除活动', '2024-06-14 16:56:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (448, '获取活动', '2024-06-14 16:56:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (449, '删除活动', '2024-06-14 16:56:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (450, '获取活动', '2024-06-14 16:56:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (451, '获取类型', '2024-06-14 16:56:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (452, '获取活动', '2024-06-14 16:56:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (453, '获取款式', '2024-06-14 16:56:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (454, '获取商品', '2024-06-14 16:56:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (455, '删除商品', '2024-06-14 16:56:51', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (456, '获取商品', '2024-06-14 16:56:51', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (457, '删除商品', '2024-06-14 16:56:52', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (458, '获取商品', '2024-06-14 16:56:52', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (459, '删除商品', '2024-06-14 16:56:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (460, '获取商品', '2024-06-14 16:56:53', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (461, '删除商品', '2024-06-14 16:56:54', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (462, '获取商品', '2024-06-14 16:56:54', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (463, '删除商品', '2024-06-14 16:56:56', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (464, '获取商品', '2024-06-14 16:56:56', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (465, '删除商品', '2024-06-14 16:56:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (466, '获取商品', '2024-06-14 16:56:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (467, '删除商品', '2024-06-14 16:56:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (468, '获取商品', '2024-06-14 16:56:58', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (469, '获取商品', '2024-06-14 17:03:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (470, '新增商品', '2024-06-14 17:05:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (471, '获取商品', '2024-06-14 17:05:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (472, '获取商品', '2024-06-14 17:06:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (473, '获取款式', '2024-06-14 17:06:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (474, '获取类型', '2024-06-14 17:06:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (475, '获取活动', '2024-06-14 17:06:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (476, '获取商品', '2024-06-14 17:06:19', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (477, '获取图片', '2024-06-14 17:06:19', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (478, '删除图片', '2024-06-14 17:06:31', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (479, '获取图片', '2024-06-14 17:06:31', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (480, '删除图片', '2024-06-14 17:06:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (481, '获取图片', '2024-06-14 17:06:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (482, '删除图片', '2024-06-14 17:06:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (483, '获取图片', '2024-06-14 17:06:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (484, '删除图片', '2024-06-14 17:06:34', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (485, '获取图片', '2024-06-14 17:06:34', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (486, '删除图片', '2024-06-14 17:06:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (487, '获取图片', '2024-06-14 17:06:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (488, '删除图片', '2024-06-14 17:06:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (489, '获取图片', '2024-06-14 17:06:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (490, '获取类型', '2024-06-14 17:06:40', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (491, '获取活动', '2024-06-14 17:06:40', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (492, '获取商品', '2024-06-14 17:06:40', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (493, '获取款式', '2024-06-14 17:06:40', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (494, '获取商品', '2024-06-14 17:06:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (495, '获取图片', '2024-06-14 17:06:41', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (496, '获取商品', '2024-06-14 17:06:44', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (497, '获取款式', '2024-06-14 17:06:44', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (498, '获取类型', '2024-06-14 17:06:44', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (499, '获取活动', '2024-06-14 17:06:44', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (500, '获取图片', '2024-06-14 17:06:44', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (501, '获取商品', '2024-06-14 17:06:44', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (502, '获取商品', '2024-06-14 17:06:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (503, '获取标签', '2024-06-14 17:06:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (504, '获取标签列表', '2024-06-14 17:06:48', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (505, '获取图片', '2024-06-14 17:06:49', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (506, '获取商品', '2024-06-14 17:06:49', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (507, '获取商品', '2024-06-14 17:06:50', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (508, '获取标签', '2024-06-14 17:06:50', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (509, '获取标签列表', '2024-06-14 17:06:50', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (510, '获取图片', '2024-06-14 17:06:55', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (511, '获取商品', '2024-06-14 17:06:55', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (512, '新增图片', '2024-06-14 17:07:07', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (513, '获取图片', '2024-06-14 17:07:07', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (514, '新增图片', '2024-06-14 17:07:20', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (515, '获取图片', '2024-06-14 17:07:20', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (516, '新增图片', '2024-06-14 17:07:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (517, '获取图片', '2024-06-14 17:07:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (518, '新增图片', '2024-06-14 17:07:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (519, '获取图片', '2024-06-14 17:07:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (520, '删除图片', '2024-06-14 17:08:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (521, '获取图片', '2024-06-14 17:08:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (522, '新增图片', '2024-06-14 17:08:17', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (523, '获取图片', '2024-06-14 17:08:17', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (524, '删除图片', '2024-06-14 17:48:50', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (525, '获取图片', '2024-06-14 17:48:50', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (526, '获取商品', '2024-06-14 17:49:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (527, '获取标签', '2024-06-14 17:49:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (528, '获取标签列表', '2024-06-14 17:49:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (529, '删除标签', '2024-06-14 17:49:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (530, '获取标签列表', '2024-06-14 17:49:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (531, '删除标签', '2024-06-14 17:49:26', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (532, '获取标签列表', '2024-06-14 17:49:26', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (533, '删除标签', '2024-06-14 17:49:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (534, '获取标签列表', '2024-06-14 17:49:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (535, '获取标签', '2024-06-14 17:50:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (536, '获取标签列表', '2024-06-14 17:50:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (537, '获取标签', '2024-06-14 17:50:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (538, '获取商品', '2024-06-14 17:50:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (539, '获取标签列表', '2024-06-14 17:53:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (540, '获取标签', '2024-06-14 17:53:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (541, '获取商品', '2024-06-14 17:53:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (542, '删除标签', '2024-06-14 17:53:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (543, '获取标签列表', '2024-06-14 17:53:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (544, '获取标签列表', '2024-06-14 17:54:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (545, '获取商品', '2024-06-14 17:54:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (546, '获取标签', '2024-06-14 17:54:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (547, '删除标签', '2024-06-14 17:54:38', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (548, '获取标签列表', '2024-06-14 17:54:38', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (549, '删除标签', '2024-06-14 17:55:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (550, '获取标签列表', '2024-06-14 17:55:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (551, '删除标签', '2024-06-14 17:56:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (552, '获取标签列表', '2024-06-14 17:56:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (553, '删除标签', '2024-06-14 17:56:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (554, '获取标签列表', '2024-06-14 17:56:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (555, '删除标签', '2024-06-14 17:56:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (556, '获取标签列表', '2024-06-14 17:56:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (557, '删除标签', '2024-06-14 17:56:06', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (558, '获取标签列表', '2024-06-14 17:56:06', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (559, '删除标签', '2024-06-14 17:56:07', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (560, '获取标签列表', '2024-06-14 17:56:07', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (561, '获取标签', '2024-06-14 17:56:12', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (562, '删除标签', '2024-06-14 17:56:15', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (563, '获取标签', '2024-06-14 17:56:15', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (564, '新增标签', '2024-06-14 17:56:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (565, '获取标签', '2024-06-14 17:56:32', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (566, '获取图片', '2024-06-14 17:56:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (567, '获取商品', '2024-06-14 17:56:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (568, '获取标签列表', '2024-06-14 17:56:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (569, '获取标签', '2024-06-14 17:56:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (570, '获取商品', '2024-06-14 17:56:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (571, '新增标签', '2024-06-14 17:56:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (572, '获取标签列表', '2024-06-14 17:56:42', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (573, '新增标签', '2024-06-14 17:56:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (574, '获取标签列表', '2024-06-14 17:56:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (575, '获取款式', '2024-06-14 17:56:52', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (576, '获取类型', '2024-06-14 17:56:54', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (577, '删除类型', '2024-06-14 18:10:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (578, '获取类型', '2024-06-14 18:10:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (579, '删除类型', '2024-06-14 18:10:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (580, '获取类型', '2024-06-14 18:10:03', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (581, '删除类型', '2024-06-14 18:10:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (582, '获取类型', '2024-06-14 18:10:04', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (583, '删除类型', '2024-06-14 18:10:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (584, '获取类型', '2024-06-14 18:10:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (585, '删除类型', '2024-06-14 18:10:06', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (586, '获取类型', '2024-06-14 18:10:06', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (587, '添加类型', '2024-06-14 18:10:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (588, '获取类型', '2024-06-14 18:10:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (589, '添加类型', '2024-06-14 18:10:45', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (590, '获取类型', '2024-06-14 18:10:45', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (591, '添加类型', '2024-06-14 18:11:01', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (592, '获取类型', '2024-06-14 18:11:01', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (593, '添加类型', '2024-06-14 18:11:18', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (594, '获取类型', '2024-06-14 18:11:18', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (595, '更新类型', '2024-06-14 18:11:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (596, '获取类型', '2024-06-14 18:11:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (597, '添加类型', '2024-06-14 18:11:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (598, '获取类型', '2024-06-14 18:11:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (599, '添加类型', '2024-06-14 18:12:01', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (600, '获取类型', '2024-06-14 18:12:01', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (601, '获取类型', '2024-06-14 18:12:46', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (602, '获取款式', '2024-06-14 18:12:46', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (603, '获取商品', '2024-06-14 18:12:46', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (604, '获取活动', '2024-06-14 18:12:46', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (605, '微信端获取活动', '2024-06-14 18:15:45', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (606, '获取类型', '2024-06-14 18:16:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (607, '获取商品', '2024-06-14 18:16:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (608, '获取款式', '2024-06-14 18:16:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (609, '获取活动', '2024-06-14 18:16:05', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (610, '获取活动', '2024-06-14 18:16:17', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (611, '微信端获取活动', '2024-06-14 18:16:21', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (612, '获取活动', '2024-06-14 18:25:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (613, '获取类型', '2024-06-14 18:32:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (614, '获取活动', '2024-06-14 18:32:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (615, '获取款式', '2024-06-14 18:32:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (616, '获取商品', '2024-06-14 18:32:40', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (617, '获取类型', '2024-06-14 18:32:57', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (618, '获取款式', '2024-06-14 18:32:57', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (619, '获取活动', '2024-06-14 18:32:57', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (620, '获取商品', '2024-06-14 18:32:57', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (621, '获取类型', '2024-06-14 18:35:58', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (622, '获取款式', '2024-06-14 18:35:58', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (623, '获取活动', '2024-06-14 18:35:58', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (624, '获取商品', '2024-06-14 18:35:58', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (625, '微信端获取款式', '2024-06-14 18:36:01', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (626, '微信端获取款式', '2024-06-14 18:36:04', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (627, '获取类型', '2024-06-14 18:36:44', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (628, '获取款式', '2024-06-14 18:36:44', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (629, '获取活动', '2024-06-14 18:36:44', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (630, '获取商品', '2024-06-14 18:36:44', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (631, '微信端获取类型', '2024-06-14 18:36:46', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (632, '微信端获取类型', '2024-06-14 18:37:13', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (633, '微信端获取款式', '2024-06-14 18:37:18', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (634, '微信端获取款式', '2024-06-14 18:37:21', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (635, '获取类型', '2024-06-14 18:40:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (636, '获取活动', '2024-06-14 18:40:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (637, '获取款式', '2024-06-14 18:40:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (638, '获取商品', '2024-06-14 18:40:59', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (639, '更新商品', '2024-06-14 18:41:14', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (640, '获取商品', '2024-06-14 18:41:15', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (641, '微信端获取类型', '2024-06-14 18:41:26', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (642, '微信端获取类型价格升序', '2024-06-14 18:41:28', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (643, '微信端获取类型价格降序', '2024-06-14 18:41:28', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (644, '微信端获取类型', '2024-06-14 18:41:30', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (645, '获取商品', '2024-06-14 18:45:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (646, '获取图片', '2024-06-14 18:45:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (647, '获取商品', '2024-06-14 18:45:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (648, '获取标签', '2024-06-14 18:45:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (649, '获取标签列表', '2024-06-14 18:45:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (650, '获取图片', '2024-06-14 18:45:24', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (651, '获取商品', '2024-06-14 18:45:24', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (652, '获取款式', '2024-06-14 18:45:25', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (653, '获取类型', '2024-06-14 18:45:26', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (654, '获取标签', '2024-06-14 18:45:27', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (655, '获取活动', '2024-06-14 18:45:28', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (656, '获取订单', '2024-06-14 18:45:29', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (657, '删除订单', '2024-06-14 18:45:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (658, '获取订单', '2024-06-14 18:45:35', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (659, '删除订单', '2024-06-14 18:45:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (660, '获取订单', '2024-06-14 18:45:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (661, '删除订单', '2024-06-14 18:45:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (662, '获取订单', '2024-06-14 18:45:36', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (663, '删除订单', '2024-06-14 18:45:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (664, '获取订单', '2024-06-14 18:45:37', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (665, '删除订单', '2024-06-14 18:45:38', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (666, '获取订单', '2024-06-14 18:45:38', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (667, '删除订单', '2024-06-14 18:45:39', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (668, '获取订单', '2024-06-14 18:45:39', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (669, '获取日志', '2024-06-14 18:45:40', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (670, '获取日志', '2024-06-14 18:47:01', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (671, '获取类型', '2024-06-14 18:53:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (672, '获取款式', '2024-06-14 18:53:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (673, '获取商品', '2024-06-14 18:53:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (674, '获取活动', '2024-06-14 18:53:02', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (675, '获取商品', '2024-06-14 18:54:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (676, '获取图片', '2024-06-14 18:54:11', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (677, '获取类型', '2024-06-14 18:54:12', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (678, '获取活动', '2024-06-14 18:54:12', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (679, '获取商品', '2024-06-14 18:54:12', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (680, '获取款式', '2024-06-14 18:54:12', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (681, '获取商品', '2024-06-14 18:54:13', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (682, '获取图片', '2024-06-14 18:54:13', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (683, '获取商品', '2024-06-14 18:56:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (684, '获取标签', '2024-06-14 18:56:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (685, '获取标签列表', '2024-06-14 18:56:33', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (686, '获取款式', '2024-06-14 19:12:40', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (687, '获取类型', '2024-06-14 19:13:26', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (688, '获取标签', '2024-06-14 19:13:47', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (689, '获取活动', '2024-06-14 19:14:23', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (690, '获取订单', '2024-06-14 19:14:43', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (691, '获取日志', '2024-06-14 19:15:07', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (692, '微信登录', '2024-06-14 19:21:05', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (693, '查询订单', '2024-06-14 19:21:28', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (694, '查询订单', '2024-06-14 19:21:30', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (695, '微信端获取标签', '2024-06-14 19:21:31', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (696, '微信端获取商品', '2024-06-14 19:21:31', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (697, '微信端获取商品图片', '2024-06-14 19:21:31', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (698, '新增订单', '2024-06-14 19:21:54', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (699, '查询订单', '2024-06-14 19:21:57', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (700, '查询未完成订单', '2024-06-14 19:21:58', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (701, '查询订单', '2024-06-14 19:21:59', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (702, '查询订单', '2024-06-14 19:22:57', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (703, '微信端获取类型', '2024-06-14 19:23:00', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (704, '微信端获取商品', '2024-06-14 19:23:30', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (705, '微信端获取标签', '2024-06-14 19:23:30', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (706, '微信端获取商品图片', '2024-06-14 19:23:30', '微信端执行', '127.0.0.1');
INSERT INTO `log` VALUES (707, '获取商品类型数量', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (708, '获取标签数量', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (709, '获取商品款式数量', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (710, '获取活动数量', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (711, '获取用户数量', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (712, '获取商品数量', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (713, '获取全部类型', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (714, '获取全部标签', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (715, '获取全部款式', '2024-06-14 23:24:46', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (716, '获取商品数量', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (717, '获取活动数量', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (718, '获取商品款式数量', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (719, '获取标签数量', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (720, '获取用户数量', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (721, '获取商品类型数量', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (722, '获取全部类型', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (723, '获取全部款式', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (724, '获取全部标签', '2024-06-14 23:24:57', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (725, '获取类型', '2024-06-14 23:26:00', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (726, '获取款式', '2024-06-14 23:26:00', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (727, '获取商品', '2024-06-14 23:26:00', '张三丰', '127.0.0.1');
INSERT INTO `log` VALUES (728, '获取活动', '2024-06-14 23:26:00', '张三丰', '127.0.0.1');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '执行人',
  `commodity_id` int(255) NOT NULL COMMENT '商品ID',
  `client` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '客户名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '联系方式',
  `num` int(11) NULL DEFAULT 1 COMMENT '数量',
  `addTime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `order_state_id` int(11) NOT NULL DEFAULT 2 COMMENT '订单状态',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (8, 'DDU343152013', 34, 34, '张楚岚', '14455566666', 1, '2024-06-14 19:21:54', 2);

-- ----------------------------
-- Table structure for order_state
-- ----------------------------
DROP TABLE IF EXISTS `order_state`;
CREATE TABLE `order_state`  (
  `order_state_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单状态ID',
  `state_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`order_state_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_state
-- ----------------------------
INSERT INTO `order_state` VALUES (1, '已完成');
INSERT INTO `order_state` VALUES (2, '未完成');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员');
INSERT INTO `role` VALUES (2, '经理');
INSERT INTO `role` VALUES (3, '店员');

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state`  (
  `state_id` int(11) NOT NULL COMMENT '状态ID',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES (1, '在职');
INSERT INTO `state` VALUES (2, '离职');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户账号',
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_register` datetime(0) NULL DEFAULT NULL COMMENT '用户注册时间',
  `user_role_id` int(255) NULL DEFAULT NULL COMMENT '用户角色ID',
  `user_state_id` int(255) NULL DEFAULT 1 COMMENT '用户状态ID',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张三', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '2024-05-16 00:00:00', 1, 1);
INSERT INTO `user` VALUES (19, '李四', '19207057', 'e7d82462ea8488130044010166c1a5d4', '2024-05-17 19:37:12', 3, 1);
INSERT INTO `user` VALUES (28, '王五', '23131', '088a6c64315f69c907baf6f248b9f778', '2024-05-19 09:19:02', 2, 1);
INSERT INTO `user` VALUES (32, '赵六', 'qweqwe', 'bff149a0b87f5b0e00d9dd364e9ddaa0', '2024-05-19 18:31:24', 3, 2);
INSERT INTO `user` VALUES (33, '孙七', 'qweqw', 'e10adc3949ba59abbe56e057f20f883e', '2024-05-19 18:35:26', 3, 1);
INSERT INTO `user` VALUES (34, '张三丰', '114514', 'e10adc3949ba59abbe56e057f20f883e', '2024-06-07 18:51:42', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
