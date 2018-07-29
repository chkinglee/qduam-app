package com.lilinzhen.qduamapplication.Bean.Assn;

import android.databinding.BaseObservable;
import android.databinding.Bindable;

import com.lilinzhen.qduamapplication.BR;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lilinzhen on 2018/3/25.
 */

public class Assn extends BaseObservable implements Serializable{

    private String id;
    private String logname;		// 社团账号
    private String assnname;		// 社团名称
    private String director;		// 社团负责人
    private String phone;			// 社团负责人联系方式
    private String level;			// 社团级别
    private List<Depart> departs;	// 部门
    private Integer membercount;  // 部员数量

    @Bindable
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        notifyPropertyChanged(BR.id);
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
    public String getAssnname() {
        return assnname;
    }

    public void setAssnname(String assnname) {
        this.assnname = assnname;
        notifyPropertyChanged(BR.assnname);
    }

    @Bindable
    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
        notifyPropertyChanged(BR.director);
    }

    @Bindable
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
        notifyPropertyChanged(BR.phone);
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
    public List<Depart> getDeparts() {
        return departs;
    }

    public void setDeparts(List<Depart> departs) {
        this.departs = departs;
        notifyPropertyChanged(BR.departs);
    }

    @Bindable
    public Integer getMembercount() {
        return membercount;
    }

    public void setMembercount(Integer membercount) {
        this.membercount = membercount;
        notifyPropertyChanged(BR.membercount);
    }
}
