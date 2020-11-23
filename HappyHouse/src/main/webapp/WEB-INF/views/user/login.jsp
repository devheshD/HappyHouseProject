<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="loginModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">LogIn</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form id="loginForm" method="post" action="${root}/user/login">
					<div class="form-group">
						<label for="uesrid" style="font-weight: bold;">ID: </label> 
						<input type="text" class="form-control" id="userId" placeholder="Enter ID" name="userId">
					</div>
					<div class="form-group">
						<label for="userpw" style="font-weight: bold;">Password:</label> 
						<input type="password" class="form-control" id="userPw" placeholder="Enter Password" name="userPw">
					</div>
					<c:if test="${msg ne null }" >
						<p style="color: #f00;">${msg }</p>
					</c:if>
					<!-- Modal footer -->
					<div class="modal-footer">
						<input id="getLoginBtn" type="button" class="btn btn-primary" value="Login">
						<input id="getCloseBtn" type="button" class="btn btn-danger" data-dismiss="modal" value="Close"/>
					</div>
					<a></a>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	// 로그인 버튼 클릭 이벤트
	$('#getLoginBtn').on('click', function() {
		let userId = $('#userId').val();
		let userPw = $('#userPw').val();
		
		if (userId == '') {
			alert('아이디를 입력해주세요');
		} else if (userPw == '') {
			alert('패스워드를 입력해주세요')
		} else {
			$('#loginForm').submit();
		}	
	});
</script>
