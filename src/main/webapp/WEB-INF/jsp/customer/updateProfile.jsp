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
<title>小豆腐會員中心</title>
<link href="${contextRoot}/css/sidebars.css" rel="stylesheet">
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'></link>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
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
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
	<h1 class="text-center fw-bold"
		style="margin-top: 20px; color: #005AB5">
		<i class="fa fa-pencil" style="margin-right: 10px; color: #000079"></i>修改會員資料
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
								<li style="margin-left: 20px"><a href="#"
									class="link-dark d-inline-flex text-decoration-none rounded">訂單資料</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>


		<form action="${contextRoot}/customer/update" method="post"
			enctype="multipart/form-data" class="row g-4" style="margin-top: 5px">

			<div style="margin-left: 550px">
				<c:choose>
					<c:when test="${loggedInCustomer.photo != null}">
						<img id="profileImg" name="profileImg"
							src="${contextRoot}/downloadPhoto/${loggedInCustomer.customer_id}"
							width="250" height="250" class="rounded-circle">
					</c:when>
					<c:otherwise>
						<img id="profileImg" name="profileImg"
							src="${contextRoot}/img/indexPicture/tofu.png" width="250"
							height="250" class="rounded-circle">
					</c:otherwise>
				</c:choose>

				<div class="col-9" style="margin-top: 20px; margin-left: 70px">
					<label class="btn btn-secondary"> <input id="uploadImg"
						style="display: none;" type="file" name="uploadImg"> <i
						class="fa fa-photo"></i> 上傳圖片
					</label>
				</div>
			</div>

			<div class="col-md-5" style="margin-left: 50px">
				<label for="inputName" class="form-label fw-bold">Name<i
					class="fa fa-child" style="margin-left: 5px; color: #000079"></i></label> <input
					type="text" class="form-control" id="name"
					value="${loggedInCustomer.name}" name="name">
			</div>
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label fw-bold">Email<i
					class="fa fa-envelope" style="margin-left: 5px; color: #000079"></i></label>
				<input type="email" class="form-control" id="email" disabled="true"
					value="${loggedInCustomer.email}" name="email">
			</div>
			<div class="col-md-5" style="margin-left: 50px">
				<label for="inputAccount" class="form-label fw-bold">Account<i
					class="fa fa-user" style="margin-left: 5px; color: #000079"></i></label> <input
					type="text" class="form-control" id="account" disabled="true"
					value="${loggedInCustomer.account}" name="account">
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label fw-bold">Password<i
					class="fa fa-key" style="margin-left: 5px; color: #000079"></i></label> <input
					type="password" class="form-control" id="password" disabled="true"
					value="${loggedInCustomer.password}" name="password">
			</div>

			<div class="col-md-5" style="margin-left: 50px">
				<label for="inputPhone" class="form-label fw-bold">Phone<i
					class="fa fa-phone" style="margin-left: 5px; color: #000079"></i></label> <input
					type="text" class="form-control" id="phone"
					value="${loggedInCustomer.phone}" name="phone">
			</div>

			<div class="col-md-4">
				<label for="inputBirthday" class="form-label fw-bold">Birthday<i
					class="fa fa-birthday-cake"
					style="margin-left: 5px; color: #000079"></i></label> <input type="date"
					class="form-control text-center" id="birthday"
					value="${loggedInCustomer.birthday}" name="birthday">
			</div>
			<div class="col-md-5" style="margin-left: 50px">
				<label for="inputAge" class="form-label fw-bold">Age<i
					class="fa fa-calendar" style="margin-left: 5px; color: #000079"></i></label>
				<input type="text" class="form-control" id="age"
					value="${loggedInCustomer.age}" name="age">
			</div>

			<div class="col-md-4">
				<label for="inputCity" class="form-label fw-bold">Gender</label><br>


				<div class="text-center form-control d-flex justify-content-evenly">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							id="male" value="male"><label
							class="form-check-label fw-bold" for="male"><i
							class="fa fa-male" style="margin-right: 5px; color: #000079"></i>Male</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							id="female" value="female"> <label
							class="form-check-label fw-bold" for="female"><i
							class="fa fa-female" style="margin-right: 5px; color: #000079"></i>Female</label>
					</div>
				</div>
				<c:choose>
					<c:when test="${loggedInCustomer.gender == 'male'}">
						<script type="text/javascript">
							$("#male").prop("checked" , true)
						</script>
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							$("#female").prop("checked" , true)
						</script>
					</c:otherwise>
				</c:choose>



			</div>

			<div class="col-md-9" style="margin-left: 50px">
				<label for="inputAddress" class="form-label fw-bold">Address<i
					class="fa fa-map-marker" style="margin-left: 5px; color: #000079"></i></label>
				<input type="text" class="form-control" id="inputAddress"
					value="${loggedInCustomer.address}" name="address">
			</div>



			<div class="col-8 d-flex justify-content-start"
				style="margin-left: 50px">
				<button type="submit" class="btn btn-dark">送出修改資料</button>
				<button type="button" class="btn btn-warning" id="updateMember">一鍵輸入</button>
			</div>
		</form>
	</div>






	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>
	<script type="text/javascript"
		src="${contextRoot}/js/pages/sidebars.js"></script>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

	<!-- 製作show出預覽圖片的JS程式碼 -->
	<script>
		const image = document.querySelector("#profileImg")
		const uploadImg = document.querySelector("#uploadImg")
		

		uploadImg.addEventListener("change" ,() => {
			image.src = URL.createObjectURL(uploadImg.files[0]);
		});
		
		document.querySelector('#updateMember').addEventListener('click', function() {
			document.querySelector('#name').value = '嗨我是新會員';
			document.querySelector('#phone').value = '0911-888-999';
			document.querySelector('#birthday').value = '2023-05-05';
			document.querySelector('#age').value = '18';
			document.querySelector('#gender').value = 'male';
			document.querySelector('#address').value = '台北市大安區復興南路一段390號2樓';
		});
		
	</script>






</body>
</html>
