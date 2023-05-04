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
		<img src="./img/mPicture/s992.jpg" alt="Your Image">

	</div>
	<br>


	<div class="container">
		<h3 style="text-decoration: underline;">豆腐專業保養</h3>
		<br>

		<h4>選擇預約保養項目</h4>

		<form:form method="post" action="" modelAttribute="maintenanceForm">
			<div
				style="border: 2px solid gray; border-radius: 5px; width: 600px; padding: 10px;">
				<div style="font-size: 18px;" class="formgroup">
					<input type="checkbox" name="mcategory" value="Minor Service" /> <label
						for="mcategory">小保養</label> <input type="checkbox"
						name="mcategory" value="majorService" /> <label for="mcategory">大保養</label>
					<input type="checkbox" name="mcategory" value="Battery" /> <label
						for="mcategory">電池更換</label> <input type="checkbox"
						name="mcategory" value="Engine Carbon Cleaning" /> <label
						for="mcategory">引擎積碳清洗</label> <input type="checkbox"
						name="mcategory" value="Engine Oil Cleaning" /> <label
						for="mcategory">引擎油泥清洗</label>
				</div>
				<br>


				<div style="font-size: 18px;" class="formgroup">

					<input type="checkbox" name="mcategory"
						value="Accessory Installation" /> <label for="">配件加裝</label> <input
						type="checkbox" name="mcategory" value="Tire Replacement" /> <label
						for="">輪胎更換</label> <input type="checkbox" name="mcategory"
						value="Repair and Paint" /> <label for="">鈑金烤漆</label> <input
						type="checkbox" name="mcategory" value="AC System" /> <label
						for="">冷氣系統保養/清潔</label>
				</div>
			</div>
			<br>

			<div class="formgroup">

				<span for="notes" class="t1">備註:</span> <b class="text-danger">可簡單敘述車輛狀況，方便技師快速診斷</b>
				<textarea style="border: 2px solid gray;" name="notes" id="note"
					cols="72" rows="3"></textarea>
			</div>
			<br>
			
<!-- 
			<label for="appointment">預約時間:</label>
			<div class="formgroup">
				<input type="datetime-local" id="appointment" name="appointment"
					value="2023-06-01 10:00" min="2023-06-01 10:00"
					max="2023-06-30 18:00">
			</div>

 -->



			<div style="border: 2px solid gray; border-radius: 5px; width: 600px; padding: 10px;">
			<label>預約時間：</label>
			<div class="formgroup">
				<input type="date" style="border: 2px solid dark; border-radius: 5px;padding: 6px;"id="appointment" name="appointment"
					value="2023-06-01 10:00" min="2023-06-01" max="2023-06-30">
				<select style="border: 3px solid dark; border-radius: 5px;padding: 8px;" name="appointmenttime">
				<option  value="">請點擊選擇時段</option>
					<option value="上午10:00">10:00</option>
					<option value="上午11:00">11:00</option>
					<option value="中午12:00">12:00</option>
					<option value="下午13:00">13:00</option>
					<option value="下午14:00">14:00</option>
					<option value="下午15:00">15:00</option>
					<option value="下午16:00">16:00</option>
					<option value="下午17:00">17:00</option>
					<option value="下午18:00">18:00</option>
					<option value="晚上19:00">19:00</option>
					<option value="晚上20:00">20:00</option>
				</select>

			</div>
			</div>







			<br>

			<button type="submit" class="btn btn-dark">確認送出</button>

		</form:form>
	</div>
<br>
	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
	<script type="text/javascript"
		src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${contextRoot}/js/js/jquery-3.6.4.min.js"></script>
</body>
</html>
