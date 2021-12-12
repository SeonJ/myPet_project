<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Home</title>
	
	    <!-- Custom fonts for this template-->
<!--     <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
<!--     <link href="css/sb-admin-2.min.css" rel="stylesheet"> -->
	<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
<!-- 	<link href="resources/css/sb-admin-2.css" rel="stylesheet"> --> <!-- 이게 맞는링크 -->
</head>
<body>

<jsp:include page="/jsp/topbar.jsp" />

<jsp:include page="/jsp/sidebar.jsp" />


<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

SESS_LOGIN_INFO : ${sessionScope.SESS_LOGIN_INFO}

<hr>
<a href="<c:url value='/memberA/memInfo_action' />">My Page</a>
<button onclick="${pageContext.request.contextPath}/memberA/memInfo_action" >마이페이지</button>
</body>
</html>
