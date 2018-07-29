package com.lilinzhen.qduamapplication.HomePage.User;

import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityUserModifyInformationForDepBinding;
import com.lilinzhen.qduamapplication.databinding.ActivityUserModifyInformationForStuBinding;

/**
 * 用户修改基础信息Activity
 * Created by lilinzhen on 2018/1/4.
 */

public class UserModifyInformationActivity extends BaseActivity implements View.OnClickListener{

    private ActivityUserModifyInformationForStuBinding stuBinding;
    private ActivityUserModifyInformationForDepBinding depBinding;
    private SharedPreferences sharedPreferences;
    private Student student;
    private Depart depart;

    onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET(); //检查控件是否填写
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        sharedPreferences = getSharedPreferences("data", MODE_PRIVATE);

        String user_type = sharedPreferences.getString(URL.user_type, "1");
        if(user_type.equals("1")) {
            stuBinding = DataBindingUtil.setContentView(this, R.layout.activity_user_modify_information_for_stu);
            stuBinding.setActivity(this);
            setTitle("个人信息");
        } else if(user_type.equals("2")) {
            depBinding = DataBindingUtil.setContentView(this, R.layout.activity_user_modify_information_for_dep);
            depBinding.setActivity(this);
            setTitle("部门信息");

        }
        setTitleRight("提交", listener);
        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            student = (Student) intent.getSerializableExtra("student");
            depart = (Depart) intent.getSerializableExtra("depart");
        }

        if(student != null) {
            stuBinding.setStudent(student);
            stuBinding.etStuDorm.addTextChangedListener(new MyTextWatcher(stuBinding.etStuDorm));
            stuBinding.etStuPhone.addTextChangedListener(new MyTextWatcher(stuBinding.etStuPhone));
            stuBinding.etStuQq.addTextChangedListener(new MyTextWatcher(stuBinding.etStuQq));
        }
        if(depart != null) {
            depBinding.setDepart(depart);
            depBinding.etDepIntro.addTextChangedListener(new MyTextWatcher(depBinding.etDepIntro));
        }

    }

    /**
     * 检查各控件是否已填写
     */
    private void checkET() {
        if(student != null) {
            if(checkET(this, stuBinding.etStuPhone, "请填写联系电话"))
                if (checkET(this, stuBinding.etStuQq, "请填写QQ号码"))
                    if (checkET(this, stuBinding.etStuDorm, "请填写宿舍地址")) {
                        student.setMembers(null);
                        student.setEnrolls(null);
                        String obj = new Gson().toJson(student);
                        commitData(this, obj, URL.url_Student_save);
                    }
        } else if(depart != null) {
            if(checkET(this, depBinding.etDepIntro, "请填写部门介绍")) {
                depart.setAssn(null);
                depart.setDirectors(null);
                depart.setMembers(null);
                String obj = new Gson().toJson(depart);
                commitData(this, obj, URL.url_Depart_save);
            }
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.tv_stu_info:
                if(stuBinding.llStuInfo.getVisibility() == View.GONE) {
                    stuBinding.tvStuInfo.setText("灰色部分信息不可修改，点击隐藏");
                    stuBinding.llStuInfo.setVisibility(View.VISIBLE);
                } else if(stuBinding.llStuInfo.getVisibility() == View.VISIBLE) {
                    stuBinding.tvStuInfo.setText("点击查看全部信息");
                    stuBinding.llStuInfo.setVisibility(View.GONE);
                }
                break;
            case R.id.tv_dep_info:
                if(depBinding.llDepInfo.getVisibility() == View.GONE) {
                    depBinding.tvDepInfo.setText("灰色部分信息不可修改，点击隐藏");
                    depBinding.llDepInfo.setVisibility(View.VISIBLE);
                } else if(depBinding.llDepInfo.getVisibility() == View.VISIBLE) {
                    depBinding.tvDepInfo.setText("点击查看全部信息");
                    depBinding.llDepInfo.setVisibility(View.GONE);
                }
                break;
            default:
                break;
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
                case R.id.et_stu_dorm:
                    student.setDorm(text);
                    break;
                case R.id.et_stu_qq:
                    student.setQqnumber(text);
                    break;
                case R.id.et_stu_phone:
                    student.setPhone(text);
                    break;
                case R.id.et_dep_intro:
                    depart.setIntro(text);
                    break;
                default:
                    break;
            }

        }
    }

}
