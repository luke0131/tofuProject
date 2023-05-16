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
<title>小豆腐會員中心</title>
<link href="${contextRoot}/css/sidebars.css" rel="stylesheet">

<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'></link>
<style>
/* 製作top */
.top {
	position: fixed;
	right: 10px;
	bottom: 10px;
	width: 50px;
	height: 50px;
	text-align: center;
	background-color: black;
	border: 2px solid white;
	line-height: 46px;
	border-radius: 50%;
	/* border: 3px solid red; */
	text-decoration: none;
	color: white;
	/* font-weight: bold; */
	font-size: 18px;
}

.top:hover {
	color: Tomato;
}
/* 卷軸移動效果 */
* {
	scroll-behavior: smooth;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
	<h1 class="fw-bold text-center"
		style="margin-top: 20px; color: #005AB5">
		<i class="fa fa-car" style="margin-right: 20px; color: #000079"></i>歡迎豆腐車業會員中心<i
			class="fa fa-car" style="margin-left: 20px; color: #000079"></i>
	</h1>
	<div class="d-flex">
		<div style="margin-top: 20px; margin-left: 20px">
			<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold "
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false">修改會員資料</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal large">
								<li style="margin-left: 20px"><a
									href="${contextRoot}/customer/updateProfile"
									class="link-dark d-inline-flex text-decoration-none rounded">個人資料</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold"
							data-bs-toggle="collapse" data-bs-target="#orders-collapse"
							aria-expanded="false">查詢歷史訂單</button>
						<div class="collapse" id="orders-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal large">
								<li style="margin-left: 20px"><a
									href="${contextRoot}/customer/queryOrder"
									class="link-dark d-inline-flex text-decoration-none rounded">訂單資料</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold"
							data-bs-toggle="collapse" data-bs-target="#home-collapse"
							aria-expanded="false">查詢預約紀錄</button>

						<div class="collapse" id="home-collapse" style="">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 large">
								<li style="margin-left: 20px"><a
									href="${contextRoot}/customer/queryBook"
									class="link-dark d-inline-flex text-decoration-none rounded">預約資料</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false">查詢發文紀錄</button>

						<div class="collapse" id="account-collapse" style="">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 large">
								<li style="margin-left: 20px"><a
									href="${contextRoot}/searchPost"
									class="link-dark d-inline-flex text-decoration-none rounded">發文留言</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<figure class="d-flex justify-content-center"
			style="width: 1200px; height: 700px; margin-left: 50px">
			<img src="${contextRoot}/img/indexPicture/change.gif" />
		</figure>

	</div>


	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>
	<script type="text/javascript"
		src="${contextRoot}/js/pages/sidebars.js"></script>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>
</html>
