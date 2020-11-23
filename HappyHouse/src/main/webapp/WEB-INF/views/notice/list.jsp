<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript">
	function movewrite() {
		location.href = "${root}/notice/mvwrite";
	}
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		document.getElementById("pageform").action = "${root}/notice.do?act=searchAll&pg="
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
		<h1>
			<strong>공지사항</strong>
		</h1>
		<table class="table table-borderless">
			<c:if test="${userinfo != null}">
				<tr>
					<td align="right"><button type="button" class="btn btn-link"
							onclick="javascript:movewrite();">글쓰기</button></td>
				</tr>
			</c:if>
		</table>
		<form id="searchform" method="get" class="form-inline" action="">
			<input type="hidden" name="act" id="act" value="notice"> <input
				type="hidden" name="pg" id="pg" value="1">
			<table class="table table-active">
				<tbody>
					<tr class="table-info">
						<th colspan="4">글번호></th>
						<th colspan="4">제목</th>
						<th colspan="4">작성자</th>
						<th colspan="4">작성일</th>
					</tr>
				</tbody>
				<c:if test="${list.size() != 0}">
					<c:forEach var="lists" items="${list}">
						<tbody>
							<tr class="table-info">
								<td colspan="4" style="background-color: white;"><strong>${lists.no}</strong></td>
								<td colspan="4" style="background-color: white;"><a
									href="${root}/notice/show?no=${lists.no}"><strong>${lists.title}</strong></a></td>
								<td colspan="4" style="background-color: white;"><strong>${lists.id}</strong></td>
								<td colspan="4" style="background-color: white;"><strong>${lists.regtime}</strong></td>
							</tr>
						</tbody>
					</c:forEach>
				</c:if>
			</table>
		</form>
		<table>
			<tr>
				<td>${navigation.navigator}</td>
			</tr>
		</table>
		<c:if test="${list.size() == 0}">
			<table class="table table-active">
				<tbody>
					<tr class="table-info" align="center">
						<td>작성된 글이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>