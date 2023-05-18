<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/mgmHeader.jsp" />


	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/layout/mgmNavbar.jsp" />
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<h2>這裡是產品的管理頁面</h2>

				<div>
					<table class="table align-middle text-center">
						<thead>
							<tr>
								<th scope="col">商品編號</th>
								<th scope="col">廠牌</th>
								<th scope="col">商品名稱</th>
								<th scope="col">車型</th>
								<th scope="col">排氣量</th>
								<th scope="col">價錢</th>
								<th scope="col">圖片</th>
								<th scope="col">修改</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList}" var="pList" begin="0" end="69">
								<tr>
									<td>${pList.productId}</td>
									<td>${pList.brand}</td>
									<td>${pList.productModel}</td>
									<td>${pList.category}</td>
									<td>${pList.displacement}</td>
									<td>${pList.productPrice}</td>
									<td><img src="../img/product/${pList.productModel}.jpg" style="width:100px;height:80px" class="customerpic" /></td>
									<div>
										<td>
											<form action="${contextRoot}/maintenance/update" >
										      	<input type="hidden" name="revise"value="${pList.productId}"/>
										    	<input type="submit" class="btn btn-warning" value="修改"/>
										    </form>
									    </td>
								    </div>
									<td>
										<form action="${contextRoot}/maintenance/delete" method="post">
											<input type="hidden" name="delete" value="${pList.productId}"/>
											<input type="hidden" name="_method" value="delete"/>
											<input type="submit" class="btn btn-danger" value="刪除"/>
									    </form>
								    </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>