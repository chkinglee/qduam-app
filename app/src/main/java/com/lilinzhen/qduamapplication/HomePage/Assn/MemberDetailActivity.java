package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

import com.lilinzhen.qduamapplication.Bean.Assn.Member;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityMemberDetailBinding;

public class MemberDetailActivity extends BaseActivity {

    private ActivityMemberDetailBinding binding;

    private Member member;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this,R.layout.activity_member_detail);
        setTitle("部员信息");

        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();

        if(intent != null) {
            member = (Member) intent.getSerializableExtra("member");
        }

        binding.setMember(member);
    }


}
