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
				<form method="post" action="${root}/member?act=login">
					<div class="form-group">
						<label for="uesrid" style="font-weight: bold;">ID: </label> <input
							type="text" class="form-control" id="login_uesrid"
							placeholder="Enter ID" name="id">
					</div>
					
					<div class="form-group">
						<label for="userpw" style="font-weight: bold;">Password:
						</label> <input type="password" class="form-control" id="login_userpw"
							placeholder="Enter Password" name="pwd">
					</div>
					<div align="right">
						<a href="">비밀번호 찾기</a>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="Login">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
					<a></a>
				</form>
			</div>
		</div>
	</div>
</div>
