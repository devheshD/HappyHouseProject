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
						<li class="active">
							<a href="#">Home</a>
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
							<a href="${root }/clinic/hospital" id="hospitalSearchBtn">Hospital</a>
						</li>
						<li>
							<a href="#" id="announceBtn">Announcement</a>
						</li>
						<li>
							<a href="#" id="siteMapBtn">SiteMap</a>
						</li>
						<li id="LoginLi">
							<a href="#" id="loginBtn">Login</a>
						</li>
						<li id="SignUpLi">
							<a href="#" id="SignUpBtn">SignUp</a>
						</li>
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
<!-- Sign Up Modal -->
<div class="modal" id="SignUpModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Sign Up</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form method="post" action="${root}/member?act=signUp">
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrid" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>ID</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrid"
							placeholder="User ID" name="userId">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrpw" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>PW</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrpw"
							placeholder="영문 숫자 포함 6자리 이상" name="userPwd">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrname" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>NAME</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrname"
							placeholder="User Name" name="userName">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesremail" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>E-Mail</label>
						<div class="col-md-8"> 
							<input type="email" class="form-control" id="signup_uesremail"
							placeholder="User Email" name="userEmail">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrphone" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>PHONE</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrphone"
							placeholder="010-xxxx-xxxx" name="userPhone">
						</div>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="submit" class="btn btn-success btn-block" value="Sign Up">
						<button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Login Modal -->
<div class="modal" id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">LogIn</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form method="post" action="${root}/member?act=login">
					<div class="form-group">
						<label for="uesrid" style="font-weight: bold;">ID: </label> <input
							type="text" class="form-control" id="login_uesrid"
							placeholder="Enter ID" name="id">
					</div>
					
					<div class="form-group">
						<label for="userpw" style="font-weight: bold;">Password:
						</label> <input type="password" class="form-control" id="login_userpw"
							placeholder="Enter Password" name="pwd">
					</div>
					<div align="right">
						<a href="">비밀번호 찾기</a>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="Login">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
					<a></a>
				</form>
			</div>
		</div>
	</div>
</div>
