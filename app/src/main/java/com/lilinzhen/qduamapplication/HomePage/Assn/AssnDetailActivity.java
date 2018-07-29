package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Assn.Assn;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityAssnDetailBinding;

public class AssnDetailActivity extends BaseActivity implements View.OnClickListener {

    private ActivityAssnDetailBinding binding;
    private AcquireMenuActivity.Dict dict;
    private Assn assn = new Assn();

    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET();//检查控件是否填写
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_assn_detail);
        binding.setActivity(this);
        setTitle("新建社团");
        setTitleRight("提交", listener);
        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        binding.etAssnLogname.addTextChangedListener(new MyTextWatcher(binding.etAssnLogname));
        binding.etAssnName.addTextChangedListener(new MyTextWatcher(binding.etAssnName));
        binding.etAssnDirector.addTextChangedListener(new MyTextWatcher(binding.etAssnDirector));
        binding.etAssnPhone.addTextChangedListener(new MyTextWatcher(binding.etAssnPhone));
    }

    /**
     * 检查控件是否已填写
     */
    private void checkET() {
        if (checkET(this, binding.etAssnLogname, "请填写社团编号"))
            if (checkET(this, binding.etAssnName, "请填写社团名称"))
                if (checkET(this, binding.etAssnDirector, "请填写负责人"))
                    if (checkET(this, binding.etAssnPhone, "请填写联系方式"))
                        if (checkET(this, binding.etAssnLevel, "请选择社团级别")) {
                            String obj = new Gson().toJson(assn);
                            commitData(this, obj, URL.url_Assn_save);
                        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.ll_assn_level:
            case R.id.et_assn_level:
                Intent intent_level = new Intent(AssnDetailActivity.this, AcquireMenuActivity.class);
                AcquireMenuActivity.Dict dict = new AcquireMenuActivity.Dict();
                dict.setType(URL.dict_type_assn_level);
                receiveDictParams(intent_level, "选择级别", dict, Constants.BACK_ASSN_LEVEL);
                break;
            default:
                break;

        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            dict = (AcquireMenuActivity.Dict) data.getSerializableExtra("dict");

            switch (requestCode) {
                case Constants.BACK_ASSN_LEVEL:
                    assn.setLevel(dict.getLabel());
                    binding.setAssn(assn);
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
                case R.id.et_assn_logname:
                    assn.setLogname(text);
                    break;
                case R.id.et_assn_name:
                    assn.setAssnname(text);
                    break;
                case R.id.et_assn_director:
                    assn.setDirector(text);
                    break;
                case R.id.et_assn_phone:
                    assn.setPhone(text);
                    break;
                case R.id.et_assn_level:
                    assn.setLevel(text);
                    break;
                default:
                    break;
            }

        }
    }
}
