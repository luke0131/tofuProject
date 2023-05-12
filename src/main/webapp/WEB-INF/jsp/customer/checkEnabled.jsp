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
<title>豆腐車業股份有限公司</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<!-- <div class="d-flex justify-content-center" style="margin-top: 50px">
		<img src="${contextRoot}/img/indexPicture/check.png" class="image" />
	</div> 
	-->



	<div
		class="d-flex justify-content-center align-items-center fw-bold fs-1"
		style="margin-top: 20px">恭喜註冊完成!</div>
	<div
		class="d-flex justify-content-center align-items-center fw-bold fs-4 text-danger"
		style="margin-top: 10px">請至您的信箱進行相關驗證程序</div>

	<figure class="d-flex justify-content-center"
		style="width: 500px; height: 500px; margin: auto">
		<img src="${contextRoot}/img/indexPicture/successful.gif" />
	</figure>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>