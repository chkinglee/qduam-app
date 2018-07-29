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
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.Director;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityDirectorDetailBinding;

public class DirectorDetailActivity extends BaseActivity implements View.OnClickListener{

    private ActivityDirectorDetailBinding binding;
    private AcquireMenuActivity.Dict dict;

    private Depart depart = new Depart();
    private Director director = new Director();
    private Boolean dep_flag = false;

    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_director_detail);
        binding.setActivity(this);
        setTitle("添加部长");
        setTitleRight("提交", listener);
        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            depart = (Depart) intent.getSerializableExtra("depart");
            director = (Director) intent.getSerializableExtra("director");
            dep_flag = intent.getBooleanExtra("dep_flag", false);
        }
        if(depart != null) {
            director = new Director();
            director.setDepart(depart);
            binding.setDirector(director);
        }
        if(dep_flag) {
            if(director != null) {
                binding.setDirector(director);
            }
        }

        binding.etDirecLevel.addTextChangedListener(new MyTextWatcher(binding.etDirecLevel));
        binding.etDirecName.addTextChangedListener(new MyTextWatcher(binding.etDirecName));
        binding.etDirecSex.addTextChangedListener(new MyTextWatcher(binding.etDirecSex));
        binding.etDirecPhone.addTextChangedListener(new MyTextWatcher(binding.etDirecPhone));
    }

    private void checkET() {
        if (checkET(this, binding.etDirecLevel, "请选择职务"))
            if (checkET(this, binding.etDirecName, "请填写姓名"))
                if (checkET(this, binding.etDirecSex, "请选择性别"))
                    if (checkET(this, binding.etDirecPhone, "请填写联系电话")) {
                        String obj = new Gson().toJson(director);
                        commitData(this, obj, URL.url_Director_save);
                    }

    }

    @Override
    public void onClick(View view) {
        AcquireMenuActivity.Dict dict = new AcquireMenuActivity.Dict();
        switch (view.getId()) {
            case R.id.ll_direc_level:
            case R.id.et_direc_level:
                Intent intent_level = new Intent(DirectorDetailActivity.this, AcquireMenuActivity.class);
                dict.setType(URL.dict_type_direc_level);
                receiveDictParams(intent_level, "选择职务", dict, Constants.BACK_DIREC_LEVEL);
                break;
            case R.id.ll_direc_sex:
            case R.id.et_direc_sex:
                Intent intent_sex = new Intent(DirectorDetailActivity.this, AcquireMenuActivity.class);
                dict.setType(URL.dict_type_sex);
                receiveDictParams(intent_sex, "选择性别", dict, Constants.BACK_SEX);
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
                case Constants.BACK_DIREC_LEVEL:
                    director.setLevel(dict.getLabel());
                    binding.setDirector(director);
                    Log.d(TAG, "onActivityResult: "+dict.getValue());
                    break;
                case Constants.BACK_SEX:
                    director.setSex(dict.getLabel());
                    binding.setDirector(director);
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
                case R.id.et_direc_level:
                    director.setLevel(text);
                    break;
                case R.id.et_direc_name:
                    director.setName(text);
                    break;
                case R.id.et_direc_sex:
                    director.setSex(text);
                    break;
                case R.id.et_direc_phone:
                    director.setPhone(text);
                    break;
                default:
                    break;
            }

        }
    }

}
