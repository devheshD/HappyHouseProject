<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<body>

	<section id="blog" class="blog">
		<div class="container aos-init aos-animate" data-aos="fade-up">
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-7 entries">
					<form class="form-inline">
						<button type="button" class="btn btn-info mr-3">전체 조회</button>
						<div class="form-group">
							<select class="form-control">
								<option>아파트 이름</option>
								<option>동 이름</option>
							</select>
						</div>
						<div class="form-group">
							<label for="inputPassword2" class="sr-only">Password</label> 
							<input type="text" class="form-control" id="inputPassword2" placeholder="검색어 입력">
						</div>
						<button type="button" class="btn btn-primary">검색</button>
					</form>
				
				</div>
			</div>
			<div class="row">
				<br>
			</div>
			<div class="col-lg-2"></div>
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8 entries">
					<article class="entry">
						<h2 class="entry-title">
							<a href="blog-single.html">기성 아파트</a>
						</h2>

						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Information</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">No</th>
									<td>1</td>
								</tr>
								<tr>
									<th scope="row">동</th>
									<td>사직동</td>
								</tr>
								<tr>
									<th scope="row">거래액</th>
									<td>105,000 원</td>
								</tr>
								<tr>
									<th scope="row">거래일자</th>
									<td>2019-01-07</td>
								</tr>
								<tr>
									<th scope="row">건축년도</th>
									<td>2019</td>
								</tr>
								<tr>
									<th scope="row">면적</th>
									<td>97.61</td>
								</tr>
								<tr>
									<th scope="row">층</th>
									<td>10</td>
								</tr>
								<tr>
									<th scope="row">지번</th>
									<td>9</td>
								</tr>
							</tbody>
						</table>
					</article>
					<!-- End blog entry -->

					<article class="entry">

						<div class="entry-img">
							<img src="assets/img/blog/blog-2.jpg" alt="" class="img-fluid">
						</div>

						<h2 class="entry-title">
							<a href="blog-single.html">Nisi magni odit consequatur autem
								nulla dolorem</a>
						</h2>

						<div class="entry-meta">
							<ul>
								<li class="d-flex align-items-center"><i
									class="icofont-user"></i> <a href="blog-single.html">John
										Doe</a></li>
								<li class="d-flex align-items-center"><i
									class="icofont-wall-clock"></i> <a href="blog-single.html"><time
											datetime="2020-01-01">Jan 1, 2020</time></a></li>
								<li class="d-flex align-items-center"><i
									class="icofont-comment"></i> <a href="blog-single.html">12
										Comments</a></li>
							</ul>
						</div>

						<div class="entry-content">
							<p>Incidunt voluptate sit temporibus aperiam. Quia vitae aut
								sint ullam quis illum voluptatum et. Quo libero rerum voluptatem
								pariatur nam. Ad impedit qui officiis est in non aliquid veniam
								laborum. Id ipsum qui aut. Sit aliquam et quia molestias
								laboriosam. Tempora nam odit omnis eum corrupti qui aliquid
								excepturi molestiae. Facilis et sint quos sed voluptas. Maxime
								sed tempore enim omnis non alias odio quos distinctio.</p>
							<div class="read-more">
								<a href="blog-single.html">Read More</a>
							</div>
						</div>

					</article>
					<!-- End blog entry -->

					<div class="blog-pagination">
						<ul class="justify-content-center">
							<li class="disabled"><i class="icofont-rounded-left"></i></li>
							<li><a href="#">1</a></li>
							<li class="active"><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#"><i class="icofont-rounded-right"></i></a></li>
						</ul>
					</div>

				</div>
				<!-- End blog entries list -->

				<div class="col-lg-2"></div>

			</div>

		</div>
	</section>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
