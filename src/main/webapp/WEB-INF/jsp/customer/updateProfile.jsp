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
<title>小豆腐會員中心-修改會員資料</title>
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
	<h1 class="text-center fw-bold"
		style="margin-top: 20px; color: #005AB5">
		<i class="fa fa-pencil"
			style="margin-right: 10px; color: #000079; margin-bottom: 10px"></i>修改會員資料
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
								<li style="margin-left: 20px"><a href="${contextRoot}/searchPost"
									class="link-dark d-inline-flex text-decoration-none rounded">發文留言</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>


		<form action="${contextRoot}/customer/update" method="post"
			enctype="multipart/form-data" class="row g-4" style="margin-top: 5px"
			id="updateForm">

			<div
				class="d-none alert alert-success alert-dismissible d-flex fade show text-dark"
				role="alert" id="updateSuccess"
				style="width: 350px; margin-left: 500px">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="currentColor" class="bi flex-shrink-0 me-2"
					viewBox="0 0 16 16" role="img" aria-label="Success:">
    							<path
						d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
  							</svg>
				<div id="updateSuccessMessage"></div>
				<button type="button" class="btn-close" id="alert-button-close"
					aria-label="Close"></button>
			</div>
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
				<label for="newAddress" class="form-label fw-bold">Address<i
					class="fa fa-map-marker" style="margin-left: 5px; color: #000079"></i></label>
				<input type="text" class="form-control"
					value="${loggedInCustomer.address}" name="address" id="newAddress">
			</div>



			<div class="col-8 d-flex justify-content-start"
				style="margin-left: 50px">
				<button type="submit" class="btn btn-dark" id="updateButton">送出修改資料</button>
				<button type="button" class="btn btn-warning" id="updateMember"
					style="margin-left: 10px">一鍵輸入</button>
<!-- 				<button type="button" class="btn btn-success" id="Jolin" -->
<!-- 					style="margin-left: 10px">Jolin</button> -->
			</div>


		</form>
	</div>


	<c:if test="${success}">
		<script type="text/javascript">
			//const updateButton = document.getElementById("updateButton");
			
			console.log("準備進來方法")
			
			window.addEventListener('load', function() {
				Swal.fire({
					  position: 'top-center',
					  icon: 'success',
					  title: '更新成功!',
					  showConfirmButton: false,
					  timer: 1500
					})
		    });
			/*
			updateButton.addEventListener("click" , function(e){
				e.preventDefault();
				document
	      			.querySelector("#updateForm div[id=updateSuccess]")
	      			.classList.remove("d-none");

	    		document.querySelector("#updateForm div[id=updateSuccessMessage]"
	    		).innerText = "修改成功!";
	  			
	    		//true
				
			});
			*/
			document.querySelector("body").addEventListener("click",function (e) {
				console.log("更新完後的頁面");
				document.querySelector("#updateSuccess").classList.add("d-none");
	  		},
			);
						</script>

	</c:if>



	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>
	<script type="text/javascript"
		src="${contextRoot}/js/pages/sidebars.js"></script>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

	<script>
		// 製作show出預覽圖片的JS程式碼
		const image = document.querySelector("#profileImg")
		const uploadImg = document.querySelector("#uploadImg")
		
	
		uploadImg.addEventListener("change" ,() => {
			image.src = URL.createObjectURL(uploadImg.files[0]);
		});
		
		document.querySelector('#updateMember').addEventListener('click', function() {
			document.querySelector('#name').value = '嗨我是測試喔!';
			document.querySelector('#phone').value = '0988-888-888';
			document.querySelector('#birthday').value = '2023-05-24';
			document.querySelector('#age').value = '18';
			document.querySelector('#newAddress').value = '台北市大安區復興南路一段390號2樓';
		});
		
		document.querySelector('#Jolin').addEventListener('click', function() {
			document.querySelector('#name').value = 'JolinTsai';
			document.querySelector('#phone').value = '0928-456-789';
			document.querySelector('#birthday').value = '1985-01-01';
			document.querySelector('#age').value = '18';
			document.querySelector('#newAddress').value = '台北市大安區敦化南路二段300號';
		});
		

		
		/*
		function myAlert() {
		    }
		 	// 當網頁載入時，執行這個 callback 函數
		    window.addEventListener('load', function() {
		      alert('更新成功!');
		    });

		    // 當使用者用滑鼠點擊頁面時，執行 myAlert 函數
		    updateButton.addEventListener('submit', myAlert);
	*/
	</script>







</body>
</html>
