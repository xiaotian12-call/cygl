package com.me.domain;

import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/16 21:09
 * @Description:
 */
public class SjbgPerm {
    int code;
    String msg;
    int count;
    List<Perm> data;

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

    public List<Perm> getData() {
        return data;
    }

    public void setData(List<Perm> data) {
        this.data = data;
    }
}
