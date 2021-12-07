<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 정보 삭제</title>
<link href="../styledog.css" rel="stylesheet" type="text/css">
	<script>
		// 유효성 검사
		var inputs = document.inputForm;
		if(!inputs.pw.value) { 	alert("비밀번호는 반드시 입력해야합니다."); return false; }
	</script>
</head>
<%	// 로그인 상태 검사
if(session.getAttribute("memId") == null) { %>
		<script>
			alert("로그인 후 이용 가능합니다.");
			window.location="../totalMain.jsp";
		</script>
	<%	}else if(request.getParameter("dogNum") == null) { %>
		<script>
			alert("비정상적인 접근입니다.");
			window.location="myDogList.jsp";
		</script>
<% }else {
	String memEmail = request.getParameter("memId");
	int dogNum = Integer.parseInt(request.getParameter("dogNum"));
%>
<body>
<br /><br />
	<div align="center">
	</div><br />
<h1 align="center">반려견 정보 삭제</h1>
	<form action="dogDeletePro.jsp?dogNum=<%=dogNum%>" method="post" name="inputForm" onsubmit="return check()" >
		<table class="mini">
			<tr>
				<td>삭제를 원하시면 비밀번호를 입력하세요. <br />
					<input type="password" name="pw" />
				</td>
			</tr>
			<tr>
				<td class="bt_bottom">
					<input type="submit" value="반려견 삭제" />
					<input type="button" value="취소" onclick="window.location='dogInfo.jsp?dogNum=<%= dogNum %>'" />
				</td>
			</tr>
		</table>
	</form>
</body>
<%} %>
</html>