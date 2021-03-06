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
                            <h6 class="m-0 font-weight-bold text-primary">반려견 정보</h6>
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
											<td id="name">${dog.name}</td>
										</tr>
										<tr>
											<td>몸무게</td>
											<td id="weight">${dog.weight}</td>
										</tr>
										<tr>
											<td>견종</td>
											<td id="speices">${dog.speices}</td>
										</tr>
                                    </tbody>
                                </table>
								<!-- <button class="btn btn-primary btn-user btn-block" onclick="update_memInfo();" >회원정보수정</button> -->
								<button class="btn btn-primary btn-user btn-block" onclick="location.href='${pageContext.request.contextPath}/memberA/dogUpdateInfo?dogNum=${dog.dogNum}'">강아지정보수정</button>
								<button class="btn btn-primary btn-user btn-block" onclick="location.href='${pageContext.request.contextPath}/memberA/dogDeleteForm?dogNum=${dog.dogNum}'" >강아지 정보 삭제</button>
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

</html>