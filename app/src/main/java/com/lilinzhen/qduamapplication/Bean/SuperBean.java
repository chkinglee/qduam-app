package com.lilinzhen.qduamapplication.Bean;

/**
 * Created by lilinzhen on 2017/12/8.
 */
public class SuperBean {

    private String success ;//数据获取成功标记
    private String errorCode;//错误代码
    private String msg ;//反馈信息

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

}
