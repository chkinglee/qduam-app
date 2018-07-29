package com.lilinzhen.qduamapplication.HomePage.Sys;

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
import com.lilinzhen.qduamapplication.Bean.Sys.Guide;
import com.lilinzhen.qduamapplication.Bean.Sys.GuideBean;
import com.lilinzhen.qduamapplication.Bean.User.User;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityGuideManagementBinding;

import java.util.List;

public class GuideManagementActivity extends BaseActivity {

    private ActivityGuideManagementBinding binding;
    private User user = new User();

    private BaseActivity.onTitleRightClickListener listener = new BaseActivity.onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(GuideManagementActivity.this, GuideDetailActivity.class);
            intent.putExtra("user", user);
            startActivityForResult(intent, Constants.BACK_GUIDE_SAVE);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_guide_management);
        setTitle("服务指南");
        setTitleRight("添加", listener);
        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();
        if (intent != null) {
            user = (User) intent.getSerializableExtra("user");
        }

        Guide guide = new Guide();
        if(user != null) {
            if(!user.getType().equals("3")) {
                setTitleRight(null, null);
            }
        }

        String obj = new Gson().toJson(guide);
        acquireList(this, obj, URL.url_Guide_list, dataHandler);


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

    private void dealString(Context context, String responseString) {
        GuideBean bean = new Gson().fromJson(responseString, GuideBean.class);
        CommonAdapter<Guide> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Guide> list = bean.getBody().getList();

            adapter = new CommonAdapter<>(context, list, R.layout.item_guide_list, BR.guide);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Guide entity = list.get(i);
                    Intent intent = new Intent(GuideManagementActivity.this, GuideDetailActivity.class);
                    intent.putExtra("guide", entity);
                    intent.putExtra("user", user);
                    startActivityForResult(intent, Constants.BACK_GUIDE_SAVE);
                }
            });
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_GUIDE_SAVE:
                    initControl();
                    break;
                default:
                    break;
            }
        }
    }
}
