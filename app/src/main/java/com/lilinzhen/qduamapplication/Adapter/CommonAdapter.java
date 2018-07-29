package com.lilinzhen.qduamapplication.Adapter;

import android.content.Context;
import android.databinding.DataBindingUtil;
import android.databinding.ViewDataBinding;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;

import java.util.List;

/**
 * Created by lilinzhen on 2018/3/22.
 */
public class CommonAdapter<T> extends BaseAdapter{

    private Context context;
    private List<T> list;
    private int layoutId; // 布局id
    private int variableId; // 变量id

    public CommonAdapter(Context context, List<T> list, int layoutId, int variableId) {
        this.context = context;
        this.list = list;
        this.layoutId = layoutId;
        this.variableId = variableId;
    }

    @Override
    public int getCount() {
        return list.size();
    }

    @Override
    public Object getItem(int i) {
        return list.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewDataBinding binding = null;
        if (view == null) {
            binding = DataBindingUtil.inflate(LayoutInflater.from(context), layoutId, viewGroup, false);
        } else {
            binding = DataBindingUtil.getBinding(view);
        }
        binding.setVariable(variableId, list.get(i));
        return binding.getRoot();
    }
}