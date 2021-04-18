package com.me.domain;

/**
 * @Auther: wzs
 * @Date: 2021/4/14 19:45
 * @Description:
 */
public class Item {
    int item_id;
    String item_num;
    String item_name;
    String leader_num;
    String leader_name;
    String tutor_num;
    String tutor_name;
    String item_status;
    String item_date;
    String create_time;
    String update_time;
    String item_contract;

    public String getItem_contract() {
        return item_contract;
    }

    public void setItem_contract(String item_contract) {
        this.item_contract = item_contract;
    }

    public String getItem_concluding_report() {
        return item_concluding_report;
    }

    public void setItem_concluding_report(String item_concluding_report) {
        this.item_concluding_report = item_concluding_report;
    }

    String item_concluding_report;


    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public String getItem_num() {
        return item_num;
    }

    public void setItem_num(String item_num) {
        this.item_num = item_num;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getLeader_num() {
        return leader_num;
    }

    public void setLeader_num(String leader_num) {
        this.leader_num = leader_num;
    }

    public String getLeader_name() {
        return leader_name;
    }

    public void setLeader_name(String leader_name) {
        this.leader_name = leader_name;
    }

    public String getTutor_num() {
        return tutor_num;
    }

    public void setTutor_num(String tutor_num) {
        this.tutor_num = tutor_num;
    }

    public String getTutor_name() {
        return tutor_name;
    }

    public void setTutor_name(String tutor_name) {
        this.tutor_name = tutor_name;
    }

    public String getItem_status() {
        return item_status;
    }

    public void setItem_status(String item_status) {
        this.item_status = item_status;
    }

    public String getItem_date() {
        return item_date;
    }

    public void setItem_date(String item_date) {
        this.item_date = item_date;
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
