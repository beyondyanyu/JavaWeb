<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- 通过taglib导入jstl的core库 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- jstl标签经常会和el表达式(从域中取东西)配合使用 -->
	<%
		request.setAttribute("count", 1014);
	%>
	<c:if test="${count==1014}">nice you are right！！</c:if>


	<!-- test代表的是一个返回boolean的表达式条件，要么是true要么是false，如果是true进入if标签内部，但是，注意这里没有else标签！！！ -->
	<c:if test="1==1">beyond</c:if>
	<c:if test="1!=1">sq</c:if>
	
	
	
	
	
	<!-- 第一种组合方式 -->
	<!-- forEach模拟
	for(int i=0;i<=5;i++){
		System.out.println(i);
	} -->
	
	
	<c:forEach begin="0" end="5" var="i">${i}<br/></c:forEach>
	<!-- 也就是从0开始到5结束每次将值赋值给i
	然后通过el表达式输出i的值，每输出一个就换行 -->
	
	
	
	
	<!-- 第二种组合方式 -->
	<!-- forEach模拟
	增强for循环 	productList----List<Product>
	for(Product product : productList){}
		System.out.println(product.getPname());
	-->
	
	<!-- items:是一个集合或者数组   var:代表集合中的某一个元素 -->
	<c:forEach items="${productList}" var="pro">
		${pro.pname}
	
	</c:forEach>
	
	
	
	
</body>
</html>
