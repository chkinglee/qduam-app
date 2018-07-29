package com.lilinzhen.qduamapplication.Bean.Sys;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/5.
 */

public class ProblemBean extends SuperBean {

    private ProblemBody body;

    public ProblemBody getBody() {
        return body;
    }

    public void setBody(ProblemBody body) {
        this.body = body;
    }

    public class ProblemBody {
        private List<Problem> list;

        public List<Problem> getList() {
            return list;
        }

        public void setList(List<Problem> list) {
            this.list = list;
        }
    }
}
