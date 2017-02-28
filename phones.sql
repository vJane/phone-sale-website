/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : phones

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2016-01-06 09:08:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `memberID` char(20) NOT NULL,
  `password` char(20) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `tel` char(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('aa', 'a', 'a', '12345678901', 'afd');
INSERT INTO `members` VALUES ('abc', 'aaa', 'aaa', 'aaa', 'aaa');
INSERT INTO `members` VALUES ('Bob', '456', 'z', null, '河北省保定市');
INSERT INTO `members` VALUES ('Ddd', 'ddd', 'ddd', '12', 'ddd');
INSERT INTO `members` VALUES ('July', '234', 'z', null, '河北省保定市');
INSERT INTO `members` VALUES ('qweqwe', 'qweqwe', 'qweqwe', '18713566770', 'qweqwe');
INSERT INTO `members` VALUES ('Vivian', '123', 'zhang', null, '河北省保定市');
INSERT INTO `members` VALUES ('张雅娟', '123', '张雅娟', '18713575980', '河北省秦皇岛市河北大街西段360号河北科技师范学院');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `memberID` char(20) NOT NULL,
  `phoneID` char(20) NOT NULL,
  `num` int(11) NOT NULL,
  `done` char(10) NOT NULL DEFAULT '购物车',
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('11', 'Vivian', 'huawei3', '1', '交易完成');
INSERT INTO `orders` VALUES ('14', 'Vivian', 'huawei1', '1', '交易完成');
INSERT INTO `orders` VALUES ('15', 'Vivian', 'apple4', '1', '已提交订单');
INSERT INTO `orders` VALUES ('16', 'Vivian', 'lenovo2', '1', '已提交订单');
INSERT INTO `orders` VALUES ('17', 'Vivian', 'apple2', '5', '已提交订单');
INSERT INTO `orders` VALUES ('18', 'Vivian', 'lenovo3', '3', '已提交订单');
INSERT INTO `orders` VALUES ('19', 'Vivian', 'lenovo4', '1', '已提交订单');
INSERT INTO `orders` VALUES ('20', 'Vivian', 'mi2', '1', '已提交订单');
INSERT INTO `orders` VALUES ('24', 'Vivian', 'mi3', '1', '已提交订单');
INSERT INTO `orders` VALUES ('25', 'Vivian', 'huawei2', '1', '已提交订单');
INSERT INTO `orders` VALUES ('26', 'Vivian', 'huawei3', '1', '已提交订单');
INSERT INTO `orders` VALUES ('28', 'Vivian', 'mi3', '1', '已提交订单');
INSERT INTO `orders` VALUES ('30', 'Vivian', 'mi2', '1', '购物车');
INSERT INTO `orders` VALUES ('31', 'Vivian', 'apple2', '1', '购物车');
INSERT INTO `orders` VALUES ('32', 'July', 'apple2', '1', '已提交订单');
INSERT INTO `orders` VALUES ('33', 'July', 'apple1', '2', '已提交订单');
INSERT INTO `orders` VALUES ('34', 'July', 'lenovo3', '1', '购物车');
INSERT INTO `orders` VALUES ('35', 'July', 'mi3', '3', '已提交订单');
INSERT INTO `orders` VALUES ('36', 'July', 'mi3', '4', '已提交订单');
INSERT INTO `orders` VALUES ('37', 'July', 'apple1', '1', '购物车');
INSERT INTO `orders` VALUES ('38', '张雅娟', 'apple2', '1', '购物车');
INSERT INTO `orders` VALUES ('39', '张雅娟', 'lenovo4', '2', '已提交订单');
INSERT INTO `orders` VALUES ('40', '张雅娟', 'mi5', '1', '购物车');
INSERT INTO `orders` VALUES ('41', '张雅娟', 'nokia3', '1', '购物车');
INSERT INTO `orders` VALUES ('42', '张雅娟', 'apple4', '3', '已提交订单');

-- ----------------------------
-- Table structure for `phones`
-- ----------------------------
DROP TABLE IF EXISTS `phones`;
CREATE TABLE `phones` (
  `phoneID` char(20) NOT NULL,
  `pname` char(20) NOT NULL,
  `price` double(8,2) NOT NULL,
  `kinds` int(11) NOT NULL,
  `img` char(255) DEFAULT NULL,
  `describ` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`phoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phones
-- ----------------------------
INSERT INTO `phones` VALUES ('apple1', 'iphone6S', '6088.00', '101', 'images/apple1.jpg', '商品编号：1057746品牌： APPLE上架时间：2014-01-26 09:06:16商品毛重：350.00g商品产地：中国大陆热点：拍照神器系统：苹果（IOS）');
INSERT INTO `phones` VALUES ('apple2', 'iphone6Plus', '5288.00', '101', 'images/apple2.jpg', '商品编号：1057746品牌： APPLE上架时间：2014-01-26 09:06:16商品毛重：350.00g商品产地：中国大陆热点：拍照神器系统：苹果（IOS）');
INSERT INTO `phones` VALUES ('apple3', 'iphone5', '4488.00', '101', 'images/apple3.jpg', '商品编号：1057746品牌： APPLE上架时间：2014-01-26 09:06:16商品毛重：350.00g商品产地：中国大陆热点：拍照神器系统：苹果（IOS）');
INSERT INTO `phones` VALUES ('apple4', 'iphone5S', '3200.00', '101', 'images/apple4.jpg', '商品编号：1057746品牌： APPLE上架时间：2014-01-26 09:06:16商品毛重：350.00g商品产地：中国大陆热点：拍照神器系统：苹果（IOS）');
INSERT INTO `phones` VALUES ('huawei1', '华为Mate8', '3699.00', '102', 'images/huawei1.jpg', '商品编号：1196255品牌： 华为（HUAWEI）上架时间：2014-08-21 20:58:26商品毛重：340.00g商品产地：中国大陆热点：拍照神器，1080P屏机身颜色：白色系统：安卓（Android）');
INSERT INTO `phones` VALUES ('huawei2', '华为畅想5S', '1199.00', '102', 'images/huawei2.jpg', '商品编号：1196255品牌： 华为（HUAWEI）上架时间：2014-08-21 20:58:26商品毛重：340.00g商品产地：中国大陆热点：拍照神器，1080P屏机身颜色：白色系统：安卓（Android）');
INSERT INTO `phones` VALUES ('huawei3', '华为P8', '2888.00', '102', 'images/huawei3.jpg', '商品编号：1196255品牌： 华为（HUAWEI）上架时间：2014-08-21 20:58:26商品毛重：340.00g商品产地：中国大陆热点：拍照神器，1080P屏机身颜色：白色系统：安卓（Android）');
INSERT INTO `phones` VALUES ('lenovo1', '联想乐檬X3', '2499.00', '103', 'images/lenovo1.jpg', '商品编号：1695237品牌： 联想上架时间：2015-08-05 11:49:02商品毛重：350.00g商品产地：中国大陆热点：双卡双待，1080P屏，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('lenovo2', '联想VIBE', '2199.00', '103', 'images/lenovo2.jpg', '商品编号：1695237品牌： 联想上架时间：2015-08-05 11:49:02商品毛重：350.00g商品产地：中国大陆热点：双卡双待，1080P屏，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('lenovo3', '联想黄金斗士', '600.00', '103', 'images/lenovo3.jpg', '商品编号：1695237品牌： 联想上架时间：2015-08-05 11:49:02商品毛重：350.00g商品产地：中国大陆热点：双卡双待，1080P屏，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('lenovo4', '联想K900', '1599.00', '103', 'images/lenovo4.jpg', '商品编号：1695237品牌： 联想上架时间：2015-08-05 11:49:02商品毛重：350.00g商品产地：中国大陆热点：双卡双待，1080P屏，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('lenovo5', '联想A3600', '310.00', '103', 'images/lenovo5.jpg', '商品编号：1695237品牌： 联想上架时间：2015-08-05 11:49:02商品毛重：350.00g商品产地：中国大陆热点：双卡双待，1080P屏，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('mi1', '红米Note3', '899.00', '104', 'images/mi1.jpg', '商品编号：1743187品牌： 小米（MI）上架时间：2015-09-10 13:42:30商品毛重：290.00g商品产地：中国大陆热点：双卡双待系统：安卓（Android）');
INSERT INTO `phones` VALUES ('mi2', '小米4C', '1499.00', '104', 'images/mi2.jpg', '商品编号：1743187品牌： 小米（MI）上架时间：2015-09-10 13:42:30商品毛重：290.00g商品产地：中国大陆热点：双卡双待系统：安卓（Android）');
INSERT INTO `phones` VALUES ('mi3', '小米4', '1799.00', '104', 'images/mi3.jpg', '商品编号：1743187品牌： 小米（MI）上架时间：2015-09-10 13:42:30商品毛重：290.00g商品产地：中国大陆热点：双卡双待系统：安卓（Android）');
INSERT INTO `phones` VALUES ('mi4', '小米Note', '1999.00', '104', 'images/mi4.jpg', '商品编号：1743187品牌： 小米（MI）上架时间：2015-09-10 13:42:30商品毛重：290.00g商品产地：中国大陆热点：双卡双待系统：安卓（Android）');
INSERT INTO `phones` VALUES ('mi5', '红米2', '609.00', '104', 'images/mi5.jpg', '商品编号：1743187品牌： 小米（MI）上架时间：2015-09-10 13:42:30商品毛重：290.00g商品产地：中国大陆热点：双卡双待系统：安卓（Android）');
INSERT INTO `phones` VALUES ('nokia1', '诺基亚1050', '119.00', '105', 'images/nokia1.jpg', '商品编号：1226359品牌： 诺基亚（NOKIA）上架时间：2014-09-22 18:02:36商品毛重：180.00g商品产地：越南热点：双卡双待，直板键盘，非智能');
INSERT INTO `phones` VALUES ('nokia2', '诺基亚1020', '1550.00', '105', 'images/nokia2.jpg', '商品编号：1226359品牌： 诺基亚（NOKIA）上架时间：2014-09-22 18:02:36商品毛重：180.00g商品产地：越南热点：双卡双待，直板键盘，非智能');
INSERT INTO `phones` VALUES ('nokia3', '诺基亚920', '2699.00', '105', 'images/nokia3.jpg', '商品编号：1226359品牌： 诺基亚（NOKIA）上架时间：2014-09-22 18:02:36商品毛重：180.00g商品产地：越南热点：双卡双待，直板键盘，非智能');
INSERT INTO `phones` VALUES ('nokia4', '诺基亚1520', '2399.00', '105', 'images/nokia4.jpg', '商品编号：1226359品牌： 诺基亚（NOKIA）上架时间：2014-09-22 18:02:36商品毛重：180.00g商品产地：越南热点：双卡双待，直板键盘，非智能');
INSERT INTO `phones` VALUES ('nokia5', '诺基亚Lumia', '2300.00', '105', 'images/nokia5.jpg', '商品编号：1226359品牌： 诺基亚（NOKIA）上架时间：2014-09-22 18:02:36商品毛重：180.00g商品产地：越南热点：双卡双待，直板键盘，非智能');
INSERT INTO `phones` VALUES ('nubia1', '努比亚Z9MINI', '1399.00', '106', 'images/nubia1.jpg', '品编号：1413846品牌： 努比亚（nubia）上架时间：2015-03-26 16:14:33商品毛重：460.00g商品产地：中国大陆热点：双卡双待，拍照神器，1080P屏，JDPhone计划，游戏手机，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('nubia2', '努比亚Z9MAX', '1599.00', '106', 'images/nubia2.jpg', '品编号：1413846品牌： 努比亚（nubia）上架时间：2015-03-26 16:14:33商品毛重：460.00g商品产地：中国大陆热点：双卡双待，拍照神器，1080P屏，JDPhone计划，游戏手机，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('nubia3', '努比亚无边框', '3599.00', '106', 'images/nubia3.jpg', '品编号：1413846品牌： 努比亚（nubia）上架时间：2015-03-26 16:14:33商品毛重：460.00g商品产地：中国大陆热点：双卡双待，拍照神器，1080P屏，JDPhone计划，游戏手机，音乐手机系统：安卓（Android）');
INSERT INTO `phones` VALUES ('oppo1', 'OPPO R7s', '2799.00', '107', 'images/oppo1.jpg', '商品编号：2022076品牌： OPPO上架时间：2015-10-20 18:49:25商品毛重：470.00g商品产地：中国大陆热点：拍照神器系统：安卓（Android）');
INSERT INTO `phones` VALUES ('oppo2', 'OPPO A53', '1999.00', '107', 'images/oppo2.jpg', '商品编号：2022076品牌： OPPO上架时间：2015-10-20 18:49:25商品毛重：470.00g商品产地：中国大陆热点：拍照神器系统：安卓（Android）');
INSERT INTO `phones` VALUES ('oppo3', 'OPPO R7Plus', '2999.00', '107', 'images/oppo3.jpg', '商品编号：2022076品牌： OPPO上架时间：2015-10-20 18:49:25商品毛重：470.00g商品产地：中国大陆热点：拍照神器系统：安卓（Android）');
INSERT INTO `phones` VALUES ('oppo4', 'OPPO A33', '1299.00', '107', 'images/oppo4.jpg', '商品编号：2022076品牌： OPPO上架时间：2015-10-20 18:49:25商品毛重：470.00g商品产地：中国大陆热点：拍照神器系统：安卓（Android）');
INSERT INTO `phones` VALUES ('vivo1', 'vivo X5Pro', '2298.00', '108', 'images/vivo1.jpg', '商品编号：10048644057店铺： vivo手机旗舰店上架时间：2015-12-14 11:56:14商品毛重：350.00g热点：双卡双待，拍照神器，超薄7mm以下，音乐手机，其他机身颜色：金色系统：安卓（Android）');
INSERT INTO `phones` VALUES ('vivo2', 'vivo X6', '2498.00', '108', 'images/vivo2.jpg', '商品编号：10048644057店铺： vivo手机旗舰店上架时间：2015-12-14 11:56:14商品毛重：350.00g热点：双卡双待，拍照神器，超薄7mm以下，音乐手机，其他机身颜色：金色系统：安卓（Android）');
INSERT INTO `phones` VALUES ('vivo3', 'vivo X6Plus', '3198.00', '108', 'images/vivo3.jpg', '商品编号：10048644057店铺： vivo手机旗舰店上架时间：2015-12-14 11:56:14商品毛重：350.00g热点：双卡双待，拍照神器，超薄7mm以下，音乐手机，其他机身颜色：金色系统：安卓（Android）');
