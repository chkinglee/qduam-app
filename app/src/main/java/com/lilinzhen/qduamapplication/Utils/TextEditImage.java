package com.lilinzhen.qduamapplication.Utils;

import android.content.Context;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.lilinzhen.qduamapplication.R;

/**
 * Created by lilinzhen on 2018/4/18.
 */

public class TextEditImage extends LinearLayout {

    private TextView textView_introduce;
    private EditText editText_content;
    private LinearLayout linearLayout_body;

    private String introduce;
    private String content;


    public TextEditImage(Context context) {
        super(context);
        initView(context);
    }

    public TextEditImage(Context context, AttributeSet attrs) {
        super(context, attrs);
        initTypedArray(context, attrs);
        initView(context);
    }

    public TextEditImage(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initTypedArray(context, attrs);
        initView(context);
    }

    private void initTypedArray(Context context, AttributeSet attrs) {
        TypedArray mTypedArray = context.obtainStyledAttributes(attrs, R.styleable.TextEditImage);
        introduce = mTypedArray.getString(R.styleable.TextEditImage_TBI_introduce);
        content = mTypedArray.getString(R.styleable.TextEditImage_TBI_content);
        //获取资源后要及时回收
        mTypedArray.recycle();
    }

    public void initView(Context context) {
        LayoutInflater.from(context).inflate(R.layout.view_text_edit_image, this, true);
        textView_introduce = (TextView) findViewById(R.id.textview_introduce);
        editText_content = (EditText) findViewById(R.id.edittext_content);
        linearLayout_body= (LinearLayout) findViewById(R.id.text_edit_image);
        setContent(content);
        setIntroduce(introduce);
    }
    public void setIntroduce(String introduce){
        if(!TextUtils.isEmpty(introduce)) {
            textView_introduce.setText(introduce);
        }
    }

    public void setContent(String content){
        if(!TextUtils.isEmpty(content)) {
            editText_content.setText(content);
        }
    }
    public void setBodyListener(OnClickListener onClickListener){
        linearLayout_body.setOnClickListener(onClickListener);
    }
}