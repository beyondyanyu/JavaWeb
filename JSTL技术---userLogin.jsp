<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "beyond.domain.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 模拟用户已经登陆成功 -->
	<%	User user = new User();
		user.setId(1014);
		user.setName("wsq");
		user.setPassword("wsq");
		session.setAttribute("user", user);/* 把user放到session域当中 */
	%>
</body>
</html>
