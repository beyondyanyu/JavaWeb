//login
package com.itheima.login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.itheima.register.User;
import com.itheima.utils.DataSourceUtils;;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 解决用户名是中文乱码问题
		request.setCharacterEncoding("UTF-8");

		// 1.获取用户名和密码(获取表单数据)
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// 2.调用一个业务方法进行该用户名和密码的查询
		User user = null;
		try {
			user = login(username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//3.通过user是否为null，来判断用户名跟密码是否正确
		if(user!=null){
			//用户名、密码正确
			//登录成功，跳转到网站的首页（重定向，地址会变化）
			response.sendRedirect(request.getContextPath() + "/index.jsp");//获得web应用的名称
			
		}else{
			//用户名或者密码错误
			//跳回当前的login.jsp（可以重定向跳回也可以转发跳回）
			//如果使用转发，转发到login.jsp 向request域中存储点错误信息数据
			request.setAttribute("logininfo", "用户名或者密码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	public User login(String username, String password) throws SQLException {// 方法封装，用于查找该用户是否注册存在
		// 然后查找数据库即可
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username=? and password=?";
		User user = runner.query(sql, new BeanHandler<User>(User.class), username,password);
		return user;

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
