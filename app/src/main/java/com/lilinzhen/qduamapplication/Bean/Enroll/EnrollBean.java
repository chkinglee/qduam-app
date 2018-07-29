package com.lilinzhen.qduamapplication.Bean.Enroll;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/4/18.
 */

public class EnrollBean extends SuperBean {

    private EnrollBdoy body;

    public EnrollBdoy getBody() {
        return body;
    }

    public void setBody(EnrollBdoy body) {
        this.body = body;
    }

    public class EnrollBdoy {
        private List<Enroll> list;

        public List<Enroll> getList() {
            return list;
        }

        public void setList(List<Enroll> list) {
            this.list = list;
        }
    }

}
