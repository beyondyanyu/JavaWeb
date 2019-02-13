<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/yy.css"><!-- 这样的地址叫做  客户端地址 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/yyy.js" ></script><!-- 这样的地址叫做  客户端地址 -->
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/el/form2.jsp" method="post"><%-- 只要是客户端地址 建议都要把web应用名称给写上：${pageContext.request.contextPath} --%>
		<input type="text" name="username"><br>
		<input type="password" name="password"><br>
		<input type="checkbox" name="hobby" value="zq">足球
		<input type="checkbox" name="hobby" value="pq">排球
		<input type="checkbox" name="hobby" value="ppq">乒乓球<br>
		<input type="submit" value="提交"><br>
	</form>
	<img alt="" src="${pageContext.request.contextPath}/1.jpg"><!-- 这样的地址叫做  客户端地址 -->
	<img alt="" src="${pageContext.request.contextPath}/2.jpg"><!-- 这样的地址叫做  客户端地址 -->
	<img alt="" src="${pageContext.request.contextPath}/1.jpg"><!-- 这样的地址叫做  客户端地址 -->
	<!-- <img alt="" src="1.jpg">这样的地址叫 相对地址，跳转的时候偶尔会出现问题 -->
</body>
</html>


<%-- 一个发出5次请求：
第一次：访问该资源，服务器返回该资源全部代码，客户端开始接受并解析
第二次：当客户端解析到<link href="${pageContext.request.contextPath}/yy.css"><!-- 这样的地址叫做  客户端地址 -->的时候，开始向服务器请求数据
第三次：<script type="text/javascript" src="${pageContext.request.contextPath}/yyy.js" ></script><!-- 这样的地址叫做  客户端地址 -->，向服务器请求数据
第四次：<img alt="" src="${pageContext.request.contextPath}/1.jpg"><!-- 这样的地址叫做  客户端地址 -->向服务器请求数据，并且缓存该图片
第五次：<img alt="" src="${pageContext.request.contextPath}/2.jpg"><!-- 这样的地址叫做  客户端地址 -->向服务器请求数据，并且缓存该图片
当访问<img alt="" src="${pageContext.request.contextPath}/1.jpg"><!-- 这样的地址叫做  客户端地址 -->的的时候，发现本客户端有该图片缓存不用向服务器请求了 --%>
