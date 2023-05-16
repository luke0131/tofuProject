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
<title>小豆腐會員中心-查詢預約紀錄</title>
<link href="${contextRoot}/css/sidebars.css" rel="stylesheet">
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'></link>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
/* 製作top */
.top {
	position: fixed;
	right: 10px;
	bottom: 10px;
	width: 50px;
	height: 50px;
	text-align: center;
	background-color: black;
	border: 2px solid white;
	line-height: 46px;
	border-radius: 50%;
	/* border: 3px solid red; */
	text-decoration: none;
	color: white;
	/* font-weight: bold; */
	font-size: 18px;
}

.top:hover {
	color: Tomato;
}
/* 卷軸移動效果 */
* {
	scroll-behavior: smooth;
}

.title {
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
}

table {
	/*border: 1px solid black;*/
	border-collapse: collapse;
	margin: auto;
	text-align: center;
	width: 1500px;
	font-size: 20px;
	font-family: Arial, Helvetica, sans-serif;
	/*width:100%*/
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
	<h1 class="text-center fw-bold"
		style="margin-top: 20px; color: #005AB5">
		<i class="fa fa-pencil"
			style="margin-right: 10px; color: #000079; margin-bottom: 10px"></i>查詢預約紀錄
	</h1>


	<div class="d-flex">
		<div style="margin-top: 20px; margin-left: 20px">
			<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
				<ul class="list-unstyled ps-0">
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold "
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false">修改會員資料</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal large">
								<li style="margin-left: 20px"><a
									href="${contextRoot}/customer/updateProfile"
									class="link-dark d-inline-flex text-decoration-none rounded">個人資料</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold"
							data-bs-toggle="collapse" data-bs-target="#orders-collapse"
							aria-expanded="false">查詢歷史訂單</button>
						<div class="collapse" id="orders-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal large">
								<li style="margin-left: 20px"><a
									href="${contextRoot}/customer/queryOrder"
									class="link-dark d-inline-flex text-decoration-none rounded">訂單資料</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold"
							data-bs-toggle="collapse" data-bs-target="#home-collapse"
							aria-expanded="false">查詢預約紀錄</button>

						<div class="collapse" id="home-collapse" style="">
							<ul class="btn-toggle-nav list-unstyled fw-normal large">
								<li style="margin-left: 20px"><a
									href="${contextRoot}/customer/queryBook"
									class="link-dark d-inline-flex text-decoration-none rounded">預約資料</a></li>
							</ul>
						</div>
					</li>
					<li class="mb-1">
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed fw-bold"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false">查詢發文紀錄</button>

						<div class="collapse" id="account-collapse" style="">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 large">
								<li style="margin-left: 20px"><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">發文留言</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<table style="margin-right: 100px">
			<thead class="text-decoration-underline">
				<tr>
					<th>項目</th>
					<th>商品品牌</th>
					<th>商品名稱</th>
					<th>預約賞車日期</th>
					<th>目前狀態</th>
					<th>服務專員</th>
					<th>專員電話</th>
<!-- 					<th>立刻撥打</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" end="${books.size()-1}" step="1" var="i">
					<tr>
						<td>${books.get(i).book_id}</td>
						<td>${products.get(i).brand}</td>
						<td>${products.get(i).productModel}</td>
						<td>${books.get(i).book_date}</td>
						<td>${books.get(i).status}</td>
						<td>${employees.get(i).account}</td>
						<td>${employees.get(i).phone}</td>
						<!-- 						<td><a href="tel:+886938659639">Phone: 0938-659-639</a></td> -->
<!-- 						<td> -->
<!-- 							<button type="button" value=update id="call" -->
<!-- 								onclick="call(event)" -->
<!-- 								style="margin-left: 15px; border: 0px solid transparent; background-color: transparent"> -->
<%-- 								<img src="${contextRoot}/img/indexPicture/phone.png"> --%>
<!-- 							</button> -->
<!-- 						</td> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>
	<script type="text/javascript"
		src="${contextRoot}/js/pages/sidebars.js"></script>
	<script type="text/javascript">
		
		function call(event){
			event.preventDefault();
			Swal.fire({
				title: '您確定要撥打服務專員的電話嗎?',
				  showCancelButton: true,
				  confirmButtonText: '確定',
				}).then((result) => {
				  if (result.isConfirmed) {
					Swal.fire('正在撥打中....', '', 'warning')
				  }
				})
		}
		</script>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>