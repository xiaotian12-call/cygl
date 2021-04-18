package com.me.dao;

import com.me.domain.Item;
import com.me.domain.ItemInfo;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/14 19:53
 * @Description:
 */
public class ItemDao {
    public List<Item> getXsItem(String page, String limit,String leader_num ) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  leader_num = ?  limit ? ,?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),leader_num,begin,limit_int);
        return query;
    }

    public List<Item> getXsItem2(String leader_num ) throws SQLException {


        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  leader_num = ?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),leader_num);
        return query;
    }

    public List<Item> getPsItem2( ) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  item_status = ?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),2);
        return query;
    }

    public List<Item> getXsItem3(String item_num ) throws SQLException {

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  item_num = ?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),item_num);
        return query;
    }

    public List<ItemInfo> getXsItemInfo(String item_num ) throws SQLException {

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item_info where  item_num = ?";
        List<ItemInfo> query = qr.query(sql, new BeanListHandler<ItemInfo>(ItemInfo.class),item_num);
        return query;
    }

    public boolean addItem(Item item) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="insert into ieps_item values(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
        int n = 0;
        try {
            n = qr.update(sql,item.getItem_id(),item.getItem_num(),item.getItem_name(),item.getLeader_num(),item.getLeader_name()
                    ,item.getTutor_num(),item.getTutor_name(),item.getItem_status(),item.getItem_date(),item.getCreate_time(),
                    item.getUpdate_time(),item.getItem_contract(),item.getItem_concluding_report());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean addItemInfo(ItemInfo itemInfo) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="insert into ieps_item_info values(?,?,?,?,?,?,?,?,?)";
        int n = 0;
        try {
            n = qr.update(sql,itemInfo.getId(),itemInfo.getItem_num(),itemInfo.getItem_level(),itemInfo.getItem_type(),itemInfo.getSummary()
                    ,itemInfo.getCollege_funds(),itemInfo.getGovern_funds(),itemInfo.getCreate_time(),itemInfo.getUpdate_time());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<Item> getPsItem(String page, String limit) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  item_status = ?  limit ? ,?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),2,begin,limit_int);
        return query;
    }



    public List<Item> getZDJSPsItem(String page, String limit, int id) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  tutor_num = ? and item_status = ?   limit ? ,?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),id,1,begin,limit_int);
        return query;
    }

    public List<Item> getZDJSPsItem2( int id) throws SQLException {


        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  tutor_num = ? and item_status = ?   ";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),id,1);
        return query;
    }

    public boolean deleteXm(String num) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="delete from ieps_item  where item_num=? ";
        int n = 0;
        try {
            n = qr.update(sql,num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean deleteXmInfo(String num) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="delete from ieps_item_info  where item_num=? ";
        int n = 0;
        try {
            n = qr.update(sql,num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<Item> getJtItem(String page, String limit) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  item_status = ?  limit ? ,?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),7,begin,limit_int);
        return query;
    }

    public List<Item> getJtItem2() throws SQLException {

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  item_status = ? ";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),7);
        return query;
    }

    public List<Item> getItemCount(int id, int i) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  tutor_num = ? and item_status = ? ";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),id,i);
        return query;
    }

    public List<Item> getZdjsZqpsItem(String page, String limit, int id, int i) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where  tutor_num = ? and item_status = ?  limit ? ,?";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class),id,i,begin,limit_int);
        return query;
    }
}
