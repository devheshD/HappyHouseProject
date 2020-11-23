<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
.table-hover tbody tr:hover {
	background-color: #e6ecff;
}
</style>
<script type="text/javascript">
	function movewrite() {
		location.href = "${root}/notice/mvwrite";
	}
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		document.getElementById("pageform").action = "${root}/notice/list?pg="
				+ pg;
		document.getElementById("pageform").submit();
	}
</script>
<body>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="notice"> <input
			type="hidden" name="pg" id="pg" value="">
	</form>
	<div class="container" align="center">
		<br>
		<h2 style="font-weight: bold;">공지사항</h2>
		<table class="table table-borderless">
			<c:if test="${userDto != null}">
				<tr>
					<td align="right"><button type="button" class="btn btn-info"
							onclick="javascript:movewrite();">글쓰기</button></td>
				</tr>
			</c:if>
		</table>
		<form id="searchform" method="get" class="form-inline" action="">
			<input type="hidden" name="act" id="act" value="notice"> <input
				type="hidden" name="pg" id="pg" value="1">
			<table class="table table-active table-hover">
				<thead>
					<tr class="table-primary">
						<th scope="col" colspan="4">번호</th>
						<th scope="col" colspan="4">제목</th>
						<th scope="col" colspan="4">작성자</th>
						<th scope="col" colspan="4">작성일</th>
					</tr>
				</thead>

				<c:if test="${list.size() != 0}">
					<tbody>
						<c:forEach var="lists" items="${list}">
							<tr class="table-info">
								<td colspan="4" style="background-color: white;"><strong>${lists.no}</strong></td>
								<td colspan="4" style="background-color: white;"><a
									href="${root}/notice/show?no=${lists.no}"><strong>${lists.title}</strong></a></td>
								<td colspan="4" style="background-color: white;"><strong>${lists.id}</strong></td>
								<td colspan="4" style="background-color: white;"><strong>${lists.regtime}</strong></td>
							</tr>
						</c:forEach>
					<tbody>
				</c:if>
				<c:if test="${list.size() == 0}">
					<table class="table table-active">
						<tbody>
							<tr class="table-info" align="center">
								<td>작성된 글이 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</c:if>
			</table>
		</form>
		<table>
			<tr>
				<td>${navigation.navigator}</td>
			</tr>
		</table>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>