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
<body class="loginbody">
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<!-- 製作登入畫面 -->
	<!-- <img class="bg" src="${contextRoot}/img/indexPicture/loginbgimg.jpg"> -->
	<div
		class="modal modal-signin position-static d-block loginbodycontent"
		tabindex="-1" role="dialog" id="modalSignin">
		
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
					<h1 class="fw-bold mb-0 fs-2">Sign up for free</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form class="">
						<div class="form-floating mb-3">
							<input type="email" class="form-control rounded-3"
								id="floatingInput" placeholder="name@example.com"> <label
								for="floatingInput">Email address</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								id="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">Password</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">Sign up</button>
						<small class="text-muted">By clicking Sign up, you agree
							to the terms of use.</small>
						<hr class="my-4">
						<h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
							type="submit">
							<svg class="bi me-1" width="16" height="16">
								<use xlink:href="#twitter" /></svg>
							Sign up with Twitter
						</button>
						<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3"
							type="submit">
							<svg class="bi me-1" width="16" height="16">
								<use xlink:href="#facebook" /></svg>
							Sign up with Facebook
						</button>
						<button
							class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
							type="submit">
							<svg class="bi me-1" width="16" height="16">
								<use xlink:href="#github" /></svg>
							Sign up with GitHub
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>