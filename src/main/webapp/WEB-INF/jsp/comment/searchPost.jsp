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
<title>發文頁面管理</title>
<link href="${contextRoot}/css/sidebars.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRoot}/css/postAndComment/post.css">
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'></link>
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
</style>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

<h1 class="text-center fw-bold"
		style="margin-top: 20px; color: #005AB5">
		<i class="fa fa-pencil"
			style="margin-right: 10px; color: #000079; margin-bottom: 10px"></i>查詢發文紀錄
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
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 large">
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
							<li style="margin-left: 20px"><a
								href="${contextRoot}/searchPost"
								class="link-dark d-inline-flex text-decoration-none rounded">發文留言</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>



	<div class="container-fluid">
		<div class="row">

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
<!-- 				<h2 class="text-start mt-2 fw-bold" >會員文章管理</h2> -->

				<div class="table-responsive">
					<table>
						<thead class="text-center">
							<tr style="color:#005AB5;">
								<th>您已發布的文章</th>
								<th>編輯/刪除</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="post" items="${page.content}">
							<tr>
								<td>
<!-- 				<div class="d-flex justify-content-center" style="display: flex"> -->
					
<!-- 							<div class="vam"> -->
								<h3>
									<a href="${contextRoot}/comment/${post.post_id}"
										class="title text-wrap" title="標題" data-title="標題"
										style="text-decoration: none; margin-right:200px; color:black">${post.title}</a>
								</h3>
<!-- 							</div> -->
						</td> <!-- 								<div class="edit-place" style="display: flex"> -->
							<td>
							<div class="edit-place d-flex p-3" >
								<form action="${contextRoot}/searchPost/edit">
									<input type="hidden" name="post_id" value="${post.post_id}" />

									<input type="submit" class="btn btn-outline-success btn-sm"
										value="編輯" style=" margin-right:10px" />
								</form>

								<form action="${contextRoot}/searchPost/delete" method="post">
									<input type="hidden" name="post_id" value="${post.post_id}" />
									<input type="hidden" name="_method" value="delete" /> <input
										type="submit" class="btn btn-outline-danger btn-sm"
										value="刪除" style=" margin-left:10px" />
								</form>

							</div>
<!-- 				</div> -->
						</td>
					
			</tr>
			</c:forEach>
		</tbody>
		</table>	





				<div class="pagelink" style="margin-left:380px">
					<c:forEach var="pageNumber" begin="1" end="${page.totalPages}" >
						<c:choose>
							<c:when test="${page.number !=  pageNumber-1}">
								<a href="${contextRoot}/searchPost?p=${pageNumber}"
									style="text-decoration: none;">${pageNumber}</a>
							</c:when>
							<c:otherwise>
								<span>${pageNumber}</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
	
				</div>
			</div>

			</main>
		</div>
	</div>
</div>

	<a href="#top" class="top">Top</a>


	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>
</html>