package com.me.dao;

import com.me.domain.Item;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/17 09:12
 * @Description:
 */
public class TjcxDao {

    public List<Item> getAllItem() throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item ";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class));
        return query;
    }

    public List<Item> getAllItemP(String page, String limit) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item  limit ? ,?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),begin,limit_int);
        return query;
    }

    public List<Item> seachItem(String page, String limit, String item_level, String item_type, String tutor_name, String leader_name, String item_name) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);
        int begin = (page_int-1)*limit_int;
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where 1=1 ";
        if (!item_level.equals("0")){
            //sql = sql + " and item_level = "+item_level;
        }
        if (item_type.equals("0")){
            //sql = sql + " and item_type =  "+item_type;
        }
        if (tutor_name!=null&&!tutor_name.equals("")&&!tutor_name.equals(" ")){
            sql = sql + " and tutor_name like  '%"+tutor_name+"%' ";
        }
        if (leader_name!=null&&!leader_name.equals("")&&!leader_name.equals(" ")){
            sql = sql + " and leader_name like  '%"+leader_name+"%' ";
        }
        if (item_name!=null&&!item_name.equals("")&&!item_name.equals(" ")){
            sql = sql + " and item_name like  '%"+item_name+"%' ";
        }

        String last = " limit ? ,?";

        sql = sql +last;
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),begin,limit_int);
        return query;

    }

    public List<Item> seachItem2(String item_level, String item_type, String tutor_name, String leader_name, String item_name) throws SQLException {

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where 1=1 ";
        if (!item_level.equals("0")){
            //sql = sql + " and item_level = "+item_level;
        }
        if (item_type.equals("0")){
            //sql = sql + " and item_type =  "+item_type;
        }
        if (tutor_name!=null&&!tutor_name.equals("")&&!tutor_name.equals(" ")){
            sql = sql + " and tutor_name like  '%"+tutor_name+"%' ";
        }
        if (leader_name!=null&&!leader_name.equals("")&&!leader_name.equals(" ")){
            sql = sql + " and leader_name like  '%"+leader_name+"%' ";
        }
        if (item_name!=null&&!item_name.equals("")&&!item_name.equals(" ")){
            sql = sql + " and item_name like  '%"+item_name+"%' ";
        }
        System.out.println(sql);

        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class));
        return query;

    }

}
