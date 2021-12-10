<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::마이 프로필</title>
<link href="../styledog.css" rel="stylesheet" type="text/css" >
</head>


<body>
<br /><br />

<h1 align="center">마이 프로필</h1>

	<!-- 회원정보가 없을 때 -->
	<c:if test="${empty member.memEmail}">
		<div align="center">조회하는 회원정보가 없습니다.</div>
	</c:if>
	<!--// 회원정보가 없을 때 -->
	
	<!-- 회원정보 있을 때 -->
	<c:if test="${not empty member.memEmail}">
		<table class="mini">
			<tr><td class="profile01" align="left" style="border-top-color: white;">이메일</td></tr>
			<tr>
				<td align="left">${member.memEmail}</td>
			</tr>
			<tr><td class="profile01" align="left">사진</td></tr>
			<tr>
				<td align="left"><img src="/team04/photos/ width="200px"/>${member.photo}</td>
			</tr>
			<tr><td class="profile01" align="left">이름</td></tr>
			<tr>
				<td align="left">${member.name}</td>
			</tr>
			<tr><td class="profile01" align="left">성별</td></tr>
			<tr>
				<td align="left">${member.gender}</td>
			</tr>
			<tr><td class="profile01" align="left">연락처</td></tr>
			<tr>
				<td align="left">${member.phone}</td>
			</tr>
			<tr><td class="profile01" align="left">주소</td></tr>
			<tr>
				<td align="left">${member.address}</td>
			</tr>
			<tr><td class="profile01" align="left">이용권 잔여시간</td></tr>
			<tr>
				<td align="left"> ${member.restTime} 시간</td>
			</tr>
			<tr>
				<td class="bt_bottom"> 
					<button onclick="<c:url value='/memberA/memModifyForm' />" >회원정보수정</button>
					<button onclick="<c:url value='/memberA/memDeleteForm' />" >탈퇴</button>
				</td>
			</tr>
		</table>
	</c:if>
</body>

</html>