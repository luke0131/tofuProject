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
						<image href="../img/productDetail/Mazda31.jpg" width="100%" height="100%"></image>
					</svg>

					<div class="container">
						<div class="carousel-caption text-start">
							<h1>Mazda3</h1>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="" />
						<image href="../img/productDetail/Mazda32.jpg" width="100%" height="100%"></image>
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
						<image href="../img/productDetail/Mazda33.jpg" width="100%" height="100%"></image>
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
						Mazda3採用了KODO設計語言，展現出豐富的曲線和流線型造型，車頭線條流暢，前格柵為封閉式設計，整體呈現出動感且時尚的風格。車側部分，經典的腰線和流線型造型，展現出輕盈感和動感。而車尾部分，加入了許多立體化元素，不同於傳統的三角形後照鏡的造型，Mazda3的後照鏡是一個立體的造型，更加獨特。
					</h2>
				</div>
				<div class="col-md-5">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="white" />
						<image href="../img/productDetail/Mazda34.jpg" width="100%" height="100%"></image>
					</svg>

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="fw-normal lh-1">
						車內空間：<br/><br/>
						Mazda3的車內空間非常舒適寬敞，提供足夠的頭部和腿部空間。前座位和後座位均提供良好的支撐和舒適性。此外，Mazda3還提供了一些高級的內飾選項，例如真皮座椅和豪華木質飾板等，使車內環境更加舒適和豪華。
					</h2>
				</div>
				<div class="col-md-5 order-md-1">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="white" />
						<image href="../img/productDetail/Mazda35.jpg" width="100%" height="100%"></image>
					</svg>

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="fw-normal lh-1">
						動力性能：<br/><br/>
						Mazda3搭載了一具2.0升四缸SKYACTIV-G引擎，最大馬力達到了155匹馬力，最大扭力為200牛米，與之配合的是6速手自排變速箱，讓車輛加速和變速都非常順暢，並且具有極高的燃油效率。此外，Mazda3還提供了許多高級的駕駛輔助技術，例如智能城市煞車輔助系統和網路連接等。
					</h2>
				</div>
				<div class="col-md-5">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="white" />
						<image href="../img/productDetail/Mazda36.jpg" width="100%" height="100%"></image>
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
		  				<input type="text" class="form-control" id="car" name="car" value="Mazda3">
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