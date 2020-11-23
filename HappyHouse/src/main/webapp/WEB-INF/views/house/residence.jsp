<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript">
	function searchDeal() {
		document.location.href = "${root}/house/searchDeal?pg=1";
	}
	function searchRent() {
		document.location.href = "${root}/house/searchRent?pg=1";
	}

	function search() {
		if (document.getElementById("word").value == "") {
			alert("내용 입력 !!!");
			return;
		}

		var sel = document.getElementById("key");
		var type = document.getElementById("key2");
		var tmp = document.getElementById("word");

		if (sel.options[sel.selectedIndex].value == "aptname") {
			if (type.options[type.selectedIndex].value == "deal")
				document.location.href = "${root}/house/searchDealBdName?pg=1&word="
						+ tmp.value;
			else
				document.location.href = "${root}/house/searchRentBdName?pg=1&word="
						+ tmp.value;
		} else if (sel.options[sel.selectedIndex].value == "dongname") {
			if (type.options[type.selectedIndex].value == "deal")
				document.location.href = "${root}/house/searchDealDongName?&pg=1&word="
						+ tmp.value;
			else
				document.location.href = "${root}/house/searchRentDongName?pg=1&word="
						+ tmp.value;

		}
	}
	function pageMove(pg) {
		if (document.getElementById("pageType").value == "buy") {
			document.getElementById("pg").value = pg;
			document.location.href = "${root}/house/searchDeal?pg=" + pg;
		} else {
			document.getElementById("pg").value = pg;
			document.location.href = "${root}/house/searchRent?pg=" + pg;
		}
	}
</script>
<body>
	<!-- navigation hidden form -->
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="notice"> <input
			type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" id="pageType" value="${type}" />
	</form>

	<section id="blog" class="blog">
		<div class="container aos-init aos-animate" data-aos="fade-up">
			<div class="row">
				<div class="col-lg-5"></div>
				<div class="col-lg-6">
					<c:if test="${type eq 'buy'}">
						<h2 style="font-weight: bold;">주택 매매 목록</h2>
					</c:if>
					<c:if test="${type eq 'rent'}">
						<h2 style="font-weight: bold;">주택 전월세 목록 </h2>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8 entries">
					<form class="form-inline">
						<button type="button" class="btn btn-info mr-1"
							onclick="javascript:searchDeal();">매매</button>
						<button type="button" class="btn btn-info mr-1"
							onclick="javascript:searchRent();">전월세</button>
						<div class="form-group">
							<select class="form-control" name="key" id="key">
								<option value="aptname" selected="selected">빌딩 이름</option>
								<option value="dongname">동 이름</option>
							</select> <select class="form-control" name="key2" id="key2">
								<option value="deal" selected="selected">매매</option>
								<option value="rent">전월세</option>
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
									onclick="document.location.href='${root}/house/showDeal?no=${deal.no}'">${deal.buildingName}</a>
							</h2>

							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>${deal.no}</th>
										<th>Deal Information</th>
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
										onclick="document.location.href='${root}/house/showDeal?no=${deal.no}'">Read
										More</a>
								</div>
							</div>
						</article>
						<!-- End residence entry -->
					</c:forEach>
					<!-- End Deal list -->

					<c:forEach var="rent" items="${rents}">
						<article class="entry">
							<h2 class="entry-title">
								<a
									onclick="document.location.href='${root}/house/showRent?no=${rent.no}'">${rent.buildingName}</a>
							</h2>

							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th>${rent.no}</th>
										<th>Rent Information</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">거래방식</th>
										<td>${rent.type}</td>
									</tr>
									<tr>
										<th scope="row">동</th>
										<td>${rent.dong}</td>
									</tr>
									<tr>
										<th scope="row">보증금</th>
										<td>${rent.rentMoney}만원</td>
									</tr>
									<tr>
										<th scope="row">거래액</th>
										<td>${rent.bondFee}만원</td>
									</tr>
									<tr>
										<th scope="row">면적</th>
										<td>${rent.area}m<sup>2</sup></td>
									</tr>
									<tr>
										<th scope="row">층</th>
										<td>${rent.floor}층</td>
									</tr>
								</tbody>
							</table>
							<div class="entry-content">
								<div class="read-more">
									<a
										onclick="document.location.href='${root}/house/showRent?no=${rent.no}'">Read
										More</a>
								</div>
							</div>
						</article>
						<!-- End residence entry -->
					</c:forEach>
					<!-- End rent list -->

					<br>
					<c:if test="${type eq 'buy'}">
						<div id="navigationOfBuy"></div>
						<table align=center>
							<tr>
								<td>${navigation.navigator}</td>
							</tr>
						</table>
					</c:if>

					<c:if test="${type eq 'rent'}">
						<div id="navigationOfRent"></div>
						<table align=center>
							<tr>
								<td>${navigationRent.navigator}</td>
							</tr>
						</table>
					</c:if>
					<br>

					<div class="col-lg-2"></div>
				</div>
				<!-- End blog entries list -->
			</div>

		</div>
	</section>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
