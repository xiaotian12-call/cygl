package com.me.domain;

import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/14 19:59
 * @Description:
 */
public class Sjbg {
    int code;
    String msg;
    int count;
    List<Item> data;

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

    public List<Item> getData() {
        return data;
    }

    public void setData(List<Item> data) {
        this.data = data;
    }
}
