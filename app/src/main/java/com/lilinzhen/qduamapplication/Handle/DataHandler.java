package com.lilinzhen.qduamapplication.Handle;

import android.content.Context;

/**
 * Created by lilinzhen on 2018/4/5.
 */

public interface DataHandler {

    void dealDataString(Context context, String responseString);

    void SaveData();

    void flushData();
}
