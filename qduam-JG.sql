/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : qduam

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2018-05-17 15:15:05
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
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='文章表';

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='社团表';

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
  KEY `dep_assnID` (`ASSNID`) USING BTREE,
  CONSTRAINT `depart_ibfk_1` FOREIGN KEY (`ASSNID`) REFERENCES `assn` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='部门表';

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
  KEY `TYPE` (`TYPE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8 COMMENT='字典表';

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
  KEY `dir_depID` (`DEPID`) USING BTREE,
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='部长表';

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
  KEY `enroll_stuID` (`STUID`) USING BTREE,
  KEY `enroll_depID` (`DEPID`) USING BTREE,
  CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`STUID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3192 DEFAULT CHARSET=utf8 COMMENT='报名信息表';

-- ----------------------------
-- Table structure for guide
-- ----------------------------
DROP TABLE IF EXISTS `guide`;
CREATE TABLE `guide` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUESTION` varchar(255) NOT NULL,
  `ANSWER` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  KEY `mail_r` (`RECEVIER`) USING BTREE,
  KEY `mail_s` (`SENDER`) USING BTREE,
  CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`RECEVIER`) REFERENCES `user` (`LOGNAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`SENDER`) REFERENCES `user` (`LOGNAME`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信表';

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
  KEY `met_depID` (`DEPID`) USING BTREE,
  KEY `met_memID` (`MEMID`) USING BTREE,
  CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_ibfk_2` FOREIGN KEY (`MEMID`) REFERENCES `member` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
  KEY `mem_stuID` (`STUID`) USING BTREE,
  KEY `mem_depID` (`DEPID`) USING BTREE,
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `member_ibfk_2` FOREIGN KEY (`STUID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='部门成员表';

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `CONTENT` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  KEY `ID` (`ID`) USING BTREE,
  KEY `LOGNAME` (`LOGNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

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
  KEY `LOGNAME` (`LOGNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8 COMMENT='用户表';

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
  KEY `work_workID` (`workID`) USING BTREE,
  KEY `work_memID` (`memID`) USING BTREE,
  CONSTRAINT `work_finished_ibfk_1` FOREIGN KEY (`memID`) REFERENCES `member` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `work_finished_ibfk_2` FOREIGN KEY (`workID`) REFERENCES `work_released` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作完成信息表';

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
  KEY `work_depID` (`DEPID`) USING BTREE,
  CONSTRAINT `work_released_ibfk_1` FOREIGN KEY (`DEPID`) REFERENCES `depart` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='工作信息表';

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
