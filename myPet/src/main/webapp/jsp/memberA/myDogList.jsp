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
                    	<h1 class="h3 mb-2 text-gray-800">My Pet</h1>
                    	<button class="btn btn-warning btn-icon-split" style="height:28px;" onclick="location.href='${pageContext.request.contextPath}/memberA/insertMyDog'">반려견 등록하기</button>
                    </div>
<!--                      <div class="card-header py-3" > -->
<!--                      </div> -->
                    
                     <div class="col-xl-4 col-lg-5" id="dog_list">
<!--                              <div class="card shadow mb-4"> -->
<!--                                 Card Header - Dropdown -->
<!--                                 <div -->
<!--                                     class="card-header py-3 d-flex flex-row align-items-center justify-content-between"> -->
<!--                                     <h6 class="m-0 font-weight-bold text-primary" id="dog_name"></h6> -->
<!--                                     <div class="dropdown no-arrow"> -->
<!--                                         <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" -->
<!--                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                                             <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
<!--                                         </a> -->
<!--                                         <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
<!--                                             aria-labelledby="dropdownMenuLink"> -->
<!--                                             <div class="dropdown-header">Dropdown Header:</div> -->
<!--                                             <a class="dropdown-item" href="#">수정</a> -->
<!--                                             <div class="dropdown-divider"></div> -->
<!--                                             <a class="dropdown-item" href="#">삭제</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 Card Body -->
<!--                                 <div class="card-body"> -->
<!--                                 	<img id="photo" src="/myPet/resources/img/undraw_rocket.png" style="width:200px; height:200px; border-radius: 50%;"> -->
<!--                                  	<div style="margin-left: 15px; margin-top: 20px">   -->
<!--                                 		<button id="name" onclick="dogInfo();" class="btn btn-primary btn-user btn-block ml-2" style="width:150px;">상세보기</button>  -->
<!--                                 	</div>  -->
<!--                                 </div> -->
<!--                             </div> -->
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

function dogList_action(){
	
	$.ajax({
		type: "POST", 
		url:"/myPet/memberA/myDogList_action",
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		
		success : function(result){
			var dogList = JSON.parse(result.dogList);
			console.log(dogList);
			
			
			for(var i=0; i<dogList.length; i++){
				
				console.log("name :",dogList[i].name);
				var dog_card = '<div class="card shadow mb-4">';
				dog_card +='<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">';
				dog_card +='<h6 class="m-0 font-weight-bold text-primary" id="">'+dogList[i].name+'</h6>';
				dog_card +='<div class="dropdown no-arrow">';
				dog_card +=' <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
				dog_card +='<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> </a>';
				dog_card +='<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">';
				dog_card +='<div class="dropdown-header">Dropdown Header:</div>';
				dog_card +='<a class="dropdown-item" href="${pageContext.request.contextPath}/memberA/dogUpdateInfo?dogNum='+dogList[i].dogNum+'">수정</a>';
				dog_card +='<div class="dropdown-divider"></div>';
// 				dog_card +='<input type="text" id="dogNum" value="'+dogList[i].dogNum+'"/>';
				dog_card +='<a class="dropdown-item" href="${pageContext.request.contextPath}/memberA/dogDeleteForm?dogNum='+dogList[i].dogNum+'">삭제</a>';
				dog_card +='</div></div></div>';
				dog_card +='<div class="card-body">';
				dog_card +='<img id="photo" src="/myPet/resources/img/undraw_rocket.png" style="width:200px; height:200px; border-radius: 50%;">';
				dog_card +='<div style="margin-left: 15px; margin-top: 20px">';
				dog_card +='<a href="${pageContext.request.contextPath}/memberA/dogInfo?dogNum='+dogList[i].dogNum+'" class="btn btn-primary btn-user btn-block ml-2" style="width:150px;">상세보기</a> ';
				dog_card +='</div></div></div>';
                
				
				
				$('#dog_list').append(dog_card);
			}
			
// 			var name = dogList.name;
// 			var photo = dogList.photo;
			
// 			$('#name').text(name);
// 			$('#photo').text(photo);
			
		},
		error : function(a, b, c){
			console.log(a,b,c);
		}
	});

}


</script>
</html>

