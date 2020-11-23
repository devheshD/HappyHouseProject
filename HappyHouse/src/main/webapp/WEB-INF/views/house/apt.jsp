<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript">
	function searchAll() {
		document.location.href = "${root}/house/search?pg=1";
	}
	function search() {
		if (document.getElementById("word").value == "") {
			alert("내용 입력 !!!");
			return;
		}

		var sel = document.getElementById("key");
		var tmp = document.getElementById("word");
		if (sel.options[sel.selectedIndex].value == "aptname") {
			document.location.href = "${root}/house/searchAptName?pg=1&word="
					+ tmp.value;
		} else if (sel.options[sel.selectedIndex].value == "dongname") {
			document.location.href = "${root}/house/searchDongName?&pg=1&word="
					+ tmp.value;
		}
	}
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		document.location.href = "${root}/house/search?pg=" + pg;
	}
</script>
<body>
	<!-- navigation hidden form -->
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="notice"> <input
			type="hidden" name="pg" id="pg" value="">
	</form>

	<section id="blog" class="blog">
		<div class="container aos-init aos-animate" data-aos="fade-up">
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-7">
					<h2 style="font-weight: bold;">아파트 실거래가 목록</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-7 entries">
					<form class="form-inline">
						<button type="button" class="btn btn-info mr-3"
							onclick="javascript:searchAll();">전체 조회</button>
						<div class="form-group">
							<select class="form-control" name="key" id="key">
								<option value="aptname" selected="selected">아파트 이름</option>
								<option value="dongname">동 이름</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="검색어 입력"
								name="word" id="word">
						</div>
						<button type="button" class="btn btn-primary"
							onclick="javascript:search();">검색</button>
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

					<c:forEach var="deal" items="${deals}">
						<article class="entry">
							<h2 class="entry-title">
								<a
									onclick="document.location.href='${root}/house/show?no=${deal.no}'">${deal.aptName}</a>
							</h2>

							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>${deal.no}</th>
										<th>Information</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">동</th>
										<td>${deal.dong}</td>
									</tr>
									<tr>
										<th scope="row">거래액</th>
										<td>${deal.dealAmount}만원</td>
									</tr>
									<tr>
										<th scope="row">면적</th>
										<td>${deal.area}m<sup>2</sup></td>
									</tr>
									<tr>
										<th scope="row">층</th>
										<td>${deal.floor}층</td>
									</tr>
								</tbody>
							</table>
							<div class="entry-content">
								<div class="read-more">
									<a
										onclick="document.location.href='${root}/house/show?no=${deal.no}'">Read
										More</a>
								</div>
							</div>
						</article>
						<!-- End apt entry -->
					</c:forEach>
					<!-- End apt list -->

					<br>
					<table align="center">
						<tr>
							<td>${navigation.navigator}</td>
						</tr>
					</table>
					<br>

					<div class="col-lg-2"></div>
				</div>
				<!-- End blog entries list -->
			</div>

		</div>
	</section>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
