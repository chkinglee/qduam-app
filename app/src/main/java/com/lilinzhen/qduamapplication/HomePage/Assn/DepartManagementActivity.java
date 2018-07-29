package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Assn;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.DepartBean;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.HomePage.Meeting.MeetingManagementActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityDepartManagementBinding;

import java.util.List;

public class DepartManagementActivity extends BaseActivity {

    private ActivityDepartManagementBinding binding;
    private Assn assn = new Assn();
    private Student student = new Student();
    private Depart depart = new Depart();

    private SharedPreferences sharedPreferences;
    private String user_type;


    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(DepartManagementActivity.this, DepartDetailActivity.class);
            intent.putExtra("assn", assn);
            startActivityForResult(intent, Constants.BACK_DEP_SAVE);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_depart_management);
        setTitle("部门管理");
        setTitleRight("新建" , listener);
        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {

        sharedPreferences = getSharedPreferences("data", MODE_PRIVATE);
        user_type = sharedPreferences.getString(URL.user_type, " ");

        Intent intent = getIntent();
        if(intent != null) {
            assn = (Assn) intent.getSerializableExtra("parent");
            student = (Student) intent.getSerializableExtra("student");
            stu_flag = intent.getBooleanExtra("stu_flag", false);
            enroll_flag = intent.getBooleanExtra("enroll_flag", false);
            overview_flag = intent.getBooleanExtra("overview_flag", false);
            dep_flag = intent.getBooleanExtra("dep_flag", false);
            meet_flag = intent.getBooleanExtra("meet_flag", false);
        }

        if(assn != null) {
            assn.setDeparts(null);
        }

        //角色检查
        if(user_type.equals("1") || overview_flag || meet_flag) {
            setTitle("部门概览");
            setTitleRight(null, null);
        } else if (dep_flag) {
            setTitle("部门列表");
            setTitleRight(null, null);
        }

        if (depart != null) {
            depart.setAssn(assn);
        }

        if(student != null) {
            student.setEnrolls(null);
            student.setMembers(null);
            stu_flag = true;
            String obj = new Gson().toJson(student);
            acquireList(this, obj, URL.url_Depart_stu_list, dataHandler);//获取数据
        } else {
            String obj = new Gson().toJson(depart);
            Log.d(TAG, "initControl: "+obj);
            acquireList(this, obj, URL.url_Depart_list, dataHandler);//获取数据
        }

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
        DepartBean bean = new Gson().fromJson(responseString, DepartBean.class);
        CommonAdapter<Depart> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Depart> list = bean.getBody().getList();
            for(Depart depart : list) {
                if(depart.getUser().getExist_pic().equals("false"))
                    depart.getUser().setPic(null);
            }

            adapter = new CommonAdapter<>(context, list, R.layout.item_depart_list, BR.depart);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Depart entity = list.get(i);
                    if(!TextUtils.isEmpty(user_type)) {
                        //如果是学生用户，屏蔽点击操作
                        if (user_type.equals("1")) {
                            if(stu_flag) {  //如果有stu_flag为true，设置点击进入部门缩略
                                if (meet_flag) {
                                    Intent intent = new Intent(context, MeetingManagementActivity.class);
                                    intent.putExtra("depart", entity);
                                    intent.putExtra("mem_flag", true);
                                    intent.putExtra("stuid", student.getId());
                                    startActivity(intent);
                                } else {
                                    Intent intent = new Intent(context, DepartDMActivity.class);
                                    intent.putExtra("parent", entity);
                                    startActivity(intent);
                                }
                            } else if (enroll_flag) {   //如果有enroll_flag为true，设置点击进入报名列表
                                entity.setMembers(null);
                                entity.setDirectors(null);
                                Intent intent = new Intent();
                                intent.putExtra("depart", entity);
                                setResult(RESULT_OK, intent);
                                finish();
                            } else
                                return;
                        } else if (overview_flag){  //如果有overview_flag为true，屏蔽点击监听
                            return;
                        } else if (dep_flag){
                            Intent intent = new Intent(context, DepartDMActivity.class);
                            intent.putExtra("parent", entity);
                            startActivity(intent);
                        } else
                            return;
                    }
                }
            });
            binding.listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                @Override
                public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                    if(!TextUtils.isEmpty(user_type)) {
                        if (user_type.equals("1") || overview_flag || dep_flag) {   //如果是学生用户或概览模式，屏蔽长按删除操作
                            return true;
                        } else {
                            Depart entity = list.get(i);
                            String obj = new Gson().toJson(entity);
                            showDialog(context, obj, URL.url_Depart_del, dataHandler);
                            return true;
                        }
                    }
                    return true;
                }
            });
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch(requestCode) {
                case Constants.BACK_DEP_SAVE:
                    initControl();
                    break;
                default:
                    break;
            }
        }
    }
}
