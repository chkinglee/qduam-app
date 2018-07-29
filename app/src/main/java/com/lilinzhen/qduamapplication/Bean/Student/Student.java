package com.lilinzhen.qduamapplication.Bean.Student;

import android.databinding.BaseObservable;

import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Member;
import com.lilinzhen.qduamapplication.Bean.Enroll.Enroll;
import com.lilinzhen.qduamapplication.Bean.User.User;

import java.io.Serializable;
import java.util.List;

/**
 * 学生实体
 * Created by lilinzhen on 2018/1/5.
 */
public class Student extends BaseObservable implements Serializable {
    private String id;
    private String logname;		// 学号
    private String sex;			// 性别
    private String name;		// 姓名
    private String phone;		// 手机号码
    private String nation;		// 民族
    private String department;		// 学院
    private String grade;		// 年级
    private String birthday;	// 出生日期
    private String major;		// 专业
    private String dorm;		// 宿舍号
    private String qqnumber;	// QQ号
    private List<Member> members;
    private User user;
    private List<Enroll> enrolls;
    private String friendsnum;

    public String getLogname() {
        return logname;
    }

    public void setLogname(String logname) {
        this.logname = logname;
        notifyPropertyChanged(BR.logname);
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
        notifyPropertyChanged(BR.sex);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
        notifyPropertyChanged(BR.name);
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
        notifyPropertyChanged(BR.phone);
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
//        notifyPropertyChanged(BR.nation);
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getDorm() {
        return dorm;
    }

    public void setDorm(String dorm) {
        this.dorm = dorm;
    }

    public String getQqnumber() {
        return qqnumber;
    }

    public void setQqnumber(String qqnumber) {
        this.qqnumber = qqnumber;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Enroll> getEnrolls() {
        return enrolls;
    }

    public void setEnrolls(List<Enroll> enrolls) {
        this.enrolls = enrolls;
    }

    public String getFriendsnum() {
        return friendsnum;
    }

    public void setFriendsnum(String friendsnum) {
        this.friendsnum = friendsnum;
    }
}
