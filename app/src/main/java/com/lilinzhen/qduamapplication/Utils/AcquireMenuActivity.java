package com.lilinzhen.qduamapplication.Utils;

import android.content.Context;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.databinding.ActivityAcquireMenuBinding;
import com.lilinzhen.qduamapplication.Bean.SuperBean;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;

import java.io.Serializable;
import java.util.List;

/**
 * 获取菜单列表Activity
 * Created by lilinzhen on 2017/12/21.
 */
public class AcquireMenuActivity extends BaseActivity {

    private ActivityAcquireMenuBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_acquire_menu);

        Intent intent = getIntent();
        Dict dict = (Dict) intent.getSerializableExtra("dict");
        String obj = new Gson().toJson(dict);

        String title = intent.getStringExtra("title");
        setTitle(title);

        Log.d(TAG, "onCreate: 接收参数:title= "+title+" json= "+ obj);

        acquireList(this, obj, URL.url_dict, dataHandler);//获取数据列表
    }


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

        }
    };

    /**
     * 处理数据
     * @param context
     * @param responseString
     */
    private void dealString(Context context, String responseString) {
        CommonAdapter<Dict> adapter;
        DictBean bean = new Gson().fromJson(responseString, DictBean.class);
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Dict> list = bean.getBody().getList();
            adapter = new CommonAdapter<>(context, list, R.layout.item_dict_label_list, BR.dict);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Dict dict = list.get(i);
                    Intent intent = new Intent();
                    intent.putExtra("dict", dict);
                    setResult(RESULT_OK, intent);
                    finish();
                }
            });
        } else {
            Log.d(TAG, "dealString: 无数据");
            binding.listView.setAdapter(null);
            Toast.makeText(context, "无数据", Toast.LENGTH_SHORT).show();
        }

    }



    /**
     * 字典实体
     */
    public static class Dict implements Serializable {

        private String id;
        private String type ;
        private String label ;
        private String value ;
        private String description;
        private String parentId;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getParentId() {
            return parentId;
        }

        public void setParentId(String parentId) {
            this.parentId = parentId;
        }
    }
    
    /**
     * 字典数据json-body
     */
    public class DictBody {

        private List<Dict> list ;

        public List<Dict> getList() {
            return list;
        }

        public void setList(List<Dict> list) {
            this.list = list;
        }
    }

    /**
     * 字典数据json
     */
    public class DictBean extends SuperBean {

        private DictBody body;

        public DictBody getBody() {
            return body;
        }

        public void setBody(DictBody body) {
            this.body = body;
        }
    }
    
}
