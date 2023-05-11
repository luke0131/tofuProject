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
<!-- 自定義通用css -->
<style>
.title {
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
}

table {
	/* 	border: 1px solid black; */
	border-collapse: collapse;
	margin: auto;
	text-align: center;
	width: 1500px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
}

/* table, td, th { */
/* 	border: 1px solid black; */
/* } */
.customerpic {
	width: 80px;
	height: 80px;
}
</style>
<script type="text/javascript"
	src="${contextRoot}/js/pages/dashboard.js"></script>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/mgmHeader.jsp" />


	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/layout/mgmNavbar.jsp" />
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<h2 class="text-center mt-2 fw-bold">小豆腐會員列表</h2>
				<div class="table-responsive">
					<table>
						<thead>
							<tr>
								<th>編號</th>
								<th>圖片</th>
								<th>姓名</th>
								<!-- 								<th>account</th> -->
								<th>信箱</th>
								<th>手機號碼</th>
								<th>生日</th>
								<th>地址</th>
								<th>權限管理</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${customerList}" var="cList">
								<tr>
									<td>${cList.customer_id}</td>
									<td><img
										src="${contextRoot}/downloadPhoto/${cList.customer_id}"
										class="customerpic" /></td>
									<td>${cList.name}</td>
									<%-- 									<td>${cList.account}</td> --%>
									<td>${cList.email}</td>
									<td>${cList.phone}</td>
									<td>${cList.birthday}</td>
									<td>${cList.address}</td>
									<!-- 									<td> -->
									<!-- 										<button type="submit" value=stop class="btn btn-danger">停止權限</button> -->
									<!-- 									</td> -->
									<!-- 									<td> -->
									<!-- 										<button type="submit" value=continue class="btn btn-success">恢復權限</button> -->
									<!-- 									</td> -->

									<td>

									<c:if test="${cList.enabled == false}">
											<button type="submit" value=stop class="btn btn-success">恢復</button>
											<button type="submit" value=continue
												class="btn btn-secondary">停止</button>
										</c:if> <c:if test="${cList.enabled == true}">
											<button type="submit" value=stop class="btn btn-secondary">恢復</button>
											<button type="submit" value=continue class="btn btn-danger">停止</button>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
	<script type="text/javascript">
		$("").classList.add();
		$("").classList.remove();
	</script>
</body>
</html>