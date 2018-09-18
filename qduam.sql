/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : qduam

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2018-08-11 13:24:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` text NOT NULL COMMENT '文章标题',
  `CONTENT` longtext NOT NULL COMMENT '文章内容',
  `AUTHOR` int(11) NOT NULL COMMENT '作者id/用户id',
  `TIME` varchar(50) NOT NULL COMMENT '发布时间',
  `SECTIONA` varchar(5) NOT NULL COMMENT '一级版块（1：网站通知，2：社团简介，3：社团动态）',
  `SECTIONB` varchar(5) NOT NULL COMMENT '二级板块',
  PRIMARY KEY (`ID`),
  KEY `ar_sectionA` (`SECTIONA`) USING BTREE,
  KEY `ar_sectionB` (`SECTIONB`) USING BTREE,
  KEY `ar_author` (`AUTHOR`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`AUTHOR`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('48', '【校自强社】关于公布青岛大学2016年大学生创新创业训练计划项目中期检查结果和第二次拨款情况的通知', '<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">各学院，医学部：</span></p><p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\"><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">青岛大学<span style=\";padding: 0px\">2016</span>年大学生创新创业训练计划项目中期检查工作经过学院（学部）全面检查、学校重点抽查及审核，共有<span style=\";padding: 0px\">793</span>个项目通过中期检查，现将中期检查结果和第二次拨款情况公布如下：</span></p><p style=\"margin: 0 0 0 43px;padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal\"><strong style=\";padding: 0px\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">一、中期检查结果</span></strong></p><p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal;text-indent: 43px\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">大部分学院（学部）能够按照要求组织开展工作，能为项目提供经费、资源等条件支持；指导教师认真负责，对学生的研究内容指导到位；项目组能够按照计划开展研究，部分项目组已取得阶段性成果。存在的主要问题是部分单位未兑现申报时承诺的资助经费，个别单位没有将学校资助的经费落实到相应项目组等。通过检查，国家级项目优秀<span style=\";padding: 0px\">52</span>项、合格<span style=\";padding: 0px\">41</span>项；校级项目优秀<span style=\";padding: 0px\">164</span>项、合格<span style=\";padding: 0px\">536</span>项、不合格予以撤项<span style=\";padding: 0px\">52</span>项。</span></p><p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal;text-indent: 43px\"><strong style=\";padding: 0px\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">二、第二次拨款情况</span></strong></p><p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal;text-indent: 43px\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">根据《关于公布青岛大学<span style=\";padding: 0px\">2016</span>年大学生创新创业训练计划项目名单的通知》（教务〔<span style=\";padding: 0px\">2016</span>〕<span style=\";padding: 0px\">24</span>号），对青岛大学<span style=\";padding: 0px\">2016</span>年大学生创新创业训练计划项目进行第二次拨款。</span></p><p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal;text-indent: 43px\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">本次拨款范围为国家级项目和中期检查结果为优秀的校级项目。经费包括项目经费和项目管理费，其中项目经费为国家级项目每个<span style=\";padding: 0px\">1000</span>元、中期检查结果优秀的国家级项目每个再追加<span style=\";padding: 0px\">3000</span>元、中期检查结果优秀的校级项目每个<span style=\";padding: 0px\">1000</span>元，项目经费拨付至学院学生创新研究项目经费（编号<span style=\";padding: 0px\">23010</span>）；项目管理费按照项目经费的<span style=\";padding: 0px\">10%</span>进行拨付，其中项目管理费的<span style=\";padding: 0px\">60%</span>用于评审经费，拨付至学院津贴（编号<span style=\";padding: 0px\">1010205</span>），项目管理费的<span style=\";padding: 0px\">40%</span>用于办公经费拨付至教学业务费（编号<span style=\";padding: 0px\">22001</span>）。</span></p><p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal;text-indent: 43px\"><a style=\";padding: 0px\"></a><a style=\";padding: 0px\"><span style=\";padding: 0px\"><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">请各学院（学部）及时将学校资助经费和本单位承诺支持的经费分配至项目组，督促项目负责人规范经费支出，提高经费使用效益，促进项目成果产出，经费支出主要用于项目发表论文、申请专利及制作实物等，原则上国家级项目应在正式期刊至少发表论文一篇或申请专利一项。各学院（学部）要进一步做好项目推进工作，确保项目顺利完成，力争产出更多高水平成果。</span></span></a></p><p style=\"margin-top: 0px;margin-bottom: 20px;padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;line-height: 19.5px;white-space: normal\">&nbsp;</p><p><br/></p><p>\r\n	</p>', '353', '2017-06-04 00:00:00', '3', '6');
INSERT INTO `article` VALUES ('107', '【校学生会】2018年新年快乐！', '<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;2018</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">年1月21日下午2:30学校在办公楼228室召开了青岛大学第六届“年度教学十佳”评选会议，评审委员会通过投票，评选出王瑶等10人为青岛大学第六届“年度教学十佳”推荐人选，现予以公示。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;公示期自2018年1月21日至23日，有异议者请于1月23日下午16：00之前向教务处提交书面材料。书面材料必须写明真实姓名、反对的理由和事实依据，并注明工作单位、联系电话和通讯地址。过期或不按要求提出的异议，不予受理。</span>\r\n</p>\r\n<p>\r\n    <strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">第六届“年度教学十佳”推荐人选名单（按姓氏笔画排序）</span></strong>\r\n</p>\r\n<table>\r\n    <tbody style=\"margin: 0px; padding: 0px;\">\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\" class=\"firstRow\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-width: 1pt; border-color: windowtext;\">\r\n                <p>\r\n                    <strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">序号</span></strong>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: windowtext windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-top-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">姓名</span></strong>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: windowtext windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-top-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">教学单位</span></strong>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">1</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">王&nbsp;瑶</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">材料科学与工程学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">2</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">王淑华</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">物理科学学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">3</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">孙晓燕</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">政治与公共管理学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">4</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">谷&nbsp;岩</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">数学与统计学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">5</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">杨&nbsp;倩</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">机电工程学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">6</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">周&nbsp;强</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">数据科学与软件工程学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">7</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">郝龙云</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">纺织服装学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">8</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">秦硕谦</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">外语学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">9</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">彭卫丽</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">美术学院</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 22.7pt;\">\r\n            <td width=\"3\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext; border-bottom-width: 1pt; border-left-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">10</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"148\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">薛美兰</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"184\" style=\"margin: 0px; padding: 0cm 5.4pt; border-color: rgb(240, 240, 240) windowtext windowtext rgb(240, 240, 240); border-bottom-width: 1pt; border-right-width: 1pt;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">医学部</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">联 系 人：张永进&nbsp; 王晓辉</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">联系电话：85951205</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">办公地点：行政楼107</span>\r\n</p>\r\n<p>\r\n    &nbsp;\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">教务处</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2018-1-21</span>\r\n</p>\r\n<p>\r\n    \r\n	\r\n</p>', '359', '2018-02-15 00:00:00', '3', '6');
INSERT INTO `article` VALUES ('182', '关于开展2018年夏季、秋季学期教材征订工作的通知', '<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; font-family: Arial, Verdana, sans-serif; font-size: 13px; letter-spacing: 2px; white-space: normal;\">\r\n    <span style=\"font-size:18px;font-family:宋体\">各学院（学部）：&nbsp;<br/>&nbsp;&nbsp;&nbsp; 为做好2018年夏季、秋季学期教材征订工作，确保高质量教材进课堂，现将有关事宜通知如下：&nbsp;<br/>&nbsp;&nbsp;&nbsp; 1.根据《青岛大学教材选用管理规定》（青大教字〔2014〕6号），学院开设课程所用教材，由教研室或系选定后填写《青岛大学教材征订表》（教务在线-办事指南-教学服务中心“教材征订流程”下载），纸质版（一式两份、A4纸）由分管领导审核、签字加盖公章后，于2018年5月28日前报送教学服务中心，电子版发至<a href=\"mailto:qdujxfwzx@163.com\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);\">qdujxfwzx@163.com</a>。&nbsp;<br/>&nbsp;&nbsp;&nbsp; 2.有关说明&nbsp;<br/>&nbsp;&nbsp; （1）学生教材的课程号、使用年级、专业和学生人数等信息须填报正确、详细。&nbsp;<br/>&nbsp;&nbsp; （2）务必不要漏报为其他学院开设课程的教材。&nbsp;<br/>&nbsp;&nbsp; （3）夏季学期使用的教材请在备注栏中注明。&nbsp;<br/>&nbsp;&nbsp; （4）根据教育部教材厅〔2017〕1号、省教育厅鲁教高处函〔2017〕19号等文件精神，开设“马工程”相关课程必须全部使用“马工程”重点教材。&nbsp;<br/>&nbsp;&nbsp; （5）教材性质请填写：国家级规划教材、教育部教学指导委员会推荐教材、省部级获奖教材、马工程重点教材、其它教材。&nbsp;<br/>&nbsp;&nbsp; （6）教师用书须按订数全部领取，集中领取时间为2018年7月5-6日。&nbsp;<br/>&nbsp;&nbsp; （7）教材信息可参照《2018年秋季学期全国大中专教学用书目录》和已出版“马工程”重点教材一览表（至2017年）（见附件）&nbsp;<br/>&nbsp;&nbsp;&nbsp; 联系电话：85953713 85954130&nbsp;</span>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; font-family: Arial, Verdana, sans-serif; font-size: 13px; letter-spacing: 2px; white-space: normal;\">\r\n    <span style=\"font-size:18px;font-family:宋体\"><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 教 务 处&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018年5月16日&nbsp;</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '1', '2018-03-15 00:00:00', '1', '1');
INSERT INTO `article` VALUES ('183', '关于开展2018年度本科专业设置工作的通知', '<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">各学院，医学部：</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">为进一步调整优化专业结构，强化办学特色与优势，</span><span style=\";padding: 0px;font-size: 21px\">根据《山东省教育厅关于做好<span style=\";padding: 0px\">2018</span>年度高等学校本科专业设置工作的通知》（鲁教高字〔<span style=\";padding: 0px\">2018</span>〕<span style=\";padding: 0px\">6</span>号，附件<span style=\";padding: 0px\">1</span>）</span><span style=\";padding: 0px;font-size: 21px\">精神，现就我校</span><span style=\";padding: 0px;font-size: 21px\">2018</span><span style=\";padding: 0px;font-size: 21px\">年度本科专业设置工作通知如下：</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <strong style=\";padding: 0px\"><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">一、专业设置原则</span></span></strong>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">1.</span><span style=\";padding: 0px;font-size: 21px\">各学院（学部）认真学习教育厅文件精神，做好专业设置工作的研究和规划。坚持“突出特色、科学布局、主动调优、控制规模</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 仿宋\">”</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">的工作原则，重点设置经济社会发展急需的、能体现学校优势特色的、与社会需求结合度高的应用型本科专业。聚焦国家重大发展战略，对接我省新旧动能转换</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 仿宋\">“</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">十强</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 仿宋\">”</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">产业和乡村振兴计划，积极参与&nbsp;</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 仿宋\">“</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">新工科</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 仿宋\">”“</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">新医科</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 仿宋\">”“</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">新农科</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 仿宋\">”</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">建设，设置服务支撑动能转换、产业转型升级、培养引领未来技术和产业发展人才的专业。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">2.</span><span style=\";padding: 0px;font-size: 21px\">教育厅文件明确规定：“本科专业总数量在<span style=\";padding: 0px\">50</span>个以上的高校，应以调整优化专业结构为主要目标，<span style=\";padding: 0px\">2018</span>年原则上不予新增本科专业。如确需新增专业且符合重点设置原则的，可采取新增专业与撤销或停招和撤销专业合计等数量置换方式申请。”根据文件要求，我校<span style=\";padding: 0px\">2018</span>年原则上不予新增本科专业，</span><span style=\";padding: 0px;font-size: 21px\">若学院</span><span style=\";padding: 0px;font-size: 21px\">（学部）</span><span style=\";padding: 0px;font-size: 21px\">确需新增专业且符合重点设置原则的<span style=\";padding: 0px\">,</span></span><span style=\";padding: 0px;font-size: 21px\">应采取新增专业数量与撤销、停招专业数量等量置换方式申请。暂停招生或隔年招生的专业不作为停招专业计算。撤销或停招专业需报省教育厅备案，专业恢复招生需重新报备。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">3.</span><span style=\";padding: 0px;font-size: 21px\">申请新增的专业应具有完成专业人才培养方案所必需的专职教师队伍及教学辅助人员；具备开办专业所必需的经费、教学用房、图书资料、仪器设备、实习基地等办学条件，有保障专业可持续发展的相关制度；</span><span style=\";padding: 0px;font-size: 21px\">专业所在学院（学部）应</span><span style=\";padding: 0px;font-size: 21px\">具有较强的举办新专业的特色和优势。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">4.</span><span style=\";padding: 0px;font-size: 21px\">近三年新增专业尚未有一届毕业生的学院（学部）暂不新增专业。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">5.</span><span style=\";padding: 0px;font-size: 21px\">各学院（学部）可根据社会需要、自身优势和特点，合理规划专业设置，对不满足发展需要的专业提出撤销申请。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;background: white;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">二、</span><strong style=\";padding: 0px\"><span style=\";padding: 0px;font-size: 21px\">申报程序与材料报送要求</span></strong></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">1.</span><span style=\";padding: 0px;font-size: 21px\">调研。</span><span style=\";padding: 0px;font-size: 21px\">6</span><span style=\";padding: 0px;font-size: 21px\">月<span style=\";padding: 0px\">20</span>日前，</span></span><span style=\";padding: 0px;font-size: 21px;font-family: Arial, sans-serif\">&nbsp;</span><span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">各学院（学部）</span><span style=\";padding: 0px;font-size: 21px\">要对专业设置的可行性进行认真调研和充分论证</span><span style=\";padding: 0px;font-size: 21px\">，撰写调研论证报告</span><span style=\";padding: 0px;font-size: 21px\">，内容应包括拟设专业的布点情况、经济社会发展需求情况、我校师资与办学基础、建设发展规划，以及参与论证的专家名单与论证意见。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">2.</span><span style=\";padding: 0px;font-size: 21px\">申报。各学院（学部）按要求报送相关材料，申报材料包括：</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">（<span style=\";padding: 0px\">1</span>）</span><span style=\";padding: 0px;font-size: 21px\">专业撤销（停招）申请表（附件<span style=\";padding: 0px\">2</span>）。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">（<span style=\";padding: 0px\">2</span>）新设置专业</span><span style=\";padding: 0px;font-size: 21px\">调研论证报告一式<span style=\";padding: 0px\">9</span>份。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">（<span style=\";padding: 0px\">3</span>）</span><span style=\";padding: 0px;font-size: 21px\">《普通高等学校本科专业设置申请表<span style=\";padding: 0px\">(</span>备案专业适用<span style=\";padding: 0px\">)</span>》（附件<span style=\";padding: 0px\">3</span>）或《普通高等学校本科专业设置申请表（审批专业适用）》（附件<span style=\";padding: 0px\">4</span>）一式<span style=\";padding: 0px\">9</span>份，《专业目录》中的国家控制布点专业和尚未列入目录的新专业为审批专业，其他专业为备案专业。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">（<span style=\";padding: 0px\">4</span>）《</span><span style=\";padding: 0px;font-size: 21px\">新增本科专业实验室情况表》（附件<span style=\";padding: 0px\">5</span>）一式<span style=\";padding: 0px\">9</span>份，不需要新建实验室的不填。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">（<span style=\";padding: 0px\">5</span>）《普通高等学校本科专业设置申请汇总表》（附件<span style=\";padding: 0px\">6</span>）。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">所有申报材料的纸质版经学院（学部）主要负责人签字，加盖学院（学部）公章后，于<span style=\";padding: 0px\">6</span>月<span style=\";padding: 0px\">22</span>日<span style=\";padding: 0px\">16:00</span>前报送至教务处通识教育与课程建设办公室，</span><span style=\";padding: 0px\"><a href=\"mailto:%E7%94%B5%E5%AD%90%E7%89%88%E5%8F%91%E8%87%B3qdukcb@163.com\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><span style=\";padding: 0px;font-size: 21px;color: windowtext\"><span style=\";padding: 0px\">电子版发至qdukcb@163.com</span></span></a></span><span style=\";padding: 0px;font-size: 21px\">。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">3.</span><span style=\";padding: 0px;font-size: 21px\">专家审议。<span style=\";padding: 0px\">6</span>月底，学校</span><span style=\";padding: 0px;font-size: 21px\">组织</span><span style=\";padding: 0px;font-size: 21px\">专家对专业设置进行审议</span><span style=\";padding: 0px;font-size: 21px\">，形成审议意见。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">4.</span><span style=\";padding: 0px;font-size: 21px\">学校公示并审核。专家审议通过的专业材料在</span><span style=\";padding: 0px;font-size: 21px\">学校网站公示一周</span><span style=\";padding: 0px;font-size: 21px\">，公示无异议后，报学校审核确定。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">5.</span><span style=\";padding: 0px;font-size: 21px\">材料网上提交与公示。</span><span style=\";padding: 0px;font-size: 21px\">7</span><span style=\";padding: 0px;font-size: 21px\">月下旬，学校</span><span style=\";padding: 0px;font-size: 21px\">通过</span><span style=\";padding: 0px;font-size: 21px\">教育部“普通高等学校本科专业公共信息服务与管理平台”</span><span style=\";padding: 0px;font-size: 21px\">提交专业设置申请材料，</span><span style=\";padding: 0px;font-size: 21px\">公示一个月。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;background: white;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">6.</span><span style=\";padding: 0px;font-size: 21px\">材料上报。</span><span style=\";padding: 0px;font-size: 21px\">9</span><span style=\";padding: 0px;font-size: 21px\">月初，</span><span style=\";padding: 0px;font-size: 21px\">公示期满后，学校根据修改意见完善申请材料并报教育厅</span><span style=\";padding: 0px;font-size: 21px\">审批备案。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;background: white;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">&nbsp;</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px;font-family: Calibri, sans-serif\">&nbsp;</span><span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">附件：</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">1.</span><span style=\";padding: 0px;font-size: 21px\">山东省教育厅关于做好<span style=\";padding: 0px\">2018</span>年度高等学校本科专业设置工作的通知（鲁教高字〔<span style=\";padding: 0px\">2018</span>〕<span style=\";padding: 0px\">6</span>号）</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">2.</span><span style=\";padding: 0px;font-size: 21px\">专业撤销（停招）申请表</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">3.</span><span style=\";padding: 0px;font-size: 21px\">普通高等学校本科专业设置申请表<span style=\";padding: 0px\">(</span>备案专业适用<span style=\";padding: 0px\">)</span></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">4.</span><span style=\";padding: 0px;font-size: 21px\">普通高等学校本科专业设置申请表<span style=\";padding: 0px\">(</span>审批专业适用<span style=\";padding: 0px\">)</span></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">5.</span><span style=\";padding: 0px;font-size: 21px\">新增本科专业实验室情况表</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">6.</span><span style=\";padding: 0px;font-size: 21px\">普通高等学校本科专业设置申请汇总表</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">7.</span><span style=\";padding: 0px;font-size: 21px\">山东省教育厅关于公布省属本科高校限制性专业目录和预警专业目录的通知</span></span>\r\n</p>\r\n<p style=\"margin-top: 0px;margin-bottom: 20px;padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDDDGCPLILNLMPOCOHCGBHC\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img alt=\"\" src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550129656013675.gif\"/>附件.rar</a>\r\n</p>\r\n<p style=\"margin-top: 0px;margin-bottom: 20px;padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    &nbsp;\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-align: right;text-indent: 37px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 19px\">2018</span><span style=\";padding: 0px;font-size: 19px\">年<span style=\";padding: 0px\">5</span>月<span style=\";padding: 0px\">15</span>日</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-align: right;text-indent: 37px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 19px\"></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    &nbsp;\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"margin-top: 0px;margin-bottom: 20px;padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <br/>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-align: right;text-indent: 37px\">\r\n    <span style=\";padding: 0px;font-size: 19px\"><span style=\"font-family:仿宋_GB2312\">教务处</span></span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '353', '2018-04-15 00:00:00', '3', '6');
INSERT INTO `article` VALUES ('184', '关于2018年春季学期期末考试安排的通知', '<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 16pt; letter-spacing: 1.5pt;\">关于2018年春季学期期末考试安排的通知</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">各学院、医学部：</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">2018</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">年春季学期期末考试即将开始安排，现将有关事宜通知如下：</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">1.</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">考试时间</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（1）2018年春季学期期末考试日期为2018年6月25日至7月6日，其中考查课为6月25日至6月26日，时长为90分钟，考试时间为上午8:00～9:30，9:50～11:20，下午13:30～15:00，15:20～16:50；考试课为6月27日至7月6日，时长为120分钟，考试时间为上午8:00～10:00，10:20～12:20，下午13:30～15:30，15:50～17:50。最后一门课程考试应安排在7月6日。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">单独编班授课的辅修专业课程期末考试时间定为2018年6月23日～6月24日。通识教育选修课和《中国近现代史纲要》考试时间为最后一次课上课时间，由开课单位按照《青岛大学考试管理规定》组织考试；体育课和实践教学环节应在2018年6月23日之前全部结束并完成考核。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（2）部分通识教育必修课程考试安排如下：</span>\r\n</p>\r\n<table width=\"659\">\r\n    <tbody style=\"margin: 0px; padding: 0px;\">\r\n        <tr style=\"margin: 0px; padding: 0px; height: 42.15pt;\" class=\"firstRow\">\r\n            <td width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-width: 1pt; border-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">考试</span>\r\n                </p>\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">日期</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top-width: 1pt; border-color: windowtext windowtext windowtext rgb(240, 240, 240); border-right-width: 1pt; border-bottom-width: 1pt; border-left-width: initial; border-left-style: initial;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">考试时间</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top-width: 1pt; border-color: windowtext windowtext windowtext rgb(240, 240, 240); border-right-width: 1pt; border-bottom-width: 1pt; border-left-width: initial; border-left-style: initial;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">考试课程</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top-width: 1pt; border-color: windowtext windowtext windowtext rgb(240, 240, 240); border-right-width: 1pt; border-bottom-width: 1pt; border-left-width: initial; border-left-style: initial;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">备注</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 1cm;\">\r\n            <td width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left-width: 1pt; border-left-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">月26日</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">8:00-9:30</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级高等数学</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">Ⅵ（考查课）</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 82.95pt;\">\r\n            <td rowspan=\"4\" width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left-width: 1pt; border-left-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">月27日</span>\r\n                </p>\r\n            </td>\r\n            <td rowspan=\"2\" width=\"81\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">8:00-10:00</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"72\" style=\"margin: 0px; padding: 0cm; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">放音8:30</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学英语Ⅳ</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 7.5pt;\"><span style=\"margin: 0px; padding: 0px; font-size: 7.5pt; font-family: 宋体;\">商学院、数软学院、政公学院，外语学院、经济学院除外</span></span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 44.2pt;\">\r\n            <td width=\"72\" style=\"margin: 0px; padding: 0cm; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">放音9:10</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学英语Ⅱ</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 7.5pt;\"><span style=\"margin: 0px; padding: 0px; font-size: 7.5pt; font-family: 宋体;\">音乐、美术学院，纺院艺术类、新传学院艺术类、体育学院、应用技术学院的春季高考专业</span></span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 70.1pt;\">\r\n            <td rowspan=\"2\" width=\"81\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">10:20-12:20</span>\r\n                </p>\r\n            </td>\r\n            <td rowspan=\"2\" width=\"72\" style=\"margin: 0px; padding: 0cm; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">放音10:50</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学英语Ⅳ</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 7.5pt;\"><span style=\"margin: 0px; padding: 0px; font-size: 7.5pt; font-family: 宋体;\">商学院、数软学院、政公学院，外语学院、经济学院</span></span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 1cm;\">\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学英语VII</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 35.25pt;\">\r\n            <td rowspan=\"3\" width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left-width: 1pt; border-left-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">月28日</span>\r\n                </p>\r\n            </td>\r\n            <td rowspan=\"3\" width=\"81\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">8:00-10:00</span>\r\n                </p>\r\n            </td>\r\n            <td rowspan=\"2\" width=\"72\" style=\"margin: 0px; padding: 0cm; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">放音8:30</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2016</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学英语Ⅵ</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 27.75pt;\">\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2016</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学英语Ⅷ</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 56.8pt;\">\r\n            <td width=\"72\" style=\"margin: 0px; padding: 0cm; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">放音9:10</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2016</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学英语Ⅳ</span>\r\n                </p>\r\n            </td>\r\n            <td valign=\"top\" width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 7.5pt;\">应用技术学院的春季高考专业（对口本科）</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 58.9pt;\">\r\n            <td rowspan=\"3\" width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left-width: 1pt; border-left-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">6</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">月29日</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">8:00-9:30</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级马克思主义基本原理概论</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 7.5pt;\">所有具备该课程考试资格的学生，可进入个人教务空间查看考场安排，只能在指定考场签到并参加考试。</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 55.35pt;\">\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">9:50-11:20</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级马克思主义基本原理概论</span>\r\n                </p>\r\n            </td>\r\n            <td valign=\"top\" width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 7.5pt;\">所有具备该课程考试资格的学生，可进入个人教务空间查看考场安排，只能在指定考场签到并参加考试。</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 44.25pt;\">\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">13:30-15:30</span>\r\n                </p>\r\n            </td>\r\n            <td valign=\"top\" width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2016</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级毛泽东思想和中国特色社会主义理论体系概论（下）</span>\r\n                </p>\r\n            </td>\r\n            <td valign=\"top\" width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 7.5pt;\">所有具备该课程考试资格的学生，可进入个人教务空间查看考场安排，只能在指定考场签到并参加考试。</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 55.4pt;\">\r\n            <td rowspan=\"2\" width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left-width: 1pt; border-left-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">7</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">月2日</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">10:20-12:20</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级高等数学</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">Ⅱ、Ⅲ、</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">Ⅷ、Ⅸ</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 58.05pt;\">\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">13:30-15:30</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级线性代数与概率统计Ⅰ、</span>\r\n                </p>\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">线性代数、概率论I</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 47.05pt;\">\r\n            <td rowspan=\"2\" width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left-width: 1pt; border-left-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">7</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">月3日</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">8:00-10:00</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级高等数学Ⅰ、高等数学Ⅳ（教育技术）、概率论</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">III</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 65.9pt;\">\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">10:20-12:20</span>\r\n                </p>\r\n            </td>\r\n            <td valign=\"top\" width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级大学物理学I（上）、大学物理学II(上)、大学物理学III、普通物理II（上）；2016级普通物理III（上）</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\"></td>\r\n        </tr>\r\n        <tr style=\"margin: 0px; padding: 0px; height: 1cm;\">\r\n            <td width=\"57\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left-width: 1pt; border-left-color: windowtext;\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">7</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">月4日</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"154\" colspan=\"2\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">8:00-11:30</span>\r\n                </p>\r\n            </td>\r\n            <td width=\"244\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">2017</span><span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">级计算机应用基础</span>\r\n                </p>\r\n            </td>\r\n            <td valign=\"top\" width=\"140\" style=\"margin: 0px; padding: 0cm 5.4pt; border-top: rgb(240, 240, 240); border-right-width: 1pt; border-right-color: windowtext; border-bottom-width: 1pt; border-bottom-color: windowtext; border-left: rgb(240, 240, 240);\">\r\n                <p>\r\n                    <span style=\"margin: 0px; padding: 0px; font-size: 9pt;\">具体安排见教务通知</span>\r\n                </p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">备注：请通知参加英语考试的学生自备接收机。</span>\r\n</p>\r\n<p>\r\n    <strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（3）为避免重修学生考试冲突，在通识教育必修课程考试时间内不允许安排任何其他考试科目。</span></strong>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">2.</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">考试安排</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（1）<span style=\"margin: 0px; padding: 0px; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;’Times New Roman’&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">考场编排</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">本次考试考场由开课单位在综合教务系统编排，教室分配基本以教学楼为单位划分小组，小组内学院可以互相协调使用教室。通识教育必修课与专业课考试考场编排同时进行，须在5月21日前完成，考场编排结束后务必进行检查，避免出现学生考试冲突和考试漏排情况，并通知到学生和监考教师。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">通识教育必修课程的考场编排要求如下：</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">开课单位在综合教务系统编排考场，同一课程班尽量安排在同一考场，同一考场尽量安排同一学院监考老师。根据学生人数分配各学院（学部）监考任务，监考任务分配后不得更改，<span style=\"margin: 0px; padding: 0px; color: windowtext;\"><span style=\"margin: 0px; padding: 0px;\">并将监考任务发送至qduyxb@163.com</span></span>，监考任务将在教务处主页公布。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">具体日程：</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">①</span>&nbsp;<span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">5</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">月11日～16日：通识教育必修课开课单位安排考场，分配监考任务；</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">②</span>&nbsp;<span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">5</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">月17日：公布监考任务，各学院（学部）根据本学院须承担的监考任务在综合教务系统编排监考教师，并安排考场巡视；</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">③</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">5</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">月18日：进行考试冲突检查。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">各学院（学部）查询并打印考试安排表，通知学生通过综合教务系统查看个人考试安排、通知教师查看监考任务。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;(2)</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">重修学生考试安排</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">重修和免听学生随所在课程班考试，单独组班重修课程由开课单位安排考场。对不再开设的课程允许不及格学生修读相似或相近课程，考核后按原课程号登录成绩。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;(3)</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">往届生和2018届毕业生不准参加期末考试。</span>&nbsp;\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">3.</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">巡视检查</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">考试期间，各学院应组织巡视，请各学院分管教学院长、分管学生工作书记务必到考试现场巡视。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">4.</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">成绩登录</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">期末考试课程成绩的登录时间为2018年6月23日～7月16日，登录成绩时任课教师应认真核对，确认无误后再行提交。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">5.</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">其他事项</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（1）首次申请采用非闭卷方进行考试的课程，需填写《青岛大学考试方式调整申请表》，开课单位审批通过后报教务处备案后实施。命题教师或命题组需明确规定学生可携带的书籍、材料的范围。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（2）请各开课单位将考试方式（闭卷/开卷）、必备的考试用品（计算器等）及时通知各学院；若考试中需用计算器，请命题教师在试卷上注明。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（3）各学院认真填写《青岛大学试卷印刷登记表》和《青岛大学试卷付印存根》，并指派专人在考前两周将试卷交教务处教学服务中心统一印制，送交的试卷须按学校统一模板设计制作，并用A4纸打印，确保文字、图表和公式规范、清楚。试卷在考试前属学校机密文件，所有接触试题的人员不得以任何方式泄漏试题。</span>\r\n</p>\r\n<p>\r\n    &nbsp;<span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（4）缓考</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">因病申请缓考者，须有校医院证明。学生的缓考申请由学生所在学院在教务系统缓考管理模块进行审核批准。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（5）考试期间需彻底清场，请各学院通知所有学生提前带走教室个人物品，否则作为无主物品处理。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">（6）试卷发放和回收地点：浮山校区静思1号楼304室（静思1号楼和静思2号楼），东12教101室(东12教和学思楼试卷收发点)，博学楼110室，博知楼110室，博文楼330室，博远楼110室，德音楼102室；金家岭校区西院1号教学楼105室（西1教和西2号实验楼试卷收发点），西院2号教学楼105室（西2教和图文中心试卷收发点），东院2号楼106室；其他校区本着方便的原则安排。</span>\r\n</p>\r\n<p>\r\n    &nbsp;\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDCDJCPLILNLMPODBCOLIKBMJLNNAKDMHPIMGNKMEKJLPLMMKNELNMMMKNCLHNGMFOECOHIGMHD\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);\"><img alt=\"\" src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550224983057925.gif\"/>附件1.浮山校区期末考试教室分配.xls</a></span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDDDACPLILNLMPODCCOLNPALMNCMBOLNAKDMHPIMGNKMEKJLPLMMKNELNMMMKNCLHNGMFOECOHIGMHD\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);\"><img alt=\"\" src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550224983057925.gif\"/>附件2.金家岭校区期末考试教室分配.xls</a></span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDDDBCPLILNLMPODDCOLIKINANONHKINCLFMGNKMEKJLPLMMKNELNMMMKNCLHNGMFOECOHIGMHD\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);\"><img alt=\"\" src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550224983057925.gif\"/>附件3.辅修专业期末考试教室分配.xls</a></span>\r\n</p>\r\n<p>\r\n    &nbsp;\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt; letter-spacing: 1.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;<span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">教务处<span style=\"margin: 0px; padding: 0px;\">&nbsp;&nbsp;&nbsp;</span></span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">2018</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">年5月14日</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\"><br/></span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '353', '2018-04-17 00:00:00', '3', '5');
INSERT INTO `article` VALUES ('185', '关于报送2018年夏秋季学期通识教育选修课新增设课程备案材料的通知', '<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">各学院（学部）及相关单位：</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">根据《青岛大学通识教育选修课程建设与管理办法》（青大教字〔<span style=\";padding: 0px\">2017</span>〕<span style=\";padding: 0px\">7</span>号）（附件<span style=\";padding: 0px\">1</span>）的要求，相关内容强调如下：</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">1.</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">凡已获准开设课程，每学年连续开设，不再组织课程评审和审核。</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">2.</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">连续两学期不能开课的（含因选课人数不足<span style=\";padding: 0px\">30</span>人而停开的），</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">再次开课时要重新申报和评审</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">。</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">3.</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">拟在<span style=\";padding: 0px\">2018</span>年夏秋季学期</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">新开设的通识教育选修课</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">，按管理办法第十二条执行。</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">各单位于<span style=\";padding: 0px\">5</span>月<span style=\";padding: 0px\">17</span>日下午<span style=\";padding: 0px\">4</span>：<span style=\";padding: 0px\">00</span>前将新开课程《青岛大学通识教育选修课程申请表》（附件<span style=\";padding: 0px\">2</span>）、课程教学大纲、教学日历、课件、教材信息和《青岛大学通识教育课程审核结果汇总表》（附件<span style=\";padding: 0px\">3</span>）等相关材料纸质版送交通识教育与课程建设办公室备案，电子版以“<span style=\";padding: 0px\">xx</span>学院（学部）<span style=\";padding: 0px\">2018</span>年夏秋季学期通识教育课程新开课备案材料”命名发送至<span style=\";padding: 0px\">qdukcb@163.com</span>。</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">联 系 人：席岩</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">联系电话：<span style=\";padding: 0px\">85953757</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">附件<span style=\";padding: 0px\">1</span>：青大教字〔<span style=\";padding: 0px\">2017</span>〕<span style=\";padding: 0px\">7</span>号关于印发《青岛大学通识教育选修课程建设与管理办法》的通知</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">附件<span style=\";padding: 0px\">2</span>：青岛大学通识教育选修课程申请表</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">附件<span style=\";padding: 0px\">3</span>：青岛大学通识教育课程审核结果汇总表</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-align: right;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">教务处<span style=\";padding: 0px\"><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-align: right;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">2018</span><span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">年<span style=\";padding: 0px\">5</span>月<span style=\";padding: 0px\">11</span>日</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-family: 仿宋_GB2312;font-size: 21px\">&nbsp;<a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDCDDCPLILNLMPODBKDLKMHOALEPDLNMMNHNGKBLCDCDADBDHKBLDDHLKMFLJNINDNKNDKBLHKCKBLGMHOALFLKLEPDNBKHMNKIMKLGLNMMNDPNNBKBNANOLPMOLDMMLNKIMJOINDOLLJNMMAONLAOMLHKIKBLHLFMEMNKINGKKCOHAGEGG\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550317444096739.gif\" alt=\"\"/>附件1：青大教字〔2017〕7号关于印发《青岛大学通识教育选修课程建设与管理办法》的通知.pdf</a><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDCDECPLILNLMPODCKDLKMHOALFLKLEPDNBKHMNKIMKLGLNMMNDPNNBKBNANOLPMOLDMMMJOKLBKILBONCOGEGPGD\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550317444096739.gif\" alt=\"\"/>附件2：青岛大学通识教育选修课程申报表.doc</a><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDCDFCPLILNLMPODDKDLKMHOALFLKLEPDNBKHMNKIMKLGLNMMNDPNNBKBNANOLPMOLDMMMJPDLKMLLNOBLJPLLLODNHNMLBONCOHIGMHD\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550317444096739.gif\" alt=\"\"/>附件3：青岛大学通识教育选修课程审核结果汇总表.xls</a></span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '352', '2018-04-17 00:00:00', '3', '4');
INSERT INTO `article` VALUES ('186', '关于暂停办理出国成绩单审核的通知', '<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">各单位：</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\";padding: 0px\"><span style=\"font-family:Calibri\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">因</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">5</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">月</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">15</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">日</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">-16</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">日集中进行</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">2015</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">级本科生电子注册图像采集工作，注册办这两天暂停办理出国成绩、校际课程学分认定审核工作，周四恢复正常办理。特此通知。</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\"><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">&nbsp;</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">&nbsp;</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\"><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\";padding: 0px\">&nbsp;</span><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">教务处</span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\"><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span>2018</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">年</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">5</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">月</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:Calibri\">11</span></span><span style=\";padding: 0px;font-size: 21px;font-family: 宋体\">日</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '355', '2018-04-23 00:00:00', '3', '3');
INSERT INTO `article` VALUES ('187', '关于2018届本科毕业论文（设计）复检工作通知', '<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">各学院、医学部：</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">根据<a class=\"FCK__AnchorC\" style=\"margin: 0px; padding: 0px;\">《关于开展2018届本科毕业论文（设计）文字复制比检测通知》</a>要求， 2018届本科毕业论文（设计）复检工作于5月11日开展，具体要求如下：</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">一、2018届学士学位论文初次检测结果请从中国知网“大学生论文管理系统”查</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">看下载，论文文字复制比以去除引用部分后的复制比为准。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">二、初检文字复制比在30%以下（含30%）的论文视为通过检测，学生在教师指导下，进一步修改论文后可参加答辩。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">三、初检文字复制比在30%～50%之间（含50%）的论文，学院须将下载的论文检测报告反馈相关指导教师和学生，由指导教师认真指导学生进行论文修改，修改后的论文必须进行复检。复检论文上传截止日期为5月15日。</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">复检后的文字复制比降至30%以下者，视为通过检测，若仍高于30%，将直接取消本次论文答辩资格。</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">四、初检文字复制比达到50%以上的论文，学院（教学部）学位评定分委员会要成立不少于３名专家的调查小组进行调查认定。调查小组可邀请校外专家参加，利益相关人员要进行回避。调查小组可根据情况要求当事人、举报者或其他相关人员提供相关证据或证明材料。调查结束后，要形成全体专家签字的书面调查报告，对是否存在作假行为有明确意见。学位评定分委员会根据认定结论提出处理建议。在正式做出处理建议前，应将调查情况和处理建议告知当事人并听取当事人的陈述和申辩。书面调查报告及<span style=\"margin: 0px; padding: 0px;\">《</span></span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">青岛大学学士学位论文作假行为调查处理意见表》（见附件）</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">于5月14日下午16：00前报教务处审批。</span>\r\n</p>\r\n<p>\r\n    &nbsp;\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">办公电话：85953560</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">联系人：武旻华</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">办公地点：办公楼102房间</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">附件：</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDBDDCPMHOALFLKLEPDNBKHNBKHMKLPNBKHMOLLMCNLMOMENHPHLMNJNANAMOKKLFPHLCOJLEKGMAONNCOCLMPLLBONCOGEGPGD\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);\"><img src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550507721024803.gif\" alt=\"\"/>青岛大学学士学位论文作假行为调查处理意见表.doc</a></span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">教务处</span>\r\n</p>\r\n<p>\r\n    <span style=\"margin: 0px; padding: 0px; font-size: 14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018-05-10</span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '363', '2018-04-24 00:00:00', '3', '2');
INSERT INTO `article` VALUES ('188', '关于2018年夏秋学期专业人才培养方案调整备案的通知', '<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">各学院，医学部：</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">根据学校排课工作总体进度安排，现进行<span style=\";padding: 0px\">2018</span>年夏季学期和秋季学期专业人才培养方案调整备案工作，具体事宜通知如下：</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">一、调整要求</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">1.</span><span style=\";padding: 0px;font-size: 21px\">培养方案调整备案</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">各学院（学部）须严格按照专业人才培养方案，安排每学期的开课计划及任课教师。如因特殊情况确需调整的，填写《青岛大学本科人才培养方案调整备案表》（见附件<span style=\";padding: 0px\">1</span>），经学院（学部）审核、教务处备案后方可执行。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">根据《青岛大学本科教学管理工作评价指标体系（<span style=\";padding: 0px\">2016</span>年<span style=\";padding: 0px\">8</span>月修订）》（青大教字（<span style=\";padding: 0px\">2016</span>）<span style=\";padding: 0px\">11</span>号），每学期每个专业的人才培养方案调整课程门数最多为<span style=\";padding: 0px\">2</span>门，达到<span style=\";padding: 0px\">3</span>门的扣减<span style=\";padding: 0px\">1</span>个指标分值（<span style=\";padding: 0px\">200</span>分），每多调整<span style=\";padding: 0px\">1</span>门扣<span style=\";padding: 0px\">1</span>个指标分值。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">2.</span><span style=\";padding: 0px;font-size: 21px\">新开设课程备案</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">若调整涉及新开设课程，填写《青岛大学本科人才培养方案调整备案表》，并提交新开课程信息一览表（附件<span style=\";padding: 0px\">2</span>）和课程教学大纲（中、英文版，内容及格式见附件<span style=\";padding: 0px\">3</span>），经学院（学部）审核，报教务处备案后方可开设。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">二、材料报送要求</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">学院（学部）的调整材料，包括《青岛大学本科人才培养方案调整备案表》一式二份，新开课程信息一览表、课程教学大纲中、英文版各一份，全部双面打印，经分管领导签字、盖章后，于<span style=\";padding: 0px\">2018</span>年<span style=\";padding: 0px\">5</span>月<span style=\";padding: 0px\">18</span>日<span style=\";padding: 0px\">11:00</span>前报送教务处通识教育与课程建设办公室；以上材料的电子版和青岛大学本科人才培养方案调整备案汇总表（<span style=\";padding: 0px\">excel</span>表格，附件<span style=\";padding: 0px\">4</span>）同时发送至</span></span><span style=\";padding: 0px;font-size: 21px;font-family: &#39;Times New Roman&#39;, serif\">qdukcb@163.com</span><span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">。</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">&nbsp;</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">&nbsp;</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">附件：</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDADGCPLILNLMPODBKDLKMHOALFLKLEPDNBKHLBLOLPMGMIMLLCMFMFOANBPILHLNLALILFPHNFPLLBLILALILBONCOGEGPGD\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img alt=\"\" src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550570428062388.gif\"/>附件1：青岛大学本科人才培养方案调整备案表.doc</a></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDADHCPLILNLMPODCKDLKNAMCLPKKLPMOLDMMNAMFMPKCNCLLMAMALBONKDKILBOKMMOCLLMGLFNHLFMEMALIMELPMOKKLBNIMMOOMPOOKDKJCOHIGMHD\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img alt=\"\" src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550570428062388.gif\"/>附件2：新开课程信息一览表.xls</a></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDADICPLILNLMPODDKDLKMHOALFLKLEPDNBKHLBLOLPMGLPMOLDMMLNMMNBKHLEPDLINJLFMELLPJLBLOMENKMINNLMLALIPBMKLNCOGEGPGD\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img alt=\"\" src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550570428062388.gif\"/>附件3：青岛大学本科课程教学大纲的基本内容及格式.doc</a></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\"><a href=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DBCPDCDDDBDBDCCPLILNLMPODEKDLKMFOANBPILHLNLALILFPHNFPLLBLILALILLODNHNMLBONCOHIGMHDHI\" style=\";padding: 0px;color: rgb(0, 0, 0)\"><img src=\"/shetuan/ueditor/jsp/upload/image/20180517/1526550570428062388.gif\" alt=\"\"/>附件4：青岛大学本科人才培养方案调整备案汇总表.xlsx</a></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">&nbsp;</span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-align: right;text-indent: 43px\">\r\n    <span style=\";padding: 0px;font-size: 21px\"><span style=\"font-family:仿宋_GB2312\">教 务 处<span style=\";padding: 0px\"><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp;</span></span></span></span>\r\n</p>\r\n<p style=\";padding: 0px;font-family: Arial, Verdana, sans-serif;font-size: 13px;letter-spacing: 2px;white-space: normal;text-align: right;text-indent: 43px\">\r\n    <span style=\"font-family:仿宋_GB2312\"><span style=\";padding: 0px;font-size: 21px\">2018</span><span style=\";padding: 0px;font-size: 21px\">年<span style=\";padding: 0px\">5</span>月<span style=\";padding: 0px\">11</span>日</span></span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '365', '2018-04-25 00:00:00', '3', '1');
INSERT INTO `article` VALUES ('189', '生命科学学院举办食品科学与工程专业认证专家报告会', '<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; font-family: Arial, Verdana, sans-serif; font-size: 13px; letter-spacing: 2px; white-space: normal;\">\r\n    &nbsp; &nbsp;<span style=\"font-size:18px;font-family:宋体\">&nbsp;&nbsp; 为不断提高人才培养质量，推进生命科学学院专业建设，增强广大教师对专业认证工作重要性的认识，给即将开展的专业认证工作打下坚实基础，2018年4月2日下午生命科学学院在青岛大学国际学术交流中心“求实厅”举办了食品科学与工程专业认证专家报告会。&nbsp;<br/>&nbsp;&nbsp;&nbsp; 会议邀请了教育部食品科学与工程专业教育认证协会原秘书长、教育部食品科学与工程专业教育认证核心专家组成员、教育部食品科学与工程类专业教学指导委员会委员、中国海洋大学三亚研究生院院长、博士生导师曾名湧教授做了题为“准确理解和把握认证标准，认真做好专业认证自评工作”的报告。曾名湧教授从专业认证的背景与意义、食品科学与工程专业认证现状、理解和落实OBE理念、专业认证标准构成、标准的内在逻辑关系、专业认证标准的内涵以及专业认证特点七个方面进行了详细解读，深化了与会教师的认识，大家纷纷表示受益匪浅。&nbsp;<br/>&nbsp;&nbsp;&nbsp; 生命科学学院院长李荣贵主持报告会，学院党委书记薛冰、院长助理石超、生命科学学院教师以及化学化工学院等兄弟单位的部分师生参加了报告会。</span>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; font-family: Arial, Verdana, sans-serif; font-size: 13px; letter-spacing: 2px; white-space: normal;\">\r\n    <span style=\"font-size:18px;font-family:宋体\"></span>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 20px; padding: 0px; font-family: Arial, Verdana, sans-serif; font-size: 13px; letter-spacing: 2px; white-space: normal;\">\r\n    <span style=\"font-size:18px;font-family:宋体\"><img src=\"http://jw.qdu.edu.cn/homepage/downloadTheolFile.do?id=DACPDCDDDADBDHCPCGCDDCDEDEDJDEDLCGCDDCDADEDEDJDLCGCDDCDCDCDHDADLCGCDDCDJDCDFDFDLFPDCDADBDIDADEDADDDBDADBDIDCDDCOGKHAGH\" width=\"100%\" height=\"100%\" alt=\"\"/></span>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '366', '2018-04-26 00:00:00', '3', '3');
INSERT INTO `article` VALUES ('190', '羽毛球社简介', '暂无', '558', '暂无', '2', '3');

-- ----------------------------
-- Table structure for assn
-- ----------------------------
DROP TABLE IF EXISTS `assn`;
CREATE TABLE `assn` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOGNAME` varchar(3) NOT NULL COMMENT '社团编号',
  `ASSNNAME` varchar(50) NOT NULL COMMENT '社团名称',
  `DIRECTOR` varchar(50) NOT NULL COMMENT '负责人姓名',
  `PHONE` varchar(11) NOT NULL COMMENT '联系电话',
  `LEVEL` varchar(5) NOT NULL COMMENT '社团级别（1：校级，2：院级，3：社联级）',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGNAME` (`LOGNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='社团表';

-- ----------------------------
-- Records of assn
-- ----------------------------
INSERT INTO `assn` VALUES ('1', '101', '校自强社', '刘尚鹏', '13000000001', '1');
INSERT INTO `assn` VALUES ('2', '102', '校学生会', '孙扶摇', '13000000004', '1');
INSERT INTO `assn` VALUES ('3', '103', '德鲁克管理协会', '李磊', '13000000008', '1');
INSERT INTO `assn` VALUES ('4', '104', '校艺术团', '李安娜', '13000000009', '1');
INSERT INTO `assn` VALUES ('5', '105', '文明督导岗', '邢丽斌', '13000000010', '1');
INSERT INTO `assn` VALUES ('6', '106', '社团联合会', '张铭正', '13000000012', '1');
INSERT INTO `assn` VALUES ('7', '107', '国旗班', '涂笙晚', '13000000014', '1');
INSERT INTO `assn` VALUES ('9', '201', '商学院学生会', '王田磊', '13000000002', '2');
INSERT INTO `assn` VALUES ('10', '202', '经济学院学生会', '孔健', '13000000003', '2');
INSERT INTO `assn` VALUES ('11', '203', '文学院学生会', '张文燕', '13000000005', '2');
INSERT INTO `assn` VALUES ('12', '204', '机电学院学生会', '邵明轩', '13000000006', '2');
INSERT INTO `assn` VALUES ('13', '205', '化工学院学生会', '曾敏', '13000000007', '2');
INSERT INTO `assn` VALUES ('14', '206', '外语学院学生会', '苏子桐', '13000000011', '2');
INSERT INTO `assn` VALUES ('15', '207', '法学院学生会', '马仲遥', '13000000013', '2');
INSERT INTO `assn` VALUES ('16', '301', '乒乓球社', '姚圆圆', '13216542315', '3');
INSERT INTO `assn` VALUES ('18', '306', '羽毛球社', '李林真', '13061370929', '3');

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ASSNID` int(11) NOT NULL COMMENT '社团id',
  `LOGNAME` varchar(5) NOT NULL COMMENT '部门编号',
  `DEPNAME` varchar(20) NOT NULL COMMENT '部门名',
  `LEVEL` varchar(5) NOT NULL COMMENT '部门级别（1：高级，2：普通）',
  `INTRO` longtext COMMENT '部门介绍',
  PRIMARY KEY (`ID`),
  KEY `dep_assnID` (`ASSNID`),
  CONSTRAINT `dep_assnID` FOREIGN KEY (`ASSNID`) REFERENCES `assn` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('2', '1', '10100', '主席团', '1', '主席团');
INSERT INTO `depart` VALUES ('3', '1', '10101', '秘书处', '2', '秘书处是联系各部门的纽带，有着组织各部门协同工作、融合部门成员关系的作用');
INSERT INTO `depart` VALUES ('4', '1', '10102', '勤工部', '2', null);
INSERT INTO `depart` VALUES ('5', '1', '10103', '公益部', '2', null);
INSERT INTO `depart` VALUES ('6', '1', '10104', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('7', '1', '10105', '实践部', '2', null);
INSERT INTO `depart` VALUES ('8', '2', '10200', '主席团', '1', null);
INSERT INTO `depart` VALUES ('9', '2', '10201', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('10', '2', '10202', '办公室', '2', null);
INSERT INTO `depart` VALUES ('11', '2', '10203', '组织部', '2', null);
INSERT INTO `depart` VALUES ('12', '2', '10204', '自律部', '2', null);
INSERT INTO `depart` VALUES ('13', '2', '10205', '社会实践部', '2', null);
INSERT INTO `depart` VALUES ('14', '2', '10206', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('15', '2', '10207', '技术部', '2', null);
INSERT INTO `depart` VALUES ('16', '2', '10208', '新闻中心', '2', null);
INSERT INTO `depart` VALUES ('17', '2', '10209', '新媒体中心', '2', null);
INSERT INTO `depart` VALUES ('18', '2', '10210', '学术中心', '2', null);
INSERT INTO `depart` VALUES ('19', '2', '10211', '科技创新部', '2', null);
INSERT INTO `depart` VALUES ('20', '2', '10212', '生活部', '2', null);
INSERT INTO `depart` VALUES ('21', '2', '10213', '权益部', '2', null);
INSERT INTO `depart` VALUES ('22', '2', '10214', '调研中心', '2', null);
INSERT INTO `depart` VALUES ('23', '2', '10215', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('24', '2', '10216', '女生部', '2', null);
INSERT INTO `depart` VALUES ('25', '2', '10217', '体育部', '2', null);
INSERT INTO `depart` VALUES ('26', '2', '10218', '文明礼仪宣讲团', '2', null);
INSERT INTO `depart` VALUES ('27', '3', '10300', '主席团', '1', null);
INSERT INTO `depart` VALUES ('28', '3', '10301', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('29', '3', '10302', '教学教研部', '2', null);
INSERT INTO `depart` VALUES ('30', '3', '10303', '人力资源部', '2', null);
INSERT INTO `depart` VALUES ('31', '3', '10304', '公关部', '2', null);
INSERT INTO `depart` VALUES ('32', '3', '10305', '业务拓展部', '2', null);
INSERT INTO `depart` VALUES ('33', '4', '10400', '主席团', '1', null);
INSERT INTO `depart` VALUES ('34', '4', '10401', '舞台美术', '2', null);
INSERT INTO `depart` VALUES ('35', '4', '10402', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('36', '4', '10403', '声乐队', '2', null);
INSERT INTO `depart` VALUES ('37', '4', '10404', '外联队', '2', null);
INSERT INTO `depart` VALUES ('38', '4', '10405', '微电影剧组', '2', null);
INSERT INTO `depart` VALUES ('39', '4', '10406', '新媒体中心', '2', null);
INSERT INTO `depart` VALUES ('40', '4', '10407', '舞台监督', '2', null);
INSERT INTO `depart` VALUES ('41', '4', '10408', '曲艺队', '2', null);
INSERT INTO `depart` VALUES ('42', '4', '10409', '舞蹈队', '2', null);
INSERT INTO `depart` VALUES ('43', '4', '10410', '器乐队', '2', null);
INSERT INTO `depart` VALUES ('44', '4', '10411', '礼仪队', '2', null);
INSERT INTO `depart` VALUES ('45', '4', '10412', '宣传队', '2', null);
INSERT INTO `depart` VALUES ('46', '4', '10413', '自律队', '2', null);
INSERT INTO `depart` VALUES ('47', '5', '10500', '主席团', '1', null);
INSERT INTO `depart` VALUES ('48', '5', '10501', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('49', '5', '10502', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('50', '5', '10503', '实践部', '2', null);
INSERT INTO `depart` VALUES ('51', '5', '10504', '外联部', '2', null);
INSERT INTO `depart` VALUES ('52', '5', '10505', '督导部', '2', null);
INSERT INTO `depart` VALUES ('53', '5', '10506', '膳宣部', '2', null);
INSERT INTO `depart` VALUES ('54', '5', '10507', '新闻中心', '2', null);
INSERT INTO `depart` VALUES ('55', '6', '10600', '主席团', '1', null);
INSERT INTO `depart` VALUES ('56', '6', '10601', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('57', '6', '10602', '社会实践部', '2', null);
INSERT INTO `depart` VALUES ('58', '6', '10603', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('59', '6', '10604', '体育部', '2', null);
INSERT INTO `depart` VALUES ('60', '6', '10605', '志愿者服务部', '2', null);
INSERT INTO `depart` VALUES ('61', '6', '10606', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('62', '6', '10607', '外联部', '2', null);
INSERT INTO `depart` VALUES ('63', '7', '10700', '主席团', '1', null);
INSERT INTO `depart` VALUES ('64', '7', '10701', '仪仗队', '2', null);
INSERT INTO `depart` VALUES ('65', '7', '10702', '网宣部', '2', null);
INSERT INTO `depart` VALUES ('66', '7', '10703', '办公室', '2', null);
INSERT INTO `depart` VALUES ('67', '7', '10704', '外联部', '2', null);
INSERT INTO `depart` VALUES ('69', '9', '20100', '主席团', '1', null);
INSERT INTO `depart` VALUES ('70', '9', '20101', '生活部', '2', null);
INSERT INTO `depart` VALUES ('71', '9', '20102', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('72', '9', '20103', '学术部', '2', null);
INSERT INTO `depart` VALUES ('73', '9', '20104', '体育部', '2', null);
INSERT INTO `depart` VALUES ('74', '9', '20105', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('75', '9', '20106', '新闻媒体中心', '2', null);
INSERT INTO `depart` VALUES ('76', '9', '20107', '艺术团', '2', null);
INSERT INTO `depart` VALUES ('77', '9', '20108', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('78', '10', '20200', '主席团', '1', null);
INSERT INTO `depart` VALUES ('79', '10', '20201', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('80', '10', '20202', '实践部', '2', null);
INSERT INTO `depart` VALUES ('81', '10', '20203', '学术部', '2', null);
INSERT INTO `depart` VALUES ('82', '10', '20204', '体育部', '2', null);
INSERT INTO `depart` VALUES ('83', '10', '20205', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('84', '10', '20206', '技术部', '2', null);
INSERT INTO `depart` VALUES ('85', '10', '20207', '自律部', '2', null);
INSERT INTO `depart` VALUES ('86', '10', '20208', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('87', '10', '20209', '艺术团', '2', null);
INSERT INTO `depart` VALUES ('88', '10', '20210', '媒体中心记者组', '2', null);
INSERT INTO `depart` VALUES ('89', '10', '20211', '媒体中心摄影组', '2', null);
INSERT INTO `depart` VALUES ('90', '10', '20212', '媒体中心新媒体组', '2', null);
INSERT INTO `depart` VALUES ('91', '10', '20213', '经彩青春志愿服务队', '2', null);
INSERT INTO `depart` VALUES ('92', '10', '20214', '读书协会', '2', null);
INSERT INTO `depart` VALUES ('93', '10', '20215', '创新创业协会', '2', null);
INSERT INTO `depart` VALUES ('94', '11', '20300', '主席团', '1', null);
INSERT INTO `depart` VALUES ('95', '11', '20301', '学术部', '2', null);
INSERT INTO `depart` VALUES ('96', '11', '20302', '调研部', '2', null);
INSERT INTO `depart` VALUES ('97', '11', '20303', '实践部', '2', null);
INSERT INTO `depart` VALUES ('98', '11', '20304', '体育部', '2', null);
INSERT INTO `depart` VALUES ('99', '11', '20305', '媒体运营部', '2', null);
INSERT INTO `depart` VALUES ('100', '11', '20306', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('101', '11', '20307', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('102', '11', '20308', '新闻中心', '2', null);
INSERT INTO `depart` VALUES ('103', '11', '20309', '生活卫生部', '2', null);
INSERT INTO `depart` VALUES ('104', '11', '20310', '自律部', '2', null);
INSERT INTO `depart` VALUES ('105', '11', '20311', '科创部', '2', null);
INSERT INTO `depart` VALUES ('106', '11', '20312', '社团部', '2', null);
INSERT INTO `depart` VALUES ('107', '11', '20313', '就业部', '2', null);
INSERT INTO `depart` VALUES ('108', '12', '20400', '主席团', '1', null);
INSERT INTO `depart` VALUES ('109', '12', '20401', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('110', '12', '20402', '生活部', '2', null);
INSERT INTO `depart` VALUES ('111', '12', '20403', '自律部', '2', null);
INSERT INTO `depart` VALUES ('112', '12', '20404', '学习部', '2', null);
INSERT INTO `depart` VALUES ('113', '12', '20405', '办公室', '2', null);
INSERT INTO `depart` VALUES ('114', '12', '20406', '体育部', '2', null);
INSERT INTO `depart` VALUES ('115', '12', '20407', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('116', '12', '20408', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('117', '12', '20409', '新媒体中心', '2', null);
INSERT INTO `depart` VALUES ('118', '12', '20410', '技术中心', '2', null);
INSERT INTO `depart` VALUES ('119', '13', '20500', '主席团', '1', null);
INSERT INTO `depart` VALUES ('120', '13', '20501', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('121', '13', '20502', '体育部', '2', null);
INSERT INTO `depart` VALUES ('122', '13', '20503', '自律部', '2', null);
INSERT INTO `depart` VALUES ('123', '13', '20504', '学术部', '2', null);
INSERT INTO `depart` VALUES ('124', '13', '20505', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('125', '13', '20506', '校友联络部', '2', null);
INSERT INTO `depart` VALUES ('126', '13', '20507', '新闻与宣传中心', '2', null);
INSERT INTO `depart` VALUES ('127', '13', '20508', '青年志愿者协会', '2', null);
INSERT INTO `depart` VALUES ('128', '14', '20600', '主席团', '1', null);
INSERT INTO `depart` VALUES ('129', '14', '20601', '新闻中心', '2', null);
INSERT INTO `depart` VALUES ('130', '14', '20602', '科创部', '2', null);
INSERT INTO `depart` VALUES ('131', '14', '20603', '生活部', '2', null);
INSERT INTO `depart` VALUES ('132', '14', '20604', '办公室', '2', null);
INSERT INTO `depart` VALUES ('133', '14', '20605', '学术部', '2', null);
INSERT INTO `depart` VALUES ('134', '14', '20606', '外联部', '2', null);
INSERT INTO `depart` VALUES ('135', '14', '20607', '宣传部', '2', null);
INSERT INTO `depart` VALUES ('136', '14', '20608', '校友事务部', '2', null);
INSERT INTO `depart` VALUES ('137', '14', '20609', '体育部', '2', null);
INSERT INTO `depart` VALUES ('138', '14', '20610', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('139', '15', '20700', '主席团', '1', null);
INSERT INTO `depart` VALUES ('140', '15', '20701', '秘书处', '2', null);
INSERT INTO `depart` VALUES ('141', '15', '20702', '学术部', '2', null);
INSERT INTO `depart` VALUES ('142', '15', '20703', '体育部', '2', null);
INSERT INTO `depart` VALUES ('143', '15', '20704', '外联部', '2', null);
INSERT INTO `depart` VALUES ('144', '15', '20705', '新闻媒体中心', '2', null);
INSERT INTO `depart` VALUES ('145', '15', '20706', '文艺部', '2', null);
INSERT INTO `depart` VALUES ('146', '15', '20707', '实践部', '2', null);
INSERT INTO `depart` VALUES ('147', '16', '30100', '主席团', '1', null);
INSERT INTO `depart` VALUES ('153', '18', '30600', '主席团', '1', null);
INSERT INTO `depart` VALUES ('154', '1', '10189', '测试部', '2', null);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PARENTID` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父节点id',
  `VALUE` varchar(10) NOT NULL COMMENT '键值',
  `LABEL` varchar(20) NOT NULL COMMENT '键名',
  `TYPE` varchar(20) NOT NULL COMMENT '类型',
  `DESCRIPTION` varchar(50) NOT NULL COMMENT '描述',
  `SORT` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `TYPE` (`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', '0', '1', '网站通知', 'ARTI_SECA', '文章一级版块', '10');
INSERT INTO `dict` VALUES ('2', '0', '2', '社团简介', 'ARTI_SECA', '文章一级版块', '20');
INSERT INTO `dict` VALUES ('3', '0', '3', '社团动态', 'ARTI_SECA', '文章一级版块', '30');
INSERT INTO `dict` VALUES ('4', '1', '1', '网站通知', 'ARTI_SECB', '文章二级版块', '70');
INSERT INTO `dict` VALUES ('8', '3', '1', '纳新动态', 'ARTI_SECB', '文章二级版块', '10');
INSERT INTO `dict` VALUES ('9', '3', '2', '赛事要闻', 'ARTI_SECB', '文章二级版块', '20');
INSERT INTO `dict` VALUES ('10', '3', '3', '公益传播', 'ARTI_SECB', '文章二级版块', '30');
INSERT INTO `dict` VALUES ('11', '3', '4', '换届公告', 'ARTI_SECB', '文章二级版块', '40');
INSERT INTO `dict` VALUES ('12', '3', '5', '师生风采', 'ARTI_SECB', '文章二级版块', '50');
INSERT INTO `dict` VALUES ('13', '3', '6', '其他信息', 'ARTI_SECB', '文章二级版块', '60');
INSERT INTO `dict` VALUES ('14', '0', '1', '已置顶', 'CAROUSEL', '轮播状态', '10');
INSERT INTO `dict` VALUES ('15', '0', '2', '未置顶', 'CAROUSEL', '轮播状态', '20');
INSERT INTO `dict` VALUES ('16', '0', '1', '校级', 'ASSN', '社团级别', '10');
INSERT INTO `dict` VALUES ('17', '0', '2', '院级', 'ASSN', '社团级别', '20');
INSERT INTO `dict` VALUES ('18', '0', '3', '社联级', 'ASSN', '社团级别', '30');
INSERT INTO `dict` VALUES ('20', '0', '1', '高级', 'DEP', '部门级别', '10');
INSERT INTO `dict` VALUES ('21', '0', '2', '普通', 'DEP', '部门级别', '20');
INSERT INTO `dict` VALUES ('22', '0', '1', '部长', 'DIREC', '部长职务', '10');
INSERT INTO `dict` VALUES ('23', '0', '2', '副部长', 'DIREC', '部长职务', '20');
INSERT INTO `dict` VALUES ('24', '0', '1', '待审核', 'ENROLL', '报名状态', '10');
INSERT INTO `dict` VALUES ('25', '0', '2', '审核通过', 'ENROLL', '报名状态', '20');
INSERT INTO `dict` VALUES ('26', '0', '3', '初试通过', 'ENROLL', '报名状态', '30');
INSERT INTO `dict` VALUES ('27', '0', '4', '复试通过', 'ENROLL', '报名状态', '40');
INSERT INTO `dict` VALUES ('28', '0', '5', '审核淘汰', 'ENROLL', '报名状态', '50');
INSERT INTO `dict` VALUES ('29', '0', '6', '初试淘汰', 'ENROLL', '报名状态', '60');
INSERT INTO `dict` VALUES ('30', '0', '7', '复试淘汰', 'ENROLL', '报名状态', '70');
INSERT INTO `dict` VALUES ('31', '0', '1', '试用', 'MEMBER', '工位状态', '10');
INSERT INTO `dict` VALUES ('32', '0', '2', '正式', 'MEMBER', '工位状态', '20');
INSERT INTO `dict` VALUES ('33', '0', '3', '离职', 'MEMBER', '工位状态', '30');
INSERT INTO `dict` VALUES ('36', '0', '1', '阿昌族', 'NATION', '民族', '10');
INSERT INTO `dict` VALUES ('37', '0', '2', '白族', 'NATION', '民族', '20');
INSERT INTO `dict` VALUES ('38', '0', '3', '保安族', 'NATION', '民族', '30');
INSERT INTO `dict` VALUES ('39', '0', '4', '布朗族', 'NATION', '民族', '40');
INSERT INTO `dict` VALUES ('40', '0', '5', '布依族', 'NATION', '民族', '50');
INSERT INTO `dict` VALUES ('41', '0', '6', '朝鲜族', 'NATION', '民族', '60');
INSERT INTO `dict` VALUES ('42', '0', '7', '达斡尔族', 'NATION', '民族', '70');
INSERT INTO `dict` VALUES ('43', '0', '8', '傣族', 'NATION', '民族', '80');
INSERT INTO `dict` VALUES ('44', '0', '9', '德昂族', 'NATION', '民族', '90');
INSERT INTO `dict` VALUES ('45', '0', '10', '东乡族', 'NATION', '民族', '100');
INSERT INTO `dict` VALUES ('46', '0', '11', '侗族', 'NATION', '民族', '110');
INSERT INTO `dict` VALUES ('47', '0', '12', '独龙族', 'NATION', '民族', '120');
INSERT INTO `dict` VALUES ('48', '0', '13', '俄罗斯族', 'NATION', '民族', '130');
INSERT INTO `dict` VALUES ('49', '0', '14', '鄂伦春族', 'NATION', '民族', '140');
INSERT INTO `dict` VALUES ('50', '0', '15', '鄂温克族', 'NATION', '民族', '150');
INSERT INTO `dict` VALUES ('51', '0', '16', '高山族', 'NATION', '民族', '160');
INSERT INTO `dict` VALUES ('52', '0', '17', '仡佬族', 'NATION', '民族', '170');
INSERT INTO `dict` VALUES ('53', '0', '18', '哈尼族', 'NATION', '民族', '180');
INSERT INTO `dict` VALUES ('54', '0', '19', '哈萨克族', 'NATION', '民族', '190');
INSERT INTO `dict` VALUES ('55', '0', '20', '汉族', 'NATION', '民族', '200');
INSERT INTO `dict` VALUES ('56', '0', '21', '赫哲族', 'NATION', '民族', '210');
INSERT INTO `dict` VALUES ('57', '0', '22', '回族', 'NATION', '民族', '220');
INSERT INTO `dict` VALUES ('58', '0', '23', '基诺族', 'NATION', '民族', '230');
INSERT INTO `dict` VALUES ('59', '0', '24', '京族', 'NATION', '民族', '240');
INSERT INTO `dict` VALUES ('60', '0', '25', '景颇族', 'NATION', '民族', '250');
INSERT INTO `dict` VALUES ('61', '0', '26', '柯尔克孜族', 'NATION', '民族', '260');
INSERT INTO `dict` VALUES ('62', '0', '27', '拉祜族', 'NATION', '民族', '270');
INSERT INTO `dict` VALUES ('63', '0', '28', '黎族', 'NATION', '民族', '280');
INSERT INTO `dict` VALUES ('64', '0', '29', '傈僳族', 'NATION', '民族', '290');
INSERT INTO `dict` VALUES ('65', '0', '30', '珞巴族', 'NATION', '民族', '300');
INSERT INTO `dict` VALUES ('66', '0', '31', '满族', 'NATION', '民族', '310');
INSERT INTO `dict` VALUES ('67', '0', '32', '毛南族', 'NATION', '民族', '320');
INSERT INTO `dict` VALUES ('68', '0', '33', '门巴族', 'NATION', '民族', '330');
INSERT INTO `dict` VALUES ('69', '0', '34', '蒙古族', 'NATION', '民族', '340');
INSERT INTO `dict` VALUES ('70', '0', '35', '苗族', 'NATION', '民族', '350');
INSERT INTO `dict` VALUES ('71', '0', '36', '仫佬族', 'NATION', '民族', '360');
INSERT INTO `dict` VALUES ('72', '0', '37', '纳西族', 'NATION', '民族', '370');
INSERT INTO `dict` VALUES ('73', '0', '38', '怒族', 'NATION', '民族', '380');
INSERT INTO `dict` VALUES ('74', '0', '39', '普米族', 'NATION', '民族', '390');
INSERT INTO `dict` VALUES ('75', '0', '40', '羌族', 'NATION', '民族', '400');
INSERT INTO `dict` VALUES ('76', '0', '41', '撒拉族', 'NATION', '民族', '410');
INSERT INTO `dict` VALUES ('77', '0', '42', '畲族', 'NATION', '民族', '420');
INSERT INTO `dict` VALUES ('78', '0', '43', '水族', 'NATION', '民族', '430');
INSERT INTO `dict` VALUES ('79', '0', '44', '塔吉克族', 'NATION', '民族', '440');
INSERT INTO `dict` VALUES ('80', '0', '45', '塔塔尔族', 'NATION', '民族', '450');
INSERT INTO `dict` VALUES ('81', '0', '46', '土家族', 'NATION', '民族', '460');
INSERT INTO `dict` VALUES ('82', '0', '47', '土族', 'NATION', '民族', '470');
INSERT INTO `dict` VALUES ('83', '0', '48', '佤族', 'NATION', '民族', '480');
INSERT INTO `dict` VALUES ('84', '0', '49', '维吾尔族', 'NATION', '民族', '490');
INSERT INTO `dict` VALUES ('85', '0', '50', '乌孜别克族', 'NATION', '民族', '500');
INSERT INTO `dict` VALUES ('86', '0', '51', '锡伯族', 'NATION', '民族', '510');
INSERT INTO `dict` VALUES ('87', '0', '52', '瑶族', 'NATION', '民族', '520');
INSERT INTO `dict` VALUES ('88', '0', '53', '彝族', 'NATION', '民族', '530');
INSERT INTO `dict` VALUES ('89', '0', '54', '裕固族', 'NATION', '民族', '540');
INSERT INTO `dict` VALUES ('90', '0', '55', '藏族', 'NATION', '民族', '550');
INSERT INTO `dict` VALUES ('91', '0', '56', '壮族', 'NATION', '民族', '560');
INSERT INTO `dict` VALUES ('92', '0', '2014', '2014级', 'GRADE', '年级', '10');
INSERT INTO `dict` VALUES ('93', '0', '2015', '2015级', 'GRADE', '年级', '20');
INSERT INTO `dict` VALUES ('94', '0', '2016', '2016级', 'GRADE', '年级', '30');
INSERT INTO `dict` VALUES ('95', '0', '2017', '2017级', 'GRADE', '年级', '40');
INSERT INTO `dict` VALUES ('96', '0', '1', '已提交', 'WORK', '工作状态', '10');
INSERT INTO `dict` VALUES ('97', '0', '2', '待修改', 'WORK', '工作状态', '20');
INSERT INTO `dict` VALUES ('98', '0', '3', '已完成', 'WORK', '工作状态', '30');
INSERT INTO `dict` VALUES ('99', '0', '1', '学生用户', 'USER', '用户', '10');
INSERT INTO `dict` VALUES ('100', '0', '2', '部门用户', 'USER', '用户', '20');
INSERT INTO `dict` VALUES ('101', '0', '3', '管理员用户', 'USER', '用户', '30');
INSERT INTO `dict` VALUES ('102', '0', '1', '男', 'SEX', '性别', '10');
INSERT INTO `dict` VALUES ('103', '0', '2', '女', 'SEX', '性别', '20');
INSERT INTO `dict` VALUES ('104', '0', '1', '材料科学与工程学院', 'DEPARTMENT', '院系', '10');
INSERT INTO `dict` VALUES ('105', '0', '2', '电子信息学院', 'DEPARTMENT', '院系', '20');
INSERT INTO `dict` VALUES ('106', '0', '3', '法学院', 'DEPARTMENT', '院系', '30');
INSERT INTO `dict` VALUES ('107', '0', '4', '纺织服装学院', 'DEPARTMENT', '院系', '40');
INSERT INTO `dict` VALUES ('108', '0', '5', '公共卫生学院', 'DEPARTMENT', '院系', '50');
INSERT INTO `dict` VALUES ('109', '0', '6', '国际教育合作学院', 'DEPARTMENT', '院系', '60');
INSERT INTO `dict` VALUES ('110', '0', '7', '护理学院', 'DEPARTMENT', '院系', '70');
INSERT INTO `dict` VALUES ('111', '0', '8', '华大基因创新学院', 'DEPARTMENT', '院系', '80');
INSERT INTO `dict` VALUES ('112', '0', '9', '化学化工学院', 'DEPARTMENT', '院系', '90');
INSERT INTO `dict` VALUES ('113', '0', '10', '环境科学与工程学院', 'DEPARTMENT', '院系', '100');
INSERT INTO `dict` VALUES ('114', '0', '11', '机电工程学院', 'DEPARTMENT', '院系', '110');
INSERT INTO `dict` VALUES ('115', '0', '12', '计算机科学技术学院', 'DEPARTMENT', '院系', '120');
INSERT INTO `dict` VALUES ('116', '0', '13', '经济学院', 'DEPARTMENT', '院系', '130');
INSERT INTO `dict` VALUES ('117', '0', '14', '口腔医学院', 'DEPARTMENT', '院系', '140');
INSERT INTO `dict` VALUES ('118', '0', '15', '旅游与地理科学学院', 'DEPARTMENT', '院系', '150');
INSERT INTO `dict` VALUES ('119', '0', '16', '马克思主义学院', 'DEPARTMENT', '院系', '160');
INSERT INTO `dict` VALUES ('120', '0', '17', '美术学院', 'DEPARTMENT', '院系', '170');
INSERT INTO `dict` VALUES ('121', '0', '18', '软件技术系', 'DEPARTMENT', '院系', '180');
INSERT INTO `dict` VALUES ('122', '0', '19', '商学院', 'DEPARTMENT', '院系', '190');
INSERT INTO `dict` VALUES ('123', '0', '20', '生命科学学院', 'DEPARTMENT', '院系', '200');
INSERT INTO `dict` VALUES ('124', '0', '21', '师范学院（教师教育学院）', 'DEPARTMENT', '院系', '210');
INSERT INTO `dict` VALUES ('125', '0', '22', '数据科学与软件工程学院', 'DEPARTMENT', '院系', '220');
INSERT INTO `dict` VALUES ('126', '0', '23', '数学与统计学院', 'DEPARTMENT', '院系', '230');
INSERT INTO `dict` VALUES ('127', '0', '24', '体育学院', 'DEPARTMENT', '院系', '240');
INSERT INTO `dict` VALUES ('128', '0', '25', '外语学院', 'DEPARTMENT', '院系', '250');
INSERT INTO `dict` VALUES ('129', '0', '26', '文学院', 'DEPARTMENT', '院系', '260');
INSERT INTO `dict` VALUES ('130', '0', '27', '物理科学学院', 'DEPARTMENT', '院系', '270');
INSERT INTO `dict` VALUES ('131', '0', '28', '新闻与传播学院', 'DEPARTMENT', '院系', '280');
INSERT INTO `dict` VALUES ('132', '0', '29', '药学院', 'DEPARTMENT', '院系', '290');
INSERT INTO `dict` VALUES ('133', '0', '30', '医院管理办', 'DEPARTMENT', '院系', '300');
INSERT INTO `dict` VALUES ('134', '0', '31', '音乐学院', 'DEPARTMENT', '院系', '310');
INSERT INTO `dict` VALUES ('135', '0', '32', '应用技术学院', 'DEPARTMENT', '院系', '320');
INSERT INTO `dict` VALUES ('136', '0', '33', '哲学与历史学院', 'DEPARTMENT', '院系', '330');
INSERT INTO `dict` VALUES ('137', '0', '34', '政治与公共管理学院', 'DEPARTMENT', '院系', '340');
INSERT INTO `dict` VALUES ('138', '0', '35', '智能科学与技术系', 'DEPARTMENT', '院系', '350');
INSERT INTO `dict` VALUES ('139', '0', '36', '自动化与电气工程学院', 'DEPARTMENT', '院系', '360');
INSERT INTO `dict` VALUES ('140', '104', '1', '高分子材料与工程（创新班）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('141', '104', '2', '高分子材料与工程', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('142', '104', '3', '复合材料与工程', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('143', '105', '4', '通信工程', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('144', '105', '5', '微电子科学与工程', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('145', '105', '6', '电子信息工程', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('146', '105', '7', '电子信息科学与技术', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('147', '106', '8', '法学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('148', '106', '9', '边防管理', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('149', '107', '10', '服装与服饰设计(服装设计)', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('150', '107', '11', '纺织工程', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('151', '107', '12', '轻化工程', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('152', '107', '13', '纺织工程（创新班）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('153', '107', '14', '服装与服饰设计(服装表演)', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('154', '107', '15', '艺术设计(服装设计)', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('155', '107', '16', '服装设计与工程', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('156', '108', '17', '预防医学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('157', '109', '18', '软件工程', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('158', '109', '19', '国际商务(专科)', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('159', '110', '20', '护理学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('160', '110', '21', '护理学（对口本科）', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('161', '112', '22', '化学（师范类）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('162', '112', '23', '应用化学', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('163', '112', '24', '化学工程与工艺', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('164', '112', '25', '化学', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('165', '113', '26', '环境工程', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('166', '113', '27', '环境科学', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('167', '114', '28', '材料成型及控制工程', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('168', '114', '29', '机械工程', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('169', '114', '30', '工业设计', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('170', '114', '31', '机械工程及自动化', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('171', '114', '32', '机械工程（创新班）', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('172', '114', '33', '能源与动力工程', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('173', '114', '34', '测控技术与仪器', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('174', '115', '35', '物联网工程', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('175', '115', '36', '信息安全', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('176', '115', '37', '网络工程', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('177', '115', '38', '计算机科学与技术', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('178', '116', '39', '金融学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('179', '116', '40', '国际经济与贸易（中外合作办学）', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('180', '116', '41', '金融学（实验班）', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('181', '116', '42', '经济学', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('182', '116', '43', '经济学（创新班）', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('183', '116', '44', '保险学', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('184', '116', '45', '财政学', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('185', '116', '46', '经济统计学', 'MAJOR', '专业', '80');
INSERT INTO `dict` VALUES ('186', '116', '47', '国际经济与贸易', 'MAJOR', '专业', '90');
INSERT INTO `dict` VALUES ('187', '116', '48', '金融工程', 'MAJOR', '专业', '100');
INSERT INTO `dict` VALUES ('188', '117', '49', '口腔医学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('189', '118', '50', '酒店管理', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('190', '118', '51', '旅游管理', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('191', '118', '52', '地理科学（非师范类）', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('192', '118', '53', '酒店管理（对口本科）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('193', '118', '54', '旅游管理（中外合作办学）', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('194', '118', '55', '地理科学(师范类)', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('195', '119', '56', '思想政治教育（师范类）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('196', '120', '57', '视觉传达设计', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('197', '120', '58', '绘画', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('198', '120', '59', '绘画（创新班）', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('199', '120', '60', '环境设计', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('200', '120', '61', '艺术设计', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('201', '111', '62', '医学检验 生物技术', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('202', '111', '63', '生物技术(基因组学与生物信息学)', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('203', '121', '64', '软件技术', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('204', '122', '65', '会计学（中外合作办学）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('205', '122', '66', '电子商务', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('206', '122', '67', '会计学', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('207', '122', '68', '信息管理与信息系统', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('208', '122', '69', '物流管理', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('209', '122', '70', '国际商务（中外合作办学）', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('210', '122', '71', '物流管理（中外合作办学）', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('211', '122', '72', '人力资源管理', 'MAJOR', '专业', '80');
INSERT INTO `dict` VALUES ('212', '122', '73', '工业工程', 'MAJOR', '专业', '90');
INSERT INTO `dict` VALUES ('213', '122', '74', '工商管理', 'MAJOR', '专业', '100');
INSERT INTO `dict` VALUES ('214', '122', '75', '财务管理', 'MAJOR', '专业', '110');
INSERT INTO `dict` VALUES ('215', '122', '76', '会计学（中外合作办学·创新班）', 'MAJOR', '专业', '120');
INSERT INTO `dict` VALUES ('216', '122', '77', '市场营销', 'MAJOR', '专业', '130');
INSERT INTO `dict` VALUES ('217', '122', '78', '国际商务', 'MAJOR', '专业', '140');
INSERT INTO `dict` VALUES ('218', '123', '79', '生物技术', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('219', '123', '80', '食品科学与工程', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('220', '124', '81', '学前教育（对口本科）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('221', '124', '82', '应用心理学（师范类）', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('222', '124', '83', '学前教育', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('223', '124', '84', '小学教育（语文方向）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('224', '124', '85', '小学教育', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('225', '124', '86', '应用心理学（非师范类）', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('226', '124', '87', '小学教育（数学方向）', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('227', '124', '88', '教育技术学', 'MAJOR', '专业', '80');
INSERT INTO `dict` VALUES ('228', '125', '89', '软件工程', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('229', '125', '90', '智能科学与技术', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('230', '125', '91', '数字媒体技术(游戏设计)', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('231', '125', '92', '数字媒体技术（对口本科）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('232', '125', '93', '软件工程·外包', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('233', '125', '94', '数字媒体技术（动画方向）', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('234', '125', '95', '数字媒体技术(中外合作办学)', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('235', '125', '96', '软件工程（对口本科）', 'MAJOR', '专业', '80');
INSERT INTO `dict` VALUES ('236', '125', '97', '数字媒体技术', 'MAJOR', '专业', '90');
INSERT INTO `dict` VALUES ('237', '126', '98', '信息与计算科学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('238', '126', '99', '数学与应用数学', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('239', '126', '100', '数学与应用数学（师范类）', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('240', '126', '101', '数学与应用数学（创新班）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('241', '126', '102', '应用统计学', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('242', '127', '103', '体育教育（师范类）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('243', '128', '104', '日语', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('244', '128', '105', '德语', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('245', '128', '106', '西班牙语', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('246', '128', '107', '西班牙语（中外合作办学）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('247', '128', '108', '朝鲜语（中外合作办学）', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('248', '128', '109', '英语（师范类）', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('249', '128', '110', '英语（中外合作办学）', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('250', '128', '111', '朝鲜语', 'MAJOR', '专业', '80');
INSERT INTO `dict` VALUES ('251', '128', '112', '英语', 'MAJOR', '专业', '90');
INSERT INTO `dict` VALUES ('252', '128', '113', '法语', 'MAJOR', '专业', '100');
INSERT INTO `dict` VALUES ('253', '128', '114', '英语（创新班）', 'MAJOR', '专业', '110');
INSERT INTO `dict` VALUES ('254', '129', '115', '汉语言文学（师范类）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('255', '129', '116', '汉语言文学（创新班）', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('256', '129', '117', '中国语言文学类', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('257', '129', '118', '汉语言文学', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('258', '129', '119', '汉语言文学(中外文秘)', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('259', '130', '120', '材料物理', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('260', '130', '121', '光电信息科学与工程', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('261', '130', '122', '物理学（师范类）', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('262', '130', '123', '新能源科学与工程', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('263', '130', '124', '应用物理学（创新班）', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('264', '130', '125', '应用物理学', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('265', '131', '126', '视觉传达设计(广告设计方向)', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('266', '131', '127', '广播电视编导', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('267', '131', '128', '动画', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('268', '131', '129', '艺术设计(广告设计)', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('269', '131', '130', '广告学', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('270', '131', '131', '新闻学', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('271', '132', '132', '药学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('272', '133', '133', '医学影像学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('273', '133', '134', '医学检验', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('274', '133', '135', '医学检验技术', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('275', '133', '136', '临床医学', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('276', '133', '137', '临床医学（5+3）', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('277', '133', '138', '临床医学卓越班', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('278', '133', '139', '临床医学(lxs)', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('279', '133', '140', '临床医学（儿科方向）', 'MAJOR', '专业', '80');
INSERT INTO `dict` VALUES ('280', '134', '141', '舞蹈学', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('281', '134', '142', '作曲与作曲技术理论', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('282', '134', '143', '音乐学', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('283', '134', '144', '音乐表演', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('284', '135', '145', '机械工程（对口本科）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('285', '135', '146', '服装设计与工程(对口本科)', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('286', '135', '147', '高分子材料与工程(对口本科)', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('287', '135', '148', '电气工程及其自动化（3+2）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('288', '135', '149', '化学工程与工艺（对口本科）', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('289', '135', '150', '高分子材料应用技术(专科)', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('290', '135', '151', '高分子材料与工程', 'MAJOR', '专业', '70');
INSERT INTO `dict` VALUES ('291', '135', '152', '机械制造及自动化', 'MAJOR', '专业', '80');
INSERT INTO `dict` VALUES ('292', '136', '153', '历史学（师范类）', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('293', '136', '154', '哲学', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('294', '137', '155', '公共事业管理', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('295', '137', '156', '国际政治', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('296', '137', '157', '政治学类', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('297', '137', '158', '政治学与行政学', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('298', '137', '159', '社会工作', 'MAJOR', '专业', '50');
INSERT INTO `dict` VALUES ('299', '137', '160', '行政管理', 'MAJOR', '专业', '60');
INSERT INTO `dict` VALUES ('300', '138', '161', '电子信息工程技术', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('301', '139', '162', '自动化', 'MAJOR', '专业', '10');
INSERT INTO `dict` VALUES ('302', '139', '163', '电气工程及其自动化', 'MAJOR', '专业', '20');
INSERT INTO `dict` VALUES ('303', '139', '164', '电气信息类', 'MAJOR', '专业', '30');
INSERT INTO `dict` VALUES ('304', '139', '165', '自动化（创新班）', 'MAJOR', '专业', '40');
INSERT INTO `dict` VALUES ('305', '2', '1', '校级', 'ARTI_SECB', '文章二级版块', '80');
INSERT INTO `dict` VALUES ('306', '2', '2', '院级', 'ARTI_SECB', '文章二级版块', '90');
INSERT INTO `dict` VALUES ('307', '2', '3', '社联级', 'ARTI_SECB', '文章二级版块', '100');
INSERT INTO `dict` VALUES ('308', '0', '0', '错误！', 'MAJOR', '专业', '9999');
INSERT INTO `dict` VALUES ('309', '0', '99', '其他', 'NATION', '民族', '9999');
INSERT INTO `dict` VALUES ('310', '0', '99', '错误！', 'ENROLL', '报名状态', '9999');

-- ----------------------------
-- Table structure for director
-- ----------------------------
DROP TABLE IF EXISTS `director`;
CREATE TABLE `director` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DEPID` int(11) NOT NULL COMMENT '部门id',
  `NAME` varchar(20) NOT NULL COMMENT '姓名',
  `SEX` varchar(2) NOT NULL COMMENT '性别',
  `PHONE` varchar(11) NOT NULL COMMENT '联系电话',
  `LEVEL` varchar(5) NOT NULL COMMENT '部长职务（1：部长，2：副部长）',
  PRIMARY KEY (`ID`),
  KEY `dir_depID` (`DEPID`),
  CONSTRAINT `dir_depID` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='部长表';

-- ----------------------------
-- Records of director
-- ----------------------------
INSERT INTO `director` VALUES ('1', '2', '刘尚鹏', '1', '13061370929', '1');
INSERT INTO `director` VALUES ('2', '3', '石诚', '2', '13061370929', '1');
INSERT INTO `director` VALUES ('4', '4', '张丽红', '2', '13061370929', '1');
INSERT INTO `director` VALUES ('5', '5', '赵秋', '2', '13061370929', '1');
INSERT INTO `director` VALUES ('6', '6', '崔湘晗', '2', '13061370929', '1');
INSERT INTO `director` VALUES ('7', '7', '吴锐', '1', '13061370929', '2');
INSERT INTO `director` VALUES ('8', '7', '石雅楠', '2', '13061370929', '1');
INSERT INTO `director` VALUES ('17', '3', '何爽', '2', '13061370929', '2');
INSERT INTO `director` VALUES ('18', '3', '荆梦荷', '2', '13061370929', '2');
INSERT INTO `director` VALUES ('19', '9', '陈家', '1', '13061370929', '2');

-- ----------------------------
-- Table structure for enroll
-- ----------------------------
DROP TABLE IF EXISTS `enroll`;
CREATE TABLE `enroll` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `STUID` int(11) NOT NULL COMMENT '学生id',
  `DEPID` int(11) NOT NULL COMMENT '部门id',
  `CHARACT` longtext NOT NULL COMMENT '特长',
  `INTRO` longtext NOT NULL COMMENT '自我介绍',
  `WGIVE` longtext NOT NULL COMMENT '期望付出',
  `WGAIN` longtext NOT NULL COMMENT '期望回报',
  `STATUS` varchar(5) NOT NULL COMMENT '报名状态（1：待审核，2：审核通过，3：初试通过，4：复试通过，5：审核淘汰，6：初试淘汰，7：复试淘汰）\r\n',
  PRIMARY KEY (`ID`),
  KEY `enroll_stuID` (`STUID`),
  KEY `enroll_depID` (`DEPID`),
  CONSTRAINT `enroll_depID` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enroll_stuID` FOREIGN KEY (`STUID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3214 DEFAULT CHARSET=utf8 COMMENT='报名信息表';

-- ----------------------------
-- Records of enroll
-- ----------------------------
INSERT INTO `enroll` VALUES ('3006', '61', '58', '实际操作能力强，能够…… （对你的专业不了解，省略号处，如果你的专业中有涉及到动手能力的东西就把它当例子写上去，最好把自己能够做到什么程度。\r\n写明白了，比如能够在多短的时间之内完成什么呀或是能够把什么东西做的很完美；专业中没有的话就写些现实中的例子，能证实你动手能力强就好，最好还是和专业有关的，不要多，两个就很好，最好语言简练）', '（另起一段；）性格热情外向，喜欢体育运动，特别爱好篮球，……32人图额额', '简历就是能飘就飘的东西，能跟专业挂钩的不要放弃，能抬高自己的就不要客气，有牛在写简历的时候不吹是绝对会后悔的……但不要加太多跟专业无关的东西，不是所有的公司都对应聘者的性格感兴趣。', '纯属个人建议。而且，写进简历的东西都有面试时被问到的可能性，想好再写吧', '1');
INSERT INTO `enroll` VALUES ('3018', '61', '29', '1.电脑应用熟练，熟练操作Word,Excel,,Outlook, ERP等各种办公软件;\r\n2.勤奋上进好学，工作细心，条理清晰，踏实肯干，有很强的责任心;\r\n3.性格开朗乐观，善于人际交流和沟通，具备团队合作精神;\r\n4.喜好书法并有一定的书写能力。', '我愿通过自己富有激情、积极主动的努力实现自身价值并在工作中做出最大的贡献：作为初学者，我具备出色的学习能力并且乐于学习、敢于创新，不断追求卓越;作为参与者，我具备诚实可信的品格、富有团队合作精神，有很强的忍耐力、意志力和吃苦耐劳的品质，对工作认真负责，积极进取，个性乐观执着，敢于面对困难与挑战。诚实守信，责任心强，注重团队精神。相信我所具有的', '知识和处事能力完全可以胜任任何困难的工作，环境的艰苦并不能阻碍完成我要完成的工作。但将投入工作我定把我所有的青春和热情倾力投入到我的工作中，取得应有的成绩，为公司的发展壮大贡献自己的力量，希望您的选择和我的努力会为我们带来双赢的结果!', '自我鉴定：转眼间大学生生活就要结束了,离校之前,为了明确自己的过去与未来.我觉得我有必要对这几年的大学生活做个自我鉴定!', '1');
INSERT INTO `enroll` VALUES ('3031', '82', '4', '会唱歌，有一定的表达交流能力。', '大家好，我是孙占法，我是个活泼而努力的男生，我善于交往，和同学和睦相处，会随机应变。', '我善于交往沟通，乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '我希望可以在社团中发挥我的特长，为大家做出贡献，并借助我们社团更好的发展自己。', '1');
INSERT INTO `enroll` VALUES ('3032', '82', '17', '会唱歌，有一定的表达交流能力。', '大家好，我是孙占法，我是个活泼而努力的男生，我善于交往，和同学和睦相处，会随机应变。', '我善于交往沟通，乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '我希望可以在社团中发挥我的特长，为大家做出贡献，并借助我们社团更好的发展自己。', '1');
INSERT INTO `enroll` VALUES ('3033', '82', '41', '会唱歌，有一定的表达交流能力。', '大家好，我是孙占法，我是个活泼而努力的男生，我善于交往，和同学和睦相处，会随机应变。', '我善于交往沟通，乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '我希望可以在社团中发挥我的特长，为大家做出贡献，并借助我们社团更好的发展自己。', '1');
INSERT INTO `enroll` VALUES ('3034', '82', '99', '会唱歌，有一定的表达交流能力。', '大家好，我是孙占法，我是个活泼而努力的男生，我善于交往，和同学和睦相处，会随机应变。', '我善于交往沟通，乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '我希望可以在社团中发挥我的特长，为大家做出贡献，并借助我们社团更好的发展自己。', '1');
INSERT INTO `enroll` VALUES ('3035', '82', '32', '会唱歌，有一定的表达交流能力。', '大家好，我是孙占法，我是个活泼而努力的男生，我善于交往，和同学和睦相处，会随机应变。\r\n', '我善于交往沟通，乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '我希望可以在社团中发挥我的特长，为大家做出贡献，并借助我们社团更好的发展自己。', '1');
INSERT INTO `enroll` VALUES ('3036', '82', '62', '会唱歌，有一定的表达交流能力。', '大家好，我是孙占法，我是个活泼而努力的男生，我善于交往，和同学和睦相处，会随机应变。', '我善于交往沟通，乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '我希望可以在社团中发挥我的特长，为大家做出贡献，并借助我们社团更好的发展自己。\r\n\r\n', '1');
INSERT INTO `enroll` VALUES ('3037', '83', '4', '喜欢跳舞，善于交往。', '大家好，我是尹玉双，我是个开朗而努力的女生，喜欢跳舞，有自信。', '乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '希望给社团添砖加瓦，让社团变得更好。', '1');
INSERT INTO `enroll` VALUES ('3038', '83', '9', '喜欢跳舞，善于交往。\r\n\r\n', '大家好，我是尹玉双，我是个开朗而努力的女生，喜欢跳舞，有自信。\r\n', '乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '希望给社团添砖加瓦，让社团变得更好。', '2');
INSERT INTO `enroll` VALUES ('3039', '83', '30', '喜欢跳舞，善于交往。\r\n\r\n', '大家好，我是尹玉双，我是个开朗而努力的女生，喜欢跳舞，有自信。', '乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。\r\n', '希望给社团添砖加瓦，让社团变得更好。', '1');
INSERT INTO `enroll` VALUES ('3040', '83', '66', '喜欢跳舞，善于交往。\r\n\r\n', '大家好，我是尹玉双，我是个开朗而努力的女生，喜欢跳舞，有自信。\r\n', '乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '希望给社团添砖加瓦，让社团变得更好。', '1');
INSERT INTO `enroll` VALUES ('3041', '83', '50', '喜欢跳舞，善于交往。\r\n\r\n', '大家好，我是尹玉双，我是个开朗而努力的女生，喜欢跳舞，有自信。', '乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。\r\n', '希望给社团添砖加瓦，让社团变得更好。', '1');
INSERT INTO `enroll` VALUES ('3042', '83', '132', '喜欢跳舞，善于交往。\r\n\r\n', '大家好，我是尹玉双，我是个开朗而努力的女生，喜欢跳舞，有自信。\r\n', '乐于助人，喜欢新鲜事物，有责任心，会做好自己分内的事情。', '希望给社团添砖加瓦，让社团变得更好。', '1');
INSERT INTO `enroll` VALUES ('3043', '169', '5', '书法，画画', '性格开朗活泼，乐于助人', '热心公益，不怕吃苦，愿意与社团共进退，完成每项任务', '一定的社会经验，大方的交流能力。', '1');
INSERT INTO `enroll` VALUES ('3044', '170', '5', '“春日迟迟，卉木萋萋”——春天的校园生机勃勃。教学楼前，老柳树迫不及待地抽出了细细的枝条，吐出了嫩嫩的绿芽，像是春天激情跃动的琴音；操场上柔暖的春风才刚刚拂过，如丝般的春雨就伴随着阵阵春雷洒落整个校园，像是春天催人奋进的鼓乐；花圃里各色的花儿经不住春姑娘的召唤，竞相绽放出娇艳的笑脸，像是春天的清亮爽朗的笑声……春意盎然的校园里我们张扬生命的光鲜，领略知识的无限。', '“夏木阴阴，芳草菲菲”——夏天的校园妙趣横生。骄阳之下，碧绿的塑胶操场犹如草坪般自然清新，盛开的鲜花香气弥漫。教室里书声朗朗，老师们还在课堂上循循善诱、诲人不倦；老树上叽喳喧闹，淘气的喜鹊们已在枝丫间跳上窜下、呼朋引伴了。快乐的课间，同学们会在树阴下听知了悠长的鸣叫，好奇地看着点点光影在地上闪烁，争论着儿时的梦想、憧憬着美好的未来……如火如荼的校园里我们飘动漂亮的衣裙，鲜活而美丽！', '“秋朝寂寂，叶影斑斑”——秋天的校园异彩纷呈。新的学期，同学们又意气风发回归校园，新人新气象，新锐新锋芒，楼门前摆满艳丽的花，串串红似簇簇火焰，各色菊花争相怒放，远望如五彩的霞。一行行大雁从校园上的天空飞过，晴空里太阳显得更美更娇了！操场边笔直高大的白杨树叶子已枯黄，清凉的秋风拂过，落叶似小精灵随风舞动着落下，婉如一个个音符……期待收获的校园里我们怀揣理想上路，放飞梦想展翅高飞。', '“冬寒凛凛，雪韵翩翩”——冬天的校园魅力无穷。操场上、屋顶上都积满了厚厚的白雪，整个校园变成了银装素裹的世界，那么明朗，那么洁净，那么令人心旷神怡。花坛宛若盖上了银色的棉被，龙爪槐就像一把撑开的大雪伞。同学们迫不及待地冲出教室，轻踏着冬日的白雪，欣赏着校园的美景，欢笑声、打闹声瞬间就汇聚成欢乐的海洋，到处是红通通的手，笑盈盈的脸……激情洋溢的校园里我们挥动稚嫩的双手，点燃求知的渴望。', '1');
INSERT INTO `enroll` VALUES ('3045', '171', '5', '　嘿，那个少年，我在秋天埋下喜欢你的小秘密。\r\n\r\n　　——题记\r\n', '秋风中微微摆动的衣衫，那挺拔的人儿，浅笑，美好，宛如年少。\r\n\r\n　　——后记', '\r\n\r\n　　天高气爽，硕果累累，深秋又至。\r\n\r\n　　望着窗外落叶纷纷，勾起了我记忆的琴弦，同是在这样的秋日里，铺写下我喜欢你的篇章。\r\n', '\r\n　　微风拂过我的发梢，我远远地望着你，你正低头沉醉在武侠小说里，浅浅一笑，便随着萧瑟的秋风一起荡入我的心扉，从此心中埋下小秘密。嘿，那个少年，一笑倾城，一见自难忘，你知晓吗？\r\n', '1');
INSERT INTO `enroll` VALUES ('3046', '172', '5', '不知从何时起，你的一颦一笑，已深深印入我心；人海灯瀚，唯有你修长的背影占据了我所有的视线；时光漫漫，但与你相处的时光却稍纵即逝……嘿，那个少年，我喜欢你，你相信吗？', '那年我十二岁，刚刚赶上青春的早班车，而你却摇身一变成了备战高考的学长。喜讯临天而降，你被心仪的大学录取，即将远走他乡，步入大学……当秋风渐起，你已离去，我却仍在这个有着你我共同回忆的小城逗留。此后，每日“三想”成了我的家常便饭，走路的时候想你，吃饭的时候想你，睡觉的时候想你。每每想起你，或黯然神伤，或忍俊不禁，或孤单寂寞……嘿，那个少年，我思念你，你知晓吗？', '你在山西，而我在云南，我用手反复摩挲着地图上你所在的城市，心中无限惆怅。两千多公里的距离，不是一朝一夕就能改变的。即使我们相隔万里，即使你像夜空中遥不可及的北极星，即使我们相差甚远，我依旧愿为你跨越这所有的隔阂，努力拼搏，缩短我们之间的距离。是你让我对明天有了期许，为了你我愿挑灯夜读，做那令人头疼的习题；为了你我愿废寝忘食，奋笔疾书；为了你我愿让放弃宝贵的休息时间，去上补习班……四年，四年之后我定会以更好的模样出现在你的面前，我坚信现在的努力，只是为了将来更美好的相遇。', '奋斗四年，只为考中北！不破中北终不还，我会为你而fighing……嘿，那个少年，我在为你而努力，你相信吗？', '1');
INSERT INTO `enroll` VALUES ('3047', '173', '5', '秋日的微凉，便随着淡淡的忧伤，你依然是我最初最热烈的等候。', '我心之所向，想和你并肩看夕阳，看潮起潮落，观云卷云舒，赏花开花落，写下余生的篇章。', '少年，等我……嘿，那个少年，谢谢你，喜欢你让我造就更美好的自己！', '就让我在下一个秋日里延续我喜欢你的故事吧，好吗？', '1');
INSERT INTO `enroll` VALUES ('3048', '174', '5', '　我爱读书，在明月之夜，台灯一盏、香茗一杯，叹梁祝身化彩蝶；喜崔张终成眷属；羡东坡把酒临风；慕清照泛舟双溪。有高山流水鸣于耳畔，瘦竹幽兰馨于鼻尖，红有樱桃，绿有芭蕉，此乐何极！品味文字让我成长！', '　“花飞花谢花满天，红消香断有谁怜？”品读林黛玉，读出的是凄美，悟出的是绝望。', '“我自横刀向天笑，去留肝胆两昆仑”，品读谭嗣同，读出的是正气，悟出的是坚忍。', '“雪地又冰天，穷愁十九年”品读苏轼，读出的是忠诚，悟出的是伟岸。', '1');
INSERT INTO `enroll` VALUES ('3049', '175', '5', '文字，让我陶醉其中。我多想跨越千年时空，披一袭单薄的长衫，倚一窗幽竹，在明月之夜，与古人吟诗作对，共醉明月。我在品味古韵与陶醉中成长！', '　读庄子，读到的是空明与澄静。“心如澄流秋水，行若不系之舟”，他甘愿做一棵守护月亮的树，不甘愿“曳尾于涂泥”为的是那棵澄静的心灵之树。', '读李白，读到的是自信与豪迈。“天生我才必有用，千金散尽还复来”铸造了他的自信与博大；“仰天大笑出门去，我辈岂是蓬嵩人”飘荡着他的酒脱和飘逸。酒入豪肠，七分酿成月亮，剩下三分啸成剑气，绣口一吐就是个盛唐。', '文字，可以让我感受到古人的情感与忧愁，给我思考，让我感动。我在思考与感动中成长！', '1');
INSERT INTO `enroll` VALUES ('3050', '176', '5', '一路走来，有文字陪伴，予我是不断感悟和成长！', '李白生活在那个烟花三月的时代，本应取悦君王而换取高官厚禄安度一生，而他却不！他的光芒刺痛了他身边那些习惯于黑暗的眼晴，于是他注定要经历官坛向他泼来的污水，他的文字让我看到了他的一生，对自我的坚守和对文字的追求，也让我学到了许多做人的道理，成长了许多！', '儿时的我们可能最先接触的就是李白的文字。什么“床前明月光，疑是地上霜”、“飞流直下三千尺，疑是银河落九天”，直到现在我们都琅琅上口，随着时间的推移，我也从文字中更深入地了解了李白的安能崔眉折腰侍权贵，使我不得开心颜！', '　古往今来，李白的文字豪迈大气；李清照的文字凄婉忧伤；庄子的文字空明澄静；龙应台的文字意味深长；郭敬明的文字优美神秘……而让我感触最深的莫过于李白的文字。', '1');
INSERT INTO `enroll` VALUES ('3051', '177', '5', '　喜欢和你们在一起，喜欢和你们一起出板报，喜欢每个课间和你们一起发出的笑声。原来那句话是真的：只有失去了才知珍惜。', '当六月的到来换来了我们的第一次分离，当六月的课间飞满了留恋的同学录，心中第一次有了分别的苦涩。而这份苦涩转达成了那张纸薄的同学录。', '明白了，六月了，这个月该毕业了。\r\n\r\n　　当面临着人生第一个转折点的时候，声音总是不断。总是在期望着，盼望着，自己的朋友和自己一所学校。', '当微风温柔地托起太阳；当太阳温柔的把它的光辉悄然洒在大地上；当大地温柔地哺育一朵朵鲜出的生命；当知了温柔的唱着属于它的歌时。', '1');
INSERT INTO `enroll` VALUES ('3052', '178', '5', '当微风眷恋的把太阳送回家；当太阳眷恋的把最后一丝光缕撒下大地；当花朵眷恋着荣耀又无奈惋惜的回归泥土；当知了唱了整个夏天累了时。明白了，毕业了，也结束了。', '始终记得分别的那天，我们微笑着在校园里散步。当我们离开校园的那一刻，又回首看看六年的时光，回首看看我们曾走过的路。也许，分别了，不会再见了吧。', '始终记得分别得那天，我们几个在教室里久久徘徊而不愿离开，在黑板上签上自己的名字，只为留下，在这个温馨的教室里留下属于自己的丁点痕迹。', '始终记得分别得那天，没有一个人哭泣，每个人都在笑着，每个人都希望希望着：我们在一起是快乐的。不想让它变成悲情的发泄地。祝愿着，希望能够遇见比自己更好的同学。', '1');
INSERT INTO `enroll` VALUES ('3053', '84', '4', '喜欢跳舞，乐于交往。', '我叫宋晓，是个活泼开朗的人，喜欢跳舞，有耐心，有良好的沟通能力，乐于助人。', '我善于与人交往，可以调动气氛。', '希望在社团里可以更好的完善自己。', '1');
INSERT INTO `enroll` VALUES ('3054', '84', '12', '喜欢跳舞，乐于交往。', '我叫宋晓，是个活泼开朗的人，喜欢跳舞，有耐心，有良好的沟通能力，乐于助人。', '我善于与人交往，可以调动气氛。', '希望在社团里可以更好的完善自己。', '1');
INSERT INTO `enroll` VALUES ('3055', '84', '52', '喜欢跳舞，乐于交往。', '我叫宋晓，是个活泼开朗的人，喜欢跳舞，有耐心，有良好的沟通能力，乐于助人。', '我善于与人交往，可以调动气氛。', '希望在社团里可以更好的完善自己。', '1');
INSERT INTO `enroll` VALUES ('3056', '179', '5', '1、感叹？\r\n\r\n　　嗯熟悉我的人都可以看出来。\r\n\r\n　　我写文的方式好像是变了。\r\n\r\n　　是啊，经历了太多，想不变都难。\r\n\r\n　　言语渐渐变得冷淡，心也不再像从前那么暖。\r\n\r\n　　这也许就是很多人所谓的长大？\r\n\r\n　　（笑）', '　2、抱怨？\r\n\r\n　　啧我抱怨些什么？\r\n\r\n　　好像也没什么可抱怨的呢。\r\n\r\n　　噢好吧像是有一点。\r\n\r\n　　啧对就是关于很多人退的这个事呢。\r\n\r\n　　至于你们当时说的一直永远我就当你们说的全是屁话。\r\n\r\n　　毕竟世上太多东西可以打破诺言。\r\n\r\n　　也许你们厌了倦了？\r\n\r\n　　也许你们自有苦衷？\r\n\r\n　　这我都不追究了。\r\n\r\n　　走就走吧。', '3、等待\r\n\r\n　　嗯我不会一直在。\r\n\r\n　　但我会经常回来。\r\n\r\n　　看看你们是否还在，\r\n\r\n　　看看麦格是否依旧如一。\r\n\r\n　　当然，我看的是心。', '4、傲娇\r\n\r\n　　对啊我脾气就是不好，\r\n\r\n　　我也不会平白无故对你好。\r\n\r\n　　不喜自走我不送也不谢。\r\n\r\n　　拜拜一路走好噢。\r\n\r\n　　说了这么多，你们不会烦了吧。\r\n\r\n　　啧对我没有怪你们的意思。\r\n\r\n　　我只是跟你们唠叨了一会，发了发牢骚。\r\n\r\n　　略略略（耶）', '1');
INSERT INTO `enroll` VALUES ('3057', '84', '136', '喜欢跳舞，乐于交往。', '我叫宋晓，是个活泼开朗的人，喜欢跳舞，有耐心，有良好的沟通能力，乐于助人。', '我善于与人交往，可以调动气氛。', '希望在社团里可以更好的完善自己。', '1');
INSERT INTO `enroll` VALUES ('3058', '84', '34', '喜欢跳舞，乐于交往。', '我叫宋晓，是个活泼开朗的人，喜欢跳舞，有耐心，有良好的沟通能力，乐于助人。', '我善于与人交往，可以调动气氛。', '希望在社团里可以更好的完善自己。', '1');
INSERT INTO `enroll` VALUES ('3059', '84', '31', '喜欢跳舞，乐于交往。', '我叫宋晓，是个活泼开朗的人，喜欢跳舞，有耐心，有良好的沟通能力，乐于助人。', '我善于与人交往，可以调动气氛。', '希望在社团里可以更好的完善自己。', '1');
INSERT INTO `enroll` VALUES ('3060', '180', '5', '想要成功，还要有敢于取舍的魄力，果决地主动出击和懦弱的坚守逃避是两种截然不同的轨道。各有对错，但是机会留给有准备的人，被动的一方，没有选择成功与失败的权利。一个成功者，当是自己的主人，对于自己的意志，要有当有的决断。有舍必有得，鱼和熊掌，二者不可得兼。', '想要成功，要有从内部打破鸡蛋的勇气，要学会创新，告别固步自封。离离原上草，一岁一枯荣，这是自然世界的法则；闭关锁国和改革开放，这是历史的教训……凡此种种，不尽详述。', '所谓取舍，试想，倘若小羽只着眼于眼前的利益，又何尝能想到放弃独断，公开工艺，通过宏观的产业调控产业规则来实现致富呢？他舍弃了正版和专利的独断性，收获了名望、财富和由技术者像领导者的完美蜕变。', '所谓创新，小羽产业的兴起，是因为对工艺的创新；而扭转乾坤的关键，是对自身定位，产业结构的创新。通过试验个专利，一个新的产业平地而生；通过规范整个想要分蛋糕的人的市场，来促进产业的集体发展，树立自己的声望。', '1');
INSERT INTO `enroll` VALUES ('3061', '181', '5', '环视中国社会发展，改革开放30多年来，经济持续增速发展，近年来经济增速有所减缓，但在全球范围，依然保持相对较高增速发展。国际国内一些舆论就因此看衰中国经济，对中国给予不客观的评价。在中国民主政治、人权、民生、环保等事业不断进步中，国际国内一些舆论对此视而不见、听而不闻，而对于一些欠发达国家和地区在民主、人权等方面改善，舆论却大加赞美。这无疑也是一种不科学的认知。', '对于混在一些重要领域、行业和单位的庸官、懒官，特别是主要负责人，其无能力、不作为、不担责，所形成的庸政、懒政，给国家和社会带来的危害难以估量，甚至令人发指，超过一些有为但有过的官员。这里指的是谁，你们自己清楚，请自觉对号入座。对于这样“慢牛”、“懒牛”、“害牛”，决不能仅仅因为一些浮闪的表象成绩而给予过高评价，而应该看成绩背后的本质和基础，务实评价，严加处置。\r\n\r\n　　环视中国社会发展，改', '今天的中国，升腾着伟大的梦想。这需要各领域涌现出一大批敢于担责，勇于创造的“能臣”和“干将”来支撑。行业发展的引领者、区域发展的带动者，无疑是助推中国经济社会发展的“快牛”，对于他们，应该给予更加科学社会评价和激励，以激发和带动全社会、多领域更多的人，想事干事、创新创造，让中国加速向梦想航行。', '俗语云：“智者千虑必有一失，愚者千虑必有一得。”健康的社会评价心理、科学的评价体系，是建立公平、公正社会的基本保障之一。对于个体而言，关系到个人前途命运；对于单位和组织而言，关系群体的生存发展，对于国家而言，关乎国运兴衰。', '1');
INSERT INTO `enroll` VALUES ('3062', '182', '5', '叔叔阿姨们？孩子们的未来是他们自己来决定的，你们只是他们的引路人，但不要把自己的过错没完成的愿望让孩子们去做，他们有自己的人生有自己的未来，我们所能做的就是给予他们关怀和帮助。并不是责备和敷衍，是用心去给他们爱，让他们去收获，真正的自己。真正的人生。', '家是人们精神的慰藉和停泊的港湾，然而时代的不同更多的家长要孩子攀比，比学习比孩子得的奖，然而你们真的能明白，这种填鸭式的教育孩子们真的能收获多少，这是教育育人。不是看分数而评论孩子的努力，尽自己的全力那就是成功，让孩子心里有负担有压力，并不代表会成功，反之确会加剧他们的心里情况。这些你们真的想到了吗？', '想必每个人都有自己的第一次，是，那是多么的自豪，一直被光环所为绕，可是什么都改变了，你的到的不是真正的自己，一切都已改变。你前进会有无数的掌声，以及父母的疼爱和吻。可是人有过常在河边走哪有不湿鞋，那么多的诱惑在身边。身体的原因和种种过错，那么你稍微的摆动，结果可想而知无数的流言蜚语向你扑面而来如同春天绽放的花朵的芬芳，挡不住，然而压力的过大，确实会让你崩溃。', '　秋，这个熟悉又充满诗意的季节，收获的季节同时对于不同职业的人们来讲却意义不同。有人曾说宰相肚子里能撑船，我想这句话并不是说那么简单，多数人认为是说这个人有度量，能宽松别人，可是真的是这样吗？我认为是他真正的看到了自己的标准。', '1');
INSERT INTO `enroll` VALUES ('3063', '183', '5', '他山之石，可以攻玉。(诗经小雅鹤鸣)', '言者无罪，闻者足戒。(诗经大序)', '人而无仪，不死何为。(诗经风相鼠)', '知我者，谓我心忧，不知我者，谓我何求(诗经王风黍离)', '1');
INSERT INTO `enroll` VALUES ('3064', '184', '5', '从善如登，从恶如崩。(国语)\r\n\r\n　　【释义】：从，顺随。顺随善良象登山一样，顺随恶行象山崩一样。比喻学好很难，学坏极容易。', '满招损，谦受益。(尚书大禹谟)\r\n\r\n　　【释义】：谦虚可以得到益处，自满会招致损失。', '天作孽，犹可违，自作孽，不可活。(尚书)\r\n\r\n　　【释义】：上天降下的灾害还可以逃避;自己造成的罪孽可就无处可逃。多被引用自作自受时的感受。也可以理解为：人的命运是可以改造的，所以“天作孽，犹可违”，但是自己不上进，就是“自作孽，不可活”。', '投我以桃，报之以李。(诗经大雅抑)\r\n\r\n　　【释义】：简单说，就是礼尚往来。往而不来，非礼也。', '1');
INSERT INTO `enroll` VALUES ('3065', '85', '4', '喜欢读书。', '大家好，我是王晓丹，我是个热爱生活，喜欢旅行的女生，有责任感，能承担。', '我容易相处可以团结同学，认真负责，积极参与活动。', '我会完成交给交给我的任务，积极响应部长交代的任务。', '1');
INSERT INTO `enroll` VALUES ('3066', '185', '5', '知人者智，自知者明。(老子)\r\n\r\n　　【释义】：能认识别人的叫做机智，能认识自己的才叫做高明。', '人非圣贤，孰能无过?过而能改，善莫大焉。(左传)\r\n\r\n　　【释义】：一般人不是圣人和贤人，谁能不犯错?错了能够改正，没有比这更好的了。', '居安思危，思则有备，有备无患。(左传)\r\n\r\n　　【释义】：居，处于;思，想。虽然处在平安的环境里，也想到有出现危险的可能。指随时应有应付意外事件的思想准备，才可以做到遇意外事不慌张，正确处理。', '多行不义必自毙。(左传)\r\n\r\n　　【释义】：多做恶事者，必自速其亡。', '1');
INSERT INTO `enroll` VALUES ('3067', '85', '30', '喜欢读书。', '大家好，我是王晓丹，我是个热爱生活，喜欢旅行的女生，有责任感，能承担。', '我容易相处可以团结同学，认真负责，积极参与活动。', '我会完成交给交给我的任务，积极响应部长交代的任务。', '1');
INSERT INTO `enroll` VALUES ('3068', '85', '15', '喜欢读书。', '大家好，我是王晓丹，我是个热爱生活，喜欢旅行的女生，有责任感，能承担。', '我容易相处可以团结同学，认真负责，积极参与活动。', '我会完成交给交给我的任务，积极响应部长交代的任务。', '1');
INSERT INTO `enroll` VALUES ('3069', '186', '5', '敏而好学，不耻下问。(论语公冶长)\r\n\r\n　　【释义】：敏：聪明;好：喜好。天资聪明而又好学，不以向地位比自己低、学识比自己差的人请教为耻。警示要谦虚谨慎，才容易汲取他人经验，以利自己。', '合抱之木，生于毫末;九层之台，起于累土;千里之行，始于足下。(老子)\r\n\r\n　　【释义】：合抱的大树，生长于细小的萌芽;九层的高台，筑起于每一堆泥土;千里的远行，是从脚下第一步开始走出来的。警示人们再大的事情，再高的成就，都是踏踏实实，从小做起的。', '祸兮福之所倚，福兮祸之所伏。(老子)\r\n\r\n　　【释义】：意思是祸与福互相依存，可以互相转化。比喻坏事如果吸取经验并认真改变，可以引出好的结果，好事如果不认真做，也可以引出坏的结果。', '信言不美，美言不信。(老子)\r\n\r\n　　【释义】：真实的、值得相信的话语不会用美装扮起来的(也就是花言巧语);花言巧语是不能相信的。善良的人不会进行硬行地争辩;硬行地争辩的人是不会善良的。', '1');
INSERT INTO `enroll` VALUES ('3070', '85', '60', '喜欢读书。', '大家好，我是王晓丹，我是个热爱生活，喜欢旅行的女生，有责任感，能承担。', '我容易相处可以团结同学，认真负责，积极参与活动。', '我会完成交给交给我的任务，积极响应部长交代的任务。', '1');
INSERT INTO `enroll` VALUES ('3071', '85', '37', '喜欢读书。', '大家好，我是王晓丹，我是个热爱生活，喜欢旅行的女生，有责任感，能承担。', '我容易相处可以团结同学，认真负责，积极参与活动。', '我会完成交给交给我的任务，积极响应部长交代的任务。', '1');
INSERT INTO `enroll` VALUES ('3073', '187', '5', '岁寒，然后知松柏之后凋也。(论语子罕)\r\n\r\n　　【释义】：年岁寒冷，才知道松树和柏树最后萎谢的道理。比喻经过严酷考验，能力才会提高。', '君子坦荡荡，小人长戚戚。(论语述而)\r\n\r\n　　【释义】：戚，忧愁、烦恼。君子心胸开朗，思想上坦率洁净，外貌动作也显得十分舒畅安定。小人心里欲念太多，心理负担很重，就常忧虑、担心，外貌、动作也显得忐忑不安，常是坐不定，站不稳的样子。', '工欲善其事，必先利其器。(论语卫灵公)\r\n\r\n　　【释义】：要做好工作，先要使工具锋利。比喻要做好一件事，准备工作非常重要。', '己所不欲，勿施于人。(论语颜渊)\r\n\r\n　　【释义】：欲：想做的事;勿：不要;施：强加。自己不想做的事情，不要强加给别人。', '1');
INSERT INTO `enroll` VALUES ('3074', '196', '5', '知之者不如好之者，好之者不如乐之者。(论语雍也)\r\n\r\n　　【释义】：懂得它的人，不如爱好它的人;爱好它的人，又不如以它为乐的人。', '知之为知之，不知为不知，是知也。(论语为政)\r\n\r\n　　【释义】：知道就是知道，不知道就是不知道，这才是聪明智慧。', '知者不惑，仁者不忧，勇者不惧。(论语子罕)\r\n\r\n　　【释义】：知道的人不会疑惑。仁爱的人不会忧愁。勇敢的人不会惧怕。', '学而不思则罔，思而不学则殆。(论语为政)\r\n\r\n　　【释义】：学习而不思考，人会被知识的表象所蒙蔽;思考而不学习，则会因为疑惑而更加危险。', '1');
INSERT INTO `enroll` VALUES ('3075', '86', '4', '喜欢唱歌。', '我叫赵莅佳，是个活泼的女生。', '我加入社团一方面是想拥有丰富的大学生活，让自己更加充实，另一方面是想多结交一些朋友，很多人说自己最好的朋友都是在社团中认识的。', '我希望可以多认识学长学姐，建立更好的人际关系。还有就是通过社团锻炼自己的口才和社交能力，以便将来可以更好地适应社会。	', '1');
INSERT INTO `enroll` VALUES ('3076', '86', '30', '我喜欢跳舞。', '我叫赵莅佳，是个活泼的女生。', '我加入社团一方面是想拥有丰富的大学生活，让自己更加充实，另一方面是想多结交一些朋友，很多人说自己最好的朋友都是在社团中认识的。', '我希望可以多认识学长学姐，建立更好的人际关系，还有就是通过社团锻炼自己的口才和社交能力，以便将来可以更好地适应社会。	', '1');
INSERT INTO `enroll` VALUES ('3077', '86', '13', '我喜欢跳舞。', '我叫赵莅佳，是个活泼的女生。', '我加入社团一方面是想拥有丰富的大学生活，让自己更加充实，另一方面是想多结交一些朋友，很多人说自己最好的朋友都是在社团中认识的。', '我希望可以多认识学长学姐，建立更好的人际关系还有就是通过社团锻炼自己的口才和社交能力，以便将来可以更好地适应社会。	', '1');
INSERT INTO `enroll` VALUES ('3078', '86', '51', '我喜欢跳舞。', '我叫赵莅佳，是个活泼的女生。', '我加入社团一方面是想拥有丰富的大学生活，让自己更加充实，另一方面是想多结交一些朋友，很多人说自己最好的朋友都是在社团中认识的。', '我希望可以多认识学长学姐，建立更好的人际关系。还有就是通过社团锻炼自己的口才和社交能力，以便将来可以更好地适应社会。	', '1');
INSERT INTO `enroll` VALUES ('3079', '86', '61', '我喜欢跳舞。', '我叫赵莅佳，是个活泼的女生。', '我加入社团一方面是想拥有丰富的大学生活，让自己更加充实，另一方面是想多结交一些朋友，很多人说自己最好的朋友都是在社团中认识的。', '我希望可以多认识学长学姐，建立更好的人际关系。还有就是通过社团锻炼自己的口才和社交能力，以便将来可以更好地适应社会。	', '1');
INSERT INTO `enroll` VALUES ('3080', '86', '37', '我喜欢跳舞。', '我叫赵莅佳，是个活泼的女生。', '我加入社团一方面是想拥有丰富的大学生活，让自己更加充实，另一方面是想多结交一些朋友，很多人说自己最好的朋友都是在社团中认识的', '我希望可以多认识学长学姐，建立更好的人际关系。还有就是通过社团锻炼自己的口才和社交能力，以便将来可以更好地适应社会。	', '1');
INSERT INTO `enroll` VALUES ('3081', '87', '4', '画画', '我性格外向随和，善与人交际，有胆量，有积极性，有责任心，喜欢挑战自己，随时准备做一些新的尝试。最重要的是我有一个健壮的体魄和一颗热忱的心。', '我来到这个需要有耐心、毅力和出类拔萃社交能力的勤工部，就是要挑战自己，磨练自己，给自己一个全面展示自己的机会。', '希望给社团添砖加瓦，让社团变得更好。\r\n', '1');
INSERT INTO `enroll` VALUES ('3082', '87', '18', '画画', '我性格外向随和，善与人交际，有胆量，有积极性，有责任心，喜欢挑战自己，随时准备做一些新的尝试。最重要的是我有一个健壮的体魄和一颗热忱的心。', '我来到这个需要有耐心、毅力和出类拔萃社交能力的外联部，就是要挑战自己，磨练自己，给自己一个全面展示自己的机会。希望给社团添砖加瓦，让社团变得更好。\r\n', '希望给社团添砖加瓦，发展更好。', '1');
INSERT INTO `enroll` VALUES ('3083', '87', '41', '画画', '我性格外向随和，善与人交际，有胆量，有积极性，有责任心，喜欢挑战自己，随时准备做一些新的尝试。最重要的是我有一个健壮的体魄和一颗热忱的心。\r\n', '我来到这个需要有耐心、毅力和出类拔萃社交能力的外联部，就是要挑战自己，磨练自己，给自己一个全面展示自己的机会。', '希望给社团添砖加瓦，让社团变得更好。', '1');
INSERT INTO `enroll` VALUES ('3084', '87', '67', '画画', '我性格外向随和，善与人交际，有胆量，有积极性，有责任心，喜欢挑战自己，随时准备做一些新的尝试。最重要的是我有一个健壮的体魄和一颗热忱的心。', '我来到这个需要有耐心、毅力和出类拔萃社交能力的外联部，就是要挑战自己，磨练自己，给自己一个全面展示自己的机会。\r\n', '希望给社团添砖加瓦，让社团变得更好。', '1');
INSERT INTO `enroll` VALUES ('3085', '87', '62', '画画\r\n', '我性格外向随和，善与人交际，有胆量，有积极性，有责任心，喜欢挑战自己，随时准备做一些新的尝试。最重要的是我有一个健壮的体魄和一颗热忱的心。', '我来到这个需要有耐心、毅力和出类拔萃社交能力的外联部，就是要挑战自己，磨练自己，给自己一个全面展示自己的机会。', '希望给社团添砖加瓦，让社团变得更好。\r\n', '1');
INSERT INTO `enroll` VALUES ('3086', '87', '31', '画画', '我性格外向随和，善与人交际，有胆量，有积极性，有责任心，喜欢挑战自己，随时准备做一些新的尝试。最重要的是我有一个健壮的体魄和一颗热忱的心。', '我来到这个需要有耐心、毅力和出类拔萃社交能力的外联部，就是要挑战自己，磨练自己，给自己一个全面展示自己的机会。', '希望给社团添砖加瓦，让社团变得更好。\r\n', '1');
INSERT INTO `enroll` VALUES ('3087', '88', '4', '读书', '大家好，我是王梦娇，我是个内向的女孩，我乐于助人，所以想来的勤工部的大家庭。', '乐于助人，积极团结同学，工作认真负责。', '希望在社团可以弥补自己的缺点，发挥长处，促进社团发展。', '1');
INSERT INTO `enroll` VALUES ('3088', '88', '16', '读书', '大家好，我是王梦娇，我是个内向的女孩，我乐于助人，所以想来的勤工部的大家庭。', '乐于助人，积极团结同学，工作认真负责。', '希望在社团可以弥补自己的缺点，发挥长处，促进社团发展。', '1');
INSERT INTO `enroll` VALUES ('3089', '88', '60', '读书', '大家好，我是王梦娇，我是个内向的女孩，我乐于助人，所以想来的勤工部的大家庭。', '乐于助人，积极团结同学，工作认真负责。', '希望在社团可以弥补自己的缺点，发挥长处，促进社团发展。', '1');
INSERT INTO `enroll` VALUES ('3090', '88', '51', '读书', '是王梦娇，我是个内向的女孩，我乐于助人，所以想来的勤工部的大家庭。', '大家好，我乐于助人，积极团结同学，工作认真负责。', '希望在社团可以弥补自己的缺点，发挥长处，促进社团发展。', '1');
INSERT INTO `enroll` VALUES ('3091', '88', '65', '读书', '大家好，我是王梦娇，我是个内向的女孩，我乐于助人，所以想来的勤工部的大家庭。', '乐于助人，积极团结同学，工作认真负责。', '希望在社团可以弥补自己的缺点，发挥长处，促进社团发展。', '1');
INSERT INTO `enroll` VALUES ('3092', '88', '34', '读书', '大家好，我是王梦娇，我是个内向的女孩，我乐于助人，所以想来的勤工部的大家庭。', '乐于助人，积极团结同学，工作认真负责。', '希望在社团可以弥补自己的缺点，发挥长处，促进社团发展。', '1');
INSERT INTO `enroll` VALUES ('3093', '89', '4', '我的爱好广泛，喜欢旅行、听音乐、下棋、各种体育运动。\r\n\r\n', '我性格开朗,健谈，常常面带笑容，喜欢以微笑待人，喜欢把自己的快乐与所有的人分享。\r\n', '我是一个做事踏实、学习刻苦、有上进心的学生。', '刚踏进大学，我就严格要求自己，立志要在大学生涯中有所成就，从全方面发展自己。', '1');
INSERT INTO `enroll` VALUES ('3094', '89', '14', '我的爱好广泛，喜欢旅行、听音乐、下棋、各种体育运动。\r\n\r\n', '我性格开朗,健谈，常常面带笑容，喜欢以微笑待人，喜欢把自己的快乐与所有的人分享。\r\n', '我是一个做事踏实、学习刻苦、有上进心的学生。', '刚踏进大学，我就严格要求自己，立志要在大学生涯中有所成就，从全方面发展自己。', '1');
INSERT INTO `enroll` VALUES ('3095', '90', '4', '\r\n我的爱好广泛，喜欢旅行、听音乐、下棋、各种体育运动。\r\n\r\n', '我是一个做事踏实、学习刻苦、有上进心的学生。', '我性格开朗,健谈，常常面带笑容，喜欢以微笑待人，喜欢把自己的快乐与所有的人分享。', '刚踏进大学，我就严格要求自己，立志要在大学生涯中有所成就，从全方面发展自己。', '1');
INSERT INTO `enroll` VALUES ('3096', '91', '4', '画画\r\n', '大家好！我是来自经济学系的-----。我的性格活泼开朗，喜欢广泛交友，平时也很喜欢参加各种活动，因此有着良好的人际关系。', '我的思想比较活跃，经常有不错的创意和点子，我特别希望能够加入靑年志愿者协会，和大家一起努力，', '策划出更多丰富多彩的活动，并且通过这些活动真正的达到完善自己，辐射他人的目的。', '1');
INSERT INTO `enroll` VALUES ('3097', '92', '4', '唱歌\r\n', '我觉得自己是一个活泼开朗，积极向上的阳光型男孩。简单做人，踏实做事，做最好的自己', '与人交际要随和，要亲切，要有礼貌，还要时刻保持微笑，以真诚之心待人。对待学习和工作，就要收起嘻嘻哈哈的笑脸，认认真真，一丝不苟，对自己所做的事情负起自己的一份责任。', '做人做事最后要形成自己的风格，然后将这种风格由己及人，为他人的学习生活提供一种借鉴。', '1');
INSERT INTO `enroll` VALUES ('3098', '93', '4', ' 我的爱好广泛，喜欢旅行、听音乐、下棋、各种体育运动。 ', '我性格开朗,健谈，常常面带笑容，喜欢以微笑待人，喜欢把自己的快乐与所有的人分享。', '刚踏进大学，我就严格要求自己，立志要在大学生涯中有所成就，从全方面发展自己。', '做一个做事踏实、学习刻苦、有上进心的学生。 ', '1');
INSERT INTO `enroll` VALUES ('3099', '94', '4', '跳舞', '我叫贾晓敏，是个外向活泼的女孩子，我喜欢旅行和自由。', '在社团里与同学互帮互助，不断学习新知识。', '弥补自己的不足。', '1');
INSERT INTO `enroll` VALUES ('3100', '95', '4', '旅游', '我叫许峰，是个有责任心的男生，总是能认真及时的完成任务。', '积极为社团尽一份力。', '完善自己。', '1');
INSERT INTO `enroll` VALUES ('3101', '96', '3', '跳舞', '我叫韩珊珊，是个偏内向的女孩子，但是朴实肯干。', '希望在社团发挥自己特长完善自己。', '通过社团让自己变得更外向。', '7');
INSERT INTO `enroll` VALUES ('3102', '97', '4', '旅游', '我叫李晓萱，喜欢新鲜事物，对社团有巨大的好奇心，态度诚恳。', '希望在社团可以尽自己的最多努力，建设社团。', '希望在社团可以结交更多朋友。', '1');
INSERT INTO `enroll` VALUES ('3103', '98', '4', '书法', '我叫廖文慧，是个活泼开朗的人，热爱书法，热爱生活。', '积极参与活动为社团增添光彩。', '磨练性格', '1');
INSERT INTO `enroll` VALUES ('3104', '99', '4', '戏曲', '我叫马小斐，热爱中国古典戏曲，充满自信，乐于助人。', '积极参加社团活动，团结同学', '完善自己', '1');
INSERT INTO `enroll` VALUES ('3105', '100', '4', '书法', '我叫王志超，热爱生活，积极进取，团结同学。', '积极参加活动，总结经验', '完善自己的缺点。', '1');
INSERT INTO `enroll` VALUES ('3106', '101', '4', '书法', '我叫王纪敏，是个内向的女孩子，但有责任感，能承担起任务。', '为社团出一份自己的力量', '让自己更外向', '1');
INSERT INTO `enroll` VALUES ('3107', '347', '6', '1、专业知识牢固，曾在12年的“全国大学生英语知识竞赛”三等奖;\r\n2、在校担任院社团联合会考评部部长一职，具有良好的团队意识和沟通潜力，带领本部门获得了“优秀部门”，本人也获得了“优秀部长”称号;\r\n3、成绩优秀，曾获学院“三等奖学金”;', '1、阳光开朗、积极向上、做事认真负责。\r\n2、学习能力，沟通能力，组织能力良好。\r\n3、以谨慎的工作作风，认真积极的工作态度，细心完成本职工作。本人工作踏实，刻苦耐劳，如有幸被录用我将会竭尽全力为贵单位创造效益，以尽情体现自身能力和价值。', '大学生通过参加“青年志愿者协会”等公益组织的活动，通过走入社区、乡村、孤儿院、敬老院等为他人服务，为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上。', '大学生通过参加“青年志愿者协会”等公益组织的活动，通过走入社区、乡村、孤儿院、敬老院等为他人服务，为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上。', '1');
INSERT INTO `enroll` VALUES ('3108', '346', '6', '1。电脑应用熟练，熟练操作Word，Excel，，Outlook，ERP等各种办公软件;\r\n2。勤奋上进好学，工作细心，条理清晰，踏实肯干，有很强的职责心;\r\n3。性格开朗乐观，善于人际交流和沟通，具备团队合作精神;\r\n4。喜好书法并有必须的书写潜力。', '本人性格开朗，为人细心，做事一丝不苟，能吃苦耐劳，工作脚踏实地，有较强的责任心，具有团队合作精神，又具有较强的独立工作能力，思维活跃，能独挡一面。\r\n同时本人有较强的沟通能力及管理能力，希望能尽快收到面试通知，面对面与您详细交谈，凭借多年的丰富阅历与实战经验，我敢保证，我将给您提交一份满意的答卷。', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感。', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感。', '1');
INSERT INTO `enroll` VALUES ('3109', '345', '6', '　我是一个乐观向上、工作充满激情、对未来有完美向往的年轻小伙子。\r\n　　我很喜欢参加各活动，因为这样能够更好的锻炼自我，我以前和同学一齐举办过假期补课班，并且成功了。还参加了学校的招生工作。\r\n　　在校期间一向身为班干部，还做过校园广播站修改。\r\n　　我对自我充满信心，无论是做过的事，还是对于一件新鲜的事情，我都会努力去做，并且尽自我的潜力将他做好，我为人很谦虚，只要别人在某方面比我强，我就会很谦虚的去请教。我渴望能跟一些高素质的人群在一齐工作，这样会让我有危机感，让我不断去学习、去拼搏。我不好做表面工作，喜欢踏实工作。', '1、本人性格开朗、稳重、有活力，待人热情、真诚;工作认真负责，积极主动，能吃苦耐劳，用于承受压力，勇于创新;有很强的组织能力和团队协作精神，具有较强的适应能力;纪律性强，工作积极配合;意志坚强，具有较强的无私奉献精神。\r\n　　2、对待工作认真负责，善于沟通、协调有较强的组织能力与团队精神;活泼开朗、乐观上进、有爱心并善于施教并行;上进心强、勤于学习能不断提高自身的能力与综合素质。\r\n　　3、工作期间，曾多次获得“每月之星”，深得领导的信任和关注。', ' 大学生在假期、周末、课余时间，放下课本，参加社团活动，广泛接触社会，与各种人交往，学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实。社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质。', ' 大学生在假期、周末、课余时间，放下课本，参加社团活动，广泛接触社会，与各种人交往，学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实。社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质。', '1');
INSERT INTO `enroll` VALUES ('3110', '344', '6', '本人经过三年多扎实的工作实践，现已能够独立操作整个外贸流程。工作踏实、细致、认真。具有较好的文字组织潜力，有必须的英语听说读写潜力，能都熟练操作windows平台上的个类应用软件(如ps/\'target=\'_blank\'>photoshop、word2000、excel2000)，动手潜力较强。\r\n　　本人具有较强的职责心和工作主动性，较好的组织协调潜力和应变潜力，能够和各个部门的同事相处融洽，配合顺利地完成工作任务。为人诚实并得到领导的认可!曾去广州、上海等地参加国际性展会，有翻译和外贸经验及出国参展经验!本人性格开朗，善于沟通，谦虚，自信。虽然新的工作和环境与以往的有所不一样，但我相信透过自我的努力和已有的工作基础能够很快胜任，对此我很有信心!', '　1、本人性格开朗、稳重、有活力，待人热情、真诚;工作认真负责，积极主动，能吃苦耐劳，用于承受压力，勇于创新;有很强的组织能力和团队协作精神，具有较强的适应能力;纪律性强，工作积极配合;意志坚强，具有较强的无私奉献精神。\r\n　　2、对待工作认真负责，善于沟通、协调有较强的组织能力与团队精神;活泼开朗、乐观上进、有爱心并善于施教并行;上进心强、勤于学习能不断提高自身的能力与综合素质。\r\n　　3、工作期间，曾多次获得“每月之星”，深得领导的信任和关注。', ' 很多人说，初中、高中的学习太枯燥了，没有让年轻人的个性得到充分的发挥。 那么，在大学里，在社团里，你的个性可以得到充分的施展。每位大学生的需求、动机和兴趣、信念都不可能完全一样，所以大学生的个性发展自然也是不同的，因种种条件的限制，大学的课堂教育仅仅解决了大学生的对于更高水平知识的需求问题，要做到完全对个性的培养尚存较大差距。社团活动无疑在解决个性培养上发挥着重要作用。', ' 很多人说，初中、高中的学习太枯燥了，没有让年轻人的个性得到充分的发挥。 那么，在大学里，在社团里，你的个性可以得到充分的施展。每位大学生的需求、动机和兴趣、信念都不可能完全一样，所以大学生的个性发展自然也是不同的，因种种条件的限制，大学的课堂教育仅仅解决了大学生的对于更高水平知识的需求问题，要做到完全对个性的培养尚存较大差距。社团活动无疑在解决个性培养上发挥着重要作用。', '1');
INSERT INTO `enroll` VALUES ('3111', '343', '6', '　我对计算机有着十分浓厚的兴趣。我能熟练使用frontpage和dreamweaver、photeshop等网页制作工具。本人自我做了一个个人主页，日访问量已经到达了100人左右。透过互联网，我不仅仅学到了很多在日常生活中学不到的东西，而且坐在电脑前轻点鼠标就能尽晓天下事的快乐更是别的任何活动所不及的。\r\n　　在大学期间，我多次获得各项奖学金，而且发表过多篇论文。我还担任过班长、团支书，具有很强的组织和协调潜力。很强的事业心和职责感使我能够面队任何困难和挑战。', '热情随和，活波开朗，具有进取精神和团队精神，有较强的动手能力。良好协调沟通能力，适应力强，反应快、积极、灵活，爱创新!提高自己，适应工作的需要。所以我希望找一份与自身知识结构相关的工作，具有一定的社会交往能力，具有优秀的组织和协调能力。在学习中，我注重理论与实践的结合，己具备了相当的实践操作能力。熟练操作计算机办公软件。很强的事业心和责任感使我能够面对任何困难和挑战。', '大学生通过参加“青年志愿者协会”等公益组织的活动，通过走入社区、乡村、孤儿院、敬老院等为他人服务，为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上。', '大学生通过参加“青年志愿者协会”等公益组织的活动，通过走入社区、乡村、孤儿院、敬老院等为他人服务，为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上。', '1');
INSERT INTO `enroll` VALUES ('3112', '342', '6', '\r\n　　本人具有较强的职责心和工作主动性，较好的组织协调潜力和应变潜力，能够和各个部门的同事相处融洽，配合顺利地完成工作任务。为人诚实并得到领导的认可!曾去广州、上海等地参加国际性展会，有翻译和外贸经验及出国参展经验!本人性格开朗，善于沟通，谦虚，自信。虽然新的工作和环境与以往的有所不一样，但我相信透过自我的努力和已有的工作基础能够很快胜任，对此我很有信心!', '本人性格开朗、稳重、有活力，待人热情、真诚;工作认真负责，积极主动，能吃苦耐劳，用于承受压力，勇于创新;有很强的组织能力和团队协作精神，具有较强的适应能力;纪律性强，工作积极配合;意志坚强，具有较强的无私奉献精神。', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感。', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感。', '1');
INSERT INTO `enroll` VALUES ('3113', '341', '6', '我是一个乐观向上、工作充满激情、对未来有完美向往的年轻小伙子。\r\n　　我很喜欢参加各活动，因为这样能够更好的锻炼自我，我以前和同学一齐举办过假期补课班，并且成功了。还参加了学校的招生工作。', '对待工作认真负责，善于沟通、协调有较强的组织能力与团队精神;活泼开朗、乐观上进、有爱心并善于施教并行;上进心强、勤于学习能不断提高自身的能力与综合素质。', '学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实。社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质。', '学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实。社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质。', '1');
INSERT INTO `enroll` VALUES ('3114', '340', '6', '性格开朗乐观，善于人际交流和沟通，具备团队合作精神;\r\n喜好书法并有必须的书写潜力。', '热情随和，活波开朗，具有进取精神和团队精神，有较强的动手能力。良好协调沟通能力，适应力强，反应快、积极、灵活，爱创新!提高自己', '潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感', '潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感', '1');
INSERT INTO `enroll` VALUES ('3115', '339', '6', '　我很喜欢参加各活动，因为这样能够更好的锻炼自我，我以前和同学一齐举办过假期补课班，并且成功了。还参加了学校的招生工作。', '自学能力强，善于思考，吃苦耐劳，有良好的沟通能力，善于与他人相处，富有团队合作精神，热爱运动', '大学生在假期、周末、课余时间，放下课本，参加社团活动，广泛接触社会，与各种人交往，学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实', '大学生在假期、周末、课余时间，放下课本，参加社团活动，广泛接触社会，与各种人交往，学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实', '1');
INSERT INTO `enroll` VALUES ('3116', '338', '6', '　我对自我充满信心，无论是做过的事，还是对于一件新鲜的事情，我都会努力去做，并且尽自我的潜力将他做好，我为人很谦虚，只要别人在某方面比我强，我就会很谦虚的去请教。我渴望能跟一些高素质的人群在一齐工作，这样会让我有危机感，让我不断去学习、去拼搏。我不好做表面工作，喜欢踏实工作。', '人非完人，自己在某些方面还是有一定的不足，比如知识，社会经验等;不过我相信这些都是可以通过自己努力的学习来提高的，我也正朝着这个方向努力!能吃苦耐劳，愿从基层做起;以集体利益为第一原则，遵守公司的规章制度', '社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质', '社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质', '1');
INSERT INTO `enroll` VALUES ('3117', '337', '6', '我很喜欢参加各活动，因为这样能够更好的锻炼自我，我以前和同学一齐举办过假期补课班，并且成功了。还参加了学校的招生工作', '我注重理论与实践的结合，己具备了相当的实践操作能力。熟练操作计算机办公软件。很强的事业心和责任感使我能够面对任何困难和挑战', '在大学里，在社团里，你的个性可以得到充分的施展。每位大学生的需求、动机和兴趣、信念都不可能完全一样，所以大学生的个性发展自然也是不同的，因种种条件的限制，大学的课堂教育仅仅解决了大学生的对于更高水平知识的需求问题，要做到完全对个性的培养尚存较大差距', '在大学里，在社团里，你的个性可以得到充分的施展。每位大学生的需求、动机和兴趣、信念都不可能完全一样，所以大学生的个性发展自然也是不同的，因种种条件的限制，大学的课堂教育仅仅解决了大学生的对于更高水平知识的需求问题，要做到完全对个性的培养尚存较大差距', '1');
INSERT INTO `enroll` VALUES ('3118', '336', '6', '只要别人在某方面比我强，我就会很谦虚的去请教。我渴望能跟一些高素质的人群在一齐工作，这样会让我有危机感，让我不断去学习、去拼搏。我不好做表面工作，喜欢踏实工作。', '　热情随和，活波开朗，具有进取精神和团队精神，有较强的动手能力。良好协调沟通能力，适应力强，反应快、积极、灵活，爱创新!提高自己，适应工作的需要。所以我希望找一份与自身知识结构相关的工作', '有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物', '有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物', '1');
INSERT INTO `enroll` VALUES ('3119', '335', '6', '很喜欢参加各活动，因为这样能够更好的锻炼自我，我以前和同学一齐举办过假期补课班，并且成功了。还参加了学校的招生工作。', '在学习中，我注重理论与实践的结合，己具备了相当的实践操作能力。熟练操作计算机办公软件。很强的事业心和责任感使我能够面对任何困难和挑战。', '学生在假期、周末、课余时间，放下课本，参加社团活动，广泛接触社会，与各种人交往，学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实', '学生在假期、周末、课余时间，放下课本，参加社团活动，广泛接触社会，与各种人交往，学到许多在课堂上难以学到的东西，使自己更了解社会、融入社会，一改往日大部分人对于大学生“只会贪图享受”的传统观念，看问题天真幼稚的作风，使自己思想意识接近社会现实', '1');
INSERT INTO `enroll` VALUES ('3120', '331', '6', '是一个乐观向上、工作充满激情、对未来有完美向往的年轻小伙子。', '自学能力强，善于思考，吃苦耐劳，有良好的沟通能力，善于与他人相处，富有团队合作精神，热爱运动', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强', '1');
INSERT INTO `enroll` VALUES ('3121', '329', '6', '在校担任院社团联合会考评部部长一职，具有良好的团队意识和沟通潜力，带领本部门获得了“优秀部门”，本人也获得了“优秀部长”称号;', '热情随和，活波开朗，具有进取精神和团队精神，有较强的动手能力。良好协调沟通能力，适应力强，反应快、积极、灵活，爱创新!提高自己，适应工作的需要。所以我希望找一份与自身知识结构相关的工作，具有一定的社会交往能力，具有优秀的组织和协调能力', '使自己思想意识接近社会现实。社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质', '使自己思想意识接近社会现实。社会实践类社团、志愿者类社团，带领学生走出校门，走向社会，深入农村，深入企业，关心社会“弱势群体”，广泛深入地了解社会，与方方面面的交往，积极进行实习、实践活动，提高了大学生适应社会的能力与素质', '1');
INSERT INTO `enroll` VALUES ('3122', '328', '14', '　本人曾在校社团联合会网络信息部和检验学院学生会工作，并担任班干部;培养了我良好的领导、管理、协作、交际沟通和创新潜力，使我能客观理智地应对问题，顾全大局，对凡事持寻求解决的态度。', '在学习中，我注重理论与实践的结合，己具备了相当的实践操作能力。熟练操作计算机办公软件。很强的事业心和责任感使我能够面对任何困难和挑战。', '大学生通过参加“青年志愿者协会”等公益组织的活动，通过走入社区、乡村、孤儿院、敬老院等为他人服务，为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上', '大学生通过参加“青年志愿者协会”等公益组织的活动，通过走入社区、乡村、孤儿院、敬老院等为他人服务，为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上', '1');
INSERT INTO `enroll` VALUES ('3123', '314', '6', '我性格开朗、用心上进;具有良好的团队精神和人际关系，对待工作认真负责、勤恳耐劳，耐心细心', '适应力强，反应快、积极、灵活，爱创新!提高自己，适应工作的需要。所以我希望找一份与自身知识结构相关的工作，具有一定的社会交往能力', '有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关', '有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关', '1');
INSERT INTO `enroll` VALUES ('3124', '311', '6', '，在工作中善于到激励他人的作用，同时善于并热爱与人沟通交流;敢于开拓创新，有着强烈的事业心与职责感，对人生和事业充满热情和憧憬。', '在学习中，我注重理论与实践的结合，己具备了相当的实践操作能力。熟练操作计算机办公软件。很强的事业心和责任感使我能够面对任何困难和挑战', '为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上。', '为社会无私奉献，经受社会实践的锻炼，可以使学生树立起无私奉献的价值观和世界观，艰苦奋斗的精神和为人民服务的思想。大学生对待人生的态度也会因此变得积极向上。', '1');
INSERT INTO `enroll` VALUES ('3125', '301', '6', '一年的实习工作更是丰富了我的阅历，培养了我开拓创新的思维和解决问题的潜力，更加系统地掌握了临床各项检测的基础理论和基础操作技术，掌握了微生物、病毒的实验检验原理和操作技术，有较强的综合分析潜力和动手潜力，也具有必须的科研潜力', '热情随和，活波开朗，具有进取精神和团队精神，有较强的动手能力。良好协调沟通能力，适应力强', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感。', '大学生的社团活动通常集知识性、趣味性于一体，适合大学生思维活跃、接受信息快、可塑性强的特点，容易被学生所接受，有利于形成凝聚力，在社团内形成了团结互助、平等友爱、共同前进的人际关系，潜移默化地使大学生的集体主义观念得以增强。社团的生死存亡与社团所有的人都息息相关，大家都希望社团发展壮大，都关心社团的各项事物，逐步培养了每个成员的责任感。', '1');
INSERT INTO `enroll` VALUES ('3126', '108', '3', '下棋，画画，篮球，溜冰，滑板，游泳', '我叫王陈铖，是一名三年级的小学生。今年9岁，1米35的个头，体重26公斤。我浓浓的眉毛下有一双炯炯有神的大眼睛，乌黑的眼球像两颗算盘珠。眼睛的下面有一个扁扁的鼻子，平坦的鼻梁上还架着一副眼镜，这让我看上去很有学问，摘下眼镜，你会发现我的眼睛下有两块斑点。呵呵，这让我原本英俊的脸蛋失去了一点点光彩。不过，我还是蛮自信，因为我还是那么帅', '有时，我还帮妈妈做一些家务，洗碗，洗衣服。但我最喜欢看书，这个暑假，我已看了20本课外书，只要有好看的书，我都会让妈妈帮我在网上订购。从书中，我不仅能增长知识，还能懂得许多道理。最近，我迷上了《西游记》，一共有上下两侧。虽然书上还有一些字我不认识，那也没有关系，我感兴趣是它的故事情节。妈妈经常叫我小慢马，小书虫。因为我一看上书，什么事情都不管。', '我的缺点有许多，最主要的就是马虎。比如在数学方面，我经常把算数算错，有时会把加法看成减法，乘法看成除法。在语文上，上次期末考试，本来能考得好成绩，可我居然有一题漏做了，结果只靠了97分。你看我马虎不马虎？\r\n俗话说得好，人无完人。你们现在认识我了吧，想和我做朋友吗？', '3');
INSERT INTO `enroll` VALUES ('3127', '108', '9', '下棋，画画，篮球，溜冰，滑板，游泳', '我叫王陈铖，是一名三年级的小学生。今年9岁，1米35的个头，体重26公斤。我浓浓的眉毛下有一双炯炯有神的大眼睛，乌黑的眼球像两颗算盘珠。眼睛的下面有一个扁扁的鼻子，平坦的鼻梁上还架着一副眼镜，这让我看上去很有学问，摘下眼镜，你会发现我的眼睛下有两块斑点。呵呵，这让我原本英俊的脸蛋失去了一点点光彩。不过，我还是蛮自信，因为我还是那么帅。', '有时，我还帮妈妈做一些家务，洗碗，洗衣服。但我最喜欢看书，这个暑假，我已看了20本课外书，只要有好看的书，我都会让妈妈帮我在网上订购。从书中，我不仅能增长知识，还能懂得许多道理。最近，我迷上了《西游记》，一共有上下两侧。虽然书上还有一些字我不认识，那也没有关系，我感兴趣是它的故事情节。妈妈经常叫我小慢马，小书虫。因为我一看上书，什么事情都不管。', '我的缺点有许多，最主要的就是马虎。比如在数学方面，我经常把算数算错，有时会把加法看成减法，乘法看成除法。在语文上，上次期末考试，本来能考得好成绩，可我居然有一题漏做了，结果只靠了97分。你看我马虎不马虎？\r\n俗话说得好，人无完人。你们现在认识我了吧，想和我做朋友吗？', '2');
INSERT INTO `enroll` VALUES ('3128', '109', '3', '我最大的爱好是看书。有一次，我在书桌上看书，正看得津津有味，邻居家的小伙伴在楼下喊我出去玩。正在睡午觉的爸爸跑过来说：“小朋友喊你下楼玩，我觉都被吵醒了，你还没有听见？”我说：“我真的没有听到。”爸爸摸着我的头，笑着说：“你真是个小书迷！”', '大家好！我叫谭尧文，今年8岁，在南阳市十一小上三年级。我是一个不高也不矮，身材瘦瘦的小姑娘。头上扎着一个马尾辫，总爱戴一个红色的发卡，一张圆圆的脸上长着两条弯弯的眉毛，下面有一对像黑宝石一样的大眼睛，笑起来就眯成了一条缝。高高的鼻子下一张能说会道的嘴，它爱唱歌、爱朗诵课文，更爱笑，时常给大家带来快乐。看见我的人都说我像一个洋娃娃，可爱极了！', '我是一个爱劳动的孩子。在家里，扫地、擦桌子、洗碗我样样都抢在妈妈前面干。在学校值日，我总是第一个行动，干完我们组的任务，再帮助别的组干。妈妈生病的时候，我就像个小护士一样，一会儿烧水，一会儿倒茶，一会儿拿药，一会儿端饭，忙得不可开交。', '当然，我也有许多缺点。比如上课时，我会做一些小动作，被老师发现后会瞪我一眼。作业有时马虎，写一些不该出现的错别字。最让妈妈头疼的是我爱吮吸手指头，不管是上课还是在家，手只要一闲下来，我就会不知不觉地伸进嘴里吸起来。妈妈经常说：“吮吸指头不卫生，会传染细菌生病的。”我真希望自己早日改掉这些缺点。世上无难事，只怕有心人。相信我一定会努力甩掉这些小尾巴的。\r\n这就是我，一个活泼可爱、爱好看书、热爱劳动、还有许多缺点的小女孩。你愿意和我交朋友吗？', '1');
INSERT INTO `enroll` VALUES ('3129', '109', '9', '我最大的爱好是看书。有一次，我在书桌上看书，正看得津津有味，邻居家的小伙伴在楼下喊我出去玩。正在睡午觉的爸爸跑过来说：“小朋友喊你下楼玩，我觉都被吵醒了，你还没有听见？”我说：“我真的没有听到。”爸爸摸着我的头，笑着说：“你真是个小书迷！”', '大家好！我叫谭尧文，今年8岁，在南阳市十一小上三年级。我是一个不高也不矮，身材瘦瘦的小姑娘。头上扎着一个马尾辫，总爱戴一个红色的发卡，一张圆圆的脸上长着两条弯弯的眉毛，下面有一对像黑宝石一样的大眼睛，笑起来就眯成了一条缝。高高的鼻子下一张能说会道的嘴，它爱唱歌、爱朗诵课文，更爱笑，时常给大家带来快乐。看见我的人都说我像一个洋娃娃，可爱极了！', '我是一个爱劳动的孩子。在家里，扫地、擦桌子、洗碗我样样都抢在妈妈前面干。在学校值日，我总是第一个行动，干完我们组的任务，再帮助别的组干。妈妈生病的时候，我就像个小护士一样，一会儿烧水，一会儿倒茶，一会儿拿药，一会儿端饭，忙得不可开交。', '当然，我也有许多缺点。比如上课时，我会做一些小动作，被老师发现后会瞪我一眼。作业有时马虎，写一些不该出现的错别字。最让妈妈头疼的是我爱吮吸手指头，不管是上课还是在家，手只要一闲下来，我就会不知不觉地伸进嘴里吸起来。妈妈经常说：“吮吸指头不卫生，会传染细菌生病的。”我真希望自己早日改掉这些缺点。世上无难事，只怕有心人。相信我一定会努力甩掉这些小尾巴的。\r\n这就是我，一个活泼可爱、爱好看书、热爱劳动、还有许多缺点的小女孩。你愿意和我交朋友吗？', '2');
INSERT INTO `enroll` VALUES ('3130', '110', '3', '我梳着短发，长着一张偏胖的瓜子脸，小眼睛，高鼻子，最有特点的要数我的嘴了。我的小嘴巴蕴藏着丰富的表情，高兴时，撇撇嘴，扮个鬼脸；生气时，撅起的小嘴能挂住一个小油瓶。从这张嘴巴说出的话，有时能气的别人火冒三丈，抽泣不已，有时却让人忍俊不禁，大笑不已……', '我叫小A，今年14岁了，在调兵山市第六中学读书。从表面看，我是一个比较斯文又比较听话的女孩，其实我是一个粗野，刁蛮，大大咧咧的疯丫头。', '我是一个非常爱钻牛角尖的人，遇到不会的问题，非弄个水落石出不可。因此，我的成绩还算可以。这给我一个启示：干什么只要认真，努力，那就一定会成功如愿。同时也使我悟到了“锲而舍之，朽木不折；锲而不舍，金石可镂”这句名言的深刻含义。', '我也是一个不甘寂寞的人，喜欢广交朋友。我认为友谊是一种无形的巨大的力量，生活中缺少了他，你就会感到寂寞，冷清。所以，不管年龄比我大还是比我小，学习差还是好，只要人品好，我都愿意和他成为好朋友。', '1');
INSERT INTO `enroll` VALUES ('3131', '110', '9', '我梳着短发，长着一张偏胖的瓜子脸，小眼睛，高鼻子，最有特点的要数我的嘴了。我的小嘴巴蕴藏着丰富的表情，高兴时，撇撇嘴，扮个鬼脸；生气时，撅起的小嘴能挂住一个小油瓶。从这张嘴巴说出的话，有时能气的别人火冒三丈，抽泣不已，有时却让人忍俊不禁，大笑不已……', '我叫小A，今年14岁了，在调兵山市第六中学读书。从表面看，我是一个比较斯文又比较听话的女孩，其实我是一个粗野，刁蛮，大大咧咧的疯丫头。', '我是一个非常爱钻牛角尖的人，遇到不会的问题，非弄个水落石出不可。因此，我的成绩还算可以。这给我一个启示：干什么只要认真，努力，那就一定会成功如愿。同时也使我悟到了“锲而舍之，朽木不折；锲而不舍，金石可镂”这句名言的深刻含义。', '我也是一个不甘寂寞的人，喜欢广交朋友。我认为友谊是一种无形的巨大的力量，生活中缺少了他，你就会感到寂寞，冷清。所以，不管年龄比我大还是比我小，学习差还是好，只要人品好，我都愿意和他成为好朋友。', '4');
INSERT INTO `enroll` VALUES ('3132', '111', '3', '我的性格非常温和，许多小朋友都愿意和我做朋友。有时，我在院子里玩，总发现身后有许多小弟弟和小妹妹，她们都喜欢围着我转。有时，别人把我的玩具弄坏了，我总不发脾气，还说没关系。', '我长着圆圆的脸，红红的，像苹果一样，笑的时候脸上露出小小的酒窝。我的眼睛圆溜溜、亮晶晶的，像葡萄似的。', '我的爱好很多，喜欢画画、弹钢琴、看书、唱歌、下棋……但是，我最喜欢画画，每当做完作业，我就打开画板，认真地画起来。画着画着，我忘记了一切。经过努力，我参加了全校绘画大赛，荣获了一等奖。', '本文是一篇写人的记叙文。文章从“我”的外貌、性格、爱好等方面作了介绍，让我们认识了一个漂亮、性格温和、爱好广泛的小女孩。语言优美、比喻生动、形象，具体的事例突出了人物特点。', '2');
INSERT INTO `enroll` VALUES ('3133', '111', '9', '我的性格非常温和，许多小朋友都愿意和我做朋友。有时，我在院子里玩，总发现身后有许多小弟弟和小妹妹，她们都喜欢围着我转。有时，别人把我的玩具弄坏了，我总不发脾气，还说没关系。', '我长着圆圆的脸，红红的，像苹果一样，笑的时候脸上露出小小的酒窝。我的眼睛圆溜溜、亮晶晶的，像葡萄似的', '我的爱好很多，喜欢画画、弹钢琴、看书、唱歌、下棋……但是，我最喜欢画画，每当做完作业，我就打开画板，认真地画起来。画着画着，我忘记了一切。经过努力，我参加了全校绘画大赛，荣获了一等奖。', '本文是一篇写人的记叙文。文章从“我”的外貌、性格、爱好等方面作了介绍，让我们认识了一个漂亮、性格温和、爱好广泛的小女孩。语言优美、比喻生动、形象，具体的事例突出了人物特点。', '1');
INSERT INTO `enroll` VALUES ('3134', '112', '3', '我的姓与“快乐大本营”的一位叫吴昕的主持人同姓，我的名只有一个字，那就是一种叫做长笛的乐器，这下你猜到了吧！至于我的性别嘛！我的性别与明星张靓颖是一样的——女孩子嘛！前不久我才吹灭了九只五彩缤纷的生日蜡烛，在武侯实小，我已经跟教师和同学们愉快地生活了四年了。', '在班上，我是老师的小助手，在学校里我是老师心中的好学生。因为，我平时在班上、在年级里表现出色，多次被评为学校的“校三好”；我的作文还得过全国一等奖呢！所以老师非常喜欢我。被老师喜欢也是一种“甜蜜”的麻烦：比如说上周吧，我正在帮张老师去交本月的伙食费收据，交完收据后刚刚老师办公室的门，李老师又让我去帮她交一下订校服的钱，刚办完这件事，杨助理又安排我去帮她拿手机，我又跑了一趟老师办公室，这下总算没有事了。不过能帮老师做点事，我心里还是挺高兴的。', '我喜欢看书、平时喜欢画画，虽然画得不太好，但是我还是喜欢画，我还学过一段时间的长笛吹奏呢！', '我平时爱扎一个麻花小辫，有一双水灵灵的大眼睛，小小的鼻子和一张叽叽喳喳、爱说话的小嘴。', '3');
INSERT INTO `enroll` VALUES ('3135', '112', '9', '我的姓与“快乐大本营”的一位叫吴昕的主持人同姓，我的名只有一个字，那就是一种叫做长笛的乐器，这下你猜到了吧！至于我的性别嘛！我的性别与明星张靓颖是一样的——女孩子嘛！前不久我才吹灭了九只五彩缤纷的生日蜡烛，在武侯实小，我已经跟教师和同学们愉快地生活了四年了。', '在班上，我是老师的小助手，在学校里我是老师心中的好学生。因为，我平时在班上、在年级里表现出色，多次被评为学校的“校三好”；我的作文还得过全国一等奖呢！所以老师非常喜欢我。被老师喜欢也是一种“甜蜜”的麻烦：比如说上周吧，我正在帮张老师去交本月的伙食费收据，交完收据后刚刚老师办公室的门，李老师又让我去帮她交一下订校服的钱，刚办完这件事，杨助理又安排我去帮她拿手机，我又跑了一趟老师办公室，这下总算没有事了。不过能帮老师做点事，我心里还是挺高兴的。', '我喜欢看书、平时喜欢画画，虽然画得不太好，但是我还是喜欢画，我还学过一段时间的长笛吹奏呢！', '我平时爱扎一个麻花小辫，有一双水灵灵的大眼睛，小小的鼻子和一张叽叽喳喳、爱说话的小嘴。', '1');
INSERT INTO `enroll` VALUES ('3136', '113', '3', '我叫王陈铖，是一名三年级的小学生。今年9岁，1米35的个头，体重26公斤。我浓浓的眉毛下有一双炯炯有神的大眼睛，乌黑的眼球像两颗算盘珠。眼睛的下面有一个扁扁的鼻子，平坦的鼻梁上还架着一副眼镜，这让我看上去很有学问，摘下眼镜，你会发现我的眼睛下有两块斑点。呵呵，这让我原本英俊的脸蛋失去了一点点光彩。不过，我还是蛮自信，因为我还是那么帅。\r\n', '我的爱好非常广泛，下棋，画画，篮球，溜冰，滑板，游泳我都喜欢。有时，我还帮妈妈做一些家务，洗碗，洗衣服。但我最喜欢看书，这个暑假，我已看了20本课外书，只要有好看的书，我都会让妈妈帮我在网上订购。从书中，我不仅能增长知识，还能懂得许多道理。最近，我迷上了《西游记》，一共有上下两侧。虽然书上还有一些字我不认识，那也没有关系，我感兴趣是它的故事情节。妈妈经常叫我小慢马，小书虫。因为我一看上书，什么事情都不管。', '我的缺点有许多，最主要的就是马虎。比如在数学方面，我经常把算数算错，有时会把加法看成减法，乘法看成除法。在语文上，上次期末考试，本来能考得好成绩，可我居然有一题漏做了，结果只靠了97分。你看我马虎不马虎？', '本文通过外貌描写使读者对人物有了初次的印象，随后作者写出了自己的爱好，优缺点，使人物活灵活现的展现在我们眼前。全文有详有略，选材恰当，结构紧凑，是不错的文章。', '7');
INSERT INTO `enroll` VALUES ('3137', '113', '9', '我叫王陈铖，是一名三年级的小学生。今年9岁，1米35的个头，体重26公斤。我浓浓的眉毛下有一双炯炯有神的大眼睛，乌黑的眼球像两颗算盘珠。眼睛的下面有一个扁扁的鼻子，平坦的鼻梁上还架着一副眼镜，这让我看上去很有学问，摘下眼镜，你会发现我的眼睛下有两块斑点。呵呵，这让我原本英俊的脸蛋失去了一点点光彩。不过，我还是蛮自信，因为我还是那么帅。', '我的爱好非常广泛，下棋，画画，篮球，溜冰，滑板，游泳我都喜欢。有时，我还帮妈妈做一些家务，洗碗，洗衣服。但我最喜欢看书，这个暑假，我已看了20本课外书，只要有好看的书，我都会让妈妈帮我在网上订购。从书中，我不仅能增长知识，还能懂得许多道理。最近，我迷上了《西游记》，一共有上下两侧。虽然书上还有一些字我不认识，那也没有关系，我感兴趣是它的故事情节。妈妈经常叫我小慢马，小书虫。因为我一看上书，什么事情都不管。', '我的缺点有许多，最主要的就是马虎。比如在数学方面，我经常把算数算错，有时会把加法看成减法，乘法看成除法。在语文上，上次期末考试，本来能考得好成绩，可我居然有一题漏做了，结果只靠了97分。你看我马虎不马虎？', '本文通过外貌描写使读者对人物有了初次的印象，随后作者写出了自己的爱好，优缺点，使人物活灵活现的展现在我们眼前。全文有详有略，选材恰当，结构紧凑，是不错的文章。', '2');
INSERT INTO `enroll` VALUES ('3138', '114', '3', '我叫xxx，今年8岁了，是二年级四班的学生。我性格开朗，活泼好动，我的爱好广泛：看书、画画、讲故事、滑滑板、跳拉丁舞，样样都行。我相信：我是最棒的。', '我讲的故事，常常逗得爸爸妈妈哈哈大笑，爷爷奶奶慈爱的脸上也乐开了花。\r\n在家里，我是爸爸妈妈眼中的好孩子，爸爸妈妈很信任我，我也能做一些力所能及的事情，收拾自己的房间，自己去楼下拿牛奶。每天写一篇日记、画一幅画是我必做的事情。', '在学校里，我是老师眼中的好孩子，是同学们喜欢的好朋友。我经常和同学们一起，参加一些有意义的活动，主动打扫卫生，听老师的话。上课认真听讲，不做小动作。我还喜欢交朋友，帮助同学，和他们一起玩，一起学习、进步。', '着胸前飘扬的红领巾,我一定要 好好学习，天天向上 。我相信我是最棒的。\r\n同学们，让我们大声的说：我是最棒的！我们都是最捧的！\r\n我的演讲完了，谢谢大家！', '1');
INSERT INTO `enroll` VALUES ('3139', '114', '9', '我叫xxx，今年8岁了，是二年级四班的学生。我性格开朗，活泼好动，我的爱好广泛：看书、画画、讲故事、滑滑板、跳拉丁舞，样样都行。我相信：我是最棒的。', '我讲的故事，常常逗得爸爸妈妈哈哈大笑，爷爷奶奶慈爱的脸上也乐开了花。在家里，我是爸爸妈妈眼中的好孩子，爸爸妈妈很信任我，我也能做一些力所能及的事情，收拾自己的房间，自己去楼下拿牛奶。每天写一篇日记、画一幅画是我必做的事情。', '在学校里，我是老师眼中的好孩子，是同学们喜欢的好朋友。我经常和同学们一起，参加一些有意义的活动，主动打扫卫生，听老师的话。上课认真听讲，不做小动作。我还喜欢交朋友，帮助同学，和他们一起玩，一起学习、进步。', '着胸前飘扬的红领巾,我一定要 好好学习，天天向上 。我相信我是最棒的。\r\n同学们，让我们大声的说：我是最棒的！我们都是最捧的！\r\n我的演讲完了，谢谢大家！\r\n', '1');
INSERT INTO `enroll` VALUES ('3140', '115', '3', '我，一个平平常常的我，今年九岁半，在肇庆市第十五小学三（4）班上学。我的样貌既没有嫦娥那样的风采，也没有西施那样的婀娜。小小的眼睛，小小的鼻子，小小的嘴巴，外表总给人一种小巧玲珑的感觉。', '我的性格开朗，整天叽哩呱啦，像是有说不完的话。\r\n我的爱好广泛，包括书法、音乐、体育、看书等。当经过辛勤的努力，取得了进步时，那种内心的喜悦是无法形容的。我最喜欢的是音乐，特别是弹电子琴，所以我每天都坚持练习，希望参加大型的电子琴比赛，获得好名次。', '我也有不少的缺点，比如粗心大意，这顶“帽子”常常让我吃苦头。有一次数学测验，我只得了如94分，那是因为我做应用题时粗心大意，把题的意思给弄错了，被扣了6分，要是我细心点，就不会这样了。像这样的事例还有很多，我老是想摘掉这顶“帽子”，但是不知怎么的，这顶“帽子”总是很难摘下来，希望有一天这顶“帽子”能够摘去。', '这就是我――程晴。大家看了我的介绍，希望能喜欢我，和我交个朋友吧！\r\n文章是一篇写人的记叙文。小作者从外貌、性格、爱好、缺点等方面来介绍自己，语言较生动，性格和缺点写得很具体，使人物形象更加鲜明。外貌描写若果能抓住特点来写，就更生动了。', '1');
INSERT INTO `enroll` VALUES ('3141', '115', '9', '我，一个平平常常的我，今年九岁半，在肇庆市第十五小学三（4）班上学。我的样貌既没有嫦娥那样的风采，也没有西施那样的婀娜。小小的眼睛，小小的鼻子，小小的嘴巴，外表总给人一种小巧玲珑的感觉。', '我的性格开朗，整天叽哩呱啦，像是有说不完的话。\r\n我的爱好广泛，包括书法、音乐、体育、看书等。当经过辛勤的努力，取得了进步时，那种内心的喜悦是无法形容的。我最喜欢的是音乐，特别是弹电子琴，所以我每天都坚持练习，希望参加大型的电子琴比赛，获得好名次。', '我也有不少的缺点，比如粗心大意，这顶“帽子”常常让我吃苦头。有一次数学测验，我只得了如94分，那是因为我做应用题时粗心大意，把题的意思给弄错了，被扣了6分，要是我细心点，就不会这样了。像这样的事例还有很多，我老是想摘掉这顶“帽子”，但是不知怎么的，这顶“帽子”总是很难摘下来，希望有一天这顶“帽子”能够摘去。', '这就是我――程晴。大家看了我的介绍，希望能喜欢我，和我交个朋友吧！\r\n文章是一篇写人的记叙文。小作者从外貌、性格、爱好、缺点等方面来介绍自己，语言较生动，性格和缺点写得很具体，使人物形象更加鲜明。外貌描写若果能抓住特点来写，就更生动了。', '1');
INSERT INTO `enroll` VALUES ('3142', '116', '3', '大家好，我是来自五乙班的张雅蓉，我今年十一岁，属羊。但是我的性格和羊有点相反，羊温和老实，而我却活泼好动，大胆能干还有一点点凶。从二年级起我一直担任班上的中队长，语文课代表，今年还有幸成为大队部的副队长，是老师的得力助手。我的兴趣爱好很广泛，我喜欢唱歌、画画、听音乐、摸索电脑，还喜欢旅游、照相和看书。', '我曾多次获得三好学生、四好少年的称号。还曾经获得过第十一届“雏鹰杯”绘画比赛优秀奖、优秀大队干部、书写大赛特等奖、学习小明星等等奖项。', '虽然我有很多优点，但是我也有很多缺点，那就是学习上不太努力，粗心，有时漏写，有时写错，书写不太美观。还有就是对自己要求不是很严格。今后，我决定要发扬优点，改正缺点。', '“但是我的性格和羊有点相反，羊温和老实，而我却活泼好动，大胆能干还有一点点凶。”这样的矛盾很能引起读者的阅读兴趣。“虽然我有很多优点，但是我也有很多缺点，”承上启下，过渡自然。', '1');
INSERT INTO `enroll` VALUES ('3143', '116', '9', '大家好，我是来自五乙班的张雅蓉，我今年十一岁，属羊。但是我的性格和羊有点相反，羊温和老实，而我却活泼好动，大胆能干还有一点点凶。从二年级起我一直担任班上的中队长，语文课代表，今年还有幸成为大队部的副队长，是老师的得力助手。我的兴趣爱好很广泛，我喜欢唱歌、画画、听音乐、摸索电脑，还喜欢旅游、照相和看书。', '我曾多次获得三好学生、四好少年的称号。还曾经获得过第十一届“雏鹰杯”绘画比赛优秀奖、优秀大队干部、书写大赛特等奖、学习小明星等等奖项。', '虽然我有很多优点，但是我也有很多缺点，那就是学习上不太努力，粗心，有时漏写，有时写错，书写不太美观。还有就是对自己要求不是很严格。今后，我决定要发扬优点，改正缺点。', '“但是我的性格和羊有点相反，羊温和老实，而我却活泼好动，大胆能干还有一点点凶。”这样的矛盾很能引起读者的阅读兴趣。“虽然我有很多优点，但是我也有很多缺点，”承上启下，过渡自然。', '1');
INSERT INTO `enroll` VALUES ('3144', '117', '3', '我叫李芷晔，小名叫甜甜，奶奶总叫我李狗甜，小时候我喜欢小动物，就对奶奶说：“以后叫我李狗好了，不要再加个“甜”字”。全家人都哄堂大笑。', '第一次看到我的人都说我是个文静乖巧的小女孩，其实他们都被我的外表给骗了。我是个非常好动的小孩，小时候，妈妈经常要对着我喊：“我们都是木头人，不许说话不许动”。才能把我定住。可妈妈一动，我又会跟着动起来了。把妈妈弄得无可奈何的。妈妈总是担心我是否有好动症。有一次，妈妈下班回来，一开门，看到沙发上两只脚在乱蹬，吓了一大跳，定眼一看，原来是我倒立在沙发上看电视呢，妈妈是既好气又好笑的。', '上了小学，我认识了一些字，爱上了看书，终于能定下心来看书了，妈妈心中的大石头终于落下来了。过不了多久，妈妈又有了新烦恼，因为我一拿到书就看得昏天暗地，妈妈扯破喉咙叫我，我也没听见。不到妈妈采取“行动”，我就不会罢休的。\r\n这就是我，一个总给妈妈带来烦恼的我。', '本文是一篇写人的记叙文。文章从外表——“文静乖巧”、性格——“好动”、爱好——“读书”等方面介绍自己。叙述时选取典型事例，尤其是小作者爱上看书后的事例，语言精练，“书迷”形象跃然纸上。', '5');
INSERT INTO `enroll` VALUES ('3145', '117', '9', '我叫李芷晔，小名叫甜甜，奶奶总叫我李狗甜，小时候我喜欢小动物，就对奶奶说：“以后叫我李狗好了，不要再加个“甜”字”。全家人都哄堂大笑。', '第一次看到我的人都说我是个文静乖巧的小女孩，其实他们都被我的外表给骗了。我是个非常好动的小孩，小时候，妈妈经常要对着我喊：“我们都是木头人，不许说话不许动”。才能把我定住。可妈妈一动，我又会跟着动起来了。把妈妈弄得无可奈何的。妈妈总是担心我是否有好动症。有一次，妈妈下班回来，一开门，看到沙发上两只脚在乱蹬，吓了一大跳，定眼一看，原来是我倒立在沙发上看电视呢，妈妈是既好气又好笑的。', '上了小学，我认识了一些字，爱上了看书，终于能定下心来看书了，妈妈心中的大石头终于落下来了。过不了多久，妈妈又有了新烦恼，因为我一拿到书就看得昏天暗地，妈妈扯破喉咙叫我，我也没听见。不到妈妈采取“行动”，我就不会罢休的。\r\n这就是我，一个总给妈妈带来烦恼的我。', '本文是一篇写人的记叙文。文章从外表——“文静乖巧”、性格——“好动”、爱好——“读书”等方面介绍自己。叙述时选取典型事例，尤其是小作者爱上看书后的事例，语言精练，“书迷”形象跃然纸上。', '1');
INSERT INTO `enroll` VALUES ('3146', '118', '3', '我叫侯承瑜，眼睛不大，却视力超常，鼻孔很小，嗅觉却灵敏过人，别看我小小的嘴巴却天生的能说会道。', '我最大的优点是脑筋转得快，爱发明，什么变形金刚哪，飞机哪，轮船哪，手枪哪等等，这些玩意儿经我一折腾，准会鸟枪换炮，旧貌换新颜。当然，大多数还是变得面目全非，成功的少，失败的多，虽然妈妈总说我是拆匠，说我异想天开，可我还是乐此不疲。我总觉得我迟早会成为一个真正的发明家的。缺点嘛，除了不爱写作业，不爱跑步，自认为还比较完美。哈哈！自信得过头了吧！这不，你看我又暴露了一个缺点。嘿嘿。', '说起异想天开，我还有许多雷人的光辉历史呢，如果你不嫌我烦，那我就举出其中的一段和你分享吧！', '有一次，妈妈买菜回来，说让我洗菜，还说要锻炼锻炼我的生活能力。“洗就洗，有什么了不起的。”我撅着嘴巴顶了妈妈一句。心想：哼，你不想洗菜就直说得了，何必找那么美丽的借口，妈妈说完就去外婆家了，临出门还顺便赘了一句，“回来我检查。”我本想问几句的，没想到门已经“砰”地一声关上了。', '1');
INSERT INTO `enroll` VALUES ('3147', '118', '9', '我叫侯承瑜，眼睛不大，却视力超常，鼻孔很小，嗅觉却灵敏过人，别看我小小的嘴巴却天生的能说会道。', '我最大的优点是脑筋转得快，爱发明，什么变形金刚哪，飞机哪，轮船哪，手枪哪等等，这些玩意儿经我一折腾，准会鸟枪换炮，旧貌换新颜。当然，大多数还是变得面目全非，成功的少，失败的多，虽然妈妈总说我是拆匠，说我异想天开，可我还是乐此不疲。我总觉得我迟早会成为一个真正的发明家的。缺点嘛，除了不爱写作业，不爱跑步，自认为还比较完美。哈哈！自信得过头了吧！这不，你看我又暴露了一个缺点。嘿嘿。', '说起异想天开，我还有许多雷人的光辉历史呢，如果你不嫌我烦，那我就举出其中的一段和你分享吧！', '有一次，妈妈买菜回来，说让我洗菜，还说要锻炼锻炼我的生活能力。“洗就洗，有什么了不起的。”我撅着嘴巴顶了妈妈一句。心想：哼，你不想洗菜就直说得了，何必找那么美丽的借口，妈妈说完就去外婆家了，临出门还顺便赘了一句，“回来我检查。”我本想问几句的，没想到门已经“砰”地一声关上了。', '1');
INSERT INTO `enroll` VALUES ('3148', '119', '3', '我自上初中一年级以来，在学校领导和老师的谆谆教导下，无论在德育、智育、体育等方面都有了的一定的进步。本学年我也相应的被评为“优秀班干部”在德育方面。将近两年来，我严格、自觉地遵守社会公德和学校的规章制度，按照中学生日常行为规范严格要求自己。', '认真学习政治课，在学习政治课中，懂得了真善美，学会了做人的道理：尊敬师长，团结同学，关系集体；坚持真理，修正错误，自觉抵御封建迷信和黄赌毒活动的影响；认真参加学校及班级组织的各项学习活动和文化交流活，并在初一的时候加入了中国共青团。', '明确学习目的、端正学习态度。在学习过程中，勤奋刻苦、自强进取，合理安排时间，有惜时的良好的学习习惯。', '还努力拓宽自己的知识面，培养自己其他方面的能力；积极参加学校的各项活动。\r\n在体、美、劳方面。我十分重视体育课，积极参加各项体育运动和劳动，不断地提高自己的身体健康水平，锻炼了自己的坚强意志，懂得了劳动能创造一切的道理,进一步培养和提高自己的审美能力。', '1');
INSERT INTO `enroll` VALUES ('3149', '119', '9', '我自上初中一年级以来，在学校领导和老师的谆谆教导下，无论在德育、智育、体育等方面都有了的一定的进步。本学年我也相应的被评为“优秀班干部”在德育方面。将近两年来，我严格、自觉地遵守社会公德和学校的规章制度，按照中学生日常行为规范严格要求自己。', '认真学习政治课，在学习政治课中，懂得了真善美，学会了做人的道理：尊敬师长，团结同学，关系集体；坚持真理，修正错误，自觉抵御封建迷信和黄赌毒活动的影响；认真参加学校及班级组织的各项学习活动和文化交流活，并在初一的时候加入了中国共青团。', '明确学习目的、端正学习态度。在学习过程中，勤奋刻苦、自强进取，合理安排时间，有惜时的良好的学习习惯。\r\n', '还努力拓宽自己的知识面，培养自己其他方面的能力；积极参加学校的各项活动。\r\n在体、美、劳方面。我十分重视体育课，积极参加各项体育运动和劳动，不断地提高自己的身体健康水平，锻炼了自己的坚强意志，懂得了劳动能创造一切的道理,进一步培养和提高自己的审美能力。', '1');
INSERT INTO `enroll` VALUES ('3150', '120', '3', '我自上初中一年级以来，在学校领导和老师的谆谆教导下，无论在德育、智育、体育等方面都有了的一定的进步。本学年我也相应的被评为“优秀班干部”在德育方面。将近两年来，我严格、自觉地遵守社会公德和学校的规章制度，按照中学生日常行为规范严格要求自己。', '认真学习政治课，在学习政治课中，懂得了真善美，学会了做人的道理：尊敬师长，团结同学，关系集体；坚持真理，修正错误，自觉抵御封建迷信和黄赌毒活动的影响；认真参加学校及班级组织的各项学习活动和文化交流活，并在初一的时候加入了中国共青团。', '明确学习目的、端正学习态度。在学习过程中，勤奋刻苦、自强进取，合理安排时间，有惜时的良好的学习习惯。\r\n还努力拓宽自己的知识面，培养自己其他方面的能力；积极参加学校的各项活动。', '在体、美、劳方面。我十分重视体育课，积极参加各项体育运动和劳动，不断地提高自己的身体健康水平，锻炼了自己的坚强意志，懂得了劳动能创造一切的道理,进一步培养和提高自己的审美能力。', '4');
INSERT INTO `enroll` VALUES ('3151', '120', '9', '我自上初中一年级以来，在学校领导和老师的谆谆教导下，无论在德育、智育、体育等方面都有了的一定的进步。本学年我也相应的被评为“优秀班干部”在德育方面。将近两年来，我严格、自觉地遵守社会公德和学校的规章制度，按照中学生日常行为规范严格要求自己。\r\n', '认真学习政治课，在学习政治课中，懂得了真善美，学会了做人的道理：尊敬师长，团结同学，关系集体；坚持真理，修正错误，自觉抵御封建迷信和黄赌毒活动的影响；认真参加学校及班级组织的各项学习活动和文化交流活，并在初一的时候加入了中国共青团。', '明确学习目的、端正学习态度。在学习过程中，勤奋刻苦、自强进取，合理安排时间，有惜时的良好的学习习惯。\r\n还努力拓宽自己的知识面，培养自己其他方面的能力；积极参加学校的各项活动', '在体、美、劳方面。我十分重视体育课，积极参加各项体育运动和劳动，不断地提高自己的身体健康水平，锻炼了自己的坚强意志，懂得了劳动能创造一切的道理,进一步培养和提高自己的审美能力。', '1');
INSERT INTO `enroll` VALUES ('3152', '121', '3', '我的年龄吗，从出生到现在已经度过了十二个“六一”儿童节了。至于个子，哎，你别看我的个子不算高，可我的体重可不轻，我现在是……呀，对了，体重要保密，不然我说出来，你一定会笑掉大牙的，那我以后可怎么见熟人呀！别看我胖，可我的五官长得特别端正。看，一张国字脸，双眼皮下两只黑葡萄般的大眼睛里装满了淘气，眼睛下面笔挺的鼻子像雕塑的，嘴巴不大也不小，且能说会道，因此老爸老说我长大能当小品演员。说到我的五官，大家还送我一个雅号——“五官正”，你先别笑，说实话，我现在可不想和中共中央的纪委书记吴官正比个高低，我这个小毛孩能有什么水平呀。不过，等我长大了……这个是后话，今天先不谈了吧。', '说到性格，我可是一个顶活泼的小男孩，但正因为这个“活泼”，也给我引出了一连串的“故事”。有一次，老师在讲第32课《观潮》一文时，我突然想起暑假跟老爸去海宁市看潮的情景，于是我这张嘴就守不住了，待老师转身在黑板写字时，我立刻把头射向同桌，刚刚张开嘴巴，没想到老师会忽然转身，我的结局你可想而知了。就为这上课说话，我不知挨过老师的多少批评。可是，你也不要小瞧我，如果你再听听我的优点，就会眉开眼笑了。看，上课积极举手发言的有我，作业每次都很优秀的有我，每次大型考试名列前茅的有我，每学期学校表扬的“优秀学生干部”有我……怎么样，我的优点可比缺点多吧。', '要说我的兴趣爱好，“书虫”可是我的又一雅号。你瞧，早晨睁开眼必读书，吃饭时间也读书，每晚睡觉前常抱书入睡，对于我来说，有时看书比吃饭都重要。而且我的床上除了书还是书，老妈曾调侃我生活在书的“围城”里，说我是“伟人毛泽东”的忠实模仿者。唉，说得我心里美滋滋的，谁叫我一时也离不开让我快乐让我忧虑让我充实让我进步的好朋友——书呢。另外，我也非常喜欢书法和画画，不信，你可以到我家看看，墙壁上，屋门上都有我的五颜六色、多姿多彩的“大作”，保证让你大饱眼福。', '这就是我，一个你还感兴趣的小男孩吧，怎么样？你想和我交朋友吗？我做梦都想“朋友满天下”呢。\r\n文章构思大胆新颖、有独创性，吸引读者的眼球。本文主旨明确，对“我”进行各个方面的介绍，介绍得很到位，让人一目了然。语言风趣活泼，如“双眼皮下两只黑葡萄般的大眼睛里装满了淘气，眼睛下面笔挺的鼻子像雕塑的”。', '1');
INSERT INTO `enroll` VALUES ('3153', '121', '9', '我的年龄吗，从出生到现在已经度过了十二个“六一”儿童节了。至于个子，哎，你别看我的个子不算高，可我的体重可不轻，我现在是……呀，对了，体重要保密，不然我说出来，你一定会笑掉大牙的，那我以后可怎么见熟人呀！别看我胖，可我的五官长得特别端正。看，一张国字脸，双眼皮下两只黑葡萄般的大眼睛里装满了淘气，眼睛下面笔挺的鼻子像雕塑的，嘴巴不大也不小，且能说会道，因此老爸老说我长大能当小品演员。说到我的五官，大家还送我一个雅号——“五官正”，你先别笑，说实话，我现在可不想和中共中央的纪委书记吴官正比个高低，我这个小毛孩能有什么水平呀。不过，等我长大了……这个是后话，今天先不谈了吧。', '说到性格，我可是一个顶活泼的小男孩，但正因为这个“活泼”，也给我引出了一连串的“故事”。有一次，老师在讲第32课《观潮》一文时，我突然想起暑假跟老爸去海宁市看潮的情景，于是我这张嘴就守不住了，待老师转身在黑板写字时，我立刻把头射向同桌，刚刚张开嘴巴，没想到老师会忽然转身，我的结局你可想而知了。就为这上课说话，我不知挨过老师的多少批评。可是，你也不要小瞧我，如果你再听听我的优点，就会眉开眼笑了。看，上课积极举手发言的有我，作业每次都很优秀的有我，每次大型考试名列前茅的有我，每学期学校表扬的“优秀学生干部”有我……怎么样，我的优点可比缺点多吧。', '要说我的兴趣爱好，“书虫”可是我的又一雅号。你瞧，早晨睁开眼必读书，吃饭时间也读书，每晚睡觉前常抱书入睡，对于我来说，有时看书比吃饭都重要。而且我的床上除了书还是书，老妈曾调侃我生活在书的“围城”里，说我是“伟人毛泽东”的忠实模仿者。唉，说得我心里美滋滋的，谁叫我一时也离不开让我快乐让我忧虑让我充实让我进步的好朋友——书呢。另外，我也非常喜欢书法和画画，不信，你可以到我家看看，墙壁上，屋门上都有我的五颜六色、多姿多彩的“大作”，保证让你大饱眼福。', '这就是我，一个你还感兴趣的小男孩吧，怎么样？你想和我交朋友吗？我做梦都想“朋友满天下”呢。\r\n文章构思大胆新颖、有独创性，吸引读者的眼球。本文主旨明确，对“我”进行各个方面的介绍，介绍得很到位，让人一目了然。语言风趣活泼，如“双眼皮下两只黑葡萄般的大眼睛里装满了淘气，眼睛下面笔挺的鼻子像雕塑的”。', '1');
INSERT INTO `enroll` VALUES ('3154', '122', '3', '我叫xxx，是xxx中学初一（1）班的学生。生活中，我懂礼貌，有爱心，讲奉献，努力给他人送去温暖和快乐。 学习上，我有目标，有决心，有收获，在知识的海洋中采撷无尽的宝藏。班级里，我是老师的“小助手”，是同学的好朋友，更是一个有着责任感和正义感的少先队员。我活泼开朗，乐观自信，有着许多兴趣爱好。德智体美全面发展，是我努力的目标。下面，我想从以下几个方面和大家分享我的成长历程：', '一、用奉献收获爱心和感动\r\n妈妈常跟我讲：一个人只有知道爱别人、尊重别人，别人也才会尊重你。我是这样想的，也是这样做的。在家里，我是个懂礼貌的乖孩子，尊老爱幼，主动学习并承担力所能及的家务。在路边特别是见到老人向人乞讨时，我会把自己身上的零钱，送到他的手里。', '在帮助别人的过程中，我不仅有付出，还不断收获着爱心和感动。记得2008年5月12号是举国上下难忘的伤痛， 四川汶川发生特大地震，全国上下团结一心抗震救灾，学校和社会各团体纷纷伸出援助之手踊跃捐款。看到汶川与我同龄的学生因灾难失去了家园，失去了自己热爱的校园，甚至失去了宝贵的生命。我感到悲痛的同时，更感到作为一名少先队员，身上应肩负一份责任，应尽我的一份微薄之力。我拿出妈妈平时给我的积攒了好长时间的零花钱，毫不犹豫的捐了出去。当看到他们重建家园校舍，重新回到崭新的教室学习时，我感到从未有过的快乐，因为这里包含了我的一份爱心。从那以后我没随便乱花过一分钱，我知道应该把它留在更有用的地方。', '二、用实践磨练品格和毅力\r\n我生活在一个和谐、团结、友爱、积极向上的班集体，班主任严格、慈祥、认真、富有爱心，同学们聪明、活泼、热情、开朗，我感到非常幸福，也非常愿意为集体贡献智慧和力量。在班里，作为一名班长，我就像老师的小助手，同学们的服务员，用自己稚嫩的肩膀承担起一份责任。对于老师交给的任务，我总是能够克服困难，努力完成，因此很多事情老师都很放心让我管理。比如：班里的板报由我负责完成，还有检查同学们的考勤。劳动时我会抢着干最脏最累的活儿，和同学们一起创造一个良好的学习环境。作为一名少先队员，诚实守信是我做人的准则。在生活中，做错了事，我会勇敢地承认，即使是被父母指责。在学校值周时，我客观公正，遇到好朋友求情，要我给她们班打高分时，我会毫不犹豫拒绝。', '1');
INSERT INTO `enroll` VALUES ('3155', '122', '9', '我叫xxx，是xxx中学初一（1）班的学生。生活中，我懂礼貌，有爱心，讲奉献，努力给他人送去温暖和快乐。 学习上，我有目标，有决心，有收获，在知识的海洋中采撷无尽的宝藏。班级里，我是老师的“小助手”，是同学的好朋友，更是一个有着责任感和正义感的少先队员。我活泼开朗，乐观自信，有着许多兴趣爱好。德智体美全面发展，是我努力的目标。下面，我想从以下几个方面和大家分享我的成长历程：', '一、用奉献收获爱心和感动\r\n妈妈常跟我讲：一个人只有知道爱别人、尊重别人，别人也才会尊重你。我是这样想的，也是这样做的。在家里，我是个懂礼貌的乖孩子，尊老爱幼，主动学习并承担力所能及的家务。在路边特别是见到老人向人乞讨时，我会把自己身上的零钱，送到他的手里。', '在帮助别人的过程中，我不仅有付出，还不断收获着爱心和感动。记得2008年5月12号是举国上下难忘的伤痛， 四川汶川发生特大地震，全国上下团结一心抗震救灾，学校和社会各团体纷纷伸出援助之手踊跃捐款。看到汶川与我同龄的学生因灾难失去了家园，失去了自己热爱的校园，甚至失去了宝贵的生命。我感到悲痛的同时，更感到作为一名少先队员，身上应肩负一份责任，应尽我的一份微薄之力。我拿出妈妈平时给我的积攒了好长时间的零花钱，毫不犹豫的捐了出去。当看到他们重建家园校舍，重新回到崭新的教室学习时，我感到从未有过的快乐，因为这里包含了我的一份爱心。从那以后我没随便乱花过一分钱，我知道应该把它留在更有用的地方。', '二、用实践磨练品格和毅力\r\n我生活在一个和谐、团结、友爱、积极向上的班集体，班主任严格、慈祥、认真、富有爱心，同学们聪明、活泼、热情、开朗，我感到非常幸福，也非常愿意为集体贡献智慧和力量。在班里，作为一名班长，我就像老师的小助手，同学们的服务员，用自己稚嫩的肩膀承担起一份责任。对于老师交给的任务，我总是能够克服困难，努力完成，因此很多事情老师都很放心让我管理。比如：班里的板报由我负责完成，还有检查同学们的考勤。劳动时我会抢着干最脏最累的活儿，和同学们一起创造一个良好的学习环境。作为一名少先队员，诚实守信是我做人的准则。在生活中，做错了事，我会勇敢地承认，即使是被父母指责。在学校值周时，我客观公正，遇到好朋友求情，要我给她们班打高分时，我会毫不犹豫拒绝。', '1');
INSERT INTO `enroll` VALUES ('3156', '123', '3', '我，圆圆的小脸蛋;弯弯的眉毛下有一双明亮的小眼睛，小鼻子小嘴巴构成了一个丰富多彩的我。\r\n我的个子也不高，从外貌上看起来小小的，因此，同学们总喜欢叫我小XX;但是，我的内心可不小呢，丰富多彩，小小的心灵装满了大大的世界，就让我来告诉你们我的故事吧!', '我渴望变成大人，渴望大自然的美好，我最想去的国家就是俄罗斯了，俄罗斯很大，那就应该很美丽吧，我在想，我长大后就要在俄罗斯去度假，度一个美好的假。我很喜欢自己制作东西，自己装扮房间等等，我还想在长大后当一个经理，主要是装饰房间等等，呵呵，下来就介绍介绍我的爱好吧!', '我又是一个多面性的人，在朋友面前我爱卖萌，爱笑，爱耍耍小脾气，在同学面前我爱搞恶作剧，爱哭，还有点小脾气，在老师面前我爱卖乖，爱委屈，在家长面前我爱撒娇，爱任性，爱大笑，在没有人的时候只有自己的时候不爱说话，不爱东张西望，不爱嘻嘻哈哈，不爱走来走去，不爱放声大哭，爱发呆，爱回忆，爱微笑，爱无声哭啼，任眼泪流过那胖嘟嘟的脸庞，在只有我一人的时候，我看起来像一个一无所有的人，其实真正的我，只会在没有人的时候出现，我会把微笑留给别人，把悲伤留给自己，我很重情，我会因为一件小小的事就哭，我也爱忧郁，典型的忧郁女生。\r\n怎样，这就是我，你想与我成为朋友吗?', '习作开头抓住特点通过外貌描写突出了我的可爱。以我的外貌引起下文，接着顺着我的爱好详细的介绍了我，刻画出了一个爱读书、爱劳动还有许多缺点的可爱小女孩形象。文章语言自然亲切，读来让人清新明快。', '1');
INSERT INTO `enroll` VALUES ('3157', '123', '9', '我，圆圆的小脸蛋;弯弯的眉毛下有一双明亮的小眼睛，小鼻子小嘴巴构成了一个丰富多彩的我。\r\n我的个子也不高，从外貌上看起来小小的，因此，同学们总喜欢叫我小XX;但是，我的内心可不小呢，丰富多彩，小小的心灵装满了大大的世界，就让我来告诉你们我的故事吧!', '我渴望变成大人，渴望大自然的美好，我最想去的国家就是俄罗斯了，俄罗斯很大，那就应该很美丽吧，我在想，我长大后就要在俄罗斯去度假，度一个美好的假。我很喜欢自己制作东西，自己装扮房间等等，我还想在长大后当一个经理，主要是装饰房间等等，呵呵，下来就介绍介绍我的爱好吧!\r\n我喜欢唱歌、跳舞，就是像明星那样，我也常常穿着妈妈的衣服拿着话筒在我家的客厅像明星那样的又唱又跳。我也很喜欢运动。', '我又是一个多面性的人，在朋友面前我爱卖萌，爱笑，爱耍耍小脾气，在同学面前我爱搞恶作剧，爱哭，还有点小脾气，在老师面前我爱卖乖，爱委屈，在家长面前我爱撒娇，爱任性，爱大笑，在没有人的时候只有自己的时候不爱说话，不爱东张西望，不爱嘻嘻哈哈，不爱走来走去，不爱放声大哭，爱发呆，爱回忆，爱微笑，爱无声哭啼，任眼泪流过那胖嘟嘟的脸庞，在只有我一人的时候，我看起来像一个一无所有的人，其实真正的我，只会在没有人的时候出现，我会把微笑留给别人，把悲伤留给自己，我很重情，我会因为一件小小的事就哭，我也爱忧郁，典型的忧郁女生。\r\n怎样，这就是我，你想与我成为朋友吗?', '习作开头抓住特点通过外貌描写突出了我的可爱。以我的外貌引起下文，接着顺着我的爱好详细的介绍了我，刻画出了一个爱读书、爱劳动还有许多缺点的可爱小女孩形象。文章语言自然亲切，读来让人清新明快。', '1');
INSERT INTO `enroll` VALUES ('3158', '124', '3', '同学们，大家好！我 叫覃伯清，今年14岁。\r\n有一头乌黑而卷卷的头发，一双大大的眼睛，一个扁扁的鼻子，一张特别喜欢说笑话、爱笑的嘴巴，同学都说很搞笑。有两只灵巧的耳朵。', '我的爱好是喜欢打羽毛球，阅读课外书，爱唱歌。 有很多缺点，优点倒没有多少。其中日常生活中最大的两个缺点就是粗心大意和上课的时候不想回答问题。', '记得有一次，在小学的时候，某天睡觉不知醒，奶奶叫醒，急急忙忙起床刷呀洗脸，急到连早餐也不吃了，拿起书包就跑去学校，到了学校打开书包想拿出语文书来读，但是语文书没有在书包里 ，这时才想起是昨晚写作业的时候忘记放入书包了。无论是在家，还是在学校，都是很粗心，这令在日常生活中带来很多不便。', '不知怎么的，在上课的时候，很不想回答问题。大概是因为的胆量不够大，一到回答问题的时候， 的心就砰砰直跳，自己既想回答问题又不敢站起来回答，只是看着别人回答问题时快乐样子。而 只能在旁边羡慕别人， 经常对自己说：“如果自己有别人一半的胆量该是多好啊！” 一直都想改掉这个坏习惯，可是一直都不能实现。有时 自己又想，不敢回答问题这个是不是的个性？但是，在学习中是不应该有这种问题存在的。 希望同学们能够一起帮助 改掉这个不好的毛病。', '1');
INSERT INTO `enroll` VALUES ('3159', '124', '9', '同学们，大家好！我 叫覃伯清，今年14岁。\r\n有一头乌黑而卷卷的头发，一双大大的眼睛，一个扁扁的鼻子，一张特别喜欢说笑话、爱笑的嘴巴，同学都说很搞笑。有两只灵巧的耳朵。', '我的爱好是喜欢打羽毛球，阅读课外书，爱唱歌。 有很多缺点，优点倒没有多少。其中日常生活中最大的两个缺点就是粗心大意和上课的时候不想回答问题。', '记得有一次，在小学的时候，某天睡觉不知醒，奶奶叫醒，急急忙忙起床刷呀洗脸，急到连早餐也不吃了，拿起书包就跑去学校，到了学校打开书包想拿出语文书来读，但是语文书没有在书包里 ，这时才想起是昨晚写作业的时候忘记放入书包了。无论是在家，还是在学校，都是很粗心，这令在日常生活中带来很多不便。', '不知怎么的，在上课的时候，很不想回答问题。大概是因为的胆量不够大，一到回答问题的时候， 的心就砰砰直跳，自己既想回答问题又不敢站起来回答，只是看着别人回答问题时快乐样子。而 只能在旁边羡慕别人， 经常对自己说：“如果自己有别人一半的胆量该是多好啊！” 一直都想改掉这个坏习惯，可是一直都不能实现。有时 自己又想，不敢回答问题这个是不是的个性？但是，在学习中是不应该有这种问题存在的。 希望同学们能够一起帮助 改掉这个不好的毛病。', '1');
INSERT INTO `enroll` VALUES ('3160', '125', '3', '我是一名非常普通的初中生。我既没有美丽的外表，也没有出色的成绩，但是，我有一颗纯真善良的心和一个令人感到温暖的笑容。', '14年前，一名孕妇被推进了手术室，站在孕妇身边的那个男人在女人即将被推进手术室的那一刻，他温柔的笑着，边给女人打气，边让女人要放松。女人被推进了手术室，男人站在手术室门口焦急的等待着，男人一会儿站着，一会儿蹲着，一会儿倚在墙上盯着手术室的门发呆。时间一分一秒的过去了，对于这对夫妻来说这是多么的漫长呀！', '两个小时后手术室的门打开了，一个医生和一个护士走了出来，医生对男人说：“恭喜您，先生。是个女儿。”男人听后高心极了，随后，女人被推了出来。女人看着身边的婴儿开心的笑着，脸上写满了幸福。', '故事中的这对甜美的夫妻就是我的妈妈和我的爸爸，他们的女儿就是我。\r\n我拥有一头乌黑的短发，一对浓眉毛，一双不大不小的眼睛，一个大鼻子还有一张会吃的大嘴。当然啦，有了一张会吃的大嘴，我的体重也就轻不到哪去！\r\n我特别喜欢唱歌，特别是唱《义勇军进行曲》。因为唱这首歌我是永远不会唱走调的！！！', '1');
INSERT INTO `enroll` VALUES ('3161', '125', '9', '我是一名非常普通的初中生。我既没有美丽的外表，也没有出色的成绩，但是，我有一颗纯真善良的心和一个令人感到温暖的笑容。', '14年前，一名孕妇被推进了手术室，站在孕妇身边的那个男人在女人即将被推进手术室的那一刻，他温柔的笑着，边给女人打气，边让女人要放松。女人被推进了手术室，男人站在手术室门口焦急的等待着，男人一会儿站着，一会儿蹲着，一会儿倚在墙上盯着手术室的门发呆。时间一分一秒的过去了，对于这对夫妻来说这是多么的漫长呀！', '两个小时后手术室的门打开了，一个医生和一个护士走了出来，医生对男人说：“恭喜您，先生。是个女儿。”男人听后高心极了，随后，女人被推了出来。女人看着身边的婴儿开心的笑着，脸上写满了幸福', '故事中的这对甜美的夫妻就是我的妈妈和我的爸爸，他们的女儿就是我。\r\n我拥有一头乌黑的短发，一对浓眉毛，一双不大不小的眼睛，一个大鼻子还有一张会吃的大嘴。当然啦，有了一张会吃的大嘴，我的体重也就轻不到哪去！\r\n我特别喜欢唱歌，特别是唱《义勇军进行曲》。因为唱这首歌我是永远不会唱走调的！！！', '1');
INSERT INTO `enroll` VALUES ('3162', '126', '3', '早晨我一起床拉开窗帘就看见雪花像一只只白色的蝴蝶漫天飞舞，纷纷扬扬的落下来，房屋、树枝、马路、草地上都披上了一层雪白的面纱。我望着一片白茫茫的雪景心里甭提有多高兴了，因为在上海难得见到下大雪，恨不得马上下去玩。于是我就赶紧洗刷，收拾停当后拿了玩具小桶和铲子，邀请爸爸妈妈一同下楼玩雪。', '到了楼下，我拿着小桶找了一桶雪就准备堆雪人，这时，我看见有一个小姐姐在滚雪球，我就按照她的方法，把桶里的雪倒出来捏成一个小圆球往前推，咦！雪球真的变大了。我越往前推，雪球就越滚越大，不一会儿雪球就推不动了，我就把它当作雪人的下半身。接着我继续按照刚才的办法做了一个小一点的雪球，叫爸爸把两个雪球堆在一起，妈妈找来了一些树枝，把它们当做鼻子，眼睛和耳朵等，经过一番装饰打扮一个活泼可爱的雪人展现在我们的眼前，我还给雪人起了个名子叫”春欢”，意思就是它在春天', '今年的这场春雪，真是太美了。这个美，不光是景色，它还给人们带来了欢笑。\r\n本文是一篇叙事类的记叙文，采用了总分总的结构方式，首尾照应，中心突出，层次分明，条理清晰，语言通顺流畅，用词准确，紧密联系实际生活，真实可信，表达了小作者的真情实感。', '的雪和欢乐的笑声中诞生的。堆好雪人我和爸爸还玩起了打雪仗，捧起一把雪捏成团往爸爸身上扔，打到了我就胜利了，有时学女排姐姐发球雪花在半空中就散开了。你来我往互相追逐，既要进攻又要防守，忙得不亦乐乎！妈妈在一旁也没闲着，不停的按下快门捕捉精彩的瞬间，一家人可开心了。', '1');
INSERT INTO `enroll` VALUES ('3163', '126', '9', '早晨我一起床拉开窗帘就看见雪花像一只只白色的蝴蝶漫天飞舞，纷纷扬扬的落下来，房屋、树枝、马路、草地上都披上了一层雪白的面纱。我望着一片白茫茫的雪景心里甭提有多高兴了，因为在上海难得见到下大雪，恨不得马上下去玩。于是我就赶紧洗刷，收拾停当后拿了玩具小桶和铲子，邀请爸爸妈妈一同下楼玩雪。', '到了楼下，我拿着小桶找了一桶雪就准备堆雪人，这时，我看见有一个小姐姐在滚雪球，我就按照她的方法，把桶里的雪倒出来捏成一个小圆球往前推，咦！雪球真的变大了。我越往前推，雪球就越滚越大，不一会儿雪球就推不动了，我就把它当作雪人的下半身。接着我继续按照刚才的办法做了一个小一点的雪球，叫爸爸把两个雪球堆在一起，妈妈找来了一些树枝，把它们当做鼻子，眼睛和耳朵等，经过一番装饰打扮一个活泼可爱的雪人展现在我们的眼前，我还给雪人起了个名子叫”春欢”，意思就是它在春天', '今年的这场春雪，真是太美了。这个美，不光是景色，它还给人们带来了欢笑。\r\n本文是一篇叙事类的记叙文，采用了总分总的结构方式，首尾照应，中心突出，层次分明，条理清晰，语言通顺流畅，用词准确，紧密联系实际生活，真实可信，表达了小作者的真情实感。', '的雪和欢乐的笑声中诞生的。堆好雪人我和爸爸还玩起了打雪仗，捧起一把雪捏成团往爸爸身上扔，打到了我就胜利了，有时学女排姐姐发球雪花在半空中就散开了。你来我往互相追逐，既要进攻又要防守，忙得不亦乐乎！妈妈在一旁也没闲着，不停的按下快门捕捉精彩的瞬间，一家人可开心了。', '1');
INSERT INTO `enroll` VALUES ('3164', '127', '3', '我是您的孙女嘉佳，您在天堂过得好吗？我好想您，有好几次做梦梦到您了。奶奶，您走了已经有9年了，可我的脑海里经常会浮现出您的样子。奶奶。', '小时候，您为我洗头时总会给我讲故事。有一次，我哭着说不想洗头。您就去隔壁李叔叔家拿了个鸡毛掸子，我看了以后哭的更厉害了。您不管三七二十一直接朝我打来，我哭着说：“坏奶奶，打嘉佳的坏奶奶。我不要你了，我要妈妈！妈妈！”您听了以后，就把掸子给放了回去。摸着我的头说：“嘉佳乖，是奶奶不好。不应该打嘉佳的，奶奶给你道歉了，对不起。”我听了后，问：“奶奶能给嘉佳吃‘干水果’吗？”“只要嘉佳洗头，奶奶什么都给！”我马上停止了哭泣。', '奶奶，以前您在世的时候，您是最疼我的了。现在您走了，爸爸妈妈都让着弟弟来攻打我。奶奶，您能回来吗？嘉佳想您了。以前我不听爸爸妈妈的话，他们就打我。是您恳求他们别打我，他们是看在您的面子上才善罢甘休的。现在，我跟弟弟吵架，他们不分青红皂白的就打我。奶奶，您回来吧！回来疼疼我这个可怜的娃吧。奶奶。', '本文内容非常感人，情感真挚，“我”的遭遇好让人同情啊！ 但是从表达水平来看，语言过于平淡，叙事也没有技巧，就好像生活直录一样。希望作者能够坚强起来，学好文化知识。', '7');
INSERT INTO `enroll` VALUES ('3166', '128', '3', '妈妈的爱，无处不在。妈妈的爱，是伟大的。\r\n我还记得那是星期三放学时，我的妈妈就骑着自行车来接我的。当时我的妈妈想带我去买东西的，可是，因为那时候我带了很多东西。', '妈妈她不但没有让我拿所有的东西，还把东西都放在车篮里，不知为什么，我的心里突然出现了一道爱的暖流。', '在桥上，因为太重了，所以骑起来非常困难。就在这时，我大喊：“妈妈加油。”妈妈听到了我的加油声，立即加快了速度，很快就过了桥，来到超市里买东西，买完东西之后，就回了家。', '这就是妈妈给我的爱，就是把所有的苦都往自己的身上推。我只想对妈妈说一句话：“妈妈，谢谢您对我这么多的爱！”\r\n妈妈的爱是纯净的，妈妈的爱是透明的，我爱妈妈。\r\n', '1');
INSERT INTO `enroll` VALUES ('3167', '128', '9', '妈妈的爱，无处不在。妈妈的爱，是伟大的。\r\n我还记得那是星期三放学时，我的妈妈就骑着自行车来接我的。当时我的妈妈想带我去买东西的，可是，因为那时候我带了很多东西。', '妈妈她不但没有让我拿所有的东西，还把东西都放在车篮里，不知为什么，我的心里突然出现了一道爱的暖流。', '在桥上，因为太重了，所以骑起来非常困难。就在这时，我大喊：“妈妈加油。”妈妈听到了我的加油声，立即加快了速度，很快就过了桥，来到超市里买东西，买完东西之后，就回了家。', '这就是妈妈给我的爱，就是把所有的苦都往自己的身上推。我只想对妈妈说一句话：“妈妈，谢谢您对我这么多的爱！”\r\n妈妈的爱是纯净的，妈妈的爱是透明的，我爱妈妈。\r\n', '1');
INSERT INTO `enroll` VALUES ('3168', '129', '3', '相传古时候猫和老鼠是一对好朋友，可是，猫为什么会吃老鼠呢?还是我来告诉你吧！\r\n有一天，猫和老鼠还在睡觉的时候，松鼠姐姐告诉它们：“明天早上羊伯伯要开一个12生肖大会，邀请小动物们来参加。来的最早的小动物就是12生肖里的老大。”猫和老鼠听到这个消息，很早就睡了，猫还对老鼠说：“明天早上四点，你叫我一声，我们一定要抢到第一、二名的位子。”说完就睡着了。', '早上四点，老鼠起床了，它拼命对猫喊：“快起床，快起床……”可猫还在做美梦，于是老鼠就先走了。\r\n老鼠是第一个到那儿的，所以是12生肖里的老大，接下去是牛、虎、兔、龙、蛇、马、羊、猴、鸡、狗、猪。', '中午都快到了，猫才醒，它自言自语地说：“这老鼠真不够朋友！”说完，就去了。到了那，小动物都已经散会了，所以12生肖里没有猫。猫回去的时候，很狠老鼠，于是，猫就要抓老鼠。', '“相传古时候猫和老鼠是一对好朋友，可是，猫为什么会吃老鼠呢?还是我来告诉你吧！”巧设悬念，引起读者阅读兴趣。“中午都快到了，猫才醒，它自言自语地说：‘这老鼠真不够朋友！’说完，就去了。到了那，小动物都已经散会了，所以12生肖里没有猫。猫回去的时候，很狠老鼠，于是，猫就要抓老鼠。”总结全文，解开悬念，自然收束，好。', '1');
INSERT INTO `enroll` VALUES ('3169', '129', '9', '相传古时候猫和老鼠是一对好朋友，可是，猫为什么会吃老鼠呢?还是我来告诉你吧！\r\n有一天，猫和老鼠还在睡觉的时候，松鼠姐姐告诉它们：“明天早上羊伯伯要开一个12生肖大会，邀请小动物们来参加。来的最早的小动物就是12生肖里的老大。”猫和老鼠听到这个消息，很早就睡了，猫还对老鼠说：“明天早上四点，你叫我一声，我们一定要抢到第一、二名的位子。”说完就睡着了', '早上四点，老鼠起床了，它拼命对猫喊：“快起床，快起床……”可猫还在做美梦，于是老鼠就先走了。\r\n老鼠是第一个到那儿的，所以是12生肖里的老大，接下去是牛、虎、兔、龙、蛇、马、羊、猴、鸡、狗、猪。', '中午都快到了，猫才醒，它自言自语地说：“这老鼠真不够朋友！”说完，就去了。到了那，小动物都已经散会了，所以12生肖里没有猫。猫回去的时候，很狠老鼠，于是，猫就要抓老鼠。\r\n', '“相传古时候猫和老鼠是一对好朋友，可是，猫为什么会吃老鼠呢?还是我来告诉你吧！”巧设悬念，引起读者阅读兴趣。“中午都快到了，猫才醒，它自言自语地说：‘这老鼠真不够朋友！’说完，就去了。到了那，小动物都已经散会了，所以12生肖里没有猫。猫回去的时候，很狠老鼠，于是，猫就要抓老鼠。”总结全文，解开悬念，自然收束，好。', '1');
INSERT INTO `enroll` VALUES ('3170', '130', '3', '我曾看到过这样一幅漫画：有个小孩带着皇帝的面具，光着身子站在椅子上，而他的爸爸却蹲在椅子下，拿着那个小孩的衣服，嘴里却说着：“皇帝，这是你的新衣。”', '看到这，我便想：这个小孩自己不会穿衣服吗？不是的。然而让我更为震惊的是，他的妈妈却躲在门后，嘴里兴奋的说“哈哈，孩子终于穿衣服了，这个办法真灵。”是啊，现在的大人，太爱自己的孩子了，特别是独生子女的家庭，父母甚至达到了对孩子“溺爱”的程度。正是这种爱，让孩子失去了自立的能力，甚至有些孩子上厕所都要大人陪着，这正是大人的爱，爱错了，爱他们，就应该让他们从小学会独立，父母的爱，该放手时就放掉吧！正如这个漫画，正是父母的错。而有些孩子不懂得珍惜，一味的挑剔。这个不好看、这个不好吃、要这个、要那个，大人们太顺从孩子了。', '在这里，我要对天下所有父母说：“不要溺爱孩子，要让他们懂得独立，懂得珍惜，如果溺爱了他，你只会害了他啊！”\r\n语言平淡，不会描写', '就应该让他们从小学会独立，父母的爱，该放手时就放掉吧！正如这个漫画，正是父母的错。而有些孩子不懂得珍惜，一味的挑剔。这个不好看、这个不好吃、要这个、要那个，大人们太顺从孩子了。', '1');
INSERT INTO `enroll` VALUES ('3172', '131', '3', '马克·吐温曾经说过：“十九世纪有两奇人，一个是拿破伦，一个就是海伦·凯勒。”最近，读了一本关于海伦的书----《假如给我三天光明》，我的心被海伦那不屈不挠的精神所折服并深受震撼！', '这个故事主要讲：海伦？凯勒，在出生后19个月的时候，由于生了一场大病，导致失去了宝贵的听觉和视觉，但她的发声器官没有受损，就是因为接受不到学习和模仿的刺激，所以不会说话，变成了一个五官三残的重度残疾儿。面对这样的不幸，大多数人认为这就是命，命不好又能怪谁？但是我们不能不承认，绝大多数人遇到这样的生命困境时，往往会失去奋斗的精神和勇气，只是不愿意地接受这一切。而海伦？凯勒呢？她一开始，也曾因自己的条件而放弃过，可她又很快振作起来。这位美国女孩，在莎莉文老师的帮助下，凭着超人的毅力，不但学会了说话，还学会了五种语言', '文字！她一生共度过了八十八个春秋，却熬过了八十七个无声、无语、无光的孤独岁月！\r\n是什么给了她力量，答案是知识。是知识给了她生活的勇气，是知识给了她接受生命挑战的力量，使她能以惊人的毅力面对困境，终于在黑暗中找到了人生的光明。是知识使她产生了一种的信仰：现实环境固然可怕，但人类应该抱持希望，不断奋斗。生命的意义何在，人生的价值何在？在我们有限的生命里，我们是不是也应该思考一下下面的问题：假如我只有三天的光明，我将如何使用我的眼睛？想到三天后，太阳再也不会在我的眼前升起，我又将如何度过那宝贵的三天？我又会让我的眼睛停留在何处？', '海伦用她艰难却幸福快乐的一生，诠释了生命的意义。她的一生是人类的奇迹，她的自传，使我汗颜，也使我警醒……\r\n有位哲学家曾经说过：“勇敢寓于灵魂之中，而不是一副强壮的躯体。”这正是对海伦的真实写照。海伦凭着一颗坚强的心，最终在逆境中崛起，真是身残志不残。作为新一代的大学生，有着良好的生活和学习条件，但自身缺乏毅力。因此，这篇文章给我最大的启示是：', '1');
INSERT INTO `enroll` VALUES ('3173', '131', '9', '马克·吐温曾经说过：“十九世纪有两奇人，一个是拿破伦，一个就是海伦·凯勒。”最近，读了一本关于海伦的书----《假如给我三天光明》，我的心被海伦那不屈不挠的精神所折服并深受震撼！', '这个故事主要讲：海伦？凯勒，在出生后19个月的时候，由于生了一场大病，导致失去了宝贵的听觉和视觉，但她的发声器官没有受损，就是因为接受不到学习和模仿的刺激，所以不会说话，变成了一个五官三残的重度残疾儿。面对这样的不幸，大多数人认为这就是命，命不好又能怪谁？但是我们不能不承认，绝大多数人遇到这样的生命困境时，往往会失去奋斗的精神和勇气，只是不愿意地接受这一切。而海伦？凯勒呢？她一开始，也曾因自己的条件而放弃过，可她又很快振作起来。这位美国女孩，在莎莉文老师的帮助下，凭着超人的毅力，不但学会了说话，还学会了五种语言\r\n文字！她一生共度过了八十八个春秋，却熬过了八十七个无声、无语、无光的孤独岁月！', '是什么给了她力量，答案是知识。是知识给了她生活的勇气，是知识给了她接受生命挑战的力量，使她能以惊人的毅力面对困境，终于在黑暗中找到了人生的光明。是知识使她产生了一种的信仰：现实环境固然可怕，但人类应该抱持希望，不断奋斗。生命的意义何在，人生的价值何在？在我们有限的生命里，我们是不是也应该思考一下下面的问题：假如我只有三天的光明，我将如何使用我的眼睛？想到三天后，太阳再也不会在我的眼前升起，我又将如何度过那宝贵的三天？我又会让我的眼睛停留在何处？', '海伦用她艰难却幸福快乐的一生，诠释了生命的意义。她的一生是人类的奇迹，她的自传，使我汗颜，也使我警醒……\r\n有位哲学家曾经说过：“勇敢寓于灵魂之中，而不是一副强壮的躯体。”这正是对海伦的真实写照。海伦凭着一颗坚强的心，最终在逆境中崛起，真是身残志不残。作为新一代的大学生，有着良好的生活和学习条件，但自身缺乏毅力。因此，这篇文章给我最大的启示是：', '1');
INSERT INTO `enroll` VALUES ('3174', '132', '3', '我家的书桌上摆着一盆美丽的玫瑰花。它虽然不像月季那样娇艳惹人，但它那红色的美给人一种开心的感觉。\r\n阳春三月的时候，它长得很快，两天里，就可以长出两三朵花了。每一朵玫瑰花添上四、五片绿油油的叶儿。', '酷热的时候，它长得更艳丽，红通通的花瓣给人一种高兴的感觉，即使你有天大的烦恼也会抛到九霄云外似的。\r\n到了秋高气爽的时候，它还生长着，但长得黄了一点，不过没关系，我一样欣赏它优美的姿态。', '寒冷的冬天来了，玫瑰已经在凛冽的寒风中凋谢了，我的心很难过，对着凋谢的玫瑰花说：“可怜的玫瑰，我们又要等到春天来临的时候才可以见面了，我真的很寂寞！”\r\n玫瑰花呀，玫瑰花，你永远是我潘绍锋的好朋友！', '这篇文章，全文语言流畅自然，写出在不同季节玫瑰花的形态。层次分明，但小作者如果能在某一季节对玫瑰花进行细致的描写，而不是两三句带过，就更好了。', '1');
INSERT INTO `enroll` VALUES ('3175', '132', '9', '我家的书桌上摆着一盆美丽的玫瑰花。它虽然不像月季那样娇艳惹人，但它那红色的美给人一种开心的感觉。', '阳春三月的时候，它长得很快，两天里，就可以长出两三朵花了。每一朵玫瑰花添上四、五片绿油油的叶儿。\r\n酷热的时候，它长得更艳丽，红通通的花瓣给人一种高兴的感觉，即使你有天大的烦恼也会抛到九霄云外似的。', '到了秋高气爽的时候，它还生长着，但长得黄了一点，不过没关系，我一样欣赏它优美的姿态。\r\n寒冷的冬天来了，玫瑰已经在凛冽的寒风中凋谢了，我的心很难过，对着凋谢的玫瑰花说：“可怜的玫瑰，我们又要等到春天来临的时候才可以见面了，我真的很寂寞！”', '这篇文章，全文语言流畅自然，写出在不同季节玫瑰花的形态。层次分明，但小作者如果能在某一季节对玫瑰花进行细致的描写，而不是两三句带过，就更好了。', '1');
INSERT INTO `enroll` VALUES ('3176', '133', '3', '春\r\n冬天悄悄过去，春天也随之来临，没有了冬天的银妆素裹，万物都恢复了本来面貌；田野也随之褪去了地毯，变成原来的面孔。这时候，经过一个冬天准备的农民伯伯们也开始了“新的耕耘”，不过多久就插完了“春天的希望”，这时田野便成了华丽的“屏障”，风轻轻吹过，连绵起伏，仿佛大海般波涛汹涌，更似深邃的天空。青蛙忍不住赞美起来；蜻蜓也自在的畅游起来；燕子在空中自由翱翔；农民伯伯也在田野里辛勤地忙碌起来，这便成了一片祥和的自然景观，让人陶醉不已。', '夏\r\n随着春天的过去，夏天的激烈也腾腾而来，炎热的天气使田野干燥，夏天的害虫也趁机打起了庄稼的主意，农民伯伯这时更要提防了，他们既要洒农药和化肥，还要时刻注意天气的阴晴变化。很快早稻要割收了，农民伯伯要冒着夏日的酷热割稻子了，机子轰轰声已传遍田野，一种紧张的气息，让每一个人的神经都绷紧的。看！田间那些挥镰的农民伯伯们，弯着腰，流着汗，只想快割快割；稻子割完了，又想着快打快打；等稻子打完了，该松一口气了，又得赶快去给秋苗抛秧追肥。“田家少闲月，五月倍人忙”，他们肩上这时挑着夏秋两季的希望。', '秋\r\n秋天是硕果累累的季节，不像春天生机勃勃，不像夏天绚丽多彩，也不像冬天晶莹剔透，它总是保持着它独特的一面：远远眺望秋天的田野，上了色的稻子就如金色的地毯，闪闪发光，秋波摇晃着稻子，摇摆不定，使沉甸甸的稻穗有节奏地波动着。风声稻浪，如同一曲动人的乐章，又似金色的波涛，此起彼伏。只见农民伯伯又在辛勤地劳动着，虽然汗流浃背，但是从他们的脸上看到喜悦的笑容。割完的稻子堆在一起，就如一座座小山。', '冬\r\n悄悄走过明媚清纯的春天，活力迸放而为理想高燃的夏季，然后自盛放的夏季转入成熟的秋，由甜美成熟的秋进入沉思的冬季。冬季属于沉思而非凋零的季节，田野上成熟的稻子已收割，没有稻穗的摇曳，更无从听群蛙齐鸣，燕子飞来舞去，但是冬天的来临，可以让田里的害虫全部冻死，还可以吸收新的养分，来年可以使稻子长的更好，可以让农民脸上的笑容绽放得更灿烂。', '1');
INSERT INTO `enroll` VALUES ('3177', '133', '9', '松，愉快！\r\n春\r\n冬天悄悄过去，春天也随之来临，没有了冬天的银妆素裹，万物都恢复了本来面貌；田野也随之褪去了地毯，变成原来的面孔。这时候，经过一个冬天准备的农民伯伯们也开始了“新的耕耘”，不过多久就插完了“春天的希望”，这时田野便成了华丽的“屏障”，风轻轻吹过，连绵起伏，仿佛大海般波涛汹涌，更似深邃的天空。青蛙忍不住赞美起来；蜻蜓也自在的畅游起来；燕子在空中自由翱翔；农民伯伯也在田野里辛勤地忙碌起来，这便成了一片祥和的自然景观，让人陶醉不已。', '夏\r\n随着春天的过去，夏天的激烈也腾腾而来，炎热的天气使田野干燥，夏天的害虫也趁机打起了庄稼的主意，农民伯伯这时更要提防了，他们既要洒农药和化肥，还要时刻注意天气的阴晴变化。很快早稻要割收了，农民伯伯要冒着夏日的酷热割稻子了，机子轰轰声已传遍田野，一种紧张的气息，让每一个人的神经都绷紧的。看！田间那些挥镰的农民伯伯们，弯着腰，流着汗，只想快割快割；稻子割完了，又想着快打快打；等稻子打完了，该松一口气了，又得赶快去给秋苗抛秧追肥。“田家少闲月，五月倍人忙”，他们肩上这时挑着夏秋两季的希望。', '秋\r\n秋天是硕果累累的季节，不像春天生机勃勃，不像夏天绚丽多彩，也不像冬天晶莹剔透，它总是保持着它独特的一面：远远眺望秋天的田野，上了色的稻子就如金色的地毯，闪闪发光，秋波摇晃着稻子，摇摆不定，使沉甸甸的稻穗有节奏地波动着。风声稻浪，如同一曲动人的乐章，又似金色的波涛，此起彼伏。只见农民伯伯又在辛勤地劳动着，虽然汗流浃背，但是从他们的脸上看到喜悦的笑容。割完的稻子堆在一起，就如一座座小山。', '冬\r\n悄悄走过明媚清纯的春天，活力迸放而为理想高燃的夏季，然后自盛放的夏季转入成熟的秋，由甜美成熟的秋进入沉思的冬季。冬季属于沉思而非凋零的季节，田野上成熟的稻子已收割，没有稻穗的摇曳，更无从听群蛙齐鸣，燕子飞来舞去，但是冬天的来临，可以让田里的害虫全部冻死，还可以吸收新的养分，来年可以使稻子长的更好，可以让农民脸上的笑容绽放得更灿烂。', '1');
INSERT INTO `enroll` VALUES ('3178', '134', '3', '秋天来了，世界从绿色变成金黄色，我是千万叶子中的一员。\r\n我变成了金黄色，朋友们从树上落了下来，落在了地上成了漫山遍野的金地毯，所有的树上犹如结了金黄色的小金子，所有的绿色在眼前。渐渐地，渐渐地变成了黄色的天地，微风轻轻地吹拂着，我们在树上跳舞，树爷爷也跟着摇摆。整个世界成了叶的海洋，金黄的世界。苹果红红的，好像为世界增加了喜庆的色彩；麦子成熟了，也跟着我们一起在风中舞蹈，微风把麦子吹成了黄黄的；桃子粉粉的，好想为这世界的美丽色彩而感到惊叹，变得更加可爱了。', '我请风婆婆把我吹到远方去看看世界，风婆婆一吹，我飘在了空中。啊！洁白的云朵如雪花一样白，如彩虹一样美丽。透过几片树林从天空中看见了那美丽又清澈的湖水，湖水静静的，仿佛一面小镜子。湛蓝的天空映在湖面上，使湖水变的碧蓝碧蓝……我落在了草丛里，草丛上还有几颗露珠，它们把草当作滑滑梯，顺着滑了下来，如一颗珍珠，似一颗宝石，像一颗琥珀。露珠透过了阳光，它如一面镜子，将阳光洒向大地，成了金色的海洋。小鸟从天空中飞过，展翅飞翔，像一名英勇的战士，去保家卫国。', '我闻了闻，嗅到了小草的芳香，露珠的清爽，落花的芬芳，让我陶醉，让我如痴如醉……\r\n嘀嘀嘀，要下雨了，啪啪啪，雨来了，哗哗哗，啊！雨水可真美啊，给我洗了个澡。雨洒向了大地，大地湿润起来，清凉起来，万物生光辉，一切犹如新的一样。小草被雨水洗掉灰尘；小花儿更加干净了；大树如同个小孩子，摇摇身子，淋了场雨。虽然身体打湿了，但是心情却好了许多。', '大自然可真是奇妙无比，蕴含着许多奥秘，我多么希望，时间就这样暂停下来，一直暂停在这个美好的时刻，暂停在这个最温馨的时刻，暂停在这个最幸福的时刻，让我看看这个美丽的世界。\r\n这是一篇很独特很创新的写秋景的作文，文中作者将自己想象为一篇叶子，以叶子的第一视角，独特的写出不一样的秋色美景。突显出童真的美妙和对秋的爱。', '6');
INSERT INTO `enroll` VALUES ('3179', '134', '28', '秋天来了，世界从绿色变成金黄色，我是千万叶子中的一员。\r\n我变成了金黄色，朋友们从树上落了下来，落在了地上成了漫山遍野的金地毯，所有的树上犹如结了金黄色的小金子，所有的绿色在眼前。渐渐地，渐渐地变成了黄色的天地，微风轻轻地吹拂着，我们在树上跳舞，树爷爷也跟着摇摆。整个世界成了叶的海洋，金黄的世界。苹果红红的，好像为世界增加了喜庆的色彩；麦子成熟了，也跟着我们一起在风中舞蹈，微风把麦子吹成了黄黄的；桃子粉粉的，好想为这世界的美丽色彩而感到惊叹，变得更加可爱了。', '我请风婆婆把我吹到远方去看看世界，风婆婆一吹，我飘在了空中。啊！洁白的云朵如雪花一样白，如彩虹一样美丽。透过几片树林从天空中看见了那美丽又清澈的湖水，湖水静静的，仿佛一面小镜子。湛蓝的天空映在湖面上，使湖水变的碧蓝碧蓝……我落在了草丛里，草丛上还有几颗露珠，它们把草当作滑滑梯，顺着滑了下来，如一颗珍珠，似一颗宝石，像一颗琥珀。露珠透过了阳光，它如一面镜子，将阳光洒向大地，成了金色的海洋。小鸟从天空中飞过，展翅飞翔，像一名英勇的战士，去保家卫国。\r\n我闻了闻，嗅到了小草的芳香，露珠的清爽，落花的芬芳，让我陶醉，让我如痴如醉……', '嘀嘀嘀，要下雨了，啪啪啪，雨来了，哗哗哗，啊！雨水可真美啊，给我洗了个澡。雨洒向了大地，大地湿润起来，清凉起来，万物生光辉，一切犹如新的一样。小草被雨水洗掉灰尘；小花儿更加干净了；大树如同个小孩子，摇摇身子，淋了场雨。虽然身体打湿了，但是心情却好了许多。', '大自然可真是奇妙无比，蕴含着许多奥秘，我多么希望，时间就这样暂停下来，一直暂停在这个美好的时刻，暂停在这个最温馨的时刻，暂停在这个最幸福的时刻，让我看看这个美丽的世界。\r\n这是一篇很独特很创新的写秋景的作文，文中作者将自己想象为一篇叶子，以叶子的第一视角，独特的写出不一样的秋色美景。突显出童真的美妙和对秋的爱。', '1');
INSERT INTO `enroll` VALUES ('3180', '135', '3', '一年四季，我曾陶醉于莺歌燕舞、鸟语花香的春；我曾陶醉于骄阳似火、姹紫嫣红的夏；我曾陶醉于玉露生凉的、硕果累累的秋；但我更醉心于白雪皑皑、冰清玉洁的冬。虽然冬天没有阳光明媚、万紫千红；没有翠色欲流、林茂草盛；没有云淡日丽、硕果飘香，但是却有粉妆玉砌、银装素裹，在我眼里，它是一年四季中最美丽的风景。', '你看，天空辽阔高远，太阳睡眼朦胧，腼腆温存，小草穿上米黄色的大衣，花儿收回红裙绿衫，找到归宿，柳树收起柔嫩绿叶，挺立风中，蝴蝶变成蛹藏与地下，麦苗披着银装酣然入梦。天有些灰蒙蒙的，不一会儿，便下起了雪，雪花从天而降，好似轻盈的少女翩翩起舞；好似绵绵柳絮在空中游荡；好似软染得白砂糖从天而降，雪，在空中跳着她独有的飞雪舞，纷纷扬扬，漫天飞舞，在天地间展现她无穷的魅力。', '于是我取下手套，任由她飞落在我手上，还没等我看清她的样子，它却以在我手心融化，那种感觉真的很奇妙！\r\n不久，雪停了，田野披上一望无垠的地毯，树上如玉花绽放，屋顶如涂了白漆，道路如月光洒落，树上冰凌霜挂，太阳出来，红装素裹，粉妆玉砌，分外妖娆。 如此美丽的雪，怎叫人不爱她？', '我喜欢在冬天的美景中徜徉；\r\n我喜欢在冬天的美景中流连；\r\n我喜欢在冬天的美景中思考；\r\n冬天的美景，真让我陶醉……\r\n本文文笔优美，抒情浓郁，是一曲对冬天美景的美好颂歌。作者以抒情的笔调，浓墨重彩地描绘了一幅粉妆玉砌、银装素裹的冬天风景图画，表达了作者对冬天的喜爱与赞美。\r\n', '1');
INSERT INTO `enroll` VALUES ('3181', '135', '9', '一年四季，我曾陶醉于莺歌燕舞、鸟语花香的春；我曾陶醉于骄阳似火、姹紫嫣红的夏；我曾陶醉于玉露生凉的、硕果累累的秋；但我更醉心于白雪皑皑、冰清玉洁的冬。虽然冬天没有阳光明媚、万紫千红；没有翠色欲流、林茂草盛；没有云淡日丽、硕果飘香，但是却有粉妆玉砌、银装素裹，在我眼里，它是一年四季中最美丽的风景。', '你看，天空辽阔高远，太阳睡眼朦胧，腼腆温存，小草穿上米黄色的大衣，花儿收回红裙绿衫，找到归宿，柳树收起柔嫩绿叶，挺立风中，蝴蝶变成蛹藏与地下，麦苗披着银装酣然入梦。天有些灰蒙蒙的，不一会儿，便下起了雪，雪花从天而降，好似轻盈的少女翩翩起舞；好似绵绵柳絮在空中游荡；好似软染得白砂糖从天而降，雪，在空中跳着她独有的飞雪舞，纷纷扬扬，漫天飞舞，在天地间展现她无穷的魅力。', '于是我取下手套，任由她飞落在我手上，还没等我看清她的样子，它却以在我手心融化，那种感觉真的很奇妙！\r\n不久，雪停了，田野披上一望无垠的地毯，树上如玉花绽放，屋顶如涂了白漆，道路如月光洒落，树上冰凌霜挂，太阳出来，红装素裹，粉妆玉砌，分外妖娆。 如此美丽的雪，怎叫人不爱她？', '我喜欢在冬天的美景中徜徉；\r\n我喜欢在冬天的美景中流连；\r\n我喜欢在冬天的美景中思考；\r\n冬天的美景，真让我陶醉……\r\n本文文笔优美，抒情浓郁，是一曲对冬天美景的美好颂歌。作者以抒情的笔调，浓墨重彩地描绘了一幅粉妆玉砌、银装素裹的冬天风景图画，表达了作者对冬天的喜爱与赞美。\r\n', '1');
INSERT INTO `enroll` VALUES ('3182', '136', '3', '秋天，无论什么地方的秋天，总有自己的美。北国的秋来得很快，甚至说与夏和冬之间没有一点过渡。儿时，不远千里，从北京去老家湖南，不过是想尝尝湖南的秋。\r\n湖南的秋，极像玉女的脚步，轻盈又优雅，树木凋得很慢，空气湿润还弥漫着甜和发腻的桂花香，天空的颜色显得很淡，且多雨少风—这便是南国的秋，与北国恰恰相反。', '到了深秋，北国早已染成红色与黄色的天堂，南国的使者才刚刚想起要给树木披上美艳的大衣啦！\r\n在南国，秋天的残荷很“刺眼”，与南国的个性不符，但我却唯爱那奶奶家后院，挤满我眼睛的一池残荷。', '犹记《红楼梦》中众人即兴游湖，大观园里，一条木船，凌罗画舫，古朴高雅，美丽婢女手里撑一支长篙，划破一池残荷，清秋岑寂，众人兴致颇高，但又觉得残荷扫了雅兴，意欲除之而后快。只在船尾，林黛玉倚窗而坐，玉手托腮，凝眸澄澈犹如一潭秋水，柳眉颦蹙，不经意间轻言：“我最不喜欢李义山的诗，独爱他那句‘留得残荷听雨声’，偏你们却不留残荷了。”', '此刻，秋雨来了，预示着秋又要冷一层啦！\r\n荷塘之上，丝丝秋雨落在片片残荷上，侵润了整个荷叶，也给这池荷带去了一丝湿漉漉的忧。闭上眼睛，此刻跳动的不是心脏，而是雨，感受到秋姑娘以雨水为锤，以残荷为钢片，敲着自己独特的“马林巴”，虽不及古琴的古韵、编钟的清脆、琵琶的古风、二胡的绵长；只要你仔细地聆听，聆听“多少绿荷相倚恨”的无奈；倾听“菡菡香翠叶残”的苍凉；感受“红藕香残玉簟秋”的清冷。这！就是秋！', '1');
INSERT INTO `enroll` VALUES ('3183', '136', '28', '秋天，无论什么地方的秋天，总有自己的美。北国的秋来得很快，甚至说与夏和冬之间没有一点过渡。儿时，不远千里，从北京去老家湖南，不过是想尝尝湖南的秋。\r\n湖南的秋，极像玉女的脚步，轻盈又优雅，树木凋得很慢，空气湿润还弥漫着甜和发腻的桂花香，天空的颜色显得很淡，且多雨少风—这便是南国的秋，与北国恰恰相反。', '到了深秋，北国早已染成红色与黄色的天堂，南国的使者才刚刚想起要给树木披上美艳的大衣啦！\r\n在南国，秋天的残荷很“刺眼”，与南国的个性不符，但我却唯爱那奶奶家后院，挤满我眼睛的一池残荷。', '犹记《红楼梦》中众人即兴游湖，大观园里，一条木船，凌罗画舫，古朴高雅，美丽婢女手里撑一支长篙，划破一池残荷，清秋岑寂，众人兴致颇高，但又觉得残荷扫了雅兴，意欲除之而后快。只在船尾，林黛玉倚窗而坐，玉手托腮，凝眸澄澈犹如一潭秋水，柳眉颦蹙，不经意间轻言：“我最不喜欢李义山的诗，独爱他那句‘留得残荷听雨声’，偏你们却不留残荷了。”\r\n', '此刻，秋雨来了，预示着秋又要冷一层啦！\r\n荷塘之上，丝丝秋雨落在片片残荷上，侵润了整个荷叶，也给这池荷带去了一丝湿漉漉的忧。闭上眼睛，此刻跳动的不是心脏，而是雨，感受到秋姑娘以雨水为锤，以残荷为钢片，敲着自己独特的“马林巴”，虽不及古琴的古韵、编钟的清脆、琵琶的古风、二胡的绵长；只要你仔细地聆听，聆听“多少绿荷相倚恨”的无奈；倾听“菡菡香翠叶残”的苍凉；感受“红藕香残玉簟秋”的清冷。这！就是秋！', '1');
INSERT INTO `enroll` VALUES ('3184', '137', '3', '冬姑娘迈着寒冷的步伐来了，她携着洁白的小花篮，把美丽的雪花撒向大地。她默默不语，却给人们带来了阵阵欢笑。\r\n凛冽的寒风呼啸着，雪花纷纷扬扬地落下来，大地变成了银装素裹的世界。有的雪花喜欢褐色，便落在瓦片上；有的雪花喜欢白色，便落在湖里的冰冻上；还有的却落在我的衣服上，变成一颗颗晶莹的露珠。美丽极了！', '风一吹，那一簇簇雪花，像一只只蝴蝶在空中翩翩起舞，一切是那样迷人！\r\n校园里，传来银铃般的笑声。原来，是一群小伙伴在操场上堆雪人。他们动作熟练，不一会儿，便堆起一个大雪娃娃。一个小男孩，捡起一块小木条来当做雪人的鼻子。他们围着雪人尽情歌唱。有的同学郑雪球，天空上的雪球形成一道白彩带，欢歌笑语回荡在校园。', '冬天给大地带来无比美丽。冬天给我们带来了无穷的乐趣！', '这是一篇写景的作文，“冬姑娘迈着寒冷的步伐来了，她携着洁白的小花篮，把美丽的雪花撒向大地”、“有的雪花喜欢褐色，便落在瓦片上；有的雪花喜欢白色，便落在湖里的冰冻上；还有的却落在我的衣服上，变成一颗颗晶莹的露珠”等拟人和排比的运用，渲染了冬天的美丽和带给人的欢乐。', '1');
INSERT INTO `enroll` VALUES ('3185', '137', '34', '冬姑娘迈着寒冷的步伐来了，她携着洁白的小花篮，把美丽的雪花撒向大地。她默默不语，却给人们带来了阵阵欢笑。\r\n凛冽的寒风呼啸着，雪花纷纷扬扬地落下来，大地变成了银装素裹的世界。有的雪花喜欢褐色，便落在瓦片上；有的雪花喜欢白色，便落在湖里的冰冻上；还有的却落在我的衣服上，变成一颗颗晶莹的露珠。美丽极了！', '风一吹，那一簇簇雪花，像一只只蝴蝶在空中翩翩起舞，一切是那样迷人！\r\n校园里，传来银铃般的笑声。原来，是一群小伙伴在操场上堆雪人。他们动作熟练，不一会儿，便堆起一个大雪娃娃。一个小男孩，捡起一块小木条来当做雪人的鼻子。他们围着雪人尽情歌唱。有的同学郑雪球，天空上的雪球形成一道白彩带，欢歌笑语回荡在校园。', '冬天给大地带来无比美丽。冬天给我们带来了无穷的乐趣！', '这是一篇写景的作文，“冬姑娘迈着寒冷的步伐来了，她携着洁白的小花篮，把美丽的雪花撒向大地”、“有的雪花喜欢褐色，便落在瓦片上；有的雪花喜欢白色，便落在湖里的冰冻上；还有的却落在我的衣服上，变成一颗颗晶莹的露珠”等拟人和排比的运用，渲染了冬天的美丽和带给人的欢乐。', '1');
INSERT INTO `enroll` VALUES ('3186', '138', '3', '一踏进校园就可以看到一栋高高地耸立在地上的教学楼，像一个士兵守卫着学校。春姑娘也悄悄地来到了我们的学校，看，前面就是花钟了，这里的花都尽情地绽放着，花钟的花是那么鲜艳。', '顺着春姑娘的足迹，我穿过大厅，来到了桃李园，啊！桃李园里一片生机勃勃的景象，桃树上开满了桃花，春姑娘点了一下小草，小草便探出头来，摇了摇头，好像在向春姑娘问好。\r\n', '我跟着春姑娘，穿过操场，来到了篮球场。这里的大榕树显得生机勃勃，一些树上的生命，使这棵大榕树更显得生机勃勃，大树像撑开的巨伞，重重叠叠的枝丫，漏下斑斑点点细碎的日影。大榕树的根上长满了紫色的小花，多得像水一样溢了出来，像一条紫色的群子，正当我陶醉在这样的景色时，春姑娘不见了。我恍然大悟，这时我才明白，原来春姑娘就在我的身边，就是这美丽的校园。', '我们能在这样的校园学习，是多么美好啊！\r\n这是一篇写景文章，作者为我们描绘了春天中校园的景象。文章描写生动形象，尤其是在描写榕树过程中，作者将榕树比作巨伞，“重重叠叠的枝丫，漏下斑斑点点细碎的日影”，“重重叠叠”和“细碎的日影”再一次形象地突出了榕树之大，可见小作者描写功底之厚。然而作者在描述桃李园过程中，语言显得平淡，作者在这里没有做到详细描写。而且，作者在进入结尾时过渡显得不自然，给人突兀的感觉。', '1');
INSERT INTO `enroll` VALUES ('3202', '6', '10', '1', '1', '1', '1', '2');
INSERT INTO `enroll` VALUES ('3203', '20', '9', '1', '1', '1', '1', '4');
INSERT INTO `enroll` VALUES ('3204', '3', '9', '2', '2', '2', '2', '1');
INSERT INTO `enroll` VALUES ('3205', '6', '11', '2', '2', '2', '2', '4');
INSERT INTO `enroll` VALUES ('3206', '20', '10', '1', '2', '3', '4', '2');
INSERT INTO `enroll` VALUES ('3207', '3', '10', '3', '3', '3', '3', '2');
INSERT INTO `enroll` VALUES ('3208', '6', '12', '3', '3', '3', '3', '1');
INSERT INTO `enroll` VALUES ('3209', '20', '11', '1', '1', '1', '1', '4');
INSERT INTO `enroll` VALUES ('3210', '3', '11', '4', '4', '4', '4', '4');
INSERT INTO `enroll` VALUES ('3211', '3', '12', '5', '5', '5', '5', '1');
INSERT INTO `enroll` VALUES ('3212', '32', '3', '。', '。', '。', '。', '4');
INSERT INTO `enroll` VALUES ('3213', '61', '110', '测试', '测试', '测试', '测试', '1');

-- ----------------------------
-- Table structure for guide
-- ----------------------------
DROP TABLE IF EXISTS `guide`;
CREATE TABLE `guide` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUESTION` varchar(255) NOT NULL,
  `ANSWER` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guide
-- ----------------------------
INSERT INTO `guide` VALUES ('1', '首页介绍', '游客在首页浏览与社团有关的各种文章，点击查看文章详情，手指从手机屏幕右侧边缘向左侧滑动可拉出搜索界面，针对自己的兴趣来检索文章。');
INSERT INTO `guide` VALUES ('2', '社团概览使用方式', '控制台，点击社团概览下的任意按钮，可进入对应社团级别的社团列表，点击列表项可查询到该社团下的部门结构。');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SENDER` varchar(10) NOT NULL COMMENT '发件人',
  `RECEVIER` varchar(10) NOT NULL COMMENT '收件人',
  `THEME` varchar(50) NOT NULL COMMENT '主题',
  `TIME` varchar(15) NOT NULL COMMENT '时间',
  `CONTENT` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`ID`),
  KEY `mail_r` (`RECEVIER`),
  KEY `mail_s` (`SENDER`) USING BTREE,
  CONSTRAINT `mail_r` FOREIGN KEY (`RECEVIER`) REFERENCES `user` (`LOGNAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mail_s` FOREIGN KEY (`SENDER`) REFERENCES `user` (`LOGNAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信表';

-- ----------------------------
-- Records of mail
-- ----------------------------

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DEPID` int(11) NOT NULL COMMENT '部门id',
  `THEME` varchar(50) NOT NULL COMMENT '会议主题',
  `TIME` varchar(50) NOT NULL COMMENT '会议时间',
  `ROOM` varchar(50) NOT NULL COMMENT '会议地点',
  `MEMID` int(11) NOT NULL COMMENT '会议记录人',
  `NOTE` longtext COMMENT '会议纪要',
  `SHOULDNUM` varchar(5) DEFAULT NULL COMMENT '应到人数 ',
  `EVENTNUM` varchar(5) DEFAULT NULL COMMENT '请假人数',
  `NOTNUM` varchar(5) DEFAULT NULL COMMENT '无故未到人数',
  `REALNUM` varchar(5) DEFAULT NULL COMMENT '实到人数',
  PRIMARY KEY (`ID`),
  KEY `met_depID` (`DEPID`),
  KEY `met_memID` (`MEMID`),
  CONSTRAINT `met_depID` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `met_memID` FOREIGN KEY (`MEMID`) REFERENCES `member` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('1', '3', '4/23-4/27周例会', '2018年4月29日', '3号实验楼300', '11', '会议主持人：刘浩\n与会部长：冯术欣，李林真\n请假人员名单：……\n主要内容\n一、出去玩\n1)去崂山\n2)周末去', '32', '13', '3', '13');
INSERT INTO `meeting` VALUES ('3', '3', '五一去哪玩', '2018-04-29 17:55:00', '大活109', '9', null, null, null, null, null);
INSERT INTO `meeting` VALUES ('4', '3', '五一周例会', '2018-05-22 18:40:00', '3实300', '7', '暂无', null, null, null, null);
INSERT INTO `meeting` VALUES ('5', '3', '清明节出游', '2018-06-26 18:40:00', '三实300', '11', '网易云音乐', '13', '3', '6', '4');
INSERT INTO `meeting` VALUES ('6', '3', '第十周周例会', '2018-05-06 20:28:00', '大活109', '14', null, null, null, null, null);
INSERT INTO `meeting` VALUES ('7', '3', '第九周周例会', '2018-05-04 20:29:00', '一教111', '13', null, null, null, null, null);
INSERT INTO `meeting` VALUES ('8', '3', '测试', '2018-05-19 07:31:00', '办公室', '11', '测试', '31', '12', '2', '17');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `STUID` int(11) NOT NULL COMMENT '学生id',
  `DEPID` int(11) NOT NULL COMMENT '部门id',
  `APPRAISE` longtext COMMENT '评价',
  `STATUS` varchar(5) NOT NULL COMMENT '工位状态（1：试用，2：正式，3：离职）',
  PRIMARY KEY (`ID`),
  KEY `mem_stuID` (`STUID`),
  KEY `mem_depID` (`DEPID`),
  CONSTRAINT `mem_depID` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mem_stuID` FOREIGN KEY (`STUID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='部门成员表';

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '1', '4', null, '1');
INSERT INTO `member` VALUES ('5', '110', '3', null, '1');
INSERT INTO `member` VALUES ('7', '9', '3', null, '1');
INSERT INTO `member` VALUES ('9', '57', '3', null, '1');
INSERT INTO `member` VALUES ('11', '61', '3', null, '1');
INSERT INTO `member` VALUES ('12', '59', '3', null, '1');
INSERT INTO `member` VALUES ('13', '357', '3', null, '1');
INSERT INTO `member` VALUES ('14', '352', '3', null, '1');
INSERT INTO `member` VALUES ('15', '352', '43', null, '1');
INSERT INTO `member` VALUES ('16', '20', '11', null, '1');
INSERT INTO `member` VALUES ('18', '3', '11', null, '1');
INSERT INTO `member` VALUES ('20', '110', '9', null, '1');
INSERT INTO `member` VALUES ('22', '120', '3', null, '1');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `CONTENT` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('2', '553', '是不是可以加一个像qq或者微信那样，可以把重要消息暂时置顶的操作。');
INSERT INTO `problem` VALUES ('5', '549', '在点击校级社团/院级社团之后 有个社团概览 点击某一社团之后 有个部门概览 再点击某一部门之后 就没有反应了 不知道是不是因为没有填充数据的缘故');
INSERT INTO `problem` VALUES ('6', '549', '建议点击 退出登录的时候 再加一个：您是否确认退出？  \n因为现在这样特别灵敏 一不小心点到就退出了');
INSERT INTO `problem` VALUES ('7', '7', '控制台，加入社团添加报名信息，社团级别，名称，部门名称点击停止运行');
INSERT INTO `problem` VALUES ('11', '64', '建议加上二维码');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOGNAME` varchar(20) NOT NULL COMMENT '学号/登录名',
  `NAME` varchar(20) NOT NULL COMMENT '姓名',
  `SEX` varchar(2) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(15) DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(20) DEFAULT NULL COMMENT '民族',
  `GRADE` varchar(5) DEFAULT NULL COMMENT '年级（2014：2014级，2015：2015级……）',
  `DEPARTMENT` varchar(50) DEFAULT NULL COMMENT '院系',
  `MAJOR` varchar(50) DEFAULT NULL COMMENT '专业',
  `PHONE` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `QQNUMBER` varchar(15) DEFAULT NULL COMMENT 'QQ号',
  `DORM` varchar(20) DEFAULT NULL COMMENT '宿舍号',
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `LOGNAME` (`LOGNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '201540403001', '张金鹏', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('2', '201540403002', '毕思芳', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('3', '201540403003', '史本康', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('4', '201540403004', '张艺馨', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('5', '201540403005', '石诚', '2', '1996-05-16', '20', '2015', '3', '8', '15978465133', '79846531211', '1#102');
INSERT INTO `student` VALUES ('6', '201540403006', '孙嘉', '1', '1996-8-16', '20', '2015', '19', '68', '1235163', '0', '1#101');
INSERT INTO `student` VALUES ('7', '201540403007', '王加豪', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('8', '201540403008', '刘长顺', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('9', '201540403009', '栾雨萱', '2', '1996-6-13', '20', '2015', '19', '68', '13061318537', '0', '1#101');
INSERT INTO `student` VALUES ('10', '201540403010', '王艳', '2', '1996-7-23', '20', '2015', '19', '68', '13561233853', '0', '1#101');
INSERT INTO `student` VALUES ('11', '201540403011', '王佳宁', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('12', '201540403012', '袁源', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('13', '201540403013', '吴浩', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('14', '201540403014', '程培越', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('15', '201540403015', '王英州', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('16', '201540403016', '卢欢', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('17', '201540403017', '金璐', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('18', '201540403018', '李安琪', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('19', '201540403019', '王新雨', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('20', '201540403020', '鲁逸宽', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('21', '201540403021', '卢昱运', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('22', '201540403022', '晋成琳', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('23', '201540403023', '杨凌云', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('24', '201540403024', '高焰', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('25', '201540403025', '陈若愚', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('26', '201540403026', '贾子薇', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('27', '201540403027', '贾晓月', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('28', '201540403028', '宋修伟', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('29', '201540403029', '孙怡', '2', '1997-7-11', '20', '2015', '19', '68', '13549874569', '1351852465', '1#101');
INSERT INTO `student` VALUES ('30', '201540403030', '康世伟', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('31', '201540403031', '李万昇', '1', '1996-01-09', '20', '2015', '19', '68', '13556332563', '0', '1#101');
INSERT INTO `student` VALUES ('32', '201540403032', '倪珍妮', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('33', '201540403033', '姚大海', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('34', '201540403034', '王诗裕', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('35', '201540403035', '李慧', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('36', '201540403036', '闫永顺', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('37', '201540403037', '朱怡美', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('38', '201540403038', '郭志明', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('39', '201540403040', '刘淑佳', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('40', '201540403041', '邓运长', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('41', '201540403042', '陶硕', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('42', '201540403043', '胡桥', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('43', '201540403044', '宋俊淼', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('44', '201540403045', '付建国', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('45', '201540403046', '梁淑娴', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('46', '201540403047', '杨丽', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('47', '201540403048', '冉立凡', null, null, null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('48', '201540403049', '张珊珊', null, '1996-7-21', null, null, null, null, null, '0', '1#101');
INSERT INTO `student` VALUES ('49', '2016200022', '刘宗涛', '1', '1999-05-16', '20', '2016', '33', '154', '18266715268', '0', '1#101');
INSERT INTO `student` VALUES ('50', '2016200026', '刘天城', '1', '1997-10-14', '20', '2016', '13', '42', '13864200000', '0', '1#101');
INSERT INTO `student` VALUES ('51', '2016200086', '王志浩', '1', '1997-12-24', '20', '2016', '13', '46', '13475700000', '0', '1#101');
INSERT INTO `student` VALUES ('52', '2016200087', '王晓晴', '2', '1998-09-13', '20', '2016', '13', '46', '18754900000', '0', '1#101');
INSERT INTO `student` VALUES ('53', '2016200126', '杨召远', '1', '1997-02-26', '20', '2016', '13', '45', '15063800000', '0', '1#101');
INSERT INTO `student` VALUES ('54', '2016200138', '沈雪', '2', '1998-12-02', '20', '2016', '13', '45', '18265500000', '0', '1#101');
INSERT INTO `student` VALUES ('55', '2016200149', '丁立洲', '1', '1998-03-25', '20', '2016', '13', '45', '13863500000', '0', '1#101');
INSERT INTO `student` VALUES ('56', '2016200160', '樊佳宁', '2', '1997-01-08', '20', '2016', '13', '39', '13689500000', '0', '1#101');
INSERT INTO `student` VALUES ('57', '2016200209', '姜静', '2', '1997-09-19', '20', '2016', '13', '39', '13176900000', '0', '1#101');
INSERT INTO `student` VALUES ('58', '2016200297', '耿金生', '1', '1998-04-06', '20', '2016', '13', '39', '18697100000', '0', '1#101');
INSERT INTO `student` VALUES ('59', '2016200313', '朱翔宇', '1', '1998-03-08', '20', '2016', '13', '48', '13561200000', '0', '1#101');
INSERT INTO `student` VALUES ('60', '2016200336', '穆坤', '1', '1998-02-21', '20', '2016', '13', '47', '13820200000', '0', '1#101');
INSERT INTO `student` VALUES ('61', '2016200367', '郝雨欣', '2', '1997-02-15', '20', '2016', '13', '47', '13061370929', '123623', '东苑1号楼');
INSERT INTO `student` VALUES ('62', '2016200380', '李瑞霖', '1', '1998-02-19', '20', '2016', '13', '47', '18615000000', '0', '1#101');
INSERT INTO `student` VALUES ('63', '2016200391', '李文琪', '1', '1997-11-30', '20', '2016', '13', '47', '13884700000', '0', '1#101');
INSERT INTO `student` VALUES ('64', '2016200401', '魏猛', '1', '1998-08-17', '20', '2016', '13', '47', '15853100000', '0', '1#101');
INSERT INTO `student` VALUES ('65', '2016200426', '叶宝珠', '2', '1998-01-21', '20', '2016', '13', '47', '13754600000', '0', '1#101');
INSERT INTO `student` VALUES ('66', '2016200444', '孙同正', '1', '1998-11-17', '20', '2016', '13', '47', '13854900000', '0', '1#101');
INSERT INTO `student` VALUES ('67', '2016200464', '言幸', '2', '1998-08-10', '20', '2016', '13', '47', '13873300000', '0', '1#101');
INSERT INTO `student` VALUES ('68', '2016200476', '姜雨彤', '2', '1998-10-18', '20', '2016', '3', '8', '13624400000', '0', '1#101');
INSERT INTO `student` VALUES ('69', '2016200495', '刘佳佳', '2', '1997-12-11', '20', '2016', '3', '8', '15192000000', '0', '1#101');
INSERT INTO `student` VALUES ('70', '2016200522', '丛蕾', '2', '1997-11-18', '20', '2016', '3', '8', '13863900000', '0', '1#101');
INSERT INTO `student` VALUES ('71', '2016200638', '魏天琳', '1', '1998-02-05', '20', '2016', '34', '157', '15264600000', '0', '1#101');
INSERT INTO `student` VALUES ('72', '2016200707', '沈雅文', '2', '1997-08-06', '20', '2016', '21', '85', '15053300000', '0', '1#101');
INSERT INTO `student` VALUES ('73', '2016200730', '闫旭文', '1', '1998-12-30', '20', '2016', '21', '85', '15554500000', '0', '1#101');
INSERT INTO `student` VALUES ('74', '2016200785', '孙学朋', '1', '1998-06-26', '20', '2016', '24', '103', '13455000000', '0', '1#101');
INSERT INTO `student` VALUES ('75', '2016200796', '成宏阔', '1', '1997-08-25', '20', '2016', '24', '103', '15863600000', '0', '1#101');
INSERT INTO `student` VALUES ('76', '2016200884', '王慧洁', '2', '1997-10-05', '20', '2016', '26', '118', '15725900000', '0', '1#101');
INSERT INTO `student` VALUES ('77', '2016200910', '胡晓溪', '2', '1998-03-01', '20', '2016', '26', '118', '13863600000', '0', '1#101');
INSERT INTO `student` VALUES ('78', '2016200941', '李青霞', '2', '1997-10-16', '20', '2016', '26', '115', '15095200000', '0', '1#101');
INSERT INTO `student` VALUES ('79', '2016200947', '李爱娟', '2', '1998-04-22', '20', '2016', '26', '115', '15006700000', '0', '1#101');
INSERT INTO `student` VALUES ('80', '2016200963', '马璐璐', '2', '1997-10-28', '20', '2016', '26', '118', '13562800000', '0', '1#101');
INSERT INTO `student` VALUES ('81', '2016200969', '朱子越', '2', '1998-03-14', '20', '2016', '26', '118', '13793800000', '0', '1#101');
INSERT INTO `student` VALUES ('82', '2016201038', '孙占法', '1', '1998-11-06', '20', '2016', '26', '118', '13563500000', '0', '1#101');
INSERT INTO `student` VALUES ('83', '2016201088', '尹玉双', '2', '1997-09-09', '20', '2016', '25', '112', '13646400000', '0', '1#101');
INSERT INTO `student` VALUES ('84', '2016201093', '宋晓', '2', '1998-08-12', '20', '2016', '25', '109', '13687600000', '0', '1#101');
INSERT INTO `student` VALUES ('85', '2016201146', '王晓丹', '2', '1997-09-25', '20', '2016', '25', '112', '13516300000', '0', '1#101');
INSERT INTO `student` VALUES ('86', '2016201239', '赵莅佳', '2', '1998-02-28', '20', '2016', '25', '112', '13668100000', '0', '1#101');
INSERT INTO `student` VALUES ('87', '2016201240', '娄津珲', '2', '1998-11-30', '20', '2016', '25', '112', '15209900000', '0', '1#101');
INSERT INTO `student` VALUES ('88', '2016201300', '王梦娇', '2', '1997-11-12', '20', '2016', '25', '113', '13969800000', '0', '1#101');
INSERT INTO `student` VALUES ('89', '2016201302', '于峻', '2', '1998-03-23', '20', '2016', '25', '113', '13864300000', '0', '1#101');
INSERT INTO `student` VALUES ('90', '2016201334', '帅琦', '2', '1998-11-07', '20', '2016', '25', '113', '13465400000', '0', '1#101');
INSERT INTO `student` VALUES ('91', '2016201339', '刘菊', '2', '1998-09-18', '20', '2016', '25', '113', '15554000000', '0', '1#101');
INSERT INTO `student` VALUES ('92', '2016201390', '吴林缜', '2', '1998-03-19', '20', '2016', '25', '104', '13963700000', '0', '1#101');
INSERT INTO `student` VALUES ('93', '2016201392', '赵紫璇', '2', '1997-12-27', '20', '2016', '25', '104', '15064600000', '0', '1#101');
INSERT INTO `student` VALUES ('94', '2016201415', '贾晓敏', '2', '1996-03-06', '20', '2016', '25', '104', '13793900000', '0', '1#101');
INSERT INTO `student` VALUES ('95', '2016201448', '许峰', '1', '1998-03-26', '20', '2016', '25', '111', '15966200000', '0', '1#101');
INSERT INTO `student` VALUES ('96', '2016201475', '韩珊珊', '2', '1998-02-01', '20', '2016', '28', '131', '13210500000', '0', '1#101');
INSERT INTO `student` VALUES ('97', '2016201476', '李晓萱', '2', '1998-01-13', '20', '2016', '28', '131', '13573100000', '0', '1#101');
INSERT INTO `student` VALUES ('98', '2016201481', '廖文慧', '2', '1997-09-21', '20', '2016', '28', '131', '15192000000', '0', '1#101');
INSERT INTO `student` VALUES ('99', '2016201575', '马小斐', '2', '1997-10-22', '20', '2016', '23', '99', '15192700000', '0', '1#101');
INSERT INTO `student` VALUES ('100', '2016201609', '王志超', '1', '1998-10-15', '20', '2016', '23', '99', '13646300000', '0', '1#101');
INSERT INTO `student` VALUES ('101', '2016201610', '王纪敏', '1', '1998-05-16', '20', '2016', '23', '99', '13969900000', '0', '1#101');
INSERT INTO `student` VALUES ('102', '2016201673', '郭金一', '1', '1998-09-03', '20', '2016', '23', '98', '15106800000', '0', '1#101');
INSERT INTO `student` VALUES ('103', '2016201784', '张建波', '1', '1997-12-24', '20', '2016', '9', '25', '15063600000', '0', '1#101');
INSERT INTO `student` VALUES ('104', '2016201799', '陈祥云', '2', '1998-09-09', '20', '2016', '9', '25', '13409000000', '0', '1#101');
INSERT INTO `student` VALUES ('105', '2016201819', '潘思羽', '2', '1999-02-13', '20', '2016', '9', '23', '13943700000', '0', '1#101');
INSERT INTO `student` VALUES ('106', '2016201831', '胡晓晨', '2', '1998-07-26', '20', '2016', '9', '23', '13573400000', '0', '1#101');
INSERT INTO `student` VALUES ('107', '2016201907', '赵梦翰', '1', '1998-03-04', '20', '2016', '15', '55', '15805400000', '0', '1#101');
INSERT INTO `student` VALUES ('108', '2016201912', '刘坤媛', '2', '1997-12-21', '20', '2016', '15', '52', '13793400000', '0', '1#101');
INSERT INTO `student` VALUES ('109', '2016201974', '刘梅', '2', '1997-07-31', '20', '2016', '21', '86', '13181300000', '0', '1#101');
INSERT INTO `student` VALUES ('110', '2016201995', '王玥', '2', '1998-04-22', '20', '2016', '23', '102', '13847300000', '0', '1#101');
INSERT INTO `student` VALUES ('111', '2016202061', '王子琦', '1', '1998-07-29', '20', '2016', '11', '29', '13583200000', '0', '1#101');
INSERT INTO `student` VALUES ('112', '2016202105', '赵鑫宇', '1', '1998-05-18', '20', '2016', '11', '29', '13675300000', '0', '1#101');
INSERT INTO `student` VALUES ('113', '2016202138', '杨继华', '1', '1998-03-30', '20', '2016', '11', '29', '13406500000', '0', '1#101');
INSERT INTO `student` VALUES ('114', '2016202155', '赵天昊', '1', '1999-02-14', '20', '2016', '11', '29', '15866600000', '0', '1#101');
INSERT INTO `student` VALUES ('115', '2016202198', '杨亚龙', '1', '1997-09-26', '20', '2016', '11', '29', '15898600000', '0', '1#101');
INSERT INTO `student` VALUES ('116', '2016202202', '孔凡卓', '1', '1996-10-10', '20', '2016', '11', '29', '15092700000', '0', '1#101');
INSERT INTO `student` VALUES ('117', '2016202219', '张明', '1', '1998-03-05', '20', '2016', '11', '29', '15269800000', '0', '1#101');
INSERT INTO `student` VALUES ('118', '2016202231', '王瑞林', '1', '1998-02-21', '20', '2016', '11', '29', '13863000000', '0', '1#101');
INSERT INTO `student` VALUES ('119', '2016202242', '胡宗强', '1', '1997-08-13', '20', '2016', '11', '29', '15166200000', '0', '1#101');
INSERT INTO `student` VALUES ('120', '2016202243', '夏培杰', '1', '1997-11-20', '20', '2016', '11', '29', '15950000000', '0', '1#101');
INSERT INTO `student` VALUES ('121', '2016202267', '袁旭', '1', '1997-10-29', '20', '2016', '11', '29', '15966400000', '0', '1#101');
INSERT INTO `student` VALUES ('122', '2016202327', '宋鑫铜', '1', '1998-02-17', '20', '2016', '11', '29', '13721400000', '0', '1#101');
INSERT INTO `student` VALUES ('123', '2016202339', '程文宇', '1', '1997-10-15', '20', '2016', '11', '29', '18315100000', '0', '1#101');
INSERT INTO `student` VALUES ('124', '2016202342', '严巨彬', '1', '1998-01-13', '20', '2016', '11', '29', '13778900000', '0', '1#101');
INSERT INTO `student` VALUES ('125', '2016202368', '孙高寒', '1', '1997-12-25', '20', '2016', '11', '28', '13791600000', '0', '1#101');
INSERT INTO `student` VALUES ('126', '2016202379', '毕崇明', '1', '1997-10-18', '20', '2016', '11', '28', '18763200000', '0', '1#101');
INSERT INTO `student` VALUES ('127', '2016202383', '赵乐贤', '1', '1998-03-25', '20', '2016', '11', '28', '15806300000', '0', '1#101');
INSERT INTO `student` VALUES ('128', '2016202387', '董国祥', '1', '1998-10-04', '20', '2016', '11', '28', '17854900000', '0', '1#101');
INSERT INTO `student` VALUES ('129', '2016202495', '毕会杰', '1', '1997-09-04', '20', '2016', '27', '120', '13563100000', '0', '1#101');
INSERT INTO `student` VALUES ('130', '2016202502', '周晓泽', '1', '1997-04-16', '20', '2016', '27', '120', '15065500000', '0', '1#101');
INSERT INTO `student` VALUES ('131', '2016202526', '张犇', '1', '1998-01-10', '20', '2016', '1', '2', '13645300000', '0', '1#101');
INSERT INTO `student` VALUES ('132', '2016202528', '郝亚雷', '2', '1997-01-26', '20', '2016', '1', '2', '15966800000', '0', '1#101');
INSERT INTO `student` VALUES ('133', '2016202533', '郑林伟', '1', '1997-09-18', '20', '2016', '1', '2', '15615500000', '0', '1#101');
INSERT INTO `student` VALUES ('134', '2016202562', '赵太霖', '1', '1997-11-25', '20', '2016', '1', '2', '13869700000', '0', '1#101');
INSERT INTO `student` VALUES ('135', '2016202572', '赵建超', '1', '1998-03-17', '20', '2016', '1', '2', '13905500000', '0', '1#101');
INSERT INTO `student` VALUES ('136', '2016202619', '王天杰', '1', '1998-06-22', '20', '2016', '1', '3', '15853300000', '0', '1#101');
INSERT INTO `student` VALUES ('137', '2016202636', '郭浩', '1', '1998-02-18', '20', '2016', '1', '3', '13954900000', '0', '1#101');
INSERT INTO `student` VALUES ('138', '2016202651', '刘福达', '1', '1998-06-13', '20', '2016', '1', '3', '13561600000', '0', '1#101');
INSERT INTO `student` VALUES ('139', '2016202659', '杨婉婷', '2', '1998-08-11', '20', '2016', '1', '3', '13583100000', '0', '1#101');
INSERT INTO `student` VALUES ('140', '2016202746', '李毅达', '1', '1997-11-04', '20', '2016', '11', '33', '13015700000', '0', '1#101');
INSERT INTO `student` VALUES ('141', '2016202809', '曾周均', '1', '1997-08-29', '20', '2016', '27', '123', '14708200000', '0', '1#101');
INSERT INTO `student` VALUES ('142', '2016202815', '谢伟思', '1', '1998-03-19', '20', '2016', '36', '163', '13866600000', '0', '1#101');
INSERT INTO `student` VALUES ('143', '2016202835', '李金坤', '1', '1998-02-03', '20', '2016', '36', '163', '13012900000', '0', '1#101');
INSERT INTO `student` VALUES ('144', '2016202860', '钟世武', '1', '1997-09-10', '20', '2016', '36', '163', '15169600000', '0', '1#101');
INSERT INTO `student` VALUES ('145', '2016202862', '王鑫', '1', '1998-01-01', '20', '2016', '36', '163', '13455700000', '0', '1#101');
INSERT INTO `student` VALUES ('146', '2016202866', '张逸飞', '1', '1998-03-23', '20', '2016', '36', '163', '18606400000', '0', '1#101');
INSERT INTO `student` VALUES ('147', '2016202878', '晋来俊', '1', '1997-08-10', '20', '2016', '36', '163', '13780800000', '0', '1#101');
INSERT INTO `student` VALUES ('148', '2016202880', '崔张龙', '1', '1998-06-25', '20', '2016', '36', '163', '15866600000', '0', '1#101');
INSERT INTO `student` VALUES ('149', '2016202990', '宿万栋', '1', '1998-05-14', '20', '2016', '2', '6', '13791900000', '0', '1#101');
INSERT INTO `student` VALUES ('150', '2016202992', '颜廷义', '1', '1997-12-30', '20', '2016', '2', '6', '13953800000', '0', '1#101');
INSERT INTO `student` VALUES ('151', '2016203047', '任涛', '1', '1998-01-13', '20', '2016', '2', '4', '13465300000', '0', '1#101');
INSERT INTO `student` VALUES ('152', '2016203055', '王鸿升', '1', '1998-11-06', '20', '2016', '2', '4', '15054500000', '0', '1#101');
INSERT INTO `student` VALUES ('153', '2016203107', '王慧', '2', '1997-07-04', '20', '2016', '2', '4', '13181600000', '0', '1#101');
INSERT INTO `student` VALUES ('154', '2016203141', '孙亚丽', '2', '1998-08-19', '20', '2016', '27', '121', '18325800000', '0', '1#101');
INSERT INTO `student` VALUES ('155', '2016203185', '宋翱宇', '1', '1997-05-28', '20', '2016', '27', '121', '18853000000', '0', '1#101');
INSERT INTO `student` VALUES ('156', '2016203201', '唐本轩', '1', '1998-04-09', '20', '2016', '2', '7', '15589600000', '0', '1#101');
INSERT INTO `student` VALUES ('157', '2016203311', '解继壮', '1', '1998-04-07', '22', '2016', '36', '162', '13645500000', '0', '1#101');
INSERT INTO `student` VALUES ('158', '2016203370', '曹先魁', '1', '1998-10-07', '20', '2016', '36', '165', '15020200000', '0', '1#101');
INSERT INTO `student` VALUES ('159', '2016203399', '刘蒙慧', '2', '1997-03-28', '20', '2016', '12', '38', '15564500000', '0', '1#101');
INSERT INTO `student` VALUES ('160', '2016203452', '赵灏', '2', '1999-01-28', '46', '2016', '12', '38', '15730800000', '0', '1#101');
INSERT INTO `student` VALUES ('161', '2016203457', '王欣茹', '2', '1998-05-25', '20', '2016', '22', '18', '15094700000', '0', '1#101');
INSERT INTO `student` VALUES ('162', '2016203542', '张虎运', '1', '1998-05-09', '20', '2016', '12', '37', '13606500000', '0', '1#101');
INSERT INTO `student` VALUES ('163', '2016203566', '周翼', '2', '1998-09-20', '20', '2016', '12', '37', '15172600000', '0', '1#101');
INSERT INTO `student` VALUES ('164', '2016203574', '张斌', '1', '1998-05-25', '20', '2016', '12', '36', '13290300000', '0', '1#101');
INSERT INTO `student` VALUES ('165', '2016203582', '孙永健', '1', '1998-03-02', '20', '2016', '12', '36', '13475600000', '0', '1#101');
INSERT INTO `student` VALUES ('166', '2016203585', '邱树浩', '1', '1996-12-17', '20', '2016', '12', '36', '13954700000', '0', '1#101');
INSERT INTO `student` VALUES ('167', '2016203590', '李沛霖', '1', '1997-04-29', '20', '2016', '12', '36', '18954600000', '0', '1#101');
INSERT INTO `student` VALUES ('168', '2016203637', '冯吉生', '1', '1998-06-18', '20', '2016', '12', '35', '15254800000', '0', '1#101');
INSERT INTO `student` VALUES ('169', '2016203645', '周林雪莹', '2', '1997-11-27', '20', '2016', '22', '97', '15584200000', '0', '1#101');
INSERT INTO `student` VALUES ('170', '2016203681', '朱英豪', '1', '1997-10-29', '20', '2016', '22', '97', '13969600000', '0', '1#101');
INSERT INTO `student` VALUES ('171', '2016203691', '魏铭', '1', '1998-02-06', '20', '2016', '22', '97', '15736100000', '0', '1#101');
INSERT INTO `student` VALUES ('172', '2016203696', '周杨', '1', '1998-06-09', '20', '2016', '22', '97', '13199700000', '0', '1#101');
INSERT INTO `student` VALUES ('173', '2016203703', '张璨', '2', '1998-03-06', '20', '2016', '22', '90', '15846900000', '0', '1#101');
INSERT INTO `student` VALUES ('174', '2016203724', '姜官辉', '1', '1997-11-09', '20', '2016', '22', '90', '13465700000', '0', '1#101');
INSERT INTO `student` VALUES ('175', '2016203757', '白永昌', '1', '1998-10-11', '20', '2016', '22', '90', '15963000000', '0', '1#101');
INSERT INTO `student` VALUES ('176', '2016203771', '郝明慧', '2', '1997-10-06', '20', '2016', '9', '24', '13075300000', '0', '1#101');
INSERT INTO `student` VALUES ('177', '2016203780', '孙津滋', '2', '1997-10-30', '20', '2016', '9', '24', '13853300000', '0', '1#101');
INSERT INTO `student` VALUES ('178', '2016203826', '贾新宇', '2', '1997-09-23', '20', '2016', '9', '24', '13589900000', '0', '1#101');
INSERT INTO `student` VALUES ('179', '2016203895', '郭峰宁', '1', '1998-04-23', '20', '2016', '4', '11', '18678100000', '0', '1#101');
INSERT INTO `student` VALUES ('180', '2016203980', '牟小菊', '2', '1998-01-01', '20', '2016', '4', '11', '13132400000', '0', '1#101');
INSERT INTO `student` VALUES ('181', '2016204016', '徐希朋', '1', '1998-05-31', '20', '2016', '4', '16', '15053900000', '0', '1#101');
INSERT INTO `student` VALUES ('182', '2016204026', '李敏', '2', '1997-10-28', '20', '2016', '4', '16', '13221000000', '0', '1#101');
INSERT INTO `student` VALUES ('183', '2016204036', '张静', '2', '1997-01-03', '20', '2016', '4', '16', '18999000000', '0', '1#101');
INSERT INTO `student` VALUES ('184', '2016204079', '王冉冉', '2', '1999-02-25', '20', '2016', '4', '12', '15265500000', '0', '1#101');
INSERT INTO `student` VALUES ('185', '2016204153', '张海燕', '2', '1998-01-01', '20', '2016', '10', '27', '15953300000', '0', '1#101');
INSERT INTO `student` VALUES ('186', '2016204219', '王梦露', '2', '1998-09-08', '20', '2016', '20', '80', '13899200000', '0', '1#101');
INSERT INTO `student` VALUES ('187', '2016204232', '杜奕璇', '2', '1998-10-07', '20', '2016', '29', '132', '13355300000', '0', '1#101');
INSERT INTO `student` VALUES ('188', '2016204252', '曲扬', '1', '1997-03-25', '20', '2016', '29', '132', '13515400000', '0', '1#101');
INSERT INTO `student` VALUES ('189', '2016204278', '陈成洁', '1', '1998-08-19', '20', '2016', '29', '132', '18300400000', '0', '1#101');
INSERT INTO `student` VALUES ('190', '2016204291', '刘一雯', '2', '1998-04-30', '20', '2016', '29', '132', '13574000000', '0', '1#101');
INSERT INTO `student` VALUES ('191', '2016204313', '徐若琪', '2', '1998-10-05', '20', '2016', '30', '135', '13953300000', '0', '1#101');
INSERT INTO `student` VALUES ('192', '2016204339', '刘立娜', '2', '1997-10-17', '20', '2016', '30', '135', '15963400000', '0', '1#101');
INSERT INTO `student` VALUES ('193', '2016204348', '张宁朔', '2', '1999-01-02', '20', '2016', '7', '20', '15944500000', '0', '1#101');
INSERT INTO `student` VALUES ('194', '2016204358', '张泽懿', '2', '1998-05-31', '20', '2016', '7', '20', '13605400000', '0', '1#101');
INSERT INTO `student` VALUES ('195', '2016204404', '李秀', '2', '1998-05-28', '20', '2016', '7', '20', '13561700000', '0', '1#101');
INSERT INTO `student` VALUES ('196', '2016204420', '曹百慧', '2', '1999-04-11', '20', '2016', '7', '20', '15863200000', '0', '1#101');
INSERT INTO `student` VALUES ('197', '2016204451', '邱业欣', '2', '1997-10-11', '20', '2016', '19', '68', '15854400000', '0', '1#101');
INSERT INTO `student` VALUES ('198', '2016204460', '侯子辉', '1', '1999-01-10', '20', '2016', '19', '68', '13280600000', '0', '1#101');
INSERT INTO `student` VALUES ('199', '2016204470', '王纪星', '1', '1998-09-22', '20', '2016', '19', '68', '15938800000', '0', '1#101');
INSERT INTO `student` VALUES ('200', '2016204494', '纪璇', '2', '1998-06-29', '20', '2016', '19', '74', '13573900000', '0', '1#101');
INSERT INTO `student` VALUES ('201', '2016204530', '许晓静', '2', '1998-02-22', '20', '2016', '19', '74', '15588900000', '0', '1#101');
INSERT INTO `student` VALUES ('202', '2016204562', '余林徽', '1', '1997-09-27', '20', '2016', '19', '74', '13540400000', '0', '1#101');
INSERT INTO `student` VALUES ('203', '2016204586', '张泽港', '1', '1998-07-02', '20', '2016', '19', '77', '13685300000', '0', '1#101');
INSERT INTO `student` VALUES ('204', '2016204590', '李俊杰', '2', '1997-12-30', '20', '2016', '19', '77', '18254600000', '0', '1#101');
INSERT INTO `student` VALUES ('205', '2016204593', '衣凌莉', '2', '1997-11-10', '20', '2016', '19', '77', '13181500000', '0', '1#101');
INSERT INTO `student` VALUES ('206', '2016204606', '姜蓉', '2', '1998-03-04', '20', '2016', '19', '77', '13754600000', '0', '1#101');
INSERT INTO `student` VALUES ('207', '2016204635', '范冬玉', '2', '1997-12-05', '20', '2016', '19', '67', '15105400000', '0', '1#101');
INSERT INTO `student` VALUES ('208', '2016204642', '高悦', '2', '1997-10-20', '20', '2016', '19', '67', '13626500000', '0', '1#101');
INSERT INTO `student` VALUES ('209', '2016204734', '刘文卓', '1', '1998-10-15', '20', '2016', '19', '75', '13573300000', '0', '1#101');
INSERT INTO `student` VALUES ('210', '2016204769', '李牧晓', '2', '1998-04-25', '20', '2016', '19', '75', '13563300000', '0', '1#101');
INSERT INTO `student` VALUES ('211', '2016204782', '杨蕾', '2', '1998-10-01', '20', '2016', '19', '75', '13455100000', '0', '1#101');
INSERT INTO `student` VALUES ('212', '2016204834', '宋瑾', '2', '1998-06-27', '20', '2016', '19', '72', '13869800000', '0', '1#101');
INSERT INTO `student` VALUES ('213', '2016204844', '宋春雨', '2', '1998-02-24', '20', '2016', '19', '72', '13605300000', '0', '1#101');
INSERT INTO `student` VALUES ('214', '2016204919', '陈雪', '2', '1997-12-01', '20', '2016', '19', '69', '13256400000', '0', '1#101');
INSERT INTO `student` VALUES ('215', '2016204943', '刘春利', '2', '1998-02-07', '20', '2016', '19', '69', '15154300000', '0', '1#101');
INSERT INTO `student` VALUES ('216', '2016204969', '曲正程', '1', '1998-08-31', '20', '2016', '19', '73', '13406300000', '0', '1#101');
INSERT INTO `student` VALUES ('217', '2016204978', '题恒', '1', '1999-01-29', '20', '2016', '19', '73', '13184200000', '0', '1#101');
INSERT INTO `student` VALUES ('218', '2016205032', '田玮珂', '2', '1997-08-12', '20', '2016', '15', '51', '13694800000', '0', '1#101');
INSERT INTO `student` VALUES ('219', '2016205035', '温千莹', '2', '1998-03-30', '20', '2016', '15', '51', '15904300000', '0', '1#101');
INSERT INTO `student` VALUES ('220', '2016205083', '王立丽', '2', '1997-10-28', '20', '2016', '15', '51', '13220600000', '0', '1#101');
INSERT INTO `student` VALUES ('221', '2016205100', '郑佳佳', '2', '1999-09-04', '20', '2016', '15', '51', '13974200000', '0', '1#101');
INSERT INTO `student` VALUES ('222', '2016205109', '程晓丽', '2', '1997-06-10', '20', '2016', '15', '50', '13092600000', '0', '1#101');
INSERT INTO `student` VALUES ('223', '2016205145', '田园园', '2', '1998-01-25', '20', '2016', '15', '50', '15066400000', '0', '1#101');
INSERT INTO `student` VALUES ('224', '2016205154', '关子涵', '2', '1998-02-09', '20', '2016', '15', '50', '18289400000', '0', '1#101');
INSERT INTO `student` VALUES ('225', '2016205189', '姜玮', '1', '1995-02-15', '20', '2016', '31', '144', '13562200000', '0', '1#101');
INSERT INTO `student` VALUES ('226', '2016205292', '孙宁', '1', '1997-12-27', '20', '2016', '28', '128', '13506300000', '0', '1#101');
INSERT INTO `student` VALUES ('227', '2016205312', '赵冬梅', '2', '1998-01-23', '20', '2016', '17', '59', '18264200000', '0', '1#101');
INSERT INTO `student` VALUES ('228', '2016205313', '张释元', '2', '1998-05-06', '20', '2016', '17', '58', '13563200000', '0', '1#101');
INSERT INTO `student` VALUES ('229', '2016205325', '胡淑凡', '2', '1998-09-10', '20', '2016', '17', '58', '13626300000', '0', '1#101');
INSERT INTO `student` VALUES ('230', '2016205366', '孟金颖', '2', '1998-07-07', '20', '2016', '17', '57', '13001500000', '0', '1#101');
INSERT INTO `student` VALUES ('231', '2016205378', '王国旭', '1', '1996-09-27', '20', '2016', '17', '57', '13854500000', '0', '1#101');
INSERT INTO `student` VALUES ('232', '2016205402', '王冉冉', '2', '1998-10-01', '20', '2016', '17', '57', '13245400000', '0', '1#101');
INSERT INTO `student` VALUES ('233', '2016205420', '陈青峰', '2', '1998-03-27', '20', '2016', '17', '60', '15092100000', '0', '1#101');
INSERT INTO `student` VALUES ('234', '2016205424', '于洪程', '1', '1998-08-30', '20', '2016', '17', '60', '15589900000', '0', '1#101');
INSERT INTO `student` VALUES ('235', '2016205479', '苗庆云', '1', '1997-07-10', '20', '2016', '17', '60', '15054100000', '0', '1#101');
INSERT INTO `student` VALUES ('236', '2016205530', '颜飞', '1', '1997-11-18', '20', '2016', '4', '10', '13734500000', '0', '1#101');
INSERT INTO `student` VALUES ('237', '2016205561', '郑雨丛', '2', '1998-03-11', '20', '2016', '13', '47', '13923400000', '0', '1#101');
INSERT INTO `student` VALUES ('238', '2016205595', '王静姝', '2', '1998-03-17', '20', '2016', '13', '40', '18766300000', '0', '1#101');
INSERT INTO `student` VALUES ('239', '2016205614', '夏雨', '1', '1997-10-20', '20', '2016', '13', '40', '13561600000', '0', '1#101');
INSERT INTO `student` VALUES ('240', '2016205669', '魏童正', '1', '1997-12-03', '20', '2016', '13', '40', '13515400000', '0', '1#101');
INSERT INTO `student` VALUES ('241', '2016205739', '刘春毅', '1', '1998-03-26', '20', '2016', '3', '8', '18840600000', '0', '1#101');
INSERT INTO `student` VALUES ('242', '2016205769', '汪青青', '2', '1998-07-30', '20', '2016', '3', '8', '13993900000', '0', '1#101');
INSERT INTO `student` VALUES ('243', '2016205806', '石雯雯', '2', '1996-09-12', '20', '2016', '16', '56', '15853200000', '0', '1#101');
INSERT INTO `student` VALUES ('244', '2016205820', '陈璐', '2', '1998-03-09', '20', '2016', '21', '88', '15092200000', '0', '1#101');
INSERT INTO `student` VALUES ('245', '2016205837', '江杰辉', '1', '1998-03-19', '20', '2016', '21', '88', '13678900000', '0', '1#101');
INSERT INTO `student` VALUES ('246', '2016205880', '武晨晨', '2', '1997-09-11', '20', '2016', '21', '83', '13573300000', '0', '1#101');
INSERT INTO `student` VALUES ('247', '2016205884', '冷倩', '2', '1997-10-31', '20', '2016', '21', '83', '13678800000', '0', '1#101');
INSERT INTO `student` VALUES ('248', '2016205946', '姜柳', '2', '1997-12-22', '20', '2016', '26', '115', '15066800000', '0', '1#101');
INSERT INTO `student` VALUES ('249', '2016205953', '刘晓', '2', '1998-02-11', '20', '2016', '26', '115', '15192000000', '0', '1#101');
INSERT INTO `student` VALUES ('250', '2016205958', '张鸿燕', '2', '1998-02-01', '20', '2016', '26', '115', '15864300000', '0', '1#101');
INSERT INTO `student` VALUES ('251', '2016206041', '罗畅', '2', '1997-12-18', '20', '2016', '25', '111', '18742000000', '0', '1#101');
INSERT INTO `student` VALUES ('252', '2016206055', '王海艺', '2', '1998-10-28', '20', '2016', '25', '110', '15905300000', '0', '1#101');
INSERT INTO `student` VALUES ('253', '2016206072', '刘文艺', '2', '1998-07-03', '20', '2016', '25', '107', '13954200000', '0', '1#101');
INSERT INTO `student` VALUES ('254', '2016206076', '付一诺', '2', '1998-08-17', '20', '2016', '25', '107', '15953200000', '0', '1#101');
INSERT INTO `student` VALUES ('255', '2016206084', '孙悦嘉', '2', '1999-05-04', '20', '2016', '25', '110', '15954200000', '0', '1#101');
INSERT INTO `student` VALUES ('256', '2016206106', '高泽兴', '2', '1998-10-08', '20', '2016', '25', '108', '15963300000', '0', '1#101');
INSERT INTO `student` VALUES ('257', '2016206113', '李钊颖', '2', '1998-02-20', '20', '2016', '25', '107', '13583400000', '0', '1#101');
INSERT INTO `student` VALUES ('258', '2016206184', '陈晓旭', '2', '1998-03-21', '20', '2016', '25', '110', '13589200000', '0', '1#101');
INSERT INTO `student` VALUES ('259', '2016206195', '张琳', '2', '1997-07-08', '20', '2016', '25', '107', '13906500000', '0', '1#101');
INSERT INTO `student` VALUES ('260', '2016206200', '穆怡凡', '1', '1998-12-16', '20', '2016', '25', '107', '18754400000', '0', '1#101');
INSERT INTO `student` VALUES ('261', '2016206206', '殷雪', '2', '1997-12-28', '20', '2016', '25', '110', '15864600000', '0', '1#101');
INSERT INTO `student` VALUES ('262', '2016206230', '那明煜', '2', '1997-08-26', '31', '2016', '25', '110', '13953800000', '0', '1#101');
INSERT INTO `student` VALUES ('263', '2016206271', '闫成成', '2', '1998-11-03', '20', '2016', '25', '110', '13561200000', '0', '1#101');
INSERT INTO `student` VALUES ('264', '2016206322', '闫文甜', '2', '1997-01-26', '20', '2016', '33', '153', '15153300000', '0', '1#101');
INSERT INTO `student` VALUES ('265', '2016206340', '赵世鹏', '1', '1998-11-16', '20', '2016', '23', '99', '13603400000', '0', '1#101');
INSERT INTO `student` VALUES ('266', '2016206398', '庄婕妤', '2', '1998-03-03', '20', '2016', '23', '100', '18754200000', '0', '1#101');
INSERT INTO `student` VALUES ('267', '2016206405', '吴庭', '1', '1997-07-18', '20', '2016', '23', '99', '13595900000', '0', '1#101');
INSERT INTO `student` VALUES ('268', '2016206427', '庞祺雨', '2', '1998-07-07', '20', '2016', '23', '98', '18893100000', '0', '1#101');
INSERT INTO `student` VALUES ('269', '2016206448', '孙恺玥', '2', '1998-05-24', '20', '2016', '27', '122', '18663900000', '0', '1#101');
INSERT INTO `student` VALUES ('270', '2016206582', '刘萌', '2', '1998-02-10', '20', '2016', '21', '82', '13371500000', '0', '1#101');
INSERT INTO `student` VALUES ('271', '2016206586', '孙庆', '2', '1997-08-22', '20', '2016', '21', '82', '13969700000', '0', '1#101');
INSERT INTO `student` VALUES ('272', '2016206650', '鲍元帅', '1', '1997-09-10', '20', '2016', '32', '145', '15315900000', '0', '1#101');
INSERT INTO `student` VALUES ('273', '2016206671', '李玉', '1', '1996-03-15', '20', '2016', '11', '29', '15685800000', '0', '1#101');
INSERT INTO `student` VALUES ('274', '2016206679', '郭宇', '2', '1998-09-05', '20', '2016', '11', '29', '9138770000', '0', '1#101');
INSERT INTO `student` VALUES ('275', '2016206815', '邵明轩', '1', '1997-12-08', '20', '2016', '36', '163', '13919400000', '0', '1#101');
INSERT INTO `student` VALUES ('276', '2016206824', '石浩然', '2', '1998-08-23', '20', '2016', '22', '95', '13589100000', '0', '1#101');
INSERT INTO `student` VALUES ('277', '2016206845', '李雨盈', '2', '1998-12-13', '20', '2016', '22', '95', '13863200000', '0', '1#101');
INSERT INTO `student` VALUES ('278', '2016206868', '邱淳彬', '1', '1997-06-16', '20', '2016', '22', '95', '18663700000', '0', '1#101');
INSERT INTO `student` VALUES ('279', '2016206919', '闵永辉', '1', '1998-10-09', '20', '2016', '2', '6', '18209400000', '0', '1#101');
INSERT INTO `student` VALUES ('280', '2016206920', '戴国豪', '1', '1998-03-08', '20', '2016', '2', '4', '18898700000', '0', '1#101');
INSERT INTO `student` VALUES ('281', '2016206942', '许桓源', '1', '1997-08-22', '20', '2016', '27', '121', '18200800000', '0', '1#101');
INSERT INTO `student` VALUES ('282', '2016206963', '唐清岭', '2', '1998-04-15', '35', '2016', '2', '7', '13518500000', '0', '1#101');
INSERT INTO `student` VALUES ('283', '2016206971', '张涛', '1', '1998-08-26', '20', '2016', '36', '162', '13835200000', '0', '1#101');
INSERT INTO `student` VALUES ('284', '2016207009', '高学壮', '1', '1997-02-18', '20', '2016', '22', '18', '13932000000', '0', '1#101');
INSERT INTO `student` VALUES ('285', '2016207042', '冯石', '1', '1997-02-05', '20', '2016', '22', '93', '13256200000', '0', '1#101');
INSERT INTO `student` VALUES ('286', '2016207109', '蔺诗文', '1', '1997-10-12', '20', '2016', '22', '93', '13964400000', '0', '1#101');
INSERT INTO `student` VALUES ('287', '2016207140', '张淙琳', '2', '1998-09-26', '20', '2016', '22', '93', '13963800000', '0', '1#101');
INSERT INTO `student` VALUES ('288', '2016207148', '李华岩', '1', '1998-04-24', '20', '2016', '22', '93', '13356800000', '0', '1#101');
INSERT INTO `student` VALUES ('289', '2016207165', '李晓璇', '2', '1997-12-29', '20', '2016', '22', '93', '18660700000', '0', '1#101');
INSERT INTO `student` VALUES ('290', '2016207186', '翟云飞', '1', '1997-02-03', '20', '2016', '22', '93', '13235400000', '0', '1#101');
INSERT INTO `student` VALUES ('291', '2016207205', '邱兴越', '1', '1997-06-27', '20', '2016', '22', '93', '18263800000', '0', '1#101');
INSERT INTO `student` VALUES ('292', '2016207241', '李小源', '2', '1996-11-17', '20', '2016', '22', '93', '13953900000', '0', '1#101');
INSERT INTO `student` VALUES ('293', '2016207324', '房好顺', '1', '1997-10-10', '20', '2016', '22', '93', '15065100000', '0', '1#101');
INSERT INTO `student` VALUES ('294', '2016207363', '刘佳龙', '1', '2000-02-12', '20', '2016', '12', '35', '15840200000', '0', '1#101');
INSERT INTO `student` VALUES ('295', '2016207396', '李稷', '1', '1997-09-13', '20', '2016', '22', '90', '15368100000', '0', '1#101');
INSERT INTO `student` VALUES ('296', '2016207487', '孙喜娥', '2', '1996-02-28', '20', '2016', '4', '11', '15209400000', '0', '1#101');
INSERT INTO `student` VALUES ('297', '2016207499', '武艳丽', '2', '1998-01-17', '20', '2016', '32', '146', '18564000000', '0', '1#101');
INSERT INTO `student` VALUES ('298', '2016207558', '曹焕焰', '1', '1997-10-26', '35', '2016', '10', '26', '15186900000', '0', '1#101');
INSERT INTO `student` VALUES ('299', '2016207704', '牛丽娜', '2', '1998-11-28', '20', '2016', '19', '77', '13519000000', '0', '1#101');
INSERT INTO `student` VALUES ('300', '2016207811', '栾颖仪', '2', '1998-09-22', '20', '2016', '19', '76', '13705300000', '0', '1#101');
INSERT INTO `student` VALUES ('301', '2016207821', '吴嘉诚', '2', '1998-01-08', '20', '2016', '19', '70', '18563900000', '0', '1#101');
INSERT INTO `student` VALUES ('302', '2016207824', '宋风云', '2', '1997-10-19', '20', '2016', '19', '65', '15969800000', '0', '1#101');
INSERT INTO `student` VALUES ('303', '2016207849', '栾奕', '2', '1997-09-14', '20', '2016', '19', '65', '13605300000', '0', '1#101');
INSERT INTO `student` VALUES ('304', '2016207864', '蒋崃', '2', '1998-12-25', '20', '2016', '19', '70', '13606300000', '0', '1#101');
INSERT INTO `student` VALUES ('305', '2016207916', '王洁', '2', '1997-12-27', '20', '2016', '19', '65', '13706300000', '0', '1#101');
INSERT INTO `student` VALUES ('306', '2016207965', '潘婧', '2', '1998-04-22', '20', '2016', '19', '76', '13706300000', '0', '1#101');
INSERT INTO `student` VALUES ('307', '2016207967', '周悦', '2', '1998-10-25', '20', '2016', '19', '70', '13506300000', '0', '1#101');
INSERT INTO `student` VALUES ('308', '2016207980', '张馨跃', '2', '1998-08-09', '20', '2016', '19', '65', '13516300000', '0', '1#101');
INSERT INTO `student` VALUES ('309', '2016208003', '薛松莹', '2', '1998-12-20', '20', '2016', '19', '65', '13791500000', '0', '1#101');
INSERT INTO `student` VALUES ('310', '2016208010', '许馨文', '2', '1998-09-16', '20', '2016', '19', '70', '13954400000', '0', '1#101');
INSERT INTO `student` VALUES ('311', '2016208012', '吴晓帆', '2', '1998-06-23', '20', '2016', '19', '65', '13970000000', '0', '1#101');
INSERT INTO `student` VALUES ('312', '2016208019', '徐英博', '1', '1998-08-27', '20', '2016', '19', '65', '13605300000', '0', '1#101');
INSERT INTO `student` VALUES ('313', '2016208028', '姚晋', '1', '1998-02-17', '20', '2016', '19', '70', '18754300000', '0', '1#101');
INSERT INTO `student` VALUES ('314', '2016208044', '张懿文', '2', '1998-01-20', '20', '2016', '34', '160', '13994600000', '0', '1#101');
INSERT INTO `student` VALUES ('315', '2016208095', '李婧', '2', '1997-10-02', '20', '2016', '19', '71', '18669800000', '0', '1#101');
INSERT INTO `student` VALUES ('316', '2016208099', '杨琳', '2', '1998-07-14', '20', '2016', '19', '71', '13589400000', '0', '1#101');
INSERT INTO `student` VALUES ('317', '2016208121', '石昊昆', '1', '1998-03-19', '20', '2016', '19', '71', '13695400000', '0', '1#101');
INSERT INTO `student` VALUES ('318', '2016208126', '杨皓清', '1', '1997-04-12', '20', '2016', '19', '71', '15853700000', '0', '1#101');
INSERT INTO `student` VALUES ('319', '2016208153', '张成豪', '1', '1998-08-09', '20', '2016', '19', '71', '13646300000', '0', '1#101');
INSERT INTO `student` VALUES ('320', '2016208254', '韩仕煜', '2', '1998-11-26', '6', '2016', '31', '144', '13796600000', '0', '1#101');
INSERT INTO `student` VALUES ('321', '2016208259', '衣然', '2', '1997-12-04', '20', '2016', '31', '144', '13846400000', '0', '1#101');
INSERT INTO `student` VALUES ('322', '2016208303', '张章', '2', '1998-07-11', '20', '2016', '17', '57', '13965200000', '0', '1#101');
INSERT INTO `student` VALUES ('323', '2016208346', '江文', '1', '1998-01-29', '20', '2016', '4', '10', '13195300000', '0', '1#101');
INSERT INTO `student` VALUES ('324', '2016210039', '陈昊一', '2', '1998-02-28', '20', '2016', '30', '138', '13791800000', '0', '1#101');
INSERT INTO `student` VALUES ('325', '2016210066', '徐冲', '1', '1998-01-11', '20', '2016', '30', '136', '13953200000', '0', '1#101');
INSERT INTO `student` VALUES ('326', '2016210079', '刘颂', '1', '1998-03-07', '20', '2016', '30', '136', '13906400000', '0', '1#101');
INSERT INTO `student` VALUES ('327', '2016210154', '徐飞', '1', '1998-05-10', '20', '2016', '30', '138', '13869600000', '0', '1#101');
INSERT INTO `student` VALUES ('328', '2016210208', '马瑞光', '2', '1997-10-23', '22', '2016', '30', '136', '18263800000', '0', '1#101');
INSERT INTO `student` VALUES ('329', '2016210227', '王佳林', '1', '1998-09-19', '20', '2016', '30', '136', '13863200000', '0', '1#101');
INSERT INTO `student` VALUES ('330', '2016210309', '常天怡', '2', '1998-05-28', '20', '2016', '30', '140', '15966300000', '0', '1#101');
INSERT INTO `student` VALUES ('331', '2016210336', '杨一帆', '2', '1998-09-26', '20', '2016', '30', '133', '13953200000', '0', '1#101');
INSERT INTO `student` VALUES ('332', '2016210349', '王雪松', '1', '1997-10-17', '20', '2016', '30', '133', '13964800000', '0', '1#101');
INSERT INTO `student` VALUES ('333', '2016210372', '王博', '2', '1998-02-11', '20', '2016', '30', '133', '15806800000', '0', '1#101');
INSERT INTO `student` VALUES ('334', '2016210377', '焦孟章', '1', '1998-02-22', '20', '2016', '30', '133', '15666900000', '0', '1#101');
INSERT INTO `student` VALUES ('335', '2016210476', '周嘉伟', '1', '1998-07-16', '20', '2016', '30', '136', '13166700000', '0', '1#101');
INSERT INTO `student` VALUES ('336', '2016230065', '刘蕴博', '1', '1997-12-05', '20', '2016', '30', '137', '15853600000', '0', '1#101');
INSERT INTO `student` VALUES ('337', '2016230077', '张明君', '1', '1996-12-18', '20', '2016', '30', '137', '18264600000', '0', '1#101');
INSERT INTO `student` VALUES ('338', '2016230087', '苏燊', '2', '2000-01-16', '20', '2016', '30', '137', '13853800000', '0', '1#101');
INSERT INTO `student` VALUES ('339', '2016230088', '陈东旭', '1', '1997-11-28', '20', '2016', '30', '137', '13561800000', '0', '1#101');
INSERT INTO `student` VALUES ('340', '2016230099', '王一人', '2', '1998-07-04', '20', '2016', '30', '137', '13465100000', '0', '1#101');
INSERT INTO `student` VALUES ('341', '2016230126', '王啸宇', '1', '1998-04-08', '20', '2016', '30', '137', '13791400000', '0', '1#101');
INSERT INTO `student` VALUES ('342', '2016240001', '司晓宇', '2', '1995-03-18', '57', '2016', '32', '148', '15064000000', '0', '1#101');
INSERT INTO `student` VALUES ('343', '2016240013', '房学鑫', '1', '1994-07-16', '57', '2016', '32', '148', '18366200000', '0', '1#101');
INSERT INTO `student` VALUES ('344', '2016240058', '安仁杰', '1', '1995-12-24', '57', '2016', '32', '148', '18366300000', '0', '1#101');
INSERT INTO `student` VALUES ('345', '2016240061', '张旭', '1', '1993-03-13', '57', '2016', '32', '148', '18366300000', '0', '1#101');
INSERT INTO `student` VALUES ('346', '2016240080', '韩超', '1', '1994-11-08', '57', '2016', '32', '148', '18353200000', '0', '1#101');
INSERT INTO `student` VALUES ('347', '2016400316', '郑萌萌', '2', '1997-10-23', '57', '2016', '27', '122', '18959500000', '0', '1#101');
INSERT INTO `student` VALUES ('348', '2016500002', 'LEE YEYEONG', '2', '1996-04-19', '57', '2016', '14', '49', '15698500000', '0', '1#101');
INSERT INTO `student` VALUES ('349', '201440403029', '李林真', '1', null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('351', '2016204873', '王美娟', '2', '1998-11-29', '20', '2016', '19', '72', '17865322750', '2296407102', '青大东校区西院4#309');
INSERT INTO `student` VALUES ('352', '2016207720', '杜雨欣', '2', '1998-04-02', '20', '2016', '19', '75', '17853241637', '1065759268', '6号楼355');
INSERT INTO `student` VALUES ('353', '2016202840', '孙其昊', '1', '1998-04-09', '20', '2016', '36', '163', null, null, null);
INSERT INTO `student` VALUES ('354', '2016203368', '马振磊', '1', '1998-08-11', '20', '2016', '36', '165', null, null, null);
INSERT INTO `student` VALUES ('355', '2016202801', '许艳琳', '2', '1998-10-24', '20', '2016', '27', '123', '17853261132', '1091952662', '泓园5号楼');
INSERT INTO `student` VALUES ('356', '2016200860', '韩欣欣', '2', '1997-09-20', '20', '2016', '26', '118', null, null, null);
INSERT INTO `student` VALUES ('357', '2016202980', '蔡玉晓', '1', '1998-05-20', '20', '2016', '2', '6', '17853269625', '1156286536', '泓园六号楼');
INSERT INTO `student` VALUES ('358', '2016203276', '纪文珠', '2', '1997-12-07', '20', '2016', '36', '165', '18954557836', '861395366', '中心校区西院汇四');
INSERT INTO `student` VALUES ('359', '2016205005', '邹雅萌', '2', '1998-10-10', '20', '2016', '19', '66', null, null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOGNAME` varchar(20) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(25) NOT NULL DEFAULT '123456' COMMENT '登录密码',
  `NAME` varchar(50) NOT NULL COMMENT '姓名/部门名称/管理组成员名',
  `PIC` varchar(50) NOT NULL,
  `EXIST_PIC` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '用户是否已上传头像',
  `TYPE` varchar(5) NOT NULL COMMENT '用户类别（1：学生，2：部门，3：管理员）',
  PRIMARY KEY (`ID`),
  KEY `LOGNAME` (`LOGNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '管理员', 'admin.jpg', '1', '3');
INSERT INTO `user` VALUES ('4', '201540403001', '123456', '张金鹏', '201540403001.jpg', '1', '1');
INSERT INTO `user` VALUES ('5', '201540403002', '123456', '毕思芳', '201540403002.jpg', '1', '1');
INSERT INTO `user` VALUES ('6', '201540403003', '123456789', '史本康', '201540403003.jpg', '1', '1');
INSERT INTO `user` VALUES ('7', '201540403004', '654321', '张艺馨', '201540403004.jpg', '1', '1');
INSERT INTO `user` VALUES ('8', '201540403005', '123456', '石诚', '201540403005.jpg', '1', '1');
INSERT INTO `user` VALUES ('9', '201540403006', '654321', '孙嘉', '201540403006.jpg', '1', '1');
INSERT INTO `user` VALUES ('10', '201540403007', '123456', '王加豪', '201540403007.jpg', '1', '1');
INSERT INTO `user` VALUES ('11', '201540403008', '123456', '刘长顺', '201540403008.jpg', '1', '1');
INSERT INTO `user` VALUES ('12', '201540403009', '123456', '栾雨萱', '201540403009.jpg', '1', '1');
INSERT INTO `user` VALUES ('13', '201540403010', '123456', '王艳', '201540403010.jpg', '1', '1');
INSERT INTO `user` VALUES ('14', '201540403011', '123456', '王佳宁', '201540403011.jpg', '1', '1');
INSERT INTO `user` VALUES ('15', '201540403012', '123456', '袁源', '201540403012.jpg', '1', '1');
INSERT INTO `user` VALUES ('16', '201540403013', '123456', '吴浩', '201540403013.jpg', '1', '1');
INSERT INTO `user` VALUES ('17', '201540403014', '123456', '程培越', '201540403014.jpg', '1', '1');
INSERT INTO `user` VALUES ('18', '201540403015', '123456', '王英州', '201540403015.jpg', '1', '1');
INSERT INTO `user` VALUES ('19', '201540403016', '123456', '卢欢', '201540403016.jpg', '1', '1');
INSERT INTO `user` VALUES ('20', '201540403017', '123456', '金璐', '201540403017.jpg', '1', '1');
INSERT INTO `user` VALUES ('21', '201540403018', '123456', '李安琪', '201540403018.jpg', '1', '1');
INSERT INTO `user` VALUES ('22', '201540403019', '123456', '王新雨', '201540403019.jpg', '1', '1');
INSERT INTO `user` VALUES ('23', '201540403020', 'llllll', '鲁逸宽', '201540403020.jpg', '1', '1');
INSERT INTO `user` VALUES ('24', '201540403021', '123456', '卢昱运', '201540403021.jpg', '1', '1');
INSERT INTO `user` VALUES ('25', '201540403022', '123456', '晋成琳', '201540403022.jpg', '1', '1');
INSERT INTO `user` VALUES ('26', '201540403023', '123456', '杨凌云', '201540403023.jpg', '1', '1');
INSERT INTO `user` VALUES ('27', '201540403024', '123456', '高焰', '201540403024.jpg', '1', '1');
INSERT INTO `user` VALUES ('28', '201540403025', '123456', '陈若愚', '201540403025.jpg', '1', '1');
INSERT INTO `user` VALUES ('29', '201540403026', '123456', '贾子薇', '201540403026.jpg', '1', '1');
INSERT INTO `user` VALUES ('30', '201540403027', '123456', '贾晓月', '201540403027.jpg', '1', '1');
INSERT INTO `user` VALUES ('31', '201540403028', '123456', '宋修伟', '201540403028.jpg', '1', '1');
INSERT INTO `user` VALUES ('32', '201540403029', '123456', '孙怡', '201540403029.jpg', '1', '1');
INSERT INTO `user` VALUES ('33', '201540403030', '123456', '康世伟', '201540403030.jpg', '1', '1');
INSERT INTO `user` VALUES ('34', '201540403031', '123456', '李万昇', '201540403031.jpg', '1', '1');
INSERT INTO `user` VALUES ('35', '201540403032', '123456', '倪珍妮', '201540403032.jpg', '1', '1');
INSERT INTO `user` VALUES ('36', '201540403033', '123456', '姚大海', '201540403033.jpg', '1', '1');
INSERT INTO `user` VALUES ('37', '201540403034', '123456', '王诗裕', '201540403034.jpg', '1', '1');
INSERT INTO `user` VALUES ('38', '201540403035', '123456', '李慧', '201540403035.jpg', '1', '1');
INSERT INTO `user` VALUES ('39', '201540403036', '123456', '闫永顺', '201540403036.jpg', '1', '1');
INSERT INTO `user` VALUES ('40', '201540403037', '123456', '朱怡美', '201540403037.jpg', '1', '1');
INSERT INTO `user` VALUES ('41', '201540403038', '123456', '郭志明', '201540403038.jpg', '1', '1');
INSERT INTO `user` VALUES ('42', '201540403040', '123456', '刘淑佳', '201540403040.jpg', '1', '1');
INSERT INTO `user` VALUES ('43', '201540403041', '123456', '邓运长', '201540403041.jpg', '1', '1');
INSERT INTO `user` VALUES ('44', '201540403042', '123456', '陶硕', '201540403042.jpg', '1', '1');
INSERT INTO `user` VALUES ('45', '201540403043', '123456', '胡桥', '201540403043.jpg', '1', '1');
INSERT INTO `user` VALUES ('46', '201540403044', '123456', '宋俊淼', '201540403044.jpg', '1', '1');
INSERT INTO `user` VALUES ('47', '201540403045', '123456', '付建国', '201540403045.jpg', '1', '1');
INSERT INTO `user` VALUES ('48', '201540403046', '123456', '梁淑娴', '201540403046.jpg', '1', '1');
INSERT INTO `user` VALUES ('49', '201540403047', '123456', '杨丽', '201540403047.jpg', '1', '1');
INSERT INTO `user` VALUES ('50', '201540403048', '123456', '冉立凡', '201540403048.jpg', '1', '1');
INSERT INTO `user` VALUES ('51', '201540403049', '123456', '张珊珊', '201540403049.jpg', '1', '1');
INSERT INTO `user` VALUES ('52', '2016200022', '123456', '刘宗涛', '2016200022.jpg', '1', '1');
INSERT INTO `user` VALUES ('53', '2016200026', '123456', '刘天城', '2016200026.jpg', '1', '1');
INSERT INTO `user` VALUES ('54', '2016200086', '123456', '王志浩', '2016200086.jpg', '1', '1');
INSERT INTO `user` VALUES ('55', '2016200087', '123456', '王晓晴', '2016200087.jpg', '1', '1');
INSERT INTO `user` VALUES ('56', '2016200126', '123456', '杨召远', '2016200126.jpg', '1', '1');
INSERT INTO `user` VALUES ('57', '2016200138', '123456', '沈雪', '2016200138.jpg', '1', '1');
INSERT INTO `user` VALUES ('58', '2016200149', '123456', '丁立洲', '2016200149.jpg', '1', '1');
INSERT INTO `user` VALUES ('59', '2016200160', '123456', '樊佳宁', '2016200160.jpg', '1', '1');
INSERT INTO `user` VALUES ('60', '2016200209', '123456', '姜静', '2016200209.jpg', '1', '1');
INSERT INTO `user` VALUES ('61', '2016200297', '123456', '耿金生', '2016200297.jpg', '1', '1');
INSERT INTO `user` VALUES ('62', '2016200313', '123456', '朱翔宇', '2016200313.jpg', '1', '1');
INSERT INTO `user` VALUES ('63', '2016200336', '123456', '穆坤', '2016200336.jpg', '1', '1');
INSERT INTO `user` VALUES ('64', '2016200367', '123456', '郝雨欣', '2016200367.jpg', '1', '1');
INSERT INTO `user` VALUES ('65', '2016200380', '123456', '李瑞霖', '2016200380.jpg', '1', '1');
INSERT INTO `user` VALUES ('66', '2016200391', '123456', '李文琪', '2016200391.jpg', '1', '1');
INSERT INTO `user` VALUES ('67', '2016200401', '123456', '魏猛', '2016200401.jpg', '1', '1');
INSERT INTO `user` VALUES ('68', '2016200426', '123456', '叶宝珠', '2016200426.jpg', '1', '1');
INSERT INTO `user` VALUES ('69', '2016200444', '123456', '孙同正', '2016200444.jpg', '1', '1');
INSERT INTO `user` VALUES ('70', '2016200464', '123456', '言幸', '2016200464.jpg', '1', '1');
INSERT INTO `user` VALUES ('71', '2016200476', '123456', '姜雨彤', '2016200476.jpg', '1', '1');
INSERT INTO `user` VALUES ('72', '2016200495', '123456', '刘佳佳', '2016200495.jpg', '1', '1');
INSERT INTO `user` VALUES ('73', '2016200522', '123456', '丛蕾', '2016200522.jpg', '1', '1');
INSERT INTO `user` VALUES ('74', '2016200638', '123456', '魏天琳', '2016200638.jpg', '1', '1');
INSERT INTO `user` VALUES ('75', '2016200707', '123456', '沈雅文', '2016200707.jpg', '1', '1');
INSERT INTO `user` VALUES ('76', '2016200730', '123456', '闫旭文', '2016200730.jpg', '1', '1');
INSERT INTO `user` VALUES ('77', '2016200785', '123456', '孙学朋', '2016200785.jpg', '1', '1');
INSERT INTO `user` VALUES ('78', '2016200796', '123456', '成宏阔', '2016200796.jpg', '1', '1');
INSERT INTO `user` VALUES ('79', '2016200884', '123456', '王慧洁', '2016200884.jpg', '1', '1');
INSERT INTO `user` VALUES ('80', '2016200910', '123456', '胡晓溪', '2016200910.jpg', '1', '1');
INSERT INTO `user` VALUES ('81', '2016200941', '123456', '李青霞', '2016200941.jpg', '1', '1');
INSERT INTO `user` VALUES ('82', '2016200947', '123456', '李爱娟', '2016200947.jpg', '1', '1');
INSERT INTO `user` VALUES ('83', '2016200963', '123456', '马璐璐', '2016200963.jpg', '1', '1');
INSERT INTO `user` VALUES ('84', '2016200969', '123456', '朱子越', '2016200969.jpg', '1', '1');
INSERT INTO `user` VALUES ('85', '2016201038', '123456', '孙占法', '2016201038.jpg', '1', '1');
INSERT INTO `user` VALUES ('86', '2016201088', '123456', '尹玉双', '2016201088.jpg', '1', '1');
INSERT INTO `user` VALUES ('87', '2016201093', '123456', '宋晓', '2016201093.jpg', '1', '1');
INSERT INTO `user` VALUES ('88', '2016201146', '123456', '王晓丹', '2016201146.jpg', '1', '1');
INSERT INTO `user` VALUES ('89', '2016201239', '123456', '赵莅佳', '2016201239.jpg', '1', '1');
INSERT INTO `user` VALUES ('90', '2016201240', '123456', '娄津珲', '2016201240.jpg', '1', '1');
INSERT INTO `user` VALUES ('91', '2016201300', '123456', '王梦娇', '2016201300.jpg', '1', '1');
INSERT INTO `user` VALUES ('92', '2016201302', '123456', '于峻', '2016201302.jpg', '1', '1');
INSERT INTO `user` VALUES ('93', '2016201334', '123456', '帅琦', '2016201334.jpg', '1', '1');
INSERT INTO `user` VALUES ('94', '2016201339', '123456', '刘菊', '2016201339.jpg', '1', '1');
INSERT INTO `user` VALUES ('95', '2016201390', '123456', '吴林缜', '2016201390.jpg', '1', '1');
INSERT INTO `user` VALUES ('96', '2016201392', '123456', '赵紫璇', '2016201392.jpg', '1', '1');
INSERT INTO `user` VALUES ('97', '2016201415', '123456', '贾晓敏', '2016201415.jpg', '1', '1');
INSERT INTO `user` VALUES ('98', '2016201448', '123456', '许峰', '2016201448.jpg', '1', '1');
INSERT INTO `user` VALUES ('99', '2016201475', '123456', '韩珊珊', '2016201475.jpg', '1', '1');
INSERT INTO `user` VALUES ('100', '2016201476', '123456', '李晓萱', '2016201476.jpg', '1', '1');
INSERT INTO `user` VALUES ('101', '2016201481', '123456', '廖文慧', '2016201481.jpg', '1', '1');
INSERT INTO `user` VALUES ('102', '2016201575', '123456', '马小斐', '2016201575.jpg', '1', '1');
INSERT INTO `user` VALUES ('103', '2016201609', '123456', '王志超', '2016201609.jpg', '1', '1');
INSERT INTO `user` VALUES ('104', '2016201610', '123456', '王纪敏', '2016201610.jpg', '1', '1');
INSERT INTO `user` VALUES ('105', '2016201673', '123456', '郭金一', '2016201673.jpg', '1', '1');
INSERT INTO `user` VALUES ('106', '2016201784', '123456', '张建波', '2016201784.jpg', '1', '1');
INSERT INTO `user` VALUES ('107', '2016201799', '123456', '陈祥云', '2016201799.jpg', '1', '1');
INSERT INTO `user` VALUES ('108', '2016201819', '123456', '潘思羽', '2016201819.jpg', '1', '1');
INSERT INTO `user` VALUES ('109', '2016201831', '123456', '胡晓晨', '2016201831.jpg', '1', '1');
INSERT INTO `user` VALUES ('110', '2016201907', '123456', '赵梦翰', '2016201907.jpg', '1', '1');
INSERT INTO `user` VALUES ('111', '2016201912', '123456', '刘坤媛', '2016201912.jpg', '1', '1');
INSERT INTO `user` VALUES ('112', '2016201974', '123456', '刘梅', '2016201974.jpg', '1', '1');
INSERT INTO `user` VALUES ('113', '2016201995', '123456', '王玥', '2016201995.jpg', '1', '1');
INSERT INTO `user` VALUES ('114', '2016202061', '123456', '王子琦', '2016202061.jpg', '1', '1');
INSERT INTO `user` VALUES ('115', '2016202105', '123456', '赵鑫宇', '2016202105.jpg', '1', '1');
INSERT INTO `user` VALUES ('116', '2016202138', '123456', '杨继华', '2016202138.jpg', '1', '1');
INSERT INTO `user` VALUES ('117', '2016202155', '123456', '赵天昊', '2016202155.jpg', '1', '1');
INSERT INTO `user` VALUES ('118', '2016202198', '123456', '杨亚龙', '2016202198.jpg', '1', '1');
INSERT INTO `user` VALUES ('119', '2016202202', '123456', '孔凡卓', '2016202202.jpg', '1', '1');
INSERT INTO `user` VALUES ('120', '2016202219', '123456', '张明', '2016202219.jpg', '1', '1');
INSERT INTO `user` VALUES ('121', '2016202231', '123456', '王瑞林', '2016202231.jpg', '1', '1');
INSERT INTO `user` VALUES ('122', '2016202242', '123456', '胡宗强', '2016202242.jpg', '1', '1');
INSERT INTO `user` VALUES ('123', '2016202243', '123456', '夏培杰', '2016202243.jpg', '1', '1');
INSERT INTO `user` VALUES ('124', '2016202267', '123456', '袁旭', '2016202267.jpg', '1', '1');
INSERT INTO `user` VALUES ('125', '2016202327', '123456', '宋鑫铜', '2016202327.jpg', '1', '1');
INSERT INTO `user` VALUES ('126', '2016202339', '123456', '程文宇', '2016202339.jpg', '1', '1');
INSERT INTO `user` VALUES ('127', '2016202342', '123456', '严巨彬', '2016202342.jpg', '1', '1');
INSERT INTO `user` VALUES ('128', '2016202368', '123456', '孙高寒', '2016202368.jpg', '1', '1');
INSERT INTO `user` VALUES ('129', '2016202379', '123456', '毕崇明', '2016202379.jpg', '1', '1');
INSERT INTO `user` VALUES ('130', '2016202383', '123456', '赵乐贤', '2016202383.jpg', '1', '1');
INSERT INTO `user` VALUES ('131', '2016202387', '123456', '董国祥', '2016202387.jpg', '1', '1');
INSERT INTO `user` VALUES ('132', '2016202495', '123456', '毕会杰', '2016202495.jpg', '1', '1');
INSERT INTO `user` VALUES ('133', '2016202502', '123456', '周晓泽', '2016202502.jpg', '1', '1');
INSERT INTO `user` VALUES ('134', '2016202526', '123456', '张犇', '2016202526.jpg', '1', '1');
INSERT INTO `user` VALUES ('135', '2016202528', '123456', '郝亚雷', '2016202528.jpg', '1', '1');
INSERT INTO `user` VALUES ('136', '2016202533', '123456', '郑林伟', '2016202533.jpg', '1', '1');
INSERT INTO `user` VALUES ('137', '2016202562', '123456', '赵太霖', '2016202562.jpg', '1', '1');
INSERT INTO `user` VALUES ('138', '2016202572', '123456', '赵建超', '2016202572.jpg', '1', '1');
INSERT INTO `user` VALUES ('139', '2016202619', '123456', '王天杰', '2016202619.jpg', '1', '1');
INSERT INTO `user` VALUES ('140', '2016202636', '123456', '郭浩', '2016202636.jpg', '1', '1');
INSERT INTO `user` VALUES ('141', '2016202651', '123456', '刘福达', '2016202651.jpg', '1', '1');
INSERT INTO `user` VALUES ('142', '2016202659', '123456', '杨婉婷', '2016202659.jpg', '1', '1');
INSERT INTO `user` VALUES ('143', '2016202746', '123456', '李毅达', '2016202746.jpg', '1', '1');
INSERT INTO `user` VALUES ('144', '2016202809', '123456', '曾周均', '2016202809.jpg', '1', '1');
INSERT INTO `user` VALUES ('145', '2016202815', '123456', '谢伟思', '2016202815.jpg', '1', '1');
INSERT INTO `user` VALUES ('146', '2016202835', '123456', '李金坤', '2016202835.jpg', '1', '1');
INSERT INTO `user` VALUES ('147', '2016202860', '123456', '钟世武', '2016202860.jpg', '1', '1');
INSERT INTO `user` VALUES ('148', '2016202862', '123456', '王鑫', '2016202862.jpg', '1', '1');
INSERT INTO `user` VALUES ('149', '2016202866', '123456', '张逸飞', '2016202866.jpg', '1', '1');
INSERT INTO `user` VALUES ('150', '2016202878', '123456', '晋来俊', '2016202878.jpg', '1', '1');
INSERT INTO `user` VALUES ('151', '2016202880', '123456', '崔张龙', '2016202880.jpg', '1', '1');
INSERT INTO `user` VALUES ('152', '2016202990', '123456', '宿万栋', '2016202990.jpg', '1', '1');
INSERT INTO `user` VALUES ('153', '2016202992', '123456', '颜廷义', '2016202992.jpg', '1', '1');
INSERT INTO `user` VALUES ('154', '2016203047', '123456', '任涛', '2016203047.jpg', '1', '1');
INSERT INTO `user` VALUES ('155', '2016203055', '123456', '王鸿升', '2016203055.jpg', '1', '1');
INSERT INTO `user` VALUES ('156', '2016203107', '123456', '王慧', '2016203107.jpg', '1', '1');
INSERT INTO `user` VALUES ('157', '2016203141', '123456', '孙亚丽', '2016203141.jpg', '1', '1');
INSERT INTO `user` VALUES ('158', '2016203185', '123456', '宋翱宇', '2016203185.jpg', '1', '1');
INSERT INTO `user` VALUES ('159', '2016203201', '123456', '唐本轩', '2016203201.jpg', '1', '1');
INSERT INTO `user` VALUES ('160', '2016203311', '123456', '解继壮', '2016203311.jpg', '1', '1');
INSERT INTO `user` VALUES ('161', '2016203370', '123456', '曹先魁', '2016203370.jpg', '1', '1');
INSERT INTO `user` VALUES ('162', '2016203399', '123456', '刘蒙慧', '2016203399.jpg', '1', '1');
INSERT INTO `user` VALUES ('163', '2016203452', '123456', '赵灏', '2016203452.jpg', '1', '1');
INSERT INTO `user` VALUES ('164', '2016203457', '123456', '王欣茹', '2016203457.jpg', '1', '1');
INSERT INTO `user` VALUES ('165', '2016203542', '123456', '张虎运', '2016203542.jpg', '1', '1');
INSERT INTO `user` VALUES ('166', '2016203566', '123456', '周翼', '2016203566.jpg', '1', '1');
INSERT INTO `user` VALUES ('167', '2016203574', '123456', '张斌', '2016203574.jpg', '1', '1');
INSERT INTO `user` VALUES ('168', '2016203582', '123456', '孙永健', '2016203582.jpg', '1', '1');
INSERT INTO `user` VALUES ('169', '2016203585', '123456', '邱树浩', '2016203585.jpg', '1', '1');
INSERT INTO `user` VALUES ('170', '2016203590', '123456', '李沛霖', '2016203590.jpg', '1', '1');
INSERT INTO `user` VALUES ('171', '2016203637', '123456', '冯吉生', '2016203637.jpg', '1', '1');
INSERT INTO `user` VALUES ('172', '2016203645', '123456', '周林雪莹', '2016203645.jpg', '1', '1');
INSERT INTO `user` VALUES ('173', '2016203681', '123456', '朱英豪', '2016203681.jpg', '1', '1');
INSERT INTO `user` VALUES ('174', '2016203691', '123456', '魏铭', '2016203691.jpg', '1', '1');
INSERT INTO `user` VALUES ('175', '2016203696', '123456', '周杨', '2016203696.jpg', '1', '1');
INSERT INTO `user` VALUES ('176', '2016203703', '123456', '张璨', '2016203703.jpg', '1', '1');
INSERT INTO `user` VALUES ('177', '2016203724', '123456', '姜官辉', '2016203724.jpg', '1', '1');
INSERT INTO `user` VALUES ('178', '2016203757', '123456', '白永昌', '2016203757.jpg', '1', '1');
INSERT INTO `user` VALUES ('179', '2016203771', '123456', '郝明慧', '2016203771.jpg', '1', '1');
INSERT INTO `user` VALUES ('180', '2016203780', '123456', '孙津滋', '2016203780.jpg', '1', '1');
INSERT INTO `user` VALUES ('181', '2016203826', '123456', '贾新宇', '2016203826.jpg', '1', '1');
INSERT INTO `user` VALUES ('182', '2016203895', '123456', '郭峰宁', '2016203895.jpg', '1', '1');
INSERT INTO `user` VALUES ('183', '2016203980', '123456', '牟小菊', '2016203980.jpg', '1', '1');
INSERT INTO `user` VALUES ('184', '2016204016', '123456', '徐希朋', '2016204016.jpg', '1', '1');
INSERT INTO `user` VALUES ('185', '2016204026', '123456', '李敏', '2016204026.jpg', '1', '1');
INSERT INTO `user` VALUES ('186', '2016204036', '123456', '张静', '2016204036.jpg', '1', '1');
INSERT INTO `user` VALUES ('187', '2016204079', '123456', '王冉冉', '2016204079.jpg', '1', '1');
INSERT INTO `user` VALUES ('188', '2016204153', '123456', '张海燕', '2016204153.jpg', '1', '1');
INSERT INTO `user` VALUES ('189', '2016204219', '123456', '王梦露', '2016204219.jpg', '1', '1');
INSERT INTO `user` VALUES ('190', '2016204232', '123456', '杜奕璇', '2016204232.jpg', '1', '1');
INSERT INTO `user` VALUES ('191', '2016204252', '123456', '曲扬', '2016204252.jpg', '1', '1');
INSERT INTO `user` VALUES ('192', '2016204278', '123456', '陈成洁', '2016204278.jpg', '1', '1');
INSERT INTO `user` VALUES ('193', '2016204291', '123456', '刘一雯', '2016204291.jpg', '1', '1');
INSERT INTO `user` VALUES ('194', '2016204313', '123456', '徐若琪', '2016204313.jpg', '1', '1');
INSERT INTO `user` VALUES ('195', '2016204339', '123456', '刘立娜', '2016204339.jpg', '1', '1');
INSERT INTO `user` VALUES ('196', '2016204348', '123456', '张宁朔', '2016204348.jpg', '1', '1');
INSERT INTO `user` VALUES ('197', '2016204358', '123456', '张泽懿', '2016204358.jpg', '1', '1');
INSERT INTO `user` VALUES ('198', '2016204404', '123456', '李秀', '2016204404.jpg', '1', '1');
INSERT INTO `user` VALUES ('199', '2016204420', '123456', '曹百慧', '2016204420.jpg', '1', '1');
INSERT INTO `user` VALUES ('200', '2016204451', '123456', '邱业欣', '2016204451.jpg', '1', '1');
INSERT INTO `user` VALUES ('201', '2016204460', '123456', '侯子辉', '2016204460.jpg', '1', '1');
INSERT INTO `user` VALUES ('202', '2016204470', '123456', '王纪星', '2016204470.jpg', '1', '1');
INSERT INTO `user` VALUES ('203', '2016204494', '123456', '纪璇', '2016204494.jpg', '1', '1');
INSERT INTO `user` VALUES ('204', '2016204530', '123456', '许晓静', '2016204530.jpg', '1', '1');
INSERT INTO `user` VALUES ('205', '2016204562', '123456', '余林徽', '2016204562.jpg', '1', '1');
INSERT INTO `user` VALUES ('206', '2016204586', '123456', '张泽港', '2016204586.jpg', '1', '1');
INSERT INTO `user` VALUES ('207', '2016204590', '123456', '李俊杰', '2016204590.jpg', '1', '1');
INSERT INTO `user` VALUES ('208', '2016204593', '123456', '衣凌莉', '2016204593.jpg', '1', '1');
INSERT INTO `user` VALUES ('209', '2016204606', '123456', '姜蓉', '2016204606.jpg', '1', '1');
INSERT INTO `user` VALUES ('210', '2016204635', '123456', '范冬玉', '2016204635.jpg', '1', '1');
INSERT INTO `user` VALUES ('211', '2016204642', '123456', '高悦', '2016204642.jpg', '1', '1');
INSERT INTO `user` VALUES ('212', '2016204734', '123456', '刘文卓', '2016204734.jpg', '1', '1');
INSERT INTO `user` VALUES ('213', '2016204769', '123456', '李牧晓', '2016204769.jpg', '1', '1');
INSERT INTO `user` VALUES ('214', '2016204782', '123456', '杨蕾', '2016204782.jpg', '1', '1');
INSERT INTO `user` VALUES ('215', '2016204834', '123456', '宋瑾', '2016204834.jpg', '1', '1');
INSERT INTO `user` VALUES ('216', '2016204844', '123456', '宋春雨', '2016204844.jpg', '1', '1');
INSERT INTO `user` VALUES ('217', '2016204919', '123456', '陈雪', '2016204919.jpg', '1', '1');
INSERT INTO `user` VALUES ('218', '2016204943', '123456', '刘春利', '2016204943.jpg', '1', '1');
INSERT INTO `user` VALUES ('219', '2016204969', '123456', '曲正程', '2016204969.jpg', '1', '1');
INSERT INTO `user` VALUES ('220', '2016204978', '123456', '题恒', '2016204978.jpg', '1', '1');
INSERT INTO `user` VALUES ('221', '2016205032', '123456', '田玮珂', '2016205032.jpg', '1', '1');
INSERT INTO `user` VALUES ('222', '2016205035', '123456', '温千莹', '2016205035.jpg', '1', '1');
INSERT INTO `user` VALUES ('223', '2016205083', '123456', '王立丽', '2016205083.jpg', '1', '1');
INSERT INTO `user` VALUES ('224', '2016205100', '123456', '郑佳佳', '2016205100.jpg', '1', '1');
INSERT INTO `user` VALUES ('225', '2016205109', '123456', '程晓丽', '2016205109.jpg', '1', '1');
INSERT INTO `user` VALUES ('226', '2016205145', '123456', '田园园', '2016205145.jpg', '1', '1');
INSERT INTO `user` VALUES ('227', '2016205154', '123456', '关子涵', '2016205154.jpg', '1', '1');
INSERT INTO `user` VALUES ('228', '2016205189', '123456', '姜玮', '2016205189.jpg', '1', '1');
INSERT INTO `user` VALUES ('229', '2016205292', '123456', '孙宁', '2016205292.jpg', '1', '1');
INSERT INTO `user` VALUES ('230', '2016205312', '123456', '赵冬梅', '2016205312.jpg', '1', '1');
INSERT INTO `user` VALUES ('231', '2016205313', '123456', '张释元', '2016205313.jpg', '1', '1');
INSERT INTO `user` VALUES ('232', '2016205325', '123456', '胡淑凡', '2016205325.jpg', '1', '1');
INSERT INTO `user` VALUES ('233', '2016205366', '123456', '孟金颖', '2016205366.jpg', '1', '1');
INSERT INTO `user` VALUES ('234', '2016205378', '123456', '王国旭', '2016205378.jpg', '1', '1');
INSERT INTO `user` VALUES ('235', '2016205402', '123456', '王冉冉', '2016205402.jpg', '1', '1');
INSERT INTO `user` VALUES ('236', '2016205420', '123456', '陈青峰', '2016205420.jpg', '1', '1');
INSERT INTO `user` VALUES ('237', '2016205424', '123456', '于洪程', '2016205424.jpg', '1', '1');
INSERT INTO `user` VALUES ('238', '2016205479', '123456', '苗庆云', '2016205479.jpg', '1', '1');
INSERT INTO `user` VALUES ('239', '2016205530', '123456', '颜飞', '2016205530.jpg', '1', '1');
INSERT INTO `user` VALUES ('240', '2016205561', '123456', '郑雨丛', '2016205561.jpg', '1', '1');
INSERT INTO `user` VALUES ('241', '2016205595', '123456', '王静姝', '2016205595.jpg', '1', '1');
INSERT INTO `user` VALUES ('242', '2016205614', '123456', '夏雨', '2016205614.jpg', '1', '1');
INSERT INTO `user` VALUES ('243', '2016205669', '123456', '魏童正', '2016205669.jpg', '1', '1');
INSERT INTO `user` VALUES ('244', '2016205739', '123456', '刘春毅', '2016205739.jpg', '1', '1');
INSERT INTO `user` VALUES ('245', '2016205769', '123456', '汪青青', '2016205769.jpg', '1', '1');
INSERT INTO `user` VALUES ('246', '2016205806', '123456', '石雯雯', '2016205806.jpg', '1', '1');
INSERT INTO `user` VALUES ('247', '2016205820', '123456', '陈璐', '2016205820.jpg', '1', '1');
INSERT INTO `user` VALUES ('248', '2016205837', '123456', '江杰辉', '2016205837.jpg', '1', '1');
INSERT INTO `user` VALUES ('249', '2016205880', '123456', '武晨晨', '2016205880.jpg', '1', '1');
INSERT INTO `user` VALUES ('250', '2016205884', '123456', '冷倩', '2016205884.jpg', '1', '1');
INSERT INTO `user` VALUES ('251', '2016205946', '123456', '姜柳', '2016205946.jpg', '1', '1');
INSERT INTO `user` VALUES ('252', '2016205953', '123456', '刘晓', '2016205953.jpg', '1', '1');
INSERT INTO `user` VALUES ('253', '2016205958', '123456', '张鸿燕', '2016205958.jpg', '1', '1');
INSERT INTO `user` VALUES ('254', '2016206041', '123456', '罗畅', '2016206041.jpg', '1', '1');
INSERT INTO `user` VALUES ('255', '2016206055', '123456', '王海艺', '2016206055.jpg', '1', '1');
INSERT INTO `user` VALUES ('256', '2016206072', '123456', '刘文艺', '2016206072.jpg', '1', '1');
INSERT INTO `user` VALUES ('257', '2016206076', '123456', '付一诺', '2016206076.jpg', '1', '1');
INSERT INTO `user` VALUES ('258', '2016206084', '123456', '孙悦嘉', '2016206084.jpg', '1', '1');
INSERT INTO `user` VALUES ('259', '2016206106', '123456', '高泽兴', '2016206106.jpg', '1', '1');
INSERT INTO `user` VALUES ('260', '2016206113', '123456', '李钊颖', '2016206113.jpg', '1', '1');
INSERT INTO `user` VALUES ('261', '2016206184', '123456', '陈晓旭', '2016206184.jpg', '1', '1');
INSERT INTO `user` VALUES ('262', '2016206195', '123456', '张琳', '2016206195.jpg', '1', '1');
INSERT INTO `user` VALUES ('263', '2016206200', '123456', '穆怡凡', '2016206200.jpg', '1', '1');
INSERT INTO `user` VALUES ('264', '2016206206', '123456', '殷雪', '2016206206.jpg', '1', '1');
INSERT INTO `user` VALUES ('265', '2016206230', '123456', '那明煜', '2016206230.jpg', '1', '1');
INSERT INTO `user` VALUES ('266', '2016206271', '123456', '闫成成', '2016206271.jpg', '1', '1');
INSERT INTO `user` VALUES ('267', '2016206322', '123456', '闫文甜', '2016206322.jpg', '1', '1');
INSERT INTO `user` VALUES ('268', '2016206340', '123456', '赵世鹏', '2016206340.jpg', '1', '1');
INSERT INTO `user` VALUES ('269', '2016206398', '123456', '庄婕妤', '2016206398.jpg', '1', '1');
INSERT INTO `user` VALUES ('270', '2016206405', '123456', '吴庭', '2016206405.jpg', '1', '1');
INSERT INTO `user` VALUES ('271', '2016206427', '123456', '庞祺雨', '2016206427.jpg', '1', '1');
INSERT INTO `user` VALUES ('272', '2016206448', '123456', '孙恺玥', '2016206448.jpg', '1', '1');
INSERT INTO `user` VALUES ('273', '2016206582', '123456', '刘萌', '2016206582.jpg', '1', '1');
INSERT INTO `user` VALUES ('274', '2016206586', '123456', '孙庆', '2016206586.jpg', '1', '1');
INSERT INTO `user` VALUES ('275', '2016206650', '123456', '鲍元帅', '2016206650.jpg', '1', '1');
INSERT INTO `user` VALUES ('276', '2016206671', '123456', '李玉', '2016206671.jpg', '1', '1');
INSERT INTO `user` VALUES ('277', '2016206679', '123456', '郭宇', '2016206679.jpg', '1', '1');
INSERT INTO `user` VALUES ('278', '2016206815', '123456', '邵明轩', '2016206815.jpg', '1', '1');
INSERT INTO `user` VALUES ('279', '2016206824', '123456', '石浩然', '2016206824.jpg', '1', '1');
INSERT INTO `user` VALUES ('280', '2016206845', '123456', '李雨盈', '2016206845.jpg', '1', '1');
INSERT INTO `user` VALUES ('281', '2016206868', '123456', '邱淳彬', '2016206868.jpg', '1', '1');
INSERT INTO `user` VALUES ('282', '2016206919', '123456', '闵永辉', '2016206919.jpg', '1', '1');
INSERT INTO `user` VALUES ('283', '2016206920', '123456', '戴国豪', '2016206920.jpg', '1', '1');
INSERT INTO `user` VALUES ('284', '2016206942', '123456', '许桓源', '2016206942.jpg', '1', '1');
INSERT INTO `user` VALUES ('285', '2016206963', '123456', '唐清岭', '2016206963.jpg', '1', '1');
INSERT INTO `user` VALUES ('286', '2016206971', '123456', '张涛', '2016206971.jpg', '1', '1');
INSERT INTO `user` VALUES ('287', '2016207009', '123456', '高学壮', '2016207009.jpg', '1', '1');
INSERT INTO `user` VALUES ('288', '2016207042', '123456', '冯石', '2016207042.jpg', '1', '1');
INSERT INTO `user` VALUES ('289', '2016207109', '123456', '蔺诗文', '2016207109.jpg', '1', '1');
INSERT INTO `user` VALUES ('290', '2016207140', '123456', '张淙琳', '2016207140.jpg', '1', '1');
INSERT INTO `user` VALUES ('291', '2016207148', '123456', '李华岩', '2016207148.jpg', '1', '1');
INSERT INTO `user` VALUES ('292', '2016207165', '123456', '李晓璇', '2016207165.jpg', '1', '1');
INSERT INTO `user` VALUES ('293', '2016207186', '123456', '翟云飞', '2016207186.jpg', '1', '1');
INSERT INTO `user` VALUES ('294', '2016207205', '123456', '邱兴越', '2016207205.jpg', '1', '1');
INSERT INTO `user` VALUES ('295', '2016207241', '123456', '李小源', '2016207241.jpg', '1', '1');
INSERT INTO `user` VALUES ('296', '2016207324', '123456', '房好顺', '2016207324.jpg', '1', '1');
INSERT INTO `user` VALUES ('297', '2016207363', '123456', '刘佳龙', '2016207363.jpg', '1', '1');
INSERT INTO `user` VALUES ('298', '2016207396', '123456', '李稷', '2016207396.jpg', '1', '1');
INSERT INTO `user` VALUES ('299', '2016207487', '123456', '孙喜娥', '2016207487.jpg', '1', '1');
INSERT INTO `user` VALUES ('300', '2016207499', '123456', '武艳丽', '2016207499.jpg', '1', '1');
INSERT INTO `user` VALUES ('301', '2016207558', '123456', '曹焕焰', '2016207558.jpg', '1', '1');
INSERT INTO `user` VALUES ('302', '2016207704', '123456', '牛丽娜', '2016207704.jpg', '1', '1');
INSERT INTO `user` VALUES ('303', '2016207811', '123456', '栾颖仪', '2016207811.jpg', '1', '1');
INSERT INTO `user` VALUES ('304', '2016207821', '123456', '吴嘉诚', '2016207821.jpg', '1', '1');
INSERT INTO `user` VALUES ('305', '2016207824', '123456', '宋风云', '2016207824.jpg', '1', '1');
INSERT INTO `user` VALUES ('306', '2016207849', '123456', '栾奕', '2016207849.jpg', '1', '1');
INSERT INTO `user` VALUES ('307', '2016207864', '123456', '蒋崃', '2016207864.jpg', '1', '1');
INSERT INTO `user` VALUES ('308', '2016207916', '123456', '王洁', '2016207916.jpg', '1', '1');
INSERT INTO `user` VALUES ('309', '2016207965', '123456', '潘婧', '2016207965.jpg', '1', '1');
INSERT INTO `user` VALUES ('310', '2016207967', '123456', '周悦', '2016207967.jpg', '1', '1');
INSERT INTO `user` VALUES ('311', '2016207980', '123456', '张馨跃', '2016207980.jpg', '1', '1');
INSERT INTO `user` VALUES ('312', '2016208003', '123456', '薛松莹', '2016208003.jpg', '1', '1');
INSERT INTO `user` VALUES ('313', '2016208010', '123456', '许馨文', '2016208010.jpg', '1', '1');
INSERT INTO `user` VALUES ('314', '2016208012', '123456', '吴晓帆', '2016208012.jpg', '1', '1');
INSERT INTO `user` VALUES ('315', '2016208019', '123456', '徐英博', '2016208019.jpg', '1', '1');
INSERT INTO `user` VALUES ('316', '2016208028', '123456', '姚晋', '2016208028.jpg', '1', '1');
INSERT INTO `user` VALUES ('317', '2016208044', '123456', '张懿文', '2016208044.jpg', '1', '1');
INSERT INTO `user` VALUES ('318', '2016208095', '123456', '李婧', '2016208095.jpg', '1', '1');
INSERT INTO `user` VALUES ('319', '2016208099', '123456', '杨琳', '2016208099.jpg', '1', '1');
INSERT INTO `user` VALUES ('320', '2016208121', '123456', '石昊昆', '2016208121.jpg', '1', '1');
INSERT INTO `user` VALUES ('321', '2016208126', '123456', '杨皓清', '2016208126.jpg', '1', '1');
INSERT INTO `user` VALUES ('322', '2016208153', '123456', '张成豪', '2016208153.jpg', '1', '1');
INSERT INTO `user` VALUES ('323', '2016208254', '123456', '韩仕煜', '2016208254.jpg', '1', '1');
INSERT INTO `user` VALUES ('324', '2016208259', '123456', '衣然', '2016208259.jpg', '1', '1');
INSERT INTO `user` VALUES ('325', '2016208303', '123456', '张章', '2016208303.jpg', '1', '1');
INSERT INTO `user` VALUES ('326', '2016208346', '123456', '江文', '2016208346.jpg', '1', '1');
INSERT INTO `user` VALUES ('327', '2016210039', '123456', '陈昊一', '2016210039.jpg', '1', '1');
INSERT INTO `user` VALUES ('328', '2016210066', '123456', '徐冲', '2016210066.jpg', '1', '1');
INSERT INTO `user` VALUES ('329', '2016210079', '123456', '刘颂', '2016210079.jpg', '1', '1');
INSERT INTO `user` VALUES ('330', '2016210154', '123456', '徐飞', '2016210154.jpg', '1', '1');
INSERT INTO `user` VALUES ('331', '2016210208', '123456', '马瑞光', '2016210208.jpg', '1', '1');
INSERT INTO `user` VALUES ('332', '2016210227', '123456', '王佳林', '2016210227.jpg', '1', '1');
INSERT INTO `user` VALUES ('333', '2016210309', '123456', '常天怡', '2016210309.jpg', '1', '1');
INSERT INTO `user` VALUES ('334', '2016210336', '123456', '杨一帆', '2016210336.jpg', '1', '1');
INSERT INTO `user` VALUES ('335', '2016210349', '123456', '王雪松', '2016210349.jpg', '1', '1');
INSERT INTO `user` VALUES ('336', '2016210372', '123456', '王博', '2016210372.jpg', '1', '1');
INSERT INTO `user` VALUES ('337', '2016210377', '123456', '焦孟章', '2016210377.jpg', '1', '1');
INSERT INTO `user` VALUES ('338', '2016210476', '123456', '周嘉伟', '2016210476.jpg', '1', '1');
INSERT INTO `user` VALUES ('339', '2016230065', '123456', '刘蕴博', '2016230065.jpg', '1', '1');
INSERT INTO `user` VALUES ('340', '2016230077', '123456', '张明君', '2016230077.jpg', '1', '1');
INSERT INTO `user` VALUES ('341', '2016230087', '123456', '苏燊', '2016230087.jpg', '1', '1');
INSERT INTO `user` VALUES ('342', '2016230088', '123456', '陈东旭', '2016230088.jpg', '1', '1');
INSERT INTO `user` VALUES ('343', '2016230099', '123456', '王一人', '2016230099.jpg', '1', '1');
INSERT INTO `user` VALUES ('344', '2016230126', '123456', '王啸宇', '2016230126.jpg', '1', '1');
INSERT INTO `user` VALUES ('345', '2016240001', '123456', '司晓宇', '2016240001.jpg', '1', '1');
INSERT INTO `user` VALUES ('346', '2016240013', '123456', '房学鑫', '2016240013.jpg', '1', '1');
INSERT INTO `user` VALUES ('347', '2016240058', '123456', '安仁杰', '2016240058.jpg', '1', '1');
INSERT INTO `user` VALUES ('348', '2016240061', '123456', '张旭', '2016240061.jpg', '1', '1');
INSERT INTO `user` VALUES ('349', '2016240080', '123456', '韩超', '2016240080.jpg', '1', '1');
INSERT INTO `user` VALUES ('350', '2016400316', '123456', '郑萌萌', '2016400316.jpg', '1', '1');
INSERT INTO `user` VALUES ('351', '2016500002', '123456', 'LEE YEYEONG', '2016500002.jpg', '1', '1');
INSERT INTO `user` VALUES ('352', '10100', '123456', '校自强社主席团', '10100.jpg', '1', '2');
INSERT INTO `user` VALUES ('353', '10101', '123456', '校自强社秘书处', '10100.jpg', '1', '2');
INSERT INTO `user` VALUES ('354', '10102', '123456', '校自强社勤工部', '10100.jpg', '1', '2');
INSERT INTO `user` VALUES ('355', '10103', '123456', '校自强社公益部', '10100.jpg', '1', '2');
INSERT INTO `user` VALUES ('356', '10104', '123456', '校自强社宣传部', '10100.jpg', '1', '2');
INSERT INTO `user` VALUES ('357', '10105', '123456', '校自强社实践部', '10100.jpg', '1', '2');
INSERT INTO `user` VALUES ('358', '10200', '123456', '校学生会主席团', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('359', '10201', '123456', '校学生会秘书处', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('360', '10202', '123456', '校学生会办公室', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('361', '10203', '123456', '校学生会组织部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('362', '10204', '123456', '校学生会自律部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('363', '10205', '123456', '校学生会社会实践部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('364', '10206', '123456', '校学生会宣传部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('365', '10207', '123456', '校学生会技术部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('366', '10208', '123456', '校学生会新闻中心', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('367', '10209', '123456', '校学生会新媒体中心', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('368', '10210', '123456', '校学生会学术中心', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('369', '10211', '123456', '校学生会科技创新部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('370', '10212', '123456', '校学生会生活部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('371', '10213', '123456', '校学生会权益部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('372', '10214', '123456', '校学生会调研中心', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('373', '10215', '123456', '校学生会文艺部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('374', '10216', '123456', '校学生会女生部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('375', '10217', '123456', '校学生会体育部', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('376', '10218', '123456', '校学生会文明礼仪宣讲团', '10200.jpg', '1', '2');
INSERT INTO `user` VALUES ('377', '10300', '123456', '德鲁克管理协会主席团', '10300.jpg', '0', '2');
INSERT INTO `user` VALUES ('378', '10301', '123456', '德鲁克管理协会秘书处', '10300.jpg', '0', '2');
INSERT INTO `user` VALUES ('379', '10302', '123456', '德鲁克管理协会教学教研部', '10300.jpg', '0', '2');
INSERT INTO `user` VALUES ('380', '10303', '123456', '德鲁克管理协会人力资源部', '10300.jpg', '0', '2');
INSERT INTO `user` VALUES ('381', '10304', '123456', '德鲁克管理协会公关部', '10300.jpg', '0', '2');
INSERT INTO `user` VALUES ('382', '10305', '123456', '德鲁克管理协会业务拓展部', '10300.jpg', '0', '2');
INSERT INTO `user` VALUES ('383', '10400', '123456', '校艺术团主席团', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('384', '10401', '123456', '校艺术团舞台美术', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('385', '10402', '123456', '校艺术团秘书处', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('386', '10403', '123456', '校艺术团省乐队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('387', '10404', '123456', '校艺术团外联队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('388', '10405', '123456', '校艺术团微电影剧组', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('389', '10406', '123456', '校艺术团新媒体中心', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('390', '10407', '123456', '校艺术团舞台监督', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('391', '10408', '123456', '校艺术团曲艺队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('392', '10409', '123456', '校艺术团舞蹈队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('393', '10410', '123456', '校艺术团器乐队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('394', '10411', '123456', '校艺术团礼仪队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('395', '10412', '123456', '校艺术团宣传队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('396', '10413', '123456', '校艺术团自律队', '10400.jpg', '1', '2');
INSERT INTO `user` VALUES ('397', '10500', '123456', '文明督导岗主席团', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('398', '10501', '123456', '文明督导岗秘书处', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('399', '10502', '123456', '文明督导岗宣传部', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('400', '10503', '123456', '文明督导岗实践部', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('401', '10504', '123456', '文明督导岗外联部', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('402', '10505', '123456', '文明督导岗督导部', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('403', '10506', '123456', '文明督导岗膳宣部', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('404', '10507', '123456', '文明督导岗新闻中心', '10500.jpg', '1', '2');
INSERT INTO `user` VALUES ('405', '10600', '123456', '社团联合会主席团', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('406', '10601', '123456', '社团联合会秘书处', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('407', '10602', '123456', '社团联合会社会实践部', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('408', '10603', '123456', '社团联合会文艺部', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('409', '10604', '123456', '社团联合会体育部', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('410', '10605', '123456', '社团联合会志愿者服务部', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('411', '10606', '123456', '社团联合会宣传部', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('412', '10607', '123456', '社团联合会外联部', '10600.jpg', '1', '2');
INSERT INTO `user` VALUES ('414', '10701', '123456', '国旗班仪仗队', '10700.jpg', '1', '2');
INSERT INTO `user` VALUES ('415', '10702', '123456', '国旗班网宣部', '10700.jpg', '1', '2');
INSERT INTO `user` VALUES ('416', '10703', '123456', '国旗班办公室', '10700.jpg', '1', '2');
INSERT INTO `user` VALUES ('417', '10704', '123456', '国旗班外联部', '10700.jpg', '1', '2');
INSERT INTO `user` VALUES ('419', '20100', '123456', '商学院学生会主席团', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('420', '20101', '123456', '商学院学生会生活部', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('421', '20102', '123456', '商学院学生会文艺部', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('422', '20103', '123456', '商学院学生会学术部', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('423', '20104', '123456', '商学院学生会体育部', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('424', '20105', '123456', '商学院学生会秘书处', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('425', '20106', '123456', '商学院学生会新闻媒体中心', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('426', '20107', '123456', '商学院学生会艺术团', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('427', '20108', '123456', '商学院学生会宣传部', '20100.jpg', '1', '2');
INSERT INTO `user` VALUES ('428', '20200', '123456', '经济学院学生会主席团', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('429', '20201', '123456', '经济学院学生会秘书处', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('430', '20202', '123456', '经济学院学生会实践部', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('431', '20203', '123456', '经济学院学生会学术部', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('432', '20204', '123456', '经济学院学生会体育部', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('433', '20205', '123456', '经济学院学生会宣传部', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('434', '20206', '123456', '经济学院学生会技术部', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('435', '20207', '123456', '经济学院学生会自律部', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('436', '20208', '123456', '经济学院学生会文艺部', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('437', '20209', '123456', '经济学院学生会艺术团', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('438', '20210', '123456', '经济学院学生会媒体中心记者组', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('439', '20211', '123456', '经济学院学生会媒体中心摄影组', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('440', '20212', '123456', '经济学院学生会媒体中心新媒体组', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('441', '20213', '123456', '经济学院学生会经彩青春志愿服务队', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('442', '20214', '123456', '经济学院学生会读书协会', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('443', '20215', '123456', '经济学院学生会创新创业协会', '20200.jpg', '1', '2');
INSERT INTO `user` VALUES ('444', '20300', '123456', '文学院学生会主席团', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('445', '20301', '123456', '文学院学生会学术部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('446', '20302', '123456', '文学院学生会调研部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('447', '20303', '123456', '文学院学生会实践部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('448', '20304', '123456', '文学院学生会体育部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('449', '20305', '123456', '文学院学生会媒体运营部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('450', '20306', '123456', '文学院学生会宣传部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('451', '20307', '123456', '文学院学生会文艺部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('452', '20308', '123456', '文学院学生会新闻中心', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('453', '20309', '123456', '文学院学生会生活卫生部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('454', '20310', '123456', '文学院学生会自律部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('455', '20311', '123456', '文学院学生会科创部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('456', '20312', '123456', '文学院学生会社团部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('457', '20313', '123456', '文学院学生会就业部', '20300.jpg', '0', '2');
INSERT INTO `user` VALUES ('458', '20400', '123456', '机电学院学生会主席团', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('459', '20401', '123456', '机电学院学生会秘书处', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('460', '20402', '123456', '机电学院学生会生活部', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('461', '20403', '123456', '机电学院学生会自律部', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('462', '20404', '123456', '机电学院学生会学习部', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('463', '20405', '123456', '机电学院学生会办公室', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('464', '20406', '123456', '机电学院学生会体育部', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('465', '20407', '123456', '机电学院学生会文艺部', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('466', '20408', '123456', '机电学院学生会宣传部', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('467', '20409', '123456', '机电学院学生会新媒体中心', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('468', '20410', '123456', '机电学院学生会技术中心', '20400.jpg', '1', '2');
INSERT INTO `user` VALUES ('469', '20500', '123456', '化工学院学生会主席团', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('470', '20501', '123456', '化工学院学生会秘书处', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('471', '20502', '123456', '化工学院学生会体育部', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('472', '20503', '123456', '化工学院学生会自律部', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('473', '20504', '123456', '化工学院学生会学术部', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('474', '20505', '123456', '化工学院学生会文艺部', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('475', '20506', '123456', '化工学院学生会校友联络部', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('476', '20507', '123456', '化工学院学生会新闻与宣传中心', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('477', '20508', '123456', '化工学院学生会青年志愿者协会', '20500.jpg', '1', '2');
INSERT INTO `user` VALUES ('478', '20600', '123456', '外语学院学生会主席团', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('479', '20601', '123456', '外语学院学生会新闻中心', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('480', '20602', '123456', '外语学院学生会科创部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('481', '20603', '123456', '外语学院学生会生活部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('482', '20604', '123456', '外语学院学生会办公室', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('483', '20605', '123456', '外语学院学生会学术部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('484', '20606', '123456', '外语学院学生会外联部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('485', '20607', '123456', '外语学院学生会宣传部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('486', '20608', '123456', '外语学院学生会校友事务部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('487', '20609', '123456', '外语学院学生会体育部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('488', '20610', '123456', '外语学院学生会文艺部', '20600.jpg', '0', '2');
INSERT INTO `user` VALUES ('489', '20700', '123456', '法学院学生会主席团', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('490', '20701', '123456', '法学院学生会秘书处', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('491', '20702', '123456', '法学院学生会学术部', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('492', '20703', '123456', '法学院学生会体育部', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('493', '20704', '123456', '法学院学生会外联部', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('494', '20705', '123456', '法学院学生会新闻媒体中心', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('495', '20706', '123456', '法学院学生会文艺部', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('496', '20707', '123456', '法学院学生会实践部', '20700.jpg', '0', '2');
INSERT INTO `user` VALUES ('504', '30400', '123456', '测试主席团', '30400.jpg', '0', '2');
INSERT INTO `user` VALUES ('505', '201440403029', '123456', '李林真', '201440403029.jpg', '0', '1');
INSERT INTO `user` VALUES ('507', '30100', '123456', '乒乓球社主席团', '30100.jpg', '0', '2');
INSERT INTO `user` VALUES ('517', '10700', '123456', '国旗班主席团', '10700.jpg', '1', '2');
INSERT INTO `user` VALUES ('549', '2016204873', '2296407102', '王美娟', '2016204873.jpg', '1', '1');
INSERT INTO `user` VALUES ('550', '2016207720', '1010520whxf', '杜雨欣', '2016207720.jpg', '1', '1');
INSERT INTO `user` VALUES ('551', '2016202840', '123456', '孙其昊', '2016202840.jpg', '1', '1');
INSERT INTO `user` VALUES ('552', '2016203368', '123456', '马振磊', '2016203368.jpg', '1', '1');
INSERT INTO `user` VALUES ('553', '2016202801', 'xl981024', '许艳琳', '2016202801.jpg', '1', '1');
INSERT INTO `user` VALUES ('554', '2016200860', '123456', '韩欣欣', '2016200860.jpg', '1', '1');
INSERT INTO `user` VALUES ('555', '2016202980', 'cctv1412', '蔡玉晓', '2016202980.jpg', '1', '1');
INSERT INTO `user` VALUES ('556', '2016203276', 'jwz861395366', '纪文珠', '2016203276.jpg', '1', '1');
INSERT INTO `user` VALUES ('557', '2016205005', '123456', '邹雅萌', '2016205005.jpg', '1', '1');
INSERT INTO `user` VALUES ('558', '30600', '123456', '羽毛球社主席团', '30600.jpg', '0', '2');
INSERT INTO `user` VALUES ('559', '10189', '123456', '校自强社测试部', '10100.jpg', '0', '2');

-- ----------------------------
-- Table structure for work_finished
-- ----------------------------
DROP TABLE IF EXISTS `work_finished`;
CREATE TABLE `work_finished` (
  `ID` int(11) NOT NULL COMMENT '主键',
  `memID` int(11) NOT NULL COMMENT '部员id',
  `workID` int(11) NOT NULL COMMENT '工作id',
  `RESULT` longtext NOT NULL COMMENT '学生汇报情况',
  `STATUS` varchar(5) NOT NULL COMMENT '工作完成状态（1：已提交，2：待修改，3：已完成）',
  `APPRAISE` longtext COMMENT '工作评价',
  PRIMARY KEY (`ID`),
  KEY `work_workID` (`workID`),
  KEY `work_memID` (`memID`),
  CONSTRAINT `work_memID` FOREIGN KEY (`memID`) REFERENCES `member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_workID` FOREIGN KEY (`workID`) REFERENCES `work_released` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作完成信息表';

-- ----------------------------
-- Records of work_finished
-- ----------------------------

-- ----------------------------
-- Table structure for work_released
-- ----------------------------
DROP TABLE IF EXISTS `work_released`;
CREATE TABLE `work_released` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `DEPID` int(11) NOT NULL COMMENT '部门ID',
  `LOGNAME` varchar(5) NOT NULL COMMENT '工作编号，5位数',
  `THEME` varchar(50) NOT NULL COMMENT '工作主题',
  `CONTENT` longtext NOT NULL COMMENT '工作内容',
  `STARTTIME` varchar(15) NOT NULL COMMENT '开始时间',
  `ENDTIME` varchar(15) NOT NULL COMMENT '截止时间',
  `NUM` int(11) NOT NULL DEFAULT '0' COMMENT '完成人数',
  PRIMARY KEY (`ID`),
  KEY `work_depID` (`DEPID`),
  CONSTRAINT `work_depID` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='工作信息表';

-- ----------------------------
-- Records of work_released
-- ----------------------------
INSERT INTO `work_released` VALUES ('1', '4', '1', '1', '1', '1', '1', '0');
INSERT INTO `work_released` VALUES ('2', '10', '1', '1', '1', '1', '1', '0');
INSERT INTO `work_released` VALUES ('3', '4', '2', '2', '3', '2', '1', '0');
INSERT INTO `work_released` VALUES ('4', '15', '3', '3', '3', '3', '3', '0');

-- ----------------------------
-- View structure for assn_article
-- ----------------------------
DROP VIEW IF EXISTS `assn_article`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`::1` SQL SECURITY DEFINER  VIEW `assn_article` AS SELECT
	`user`.LOGNAME,
	article.*
FROM
	article
INNER JOIN `user` ON article.AUTHOR = `user`.ID ;

-- ----------------------------
-- View structure for stu_assn
-- ----------------------------
DROP VIEW IF EXISTS `stu_assn`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`::1` SQL SECURITY DEFINER  VIEW `stu_assn` AS SELECT
	student.ID STUID,
	assn.*
FROM
	member
INNER JOIN student ON member.STUID = student.ID
INNER JOIN depart ON member.DEPID = depart.ID
INNER JOIN assn ON depart.ASSNID = assn.ID ;

-- ----------------------------
-- View structure for stu_dep
-- ----------------------------
DROP VIEW IF EXISTS `stu_dep`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`::1`  VIEW `stu_dep` AS SELECT

student.ID STUID,
depart.*
FROM
depart
INNER JOIN member ON member.DEPID = depart.ID
INNER JOIN student ON member.STUID = student.ID ;

-- ----------------------------
-- Event structure for select_from_user_minute
-- ----------------------------
DROP EVENT IF EXISTS `select_from_user_minute`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `select_from_user_minute` ON SCHEDULE EVERY 5 MINUTE STARTS '2018-05-24 14:07:05' ON COMPLETION PRESERVE ENABLE DO SELECT * FROM `user`
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `addAssn_dep`;
DELIMITER ;;
CREATE TRIGGER `addAssn_dep` AFTER INSERT ON `assn` FOR EACH ROW begin
insert into depart(assnid,logname,depname,level) values(new.id,concat(new.logname,'00'),'主席团','1');
-- 向depart表中插入名为 xxx主席团 的部门
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `addAssn_arti`;
DELIMITER ;;
CREATE TRIGGER `addAssn_arti` AFTER INSERT ON `assn` FOR EACH ROW begin
insert into article(title,content,author,time,sectiona,sectionb) 
values(
concat(new.assnname,'简介'),
'暂无',
(select user.id from user where user.name=(concat(new.assnname,'主席团'))),
'暂无',
'2',
new.level
);
-- 向article表中插入一条 作者为 xxx主席团 的社团简介
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insert_assn_level`;
DELIMITER ;;
CREATE TRIGGER `insert_assn_level` AFTER INSERT ON `assn` FOR EACH ROW begin
update assn set level = new.id where id = new.id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delAssn_user`;
DELIMITER ;;
CREATE TRIGGER `delAssn_user` AFTER DELETE ON `assn` FOR EACH ROW begin
delete from user where user.logname like (concat(old.logname,'%')) and user.type='2';
-- 删除user表中社团中所有部门用户
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `addDep`;
DELIMITER ;;
CREATE TRIGGER `addDep` AFTER INSERT ON `depart` FOR EACH ROW begin
insert into user(logname,name,type,pic) 
select new.logname,concat(b.assnname,new.depname),'2',concat(b.logname,'00.jpg')
from depart a
left join assn b on b.id=new.assnid
where a.id=new.id;
-- 向user表中插入一条部门用户 名称为 社团名+部门名 
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delDep`;
DELIMITER ;;
CREATE TRIGGER `delDep` AFTER DELETE ON `depart` FOR EACH ROW begin
delete from user where user.logname=old.logname;
-- 删除user表中该部门用户
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `enroll_addMem`;
DELIMITER ;;
CREATE TRIGGER `enroll_addMem` AFTER UPDATE ON `enroll` FOR EACH ROW begin
if (new.status='4')
then
insert into member(stuid,depid,status)
values(old.stuid,old.depid,'1');
end if;
-- 如果报名状态为‘复试通过’ 则向member表中插入一条部员信息
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `addStu`;
DELIMITER ;;
CREATE TRIGGER `addStu` AFTER INSERT ON `student` FOR EACH ROW begin
insert into user(logname,name,type,pic) values(new.logname,new.name,'1',concat(new.logname, '.jpg'));
-- 向user表中插入一条学生用户
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `delStu`;
DELIMITER ;;
CREATE TRIGGER `delStu` AFTER DELETE ON `student` FOR EACH ROW begin
delete from user where user.logname=old.logname;
-- 删除user表中该学生用户
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `addFinish`;
DELIMITER ;;
CREATE TRIGGER `addFinish` AFTER INSERT ON `work_finished` FOR EACH ROW begin
update work_released a
set a.num=a.num+1
where a.id=new.workid;
-- 更新work_released表中num字段，每插入一条完成信息，num+1
end
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
