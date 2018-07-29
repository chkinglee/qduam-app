package com.lilinzhen.qduamapplication.Bean.Sys;

import android.databinding.BaseObservable;

import com.lilinzhen.qduamapplication.Bean.User.User;

import java.io.Serializable;

/**
 * Created by lilinzhen on 2018/5/1.
 */

public class Problem extends BaseObservable implements Serializable {

    private String id;
    private User user;
    private String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
