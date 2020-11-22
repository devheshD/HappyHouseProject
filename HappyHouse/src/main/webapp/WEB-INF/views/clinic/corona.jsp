<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<section id="blog" class="blog">
		<div class="container aos-init aos-animate" data-aos="fade-up">
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-7">
					<h2 style="font-weight : bold;">코로나 선별 진료소 정보</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-7 entries">
					<form class="form-inline">
						<button id="listAll" type="button" class="btn btn-info mr-3">전체 조회</button>
						<div class="form-group">
							<select class="form-control" name="key" id="key">
								<option value="healthCenterName" selected="selected">보건소 이름</option>
								<option value="city">지역</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="검색어 입력" name="word" id="word">
						</div>
						<button id="search" type="button" class="btn btn-primary">검색</button>
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
					<c:forEach var="list" items="${coronaClinicList}">
						<article class="entry">
							<h2 class="entry-title">
								<a href="#">${list.clinic_name}</a>
							</h2>
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="row">도시</th>
										<th>${list.city }</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">주소</th>
										<td>${list.address }</td>
									</tr>
									<tr>
										<th scope="row">운영시간</th>
										<td>${list.opening_hours_weekday }</td>
									</tr>
									<tr>
										<th scope="row">전화번호</th>
										<td>${list.phone }</td>
									</tr>
								</tbody>
							</table>
							<div class="entry-content">
								<div class="read-more">
									<a href="${root }/clinic/coronaDetail?name=${list.clinic_name}">Read More</a>
								</div>
							</div>
						</article>
						<!-- End apt entry -->
					</c:forEach>
					<!-- End apt list -->
					<br>
					<table align="center">
						<tr>
							<td>${pageNavigation.navigator}</td>
						</tr>
					</table>
					<br>
					<div class="col-lg-2"></div>
				</div>
				<!-- End blog entries list -->
			</div>

		</div>
	</section>
	<script>
	function pageMove(page) {
		location.href = "${root}/clinic/corona?page=" + page;		
	}
	
	// 전체 조회 버튼 클릭 이벤트
	$('#listAll').on('click', function() {
		location.href = "${root}/clinic/corona?page=1";
	});
	// 검색 버튼 클릭 이벤트
	$('#search').on('click', function() {
		let word = $('#word').val();
		let key = $('#key option:selected').val();
		
		if (word == "") {
			alert("검색어를 입력해주세요.");
		} else {
			location.href = "${root}/clinic/searchHealthCenter?page=1&word=" + word + "&keyword=" + key;
		}
		
	});
	
	</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
