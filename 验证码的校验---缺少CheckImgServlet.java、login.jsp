//login
package com.itheima.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//解决中文乱码问题
		request.setCharacterEncoding("UTF-8");
		
		
		//验证码的校验
		//首先获得页面输入的验证码
		String checkCode_client = request.getParameter("checkCode");
		
		
		//获得生成的图片的文字的验证码
		String checkCode_session = (String) request.getSession().getAttribute("checkcode_session");
		
		
		
		//比对页面的和生成图片文字验证码是否一致
		if(!checkCode_session.equals(checkCode_client)){
			request.setAttribute("logininfo", "您输入的验证码不正确！！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
			return;
		}
		
		
		
		//获得页面的用户名跟密码进行数据库的校验
		//
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
