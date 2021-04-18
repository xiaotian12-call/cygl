package com.me.dao;

import com.me.domain.Perm;
import com.me.domain.User;
import com.me.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @Auther: wzs
 * @Date: 2021/4/16 21:03
 * @Description:
 */
public class QxglDao {

    public List<Perm> getPerm(String page, String limit) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from perm    limit ? ,?";
        List<Perm> query = qr.query(sql, new BeanListHandler<Perm>(Perm.class),begin,limit_int);
        return query;
    }

    public List<Perm> getPermCount() throws SQLException {

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from perm  ";
        List<Perm> query = qr.query(sql, new BeanListHandler<Perm>(Perm.class));
        return query;
    }

    public boolean deletePerm(String id) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="delete from perm  where id=? ";
        int n = 0;
        try {
            n = qr.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (n > 0) {
            return true;
        } else {
            return false;
        }
    }

    public Perm getPermById(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from perm  where id = ?  ";
        Perm query = qr.query(sql, new BeanHandler<Perm>(Perm.class),id);
        return query;
    }

    public boolean updatePerm(Perm perm) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "update perm set name = ?,url=?,role=? where id =?";
        int n = qr.update(sql, perm.getName(),perm.getUrl(),perm.getRole(),perm.getId());
        if(n>0) {
            return true;
        }else {
            return false;
        }

    }
}
