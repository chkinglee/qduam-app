package com.lilinzhen.qduamapplication.HomePage.Main;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Article.Article;
import com.lilinzhen.qduamapplication.Bean.Assn.Assn;
import com.lilinzhen.qduamapplication.Bean.Assn.AssnBean;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.DepartBean;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Bean.Student.StudentBean;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.HomePage.Article.ArticleManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Assn.AssnManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Assn.DepartDMActivity;
import com.lilinzhen.qduamapplication.HomePage.Assn.DepartManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Assn.DirectorManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Assn.MemberManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Enroll.EnrollManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.LoginActivity;
import com.lilinzhen.qduamapplication.HomePage.Meeting.MeetingManagementActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.MyAppCompatActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityMainControlForAdminBinding;
import com.lilinzhen.qduamapplication.databinding.ActivityMainControlForDepBinding;
import com.lilinzhen.qduamapplication.databinding.ActivityMainControlForStuBinding;

import java.util.List;

public class MainControlActivity extends MyAppCompatActivity implements View.OnClickListener {

    private ActivityMainControlForStuBinding stuBinding;
    private ActivityMainControlForDepBinding depBinding;
    private ActivityMainControlForAdminBinding adminBinding;

    private SharedPreferences sharedPreferences;
    private String user_type;

    private Student student;
    private Depart depart;

    private DataHandler dataHandler = new DataHandler() {
        @Override
        public void dealDataString(Context context, String responseString) {
            //根据用户类型处理服务器返回的数据
            if(user_type.equals("1")) {
                dealDataStringForStu(responseString);
            }
            if(user_type.equals("2")) {
                dealDataStringForDep(responseString);
            }
            if(user_type.equals("3")) {
                dealDataStringForAdmin(responseString);
            }

        }

        @Override
        public void SaveData() {

        }

        @Override
        public void flushData() {

        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //读取缓存
        sharedPreferences = getSharedPreferences("data", MODE_PRIVATE);
        user_type = sharedPreferences.getString(URL.user_type, "");

        //检查用户类型，根据用户类型显示不同控制台界面
        if(user_type.equals("1")) {
            stuBinding = DataBindingUtil.setContentView(this, R.layout.activity_main_control_for_stu);
            stuBinding.setActivity(this);
            initStu(); //初始化学生
        }
        if(user_type.equals("2")) {
            depBinding = DataBindingUtil.setContentView(this, R.layout.activity_main_control_for_dep);
            depBinding.setActivity(this);
            initDep(); //初始化部门
        }
        if(user_type.equals("3")) {
            adminBinding = DataBindingUtil.setContentView(this, R.layout.activity_main_control_for_admin);
            adminBinding.setActivity(this);
            initAdmin(); //初始化管理员
        }
        if(TextUtils.isEmpty(user_type)) {
            stuBinding = DataBindingUtil.setContentView(this, R.layout.activity_main_control_for_stu);
            stuBinding.setActivity(this);
        }
    }

    /**
     * 学生控制台
     */
    private void initStu() {
        student = new Student();
        //从缓存中获取学生id
        student.setId(sharedPreferences.getString(URL.user_student_id, ""));
        if(TextUtils.isEmpty(student.getId())) { //如果获取不到，说明有问题
            Toast.makeText(this, "获取数据失败，请重新登录", Toast.LENGTH_SHORT);
            return;
        }
        String obj = new Gson().toJson(student);
        acquireList(this, obj, URL.url_Student_get, dataHandler);
    }

    /**
     * 部门控制台
     */
    private void initDep() {
        depart = new Depart();
        //从缓存中获取部门id
        depart.setId(sharedPreferences.getString(URL.user_depart_id, ""));
        if(TextUtils.isEmpty(depart.getId())) { //如果获取不到，说明有问题
            Toast.makeText(this, "获取数据失败，请重新登录", Toast.LENGTH_SHORT).show();
            return;
        }
        String obj = new Gson().toJson(depart);
        acquireList(this, obj, URL.url_Depart_get, dataHandler);
    }

    /**
     * 管理员控制台
     */
    private void initAdmin() {
        Assn assn = new Assn();
        //管理员只须获取社团list来加载顶部信息
        String obj = new Gson().toJson(assn);
        acquireList(this, obj, URL.url_Assn_list, dataHandler);
    }

    /**
     * 处理学生数据
     * @param responseString 服务器返回数据
     */
    private void dealDataStringForStu(String responseString) {
        StudentBean bean = new Gson().fromJson(responseString, StudentBean.class);
        if (bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {
            Log.d(TAG, "dealString: 数据加载成功");
            List<Student> list = bean.getBody().getList();
            student = list.get(0);
            stuBinding.tvControlStuAssn.setText("" + student.getMembers().size());
            stuBinding.tvControlStuAssnMem.setText(student.getFriendsnum());
        }
    }

    /**
     * 处理部门数据
     * @param responseString 服务器返回数据
     */
    private void dealDataStringForDep(String responseString) {
        DepartBean bean = new Gson().fromJson(responseString, DepartBean.class);
        if (bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {
            Log.d(TAG, "dealString: 数据加载成功");
            List<Depart> list = bean.getBody().getList();
            depart = list.get(0);
            depBinding.tvControlDepDepDir.setText("" + depart.getDirectors().size());
            depBinding.tvControlDepDepMem.setText("" + depart.getMembers().size());
        }
    }

    /**
     * 处理管理员数据
     * @param responseString 服务器返回数据
     */
    private void dealDataStringForAdmin(String responseString) {
        AssnBean bean = new Gson().fromJson(responseString, AssnBean.class);
        if (bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {
            Log.d(TAG, "dealString: 数据加载成功");
            List<Assn> list = bean.getBody().getList();
            Integer num = 0;
            for(Assn assn : list) {
                num += assn.getMembercount();
            }
            Log.d(TAG, "dealDataStringForAdmin: " + list.size() + num);
            adminBinding.tvControlAdminAssnNum.setText("" + list.size());
            adminBinding.tvControlAdminMemNum.setText("" + num);
        }
    }

    @Override
    public void onClick(View view) {
        Intent intent;
        Assn assn = new Assn();
        if(TextUtils.isEmpty(user_type)) {
            Toast.makeText(MainControlActivity.this, "未登录或登录超时，请重新登录", Toast.LENGTH_SHORT).show();
            return;
        }

        switch (view.getId()) {
            //社团概览
            //校级社团
            case R.id.ll_control_assn_1:
                assn.setLevel("校级");
                intent = new Intent(MainControlActivity.this, AssnManagementActivity.class);
                intent.putExtra("assn", assn);
                intent.putExtra("overview_flag", true);
                startActivity(intent);
                break;
            //院级社团
            case R.id.ll_control_assn_2:
                assn.setLevel("院级");
                intent = new Intent(MainControlActivity.this, AssnManagementActivity.class);
                intent.putExtra("assn", assn);
                intent.putExtra("overview_flag", true);
                startActivity(intent);
                break;
            //兴趣社团
            case R.id.ll_control_assn_3:
                assn.setLevel("社联级");
                intent = new Intent(MainControlActivity.this, AssnManagementActivity.class);
                intent.putExtra("assn", assn);
                intent.putExtra("overview_flag", true);
                startActivity(intent);
                break;
            //快速入口
            //学生端
            //学生端加入社团
            case R.id.ll_control_stu_enroll:
                intent = new Intent(MainControlActivity.this, EnrollManagementActivity.class);
                intent.putExtra("student", student);
                startActivity(intent);
                break;
            //学生端社团通讯录
            case R.id.ll_control_stu_assn_mem:
                intent = new Intent(MainControlActivity.this, AssnManagementActivity.class);
                intent.putExtra("student", student);
                intent.putExtra("stu_flag", true);
                startActivity(intent);
                break;
            //学生端部门小伙伴
            case R.id.ll_control_stu_dep_mem:
                intent = new Intent(MainControlActivity.this, DepartManagementActivity.class);
                intent.putExtra("student", student);
                intent.putExtra("stu_flag", true);
                startActivity(intent);
                break;
            //学生端社团新闻
            case R.id.ll_control_stu_assn_news:
                intent = new Intent(MainControlActivity.this, AssnManagementActivity.class);
                intent.putExtra("student", student);
                intent.putExtra("arti_flag", true);
                startActivity(intent);
                break;
            //学生端会议管理
            case R.id.ll_control_stu_meeting:
                intent = new Intent(MainControlActivity.this, DepartManagementActivity.class);
                intent.putExtra("student", student);
                intent.putExtra("meet_flag", true);
                startActivity(intent);
                break;
            //部门端
            //部门端招录管理
            case R.id.ll_control_dep_enroll:
                intent = new Intent(MainControlActivity.this, EnrollManagementActivity.class);
                intent.putExtra("depart", depart);
                intent.putExtra("dep_flag", true);
                startActivity(intent);
                break;
            //部门端社团通讯录
            case R.id.ll_control_dep_assn_mem:
                intent = new Intent(MainControlActivity.this, DepartManagementActivity.class);
                intent.putExtra("parent", depart.getAssn());
                intent.putExtra("dep_flag", true);
                startActivity(intent);
                break;
            //部门端部门小伙伴
            case R.id.ll_control_dep_dep_mem:
                intent = new Intent(MainControlActivity.this, DepartDMActivity.class);
                intent.putExtra("parent", depart);
                startActivity(intent);
                break;
            //部门端社团新闻
            case R.id.ll_control_dep_news:
                intent = new Intent(MainControlActivity.this, ArticleManagementActivity.class);
                intent.putExtra("depart", depart);
                intent.putExtra("assn", depart.getAssn());
                intent.putExtra("dep_flag", true);
                startActivity(intent);
                break;
            //部门端部门管理
            case R.id.ll_control_dep_dep:
                if(depart.getLevel().equals("普通")) {
                    Toast.makeText(MainControlActivity.this, "对不起，您没有该接口访问权限", Toast.LENGTH_SHORT).show();
                    return;
                } else {
                    intent = new Intent(MainControlActivity.this, DepartManagementActivity.class);
                    intent.putExtra("parent", depart.getAssn());
                    startActivity(intent);
                }
                break;
            //部门端部长团管理
            case R.id.ll_control_dep_dep_dir:
                intent = new Intent(MainControlActivity.this, DirectorManagementActivity.class);
                intent.putExtra("parent", depart);
                startActivity(intent);
                break;
            //部门端部员管理
            case R.id.ll_control_dep_dep_member:
                intent = new Intent(MainControlActivity.this, MemberManagementActivity.class);
                intent.putExtra("parent", depart);
                startActivity(intent);
                break;
            //部门端会议管理
            case R.id.ll_control_dep_dep_met:
                intent = new Intent(MainControlActivity.this, MeetingManagementActivity.class);
                intent.putExtra("depart", depart);
                startActivity(intent);
                break;
            //管理员端
            //管理员端社团管理
            case R.id.ll_control_admin_assn:
                intent = new Intent(MainControlActivity.this, AssnManagementActivity.class);
                Assn assn1 = new Assn();
                intent.putExtra("assn", assn1);
                startActivity(intent);
                break;
            //系统通知
            case R.id.ll_control_notice:
                intent = new Intent(MainControlActivity.this, ArticleManagementActivity.class);
                Article article = new Article();
                article.setSectionA("网站通知");
                article.setSectionB("网站通知");
                intent.putExtra("article", article);
                intent.putExtra("notice_flag", true);
                startActivity(intent);
                break;

            default:
                break;
        }
    }

}
