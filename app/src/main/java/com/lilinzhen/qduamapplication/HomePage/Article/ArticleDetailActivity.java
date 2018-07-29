package com.lilinzhen.qduamapplication.HomePage.Article;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;

import com.lilinzhen.qduamapplication.Bean.Article.Article;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityArticleDetailBinding;

/**
 * 文章详情Activity
 * Created by lilinzhen on 2018/2/15.
 */
public class ArticleDetailActivity extends BaseActivity {

    private ActivityArticleDetailBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_article_detail);
        setTitle("文章详情");
        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        Intent intent = getIntent();
        Article article = (Article) intent.getSerializableExtra("article");
        binding.setArticle(article);
        binding.webviewArticleContent.getSettings().setDefaultTextEncodingName("UTF-8");
        binding.webviewArticleContent.loadData(article.getContent(), "text/html; charset=UTF-8", null);
    }
}
