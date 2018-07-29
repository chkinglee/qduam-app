package com.lilinzhen.qduamapplication.Bean.Assn;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/19.
 */
public class DepartBean extends SuperBean {

    private DepartBody body;

    public DepartBody getBody() {
        return body;
    }

    public void setBody(DepartBody body) {
        this.body = body;
    }

    public class DepartBody {
        private List<Depart> list;

        public List<Depart> getList() {
            return list;
        }

        public void setList(List<Depart> list) {
            this.list = list;
        }
    }
}
