package com.lilinzhen.qduamapplication.Utils;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.lilinzhen.qduamapplication.R;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lilinzhen on 2018/1/5.
 */

public class AddViewUtil {

    /**
     * linearLayout添加横线，颜色#f2f2f2
     * “03”的意思是横线的宽度是1dp
     * @param context
     * @param linearLayout
     */
    public static void addViewLine_1(Context context, LinearLayout linearLayout){
        View view = LayoutInflater.from(context).inflate(R.layout.view_line_dddddd_1,null);
        linearLayout.addView(view);
    }

    /**
     * linearLayout添加横线，颜色#f2f2f2
     * “9”的意思是横线的宽度是9dp
     * @param context
     * @param linearLayout
     */
    public static void addViewLine_9(Context context, LinearLayout linearLayout){
        View view = LayoutInflater.from(context).inflate(R.layout.view_line_dddddd_9,null);
        linearLayout.addView(view);
    }

    //在界面填充map时，每个控件所对应的标记
    public static final String key_textview_introduce = "key_textview_introduce" ;
    public static final String key_edittext_content = "edittext_content" ;
    public static final String key_imageview_guide = "imageview_guide" ;

    /**
     * linearLayout添加view_text_edit_image布局，同时返回EditText，使在这个布局被点击的时候，可以往EditText中添加文字
     * @param context
     * @param linearLayout
     * @param introduce
     * @param editText
     * @param editTextHint
     * @param image
     * @param listener
     * @return
     */
    public static Map<String, Object> addViewTextEditImage(Context context, LinearLayout linearLayout, String introduce, String editText, String editTextHint, int image, View.OnClickListener listener){
        View view = LayoutInflater.from(context).inflate(R.layout.view_text_edit_image,null);
        TextView textview_introduce = (TextView) view.findViewById(R.id.textview_introduce);
        textview_introduce.setText(introduce);
        EditText edittext_content = (EditText) view.findViewById(R.id.edittext_content);
        edittext_content.setText(editText);
        edittext_content.setHint(editTextHint);
        edittext_content.setFocusable(false);
        edittext_content.setOnClickListener(listener);
        ImageView imageview_guide = (ImageView) view.findViewById(R.id.imageview_guide);
        imageview_guide.setImageResource(image);
        linearLayout.addView(view);
        view.setOnClickListener(listener);
        Map<String,Object> map = new HashMap<>();
        map.put(key_textview_introduce,textview_introduce);
        map.put(key_edittext_content,edittext_content);
        map.put(key_imageview_guide,imageview_guide);
        return map;
    }

    /**
     * linearLayout添加view_text_edit布局，同时返回EditText，使在这个布局被点击的时候，可以往EditText中添加文字
     * @param context
     * @param linearLayout
     * @param introduce
     * @param editText
     * @param editTextHint
     * @param listener
     * @return
     */
    public static Map<String, Object> addViewTextEdit_Hint(Context context, LinearLayout linearLayout, String introduce, String editText, String editTextHint, View.OnClickListener listener){
        View view = LayoutInflater.from(context).inflate(R.layout.view_text_edit,null);
        TextView textview_introduce = (TextView) view.findViewById(R.id.textview_introduce);
        textview_introduce.setText(introduce);
        EditText edittext_content = (EditText) view.findViewById(R.id.edittext_content);
        edittext_content.setText(editText);
        edittext_content.setHint(editTextHint);
        linearLayout.addView(view);
        view.setOnClickListener(listener);
        Map<String,Object> map = new HashMap<>();
        map.put(key_textview_introduce,textview_introduce);
        map.put(key_edittext_content,edittext_content);
        return map;
    }

}
