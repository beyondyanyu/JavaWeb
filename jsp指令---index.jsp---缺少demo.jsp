<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="/error.jsp" is
    pageEncoding="UTF-8" session="true" %>
    
<!-- 引入jstl核心库 -->    
<%-- <%@ taglib uri="http://" orefix="q" %> --%>
<%-- <%@ taglib uri="http://" orefix="wsq" %> --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 使用q库的标签 -->
	<!-- <q:if></q:if> -->
	
	<!-- 使用wsq库的标签 -->
	<!-- <wsq:yy></wsq:yy> -->
	
	<%@ include file = "/demo.jsp" %>
	wsqwsqwsq




	<!-- < %java 代码 % > -->      <!-- 内部的java代码翻译到service方法的内部 -->
	<%
		session.setAttribute("name", "qibao");
		
	
		int i=0;
	    System.out.println(i);  /* 会在控制台输出i的值 */
	    
	    
	    
	    /* List list = new ArrayList(); */
	    /* java.util.List list = new java.util.ArrayList(); */
	    
	    //int y=1/0;
	    
	%>
	
	<!-- < %=java 变量或表达式  > -->   <!-- 表达式，可以理解为最终有结果的东西 -->   <!-- 会被翻译成service方法内部out.print(); -->
	<%=i %>    <!-- 这里会输出i的值为0，在页面输出 -->
	
	
	<!-- < %!java 代码 % > -->		<!-- 会被翻译成servlet的成员的内容 -->
	<%!
		String sq = "hello qb";
	%>
	
	<%-- 这是一个jsp注释 --%>
	<!-- 这是一个html注释 -->
	
	<%=sq %>	<!-- 可以在页面输出sq这个字符串 -->
	
	
	
	<h1>sq</h1>
</body>
</html>






jsp的指令是指导jsp翻译和运行的命令，jsp包括三大指令：
1）page指令 --- 属性最多的指令（实际开发中page指令默认）
属性最多的一个指令，根据不同的属性，指导整个页面特性
格式：<%@ page 属性名1= "属性值1" 属性名2= "属性值2" ...%>
常用属性如下：
language：jsp脚本中可以嵌入的语言种类
pageEncoding：当前jsp文件的本身编码---内部可以包含contentType
contentType：response.setContentType(text/html;charset=UTF-8)
session：是否jsp在翻译时自动创建session
import：导入java的包
errorPage：当当前页面出错后跳转到哪个页面
isErrorPage：当前页面是一个处理错误的页面

2）include指令
页面包含（静态包含）指令，可以将一个jsp页面包含到另一个jsp页面中
格式：<%@ include file="被包含的文件地址"%>

3）taglib指令
在jsp页面中引入标签库（jstl标签库、struts2标签库）
格式：<%@ taglib uri="标签库地址" prefix="前缀"%>
