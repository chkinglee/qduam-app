package com.lilinzhen.qduamapplication.Bean.User;

import android.databinding.BaseObservable;
import android.databinding.Bindable;

import java.io.Serializable;

/**
 * 用户实体
 * Created by lilinzhen on 2018/1/5.
 */
public class User extends BaseObservable implements Serializable {

    private String id;
    private String logname;
    private String password;
    private String name;
    private String type;
    private String pic;
    private String exist_pic;

    @Bindable
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Bindable
    public String getLogname() {
        return logname;
    }

    public void setLogname(String logname) {
        this.logname = logname;
    }

    @Bindable
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Bindable
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Bindable
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Bindable
   public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Bindable
    public String getExist_pic() {
        return exist_pic;
    }

    public void setExist_pic(String exist_pic) {
        this.exist_pic = exist_pic;
    }
}
