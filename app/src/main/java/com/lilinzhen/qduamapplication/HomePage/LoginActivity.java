package com.lilinzhen.qduamapplication.HomePage;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.User.User;
import com.lilinzhen.qduamapplication.Bean.User.UserBean;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.MyAppCompatActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityLoginBinding;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.RequestParams;
import com.loopj.android.http.TextHttpResponseHandler;

import cz.msebera.android.httpclient.Header;

/**
 * 登陆Acitivity
 * Created by lilinzhen on 2018/1/5.
 */
public class LoginActivity extends MyAppCompatActivity implements View.OnClickListener {


    private ActivityLoginBinding binding;
    private User user = new User();

    private SharedPreferences preferences;
    private SharedPreferences.Editor editor;
    private boolean isRemember;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_login);
        binding.setActivity(this);

        hideStatusBar();//将状态栏设为透明

        preferences = PreferenceManager.getDefaultSharedPreferences(this);
        editor = preferences.edit();

        //判断是否记住密码
        isRemember = preferences.getBoolean(URL.login_remember, false);
        if(isRemember) { //如果记住密码，则将账号密码保存到缓存中
            user.setLogname(preferences.getString(URL.login_logname, ""));
            user.setPassword(preferences.getString(URL.login_password, ""));
            binding.setUser(user);
            binding.ivLoginRememberPassword.setImageResource(R.mipmap.login_remember_check);
        }

    }

    /**
     * 修改是否记住密码的状态
     */
    private void changeIsRemeber() {
        if (isRemember) {
            binding.ivLoginRememberPassword.setImageResource(R.mipmap.login_remember_uncheck);
            isRemember = false;
        } else {
            binding.ivLoginRememberPassword.setImageResource(R.mipmap.login_remember_check);
            isRemember = true;
        }
    }

    /**
     * 检查用户名和密码是否已输入
     */
    private void checkUsernameAndPassword() {
        final ProgressDialog dialog = new ProgressDialog(this);
        dialog.setMessage(getString(R.string.login_logging));
        dialog.setCanceledOnTouchOutside(false);
        dialog.show();
        String logname = binding.etLoginLogname.getText().toString();
        String password = binding.etLoginPassword.getText().toString();
        if(TextUtils.isEmpty(logname)){
            Toast.makeText(this, R.string.login_import_username, Toast.LENGTH_SHORT).show();
            dialog.dismiss();
            return;
        } else if(TextUtils.isEmpty(password)){
            Toast.makeText(this, R.string.login_import_password, Toast.LENGTH_SHORT).show();
            dialog.dismiss();
            return;
        }
        login(logname, password, dialog);//登陆操作
    }

    /**
     * 登陆操作，与服务器数据做匹配
     */
    private void login(final String logname, final String password, final ProgressDialog dialog) {

        AsyncHttpClient client = new AsyncHttpClient();
        RequestParams params = new RequestParams();
        params.put(URL.login_logname, logname);
        params.put(URL.login_password, password);
        client.get(this, URL.url_Login, params, new TextHttpResponseHandler() {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d(TAG, "onFailure: s="+responseString);
                Toast.makeText(LoginActivity.this, R.string.login_logging_failed, Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }

            @Override
            public void onSuccess(int statusCode, Header[] headers, String responseString) {
                Log.d(TAG, "onSuccess: s="+responseString);
                Gson gson = new Gson();
                UserBean userBean = gson.fromJson(responseString, UserBean.class);
                if(userBean.getMsg().equals("接口异常!")) {
                    Toast.makeText(LoginActivity.this, "服务器异常，正在重新登录", Toast.LENGTH_SHORT).show();
                    login(logname, password, dialog);
                }
                if(userBean.getMsg().equals("用户不存在")) {
                    Toast.makeText(LoginActivity.this, "用户不存在", Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                    return;
                }
                if(userBean.getMsg().equals("密码错误")) {
                    Toast.makeText(LoginActivity.this, "密码错误", Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                    return;
                }
                if(userBean.getMsg().equals("登录成功")) {
                    saveUsernameAndPassword(logname, password);//保存用户名和密码
                    Toast.makeText(LoginActivity.this, "登录成功", Toast.LENGTH_SHORT).show();
                    Intent intent = new Intent();
                    User user = userBean.getBody().getList().get(0);
                    intent.putExtra("user", user);
                    setResult(RESULT_OK, intent);
                    finish();
                    dialog.dismiss();
                }
            }
        });
    }

    /**
     * 保存用户名和密码
     */
    private void saveUsernameAndPassword(String logname, String password) {
        if (isRemember) {
            editor.putBoolean(URL.login_remember, true);
            editor.putString(URL.login_logname, logname);
            editor.putString(URL.login_password, password);
        } else {
            editor.clear();
        }
        editor.apply();
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.button_login:
                checkUsernameAndPassword();//检查用户名和密码是否已输入
                break;
            case R.id.ll_login_remember_password:
                changeIsRemeber();//修改是否记住密码的状态
                break;
            default:
                break;
        }
    }
}
