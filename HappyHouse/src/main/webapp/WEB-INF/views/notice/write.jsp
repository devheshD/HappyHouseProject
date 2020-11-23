<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript">
	function writeNotice() {
		if (document.getElementById("title").value == "") {
			alert("제목을 입력해주세요.");
			return;
		} else if (document.getElementById("content").value == "") {
			alert("내용을 입력해주세요.");
			return;
		} else {
			document.getElementById("writeform").action = "${root}/notice/write";
			document.getElementById("writeform").submit();
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<br>
		<h2 style="font-weight: bold;">공지사항 작성</h2>
		<form id="writeform" method="post" action="">
			<input type="hidden" name="act" id="act" value="write">
			<div class="form-group" align="left">
				<input type="hidden" name="id" id="id" value="${userDto.id}">
			</div>
			<div class="form-group" align="left">
				<label for="subject">제목:</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group" align="left">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="15" id="content" name="content"></textarea>
			</div>
			<button type="button" class="btn btn-primary"
				onclick="javascript:writeNotice();">작성</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</form>
	</div>
	<br/><br/>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>