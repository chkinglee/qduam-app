package com.lilinzhen.qduamapplication.Bean.Article;

import com.lilinzhen.qduamapplication.Bean.SuperBean;

import java.util.List;

/**
 * Created by lilinzhen on 2018/1/19.
 */
public class ArticleBean extends SuperBean {

    private ArticleBody body;

    public ArticleBody getBody() {
        return body;
    }

    public void setBody(ArticleBody body) {
        this.body = body;
    }

    public class ArticleBody {
        private List<Article> list;

        public List<Article> getList() {
            return list;
        }

        public void setList(List<Article> list) {
            this.list = list;
        }
    }
}
