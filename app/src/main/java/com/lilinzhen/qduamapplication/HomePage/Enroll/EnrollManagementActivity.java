package com.lilinzhen.qduamapplication.HomePage.Enroll;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Enroll.Enroll;
import com.lilinzhen.qduamapplication.Bean.Enroll.EnrollBean;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityEnrollManagementBinding;

import java.util.List;

public class EnrollManagementActivity extends BaseActivity implements TabLayout.OnTabSelectedListener {

    private ActivityEnrollManagementBinding binding;
    private SharedPreferences sharedPreferences;
    private String user_type;

    private Depart depart = new Depart();
    private Student student = new Student();
    private Enroll enroll = new Enroll();

    /**
     * 标题栏右侧按钮监听器
     */
    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(EnrollManagementActivity.this, EnrollDetailActivity.class);
            if(student != null )
                intent.putExtra("student", student);
            startActivityForResult(intent, Constants.BACK_ENROLL_SAVE);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_enroll_management);
        setTitle("报名管理");

        binding.tl.addTab(binding.tl.newTab().setText("全部"), true);
        binding.tl.addTab(binding.tl.newTab().setText("待审核"));
        binding.tl.addTab(binding.tl.newTab().setText("审核通过"));
        binding.tl.addTab(binding.tl.newTab().setText("初试通过"));
        binding.tl.addTab(binding.tl.newTab().setText("复试通过"));
        binding.tl.addTab(binding.tl.newTab().setText("审核淘汰"));
        binding.tl.addTab(binding.tl.newTab().setText("初试淘汰"));
        binding.tl.addTab(binding.tl.newTab().setText("复试淘汰"));
        binding.tl.setOnTabSelectedListener(this);

        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            depart = (Depart) intent.getSerializableExtra("depart");
            student = (Student) intent.getSerializableExtra("student");
        }

        if(depart != null) {
            depart.setDirectors(null);
            depart.setMembers(null);
            enroll.setDepart(depart);
        }
        if(student != null) {
            student.setEnrolls(null);
            student.setMembers(null);
            enroll.setStudent(student);
            setTitleRight("添加", listener);
        }

        String obj = new Gson().toJson(enroll);
        acquireList(this, obj, URL.url_Enroll_list, dataHandler);//获取报名数据

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
        EnrollBean bean = new Gson().fromJson(responseString, EnrollBean.class);
        CommonAdapter<Enroll> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Enroll> list = bean.getBody().getList();
            for(Enroll enroll : list) {
                if(enroll.getDepart().getUser().getExist_pic().equals("false")) {
                    enroll.getDepart().getUser().setPic(null);
                }
            }

            adapter = new CommonAdapter<>(context, list, R.layout.item_enroll_list, BR.enroll);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Enroll entity = list.get(i);
                    Intent intent = new Intent(EnrollManagementActivity.this, EnrollDetailActivity.class);
                    intent.putExtra("enroll", entity);
                    if(depart != null) {
                        intent.putExtra("dep_flag", true);
                    }
                    if(student != null) {
                        intent.putExtra("stu_flag", true);
                    }
                    startActivityForResult(intent, Constants.BACK_ENROLL_SAVE);
                }
            });
            binding.listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                @Override
                public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Enroll entity = list.get(i);
                    return true;
                }
            });
        }

    }



    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_ENROLL_SAVE:
                    initControl();
                    break;
                default:
                    break;
            }
        }
    }


    @Override
    public void onTabSelected(TabLayout.Tab tab) {
        String obj;
        switch (tab.getPosition()) {
            case 0:
                enroll.setStatus(null);
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            case 1:
                enroll.setStatus("待审核");
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            case 2:
                enroll.setStatus("审核通过");
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            case 3:
                enroll.setStatus("初试通过");
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            case 4:
                enroll.setStatus("复试通过");
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            case 5:
                enroll.setStatus("审核淘汰");
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            case 6:
                enroll.setStatus("初试淘汰");
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            case 7:
                enroll.setStatus("复试淘汰");
                obj = new Gson().toJson(enroll);
                acquireList(EnrollManagementActivity.this, obj, URL.url_Enroll_list, dataHandler);
                break;
            default:
                break;
        }
    }

    @Override
    public void onTabUnselected(TabLayout.Tab tab) {

    }

    @Override
    public void onTabReselected(TabLayout.Tab tab) {

    }


}
