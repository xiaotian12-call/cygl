package com.me.domain;

import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/18 20:07
 * @Description:
 */
public class SjbgInform {
    int code;
    String msg;
    int count;
    List<Inform> data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<Inform> getData() {
        return data;
    }

    public void setData(List<Inform> data) {
        this.data = data;
    }
}
