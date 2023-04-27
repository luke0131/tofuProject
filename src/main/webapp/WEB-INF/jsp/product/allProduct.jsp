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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/album/">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>
<title>Tofucars All Product</title>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<article class="py-5 text-center container">
		<div class="row">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">所有車款</h1>
				<h2 class="cmp-modelfilter__title">篩選條件</h2>
				<hr>
				<div class="lead text-muted">
					<h3>廠牌</h3>
					<input class="form-check-input" type="checkbox" value="" id="Toyota"> 
						<label class="form-check-label" for="Toyota"> Toyota </label> 
						
					<input class="form-check-input" type="checkbox" value="" id="Honda"> 
						<label class="form-check-label" for="Honda"> Honda </label>
						 
					<input class="form-check-input" type="checkbox" value="" id="Nissan"> 
						<label class="form-check-label" for="Nissan"> Nissan </label>
						 
					<input class="form-check-input" type="checkbox" value="" id="Mercedes-Benz"> 
						<label class="form-check-label" for="Mercedes-Benz"> Mercedes-Benz </label>
					<br/>	 
					<input class="form-check-input" type="checkbox" value="" id="BMW">
						<label class="form-check-label" for="BMW"> BMW </label>	
															 
					<input class="form-check-input" type="checkbox" value="" id="Mitsubishi">
						<label class="form-check-label" for="Mitsubishi"> Mitsubishi </label>
						 
					<input class="form-check-input" type="checkbox" value="" id="Mazda"> 
						<label class="form-check-label" for="Mazda"> Mazda </label>
						 
					<input class="form-check-input" type="checkbox" value="" id="Lexus"> 
						<label class="form-check-label" for="Lexus"> Lexus </label>
					<br/>	 
					<input class="form-check-input" type="checkbox" value="" id="Audi">
						<label class="form-check-label" for="Audi"> Audi </label>
						 
					<input class="form-check-input" type="checkbox" value="" id="Porsche">
						<label class="form-check-label" for="Porsche"> Porsche </label>
						 
					<input class="form-check-input" type="checkbox" value="" id="Ferrari">
						<label class="form-check-label" for="Ferrari"> Ferrari </label>
						 
					<input class="form-check-input" type="checkbox" value="" id="Volvo">
						<label class="form-check-label" for="Volvo"> Volvo </label>
						
					<input class="form-check-input" type="checkbox" value="" id="Mini">
						<label class="form-check-label" for="Mini"> Mini </label>
				</div>
				<hr>
				<div class="lead text-muted">
					<h3>類型</h3>
					<input class="form-check-input" type="checkbox" value="" id="轎車">
						<label class="form-check-label" for="轎車"> 轎車 </label> 
						
					<input class="form-check-input" type="checkbox" value="" id="休旅車">
						<label class="form-check-label" for="休旅車"> 休旅車 </label> 
						
					<input class="form-check-input" type="checkbox" value="" id="卡車">
						<label class="form-check-label" for="卡車"> 皮卡車 </label> 
						
					<input class="form-check-input" type="checkbox" value="" id="跑車">
						<label class="form-check-label" for="跑車"> 跑車 </label>						
				</div>
				<hr>
				<div class="lead text-muted">
					<h3>動力方式</h3>
					<input class="form-check-input" type="checkbox" value="" id="轎車">
						<label class="form-check-label" for="轎車"> 汽油 </label> 
						
					<input class="form-check-input" type="checkbox" value="" id="休旅車">
						<label class="form-check-label" for="休旅車"> 柴油 </label> 
						
					<input class="form-check-input" type="checkbox" value="" id="卡車">
						<label class="form-check-label" for="卡車"> 油電混和 </label> 					
				</div>
				<hr>
				<div class="lead text-muted">
					<h3><label for="排氣量" class="form-label">排氣量</label></h3>
						<input type="range" class="form-range" min="1000" max="5000" id="customRange2">		
				</div>
				<hr>
				<div class="lead text-muted">
					<h3><label for="價錢" class="form-label">價錢</label></h3>
						<input type="range" class="form-range" min="0" max="20000000" id="customRange2">					
				</div>
				<hr>
				<div>
					<a href="#" class="btn btn-primary my-2">篩選</a> <a href="#"
						class="btn btn-secondary my-2">清除篩選</a> <a
						href="${contextRoot}/product/buyCar" class="btn btn-primary my-2">購買</a>
				</div>
			</div>
		</div>
	</article>

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-5 g-4">

				<div class="col">
					<div class="card shadow-sm h-100">
						<div class="bd-placeholder-img card-img-top">
							<img src="../img/mPicture/images.jpg" class="card-img-top"
								alt="..." width="100%" height="180">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm h-100">
						<div class="bd-placeholder-img card-img-top">
							<img src="../img/mPicture/9645.jpg_wh300.jpg"
								class="card-img-top" alt="..." width="100%" height="180">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm h-100">
						<div class="bd-placeholder-img card-img-top">
							<img src="../img/mPicture/images.jpg" class="card-img-top"
								alt="..." width="100%" height="180">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm h-100">
						<div class="bd-placeholder-img card-img-top">
							<img src="../img/mPicture/images.jpg" class="card-img-top"
								alt="..." width="100%" height="180">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card shadow-sm h-100">
						<div class="bd-placeholder-img card-img-top">
							<img src="../img/mPicture/images.jpg" class="card-img-top"
								alt="..." width="100%" height="180">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
							</div>
						</div>
					</div>
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