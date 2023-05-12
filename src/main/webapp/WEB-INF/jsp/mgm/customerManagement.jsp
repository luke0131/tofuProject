<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<script type="text/javascript">
      const contextRoot = "${pageContext.request.contextPath}";
    </script>
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
							<c:forEach items="${page.content}" var="cList">
								<tr>
									<td>${cList.customer_id}</td>
									<td><img
										src="${contextRoot}/downloadPhoto/${cList.customer_id}"
										class="customerpic" /></td>
									<td>${cList.name}</td>
									<%--
                    <td>${cList.account}</td>
                    --%>
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

									<td><c:if test="${cList.enabled == false}">
											<button type="submit" value="stop"
												class="recoverButton btn btn-success"
												id="recover${cList.customer_id}">恢復</button>
											<button type="submit" value="continue"
												id="stop${cList.customer_id}"
												class="stopButton btn btn-secondary">停止</button>
										</c:if> <c:if test="${cList.enabled == true}">
											<button type="submit" value="stop"
												class="recoverButton btn btn-secondary"
												id="recover${cList.customer_id}">恢復</button>
											<button type="submit" value="continue"
												class="stopButton btn btn-danger"
												id="stop${cList.customer_id}">停止</button>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>




				<!--           這裡是放page的foreach -->
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<c:choose>

						<c:when test="${page.number !=  pageNumber-1}">
							<a href="${contextRoot}/mgm/customerManagement?p=${pageNumber}">${pageNumber}</a>
						</c:when>

						<c:otherwise>
							${pageNumber}
                 		</c:otherwise>
					</c:choose>
				</c:forEach>


			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
	<script type="text/javascript">
      // function('click'){
      // 	$("recover").classList.add();
      // 	$("stop").classList.remove();
      // }
      console.log("開始執行JS");

      // 			var allButtons = document.querySelectorAll('tbody button');
      // 			for(let i = 0; i < allButtons.length; i++){
      // 				allButtons[i].addEventListener('click',function(){

      // 				});
      // 			}

      $("tbody").on("click", ".recoverButton.btn-success", function (e) {
        //e.preventDefault();

        //點恢復
        console.log(this.id.substring(7));
        let customerId = $(this)[0].id.substring(7);
        Swal.fire({
          title: "確定要將該會員重新啟用帳號嗎?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "btn btn-primary",
          cancelButtonColor: "btn btn-secondary",
          confirmButtonText: "確定",
        }).then((result) => {
          //停權變啟用
          axios
            .get(contextRoot + "/mgm/recoverAccount/" + customerId)
            .then(function (response) {
              console.log(response);
			  console.log("按了綠色按鈕");
			  $("#recover" + customerId).removeClass("btn-success"); //會把恢復
			  $("#stop" + customerId).removeClass("btn-secondary"); //轉成灰色
			  $("#recover" + customerId).addClass("btn-secondary"); //會把停止
			  $("#stop" + customerId).addClass("btn-danger"); //轉成紅色
            })
            .catch(function (error) {
              console.log(error);
            });

          if (result.isConfirmed) {
            Swal.fire("已成功啟用!", "恭喜你救回一名黑名單會員^ ^", "success");
          }
        });

      });

      $("tbody").on("click", ".stopButton.btn-danger", function (e) {
        //e.preventDefault();

        //點停止
        let customerId = $(this)[0].id.substring(4);

        Swal.fire({
          title: "確定要將該會員停用帳號嗎?",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "btn btn-primary",
          cancelButtonColor: "btn btn-secondary",
          confirmButtonText: "確定",
        }).then((result) => {
          //啟用變停權
          axios
            .get(contextRoot + "/mgm/stopAccount/" + customerId)
            .then(function (response) {
				console.log("按了紅色按鈕");
				$("#stop" + customerId).removeClass("btn-danger"); //會把紅色
				$("#recover" + customerId).removeClass("btn-secondary"); //轉成灰色
				$("#stop" + customerId).addClass("btn-secondary"); //會把恢復
				$("#recover" + customerId).addClass("btn-success"); //轉成綠色
              console.log(response);
            })
            .catch(function (error) {
              console.log(error);
            });

          if (result.isConfirmed) {
            Swal.fire("已成功停權!", "恭喜你新增一名黑名單會員^ ^", "success");
          }
        });

      });

      // 			function recover(idType){
      // 				let id = idType.substring(7);
      // 				console.log(id);

      // // 				axios.get("xxx/{id}/{參數(要1變零或0變1)}")....then(function(){
      // // 					//資料庫改完資料後
      // // 					//改變頁面
      // // 				})
      // 				$("#"+idType).toggleClass("btn-success");
      // 				$("#"+idType).toggleClass("btn-secondary");
      // 				$("#stop"+id).toggleClass("btn-danger");
      // 				$("#stop"+id).toggleClass("btn-secondary");
      // 			}

      // 			function stop(idType){
      // 				let id = idType.substring(4);
      // 				console.log(id);
      // 				$("#"+idType).toggleClass("btn-secondary");
      // 				$("#"+idType).toggleClass("btn-danger");
      // 				$("#recover"+id).toggleClass("btn-success");
      // 				$("#recover"+id).toggleClass("btn-secondary");
      // 			}
    </script>
</body>
</html>
