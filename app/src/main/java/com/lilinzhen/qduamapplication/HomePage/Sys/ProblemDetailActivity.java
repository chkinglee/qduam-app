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
import com.lilinzhen.qduamapplication.Bean.Sys.Problem;
import com.lilinzhen.qduamapplication.Bean.User.User;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityProblemDetailBinding;

public class ProblemDetailActivity extends BaseActivity {

    private ActivityProblemDetailBinding binding;
    private User user = new User();
    private Problem problem = new Problem();

    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_problem_detail);
        setTitle("问题反馈");
        setTitleRight("提交", listener);
        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            user = (User) intent.getSerializableExtra("user");
            problem = (Problem) intent.getSerializableExtra("problem");
        }

        if(user != null) {
            if(problem == null) {
                problem = new Problem();
                problem.setUser(user);
            }
        }

        binding.setProblem(problem);

        binding.etProbelm.addTextChangedListener(new MyTextWatcher(binding.etProbelm));
    }

    private void checkET() {
        if (checkET(this, binding.etProbelm, "请填写问题描述")) {
            String obj = new Gson().toJson(problem);
            commitData(this, obj, URL.url_Problem_save);
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
                case R.id.et_probelm:
                    problem.setContent(text);
                    break;
                default:
                    break;
            }

        }
    }

}
