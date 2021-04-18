package com.me.domain;

/**
 * @Auther: wzs
 * @Date: 2021/4/14 21:07
 * @Description:
 */
public class ItemInfo {
    int id ;
    String item_num;
    String item_level;
    String item_type;
    String summary;
    double college_funds;
    double govern_funds;
    String create_time;
    String update_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItem_num() {
        return item_num;
    }

    public void setItem_num(String item_num) {
        this.item_num = item_num;
    }

    public String getItem_level() {
        return item_level;
    }

    public void setItem_level(String item_level) {
        this.item_level = item_level;
    }

    public String getItem_type() {
        return item_type;
    }

    public void setItem_type(String item_type) {
        this.item_type = item_type;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public double getCollege_funds() {
        return college_funds;
    }

    public void setCollege_funds(double college_funds) {
        this.college_funds = college_funds;
    }

    public double getGovern_funds() {
        return govern_funds;
    }

    public void setGovern_funds(double govern_funds) {
        this.govern_funds = govern_funds;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
