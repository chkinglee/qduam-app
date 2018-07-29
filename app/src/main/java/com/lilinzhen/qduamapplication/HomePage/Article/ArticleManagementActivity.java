package com.lilinzhen.qduamapplication.HomePage.Article;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Article.Article;
import com.lilinzhen.qduamapplication.Bean.Article.ArticleBean;
import com.lilinzhen.qduamapplication.Bean.Assn.Assn;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityArticleManagementBinding;

import java.util.List;

public class ArticleManagementActivity extends BaseActivity implements View.OnClickListener{

    private ActivityArticleManagementBinding binding;
    private SharedPreferences sharedPreferences;
    private String user_type;
    private Article article = new Article();
    private Assn assn = new Assn();
    private Depart depart = new Depart();

    /**
     * 标题栏右侧按钮监听器
     */
    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(ArticleManagementActivity.this, ArticleAddActivity.class);
            if(depart != null){
                intent.putExtra("depart", depart);
                intent.putExtra("dep_flag", true);
            }
            startActivityForResult(intent, Constants.BACK_ARTI_SAVE);
        }
    };

    private DataHandler dataHandler = new DataHandler() {
        @Override
        public void dealDataString(Context context, String responseString) {
            dealString(context, responseString);
        }

        @Override
        public void SaveData() {

        }

        @Override
        public void flushData() {
            initControl();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_article_management);
        binding.setActivity(this);
        setTitle("文章管理");
        setTitleRight("新建", listener);
        initControl();
    }

    private void initControl() {
        sharedPreferences = getSharedPreferences("data", MODE_PRIVATE);
        user_type = sharedPreferences.getString(URL.user_type, " ");

        Intent intent = getIntent();
        if(intent != null) {
            article = (Article) intent.getSerializableExtra("article");
            assn  = (Assn) intent.getSerializableExtra("assn");
            depart = (Depart) intent.getSerializableExtra("depart");
            notice_flag = intent.getBooleanExtra("notice_flag", false);
        }

        //角色检查
        if (user_type.equals("1") || notice_flag) {
            setTitle("文章列表");
            setTitleRight(null, null);
        }

        if(assn != null) { //它存在说明是根据社团查文章
            assn.setDeparts(null);
            String obj = new Gson().toJson(assn);
            acquireList(this, obj, URL.url_Article_assn_list, dataHandler);//获取数据
        } else {
            String obj = new Gson().toJson(article);
            Log.d(TAG, "initControl: " + obj);
            acquireList(this, obj, URL.url_Article_list, dataHandler);
        }

    }

    private void dealString(final Context context, String responseString) {
        Gson gson = new Gson();
        ArticleBean bean = gson.fromJson(responseString, ArticleBean.class);
        CommonAdapter<Article> adapter;
        if(bean != null
                && bean.getSuccess()!=null
                && bean.getSuccess().equals(URL.success)
                && bean.getBody()!=null
                && bean.getBody().getList()!=null) {

            final List<Article> list = bean.getBody().getList();
            for(Article article : list) {
                if(article.getUser().getExist_pic().equals("false")) {
                    article.getUser().setPic(null);
                }
            }
            adapter = new CommonAdapter<>(context, list, R.layout.item_article_list, BR.article);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Article article = list.get(i);
                    Intent intent_a_d = new Intent(context, ArticleDetailActivity.class);
                    intent_a_d.putExtra("article", article);
                    startActivity(intent_a_d);
                }
            });
        }
    }


    @Override
    public void onClick(View view) {

    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_ARTI_SAVE:
                    initControl();
                    break;
                default:
                    break;
            }
        }
    }

}
