package com.lilinzhen.qduamapplication.Environment;

import android.os.Environment;

/**
 * Created by lilinzhen on 2017/3/7.
 */
public class URL {

    private static final String ip = "39.106.198.129:8080" ;//阿里云服务器

    private static final String head_URL = "http://" + ip + "/qduam/app/";

    public static final String head_URL_pic = "http://" + ip + "/qduam/image/pic/";

    public static final String success = "true";

    /**
     * 图片缓存路径
     */
    public static final String cache_path = Environment.getExternalStorageDirectory() + "/qduam/piccache";
    /**
     * 登录界面：登录接口。
     * 参数：logname、password
     * 返回值：当success返回true时，表示登录成功；否则登录不成功
     */
    public static final String url_Login = head_URL + "user/login";
    public static final String login_logname = "logname";
    public static final String login_password = "password";
    public static final String login_remember = "remember";
    public static final String login_type = "type";

    /**
     * 用户数据
     */
    public static final String user_id = "user_id";
    public static final String user_logname = "user_logname";
    public static final String user_password = "user_password";
    public static final String user_name = "user_name";
    public static final String user_type = "user_type";
    public static final String user_pic = "user_pic";
    public static final String user_condition = "user_condition";
    public static final String user_pic_is_exist = "user_pic_is_exist";

    public static final String user_student_id = "user_student_id";
    public static final String user_depart_id = "user_depart_id";

    /**
     * 获取用户数据接口
     */
    public static final String url_User = head_URL + "user/user";
    public static final String url_User_save = head_URL + "user/user/save";


    /**
     * 学生接口
     */
    public static final String url_Student_get = head_URL + "student/get";
    public static final String url_Student_list = head_URL + "student/list";
    public static final String url_Student_save = head_URL + "student/save";

    /**
     * 文章接口
     */
    public static final String url_Article_list = head_URL + "article/list";
    public static final String url_Article_assn_list = head_URL + "article/assn/list";
    public static final String url_Article_save = head_URL + "article/save";
    public static final String url_Article_del = head_URL + "article/del";

    /**
     * 社团接口
     */
    public static final String url_Assn_list = head_URL + "assn/assn/list";
    public static final String url_Assn_stu_list = head_URL + "assn/assn/stu/list";
    public static final String url_Assn_save = head_URL + "assn/assn/save";
    public static final String url_Assn_del = head_URL + "assn/assn/del";

    /**
     * 部门接口
     */
    public static final String url_Depart_get = head_URL + "assn/depart/get";
    public static final String url_Depart_list = head_URL + "assn/depart/list";
    public static final String url_Depart_stu_list = head_URL + "assn/depart/stu/list";
    public static final String url_Depart_save = head_URL + "assn/depart/save";
    public static final String url_Depart_del = head_URL + "assn/depart/del";

    /**
     * 部长接口
     */
    public static final String url_Director_list = head_URL + "assn/director/list";
    public static final String url_Director_save = head_URL + "assn/director/save";
    public static final String url_Director_del = head_URL + "assn/director/del";

    /**
     * 部员接口
     */
    public static final String url_Member_list = head_URL + "assn/member/list";
    public static final String url_Member_del = head_URL + "assn/member/del";

    /**
     * 会议接口
     */
    public static final String url_Meeting_list = head_URL + "meeting/list";
    public static final String url_Meeting_del = head_URL + "meeting/del";
    public static final String url_Meeting_save = head_URL + "meeting/save";

    /**
     * 报名接口
     */
    public static final String url_Enroll_list = head_URL + "enroll/list";
    public static final String url_Enroll_save = head_URL + "enroll/save";

    /**
     * 服务指南接口
     */
    public static final String url_Guide_list = head_URL + "sys/guide/list";
    public static final String url_Guide_save = head_URL + "sys/guide/save";

    /**
     * 问题反馈接口
     */
    public static final String url_Problem_list = head_URL + "sys/problem/list";
    public static final String url_Problem_save = head_URL + "sys/problem/save";

    /**
     * 获取字典菜单接口
     */
    public static final String url_dict = head_URL + "sys/dict/list" ;
    public static final String dict = "dict" ;

    public static final String dict_type_sex = "sex";
    public static final String dict_type_nation = "nation";
    public static final String dict_type_grade = "grade";
    public static final String dict_type_department = "department";
    public static final String dict_type_major = "major";

    public static final String dict_type_assn_level = "assn";
    public static final String dict_type_direc_level = "direc";
    public static final String dict_type_seca = "arti_seca";
    public static final String dict_type_secb = "arti_secb";

}