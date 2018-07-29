package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Assn;
import com.lilinzhen.qduamapplication.Bean.Assn.AssnBean;
import com.lilinzhen.qduamapplication.Bean.Student.Student;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.HomePage.Article.ArticleManagementActivity;
import com.lilinzhen.qduamapplication.HomePage.Meeting.MeetingManagementActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityAssnManagementBinding;

import java.util.List;

public class AssnManagementActivity extends BaseActivity implements View.OnClickListener {

    private ActivityAssnManagementBinding binding;

    private SharedPreferences sharedPreferences;
    private String user_type;

    private Assn assn = new Assn();
    private Student student = new Student();

    /**
     * 标题栏右侧按钮监听器
     */
    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(AssnManagementActivity.this, AssnDetailActivity.class);
            startActivityForResult(intent, Constants.BACK_ASSN_SAVE);
        }
    };

    private DataHandler dataHandler = new DataHandler() {
        @Override
        public void dealDataString(Context context, String responseString) {
            dealString(context, responseString);
        }

        @Override
        public void SaveData() {

        }

        @Override
        public void flushData() {
            initControl();
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_assn_management);
        binding.setActivity(this);
        setTitle("社团管理");
        setTitleRight("新建", listener);
        initControl();//初始化控件
    }

    /**
     * 初始化控件
     */
    private void initControl() {
        sharedPreferences = getSharedPreferences("data", MODE_PRIVATE);
        user_type = sharedPreferences.getString(URL.user_type, " ");

        Intent intent = getIntent();
        //如果是通过intent开启的此活动，则获取所有可能获取到的Extra
        if(intent != null) {
            assn = (Assn) intent.getSerializableExtra("assn");
            student = (Student) intent.getSerializableExtra("student");
            stu_flag = intent.getBooleanExtra("stu_flag", false);
            arti_flag = intent.getBooleanExtra("arti_flag", false);
            enroll_flag = intent.getBooleanExtra("enroll_flag", false);
            overview_flag = intent.getBooleanExtra("overview_flag", false);
        }

        //角色检查
        if (user_type.equals("1") || overview_flag) {
            setTitle("社团概览");
            setTitleRight(null, null);
            binding.llDrawer.setVisibility(View.GONE);
        }

        if(student != null) { //如果存在学生实体，则获取该学生已加入的社团list
            student.setEnrolls(null);
            student.setMembers(null);
            String obj = new Gson().toJson(student);
            acquireList(this, obj, URL.url_Assn_stu_list, dataHandler);//获取数据
        } else { //如果不存在学生实体，则根据assn获取社团list
            String obj = new Gson().toJson(assn);
            acquireList(this, obj, URL.url_Assn_list, dataHandler);//获取数据
        }

        //右侧抽屉的搜索框监听
        binding.etAssnName.addTextChangedListener(new MyTextWatcher(binding.etAssnName));
        binding.etAssnLevel.addTextChangedListener(new MyTextWatcher(binding.etAssnLevel));
    }


    /**
     * 处理数据
     * @param context 上下文
     * @param responseString 服务器返回的数据
     */
    private void dealString(final Context context, String responseString) {
        AssnBean bean = new Gson().fromJson(responseString, AssnBean.class);
        CommonAdapter<Assn> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Assn> list = bean.getBody().getList();
            for(Assn assn : list) {
                if(assn.getDeparts().get(0).getUser().getExist_pic().equals("false"))
                    assn.getDeparts().get(0).getUser().setPic(null);
            }
            adapter = new CommonAdapter<>(this, list, R.layout.item_assn_list, BR.assn);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Assn entity = list.get(i);
                    if(arti_flag) { //只有学生控制台传了它进来，如果它为true，则跳转到文章管理活动
                        Intent intent = new Intent(context, ArticleManagementActivity.class);
                        intent.putExtra("assn", entity);
                        startActivity(intent);
                    } else if (enroll_flag) { //如果它为true，则是学生在报名的时候选择社团
                        entity.setDeparts(null);
                        Intent intent = new Intent();
                        intent.putExtra("assn", entity);
                        setResult(RESULT_OK, intent);
                        finish();
                    } else if (overview_flag) { //如果它为true，则是概览模式，跳转到部门管理活动，把部门管理也设置成概览模式
                        Intent intent = new Intent(context, DepartManagementActivity.class);
                        intent.putExtra("parent", entity);
                        intent.putExtra("overview_flag", overview_flag);
                        startActivity(intent);
                    } else {
                        Intent intent = new Intent(context, DepartManagementActivity.class);
                        intent.putExtra("parent", entity);
                        intent.putExtra("stu_flag", stu_flag); //如果它为true，则是学生访问，社团通讯录
                        startActivity(intent);
                    }
                }
            });
            binding.listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                @Override
                public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                    if(!TextUtils.isEmpty(user_type)) {
                        if (user_type.equals("3")) { //如果是管理员用户，添加长按删除操作
                            Assn entity = list.get(i);
                            String obj = new Gson().toJson(entity);
                            showDialog(context, obj, URL.url_Assn_del, dataHandler);
                            return true;
                        }
                    }
                    return true;

                }
            });
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_ASSN_SAVE:
                    initControl();
                    break;
                case Constants.BACK_ASSN_LEVEL:
                    AcquireMenuActivity.Dict dict = (AcquireMenuActivity.Dict) data.getSerializableExtra("dict");
                    assn.setLevel(dict.getLabel());
                    binding.setAssn(assn);
                    Log.d(TAG, "onActivityResult: "+dict.getValue());
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            //都是右侧抽屉里的控件
            case R.id.et_assn_level:
                Intent intent_level = new Intent(AssnManagementActivity.this, AcquireMenuActivity.class);
                AcquireMenuActivity.Dict dict = new AcquireMenuActivity.Dict();
                dict.setType(URL.dict_type_assn_level);
                receiveDictParams(intent_level, "选择级别", dict, Constants.BACK_ASSN_LEVEL);
                break;
            case R.id.rl_commit:
                initControl();
                binding.activityAssnManagement.closeDrawer(Gravity.RIGHT);
                binding.etAssnName.setText(null);
                binding.etAssnLevel.setText(null);
                break;
            case R.id.rl_cancel:
                binding.activityAssnManagement.closeDrawer(Gravity.RIGHT);
                break;
            default:
                break;
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
