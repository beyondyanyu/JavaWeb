<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beyond.domain.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- 模拟域中的数据 -->
	<%
		pageContext.setAttribute("company","ScriptKiddie" );
	
	
		//存储一个字符串
		request.setAttribute("company","beyond谚语" );
		
		//存储一个对象
		User user = new User();
		user.setId(1);
		user.setName("siqi");
		user.setPassword("wsq");
		session.setAttribute("user", user);
		
		//存储一个集合
		List<User> list = new ArrayList<User>();
		User user1 = new User();
		//list集合中的第一个元素
		user1.setId(2);
		user1.setName("qibao");
		user1.setPassword("wsq");
		list.add(user1);
		
		//list集合中的第二个元素
		User user2 = new User();
		user2.setId(3);
		user2.setName("yanyu");
		user2.setPassword("wsq");
		list.add(user2);
		
		
		application.setAttribute("list", list);
		
	%>
	
	
	<!-- 脚本（jsp）的方式取出request域中的值（beyond谚语）  -->
	<%=request.getAttribute("company") %>
	
	<!-- 脚本（jsp）的方式取出User对象中的Name（siqi）中的值  -->
	<%
		User sessionUser = (User) session.getAttribute("user");
		out.write(sessionUser.getName());
	%>
	
	<hr/>
	
	
	<!-- 使用EL表达式获得request域中的值（beyond谚语）  -->
	${requestScope.company}
	
	<!-- 使用EL表达式获得User对象中的Name中的值（siqi） -->
	${sessionScope.user.name}
	
	<!-- 使用EL表达式获得 application域中的第二个元素的name（yanyu） -->
	${applicationScope.list[1].name}
	
	<hr> 
	
	<!-- 使用el表达式 全域查找  也就是把域给去掉即可-->
	${company}
	${user.name}
	${list[1].name}
	
	
	<!-- el可执行表达式的运算 -->
	${1+1}<!-- 2 -->
	${1==1?false:true}<!-- false -->
	
	<!-- empty 判定某个对象是否是null  如果是null返回true；不是返回false -->
	${empty list}<!-- 不为null，返回false -->
	${empty user}<!-- 不为null，返回false -->
		
	
</body>
</html>
