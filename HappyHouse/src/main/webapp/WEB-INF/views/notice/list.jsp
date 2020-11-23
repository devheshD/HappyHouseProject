<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
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
			<table class="table table-active">
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
							<tr style="background-color: white;" onmouseover="this.style.background='#e6ecff'" onmouseout="this.style.background='white'">
								<td colspan="4">${lists.no}</td>
								<td colspan="4"><a
									href="${root}/notice/show?no=${lists.no}"><strong>${lists.title}</strong></a></td>
								<td colspan="4">${lists.id}</td>
								<td colspan="4">${lists.regtime}</td>
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