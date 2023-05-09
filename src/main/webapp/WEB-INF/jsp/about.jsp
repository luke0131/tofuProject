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
<title>關於我們-成員介紹</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />

	<jsp:include page="layout/navbar.jsp" />



	<!-- 個人卡片 -->
	<div class="card-group"
		style="margin-top: 10px; width: 83rem; margin: auto;">
		
		<div class="card">
			<img src="${contextRoot}/img/group3member/Poni.jpg"
				class="card-img-top" />
			<div class="card-body" style="margin: auto;">
				<p class="fw-bold text-primary text-center fs-1">
					< 會員系統 >
				</p>
				<h2 class="card-title fw-bold text-center">CEO-王芃琳 Poni Wang</h2>
				<p class="card-text">
				<ul>
					<li class="fs-5 fw-bold" >註冊、登入、登出</li>
					<li class="fs-5 fw-bold" >修改會員資料、查看訂單資料及賞車紀錄</li>
					<li class="fs-5 fw-bold" >豆腐車業網頁視覺設計</li>
				</ul>
				</p>
			</div>
		</div>
		
		<div class="card">
			<img src="${contextRoot}/img/indexPicture/profoliocard.jpg"
				class="card-img-top" />
			<div class="card-body" style="margin: auto;">
				<p class="fw-bold text-primary text-center fs-1">
					< 商品系統 >
				</p>
				<h2 class="card-title fw-bold text-center">行銷總監-陳博軒 Jackie Chen</h2>
				<p class="card-text">
				<ul>
					<li class="fs-5 fw-bold">商品展示</li>
					<li class="fs-5 fw-bold">商品下單</li>
					<li class="fs-5 fw-bold">預約賞車表單</li>
				</ul>
				</p>
			</div>

		</div>
		<div class="card">
			<img src="${contextRoot}/img/group3member/Luke.jpg"
				class="card-img-top"/>
			<div class="card-body" style="margin: auto;">
				<p class="fw-bold text-primary text-center fs-1">
					 < 購買系統 >
				</p>
				<h2 class="card-title fw-bold text-center">財務總監-賴昱廷 Luke Lai</h2>
				<p class="card-text">
				<ul>
					<li class="fs-5 fw-bold">物流功能</li>
					<li class="fs-5 fw-bold">金流功能</li>
					<li class="fs-5 fw-bold">商品下單系統</li>
				</ul>
				</p>
			</div>

		</div>
	</div>
	<div class="card-group"
		style="margin-top: 10px; width: 83rem; margin: auto;">
		<div class="card">
			<img src="${contextRoot}/img/group3member/Min.jpg"
				class="card-img-top" />
			<div class="card-body" style="margin: auto;">
				<p class="fw-bold text-primary text-center fs-1">
					< 獨家功能 >
				</p>
				<h2 class="card-title fw-bold text-center">獨立董事-蔡明學 xxxxxx</h2>
				<p class="card-text">
				<ul>
					<li class="fs-5 fw-bold">維修保養及表單設計</li>
				</ul>
				</p>
			</div>

		</div>
		<div class="card">
			<img src="${contextRoot}/img/group3member/PeiHua.jpg"
				class="card-img-top"  />
			<div class="card-body" style="margin: auto;">
				<p class="fw-bold text-primary text-center fs-1">
					< 員工系統 >
				</p>
				<h2 class="card-title fw-bold text-center">業務總監-溫佩樺 PeiHua Wen</h2>
				<p class="card-text">
				<ul>
					<li class="fs-5 fw-bold">登入、登出</li>
					<li class="fs-5 fw-bold">修改員工資本資料</li>
					<li class="fs-5 fw-bold">任務派發功能、上下班打卡功能、出缺勤請假功能</li>
				</ul>
				</p>
			</div>

		</div>
		<div class="card">
			<img src="${contextRoot}/img/group3member/Daniel.jpg"
				class="card-img-top" />
			<div class="card-body" style="margin: auto;">
				<p class="fw-bold text-primary text-center fs-1">
					< 客服系統 >
				</p>
				<h2 class="card-title fw-bold text-center">策略顧問-劉書佑 Daniel Liu</h2>
				<p class="card-text">
				<ul>
					<li class="fs-5 fw-bold">豆腐論壇功能</li>
					<li class="fs-5 fw-bold">即時客服線上諮詢</li>
					<li class="fs-5 fw-bold">聯絡我們</li>
				</ul>
				</p>
			</div>

		</div>
	</div>


	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="layout/footer.jsp" />
</body>
</html>