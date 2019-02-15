package beyond.dbutils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import beyond.utils.DataSourceUtils;

public class DBUtilsDemo {
	public static void main(String[] args) {
			
		Connection conn = null;
		
		try {
			/*
			 //不需要使用事务控制就传参即可
			  QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			  //开启事务
			  runner.update("update account set money=1014 where name='yy'");
		    */			
			
			//如果需要事务控制不传参
			QueryRunner runner = new QueryRunner();
			
			//获得一个Connection
			conn = DataSourceUtils.getConnection();
			
			//开启事务
			conn.setAutoCommit(false);
			runner.update(conn, "update account set money=1014 where name='yy'");
			
			
			//提交或者回滚事务
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
		
		
		
	}
}
