package com.lilinzhen.qduamapplication.SuperClass;

import android.os.Bundle;
import android.support.annotation.LayoutRes;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.lilinzhen.qduamapplication.R;

/**
 * 设置标题栏的activity
 * Created by lilinzhen on 2017/11/24.
 */
public class BaseActivity extends MyAppCompatActivity {

    private TextView titleView;
    private LinearLayout finishView;
    private LinearLayout linearLayout;
    private TextView title_rightView;
    private ViewGroup viewGroup;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        super.setContentView(R.layout.activity_base_title);
        viewGroup = (ViewGroup) findViewById(android.R.id.content);

    }

    @Override
    public void setContentView(@LayoutRes int layoutResID) {
        init();//初始化控件
        View view = LayoutInflater.from(this).inflate(layoutResID, linearLayout, false);
        linearLayout.setId(android.R.id.content);
        viewGroup.setId(View.NO_ID);
        linearLayout.removeAllViews();
        linearLayout.addView(view);
    }

    /**
     * 初始化控件
     */
    public void init() {
        titleView = (TextView) findViewById(R.id.title);
        title_rightView = (TextView) findViewById(R.id.title_right);
        linearLayout = (LinearLayout) findViewById(R.id.linearlayout_body);

        finishView = (LinearLayout) findViewById(R.id.finish);
        finishView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });

    }

    /**
     * 设置模块标题栏标题
     * @param string
     */
    public void setTitle(String string) {
        titleView.setText(string);
    }

    /**
     * 设置标题栏右侧按钮
     * @param string
     * @param listener
     */
    public void setTitleRight(String string, onTitleRightClickListener listener) {
        title_rightView.setText(string);
        title_rightView.setOnClickListener(listener);
    }

    /**
     * 标题栏右侧按钮点击监听接口
     */
    public interface onTitleRightClickListener extends View.OnClickListener{
        @Override
        void onClick(View view);
    }

}
