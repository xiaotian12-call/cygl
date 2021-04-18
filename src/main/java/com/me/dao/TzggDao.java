package com.me.dao;

import com.me.domain.Inform;
import com.me.domain.Item;
import com.me.domain.User;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/17 15:55
 * @Description:
 */
public class TzggDao {

    public List<Item> getLnItem() throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item    limit 10 ";
        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class));
        return query;
    }

    public List<Inform> getTz() throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_inform  limit 10";
        List<Inform> query = qr.query(sql, new BeanListHandler<Inform>(Inform.class));
        return query;
    }

    public List<Inform> getTz(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_inform  where id = ?";
        List<Inform> query = qr.query(sql, new BeanListHandler<Inform>(Inform.class),id);
        return query;
    }

    public List<Item> cXm(String leader_name, String item_name) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_item where 1=1 ";

        if (leader_name!=null&&!leader_name.equals("")&&!leader_name.equals(" ")){
            sql = sql + " and leader_name like  '%"+leader_name+"%' ";
        }
        if (item_name!=null&&!item_name.equals("")&&!item_name.equals(" ")){
            sql = sql + " and item_name like  '%"+item_name+"%' ";
        }

        List<Item> query = qr.query(sql, new BeanListHandler<Item>(Item.class));
        return query;
    }

    public List<Inform> cTz(String create_time, String head) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_inform where 1=1 ";

        if (head!=null&&!head.equals("")&&!head.equals(" ")){
            sql = sql + " and head like  '%"+head+"%' ";
        }
//        if (item_name!=null&&!item_name.equals("")&&!item_name.equals(" ")){
//            sql = sql + " and item_name like  '%"+item_name+"%' ";
//        }


        List<Inform> query = qr.query(sql, new BeanListHandler<Inform>(Inform.class));
        return query;
    }

    public List<Inform> getInform(String page, String limit) throws SQLException {

        System.out.println(page);
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from ieps_inform  limit ?,?";
        List<Inform> query = qr.query(sql, new BeanListHandler<Inform>(Inform.class),begin,limit_int);
        return query;
    }
}
