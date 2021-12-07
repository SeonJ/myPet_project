<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 등록</title>
<link href="../styledog.css" rel="stylesheet" type="text/css" >
<script>
		// 유효성 검사
		function check() {
			var inputs = document.inputForm;
			if(!inputs.name.value) { alert("강아지 이름은 반드시 입력해야합니다.");  return false; }
			if(!inputs.photo.value) { alert("강아지 사진은 반드시 입력해야합니다.");  return false; }
			if(!inputs.weight.value) { alert("강아지 몸무게는 반드시 입력해야합니다.");  return false; }
			if(!inputs.speices.value) { alert("강아지 견종은 반드시 입력해야합니다.");  return false; }
			if(inputs.weight.value <= 0){alert("몸무게는 1 이상의 수만 입력가능합니다."); return false; }
		}
</script>
</head>
<%
	request.setCharacterEncoding("UTF-8");
//로그인 상태 검사
	if(session.getAttribute("memId") == null) { %>
		<script>
			alert("비정상적인 접근입니다. 로그인 후 이용 가능합니다.");
			window.location="../totalMain.jsp";
		</script>
<%	}else {
	String memEmail = (String)session.getAttribute("memId");
%>
<body>
<br /><br />
<div align="center">
<%-- 	<jsp:include page="../header.jsp" /><br />
	<jsp:include page="../infoHeader.jsp" /><br />
	<jsp:include page="memMenu.jsp" /> --%>
</div><br />
<h1 align="center">반려견 등록</h1>
<form action="dogWritePro.jsp" method="post" enctype="multipart/form-data" name="inputForm" onsubmit="return check()" >
	<table class="mini">
		<tr><td class="profile01" align="left" style="border-top-color: white;">이름</td></tr>
		<tr>
			<td align="left"><input type="text" name="name" /></td>
		</tr>
		<tr><td class="profile01" align="left">사진</td></tr>
		<tr>
			<td align="left"><input type="file" name="photo" /></td>
		</tr>
		<tr><td class="profile01" align="left">몸무게</td></tr>
		<tr>
			<td align="left"><input type="number" name="weight" /></td>
		</tr>
		<tr><td class="profile01" align="left">견종</td></tr>
		<tr>
			<td align="left"><input type="text" name="speices" /></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="등록하기" />
				<input type="button" value="취소" onclick="window.location='myDogList.jsp'"/>
			</td>
		</tr>
	</table>
</form>
</body>
<%} %>
</html>