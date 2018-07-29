package com.lilinzhen.qduamapplication.HomePage.Article;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.databinding.tool.util.L;
import android.net.Uri;
import android.provider.MediaStore;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.Editable;
import android.text.Selection;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Article.Article;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.HomePage.Main.MainIndexActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.Utils.RichEditor.RichEditor;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.RequestParams;
import com.loopj.android.http.TextHttpResponseHandler;

import org.w3c.dom.Text;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cz.msebera.android.httpclient.Header;

public class ArticleAddActivity extends AppCompatActivity implements View.OnClickListener {

    private InputMethodManager imm;//软键盘管理器
    private RelativeLayout rl_layout_editor;
    private ImageButton action_undo, action_redo, action_font, action_add;
    private RichEditor mEditor;
    private LinearLayout ll_layout_add, ll_layout_font;//添加布局，字体布局

    private LinearLayout ll_arti_secb;
    private EditText et_arti_title, et_arti_secb;
    private Boolean dep_flag, overview_flag, update_flag;
    private Article article = new Article();
    private Depart depart = new Depart();

    private String TAG = "==================>";


    private ImageButton ib_Bold, ib_Italic, ib_StrikeThough, ib_BlockQuote, ib_H1, ib_H2, ib_H3, ib_H4;
    private boolean flag1, flag2, flag3, flag4, flag5, flag6, flag7, flag8;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_article_add);
        setTitle("新文章");

        imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);

        initControl();//初始化控件

        initEvents();//初始化事件
    }

    /**
     * 初始化控件
     */
    private void initControl() {

        ll_arti_secb = (LinearLayout) findViewById(R.id.ll_arti_secb);
        ll_arti_secb.setOnClickListener(this);
        et_arti_secb = (EditText) findViewById(R.id.et_arti_secb);
        et_arti_secb.setOnClickListener(this);
        et_arti_title = (EditText) findViewById(R.id.et_arti_title);
        et_arti_title.setOnClickListener(this);

        TextView textView_title_right = (TextView) findViewById(R.id.title_right);
        textView_title_right.setOnClickListener(this);
        LinearLayout linearLayout_finish = (LinearLayout) findViewById(R.id.finish);
        linearLayout_finish.setOnClickListener(this);

        Intent intent = getIntent();
        if(intent != null) {
            depart = (Depart) intent.getSerializableExtra("depart");
            article = (Article) intent.getSerializableExtra("article");
            dep_flag = intent.getBooleanExtra("dep_flag", false);
            overview_flag = intent.getBooleanExtra("overview_flag", false);
            update_flag = intent.getBooleanExtra("update_flag", false);
        }

        if(update_flag) {
            if(article != null) {
                et_arti_title.setText(article.getTitle());
                et_arti_secb.setText(article.getSectionB());
                mEditor.setHtml(article.getContent());
            }
        } else {
            article = new Article();
            article.setUser(depart.getUser());
            if(dep_flag) {
                article.setSectionA("社团动态");
            } else {
                article.setSectionA("网站通知");
            }
        }







        initViews();
    }

    private void initViews() {
        //富文本编辑初始化
        mEditor = (RichEditor) findViewById(R.id.editor);
        mEditor.setEditorFontSize(15);
        mEditor.setPadding(10, 10, 10, 50);
        mEditor.setPlaceholder("请在此处编辑内容...");

        rl_layout_editor = (RelativeLayout) findViewById(R.id.rl_layout_editor);
        ll_layout_add = (LinearLayout) findViewById(R.id.ll_layout_add);
        ll_layout_font = (LinearLayout) findViewById(R.id.ll_layout_font);

        action_undo = (ImageButton) findViewById(R.id.action_undo);//撤回
        action_redo = (ImageButton) findViewById(R.id.action_redo);//重做
        action_font = (ImageButton) findViewById(R.id.action_font);//字体
        action_add = (ImageButton) findViewById(R.id.action_add);//添加

        //字体布局
        ib_Bold = (ImageButton) findViewById(R.id.action_bold);
        ib_Italic = (ImageButton) findViewById(R.id.action_italic);
        ib_StrikeThough = (ImageButton) findViewById(R.id.action_strikethrough);
        ib_BlockQuote = (ImageButton) findViewById(R.id.action_blockquote);
        ib_H1 = (ImageButton) findViewById(R.id.action_heading1);
        ib_H2 = (ImageButton) findViewById(R.id.action_heading2);
        ib_H3 = (ImageButton) findViewById(R.id.action_heading3);
        ib_H4 = (ImageButton) findViewById(R.id.action_heading4);

    }

    /**
     * 初始化事件
     */
    private void initEvents() {

        action_add.setOnClickListener(this);
        action_font.setOnClickListener(this);
        action_redo.setOnClickListener(this);
        action_undo.setOnClickListener(this);

        ib_Bold.setOnClickListener(this);
        ib_Italic.setOnClickListener(this);
        ib_StrikeThough.setOnClickListener(this);
        ib_BlockQuote.setOnClickListener(this);
        ib_H1.setOnClickListener(this);
        ib_H2.setOnClickListener(this);
        ib_H3.setOnClickListener(this);
        ib_H4.setOnClickListener(this);

        mEditor.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (hasFocus) {
                    imm.toggleSoftInput(0, InputMethodManager.SHOW_FORCED);
                    rl_layout_editor.setVisibility(View.VISIBLE);
//                    clickableType = 1;
                } else {
                    imm.hideSoftInputFromWindow(mEditor.getWindowToken(), 0); //强制隐藏键盘
                    rl_layout_editor.setVisibility(View.VISIBLE);
                }
            }
        });

        /**
         *获取点击出文本的标签类型
         */
        mEditor.setOnDecorationChangeListener(new RichEditor.OnDecorationStateListener() {
            @Override
            public void onStateChangeListener(String text, List<RichEditor.Type> types) {

                if (types.contains(RichEditor.Type.BOLD)) {
                    ib_Bold.setImageResource(R.mipmap.bold_l);
                    flag1 = true;
                    isBold = true;
                } else {
                    ib_Bold.setImageResource(R.mipmap.bold_d);
                    flag1 = false;
                    isBold = false;
                }

                if (types.contains(RichEditor.Type.ITALIC)) {
                    ib_Italic.setImageResource(R.mipmap.italic_l);
                    flag2 = true;
                    isItalic = true;
                } else {
                    ib_Italic.setImageResource(R.mipmap.italic_d);
                    flag2 = false;
                    isItalic = false;
                }

                if (types.contains(RichEditor.Type.STRIKETHROUGH)) {
                    ib_StrikeThough.setImageResource(R.mipmap.strikethrough_l);
                    flag3 = true;
                    isStrikeThrough = true;
                } else {
                    ib_StrikeThough.setImageResource(R.mipmap.strikethrough_d);
                    flag3 = false;
                    isStrikeThrough = false;
                }

                //块引用
                if (types.contains(RichEditor.Type.BLOCKQUOTE)) {
                    flag4 = true;
                    flag5 = false;
                    flag6 = false;
                    flag7 = false;
                    flag8 = false;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_l);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                } else {
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    flag4 = false;
                    isclick = false;
                }


                if (types.contains(RichEditor.Type.H1)) {
                    flag4 = false;
                    flag5 = true;
                    flag6 = false;
                    flag7 = false;
                    flag8 = false;

                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_l);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                } else {
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    flag5 = false;
                    isclick = false;
                }

                if (types.contains(RichEditor.Type.H2)) {
                    flag4 = false;
                    flag5 = false;
                    flag6 = true;
                    flag7 = false;
                    flag8 = false;

                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_l);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                } else {
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    flag6 = false;
                    isclick = false;
                }

                if (types.contains(RichEditor.Type.H3)) {
                    flag4 = false;
                    flag5 = false;
                    flag6 = false;
                    flag7 = true;
                    flag8 = false;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_l);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                } else {
                    ib_H4.setImageResource(R.mipmap.h3_d);
                    flag7 = false;
                    isclick = false;
                }

                if (types.contains(RichEditor.Type.H4)) {
                    flag4 = false;
                    flag5 = false;
                    flag6 = false;
                    flag7 = false;
                    flag8 = true;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_l);
                } else {
                    ib_H4.setImageResource(R.mipmap.h4_d);
                    flag8 = false;
                    isclick = false;
                }
            }
        });

        //布局全局改变监听
        rl_layout_editor.getViewTreeObserver().addOnGlobalLayoutListener(onGroupCollapseListener);


        /**
         * 插入分割线
         */
        findViewById(R.id.action_split).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mEditor.insertHr();
            }
        });


    }

    ViewTreeObserver.OnGlobalLayoutListener onGroupCollapseListener = new ViewTreeObserver.OnGlobalLayoutListener() {
        @Override
        public void onGlobalLayout() {

            WindowManager wm = (WindowManager) getSystemService(Context.WINDOW_SERVICE);
            rl_layout_editor.setVisibility(View.VISIBLE);


        }
    };

    boolean isclick = true;
    boolean isItalic;//是否斜体
    boolean isBold;//是否加粗
    boolean isStrikeThrough;//是否有删除线
    //富文本图片保存的集合
    private ArrayList<String> selectedRichImage = new ArrayList<>();

    @Override
    public void onClick(View v) {

        switch (v.getId()) {

            case R.id.ll_arti_secb:
            case R.id.et_arti_secb:
                Intent intent = new Intent(ArticleAddActivity.this, AcquireMenuActivity.class);
                AcquireMenuActivity.Dict dict = new AcquireMenuActivity.Dict();
                if(dep_flag && !overview_flag) {
                    dict.setType(URL.dict_type_secb);
                    dict.setParentId("3");
                    intent.putExtra("title", "选择二级版块");
                    intent.putExtra(URL.dict, dict);
                    startActivityForResult(intent, Constants.BACK_ARTI_SECB);
                }
                break;
            case R.id.title_right:
                article.setContent(mEditor.getHtml());
                article.setSectionB(et_arti_secb.getText().toString());
                article.setTitle(et_arti_title.getText().toString());

                Date date = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                article.setTime(df.format(date));
                String obj = new Gson().toJson(article);
                commitData(ArticleAddActivity.this, obj, URL.url_Article_save);
                break;
            case R.id.finish:
                finish();
                break;

//            //上传图片
//            case R.id.img_uploading_pic:
//                PhotoPickerIntent intent = new PhotoPickerIntent(MainActivity.this);
//                intent.setPhotoCount(6 - selectedPhotos.size());//可以添加6张图片
//                startActivityForResult(intent, REQUEST_CODE);
//                break;

            //撤回
            case R.id.action_undo:
                mEditor.undo();
                break;
            //复原
            case R.id.action_redo:
                mEditor.redo();
                break;
            //字体
            case R.id.action_font:
                if (ll_layout_font.getVisibility() == View.VISIBLE) {
                    ll_layout_font.setVisibility(View.GONE);
                } else {
                    if (ll_layout_add.getVisibility() == View.VISIBLE) {
                        ll_layout_add.setVisibility(View.GONE);
                    }
                    ll_layout_font.setVisibility(View.VISIBLE);
                    startAnimation(ll_layout_font);
                }
                break;
            //添加
            case R.id.action_add:

                if (ll_layout_add.getVisibility() == View.VISIBLE) {
                    ll_layout_add.setVisibility(View.GONE);
                } else {
                    if (ll_layout_font.getVisibility() == View.VISIBLE) {
                        ll_layout_font.setVisibility(View.GONE);
                    }
                    ll_layout_add.setVisibility(View.VISIBLE);
                    startAnimation(ll_layout_add);
                }
                break;
            //粗体
            case R.id.action_bold:
                if (flag1) {
                    ib_Bold.setImageResource(R.mipmap.bold_d);
                    flag1 = false;
                    isBold = false;
                } else {
                    ib_Bold.setImageResource(R.mipmap.bold_l);
                    flag1 = true;
                    isBold = true;
                }
                mEditor.setBold();
                break;
            //斜体
            case R.id.action_italic:
                if (flag2) {
                    ib_Italic.setImageResource(R.mipmap.italic_d);
                    flag2 = false;
                    isItalic = false;
                } else {
                    ib_Italic.setImageResource(R.mipmap.italic_l);
                    flag2 = true;
                    isItalic = true;
                }
                mEditor.setItalic();
                break;
            //删除线
            case R.id.action_strikethrough:
                if (flag3) {
                    ib_StrikeThough.setImageResource(R.mipmap.strikethrough_d);
                    flag3 = false;
                    isStrikeThrough = false;
                } else {
                    ib_StrikeThough.setImageResource(R.mipmap.strikethrough_l);
                    flag3 = true;
                    isStrikeThrough = true;
                }
                mEditor.setStrikeThrough();
                break;
            //块引用
            case R.id.action_blockquote:
                if (flag4) {
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    flag4 = false;
                    isclick = false;
                } else {
                    flag4 = true;
                    flag5 = false;
                    flag6 = false;
                    flag7 = false;
                    flag8 = false;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_l);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                }
                Log.e("BlockQuote", "isItalic:" + isItalic + "，isBold：" + isBold + "，isStrikeThrough:" + isStrikeThrough);
                mEditor.setBlockquote(isclick, isItalic, isBold, isStrikeThrough);
                break;
            //H1字体
            case R.id.action_heading1:
                if (flag5) {
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    flag5 = false;
                    isclick = false;
                    //使加粗灰显并去除效果
                    ib_Bold.setImageResource(R.mipmap.bold_d);
                    flag1 = false;
                    isBold = false;
                } else {
                    flag4 = false;
                    flag5 = true;
                    flag6 = false;
                    flag7 = false;
                    flag8 = false;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_l);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                }
                mEditor.setHeading(1, isclick, isItalic, isBold, isStrikeThrough);
                break;
            //H2字体
            case R.id.action_heading2:
                if (flag6) {
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    flag6 = false;
                    isclick = false;
                    //使加粗灰显并去除效果
                    ib_Bold.setImageResource(R.mipmap.bold_d);
                    flag1 = false;
                    isBold = false;
                } else {
                    flag4 = false;
                    flag5 = false;
                    flag6 = true;
                    flag7 = false;
                    flag8 = false;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_l);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                }
                mEditor.setHeading(2, isclick, isItalic, isBold, isStrikeThrough);
                break;
            //H3字体
            case R.id.action_heading3:
                if (flag7) {
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    flag7 = false;
                    isclick = false;
                    //使加粗灰显并去除效果
                    ib_Bold.setImageResource(R.mipmap.bold_d);
                    flag1 = false;
                    isBold = false;
                } else {
                    flag4 = false;
                    flag5 = false;
                    flag6 = false;
                    flag7 = true;
                    flag8 = false;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_l);
                    ib_H4.setImageResource(R.mipmap.h4_d);
                }
                mEditor.setHeading(3, isclick, isItalic, isBold, isStrikeThrough);
                break;
            //H4字体
            case R.id.action_heading4:
                if (flag8) {
                    ib_H4.setImageResource(R.mipmap.h4_d);
                    flag8 = false;
                    isclick = false;
                    //使加粗灰显并去除效果
                    ib_Bold.setImageResource(R.mipmap.bold_d);
                    flag1 = false;
                    isBold = false;
                } else {
                    flag4 = false;
                    flag5 = false;
                    flag6 = false;
                    flag7 = false;
                    flag8 = true;
                    isclick = true;
                    ib_BlockQuote.setImageResource(R.mipmap.blockquote_d);
                    ib_H1.setImageResource(R.mipmap.h1_d);
                    ib_H2.setImageResource(R.mipmap.h2_d);
                    ib_H3.setImageResource(R.mipmap.h3_d);
                    ib_H4.setImageResource(R.mipmap.h4_l);
                }
                mEditor.setHeading(4, isclick, isItalic, isBold, isStrikeThrough);
                break;
        }
    }

    // 执行动画效果
    public void startAnimation(View mView) {

        AlphaAnimation aa = new AlphaAnimation(0.4f, 1.0f); // 0完全透明 1 完全不透明
        // 以(0%,0.5%)为基准点，从0.5缩放至1
        ScaleAnimation sa = new ScaleAnimation(0.5f, 1, 0.5f, 1,
                Animation.RELATIVE_TO_SELF, 0,
                Animation.RELATIVE_TO_SELF, 0.5f);

        // 添加至动画集合
        AnimationSet as = new AnimationSet(false);
        as.addAnimation(aa);
        as.addAnimation(sa);
        as.setDuration(500);
        // 执行动画
        mView.startAnimation(as);
    }

    private AlertDialog linkDialog;

    private ArrayList<String> richpImage = null; //新增加的存储图片的集合
    public final static int RICH_IMAGE_CODE = 0x33;

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == RICH_IMAGE_CODE && resultCode == Activity.RESULT_OK && null != data) {

            Uri selectedImage = data.getData();
            String[] filePathColumns = {MediaStore.Images.Media.DATA};
            Cursor c = this.getContentResolver().query(selectedImage, filePathColumns, null, null, null);
            c.moveToFirst();
            int columnIndex = c.getColumnIndex(filePathColumns[0]);
            String picturePath = c.getString(columnIndex);
            Log.i("dgs", "picturePath----" + picturePath);
            //插入图片
            mEditor.insertImage(picturePath, "图片");
            c.close();
            //获取图片并显示

        }

        if(requestCode == Constants.BACK_ARTI_SECB && resultCode == RESULT_OK && null != data) {
            AcquireMenuActivity.Dict dict = (AcquireMenuActivity.Dict) data.getSerializableExtra("dict");
            article.setSectionB(dict.getLabel());
            et_arti_secb.setText(dict.getLabel());
            Log.d(TAG, "onActivityResult: "+dict.getValue());

        }



//        switch (requestCode) {
//            case RICH_IMAGE_CODE://富文本选择图片
//                if (data != null) {
//                    richpImage = data.getStringArrayListExtra(PhotoPickerActivity.KEY_SELECTED_PHOTOS);
//                }
//                if (richpImage != null) {
//                    showDialog("图片加载中。。。");
//                    requestYPU(richpImage.get(0));
//                }
//                break;
//        }
    }

    @Override
    public void onPointerCaptureChanged(boolean hasCapture) {

    }




    private void commitData(final Context context, String obj, String url) {
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

}
