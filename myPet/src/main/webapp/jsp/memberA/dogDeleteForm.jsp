<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 정보 삭제</title>
	<script>
		// 유효성 검사
// 		var inputs = document.inputForm;
// 		if(!inputs.pw.value) { 	alert("비밀번호는 반드시 입력해야합니다."); return false; }
		
		function delete_check_pass(){
			
			$.ajax({
				type: "POST", 
				url:"/myPet/memberA/delete_check_pass",
				dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
				data:{
					dogNum:$('#dogNum').val(),
					pw:$('#pw').val()
				},
				success : function(result){
					
					console.log("result :",result);
					
					if(result.result == "success"){
						console.log("1111");
						alert("삭제되었습니다.");
						location.href="/myPet/memberA/myDogList";
					}else if(result.result == "falsePw"){
						console.log("2222");
						alert("비밀번호가 틀렸습니다.")
						location.reload;
					}else{
						console.log("3333");
						alert("삭제에 실패하셨습니다.");
					}
					
					
				},
				error : function(a, b, c){
				}
			});
			
		}
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
                            <h6 class="m-0 font-weight-bold text-primary">반려견 정보 삭제</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            		<input type="hidden" id="dogNum" value="${dog.dogNum}" />
									<tr>
										<td>삭제를 원하시면 비밀번호를 입력하세요. <br />
											<input type="password" id="pw" name="pw" class="form-control form-control-user" />
										</td>
									</tr>
                                </table>
								<button class="btn btn-primary btn-user btn-block" onclick="delete_check_pass();" >삭제</button>
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
</body>
</html>