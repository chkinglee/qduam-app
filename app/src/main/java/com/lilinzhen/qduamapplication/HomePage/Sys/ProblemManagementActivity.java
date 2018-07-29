package com.lilinzhen.qduamapplication.HomePage.Sys;

import android.content.Context;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Sys.Problem;
import com.lilinzhen.qduamapplication.Bean.Sys.ProblemBean;
import com.lilinzhen.qduamapplication.Bean.User.User;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityProblemManagementBinding;

import java.util.List;

public class ProblemManagementActivity extends BaseActivity {

    private ActivityProblemManagementBinding binding;
    private User user = new User();
    
    private onTitleRightClickListener  listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(ProblemManagementActivity.this, ProblemDetailActivity.class);
            intent.putExtra("user", user);
            startActivityForResult(intent, Constants.BACK_PROBLEM_SAVE);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_problem_management);
        setTitle("问题反馈");
        setTitleRight("添加", listener);
        initControl();
    }
    
    private void initControl() {
        Intent intent = getIntent();
        if (intent != null) {
            user = (User) intent.getSerializableExtra("user");
        }

        Problem problem = new Problem();
        Log.d(TAG, "initControl: "+user.getType()+"**************************************************/*/*/*/*/*/");
        if(user != null) {
            if(!user.getType().equals("3")) {
                problem.setUser(user);
            }
        }
        
        String obj = new Gson().toJson(problem);
        Log.d(TAG, "initControl: "+obj);
        acquireList(this, obj, URL.url_Problem_list, dataHandler);
        
        
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
        ProblemBean bean = new Gson().fromJson(responseString, ProblemBean.class);
        CommonAdapter<Problem> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Problem> list = bean.getBody().getList();

            adapter = new CommonAdapter<>(context, list, R.layout.item_problem_list, BR.problem);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Problem entity = list.get(i);
                    Intent intent = new Intent(ProblemManagementActivity.this, ProblemDetailActivity.class);
                    intent.putExtra("problem", entity);
                    startActivityForResult(intent, Constants.BACK_PROBLEM_SAVE);
                }
            });
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_PROBLEM_SAVE:
                    initControl();
                    break;
                default:
                    break;
            }
        }
    }
}
