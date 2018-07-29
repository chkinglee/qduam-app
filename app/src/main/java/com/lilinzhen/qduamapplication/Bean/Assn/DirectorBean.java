package com.lilinzhen.qduamapplication.Bean.Assn;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/19.
 */
public class DirectorBean extends SuperBean {

    private DirectorBody body;

    public DirectorBody getBody() {
        return body;
    }

    public void setBody(DirectorBody body) {
        this.body = body;
    }

    public class DirectorBody {
        private List<Director> list;

        public List<Director> getList() {
            return list;
        }

        public void setList(List<Director> list) {
            this.list = list;
        }
    }
}
