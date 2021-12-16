<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>
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
                            <h6 class="m-0 font-weight-bold text-primary">반려견 프로필 수정</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <div class="nav-link" style="text-align:center;"><img src="/myPet/resources/img/emma.png" style="width:150px; height:150px; border-radius: 50%; ">
                                    </div>
                                    <input type="hidden" id="dogNum" value="${dog.dogNum}" />
                                    <tbody>
										<tr>
											<td>이름</td>
											<td>
												<input type="text"  id="name" value="${dog.name}" />
											</td>
										</tr>
										<tr>
											<td>사진</td>
											<td>
												<input type="text"  id="photo" value="${dog.photo}" />
											</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td>
												<input type="text" id="weight" value="${dog.weight}" />
											</td>
										</tr>
										<tr>
											<td>견종</td>
											<td>
												<input type="text" id="speices" value="${dog.speices}" />
											</td>
										</tr>
                                    </tbody>
                                </table>
								<button class="btn btn-primary btn-user btn-block" onclick="update_dogInfo();">강아지정보수정</button>
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
function update_dogInfo(){
	
		$.ajax({
			type: "POST", 
			url:"/myPet/memberA/update_dogInfo",
			dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			data:{
				dogNum:$('#dogNum').val(),
				name:$('#name').val(),
				photo:$('#photo').val(),
				weight:$('#weight').val(),
				speices:$('#speices').val(),
				
			},
			success : function(result){
				
				console.log("result :",result);
				
				if(result.result == "success"){
					alert("수정되었습니다.");
					location.href="/myPet/memberA/myDogList";
				}else{
					alert("수정에 실패하셨습니다.");
				}
				
				
			},
			error : function(a, b, c){
			}
		});
		
}

</script>

</html>