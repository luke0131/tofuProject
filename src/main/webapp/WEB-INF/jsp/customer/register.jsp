<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8">
<title>Tofucars Company</title>
</head>
<body class="registerbody">
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<!-- 製作註冊畫面 -->
	<div
		class="modal modal-signin position-static d-block loginbodycontent"
		tabindex="-1" role="dialog" id="modalSignin">

		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
					<h1 class="fw-bold mb-0 fs-2" style="margin: auto">會員註冊</h1>
				</div>

				<div class="modal-body p-5 pt-0">
				
					<form action="${contextRoot}/customer/createMember" method="post"
						id="register-form"> 

					<!--<form id="register-form">-->

						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3"
								placeholder="Account" name="account" id="account"> <label
								for="account">Account</label>
							<div id="account-error" class="invalid-feedback"></div>
						</div>

						<div class="form-floating mb-3">
							<input type="email" class="form-control rounded-3"
								placeholder="Email" name="email" id="email"> <label
								for="email">Email</label>
							<div id="email-error" class="invalid-feedback"></div>
						</div>

						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								placeholder="Password" name="password" id="password"> <label
								for="password">Password</label>
							<div id="password-error" class="invalid-feedback"></div>
						</div>

						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								placeholder="Password" name="confirm-password"
								id="confirm-password"> <label for="confirmPassword">密碼確認</label>
							<div id="confirm-password-error" class="invalid-feedback"></div>
						</div>



						<div class="form-check my-4">
							<input class="form-check-input me-2" type="checkbox"
								id="terms-agreement" /> <label class="form-check-label"
								for="terms-agreement"> 我同意成為小豆腐! <a href="#">客戶服務條款</a>
							</label>
							<div id="terms-agreement-error" class="invalid-feedback"></div>
						</div>

						<div
							class="d-none alert alert-warning alert-dismissible d-flex justify-content-between fade show text-danger"
							role="alert" id="register-error">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="currentColor"
								class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2"
								viewBox="0 0 16 16" role="img" aria-label="Warning:">
    							<path
									d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
  							</svg>
							<div id="register-error-message"></div>
							<button type="button" class="btn-close" id="alert-button-close"
								aria-label="Close"></button>
						</div>




						<button class="w-100 mt-3 mb-2 btn btn-lg rounded-3 btn-dark"
							type="button" id="register-button">註冊</button>
						<div class="d-flex justify-content-center mt-3">
							<div class="text-dark">已經有豆腐車業的帳號了嗎？</div>
							<a href="${contextRoot}/customer/login" class="text-dark fw-bold">立即登入</a>
						</div>

						<hr class="my-4">
						<!--<div class="d-flex justify-content-between mt-3">
							<button type="button" class="btn btn-primary" id="tofu">Tofu</button>
							 <button type="button" class="btn btn-success" id="memberLoginBTN">使用者</button>
						<button type="button" class="btn btn-warning" id="adminLoginBTN">管理員</button>
						</div>
						 -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  
	<script>
		document.querySelector('#tofu').addEventListener('click', function() {
			document.querySelector('#email').value = 'a1234@gmail.com';
			document.querySelector('#password').value = '1234';
		});
	</script>
	-->
	<script>
		const contextRoot = "${contextRoot}";
	</script>
	<script type="text/javascript"
		src="${contextRoot}/js/pages/register.js"></script>


	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>