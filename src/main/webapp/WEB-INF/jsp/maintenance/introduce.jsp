<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>專業保養</title>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="card">
		<img src="./img/mPicture/9645.jpg_wh300.jpg" width="200" height="450"
			class="card-img-top" alt="...">

		<div class="card-body">
			<h2 class="card-title">豆腐車業專業保養</h2>
			<p class="card-text">
				對於要裝配在您愛車上的每一個零件，都經過我們的縝密考量。 我們原廠零件均採用高品質的原料， 所以不僅更加耐用，還具備極佳的可靠度，<br>
				每項零件均提供您一年不限里程的保固，絕對是最有價值的選擇。 指定原廠的零件或配件，並經由合格的原廠技師正確安裝，
				最能確保您愛車的性能表現和完善品質。<br>而且持續使用豆腐車業原廠零件，更能夠讓您的愛車長期保值。
			</p>
			<a href="${contextRoot}/main" class="btn btn-dark">預約保養</a>
		</div>
	</div>


	<script type="text/javascript"
		src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${contextRoot}/js/js/jquery-3.6.4.min.js"></script>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>