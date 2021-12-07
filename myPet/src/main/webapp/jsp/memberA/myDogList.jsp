<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 목록</title>
<link href="../styledog.css" rel="stylesheet" type="text/css" >
</head>
<%-- <%
	request.setCharacterEncoding("UTF-8");
//로그인 상태 검사
	if(session.getAttribute("memId") == null) { %> --%>
		<script>alert("로그인 후 이용 가능합니다."); window.location="../totalMain.jsp"; </script>
<%-- <%
	} else {
	// 게시판에 있는 임의의 글 번호
	int number = 0;
	String memEmail = (String)session.getAttribute("memId");
	DogDAO dao = DogDAO.getInstance();
	int count = dao.getDogCount(memEmail);
	List getDogList = null;
	if(count>0){ getDogList = dao.getDogList(memEmail);	}
	
%> --%>
<body>
<br /><br />
<div align="center">
<%-- 	<jsp:include page="../header.jsp" /><br />
	<jsp:include page="../infoHeader.jsp" /><br />
	<jsp:include page="memMenu.jsp" /> --%>
</div><br />
<h1 align="center">반려견 목록</h1>
	<table class="mini">
		<tr>
			<td colspan="3" style="border-top: 1px solid white;"><button onclick="window.location='dogWriteForm.jsp'"> 강아지 등록하기 </button></td> 
		</tr>
		<tr class="header">
			<td class="num">번호</td>
			<td>이름</td>
			<td>견종</td>
		</tr>
<%-- 	<% if(count <= 0) { %>
		<tr>
			<td colspan="3"> 반려견이 없습니다. 등록해주세요. </td>
		</tr>
	<%}else{ // 데이터가 있으면	
			for(int i = 0; i < getDogList.size(); i++){ 
				DogDTO dog = (DogDTO)getDogList.get(i); %>
				<tr>
					<td><%= i+1 %></td>
					<td><a href="dogInfo.jsp?dogNum=<%= dog.getDogNum() %>"><font style="text-decoration:underline;"><%=dog.getName() %></font></a></td>
					<td><%= dog.getSpeices() %></td>
				</tr> --%>
		<%-- <%} // for문 
	}// if문 - 게시글 유무 %> --%>
	</table>
</body>
<%-- <%} %> --%>
</html>