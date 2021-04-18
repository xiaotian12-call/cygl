package com.me.dao;

import com.me.domain.User;
import com.me.domain.XysCount;
import com.me.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class dao {

	public int[] SelectYear() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select DISTINCT left(item_date,4) as a from ieps_item;";
		List<Object> list = (List<Object>) runner.query(sql, new ColumnListHandler("a"));
		int[] a = new int[list.size()];
		int i =0;
		for (Object obj : list) {
			a[i] = Integer.parseInt((String) obj);
		     i++;
		}

			return a;
	}

	public int AddCount(int i) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT count(*) as count FROM ieps_item WHERE item_date LIKE '"+i+"%'";
		System.out.println(sql);
		Number isuse  = (Number) runner.query(sql, new ScalarHandler());
        System.out.println("isuse = " +isuse);
		return  isuse.intValue();
		
	}

	public ArrayList<XysCount> XyCount(String yeartb) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	   String sql = null;
		if(yeartb == null) {
			 sql = "select xy,count(xy) as count from (select xy from user join ieps_item on user.id= ieps_item.leader_num where ieps_item.item_date LIKE '2019%') a group by xy";
		}else {
			 sql = "select xy,count(xy) as count from (select xy from user join ieps_item on user.id= ieps_item.leader_num where ieps_item.item_date LIKE '"+yeartb+"%') a group by xy";
		}
		List<XysCount> rows = runner.query(sql, new BeanListHandler<XysCount>(XysCount.class));
		
	    return (ArrayList<XysCount>) rows;
		
	}

	public int ZhuCe(User u) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into user(username,pwd,name,sex,sr,xy,zy,nj,email,role) values(?,?,?,?,?,?,?,?,?,?)";
		int rows = 0;
		rows = runner.update(sql,u.getUsername(),u.getPwd(),u.getName(),u.getSex(),u.getSr(),u.getXy(),u.getZy(),u.getNj(),u.getEmail(),u.getRole());
	    return rows;
	}

	public int Wjmm_sfyz(String username, String name, String email) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select id from user where username = ? and name = ? and email = ?";
		int id = 0;
		id = (int)runner.query(sql, new ScalarHandler(),username,name,email);
		return id;
		
	}

	public int Wjmm_xgmm(int id, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update user set pwd=? where id = ?";
		int rows = runner.update(sql,password,id);
		return rows;
	}



}
