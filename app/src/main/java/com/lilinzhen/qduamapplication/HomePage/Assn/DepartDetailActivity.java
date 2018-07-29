package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Assn.Assn;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityDepartDetailBinding;

public class DepartDetailActivity extends BaseActivity {

    private ActivityDepartDetailBinding binding;
    private Depart depart = new Depart();

    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_depart_detail);
        setTitle("创建部门");
        setTitleRight("提交", listener);
        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            Assn assn = (Assn) intent.getSerializableExtra("assn");
            depart.setAssn(assn);
            binding.setDepart(depart);
        }

        binding.etDepLogname.addTextChangedListener(new MyTextWatcher(binding.etDepLogname));
        binding.etDepDepname.addTextChangedListener(new MyTextWatcher(binding.etDepDepname));
    }

    private void checkET() {
        if (checkET(this, binding.etDepLogname, "请输入部门编号"))
            if (checkET(this, binding.etDepDepname, "请输入部门名称")) {
                String obj = new Gson().toJson(depart);
                commitData(this, obj, URL.url_Depart_save);
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
                case R.id.et_dep_logname:
                    depart.setLogname(text);
                    break;
                case R.id.et_dep_depname:
                    depart.setDepname(text);
                    break;
                default:
                    break;
            }

        }
    }

}
