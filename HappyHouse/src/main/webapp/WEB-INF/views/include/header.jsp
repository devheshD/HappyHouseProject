<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="root" scope="session"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <title>Happy House</title>
   <meta content="" name="description">
   <meta content="" name="keywords">
   <!-- Google Map + House Info -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="shortcut icon" href="img/favicon.ico">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
   <!-- Favicons -->
   <link href="../assets/img/favicon.png" rel="icon">
   <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">
   
   <!-- Google Fonts -->
   <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet">
   
   <!-- Vendor CSS Files -->
   <link href="../assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet">
   <link href="../assets/vendor/icofont/icofont.min.css" rel="stylesheet">
   <link href="../assets/vendor/boxicons/css/boxicons.min.css"
      rel="stylesheet">
   <link href="../assets/vendor/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet">
   <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
   <link href="../assets/vendor/venobox/venobox.css" rel="stylesheet">
   <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
   
   <!-- Template Main CSS File -->
   <link href="../assets/css/style.css" rel="stylesheet">
</head>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
   <div class="container-fluid">
      <div class="row justify-content-center">
         <div class="col-xl-10 d-flex align-items-center">
            <h1 class="logo mr-auto">
               <a href="/">SSAFY House<span>.</span></a>
            </h1>
            <nav class="nav-menu d-none d-lg-block">
               <ul>            
                  <li>
                     <a href="/">Home</a>
                  </li>
                  <li>
                     <a href="${root }/house/search?pg=1" id="aptSearchBtn">Apartment</a>
                  </li>
                  <li>
                     <a href="${root }/house/searchDeal?pg=1" id="housingSearchBtn">Housing</a>
                  </li>
                  <li>
                     <a href="${root }/clinic/corona?page=1" id="coronaSearchBtn">Corona</a>
                  </li>
                  <li>
                     <a href="${root }/clinic/hospital?page=1" id="hospitalSearchBtn">Hospital</a>
                  </li>
                  <li>
                     <a href="${root}/notice/list?pg=1" id="announceBtn">Announcement</a>
                  </li>   
                  <li>
                     <a href="qna.html" id="qnaBtn">Q&A</a>
                  </li>         
                  <c:choose>
                     <c:when test="${userDto.id eq null }">
                        <li id="loginLi">
                           <a href="#" id="loginBtn">Login</a>
                        </li>
                        <li id="signUpLi">
                           <a href="#" id="SignUpBtn">SignUp</a>
                        </li>
                     </c:when>
                     <c:otherwise>
                        <li id="modifyLi">
                           <a href="#" id="modifyBtn" data-toggle="modal" data-target="#modifyModal">${userDto.id } 님 반갑습니다.</a>
                        </li>
                        <li id="logutLi">
                           <a href="${root }/user/logout" id="logoutBtn">Logout</a>
                        </li>
                     </c:otherwise>
                  </c:choose>
                  
               </ul>
            </nav>
            <!-- .nav-menu -->
         </div>
      </div>

   </div>
</header>
<!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
   <div class="container-fluid" data-aos="zoom-out" data-aos-delay="100">
      <div class="row justify-content-center">
         <div class="col-xl-10">
            <div class="row">
               <div class="col-xl-5">
                  <h1>Happy House in SSAFY</h1>
                  <h2>We will build a happy house through the SSAFY.</h2>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<!-- End Hero -->
<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
<c:choose>
 <c:when test="${userDto.id eq null }">
	<!-- Sign Up Modal -->
	<%@ include file="/WEB-INF/views/user/signUp.jsp"%>
	
	<!-- Login Modal -->
	<%@ include file="/WEB-INF/views/user/login.jsp"%>		 
 </c:when>
 <c:otherwise>
	<!-- Modify Modal -->
	<%@ include file="/WEB-INF/views/user/modify.jsp"%>
 </c:otherwise>
</c:choose>
