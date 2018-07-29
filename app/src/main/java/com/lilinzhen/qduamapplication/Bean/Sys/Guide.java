package com.lilinzhen.qduamapplication.Bean.Sys;

import android.databinding.BaseObservable;

import java.io.Serializable;

/**
 * Created by lilinzhen on 2018/5/1.
 */

public class Guide extends BaseObservable implements Serializable {

    private String id;
    private String question;
    private String answer;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
