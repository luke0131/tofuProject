<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預約保養</title>
<style>
.t1 {
	float: left;
}

img {
	float: right;
	margin: 1em 1em;
	width: 45%;
	height: auto;
}
</style>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="cont">
		<img src="../img/mPicture/images.jpg" alt="Your Image">

	</div>

	<div class="container">
		<h3>豆腐專業保養</h3>
		<h4>選擇預約保養項目</h4>
		<form:form method="post" action="" modelAttribute="maintenanceForm">

			<div class="formgroup">
				<input type="checkbox" name="mcategory" value="Minor Service" /> <label
					for="mcategory">小保養</label> <input type="checkbox" name="mcategory"
					value="majorService" /> <label for="mcategory">大保養</label> <input
					type="checkbox" name="mcategory" value="Battery" /> <label
					for="mcategory">電池更換</label> <input type="checkbox"
					name="mcategory" value="Engine Carbon Cleaning" /> <label
					for="mcategory">引擎積碳清洗</label> <input type="checkbox"
					name="mcategory" value="Engine Oil Cleaning" /> <label
					for="mcategory">引擎油泥清洗</label>
			</div>


			<div class="formgroup">

				<input type="checkbox" name="mcategory"
					value="Accessory Installation" /> <label for="">配件加裝</label> <input
					type="checkbox" name="mcategory" value="Tire Replacement" /> <label
					for="">輪胎更換</label> <input type="checkbox" name="mcategory"
					value="Repair and Paint" /> <label for="">鈑金烤漆</label> <input
					type="checkbox" name="mcategory" value="AC System" /> <label for="">冷氣系統保養/清潔</label>
			</div>
			<br>

			<div class="formgroup">
				<label for="note" class="t1">備註:</label>
				<textarea name="note" id="note" cols="45" rows="2"></textarea>
			</div>

			<label for="appointment">預約時間:</label>
			<div class="formgroup">
				<input type="datetime-local" id="appointment" name="appointment"
					value="2023-06-01 10:00" min="2023-06-01 10:00"
					max="2023-06-30 18:00">
			</div>
			<br>

			<button type="submit" class="btn btn-dark">確認送出</button>

		</form:form>
	</div>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>
