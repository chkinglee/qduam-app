package com.lilinzhen.qduamapplication.Bean.Assn;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/19.
 */
public class AssnBean extends SuperBean {

    private AssnBody body;

    public AssnBody getBody() {
        return body;
    }

    public void setBody(AssnBody body) {
        this.body = body;
    }

    public class AssnBody {
        private List<Assn> list;

        public List<Assn> getList() {
            return list;
        }

        public void setList(List<Assn> list) {
            this.list = list;
        }
    }
}
