package com.lilinzhen.qduamapplication.HomePage.Sys;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;

public class AboutUsActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about_us);
        setTitle("关于我们");
    }
}
