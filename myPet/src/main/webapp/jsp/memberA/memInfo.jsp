<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::마이 프로필</title>
</head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마이페이지</title>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		 <jsp:include page="/jsp/sidebar.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
				 <jsp:include page="/jsp/topbar.jsp" />
               

              <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">마이 페이지</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">마이 프로필</h6>
                        </div>
                     
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div class="nav-link" style="text-align:center;"><img src="/myPet/resources/img/emma.png" style="width:150px; height:150px; border-radius: 50%; ">
                                    </div>
                                    
                                    <tbody>
                                        <tr>
                                        	<td>이메일</td>
											<td id="memEmail"></td>
										</tr>
										<tr>
											<td>이름</td>
											<td id="name"></td>
										</tr>
										<tr>
											<td>성별</td>
											<td id="gender"></td>
										</tr>
										<tr>
											<td>연락처</td>
											<td id="phone"></td>
										</tr>
										<tr>
											<td>주소</td>
											<td id="address"></td>
										</tr>
										<tr>
											<td>이용권 잔여시간</td>
											<td id="restTime"></td>
										</tr>
                                    </tbody>
                                </table>
								<!-- <button class="btn btn-primary btn-user btn-block" onclick="update_memInfo();" >회원정보수정</button> -->
								<button class="btn btn-primary btn-user btn-block" onclick="location.href='${pageContext.request.contextPath}/memberA/memUpdateInfo'">회원정보수정</button>
								<button class="btn btn-primary btn-user btn-block" onclick="delete_memInfo();" >탈퇴</button>
                            </div>
                        </div>
                    </div>
                 </div>
                  <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

           
            <jsp:include page="/jsp/footer.jsp" />
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->


<script>

$(function($){
	   
	   memInfo_action();

});

function memInfo_action(){
	
	$.ajax({
		type: "POST", 
		url:"/myPet/memberA/memInfo_action",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			
			var member = JSON.parse(result.member);
			console.log(result.member);
			console.log(member);
			
			var memEmail = member.memEmail;
			var name = member.name;
			var gender = member.gender;
			var phone = member.phone;
			var address = member.address;
			var restTime = member.restTime;
			
			$('#memEmail').text(memEmail);
			$('#name').text(name);
			$('#gender').text(gender);
			$('#phone').text(phone);
			$('#address').text(address);
			$('#restTime').text(restTime);
			
		},
		error : function(a, b, c){
		}
	});

}


function delete_memInfo(){
	
	if(confirm("정말 삭제 하시겠습니까?")){
		
		$.ajax({
			type: "POST", 
			url:"/myPet/memberA/deleteMem_action",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			success : function(result){
				
				console.log("result :",result);
				
				if(result.result == "success"){
					alert("회원 탈퇴되었습니다.");
					location.href="/myPet/";
				}else{
					alert("회원 탈퇴에 실패하셨습니다.");
				}
				
				
			},
			error : function(a, b, c){
			}
		});
		
	} else {
		console.log("취소");
	}
}


</script>
</body>
</html>