<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 목록</title>
<link href="../styledog.css" rel="stylesheet" type="text/css" >
</head>

<body>
<br /><br />
<div align="center">
<h1 align="center">반려견 목록</h1>
	<table class="mini">
		<tr>
			<td colspan="3" style="border-top: 1px solid white;"><button onclick="insertMyDog();"> 강아지 등록하기 </button></td> 
		</tr>
		<tr class="header">
			<td class="num">번호</td>
			<td>이름</td>
			<td>견종</td>
		</tr>
		<tr>
			<td colspan="3"> 반려견이 없습니다. 등록해주세요. </td>
		</tr>
				<tr>
					<td></td>
					<td><a href="dogInfo.jsp?"><font style="text-decoration:underline;"></font></a></td>
					<td></td>
				</tr> 
	</table>
</body>


<script>
$(function(){ 
	
	
});





function insertMyDog(){
	
	$.ajax({
		type: "GET", //요청 메소드 방식
		url:"/memberA/insertMyDog",
		dataType:json, //서버가 요청 URL을 통해서 응답하는 내용의 타입
		data: {memEmail : 'eunji'},
		success : function(result){
			
			
			//서버의 응답데이터가 클라이언트에게 도착하면 자동으로 실행되는함수(콜백)
			//result - 응답데이터
			//$('#result').text(result);
			alert(result);
		},
		error : function(a, b, c){
			//통신 실패시 발생하는 함수(콜백)
			alert(a + b + c);
		}
	});
	
}









</script>
</html>

