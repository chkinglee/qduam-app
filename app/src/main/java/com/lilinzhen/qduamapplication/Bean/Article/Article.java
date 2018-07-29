package com.lilinzhen.qduamapplication.Bean.Article;

import android.databinding.BaseObservable;
import android.databinding.Bindable;

import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.User.User;

import java.io.Serializable;

/**
 * 文章实体
 * Created by lilinzhen on 2018/1/19.
 */
public class Article  extends BaseObservable implements Serializable{

    private String id;			// 编号
    private String title;		// 题目
    private String content;		// 内容
    private User user;		// 作者
    private String time;		// 发表时间
    private String sectionA;	//一级版块
    private String sectionB;	//二级板块

    @Bindable
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        notifyPropertyChanged(BR.id);
    }

    @Bindable
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
        notifyPropertyChanged(BR.title);
    }

    @Bindable
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
        notifyPropertyChanged(BR.content);
    }

    @Bindable
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
        notifyPropertyChanged(BR.time);
    }

    @Bindable
    public String getSectionA() {
        return sectionA;
    }

    public void setSectionA(String sectionA) {
        this.sectionA = sectionA;
        notifyPropertyChanged(BR.sectionA);
    }

    @Bindable
    public String getSectionB() {
        return sectionB;
    }

    public void setSectionB(String sectionB) {
        this.sectionB = sectionB;
        notifyPropertyChanged(BR.sectionB);
    }

    @Bindable
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
        notifyPropertyChanged(BR.user);
    }
}
