package com.lilinzhen.qduamapplication.Bean.Assn;

import android.databinding.BaseObservable;
import android.databinding.Bindable;

import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Student.Student;

import java.io.Serializable;

/**
 * Created by lilinzhen on 2018/3/25.
 */

public class Member extends BaseObservable implements Serializable {

    private String id;
    private Student student;    // 对应学生
    private Depart depart;      // 所属部门
    private String appraise;    // 评价
    private String status;      // 状态

    @Bindable
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        notifyPropertyChanged(BR.id);
    }

    @Bindable
    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
        notifyPropertyChanged(BR.student);
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
    public String getAppraise() {
        return appraise;
    }

    public void setAppraise(String appraise) {
        this.appraise = appraise;
        notifyPropertyChanged(BR.appraise);
    }

    @Bindable
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
        notifyPropertyChanged(BR.status);
    }
}
