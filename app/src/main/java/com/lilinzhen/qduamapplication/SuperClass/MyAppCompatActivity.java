package com.lilinzhen.qduamapplication.SuperClass;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.ProgressDialog;
import android.app.TimePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TimePicker;
import android.widget.Toast;

import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.HomePage.Assn.DirectorManagementActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.Utils.CustomDialog;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.RequestParams;
import com.loopj.android.http.TextHttpResponseHandler;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import cz.msebera.android.httpclient.Header;

/**
 * MyAppCompatActivity
 * Created by lilinzhen on 2017/12/09.
 */

public class MyAppCompatActivity extends AppCompatActivity {

    public String TAG = "==================>";

    public Boolean stu_flag = false;    //学生标记，表示是由学生进行访问的
    public Boolean dep_flag = false;    //部门标记，表示是由部门进行访问的
    public Boolean admin_flag = false;  //管理员标记，表示是由管理员进行访问的
    public Boolean mem_flag = false;    //部员标记，表示获取部员list
    public Boolean meet_flag = false;   //会议标记，表示获取会议list
    public Boolean arti_flag = false;   //文章标记，表示获取文章list
    public Boolean assn_flag = false;   //社团标记，表示获取社团list
    public Boolean enroll_flag = false; //社团标记，表示获取报名list
    public Boolean overview_flag = false; //概览标记，表示社团概览模式
    public Boolean notice_flag = false; //通知标记，表示获取通知list
    public Boolean new_flag = false;    //新建标记，表示执行的是新建操作，至少传入new对象
    public Boolean update_flag = false; //修改标记，表示执行的是修改操作，至少传入old对象

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);//系统软键盘浮于APP上方

    }

    /**
     * 将状态栏设为透明
     */
    public void hideStatusBar() {
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
            Window window = getWindow();
            window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
            window.getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
            );
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.setStatusBarColor(Color.TRANSPARENT);
        }
    }

    /**
     * 接收字典参数
     * @param intent 传入AcquireMenuActivity的intent
     * @param title 启动AcquireMenuActivity对应视图的title
     * @param dict 要查询的字典数据
     * @param requestCode 请求代码
     */
    public void receiveDictParams(Intent intent, String title, AcquireMenuActivity.Dict dict, int requestCode) {
        intent.putExtra("title", title);
        intent.putExtra(URL.dict, dict);
        startActivityForResult(intent, requestCode);
    }


    /**
     * 获取数据列表
     * @param context 上下文
     * @param obj 传入url的参数
     * @param url 访问网络的url
     * @param dataHandler 用于处理访问成功时返回数据的handler
     */
    public void acquireList(final Context context, String obj, String url, final DataHandler dataHandler) {

        final ProgressDialog dialog = new ProgressDialog(context);
        dialog.setMessage(getString(R.string.acquire_list));
        dialog.setCanceledOnTouchOutside(false);
        dialog.show();

        RequestParams params = new RequestParams();
        params.put("obj", obj);

        final AsyncHttpClient client = new AsyncHttpClient();
        client.get(context, url, params, new TextHttpResponseHandler() {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d(TAG, "onFailure: 数据获取失败 s = "+responseString);
                Toast.makeText(context,"数据获取失败", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }

            @Override
            public void onSuccess(int statusCode, Header[] headers, String responseString) {
                Log.d(TAG, "onSuccess: 数据获取成功 s = "+responseString);
                dataHandler.dealDataString(context, responseString);//处理数据
                dialog.dismiss();
            }
        });
    }

    /**
     * 提交数据时检查EditText控件是否填写
     * @param context 上下文
     * @param editText 要检查的控件
     * @param text 提示文字
     * @return true|false
     */
    public Boolean checkET(Context context, EditText editText, String text) {
        if(TextUtils.isEmpty(editText.getText())){
            Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
            return false;
        } else
            return true;
    }


    /**
     * 数据提交
     * @param context 上下文
     * @param obj 提交的数据str
     * @param url 访问的网络url
     */
    public void commitData(final Context context, String obj, String url) {
        final ProgressDialog dialog = new ProgressDialog(this);
        dialog.setMessage(getString(R.string.commit));
        dialog.setCanceledOnTouchOutside(false);
        dialog.show();

        Log.d(TAG, "commitData: "+obj);
        RequestParams params = new RequestParams();
        params.put("obj", obj);

        AsyncHttpClient client = new AsyncHttpClient();
        client.get(context, url, params, new TextHttpResponseHandler() {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d(TAG, "onFailure: 保存失败 s="+responseString);
                Toast.makeText(context, "保存失败", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }
            @Override
            public void onSuccess(int statusCode, Header[] headers, String responseString) {
                Log.d(TAG, "onSuccess: 保存成功 s="+responseString);
                Toast.makeText(context, "保存成功", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
                setResult(RESULT_OK);
                finish();
            }
        });
    }


    /**
     * 打开日期选择器
     * @param context 当前内容
     * @param editText 要赋值的EditText
     * @param isNeedTime 是否需要继续选择时间
     */
    public void openDatePickerDialog(final Context context, final EditText editText, final Boolean isNeedTime) {
        final Calendar c = Calendar.getInstance();
        new DatePickerDialog(context, AlertDialog.THEME_HOLO_LIGHT, new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                c.set(year, monthOfYear, dayOfMonth);
                SimpleDateFormat df = new SimpleDateFormat( "yyyy-MM-dd" );
                String date = df.format(c.getTime());
                if(isNeedTime) {
                    openTimePickerDialog(context, editText, date);
                } else {
                    editText.setText(date);
                }
            }
        }, c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH)).show();
    }

    /**
     * 打开时间选择器
     * @param context 当前内容
     * @param editText 要赋值的EditText
     * @param date 时间前面的日期，如果只选择时间，则传入空值
     */
    public void openTimePickerDialog(Context context, final EditText editText, final String date) {
        final Calendar c = Calendar.getInstance();
        new TimePickerDialog(context, AlertDialog.THEME_HOLO_LIGHT, new TimePickerDialog.OnTimeSetListener() {
            @Override
            public void onTimeSet(TimePicker timePicker, int i, int i1) {
                String hour = i+"";
                String minute = i1+"";
                if(i<10) hour = "0"+hour;
                if(i1<10) minute = "0"+minute;
                String time = hour+":"+minute+":00";
                if(TextUtils.isEmpty(date)) {
                    editText.setText(time);
                } else {
                    editText.setText(date + " " + time);
                }
            }
        }, c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), true).show();
    }


    /**
     * 显示CustomDialog
     */
    public void showDialog(final Context context, final String obj, final String url, final DataHandler dataHandler) {
        final CustomDialog dialog = new CustomDialog(context);
        dialog.show();
        dialog.setHintText("确定要删除吗？");
        dialog.setLeftButton("取消", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        dialog.setRightButton("删除", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                delData(context, obj, url, dataHandler);
                dialog.dismiss();
            }
        });
    }

    public void delData(final Context context, String obj, String url, final DataHandler dataHandler) {
        final ProgressDialog dialog = new ProgressDialog(context);
        dialog.setMessage(getString(R.string.acquire_list));
        dialog.setCanceledOnTouchOutside(false);
        dialog.show();

        RequestParams params = new RequestParams();
        params.put("obj", obj);

        final AsyncHttpClient client = new AsyncHttpClient();
        client.get(context, url, params, new TextHttpResponseHandler() {
            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                Log.d(TAG, "onFailure: 数据删除失败 s = "+responseString);
                Toast.makeText(context,"数据删除失败", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }

            @Override
            public void onSuccess(int statusCode, Header[] headers, String responseString) {
                Log.d(TAG, "onSuccess: 数据删除成功 s = "+responseString);
                dataHandler.flushData();
                dialog.dismiss();
            }
        });

    }

}
