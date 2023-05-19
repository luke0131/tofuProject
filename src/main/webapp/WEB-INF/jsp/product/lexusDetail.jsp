<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
<title>Product Detail</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/carousel/">

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

body {
  padding-bottom: 3rem;
  color: #5a5a5a;
}

.carousel {
  margin-bottom: 4rem;
}

.carousel-caption {
  bottom: 3rem;
  z-index: 10;
}

.carousel-item {
  height: 32rem;
}

.marketing .col-lg-4 {
  margin-bottom: 1.5rem;
  text-align: center;
}

.marketing .col-lg-4 p {
  margin-right: .75rem;
  margin-left: .75rem;
}

.featurette-divider {
  margin: 5rem 0;
}

.featurette-heading {
  letter-spacing: -.05rem;
}

@media (min-width: 40em) {
  .carousel-caption p {
    margin-bottom: 1.25rem;
    font-size: 1.25rem;
    line-height: 1.4;
  }
  
  .featurette-heading {
    font-size: 50px;
  }
}

@media (min-width: 62em) {
  .featurette-heading {
    margin-top: 7rem;
  }
}

</style>


<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<main>

		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<svg class="" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden=""
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="" />
						<image href="../img/productDetail/Lexus ES1.jpg" width="100%" height="100%"></image>
					</svg>

					<div class="container">
						<div class="carousel-caption text-start">
							<h1>Lexus ES</h1>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="" />
						<image href="../img/productDetail/Lexus ES2.jpg" width="100%" height="100%"></image>
					</svg>

					<div class="container">
						<div class="carousel-caption">
							<h1>Extreme Performance & Amazing Driving Control</h1>	
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="" />
						<image href="../img/productDetail/Lexus ES3.jpg" width="100%" height="100%"></image>
					</svg>

					<div class="container">
						<div class="carousel-caption text-end">
							<h1>Possibilities are infinite</h1>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">

			<!-- Three columns of text below the carousel -->
			<div class="row">
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="200"
						height="200" xmlns="http://www.w3.org/2000/svg" role="img">
						<rect width="100%" height="100%" fill="" />
						<image href="../img/productDetail/productDetail1.jpg" width="100%" height="100%"></image>
					</svg>

					<h2 class="fw-normal">設計理念</h2>
					<p>將美學、功能性和創新融合於汽車設計的指導原則。追求駕駛者和乘客的舒適性和便利性、獨特外觀、優化空間配置和人機交互設計，此外，設計理念還考慮性能、安全性和環境友好性，以提供卓越的行駛體驗。</p>
					<p>
						<a class="btn btn-secondary" href="#introduce">前往介紹 &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="200"
						height="200" xmlns="http://www.w3.org/2000/svg" role="img">
						<rect width="100%" height="100%" fill="" />
						<image href="../img/productDetail/productDetail2.jpg" width="100%" height="100%"></image>
					</svg>
					
					<h2 class="fw-normal">預約賞車</h2>
					<p>讓顧客可以事先安排時間到汽車展廳試駕並欣賞所感興趣的車款。透過預約賞車，顧客可以享受個人化的專屬服務，提前體驗汽車性能和功能，幫助做出更明智的購車決策。</p>
					<p>
						<a class="btn btn-secondary" href="#book">前往預約 &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<svg class="bd-placeholder-img rounded-circle" width="200"
						height="200" xmlns="http://www.w3.org/2000/svg" role="img">
						<rect width="100%" height="100%" fill="" />
						<image href="../img/productDetail/productDetail3.jpg" width="100%" height="100%"></image>
					</svg>

					<h2 class="fw-normal">打造專屬</h2>
					<p>根據顧客的喜好和需求，量身訂製獨一無二的汽車。從選擇車身顏色、內飾材質到加裝個性化配件，打造出與眾不同的汽車。這種定制化的汽車體驗能夠提供顧客獨特的駕乘樂趣和滿足感。</p>
					<p>
						<a class="btn btn-secondary" href="${contextRoot}/product/buyCar">前往打造 &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->


			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<div id="introduce" class="row featurette">
				<div class="col-md-7">
					<h2 class="fw-normal lh-2">
						外觀設計：<br/><br/>
						Lexus ES採用時尚的外觀設計，具有低矮的車身和光滑的曲線。前臉採用大尺寸的逆V字型格柵，配有LED頭燈和日行燈，使車輛具有強烈的視覺衝擊力。車尾設計相對簡潔，有助於提升車輛的整體風格。
					</h2>
				</div>
				<div class="col-md-5">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="white" />
						<image href="../img/productDetail/Lexus ES4.jpg" width="100%" height="100%"></image>
					</svg>

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="fw-normal lh-1">
						車內空間：<br/><br/>
						Lexus ES提供了豪華舒適的車內空間，能夠滿足乘客的需求。前排和後排座椅都具有優秀的支撐和舒適性，讓乘客可以長時間坐在車上而不感到疲倦。此外，該車提供了寬敞的車廂和豐富的儲物空間，使車內更加實用。
					</h2>
				</div>
				<div class="col-md-5 order-md-1">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="white" />
						<image href="../img/productDetail/Lexus ES5.jpg" width="100%" height="100%"></image>
					</svg>

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="fw-normal lh-1">
						動力性能：<br/><br/>
						Lexus ES搭載了2.5升或3.5升自然進氣引擎，匹配8速自動變速器，並可提供前驅或四驅系統。這些引擎都提供了優異的加速性能和低油耗表現，並且運行起來相當平順。此外，該車還具有出色的操控性能，能夠提供平穩的行駛體驗和精確的轉向反應。
					</h2>
				</div>
				<div class="col-md-5">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="white" />
						<image href="../img/productDetail/Lexus ES6.jpg" width="100%" height="100%"></image>
					</svg>

				</div>
			</div>

			<hr class="featurette-divider">
		
			<!-- /END THE FEATURETTES -->
			
			<div class="row featurette">
				<h1>預約賞車</h1>
				<form id="book" method="POST" action="${contextRoot}/product/book">
					<div class="mb-3">
		  				<label for="name" class="form-label">姓名</label>
		  				<input type="text" class="form-control" id="name" name="name" value="JolinTsai">
					</div>
					
					<div class="mb-3">
		  				<label for="car" class="form-label">預約車型</label>
		  				<input type="text" class="form-control" id="car" name="car" value="Lexus ES">
					</div>								
			
					<label for="time">預約時間:</label>
					<div class="formgroup">
						<input type="datetime-local" id="time" name="time"
							value="2023-05-24 10:00" min="2023-05-24 10:00"
							max="2023-06-30 18:00">
					</div>	
					
					<div class="col-md-4 offset-md-11">
					<button id="bookbutton" type="submit" class="btn btn-primary" onclick="abc();">預約</button>
					</div>
								
				</form>			
			</div>						
			
			<hr class="featurette-divider">
			
		</div>
		<!-- /.container -->

	</main>


	<script>
		
		function abc() {
	        alert('預約完成');
	    }
		
	</script>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>
</html>