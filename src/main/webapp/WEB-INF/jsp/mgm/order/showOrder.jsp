<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8" />
<title>豆腐車業管理平台-會員管理</title>
<script type="text/javascript"
	src="${contextRoot}/js/pages/dashboard.js"></script>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>






<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
	.linker{
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
				<h1 style="text-align: center; margin-top: 50px;">訂單及禮物的管理頁面</h1>



				<form action="${contextRoot}/order/findByOption" method="get" style="width: 650px;margin: auto;margin-top: 50px;">
					<h5 style="text-align: center;">搜尋條件</h5>
					<div style="margin-top: 10px;">
						<span class="t1">付款狀態：</span>
						<label><input type="radio" name="payment" value="未付款" style="margin-left: 20px;">未付款</label>
						<label><input type="radio" name="payment" value="已付款" style="margin-left: 20px;">已付款</label>
						
					</div>
					<div style="margin-top: 10px;">
						<span class="t1">出貨狀態：</span>
						<label><input type="radio" name="shipment" value="未出貨" style="margin-left: 20px;">未出貨</label>
						<label><input type="radio" name="shipment" value="運送中" style="margin-left: 20px;">運送中</label>
						<label><input type="radio" name="shipment" value="已送達" style="margin-left: 20px;">已送達</label>
					</div>
					<div style="margin-top: 10px;">
						<span class="t1">訂單狀態：</span>
						<label><input type="radio" name="status" value="訂單完成" style="margin-left: 20px;">訂單完成</label>
						<label><input type="radio" name="status" value="正在處理" style="margin-left: 20px;">正在處理</label>
						<label><input type="radio" name="status" value="訂單取消" style="margin-left: 20px;">訂單取消</label>
					</div>
					<div style="text-align: center; margin-top: 10px;">
						<button type="submit" class="btn btn-primary">查詢</button>
						<button type="reset" class="btn btn-primary">重設</button>
					</div>
				</form>





	
	
	<div style="height: 750px; margin-top: 50px;">
	
	<table class="table align-middle mb-0 bg-white table-hover" style="width: 1000px;margin: auto;">
		<thead class="bg-light">
		  <tr>
			<th>Order Number</th>
			<th>Order Date</th>
			<th>Payment</th>
			<th>Shipment</th>
			<th>Order Status</th>
			<th>Detail</th>
			<th>Modify</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="orders">
				<tr>
					<td>
						<p class="fw-bold mb-1 id">ORD0000${orders.id }</p>
					</td>
					<td>
						<p class="fw-bold mb-1">${orders.order_date }</p>
					</td>
					<td>
						<button type="button" class="btn btn-success payment">${orders.payment }</button>
					</td>
					<td>
						<button type="button" class="btn btn-success Shipment">${orders.ship_status }</button>
					</td>
					<td>
						<button type="button" class="btn btn-success status">${orders.order_status }</button>
					</td>
					<td>
						<a href="${contextRoot}/order/showDetail?id=${orders.id}">
							<button type="button" class="btn btn-outline-success"><i class="fa-solid fa-file" style="width: 20px;"></i></button>
						</a>
					</td>
					<td>
						<a href="${contextRoot}/order/showModify?id=${orders.id}" style="text-decoration: none;">
							<button type="button" class="btn btn-outline-primary"><i class="fa-solid fa-file-pen" style="width: 20px;"></i></button>
						</a>
					
						<a href="${contextRoot}/order/updateStatus?id=${orders.id}&source=${str}" style="text-decoration: none;">
							<button type="button" class="btn btn-outline-danger"><i class="fa-solid fa-trash-can" style="width: 20px;"></i></button>
						</a>


							<!-- <button type="button" class="btn btn-outline-danger" onclick="callRemove(${orders.id})"><i class="fa-solid fa-trash-can" style="width: 20px;"></i></button> -->

						
					</td>
				</tr>
			</c:forEach>
		</tbody>
	  </table>
	<div style="text-align: center; padding-top: 50px;">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

			<c:choose>
				<c:when test="${page.number !=  pageNumber-1}">
				<a href="${contextRoot}/order/${str}?p=${pageNumber}" style="text-decoration: none;" class="linker"><span style="color: black;">${pageNumber}</span></a>
				</c:when>
				<c:otherwise><span style="background-color: black; color: aliceblue;" class="linker">${pageNumber}</span></c:otherwise>
			</c:choose>

		</c:forEach>
	</div>
</div>
	
	<script>


	// $(document).ready(function(){



	// 	axios.get("http://localhost:8080/tofu/order/findAllOrders").then(function(response) {
			
	// 	console.log("response", response);

	// 	// count = response.data.count;
	// 	// pages = Math.ceil(count/rows);
	// 	// lastRows = count % rows;
	// 	// makePaginationNumbers(pages, current);
	// 	// setButtonStatus(pages, current);


	// 	let array = response.data;
	// 	console.log(array.length);
	// 	if(array!=null && array.length!=0) {
	// 		for(let i=0; i<array.length; i++) {
	// 			let trText = "<tr><td>"+"ORD0000"+array[i].id+"</td>"+
	// 						"<td>"+array[i].order_date+"</td>"+
	// 						"<td><button type='button' class='btn btn-success payment'>"+ array[i].payment+"</button></td>"+
	// 						"<td><button type='button' class='btn btn-success Shipment'>"+ array[i].ship_status+"</button></td>"+
	// 						"<td><button type='button' class='btn btn-success status'>"+ array[i].order_status+"</button></td>"+
	// 						"<td><a href='${contextRoot}/order/showDetail?id="+array[i].id+"'><button type='button' class='btn btn-outline-success'><i class='fa-solid fa-file' style='width: 20px;'></i></button></a></td>"+
	// 						"<td><a href='${contextRoot}/order/showModify?id="+array[i].id+"' style='text-decoration: none;'><button type='button' class='btn btn-outline-primary'><i class='fa-solid fa-file-pen' style='width: 20px;'></i></button></a>"+
	// 						"<button type='button' class='btn btn-outline-danger' onclick='callRemove("+array[i].id+")'><i class='fa-solid fa-trash-can' style='width: 20px;'></i></td></tr>";
	// 			let trNode = $.parseHTML(trText);
	// 			$("table.table > tbody").append(trNode);

	// 			var str = $('.Shipment')[i].innerText;
	// 			console.log(str);
	// 			if(str == "未出貨"){
	// 				$('.Shipment')[i].style.backgroundColor="red";
	// 				$('.Shipment')[i].style.borderColor="red";
	// 			}else if(str == "運送中"){
	// 				$('.Shipment')[i].style.backgroundColor="gold";
	// 				$('.Shipment')[i].style.borderColor="gold";
	// 			}

	// 			var str = $('.payment')[i].innerText;
	// 			if(str == "未付款"){
	// 				$('.payment')[i].style.backgroundColor="red";
	// 				$('.payment')[i].style.borderColor="red";
	// 				}
	// 			var str = $('.status')[i].innerText;
	// 			if(str == "訂單取消"){
	// 				$('.status')[i].style.backgroundColor="red";
	// 				$('.status')[i].style.borderColor="red";
	// 			}else if(str == "正在處理"){
	// 				$('.status')[i].style.backgroundColor="gold";
	// 				$('.status')[i].style.borderColor="gold";
	// 			}

	// 		}

	// 	}
		
	// 	console.log($('.Shipment')[0]);
	// 	console.log($('.Shipment').length);


	// }).catch(function(error) {
	// 	console.log("error", error);	
	// }).finally(function() {

	// });


	// });







	function callRemove(id) {
		console.log("id = "+id);
		axios.get("http://localhost:8080/tofu/order/cancel/"+id).then(function(response) {
			// console.log("response",response);
			console.log("response",response);
			let index = id;
			console.log(index);
			console.log($('.id')[0]);


			
			for (let i = 0; i < $('.status').length; i++) {
			var str = $('.status')[i].innerText;
			console.log(str);
			if(str == "訂單完成"){
				$('.status')[i].style.backgroundColor="red";
				$('.status')[i].style.borderColor="red";
				$('.status')[i].innerText="訂單取消";
			}
		}



		}).catch(function(){

		}).finally(function(){
			
		});
	};







		for (let i = 0; i < $('.payment').length; i++) {
			var str = $('.payment')[i].innerText;
			if(str == "未付款"){
			$('.payment')[i].style.backgroundColor="red";
			$('.payment')[i].style.borderColor="red";
			}
		}
		for (let i = 0; i < $('.Shipment').length; i++) {
			var str = $('.Shipment')[i].innerText;
			if(str == "未出貨"){
				$('.Shipment')[i].style.backgroundColor="red";
				$('.Shipment')[i].style.borderColor="red";
			}else if(str == "運送中"){
				$('.Shipment')[i].style.backgroundColor="gold";
				$('.Shipment')[i].style.borderColor="gold";
			}
		}
		for (let i = 0; i < $('.status').length; i++) {
			var str = $('.status')[i].innerText;
			if(str == "訂單取消"){
				$('.status')[i].style.backgroundColor="red";
				$('.status')[i].style.borderColor="red";
			}else if(str == "正在處理"){
				$('.status')[i].style.backgroundColor="gold";
				$('.status')[i].style.borderColor="gold";
			}
		}


	</script>
	
			
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>