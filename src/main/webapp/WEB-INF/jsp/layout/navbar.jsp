<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tofucars Company</title>

</head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark"
		aria-label="Fourth navbar example">
		<div class="container-fluid">
			<a href="${contextRoot}/"><img
				src="${contextRoot}/img/indexPicture/TofuLogo.jpg"
				style="width: 120px" /></a>
			<!-- <a class="navbar-brand" href="#">Expand at md</a> -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsExample04"
				aria-controls="navbarsExample04" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarsExample04">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item dropdown"><a class="nav-link active"
						href="#" data-bs-toggle="dropdown" aria-current="page">關於我們</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${contextRoot}/company">公司簡介</a></li>
							<li><a class="dropdown-item" href="${contextRoot}/about">成員介紹</a></li>
						</ul></li>         

					<li class="nav-item dropdown"><a class="nav-link active"
						href="${contextRoot}/product/all">商品展示</a></li>
					<li class="nav-item dropdown"><a class="nav-link active"
							href="${contextRoot}/showGift">購物商城</a></li>

					<li class="nav-item dropdown"><a class="nav-link active"
						href="#" data-bs-toggle="dropdown" aria-current="page">豆腐論壇</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${contextRoot}/showPost">豆腐討論區</a></li>
							<li><a class="dropdown-item" href="${contextRoot}/contactUs">聯絡我們</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a class="nav-link active"
						href="#" data-bs-toggle="dropdown" aria-current="page">客戶服務</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${contextRoot}/introduce">維修保養</a></li>
							<li><a class="dropdown-item" href="${contextRoot}/show">家用充電座安裝評估預約</a></li>
						</ul></li>
					

					<!-- <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                >Dropdown</a
              >
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul>
            </li> -->
				</ul>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
					<!-- <input
              type="search"
              class="form-control form-control-dark text-bg-dark"
              placeholder="Search..."
              aria-label="Search"
            /> -->
				</form>
				<c:if test="${loggedInCustomer==null}">
					<div class="text-end">
						<button type="button" class="btn btn-success me-2">
							<a class="loginhover" href="${contextRoot}/customer/login">登入</a>
						</button>
						<button type="button" class="btn btn-warning">
							<a class="loginhover" href="${contextRoot}/customer/register">註冊</a>
						</button>
					</div>
				</c:if>


				<c:if test="${loggedInCustomer!=null}">
					<p style="color: white" class="fs-5 text-center m-3">
						<span>Hello!，${loggedInCustomer.account}</span>
					</p>
					<div class="dropstart text-end">
						<a href="#"
							class="d-block link-dark text-decoration-none dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false"> 
							<c:choose>
								<c:when test="${loggedInCustomer.photo != null}">
									<img src="${contextRoot}/downloadPhoto/${loggedInCustomer.customer_id}" width="32"
										height="32" class="rounded-circle">
								</c:when>
								<c:otherwise>
									<img src="${contextRoot}/img/indexPicture/tofu.png" width="32"
										height="32" class="rounded-circle">
								</c:otherwise>
							</c:choose>
						</a>
						<ul class="dropdown-menu text-center dropdown-menu-dark">
							<li><a class="dropdown-item" href="${contextRoot}/customer/customerCenter">會員中心</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item"
								href="${contextRoot}/customer/logout">登出</a></li>
						</ul>
					</div>
				</c:if>
				
			</div>
		</div>
	</nav>
	<script type="text/javascript"
		src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>