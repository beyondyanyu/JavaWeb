<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="beyond.domain.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//模拟List<String> strList
		List<String> strList = new ArrayList<String>();
		strList.add("beyond0");
		strList.add("beyond1");
		strList.add("beyond2");
		strList.add("beyond3");
		
		request.setAttribute("wsq", strList);
		
		
		
		//遍历List<User>的值
		List<User> userList = new ArrayList<User>();
		User user1 = new User();
		//list集合中的第一个元素
		user1.setId(2);
		user1.setName("qibao");
		user1.setPassword("wsq");
		userList.add(user1);
		
		//list集合中的第二个元素
		User user2 = new User();
		user2.setId(3);
		user2.setName("yanyu");
		user2.setPassword("wsq");
		userList.add(user2);
		
		application.setAttribute("qb", userList);
		
		
		
		//遍历Map<String,String>的值
		Map<String,String> strMap = new HashMap<String,String>();
		strMap.put("name", "hjj");
		strMap.put("age", "32");
		strMap.put("addr", "香港");
		strMap.put("email", "hjj@qq.com");
		session.setAttribute("strMap", strMap);
		
		
		//遍历Map<String,User>的值
		Map<String,User> userMap = new HashMap<String,User>();
		userMap.put("user1", user1);
		userMap.put("user2", user2);
		session.setAttribute("userMap", userMap);		
		
		
		
		/* //遍历Map<User,Map<String,User>>的值
		Map<User,Map<String,User>> mapMap = new HashMap<User,Map<String,User>>();
		mapMap.put(user1,userMap);
		mapMap.put(user2,userMap);
		session.setAttribute("mapMap", mapMap);	 */
		
	%>
	
	
	<h1>取出strList的数据</h1>
	<c:forEach items="${wsq}" var="str">
		${str}<br/>
	</c:forEach>
	
	
	
	<h1>取出userList的数据</h1>
	<c:forEach items="${qb}" var="user" >
		user的name:${user.name}------------user的password:${user.password} <br/>
	</c:forEach>
	
	
	<h1>取出strMap的数据</h1>
	<c:forEach items="${strMap}" var="entry">
		${entry.key}---------------${entry.value}<br/>
	</c:forEach>
	
	
	<h1>取出userMap的数据</h1>
	<c:forEach items="${userMap}" var="entry" >
		${entry.key}--------------${entry.value.id}--------------${entry.value.name}--------------${entry.value.password}<br/>
	</c:forEach>
	
	<%-- <h1>取出mapMap的数据</h1>
	<c:forEach items="${mapMap}" var="enter">
		${entry.key.key}--------------${entry.value.value.id}--------------${entry.value.name}--------------${entry.value.password}<br/>
	</c:forEach> --%>
	
	
</body>
</html>
