package com.lilinzhen.qduamapplication.Adapter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.lilinzhen.qduamapplication.R;

import java.util.List;

/**
 * 获取字典目录Adapter
 * Created by lilinzhen on 2017/12/21.
 */
public class GroupAdapter extends ArrayAdapter<String> {

    private Integer resource;

    @NonNull
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        String string = getItem(position);
        ViewHolder viewHolder;

        if(convertView == null ) {
            convertView = LayoutInflater.from(getContext()).inflate(resource, parent, false);
            viewHolder = new ViewHolder();
            viewHolder.textView_groupItem = convertView.findViewById(R.id.groupItem);

            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }

        viewHolder.textView_groupItem.setText(string);

        return convertView;
    }

    public GroupAdapter(Context context, int resource, List<String> objects) {
        super(context, resource, objects);
        this.resource = resource;
    }

    private class ViewHolder {
        TextView textView_groupItem;
    }
}

