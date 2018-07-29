package com.lilinzhen.qduamapplication.Bean.Enroll;

import android.databinding.BaseObservable;

import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Student.Student;

import java.io.Serializable;

/**
 * Created by lilinzhen on 2018/4/18.
 */

public class Enroll extends BaseObservable implements Serializable {

    private String id;
    private Student student;
    private Depart depart;
    private String intro;
    private String charact;
    private String wgive;
    private String wgain;
    private String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getCharact() {
        return charact;
    }

    public void setCharact(String charact) {
        this.charact = charact;
    }

    public String getWgive() {
        return wgive;
    }

    public void setWgive(String wgive) {
        this.wgive = wgive;
    }

    public String getWgain() {
        return wgain;
    }

    public void setWgain(String wgain) {
        this.wgain = wgain;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
