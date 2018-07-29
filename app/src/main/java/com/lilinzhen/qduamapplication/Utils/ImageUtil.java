package com.lilinzhen.qduamapplication.Utils;

import android.databinding.BindingAdapter;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;

/**
 * Created by lilinzhen on 2018/3/24.
 */

public class ImageUtil {
    // 下载一个图片 设置到ImageView
    @BindingAdapter({"imageUrl"})
    public static void loadImage(ImageView view, String url){
        if (url == null){
            view.setImageResource(R.mipmap.user_default);
        } else {
            // Glide代替Volley
            url = URL.head_URL_pic+url;
            Glide.with(view.getContext()).load(url).into(view);
        }
    }
}
