package com.lilinzhen.qduamapplication.HomePage.Main;

import android.content.Context;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Article.Article;
import com.lilinzhen.qduamapplication.Bean.Article.ArticleBean;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.HomePage.Article.ArticleDetailActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.MyAppCompatActivity;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityMainIndexBinding;

import java.util.List;

public class MainIndexActivity extends MyAppCompatActivity implements View.OnClickListener {

    private ActivityMainIndexBinding binding;
    private Article article = new Article();
    private String parentId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main_index);
        binding.setActivity(this);
        initControl();//初始化控件

    }

    /**
     * 初始化控件
     */
    private void initControl() {

        binding.etArtiSeca.addTextChangedListener(new MyTextWatcher(binding.etArtiSeca));
        binding.etArtiSecb.addTextChangedListener(new MyTextWatcher(binding.etArtiSecb));
        binding.etArtiTitle.addTextChangedListener(new MyTextWatcher(binding.etArtiTitle));

        String obj = new Gson().toJson(article);
        Log.d(TAG, "initControl: "+obj);
        acquireList(this, obj, URL.url_Article_list, dataHandler);
    }

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

        }
    };


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
                    Intent intent = new Intent(context, ArticleDetailActivity.class);
                    intent.putExtra("article", article);
                    startActivity(intent);
                }
            });
        }
    }

    @Override
    public void onClick(View view) {
        Intent intent;
        AcquireMenuActivity.Dict dict = new AcquireMenuActivity.Dict();
        switch (view.getId()) {
            case R.id.rl_cancel://橱子取消按钮
                binding.activityMainIndex.closeDrawer(Gravity.RIGHT);
                break;
            case R.id.rl_commit://橱子确定按钮
                initControl();
                binding.setArticle(null);
                binding.activityMainIndex.closeDrawer(Gravity.RIGHT);
                break;
            case R.id.et_arti_seca:
                intent = new Intent(MainIndexActivity.this, AcquireMenuActivity.class);
                dict.setType(URL.dict_type_seca);
                receiveDictParams(intent, "选择一级版块", dict, Constants.BACK_ARTI_SECA);
                article.setSectionB(null);
                binding.setArticle(article);
                break;
            case R.id.et_arti_secb:
                if (TextUtils.isEmpty(article.getSectionA())) {
                    Toast.makeText(MainIndexActivity.this, "请先选择一级版块", Toast.LENGTH_SHORT).show();
                } else {
                    intent = new Intent(MainIndexActivity.this, AcquireMenuActivity.class);
                    dict.setType(URL.dict_type_secb);
                    dict.setParentId(parentId);
                    receiveDictParams(intent, "选择二级版块", dict, Constants.BACK_ARTI_SECB);
                }
                break;
            default:
                break;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            AcquireMenuActivity.Dict dict = (AcquireMenuActivity.Dict) data.getSerializableExtra("dict");
            switch (requestCode) {
                case Constants.BACK_ARTI_SECA:
                    article.setSectionA(dict.getLabel());
                    parentId = dict.getId();
                    binding.setArticle(article);
                    Log.d(TAG, "onActivityResult: "+dict.getValue());
                    break;
                case Constants.BACK_ARTI_SECB:
                    article.setSectionB(dict.getLabel());
                    binding.setArticle(article);
                    Log.d(TAG, "onActivityResult: "+dict.getValue());
                    break;
                default:
                    break;
            }
        }
    }


    private class MyTextWatcher implements TextWatcher {

        private EditText editText;
        private MyTextWatcher(EditText editText) {
            this.editText = editText;
        }

        @Override
        public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

        }

        @Override
        public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

        }

        @Override
        public void afterTextChanged(Editable editable) {
            String text = editable.toString();
            switch (editText.getId()) {
                case R.id.et_arti_seca:
                    article.setSectionA(text);
                    break;
                case R.id.et_arti_secb:
                    article.setSectionB(text);
                    break;
                case R.id.et_arti_title:
                    article.setTitle(text);
                    break;
                default:
                    break;
            }

        }
    }

}
