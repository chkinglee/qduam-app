package com.lilinzhen.qduamapplication.HomePage.User;

import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.User.User;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.Utils.AddViewUtil;

import java.util.Map;

/**
 * 用户修改密码activity
 * Created by lilinzhen on 2018/1/18.
 */
public class UserModifyPasswordActivity extends BaseActivity {

    private User user = new User();
    private EditText editText_old_password;
    private EditText editText_new_password;

    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET(); //检查控件是否填写
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_modify_password);
        setTitle("修改登录密码");
        setTitleRight("提交", listener);
        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        LinearLayout linearLayout_infos = (LinearLayout) findViewById(R.id.linearlayout_infos);

        Map<String, Object> map_old_password = AddViewUtil.addViewTextEdit_Hint(this, linearLayout_infos, getString(R.string.user_old_password), null, getString(R.string.input_required_hint), null);
        editText_old_password = (EditText) map_old_password.get(AddViewUtil.key_edittext_content);
        editText_old_password.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);

        AddViewUtil.addViewLine_1(this, linearLayout_infos);

        Map<String, Object> map_new_password = AddViewUtil.addViewTextEdit_Hint(this, linearLayout_infos, getString(R.string.user_new_password), null, getString(R.string.input_required_hint), null);
        editText_new_password = (EditText) map_new_password.get(AddViewUtil.key_edittext_content);
        editText_new_password.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);

        Intent intent = getIntent();
        if(intent != null) {
            user = (User) intent.getSerializableExtra("user");
        }
    }

    /**
     * 检查控件是否填写
     */
    private void checkET() {
        if(checkET(this, editText_old_password, "请输入旧密码"))
            if(checkET(this, editText_new_password, "请输入新密码")) {
                if (!user.getPassword().equals(editText_old_password.getText().toString())) {
                    Toast.makeText(this, "旧密码输入不正确，请重新输入", Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    user.setPassword(editText_new_password.getText().toString());
                    String obj = new Gson().toJson(user);
                    commitData(this, obj, URL.url_User_save);
                }
            }
    }
}
