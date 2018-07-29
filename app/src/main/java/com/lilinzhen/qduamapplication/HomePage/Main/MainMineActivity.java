package com.lilinzhen.qduamapplication.HomePage.Main;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.DepartBean;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Bean.Student.StudentBean;
import com.lilinzhen.qduamapplication.Bean.User.User;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.HomePage.LoginActivity;
import com.lilinzhen.qduamapplication.HomePage.Sys.AboutUsActivity;
import com.lilinzhen.qduamapplication.HomePage.Sys.GuideManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Sys.ProblemManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.User.UserModifyInformationActivity;
import com.lilinzhen.qduamapplication.HomePage.User.UserModifyPasswordActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.MyAppCompatActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityMainMineBinding;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.RequestParams;
import com.loopj.android.http.TextHttpResponseHandler;

import cz.msebera.android.httpclient.Header;

public class MainMineActivity extends MyAppCompatActivity implements View.OnClickListener {

    private SharedPreferences sharedPreferences;
    private SharedPreferences.Editor editor;
    private ProgressDialog dialog;

    private ActivityMainMineBinding binding;
    private User user;
    private Student student;
    private Depart depart;

    private Boolean isLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main_mine);
        binding.setActivity(this);

        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        sharedPreferences = getSharedPreferences("data", MODE_PRIVATE);
        editor = sharedPreferences.edit();

        analyzeUser(null);//解析用户数据
    }

    /**
     * 解析用户数据
     * @param intent 返回的intent
     */
    private void analyzeUser(Intent intent) {
        user = new User();
        student = new Student();
        depart = new Depart();
        //配置缓存，如果intent存在，则user存在
        if(intent != null) {
            user = (User) intent.getSerializableExtra("user");
            editor.putString(URL.user_id, user.getId());
            editor.putString(URL.user_logname, user.getLogname());
            editor.putString(URL.user_password, user.getPassword());
            editor.putString(URL.user_name, user.getName());
            editor.putString(URL.user_type, user.getType());
            editor.putString(URL.user_pic, user.getPic());
            editor.putString(URL.user_pic_is_exist, user.getExist_pic());
            editor.putBoolean(URL.user_condition, true);
            editor.apply();
        }

        //根据缓存中的登陆状态设置登陆按钮的文字
        isLogin = sharedPreferences.getBoolean(URL.user_condition, false);
        if(isLogin) {
            //用户名、账号缓存加载，主要为了显示“我的”顶部区域的信息
            user.setId(sharedPreferences.getString(URL.user_id, ""));
            user.setName(sharedPreferences.getString(URL.user_name, "登录超时或未登录"));
            user.setLogname(sharedPreferences.getString(URL.user_logname, "请重新登录！"));
            user.setPassword(sharedPreferences.getString(URL.user_password, "123456"));
            user.setPic(sharedPreferences.getString(URL.user_pic, null));
            user.setType(sharedPreferences.getString(URL.user_type, "1"));
            if(sharedPreferences.getString(URL.user_pic_is_exist, "false").equals("false")) {
                user.setPic(null);
            }
            binding.setUser(user);
            binding.buttonLogin.setText(getString(R.string.login_logout));
        } else {
            user.setId(null);
            user.setName("登录超时或未登录");
            user.setLogname("请重新登录！");
            user.setPic(null);
            user.setType(null);
            user.setPassword(null);
            binding.setUser(user);
            binding.buttonLogin.setText(getString(R.string.login_login));
        }

        //根据缓存中的用户类型获取对应用户数据
        if(!TextUtils.isEmpty(sharedPreferences.getString(URL.user_type, ""))) {

            dialog = new ProgressDialog(this);
            dialog.setMessage(getString(R.string.acquire_infos));
            dialog.setCanceledOnTouchOutside(false);
            dialog.show();

            //如果是学生用户1，则获取学生信息
            if(sharedPreferences.getString(URL.user_type, "").equals("1")) {
                acquireUser(sharedPreferences.getString(URL.user_logname, ""), "1");//获取学生信息
            }
            //如果是部门用户2，则获取部门信息
            if(sharedPreferences.getString(URL.user_type, "").equals("2")) {
                acquireUser(sharedPreferences.getString(URL.user_logname, ""), "2");//获取部门信息
            }
            //如果是管理员用户3，则获取管理员信息
            if(sharedPreferences.getString(URL.user_type, "").equals("3")) {
                dialog.dismiss();
                binding.llMainMinePerson.setVisibility(View.GONE);
            }

        }
    }

    /**
     * 获取用户信息
     * @param logname 用户帐号
     * @param type 用户类型
     */
    private void acquireUser(String logname, final String type) {
        AsyncHttpClient client = new AsyncHttpClient();
        RequestParams params = new RequestParams();
        params.put(URL.login_logname, logname);
        params.put(URL.login_type, type);
        client.get(this, URL.url_User, params, new TextHttpResponseHandler() {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d(TAG, "onFailure: s="+responseString);
                Toast.makeText(MainMineActivity.this,"获取个人信息失败",Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }
            @Override
            public void onSuccess(int statusCode, Header[] headers, String responseString) {
                Log.d(TAG, "onSuccess: s=" + responseString);
                dealString(responseString, type); //处理服务器返回的数据
                dialog.dismiss();
            }
        });
    }

    /**
     * 处理数据
     * @param responseString 服务器返回的数据
     * @param type 用户类型
     */
    private void dealString(String responseString, String type) {
        Gson gson = new Gson();
        if(type.equals("1")) { //如果是学生用户，创建Student，把学生ID保存在缓存中
            StudentBean bean = gson.fromJson(responseString, StudentBean.class);
            if(bean != null
                    && !TextUtils.isEmpty(bean.getSuccess())
                    && bean.getSuccess().equals(URL.success)
                    && bean.getBody() != null
                    && bean.getBody().getList() != null) {
                student = bean.getBody().getList().get(0);
                editor.putString(URL.user_student_id, student.getId());
                editor.apply();
            }
        }
        if(type.equals("2")) { //如果是部门用户，创建Depart，把部门ID保存在缓存中
            DepartBean bean = gson.fromJson(responseString, DepartBean.class);
            if(bean != null
                    && !TextUtils.isEmpty(bean.getSuccess())
                    && bean.getSuccess().equals(URL.success)
                    && bean.getBody() != null
                    && bean.getBody().getList() != null) {
                depart = bean.getBody().getList().get(0);
                editor.putString(URL.user_depart_id, depart.getId());
                editor.apply();
            }
        }
    }

    /**
     * 修改用户信息
     */
    private void updatePerson() {

        //如果是学生用户1，则将学生实体传递到活动中
        if(sharedPreferences.getString(URL.user_type, "").equals("1")) {
            Intent intent = new Intent(this, UserModifyInformationActivity.class);
            intent.putExtra("student", student);
            startActivityForResult(intent, Constants.BACK_INFO_MODIFY);
        }
        //如果是部门用户2，则将部门实体传递到活动中
        if(sharedPreferences.getString(URL.user_type, "").equals("2")) {
            Intent intent = new Intent(this, UserModifyInformationActivity.class);
            intent.putExtra("depart", depart);
            startActivityForResult(intent, Constants.BACK_INFO_MODIFY);
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            //登录按钮点击事件
            case R.id.button_login:
                if(!isLogin) { //如果没登录，跳转到登录活动
                    Intent intent = new Intent(this, LoginActivity.class);
                    startActivityForResult(intent, Constants.BACK_LOGIN);
                } else { //如果登录了，则退出登录，清空缓存
                    editor.clear();
                    editor.apply();
                    analyzeUser(null);
                }
                break;
            //个人信息点击事件
            case R.id.ll_main_mine_person:
                if(!isLogin) {
                    Toast.makeText(this, getString(R.string.login_logging_timeout), Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    updatePerson(); //修改个人信息
                }
                break;
            //修改密码点击事件
            case R.id.ll_main_mine_ps:
                if(!isLogin) {
                    Toast.makeText(this, getString(R.string.login_logging_timeout), Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    Intent intent = new Intent(this, UserModifyPasswordActivity.class);
                    intent.putExtra("user", user);
                    startActivityForResult(intent, Constants.BACK_USER_SAVE);
                }
                break;
            //服务指南点击事件
            case R.id.ll_main_mine_service:
                if(!isLogin) {
                    Toast.makeText(this, getString(R.string.login_logging_timeout), Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    Intent intent = new Intent(this, GuideManagementActivity.class);
                    intent.putExtra("user", user);
                    startActivity(intent);
                }
                break;
            //问题反馈点击事件
            case R.id.ll_main_mine_problem:
                if(!isLogin) {
                    Toast.makeText(this, getString(R.string.login_logging_timeout), Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    Intent intent = new Intent(this, ProblemManagementActivity.class);
                    intent.putExtra("user", user);
                    startActivity(intent);
                }
                break;
            //关于我们点击事件
            case R.id.ll_main_mine_aboutus:
                if(!isLogin) {
                    Toast.makeText(this, getString(R.string.login_logging_timeout), Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    Intent intent = new Intent(this, AboutUsActivity.class);
                    startActivity(intent);
                }
                break;
            default:
                break;
        }
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_LOGIN:
                    analyzeUser(data);//解析用户数据
                    break;
                case Constants.BACK_INFO_MODIFY:
                    analyzeUser(null);
                    break;
                case Constants.BACK_USER_SAVE: //修改密码，重新登录
                    editor.putBoolean(URL.user_condition, false);
                    editor.apply();
                    analyzeUser(null);
                    Intent intent_login = new Intent(this, LoginActivity.class);
                    startActivityForResult(intent_login, Constants.BACK_LOGIN);
                    Toast.makeText(MainMineActivity.this, "请重新登录", Toast.LENGTH_SHORT).show();
                default:
                    break;
            }
        }
    }
}
