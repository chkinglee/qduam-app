package com.lilinzhen.qduamapplication.HomePage.Assn;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.databinding.DataBindingUtil;
import android.net.Uri;
import android.support.design.widget.TabLayout;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.view.View;
import android.widget.AdapterView;

import com.lilinzhen.qduamapplication.Adapter.CommonAdapter;
import com.lilinzhen.qduamapplication.BR;
import com.lilinzhen.qduamapplication.Bean.Assn.Depart;
import com.lilinzhen.qduamapplication.Bean.Assn.Director;
import com.lilinzhen.qduamapplication.Bean.Assn.Member;
import com.lilinzhen.qduamapplication.Environment.URL;
import com.lilinzhen.qduamapplication.R;
import com.lilinzhen.qduamapplication.SuperClass.BaseActivity;
import com.lilinzhen.qduamapplication.databinding.ActivityDepartDmBinding;

public class DepartDMActivity extends BaseActivity implements TabLayout.OnTabSelectedListener {

    private ActivityDepartDmBinding binding;
    private Depart depart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_depart_dm);

        setTitle("部门人员");

        initControl();
    }

    private void initControl() {
        Intent intent = getIntent();
        depart = (Depart) intent.getSerializableExtra("parent");

        binding.tl.addTab(binding.tl.newTab().setText("部长团"), true);
        binding.tl.addTab(binding.tl.newTab().setText("部员列表"));
        binding.tl.setOnTabSelectedListener(this);

        callDirector();
    }

    /**
     * 拨号部长
     */
    private void callDirector() {
        CommonAdapter<Director> adapterDirector = new CommonAdapter<>(DepartDMActivity.this, depart.getDirectors(), R.layout.item_director_list, BR.director);
        binding.setAdapter(adapterDirector);
        binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Director director = depart.getDirectors().get(i);
                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:" + director.getPhone()));
                if (ActivityCompat.checkSelfPermission(DepartDMActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                    // TODO: Consider calling
                    //    ActivityCompat#requestPermissions
                    // here to request the missing permissions, and then overriding
                    //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                    //                                          int[] grantResults)
                    // to handle the case where the user grants the permission. See the documentation
                    // for ActivityCompat#requestPermissions for more details.
                    String [] permissions = new String[]{Manifest.permission.CALL_PHONE};
                    ActivityCompat.requestPermissions(DepartDMActivity.this, permissions, 1);
                    callDirector();
                }
                startActivity(intent);
            }
        });
    }

    /**
     * 拨号部员
     */
    private void callMember() {
        CommonAdapter<Member> adapterMember = new CommonAdapter<>(DepartDMActivity.this, depart.getMembers(), R.layout.item_member_list, BR.member);
        binding.setAdapter(adapterMember);
        binding.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Member member = depart.getMembers().get(i);
                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:" + member.getStudent().getPhone()));
                if (ActivityCompat.checkSelfPermission(DepartDMActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                    // TODO: Consider calling
                    //    ActivityCompat#requestPermissions
                    // here to request the missing permissions, and then overriding
                    //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                    //                                          int[] grantResults)
                    // to handle the case where the user grants the permission. See the documentation
                    // for ActivityCompat#requestPermissions for more details.

                    String [] permissions = new String[]{Manifest.permission.CALL_PHONE};
                    ActivityCompat.requestPermissions(DepartDMActivity.this, permissions, 1);
                    callMember();
                }
                startActivity(intent);
            }
        });
    }

    @Override
    public void onTabSelected(TabLayout.Tab tab) {
        switch (tab.getPosition()) {
            case 0:
                callDirector();
                break;
            case 1:
                callMember();
                break;
            default:
                break;
        }
    }

    @Override
    public void onTabUnselected(TabLayout.Tab tab) {

    }

    @Override
    public void onTabReselected(TabLayout.Tab tab) {

    }
}
