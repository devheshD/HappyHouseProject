<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<body>
	<br>
	<br>
	<h3 align="center">${detail.hospital_name } 상세정보</h3>
	<br>

	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th>도시</th>
						<th>${detail.city }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">구군</th>
						<td>${detail.gugun }</td>
					</tr>
					<tr>
						<th scope="row">상세 주소</th>
						<td>${detail.address }</td>
					</tr>
					<tr>
						<th scope="row">업데이트 날짜</th>
						<td>${detail.update_date }</td>
					</tr>
					<tr>
						<th scope="row">타입</th>
						<td>${detail.type }</td>
					</tr>
					<tr>
						<th scope="row">전화번호</th>
						<td>${detail.phone_number }</td>
					</tr>
				</tbody>
			</table>
			<div class="entry-content">
				<div class="read-more float-right">
					<button id="back" type="button" class="btn btn-primary">목록으로</button>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br>
	<script type="text/javascript">
		// 뒤로가기 버튼
		$('#back').on('click', function() {
			history.back();
		});
	</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
