package com.lilinzhen.qduamapplication.Bean.Meeting;

import android.databinding.BaseObservable;

import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.Member;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;

import java.io.Serializable;

public class Meeting extends BaseObservable implements Serializable {

    private String id;
    private Depart depart;  //部门id
    private Member member;  //会议记录人
    private String theme;   //会议主题
    private String time;    //会议时间
    private String room;    //会议地点
    private String shouldNum;   //应到人数
    private String eventNum;    //请假人数
    private String realNum;     //实到人数
    private String notNum;  //无故未到人数
    private String note;    //会议纪要

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getShouldNum() {
        return shouldNum;
    }

    public void setShouldNum(String shouldNum) {
        this.shouldNum = shouldNum;
    }

    public String getEventNum() {
        return eventNum;
    }

    public void setEventNum(String eventNum) {
        this.eventNum = eventNum;
    }

    public String getRealNum() {
        return realNum;
    }

    public void setRealNum(String realNum) {
        this.realNum = realNum;
    }

    public String getNotNum() {
        return notNum;
    }

    public void setNotNum(String notNum) {
        this.notNum = notNum;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
