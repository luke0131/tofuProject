<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8" />
<title>豆腐車業管理平台-會員管理</title>
<script type="text/javascript"
	src="${contextRoot}/js/pages/dashboard.js"></script>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>

<style>
.linker {
	border: black solid 2px;
	width: 30px;
	height: 30px;
	display: inline-block;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/mgmHeader.jsp" />

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/layout/mgmNavbar.jsp" />
			
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				
				<br/>
				<h1>商品修改</h1>
				<br/>
				
					<div class="mb-3">
					    <label for="product_model" class="form-label">商品名稱</label>
					    <input type="text" class="form-control" id="product_model" value="Toyota Corolla Altis">
				  	</div>
				  	<div class="mb-3">
					    <label for="category" class="form-label">車型</label>
					    <input type="text" class="form-control" id="category" value="轎車">
				  	</div>
				 	<div class="mb-3">
					    <label for="engine_type" class="form-label">引擎</label>
					    <input type="text" class="form-control" id="engine_type" value="汽油引擎">
				  	</div>
				  	<div class="mb-3">
					    <label for="displacement" class="form-label">排氣量</label>
					    <input type="text" class="form-control" id="displacement" value="1798">
				  	</div>
				  	<div class="mb-3">
					    <label for="product_price" class="form-label">價錢</label>
					    <input type="text" class="form-control" id="product_price" value="780000">
				  	</div>
				  	
				<form>
				  	<button type="submit" class="btn btn-primary">修改</button>
				</form>
				
				<br/>
			
			</main>
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>