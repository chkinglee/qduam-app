package com.lilinzhen.qduamapplication.Bean.Assn;

import android.databinding.BaseObservable;
import android.databinding.Bindable;

import com.lilinzhen.qduamapplication.BR;

import java.io.Serializable;

/**
 * Created by lilinzhen on 2018/3/25.
 */

public class Director extends BaseObservable implements Serializable {

    private String id;
    private Depart depart;	// 所属部门
    private String name;	// 部长姓名
    private String phone;	// 联系方式
    private String level;	// 职务
    private String sex;	// 性别

    @Bindable
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        notifyPropertyChanged(BR.id);

    }

    @Bindable
    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
        notifyPropertyChanged(BR.depart);
    }

    @Bindable
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
        notifyPropertyChanged(BR.name);
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
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
        notifyPropertyChanged(BR.sex);
    }
}
