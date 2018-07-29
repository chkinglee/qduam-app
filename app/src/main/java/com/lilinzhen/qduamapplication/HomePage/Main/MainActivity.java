package com.lilinzhen.qduamapplication.HomePage.Main;

import android.app.ActivityGroup;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.RadioGroup;

import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.MyAppCompatActivity;

public class MainActivity extends ActivityGroup implements RadioGroup.OnCheckedChangeListener {

    private LinearLayout linearlayout_main_content;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);//系统软键盘浮于APP上方
        setContentView(R.layout.activity_main);
        initControl();//初始化控件
    }

    private void initControl() {
        RadioGroup radioGroup = (RadioGroup) findViewById(R.id.radiogroup_main);
        radioGroup.setOnCheckedChangeListener(this);
        linearlayout_main_content = (LinearLayout) findViewById(R.id.linearlayout_main_content);
        changeActivity("homepage", MainIndexActivity.class);
    }

    /**
     * 切换活动
     * @param id
     * @param c
     */
    private void changeActivity(String id, Class c) {
        linearlayout_main_content.removeAllViews();
        Window window = getLocalActivityManager().startActivity(id, new Intent(MainActivity.this, c).addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP));
        View view = window.getDecorView();
        LinearLayout.LayoutParams param = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT, LinearLayout.LayoutParams.FILL_PARENT);
        view.setLayoutParams(param);
        linearlayout_main_content.addView(view);
    }
    @Override
    public void onCheckedChanged(RadioGroup radioGroup, int i) {
        switch (i) {
            case R.id.radiobutton_homepage:
                changeActivity("homepage", MainIndexActivity.class);
                break;
            case R.id.radiobutton_control:
                changeActivity("control", MainControlActivity.class);
                break;
            case R.id.radiobutton_mine:
                changeActivity("mine", MainMineActivity.class);
        }
    }
}
