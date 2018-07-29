package com.lilinzhen.qduamapplication.Bean.Meeting;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/4/28.
 */

public class MeetingBean extends SuperBean {

    private MeetingBdoy body;

    public MeetingBdoy getBody() {
        return body;
    }

    public void setBody(MeetingBdoy body) {
        this.body = body;
    }

    public class MeetingBdoy {
        private List<Meeting> list;

        public List<Meeting> getList() {
            return list;
        }

        public void setList(List<Meeting> list) {
            this.list = list;
        }
    }

}
