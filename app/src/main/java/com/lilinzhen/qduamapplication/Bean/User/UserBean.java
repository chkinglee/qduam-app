package com.lilinzhen.qduamapplication.Bean.User;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/5.
 */

public class UserBean extends SuperBean {
    private UserBody body;

    public UserBody getBody() {
        return body;
    }

    public void setBody(UserBody body) {
        this.body = body;
    }


    public class UserBody {
        private List<User> list;

        public List<User> getList() {
            return list;
        }

        public void setList(List<User> list) {
            this.list = list;
        }
    }
}
