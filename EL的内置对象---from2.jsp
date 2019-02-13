<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 获得表单的参数 -->
	
	<%
		request.getParameter("username");
		request.getParameter("password");
		request.getParameter("hobby");
		
	
	
	%>
	
	
	<!-- 使用el获得参数  内置对象.需要获取的数据 -->
	${param.username}<!-- 获取到username（beyond）并输出到页面上 -->
	${header.Host}
	${header["User-Agent"]}<!-- 因为这里的User-Agent有-特殊符号，所以得使用[] -->
	${header["Host"]}<!-- 能用.操作的都可以用[""]操作 -->
	
	
	${initParam.beyond.value}
	
	
	${cookie.name.value}<!-- 访问cookie的值（beyond） ，在页面中获得value的值-->
	
	<!-- 通过el表达式获得request对象    其中requestScope代表域-->
	${pageContext.request}<!-- pageContext可以获得其中八大对象 -->
	
</body>
</html>
