<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 등록</title>
<link href="../styledog.css" rel="stylesheet" type="text/css" >
<script>
	
</script>
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
                    <h1 class="h3 mb-2 text-gray-800">반려견 프로필</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">반려견 등록</h6>
                        </div>
                     
                        <div class="card-body">
                            <div class="table-responsive">
                                 <form id="dog" method="post" name="Form">
	                                <div class="form-group">
	                                    <input type="text" class="form-control form-control-user" id="name" name="name"
	                                        placeholder="Dog Name">
	                                </div>
	                                <div class="form-group row">
	                                    <div class="col-sm-6 mb-3 mb-sm-0">
	                                        <input type="text" class="form-control form-control-user" id="photo" name="photo" 
	                                        placeholder="Dog Pictures">
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <input type="text" class="form-control form-control-user" id="weight" name="weight"
	                                        placeholder="Dog Weight">
	                                </div>
	                                <div class="form-group">
	                                    <input type="text" class="form-control form-control-user" id="speices" name="speices" 
	                                        placeholder="Dog Speices">
	                                </div>
	                                <button type="button" onClick ="insertDog();" class="btn btn-primary btn-user btn-block">등록하기</button>
                            	</form>
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
</body>
<script>

function insertDog(){
	
	$.ajax({
		type: "POST", //요청 메소드 방식
		url:"/myPet/memberA/insertDog_action",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		data: {
			name : $('#name').val(),
			photo : $('#photo').val(),
			weight : $('#weight').val(),
			speices : $('#speices').val()
		},
		success : function(result){
			
// 			console.log(result);
// 			alert(result.msg);
			
			
			console.log("result :",result);
			
			if(result.result == "success"){
				alert("강아지 정보를 생성하였습니다.")
				location.href="/myPet/memberA/myDogList";
			}else{
				alert("강아지 정보 생성에 실패하셨습니다.");
			}
			
		},
		error : function(a, b, c){
			//통신 실패시 발생하는 함수(콜백)
			alert(a + b + c);
		}
	});
	
}


</script>
</html>