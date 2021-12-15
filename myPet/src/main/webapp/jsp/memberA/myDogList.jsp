<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 목록</title>
<link href="../styledog.css" rel="stylesheet" type="text/css" >
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
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div class="nav-link" style="align:left;">
                            		<img id="photo" src="/myPet/resources/img/undraw_rocket.png" style="width:200px; height:200px; border-radius: 50%;">
                            		<div style="margin-left: 15px; margin-top: 20px">
                                		<button id="name" onclick="dogInfo();" class="btn btn-primary btn-user btn-block ml-2" style="width:150px;"></button>
                                	</div>
                                </div>
                            	<div style="margin-top: 200px">
                            		<button class="btn btn-primary btn-user btn-block" onclick="location.href='${pageContext.request.contextPath}/memberA/insertMyDog'">반려견 등록하기</button>
                            	</div>
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
<!-- <div align="center">
<h1 align="center">반려견 목록</h1>
	<table class="mini">
		<tr>
			<td colspan="3" style="border-top: 1px solid white;"><a href="${pageContext.request.contextPath}/memberA/insertMyDog"> 강아지 등록하기 </a></td> 
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
	</table> -->
</body>
<script>

$(function($){
	   
	   dogList_action();

});

function myDogList(){
	
	$.ajax({
		type: "POST", 
		url:"/myPet/memberA/myDogList",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success : function(result){
			
			var dogList = JSON.parse(result.dogList);
			console.log(result.dogList);
			console.log(dogList);
			
			var name = dogList.name;
			var photo = dogList.photo;
			
			$('#name').text(name);
			$('#photo').text(photo);
			
		},
		error : function(a, b, c){
		}
	});

}

</script>
</html>

