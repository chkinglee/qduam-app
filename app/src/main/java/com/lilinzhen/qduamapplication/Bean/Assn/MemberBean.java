package com.lilinzhen.qduamapplication.Bean.Assn;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/19.
 */
public class MemberBean extends SuperBean {

    private MemberBody body;

    public MemberBody getBody() {
        return body;
    }

    public void setBody(MemberBody body) {
        this.body = body;
    }

    public class MemberBody {
        private List<Member> list;

        public List<Member> getList() {
            return list;
        }

        public void setList(List<Member> list) {
            this.list = list;
        }
    }
}
