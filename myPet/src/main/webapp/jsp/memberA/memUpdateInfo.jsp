<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::마이 프로필 정보 수정</title>
<!-- <link href="../styledog.css" rel="stylesheet" type="text/css" > -->
</head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마이페이지</title>

    <!-- Custom fonts for this template-->
<!--     <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
<!--     <link href="css/sb-admin-2.min.css" rel="stylesheet"> -->
	<link href="../resources/css/sb-admin-2.css" rel="stylesheet">
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
                            <h6 class="m-0 font-weight-bold text-primary">마이 프로필 정보 수정</h6>
                        </div>
                     
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div class="nav-link" style="text-align:center;">
                                    	<img src="../resources/img/emma.png" style="width:150px; height:150px; border-radius: 50%; ">
                                    </div>
                                    
                                    <tbody>
                                        <tr>
                                        	<th>이메일</th>
											<td id="memEmail"></td>
										</tr>
										<tr>
                                        	<th>비밀번호</th>
											<td>
												<input type="text" id="pw" name="pw">
											</td>
										</tr>
										<tr>
                                        	<th>프로필 사진</th>
											<td>
												<input type="text" id="photo" name="photo">
											</td>
										</tr>
										<tr>
											<th>이름</th>
											<td id="name"></td>
										</tr>
										<tr>
											<th>성별</th>
											<td id="gender"></td>
										</tr>
										<tr>
											<th>연락처</th>
											<td>
												<input type="text" id="phone" name="phone">
											</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>
												<input type="text" id="address" name="address">
											</td>
										</tr>
                                    </tbody>
                                </table>
								<button class="btn btn-primary btn-user btn-block" onclick="update_memInfo();" >회원정보수정</button>
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

<!--     Scroll to Top Button -->
<!--     <a class="scroll-to-top rounded" href="#page-top"> -->
<!--         <i class="fas fa-angle-up"></i> -->
<!--     </a> -->

<!--     Logout Modal -->
<!--     <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" -->
<!--         aria-hidden="true"> -->
<!--         <div class="modal-dialog" role="document"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="modal-header"> -->
<!--                     <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5> -->
<!--                     <button class="close" type="button" data-dismiss="modal" aria-label="Close"> -->
<!--                         <span aria-hidden="true">×</span> -->
<!--                     </button> -->
<!--                 </div> -->
<!--                 <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div> -->
<!--                 <div class="modal-footer"> -->
<!--                     <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button> -->
<!--                     <a class="btn btn-primary" href="login.html">Logout</a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

    <!-- Bootstrap core JavaScript-->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>


</body>
<script>

$(function($){
	   
	   update_form();

});

function update_form(){
	
	$.ajax({
		type: "POST", 
		url:"/myPet/memberA/update_form",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			
			var member = JSON.parse(result.member);
			console.log(result.member);
			console.log(member);
			
			var memEmail = member.memEmail;
			var pw = member.pw;
			var photo = member.photo;
			var name = member.name;
			var gender = member.gender;
			var phone = member.phone;
			var address = member.address;
			
			$('#memEmail').text(memEmail);
			$('#pw').val(pw);
			$('#photo').val(photo);
			$('#name').text(name);
			$('#gender').text(gender);
			$('#phone').val(phone);
			$('#address').val(address);
			
		},
		error : function(a, b, c){
		}
	});

}

function update_memInfo(){
	
	$.ajax({
		type: "POST", //요청 메소드 방식
		url:"/myPet/memberA/update_memInfo",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		data: {
			pw : $('#pw').val(),
			photo : $('#photo').val(),
			phone : $('#phone').val(),
			address : $('#address').val()
		},
		success : function(result){
			
// 			console.log(result);
			
			
			console.log("result :",result);
			
			if(result.result == "success"){
				alert("회원 정보를 수정하였습니다.")
				location.href="/myPet/memberA/memInfo";
			}else{
				alert("회원정보 수정에 실패하였습니다");
			}
			
		},
		error : function(a, b, c){
			//통신 실패시 발생하는 함수(콜백)
			alert(a + b + c);
		}
	});
	
}

</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</html>