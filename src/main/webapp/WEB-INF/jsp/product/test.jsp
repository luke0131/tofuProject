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

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/carousel/">

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

<title>下單購買車輛</title>
<style>
.car-image {
	max-width: 300px;
	height: auto;
}

.active {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="mastbody">
		<div class="mastbody-inner grid-centre pd-bottom">

			<div class="headingbar">
				<div class="headingbar-main">

					<h1 class="title">打造我的專屬</h1>

				</div>
			</div>
			
			<div id="bmnApp" class="bmnapp shadow-great">
			
			<h2>愛車顏色</h2>
			<button onclick="selectColor('red')">紅色</button>
			<button onclick="selectColor('blue')">藍色</button>
			<button onclick="selectColor('green')">綠色</button>

			<h2>加購選配</h2>
			<form action="/accessories" method="post">
				<input type="checkbox" id="navigation" name="navigation"> <label
					for="navigation">導航系統</label><br> <input type="checkbox"
					id="leather-seats" name="leather-seats"> <label
					for="leather-seats">真皮座椅</label><br> <input type="submit"
					value="下一步">
			</form>

			<h2>總攬</h2>
			<p>
				車輛顏色：<span id="selectedColor">未選擇</span>
			</p>
			<p>加購選配：導航系統、真皮座椅</p>

			<a href="/progress" class="nav-link">進度</a>
			
			</div>
			
		</div>
	</div>

	<script>
		function selectColor(color) {
			var carImage = document.getElementById("carImage");
			carImage.src = color + "-car.jpg";
			document.getElementById("selectedColor").textContent = color;
		}
	</script>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>
</html>
