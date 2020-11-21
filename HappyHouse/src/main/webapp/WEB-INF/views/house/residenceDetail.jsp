<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript">
	function back() {
		window.history.back();
	}
</script>
<body>
	<c:if test="${check eq 'buy'}">
		<br><br><h3 align="center">${deal.buildingName}매매 상세정보</h3>
		<br>
		<div class="container" align="center">
			<div class="col-lg-6" align="center">
				<table class="table">
					<thead class="thead-light">
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
							<td>${deal.dealAmount} 만원</td>
						</tr>
						<tr>
							<th scope="row">거래일자</th>
							<td>${deal.dealYear}-${deal.dealMonth}-${deal.dealDay}</td>
						</tr>
						<tr>
							<th scope="row">건축년도</th>
							<td>${deal.buildYear}</td>
						</tr>
						<tr>
							<th scope="row">면적</th>
							<td>${deal.area} m<sup>2</sup></td>
						</tr>
						<tr>
							<th scope="row">층</th>
							<td>${deal.floor} 층</td>
						</tr>
						<tr>
							<th scope="row">지번</th>
							<td>${deal.bungi}</td>
						</tr>
						<tr>
							<th scope="row">사진</th>
							<td><a href=''
								onclick="window.open('https://www.google.com/search?tbm=isch&q=' + '${deal.dong}' + ' ' + '${deal.buildingName}')">사진
									구글 검색</a></td>
						</tr>
					</tbody>
				</table>
				<div class="entry-content">
					<div class="read-more float-right">
						<button type="button" class="btn btn-primary"
							onclick="javascript:back();">목록으로</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- end deal detail -->

	<c:if test="${check eq 'rent'}">
		<br><br><h3 align="center">${deal.buildingName} ${deal.type} 상세정보</h3>
		<div class="container" align="center">
			<div class="col-lg-6" align="center">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>${deal.no}</th>
							<th>Information</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">거래방식</th>
							<td>${deal.type}</td>
						</tr>
						<tr>
							<th scope="row">동</th>
							<td>${deal.dong}</td>
						</tr>
						<tr>
							<th scope="row">보증액</th>
							<td>${deal.rentMoney} 만원</td>
						</tr>
						<tr>
							<th scope="row">거래액</th>
							<td>${deal.bondFee} 만원</td>
						</tr>
						<tr>
							<th scope="row">거래일자</th>
							<td>${deal.contractYear}-${deal.contractMonth}-${deal.contractDay}</td>
						</tr>
						<tr>
							<th scope="row">건축년도</th>
							<td>${deal.buildYear}</td>
						</tr>
						<tr>
							<th scope="row">면적</th>
							<td>${deal.area} m<sup>2</sup></td>
						</tr>
						<tr>
							<th scope="row">층</th>
							<td>${deal.floor} 층</td>
						</tr>
						<tr>
							<th scope="row">지번</th>
							<td>${deal.bunji}</td>
						</tr>
						<tr>
							<th scope="row">사진</th>
							<td><a href=''
								onclick="window.open('https://www.google.com/search?tbm=isch&q=' + '${deal.dong}' + ' ' + '${deal.buildingName}')">사진
									구글 검색</a></td>
						</tr>
					</tbody>
				</table>
				<div class="entry-content">
					<div class="read-more float-right">
						<button type="button" class="btn btn-primary"
							onclick="javascript:back();">목록으로</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- end rent detail -->

	</div><br><br><br><br>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>