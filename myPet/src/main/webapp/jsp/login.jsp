<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

<!--     Custom fonts for this template -->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

<c:if test="${not empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>

    <div class="container">

<!--         Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        Nested Row within Card Body
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <div class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="memEmail" name="memEmail" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="pw" name="pw" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
<!--                                         <input type="submit" class="btn btn-primary btn-user btn-block" value ="Login" /> -->
												<button onclick="login_action();" class="btn btn-primary btn-user btn-block">login</button>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </div>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath}/registor">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/js/jquery/jquery.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
	
</body>
<script>

function login_action(){
	
	
	$.ajax({
		type: "POST", 
		url:"/myPet/login_action",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		data: {memEmail : $('#memEmail').val(), pw : $('#pw').val()},
		success : function(result){
			
			console.log("result :",result);
			
			if(result.result == "success"){
				location.href="/myPet/";
			}else{
				alert("로그인에 실패하셨습니다.");
			}
			
			
			
			
			
		},
		error : function(a, b, c){
		}
	});
	
	
	
	
	
	
	
}


</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</html>