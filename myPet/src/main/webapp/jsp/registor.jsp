<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
<!--     <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->

    <!-- Custom styles for this template-->
	<link href="resources/css/sb-admin-2.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form id="user" method="post" name="Form" action="${pageContext.request.contextPath}/registor_action">
                               <!--  <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="First Name">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="Last Name">
                                    </div>
                                </div> -->
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="memEmail" name="memEmail"
                                        placeholder="Email">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" id="pw" name="pw" 
                                        placeholder="Password">
                                    </div>
                                    <!-- <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="repeatPw" placeholder="Repeat Password">
                                    </div> -->
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="photo" name="photo"
                                        placeholder="photo">
                                    </div>
                                    <!-- <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            id="insertPhoto" placeholder="upload a photo">
                                	</div> -->
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="name" name="name"
                                        placeholder="name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="gender" name="gender"
                                        placeholder="gender">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="phone" name="phone" 
                                        placeholder="phone">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="address" name="address" 
                                        placeholder="address">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="restTime" name="restTime"
                                        placeholder="restTime" value="0">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="state" name="state"
                                        placeholder="state" value="approve">
                                </div>
                                <%-- <a href="${pageContext.request.contextPath}/registor_action" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </a> --%>
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="Register Account" />
                                <!-- onclick="insertMem();" -->
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="${pageContext.request.contextPath}/login">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

<!--     Bootstrap core JavaScript -->
    <script src="/js/jquery/jquery.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>




 <script>
$(function(){ 
	
	
});


function insertMem(){
	
	$.ajax({
		type: "POST", //요청 메소드 방식
		url:"/registor_action",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		data: $("#user").serialize(),
		success : function(result){
			
// 			console.log(result);
			alert(result.msg);
			
		},
		error : function(a, b, c){
			//통신 실패시 발생하는 함수(콜백)
			alert(a + b + c);
		}
	});
	
}


</script>
</body>
</html>