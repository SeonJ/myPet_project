<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

SESS_LOGIN_INFO : ${SESS_LOGIN_INFO}

<hr>
<a href="<c:url value='/memberA/memInfo_action' />">My Page</a>
<button onclick="${pageContext.request.contextPath}/memberA/memInfo_action" >마이페이지</button>
</body>
</html>
