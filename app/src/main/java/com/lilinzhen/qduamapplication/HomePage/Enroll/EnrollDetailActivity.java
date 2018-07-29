package com.lilinzhen.qduamapplication.HomePage.Enroll;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Assn.Assn;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Enroll.Enroll;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.HomePage.Assn.AssnManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Assn.DepartManagementActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityEnrollDetailBinding;
import com.lilinzhen.qduamapplication.databinding.ActivityEnrollDetailForDepBinding;

public class EnrollDetailActivity extends BaseActivity implements View.OnClickListener {

    private ActivityEnrollDetailBinding binding;
    private ActivityEnrollDetailForDepBinding depBinding;
    private AcquireMenuActivity.Dict dict;

    private Student student = new Student();
    private Enroll enroll = new Enroll();
    private Boolean dep_flag = false;
    private Boolean stu_flag = false;

    onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            if (!stu_flag)
                checkET();//检查各控件是否已填写
            else
                checkETForUpdate();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        initControl();
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            student = (Student) intent.getSerializableExtra("student");
            enroll = (Enroll) intent.getSerializableExtra("enroll");
            dep_flag = intent.getBooleanExtra("dep_flag", false);
            stu_flag = intent.getBooleanExtra("stu_flag", false);
        }

        if(student != null || stu_flag) {
            if(!stu_flag) {
                enroll = new Enroll();
                enroll.setStatus("待审核");
                enroll.setStudent(student);
            }
            binding = DataBindingUtil.setContentView(this, R.layout.activity_enroll_detail);
            binding.setActivity(this);
            binding.setEnroll(enroll);
            setTitle("报名信息");
            setTitleRight("提交", listener);

            binding.etEnrollCharact.addTextChangedListener(new MyTextWatcher(binding.etEnrollCharact));
            binding.etEnrollIntro.addTextChangedListener(new MyTextWatcher(binding.etEnrollIntro));
            binding.etEnrollWgain.addTextChangedListener(new MyTextWatcher(binding.etEnrollWgain));
            binding.etEnrollWgive.addTextChangedListener(new MyTextWatcher(binding.etEnrollWgive));

            if(stu_flag) {
                binding.llEnrollAssnLevel.setVisibility(View.GONE);
                binding.llEnrollAssnName.setVisibility(View.GONE);
                binding.llEnrollDepName.setVisibility(View.GONE);
            }

        }

        if(enroll != null) {
            if(dep_flag) {
                depBinding = DataBindingUtil.setContentView(this, R.layout.activity_enroll_detail_for_dep);
                depBinding.setActivity(this);
                depBinding.setEnroll(enroll);
                setTitle("报名信息");
            }
        }

    }

    /**
     * 检查控件
     */
    private void checkET() {
        if(checkET(this, binding.etAssnLevel, "请选择社团级别"))
            if (checkET(this, binding.etAssnName, "请选择社团名称"))
                if (checkET(this, binding.etDepDepname, "请选择部门名称"))
                    if (checkET(this, binding.etEnrollCharact, "请填写特长"))
                        if (checkET(this, binding.etEnrollIntro, "请填写自我介绍"))
                            if (checkET(this, binding.etEnrollWgive, "请填写期望付出"))
                                if (checkET(this, binding.etEnrollWgain, "请填写期望收获")) {
                                    String obj = new Gson().toJson(enroll);
                                    commitData(this, obj, URL.url_Enroll_save);
                                }
    }

    private void checkETForUpdate() {
        if (checkET(this, binding.etEnrollCharact, "请填写特长"))
            if (checkET(this, binding.etEnrollIntro, "请填写自我介绍"))
                if (checkET(this, binding.etEnrollWgive, "请填写期望付出"))
                    if (checkET(this, binding.etEnrollWgain, "请填写期望收获")) {
                        String obj = new Gson().toJson(enroll);
                        commitData(this, obj, URL.url_Enroll_save);
                    }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.ll_enroll_assn_level:
            case R.id.et_assn_level:
                Intent intent_level = new Intent(EnrollDetailActivity.this, AcquireMenuActivity.class);
                AcquireMenuActivity.Dict dict = new AcquireMenuActivity.Dict();
                dict.setType(URL.dict_type_assn_level);
                receiveDictParams(intent_level, "选择级别", dict, Constants.BACK_ASSN_LEVEL);
                break;
            case R.id.ll_enroll_assn_name:
            case R.id.et_assn_name:
                if(enroll.getDepart() == null) {
                    Toast.makeText(EnrollDetailActivity.this, "请选择社团级别", Toast.LENGTH_SHORT).show();;
                } else {
                    Intent intent = new Intent(EnrollDetailActivity.this, AssnManagementActivity.class);
                    intent.putExtra("assn", enroll.getDepart().getAssn());
                    intent.putExtra("enroll_flag", true);
                    startActivityForResult(intent, Constants.BACK_ASSN_NAME);
                }
                break;
            case R.id.ll_enroll_dep_name:
            case R.id.et_dep_depname:
                if(enroll.getDepart() == null || TextUtils.isEmpty(enroll.getDepart().getAssn().getAssnname())) {
                    Toast.makeText(EnrollDetailActivity.this, "请选择社团名称", Toast.LENGTH_SHORT).show();;
                } else {
                    Intent intent = new Intent(EnrollDetailActivity.this, DepartManagementActivity.class);
                    intent.putExtra("parent", enroll.getDepart().getAssn());
                    intent.putExtra("enroll_flag", true);
                    startActivityForResult(intent, Constants.BACK_DEP_NAME);
                }
                break;
            case R.id.tv_stu_info:
                if(depBinding.llStuInfo.getVisibility() == View.GONE) {
                    depBinding.tvStuInfo.setText("点击隐藏学生基本信息");
                    depBinding.llStuInfo.setVisibility(View.VISIBLE);
                } else if(depBinding.llStuInfo.getVisibility() == View.VISIBLE) {
                    depBinding.tvStuInfo.setText("点击查看学生基本信息");
                    depBinding.llStuInfo.setVisibility(View.GONE);
                }
                break;
            case R.id.rl_cancel:
                enroll.setDepart(null);
                enroll.setStudent(null);
                if(enroll.getStatus().equals("待审核")) {
                    enroll.setStatus("审核淘汰");
                    depBinding.setEnroll(enroll);
                    String obj = new Gson().toJson(enroll);
                    commitData(this, obj, URL.url_Enroll_save);
                } else if(enroll.getStatus().equals("审核通过")) {
                    enroll.setStatus("初试淘汰");
                    depBinding.setEnroll(enroll);
                    String obj = new Gson().toJson(enroll);
                    commitData(this, obj, URL.url_Enroll_save);
                } else if(enroll.getStatus().equals("初试通过")) {
                    enroll.setStatus("复试淘汰");
                    depBinding.setEnroll(enroll);
                    String obj = new Gson().toJson(enroll);
                    commitData(this, obj, URL.url_Enroll_save);
                } else {
                    finish();
                }
                break;
            case R.id.rl_commit:
                enroll.setDepart(null);
                enroll.setStudent(null);
                if(enroll.getStatus().equals("待审核")) {
                    enroll.setStatus("审核通过");
                    depBinding.setEnroll(enroll);
                    String obj = new Gson().toJson(enroll);
                    commitData(this, obj, URL.url_Enroll_save);
                } else if(enroll.getStatus().equals("审核通过")) {
                    enroll.setStatus("初试通过");
                    depBinding.setEnroll(enroll);
                    String obj = new Gson().toJson(enroll);
                    commitData(this, obj, URL.url_Enroll_save);
                } else if(enroll.getStatus().equals("初试通过")) {
                    enroll.setStatus("复试通过");
                    depBinding.setEnroll(enroll);
                    String obj = new Gson().toJson(enroll);
                    commitData(this, obj, URL.url_Enroll_save);
                } else {
                    finish();
                }
                break;

            default:
                break;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            dict = (AcquireMenuActivity.Dict) data.getSerializableExtra("dict");
            Depart depart = new Depart();
            Assn assn = new Assn();
            switch (requestCode) {
                case Constants.BACK_ASSN_LEVEL:
                    assn.setLevel(dict.getLabel());
                    depart.setAssn(assn);
                    enroll.setDepart(depart);
                    binding.setEnroll(enroll);
                    Log.d(TAG, "onActivityResult: "+dict.getValue());
                    break;
                case Constants.BACK_ASSN_NAME:
                    depart.setAssn((Assn) data.getSerializableExtra("assn"));
                    enroll.setDepart(depart);
                    binding.setEnroll(enroll);
                    break;
                case Constants.BACK_DEP_NAME:
                    depart = (Depart) data.getSerializableExtra("depart");
                    enroll.setDepart(depart);
                    binding.setEnroll(enroll);
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
                case R.id.et_enroll_charact:
                    enroll.setCharact(text);
                    break;
                case R.id.et_enroll_intro:
                    enroll.setIntro(text);
                    break;
                case R.id.et_enroll_wgain:
                    enroll.setWgain(text);
                    break;
                case R.id.et_enroll_wgive:
                    enroll.setWgive(text);
                    break;
                default:
                    break;
            }

        }
    }

}
