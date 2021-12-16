<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>개와함개::반려견 목록</title>
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
                    <div style="display:flex; justify-content: space-between;">
                    	<h1 class="h3 mb-2 text-gray-800">원하시는 시간을 구매해주세요.</h1>
<%--                     	<button class="btn btn-warning btn-icon-split" style="height:28px;" onclick="location.href='${pageContext.request.contextPath}/memberA/insertMyDog'">반려견 등록하기</button> --%>
                    </div>
                    <div style="display:inline-flex;">
                    	<div class="col-xl-4 col-lg-5" id="dog_list">
                          <div class="card shadow mb-4">
                             <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                 <h6 class="m-0 font-weight-bold text-primary">한달에 한번, 맡아주실 분이 필요해요.</h6>
                             </div>
                             <div class="card-body">
	                   			<div class="w_pswl_item_content">
			                        <div class="w_pswl_ic_top">
			                            <h5>총 10시간 돌봄권</h5>
			                            <p>월 1-2회 권장</p>
			                            <P href="" class="mt_10 mb_10">5% 할인</P>
			                        </div>
	
			                        <div class="w_pswl_ic_bottom mt_20">
			                            <p>  100,000원 <span>(돌봄 1회당 10,000원)</span></p>
			                            <a href="">구매하기</a>
			                        </div>
	                   			 </div>
            				  </div>
                          </div>
						</div>
						<div class="col-xl-4 col-lg-5" id="dog_list">
	                          <div class="card shadow mb-4">
	                             <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                 <h6 class="m-0 font-weight-bold text-primary">약 1주일에 한번 출장을 가야해요.</h6>
	                             </div>
	                            <div class="card-body">
		                   			<div class="w_pswl_item_content">
				                        <div class="w_pswl_ic_top">
				                            <h5>총 30시간 돌봄권</h5>
				                            <p>주 1-2회 권장</p>
				                            <P href="" class="mt_10 mb_10">15% 할인</P>
				                        </div>
		
				                        <div class="w_pswl_ic_bottom mt_20">
				                            <p>  270,000원 <span>(돌봄 1회당 9000원)</span></p>
				                            <a href="">구매하기</a>
				                        </div>
		                   			 </div>
            				  	</div>
	                          </div>
						</div>
						<div class="col-xl-4 col-lg-5" id="dog_list">
	                          <div class="card shadow mb-4">
	                             <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                 <h6 class="m-0 font-weight-bold text-primary">매일 출근시간에 강아지가 외로워해요.</h6>
	                             </div>
	                             <div class="card-body">
		                   			<div class="w_pswl_item_content">
				                        <div class="w_pswl_ic_top">
				                            <h5>총 100시간 돌봄권</h5>
				                            <p>주5일 권장</p>
				                            <P href="" class="mt_10 mb_10">48% 할인</P>
				                        </div>
		
				                        <div class="w_pswl_ic_bottom mt_20">
				                            <p>  650,000 <span>(돌봄 1회당 6500원)</span></p>
				                            <a href="">구매하기</a>
				                        </div>
		                   			 </div>
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
    
</body>
<script>

$(function($){
	   

});



}


</script>
</html>

