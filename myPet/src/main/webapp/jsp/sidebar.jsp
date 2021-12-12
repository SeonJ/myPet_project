<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <!-- Sidebar -->
<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar" style="width:16em !important; background-color:#f6c23e;">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">My Pet</div>
     </a>
     <li class="nav-item"><div class="nav-link" style="text-align:center;"><img src="/img/emma.png" style="width:150px; height:150px; border-radius: 50%; "></div></li>
     <li><h6 style="color:black; text-align:center;">사용시간: 100분</h6></li>
     <li><h6 style="color:black; text-align:center;">잔여시간: 100분</h6></li>
    
     <li class="nav-item"><button class="nav-link" style="text-align:center;" onclick="memInfo_action();">마이프로필</button></li>
     <li class="nav-item"><a class="nav-link" style="text-align:center;" href="#education">반려견프로필</a></li>
     <li class="nav-item"><a class="nav-link" style="text-align:center;" href="#skills">회원탈퇴</a></li>
     <li class="nav-item"><a class="nav-link" style="text-align:center;" href="#interests">메인으로</a></li>

</ul>
<!-- End of Sidebar -->
<script>

function memInfo_action(){
	
	$.ajax({
		type: "POST", 
		url:"/myPet/memberA/memInfo",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			
			console.log("result :",result);
			console.log(result.member);
			
			if(result.result == "success"){
				console.log("aaaaa");
				alert("마이페이지로 이동합니다.");
				result.member;
				/* location.href="/myPet/memberA/memInfo"; */
			}else{
				alert("로그인하셔야 이용 가능한 페이지입니다.");
				location.href="/myPet/login"
			}
			
		
			
		},
		error : function(a, b, c){
		}
	});

}

</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>



