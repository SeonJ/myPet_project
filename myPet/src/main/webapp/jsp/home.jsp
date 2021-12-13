<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Home</title>
	
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
					<h1>Hello world!</h1>
					<P>The time on the server is ${serverTime}. </P>
					SESS_LOGIN_INFO : ${sessionScope.SESS_LOGIN_INFO}
					<a href="<c:url value='/memberA/memInfo_action' />">My Page</a>
					<button onclick="${pageContext.request.contextPath}/memberA/memInfo_action" >마이페이지</button>
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
