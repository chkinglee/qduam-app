package com.lilinzhen.qduamapplication.Bean.Student;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/5.
 */

public class StudentBean extends SuperBean {

    private StudentBody body;

    public StudentBody getBody() {
        return body;
    }

    public void setBody(StudentBody body) {
        this.body = body;
    }

    public class StudentBody {
        private List<Student> list;

        public List<Student> getList() {
            return list;
        }

        public void setList(List<Student> list) {
            this.list = list;
        }
    }
}
