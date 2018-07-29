package com.lilinzhen.qduamapplication.HomePage.Sys;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Sys.Guide;
import com.lilinzhen.qduamapplication.Bean.User.User;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityGuideDetailBinding;

public class GuideDetailActivity extends BaseActivity {

    private ActivityGuideDetailBinding binding;
    private User user = new User();
    private Guide guide = new Guide();

    private BaseActivity.onTitleRightClickListener listener = new BaseActivity.onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_guide_detail);
        setTitle("服务指南");
        setTitleRight("提交", listener);
        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            user = (User) intent.getSerializableExtra("user");
            guide = (Guide) intent.getSerializableExtra("guide");
        }

        if(user != null) {
            if(!user.getType().equals("3")) {
                setTitleRight(null, null);
                binding.etGuideQ.setEnabled(false);
                binding.etGuideA.setEnabled(false);
            }
        }

        if(guide == null) {
            guide = new Guide();
        }

        binding.setGuide(guide);

        binding.etGuideQ.addTextChangedListener(new MyTextWatcher(binding.etGuideQ));
        binding.etGuideA.addTextChangedListener(new MyTextWatcher(binding.etGuideA));
    }

    private void checkET() {
        if (checkET(this, binding.etGuideQ, "请填写Q"))
            if (checkET(this, binding.etGuideA, "请填写A"))  {
                String obj = new Gson().toJson(guide);
                commitData(this, obj, URL.url_Guide_save);
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
                case R.id.et_guide_q:
                    guide.setQuestion(text);
                    break;
                case R.id.et_guide_a:
                    guide.setAnswer(text);
                    break;
                default:
                    break;
            }

        }
    }

}
