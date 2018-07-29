package com.lilinzhen.qduamapplication.Bean.Sys;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/5.
 */

public class GuideBean extends SuperBean {

    private GuideBody body;

    public GuideBody getBody() {
        return body;
    }

    public void setBody(GuideBody body) {
        this.body = body;
    }

    public class GuideBody {
        private List<Guide> list;

        public List<Guide> getList() {
            return list;
        }

        public void setList(List<Guide> list) {
            this.list = list;
        }
    }
}
