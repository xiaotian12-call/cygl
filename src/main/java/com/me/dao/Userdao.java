package com.me.dao;

import com.me.domain.Item;
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
 * @Date: 2021/4/14 16:48
 * @Description:
 */
public class Userdao {

    public User login(String username, String pwd) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from user where username=? and pwd=? ";
        User user01 = qr.query(sql, new BeanHandler<User>(User.class), username, pwd);
        return user01;
    }

    public List<User> getUser(String id) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from user where id=? ";
        List<User> user01 = qr.query(sql, new BeanListHandler<User>(User.class), id);
        return user01;
    }

    public List<Perm> getPremList(String role ) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from perm where  role = ?";
        List<Perm> query = qr.query(sql, new BeanListHandler<Perm>(Perm.class),role);
        return query;
    }

    public List<User> getAllUser(String page, String limit) throws SQLException {
        int page_int = Integer.parseInt(page);
        int limit_int = Integer.parseInt(limit);

        int begin = (page_int-1)*limit_int;

        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from user    limit ? ,?";
        List<User> query = qr.query(sql, new BeanListHandler<User>(User.class),begin,limit_int);
        return query;
    }
    public List<User> getAllUserCount() throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "select * from user";
        List<User> query = qr.query(sql, new BeanListHandler<User>(User.class));
        return query;
    }


    public boolean deleteYg(String id) {
        QueryRunner qr =new QueryRunner(DBUtils.getDataSource());
        String sql="delete from user  where id=? ";
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

    public boolean updateUser(User user) throws SQLException {
        QueryRunner qr = new QueryRunner(DBUtils.getDataSource());
        String sql = "update user set sr = ?,nj=?,zy=?,xy=? where id =?";
        int n = qr.update(sql, user.getSr(), user.getNj(),user.getZy(),user.getXy(),user.getId());
        if(n>0) {
            return true;
        }else {
            return false;
        }
    }
}
