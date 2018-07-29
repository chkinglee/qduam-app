package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.content.Context;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.Director;
import com.lilinzhen.qduamapplication.Bean.Assn.DirectorBean;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityDirectorManagementBinding;

import java.util.List;

public class DirectorManagementActivity extends BaseActivity {

    private ActivityDirectorManagementBinding binding;

    /**
     * 标题栏右侧按钮点击事件，点击进入部长团管理（增删改查）界面
     */
    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(DirectorManagementActivity.this, DirectorDetailActivity.class);
            intent.putExtra("depart", depart);
            startActivityForResult(intent, Constants.BACK_DIREC_SAVE);
        }
    };

    private Depart depart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_director_management);
        setTitle("部长管理");
        setTitleRight("添加" , listener);
        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            depart = (Depart) intent.getSerializableExtra("parent");
        }
        if(depart != null) {
            depart.setMembers(null);
            depart.setDirectors(null);
        }
        Director director = new Director();
        director.setDepart(depart);
        String obj = new Gson().toJson(director);
        acquireList(this, obj, URL.url_Director_list, dataHandler);//获取部长数据

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
            initControl();
        }


    };


    private void dealString(final Context context, String responseString) {
        DirectorBean bean = new Gson().fromJson(responseString, DirectorBean.class);
        CommonAdapter<Director> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Director> list = bean.getBody().getList();

            adapter = new CommonAdapter<>(context, list, R.layout.item_director_list, BR.director);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Director entity = list.get(i);
                    Intent intent = new Intent(DirectorManagementActivity.this, DirectorDetailActivity.class);
                    intent.putExtra("director", entity);
                    intent.putExtra("dep_flag", true);
                    startActivityForResult(intent, Constants.BACK_DIREC_SAVE);
                }
            });
            binding.listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                @Override
                public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Director entity = list.get(i);
                    String obj = new Gson().toJson(entity);
                    showDialog(context, obj, URL.url_Director_del, dataHandler);
                    return true;
                }
            });
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_DIREC_SAVE:
                    initControl();
                    break;
                default:
                    break;
            }
        }
    }
}
