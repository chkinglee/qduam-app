package com.lilinzhen.qduamapplication.HomePage.Meeting;

import android.content.Context;
import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Meeting.Meeting;
import com.lilinzhen.qduamapplication.Bean.Meeting.MeetingBean;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.Handle.DataHandler;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityMeetingManagementBinding;

import java.util.List;

public class MeetingManagementActivity extends BaseActivity {

    private ActivityMeetingManagementBinding binding;
    private Depart depart;
    private Boolean mem_flag = false;
    private String stuid = null;

    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            Intent intent = new Intent(MeetingManagementActivity.this, MeetingDetailActivity.class);
            intent.putExtra("depart", depart);
            intent.putExtra("dep_flag", true);
            startActivityForResult(intent, Constants.BACK_MEETING_SAVE);
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

        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_meeting_management);
        setTitle("会议管理");
        setTitleRight("添加", listener);
        initControl();
    }


    private void initControl() {
        Intent intent = getIntent();
        if(intent != null) {
            depart = (Depart) intent.getSerializableExtra("depart");
            depart.setMembers(null);
            depart.setDirectors(null);
            mem_flag = intent.getBooleanExtra("mem_flag", false);
            stuid = intent.getStringExtra("stuid");
        }

        if(mem_flag) {
            setTitleRight(null, null);
        }
        Meeting meeting = new Meeting();
        meeting.setDepart(depart);
        String obj = new Gson().toJson(meeting);
        acquireList(this, obj, URL.url_Meeting_list, dataHandler);


    }

    private void dealString(final Context context, String responseString) {
        MeetingBean bean = new Gson().fromJson(responseString, MeetingBean.class);
        CommonAdapter<Meeting> adapter;
        if(bean != null
                && !TextUtils.isEmpty(bean.getSuccess())
                && bean.getSuccess().equals(URL.success)
                && bean.getBody() != null
                && bean.getBody().getList() != null) {

            Log.d(TAG, "dealString: 数据加载成功");

            final List<Meeting> list = bean.getBody().getList();

            adapter = new CommonAdapter<>(context, list, R.layout.item_meeting_list, BR.meeting);
            binding.setAdapter(adapter);
            binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Meeting entity = list.get(i);
                    Intent intent = new Intent(MeetingManagementActivity.this, MeetingDetailActivity.class);
                    if(mem_flag) {
                        intent.putExtra("stuid", stuid);
                        intent.putExtra("mem_flag", mem_flag);
                    } else {
                        intent.putExtra("dep_flag", true);
                    }
                    intent.putExtra("meeting", entity);
                    startActivityForResult(intent, Constants.BACK_MEETING_SAVE);
                }
            });
            binding.listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                @Override
                public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                    Meeting entity = list.get(i);
                    String obj = new Gson().toJson(entity);
                    showDialog(context, obj, URL.url_Meeting_del, dataHandler);
                    return true;
                }
            });
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_MEETING_SAVE:
                    initControl();
                    break;
                default:
                    break;
            }
        }
    }

}
