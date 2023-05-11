<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8" />
<title>豆腐車業管理者報表</title>
<script type="text/javascript"
	src="${contextRoot}/js/pages/dashboard.js"></script>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>
</head>
<body>
	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-3 text-center"
			href="${contextRoot}/mgm/Dashboard">豆腐車業管理平台</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 		<input class="form-control form-control-dark w-100 rounded-0 border-0" -->
		<!-- 			type="text" placeholder="Search" aria-label="Search" /> -->
		<c:if test="${loggedInCustomerForDB==null }">
			<div style="color: white;" class="d-flex fs-5">
				<span> <a
					class="nav-link px-3" href="${contextRoot}/mgm/Management"
					style="color: white;">登入</a>
				</span>
			</div>
		</c:if>

		<c:if test="${loggedInCustomerForDB!=null }">
			<div style="color: white;" class="d-flex fs-5">
				Hello!，${loggedInCustomerForDB.account} <span> <a
					class="nav-link px-3" href="${contextRoot}/mgm/logout"
					style="color: white;">登出</a>
				</span>
			</div>
		</c:if>

	</header>
</body>
</html>