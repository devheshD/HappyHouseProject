<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="SignUpModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Sign Up</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form method="post" action="${root}/member?act=signUp">
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrid" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>ID</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrid"
							placeholder="User ID" name="userId">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrpw" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>PW</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrpw"
							placeholder="영문 숫자 포함 6자리 이상" name="userPwd">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrname" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>NAME</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrname"
							placeholder="User Name" name="userName">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesremail" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>E-Mail</label>
						<div class="col-md-8"> 
							<input type="email" class="form-control" id="signup_uesremail"
							placeholder="User Email" name="userEmail">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-3 control-label text-md-right col-form-label" for="uesrphone" style="font-weight: bold;">
						<span class="text-danger small">*&nbsp</span>PHONE</label>
						<div class="col-md-8"> 
							<input type="text" class="form-control" id="signup_uesrphone"
							placeholder="010-xxxx-xxxx" name="userPhone">
						</div>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="submit" class="btn btn-success btn-block" value="Sign Up">
						<button type="button" class="btn btn-danger btn-block" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>