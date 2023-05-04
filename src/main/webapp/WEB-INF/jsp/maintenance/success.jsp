<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預約成功</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
}

.container {
	width: 50%;
	margin: auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h1 {
	color: #4CAF50;
	margin-top: 0;
}

p {
	font-size: 18px;
	margin: 20px 0;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
	<div class="container">
		<h1>您已成功完成 TOFU保養預約</h1>
		<p>感謝您的預約，豆腐車業專業保養竭誠為您服務</p>
		<P>您的訂單編號為:${keycode}</p>
		<p>預約時間：${formattedDate}號${appointmenttime}</p>
	</div>

</body>

</html>