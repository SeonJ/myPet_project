<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.navbar_n {
  position: relative;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
}

.navbar-dark_n .navbar-brand_n {
  color: #fff;
}

.bg-primary_n {
  --bs-bg-opacity: 1;
  background-color: rgba(var(--bs-primary-rgb), var(--bs-bg-opacity)) !important;
}

.fixed-top_n {
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  z-index: 1030;
}

#sideNav_n {
  padding-left: 1rem;
  padding-right: 1rem;
}

</style>

</head>
<body>
<nav class="navbar_n navbar-dark_n bg-primary_n fixed-top_n" id="sideNav_n">
     <a class="navbar-brand js-scroll-trigger" href="#page-top">
         <span class="d-block d-lg-none">Clarence Taylor</span>
         <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="assets/img/profile.jpg" alt="..." /></span>
     </a>
     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
     <div class="collapse navbar-collapse" id="navbarResponsive">
         <ul class="navbar-nav">
             <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li>
             <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">Experience</a></li>
             <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">Education</a></li>
             <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#skills">Skills</a></li>
             <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#interests">Interests</a></li>
             <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#awards">Awards</a></li>
         </ul>
     </div>
 </nav>




</body>
</html>