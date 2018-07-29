package com.lilinzhen.qduamapplication.Bean.Assn;

import android.databinding.BaseObservable;
import android.databinding.Bindable;

import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.User.User;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lilinzhen on 2018/3/25.
 */

public class Depart extends BaseObservable implements Serializable {

    private String id;
    private Assn assn;			// 所属社团
    private User user;         // 对应用户
    private String logname;	// 部门编号、登录账号
    private String depname;	// 部门名称
    private String level;		// 等级
    private String intro;
    private List<Director> directors;	// 部长团
    private List<Member> members;		// 学生

    @Bindable
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        notifyPropertyChanged(BR.id);
    }

    @Bindable
    public Assn getAssn() {
        return assn;
    }

    public void setAssn(Assn assn) {
        this.assn = assn;
        notifyPropertyChanged(BR.assn);
    }

    @Bindable
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
        notifyPropertyChanged(BR.user);
    }

    @Bindable
    public String getLogname() {
        return logname;
    }

    public void setLogname(String logname) {
        this.logname = logname;
        notifyPropertyChanged(BR.logname);
    }

    @Bindable
    public String getDepname() {
        return depname;
    }

    public void setDepname(String depname) {
        this.depname = depname;
        notifyPropertyChanged(BR.depname);
    }

    @Bindable
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
        notifyPropertyChanged(BR.level);
    }

    @Bindable
    public List<Director> getDirectors() {
        return directors;
    }

    public void setDirectors(List<Director> directors) {
        this.directors = directors;
        notifyPropertyChanged(BR.directors);
    }

    @Bindable
    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
        notifyPropertyChanged(BR.members);
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }
}
