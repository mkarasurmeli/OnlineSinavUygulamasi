/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : onlinesinav

 Target Server Type    : MySQL
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 14/03/2018 22:41:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cevaplar
-- ----------------------------
DROP TABLE IF EXISTS `cevaplar`;
CREATE TABLE `cevaplar`  (
  `cevapid` int(11) NOT NULL AUTO_INCREMENT,
  `secid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cevapid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for secenekler
-- ----------------------------
DROP TABLE IF EXISTS `secenekler`;
CREATE TABLE `secenekler`  (
  `secenekid` int(11) NOT NULL AUTO_INCREMENT,
  `secenek` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `soruid` int(11) NULL DEFAULT NULL,
  `durum` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`secenekid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of secenekler
-- ----------------------------
INSERT INTO `secenekler` VALUES (19, 'Hukukî alanda din ayrımının sona ermesi', 16, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (20, 'Rejim tartışmalarının bitirilmesi', 16, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (21, 'Anayasanın lâikleşmesi konusunda önemli bir adımın atılması', 16, 'DOĞRU');
INSERT INTO `secenekler` VALUES (22, 'Toplumdaki dînî çatışmaların sona ermesi', 16, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (23, 'Atatürk ilkelerinin anayasada yer alması', 16, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (24, 'Saltanatın kaldırılması', 17, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (25, 'Cumhuriyet’in ilân edilmesi', 17, 'DOĞRU');
INSERT INTO `secenekler` VALUES (26, 'Yeni Türk harflerinin kabûl edilmesi', 17, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (27, 'Halifeliğin kaldırılması', 17, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (28, 'Medenî Kanun’un uygulamaya konulması', 17, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (29, 'Ham maddesi yurt içinde yetişen sanayi dalları kurulmalıdır', 18, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (30, 'Özel teşebbüse kredi sağlayacak bir devlet bankası kurulmalıdır', 18, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (31, 'Dış   borçlanmaya  gidilerek,  yabancı    işletmelerin  kurulması sağlanmalıdır', 18, 'DOĞRU');
INSERT INTO `secenekler` VALUES (32, 'Küçük çaplı işletmelerden (bilgi yelpazesi.net) hızla büyük işletmelere geçilmelidir', 18, 'YANLIŞ');
INSERT INTO `secenekler` VALUES (33, 'Özel sektör devlet tarafından desteklenmelidir', 18, 'YANLIŞ');

-- ----------------------------
-- Table structure for sorular
-- ----------------------------
DROP TABLE IF EXISTS `sorular`;
CREATE TABLE `sorular`  (
  `soruid` int(11) NOT NULL AUTO_INCREMENT,
  `soru` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`soruid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sorular
-- ----------------------------
INSERT INTO `sorular` VALUES (16, '1928’de, anayasadaki, “Devletin resmî dîni İslâm’dır” maddesinin çıkartılmasının en önemli sonucu, aşağıdakilerden hangisidir?');
INSERT INTO `sorular` VALUES (17, ' Aşağıdakilerden hangisi, II. TBMM’nin gerçekleştirdiği ilk inkılâptır?');
INSERT INTO `sorular` VALUES (18, ' 1.İzmir İktisat Kongresi (18 Şubat – 4 Mart 1923) kararları arasında aşağıdakilerden hangisi yer almaz?');

-- ----------------------------
-- Procedure structure for secenegesorugetirme
-- ----------------------------
DROP PROCEDURE IF EXISTS `secenegesorugetirme`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secenegesorugetirme`(IN `soid` int)
BEGIN
	select soru from sorular where sorular.soruid=soid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for secenekekleme
-- ----------------------------
DROP PROCEDURE IF EXISTS `secenekekleme`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secenekekleme`(IN `secenek` VARCHAR(255),IN `sid` INT,IN `durum` VARCHAR(255))
BEGIN
	insert into secenekler values (null, secenek,sid,durum);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for secenekgetir
-- ----------------------------
DROP PROCEDURE IF EXISTS `secenekgetir`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secenekgetir`(IN `soruid` int)
BEGIN
	select * from secenekler where secenekler.soruid=soruid; 
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for secenekgetirme
-- ----------------------------
DROP PROCEDURE IF EXISTS `secenekgetirme`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secenekgetirme`(IN `soid` int)
BEGIN
	
select * from secenekler inner join sorular on secenekler.soruid=sorular.soruid  where secenekler.soruid=soid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for seceneksil
-- ----------------------------
DROP PROCEDURE IF EXISTS `seceneksil`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seceneksil`(IN `secid` int, IN `soruid` int)
BEGIN
	delete from secenekler where secenekler.secenekid=secid and secenekler.soruid=soruid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for secOlanSorular
-- ----------------------------
DROP PROCEDURE IF EXISTS `secOlanSorular`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `secOlanSorular`()
BEGIN
	SELECT s.soruid , s.soru from secenekler as sec JOIN sorular as s on s.soruid=sec.soruid GROUP BY s.soruid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for soruekleme
-- ----------------------------
DROP PROCEDURE IF EXISTS `soruekleme`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `soruekleme`(IN `soru` VARCHAR(255))
BEGIN
	insert into sorular values (null, soru);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sorugetirme
-- ----------------------------
DROP PROCEDURE IF EXISTS `sorugetirme`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sorugetirme`()
BEGIN
	
select * from sorular;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sorusil
-- ----------------------------
DROP PROCEDURE IF EXISTS `sorusil`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sorusil`(IN `soid` int)
BEGIN
	delete from sorular where sorular.soruid=soid;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
