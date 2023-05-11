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
<title>豆腐車業管理者平台</title>
</head>
<body style="margin-top: 100px; background-color: #D3D3D3">
	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<div class="container col-xl-10 col-xxl-8 px-4 py-5">
		<div class="row align-items-center g-lg-5 py-5">
			<!-- 			<div class="col-lg-7 text-center text-lg-start"> -->
			<!-- 			<div class="col-lg-6 text-center text-lg-start"> -->
			<%-- 				<img src="${contextRoot}/img/indexPicture/profoliocard.jpg" --%>
			<!-- 					style="border-radius: 5px"> -->
			<!-- 				<h1 class="display-4 fw-bold lh-1 mb-3">Vertically centered -->
			<!-- 					hero sign-up form</h1> -->
			<!-- 				<p class="col-lg-10 fs-4">Below is an example form built -->
			<!-- 					entirely with Bootstrap’s form controls. Each required form group -->
			<!-- 					has a validation state that can be triggered by attempting to -->
			<!-- 					submit the form without completing it.</p> -->
			<!-- 			</div> -->
			<div class="col-md-10 mx-auto col-lg-5">
				<form class="p-4 p-md-5 border rounded-3 bg-light" action="${contextRoot}/mgm/Dashboard"
						method="post">
					<h4 class="text-center fw-bold">
						<i class="fa fa-car" style="margin-right: 20px; color: black"></i>豆腐車業管理者平台<i
							class="fa fa-car" style="margin-left: 20px; color: black"></i>
					</h4>

					<div class="form-floating mb-3 mt-5">
						<input type="email" class="form-control" id="email" name="email"
							placeholder="Email"> <label
							for="email">Email</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="password" name="password"
							placeholder="Password"> <label for="password">Password</label>
					</div>
					<button class="w-100 btn btn-lg btn-primary" type="submit">登入</button>
					<hr class="my-4">
					<div>
						<button type="button" class="btn btn-success" id="admin">管理者</button>
						<!-- 						<button type="button" class="btn btn-success" id="verified">已驗證</button> -->
					</div>
					<hr class="my-4">
					<a href="${contextRoot}/customer/login"
						class="text-decoration-none text-muted">返回顧客登入首頁</a>

					<!-- 					<small class="text-muted" style="margin-left: 70px ; margin-top:10px">&copy; -->
					<!-- 						版權所屬豆腐車業股份有限公司</small> -->

				</form>
			</div>
		</div>
	</div>
	<script>
		document
				.querySelector('#admin')
				.addEventListener(
						'click',
						function() {
							document.querySelector('#email').value = 'AndyLiu@gmail.com';
							document.querySelector('#password').value = 'Q9sL8dF6';
						});
	</script>
</body>
</html>