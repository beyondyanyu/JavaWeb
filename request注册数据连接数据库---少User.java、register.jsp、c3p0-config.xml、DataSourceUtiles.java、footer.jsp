package com.itheima.register;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.itheima.utils.DataSourceUtils;

public class RegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//设置request的编码-----只适合post方式
		request.setCharacterEncoding("UTF-8");
		
		
		/*几乎不用get提交这种方式
		//get方式乱码解决
		String username = request.getParameter("username");//乱码
        //先用iso8859-1编码，再用你的UTF-8解码
		username = new String(username.getBytes("iso8859-1"),"UTF-8");
		*/
		
		
		//1.获取数据
		//String username = request.getParameter("username");
		//System.out.println(username);
		
		//String password = request.getParameter("password");
		//....有几个参数就得获取几个
		
		
		/*(原始的)2.将散装的数据封装到javaBean
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		有几个参数就封装几个
		*/
		
		
		
		
		//2.使用BeanUtils进行自动映射封装
		//BeanUtils的工作原理：将map中ed数据根据key与实体的属性的对应关系封装的
		//只要key的值（名字）与实体的属性的名字一样，就自动给你封装到实体中
		
		User user = new User();
		Map<String, String[]> properties = request.getParameterMap();
		try {
			BeanUtils.populate(user, properties);
		} catch (IllegalAccessException |InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//BeanUtils.populate(bean, properties);
		//两个参数，bean  properties
		//bean为被封装的实体，这里就是User
		//properties为一个map集合
		
		
		//到这里user对象已经封装好了
		//收到封装uid-----uuid(随机不重复的字符串32位的，java代码生成后是36位的，所以对于的web15数据库下的user表的uid为50)，因为页面没有uid
		user.setUid(UUID.randomUUID().toString());
		
		
		//3.将参数传递给一个业务操作方法
		try {
			regist(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//注册的方法
	public void regist(User user) throws SQLException{
		//操作数据库
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into user value(?,?,?,?,?,?,?,?,?,?)";
		
		runner.update(sql,user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),null,null,user.getSex(),null,null);
		
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	
	
}
