package com.lilinzhen.qduamapplication.HomePage.Meeting;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.google.gson.Gson;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.Member;
import com.lilinzhen.qduamapplication.Bean.Meeting.Meeting;
import com.lilinzhen.qduamapplication.Environment.Constants;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.HomePage.Assn.MemberManagementActivity;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.Utils.AcquireMenuActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityMeetingDetailBinding;

public class MeetingDetailActivity extends BaseActivity implements View.OnClickListener {

    private ActivityMeetingDetailBinding binding;
    private Meeting meeting = new Meeting();
    private Depart depart = new Depart();
    private String stuid = null;
    private Boolean dep_flag = false;
    private Boolean mem_flag = false;

    private onTitleRightClickListener listener = new onTitleRightClickListener() {
        @Override
        public void onClick(View view) {
            checkET();
        }
    };



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_meeting_detail);
        binding.setActivity(this);
        setTitle("会议内容");
        setTitleRight("提交", listener);
        initControl();
    }

    private void initControl() {

        Intent intent = getIntent();
        if(intent != null) {
            meeting = (Meeting) intent.getSerializableExtra("meeting");
            depart = (Depart) intent.getSerializableExtra("depart");
            stuid = intent.getStringExtra("stuid");
            dep_flag = intent.getBooleanExtra("dep_flag", false);
            mem_flag = intent.getBooleanExtra("mem_flag", false);
            binding.setMeeting(meeting);
        }

        if(depart != null) {
            depart.setAssn(null);
            depart.setMembers(null);
            depart.setDirectors(null);

            meeting = new Meeting();
            meeting.setDepart(depart);
            binding.setMeeting(meeting);
        }

        binding.etMeetingTheme.addTextChangedListener(new MyTextWatcher(binding.etMeetingTheme));
        binding.etMeetingTime.addTextChangedListener(new MyTextWatcher(binding.etMeetingTime));
        binding.etMeetingRoom.addTextChangedListener(new MyTextWatcher(binding.etMeetingRoom));
        binding.etMeetingNote.addTextChangedListener(new MyTextWatcher(binding.etMeetingNote));
        binding.etMeetingShouldNum.addTextChangedListener(new MyTextWatcher(binding.etMeetingShouldNum));
        binding.etMeetingEventNum.addTextChangedListener(new MyTextWatcher(binding.etMeetingEventNum));
        binding.etMeetingNotNum.addTextChangedListener(new MyTextWatcher(binding.etMeetingNotNum));
        binding.etMeetingRealNum.addTextChangedListener(new MyTextWatcher(binding.etMeetingRealNum));

        if(mem_flag) {
            binding.etMeetingTheme.setEnabled(false);
            binding.etMeetingTime.setEnabled(false);
            binding.etMeetingRoom.setEnabled(false);
            binding.llMeetingTime.setEnabled(false);
            binding.llMeetingMember.setEnabled(false);
            if(stuid != null && !stuid.equals(meeting.getMember().getStudent().getId())) {
                setTitleRight(null, null);
                binding.etMeetingShouldNum.setEnabled(false);
                binding.etMeetingEventNum.setEnabled(false);
                binding.etMeetingNotNum.setEnabled(false);
                binding.etMeetingRealNum.setEnabled(false);
                binding.etMeetingNote.setEnabled(false);
            }
        }

    }


    private void checkET() {
        if (dep_flag) {
            if (checkET(this, binding.etMeetingTheme, "请填写会议主题"))
                if (checkET(this, binding.etMeetingTime, "请选择会议时间"))
                    if (checkET(this, binding.etMeetingRoom, "请填写会议地点"))
                        if (checkET(this, binding.etMeetingMemberId, "请选择会议记录人")) {
                            String obj = new Gson().toJson(meeting);
                            commitData(this, obj, URL.url_Meeting_save);
                        }
        } else if (mem_flag) {
            if (checkET(this, binding.etMeetingShouldNum, "请填写应到人数"))
                if (checkET(this, binding.etMeetingEventNum, "请填写请假人数"))
                    if (checkET(this, binding.etMeetingNotNum, "请填写无故未到人数"))
                        if (checkET(this, binding.etMeetingRealNum, "请填写实到人数")) {
                            String obj = new Gson().toJson(meeting);
                            commitData(this, obj, URL.url_Meeting_save);
                        }
        }
    }



    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.ll_meeting_time:
            case R.id.et_meeting_time:
                openDatePickerDialog(MeetingDetailActivity.this, binding.etMeetingTime, true);
                break;
            case R.id.ll_meeting_member:
            case R.id.et_meeting_member_name:
                if(dep_flag) {
                    Intent intent = new Intent(MeetingDetailActivity.this, MemberManagementActivity.class);
                    intent.putExtra("parent", meeting.getDepart());
                    intent.putExtra("met_flag", true);
                    startActivityForResult(intent, Constants.BACK_MEM_NAME);
                }
                break;
            default:
                break;
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(resultCode == RESULT_OK) {
            switch (requestCode) {
                case Constants.BACK_MEM_NAME:
                    Member member = (Member) data.getSerializableExtra("member");
                    meeting.setMember(member);
                    binding.setMeeting(meeting);
                    break;
                default:
                    break;
            }
        }
    }


    private class MyTextWatcher implements TextWatcher {

        private EditText editText;
        private MyTextWatcher(EditText editText) {
            this.editText = editText;
        }

        @Override
        public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

        }

        @Override
        public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

        }

        @Override
        public void afterTextChanged(Editable editable) {
            String text = editable.toString();
            switch (editText.getId()) {
                case R.id.et_meeting_theme:
                    meeting.setTheme(text);
                    break;
                case R.id.et_meeting_time:
                    meeting.setTime(text);
                    break;
                case R.id.et_meeting_room:
                    meeting.setRoom(text);
                    break;
                case R.id.et_meeting_note:
                    meeting.setNote(text);
                    break;
                case R.id.et_meeting_should_num:
                    meeting.setShouldNum(text);
                    break;
                case R.id.et_meeting_event_num:
                    meeting.setEventNum(text);
                    break;
                case R.id.et_meeting_not_num:
                    meeting.setNotNum(text);
                    break;
                case R.id.et_meeting_real_num:
                    meeting.setRealNum(text);
                    break;
                default:
                    break;
            }

        }
    }

}
