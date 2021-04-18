package com.me.dao;

import com.me.utils.DBUtils;
import com.me.utils.Data;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

/**
 * @Auther: wzs
 * @Date: 2021/4/16 16:30
 * @Description:
 */
public class XmshDao {


    public boolean zdjsHtsh(String sftg, String psyj, String num) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="insert into ieps_review values(?,?,?,?,?,?,?,?,?,?)";
        int n = 0;
        try {
            n = qr.update(sql,0,"2018335547",num,8.5,psyj,4,1, Data.getDate(), Data.getDate(), Data.getDate());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean changeStatus(String num,int item_status){
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="update ieps_item set item_status = ?   where item_num=? ";
        int n = 0;
        try {
            n = qr.update(sql,item_status,num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }


    }

}
