<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style type="text/css">
.button {
	color: #ffffff;
	background: #008000;
	font-size: 1.2em;
	padding: 0.3em 0.5em;
	margin-right: 0.1em;
}
</style>
<body>
	<br>
	<div align="center">
		<br>
		<h2 style="font-weight: bold;">공지사항이 성공적으로 삭제되었습니다.</h2>
		<br>
		<a href="${root}/notice/list?pg=1" class="button">목록으로</a>
	</div>
	<br><br>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>