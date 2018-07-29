package com.lilinzhen.qduamapplication.Environment;

import android.graphics.Color;
import android.os.Environment;

/**
 * startActivityForResult时的请求码
 * Created by lilinzhen on 2017/3/7.
 */
public class Constants {

    //登陆请求码
    public static final int BACK_LOGIN = 1;

    //修改个人/部门信息的请求码
    public static final int BACK_INFO_MODIFY = 2;

    //与个人信息相关的请求码
    public static final int BACK_SEX = 11;           //性别
    public static final int BACK_NATION = 12;        //民族
    public static final int BACK_GRADE = 13;         //年级
    public static final int BACK_DEPARTMENT = 14;    //院系
    public static final int BACK_MAJOR = 15;         //专业

    //与文章有关的请求码
    public static final int BACK_ARTI_SECA = 16;
    public static final int BACK_ARTI_SECB = 17;

    //与社团相关的请求码
    public static final int BACK_ASSN_LEVEL = 21;    //社团级别
    public static final int BACK_DIREC_LEVEL = 22;   //部长职务
    public static final int BACK_ASSN_NAME = 23;    //社团名称
    public static final int BACK_DEP_NAME = 24;     //部门名称
    public static final int BACK_MEM_NAME = 25;     //部员名称


    //保存数据的请求码
    public static final int BACK_ASSN_SAVE = 31;    //社团
    public static final int BACK_DEP_SAVE = 32;     //部门
    public static final int BACK_DIREC_SAVE = 33;   //部长
    public static final int BACK_USER_SAVE = 34;    //用户
    public static final int BACK_MEETING_SAVE = 35; //会议
    public static final int BACK_ENROLL_SAVE = 36;  //报名
    public static final int BACK_WORK_SAVE = 37;  //工作
    public static final int BACK_MAIL_SAVE = 38;  //站内信
    public static final int BACK_ARTI_SAVE = 39;    //社团
    public static final int BACK_PROBLEM_SAVE = 40;    //问题反馈
    public static final int BACK_GUIDE_SAVE = 41;    //服务指南





}
