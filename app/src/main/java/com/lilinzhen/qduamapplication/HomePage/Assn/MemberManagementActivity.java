package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.content.Context;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.Member;
import com.lilinzhen.qduamapplication.Bean.Assn.MemberBean;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityMemberManagementBinding;

import java.util.List;

public class MemberManagementActivity extends BaseActivity {

    private ActivityMemberManagementBinding binding;
    private Depart depart = new Depart();
    private Boolean met_flag = false;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_member_management);
        setTitle("部员管理");
        initControl();
    }
    
    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            depart = (Depart) intent.getSerializableExtra("parent");
            met_flag = intent.getBooleanExtra("met_flag", false);
        }
        if(depart != null) {
            depart.setMembers(null);
            depart.setDirectors(null);
            depart.setAssn(null);
        }
        Member member = new Member();
        member.setDepart(depart);
        String obj = new Gson().toJson(member);
        acquireList(this, obj, URL.url_Member_list, dataHandler);//获取部员数据

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
        MemberBean bean = new Gson().fromJson(responseString, MemberBean.class);
        CommonAdapter<Member> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Member> list = bean.getBody().getList();

            adapter = new CommonAdapter<>(context, list, R.layout.item_member_list, BR.member);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Member entity = list.get(i);
                    if(met_flag) {
                        entity.setDepart(null);
                        Student student =  entity.getStudent();
                        student.setMembers(null);
                        student.setEnrolls(null);
                        entity.setStudent(student);
                        Intent intent = new Intent();
                        intent.putExtra("member", entity);
                        setResult(RESULT_OK, intent);
                        finish();
                    } else {
                        Intent intent = new Intent(MemberManagementActivity.this, MemberDetailActivity.class);
                        intent.putExtra("member", entity);
                        startActivity(intent);
                    }
                }
            });
            binding.listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                @Override
                public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Member entity = list.get(i);
                    Student student = entity.getStudent();
                    student.setMembers(null);
                    student.setEnrolls(null);
                    entity.setStudent(student);
                    entity.setDepart(null);
                    String obj = new Gson().toJson(entity);
                    showDialog(context, obj, URL.url_Member_del, dataHandler);
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
