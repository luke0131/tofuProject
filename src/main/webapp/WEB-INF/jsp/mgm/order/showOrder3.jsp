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
			
				




		</tbody>
	  </table>

	  <input type="button" id="btnCreate" value="新增" onclick="callCreate()">

</div>
	
	<script>


	$(document).ready(function(){

		



		axios.get("http://localhost:8080/tofu/order/findAllOrders").then(function(response) {
			
		console.log("response", response);

		// count = response.data.count;
		// pages = Math.ceil(count/rows);
		// lastRows = count % rows;
		// makePaginationNumbers(pages, current);
		// setButtonStatus(pages, current);


		let array = response.data;
		console.log(array.length);
		if(array!=null && array.length!=0) {
			for(let i=0; i<array.length; i++) {
				let trText = "<tr><td>"+"ORD0000"+array[i].id+"</td>"+
							"<td>"+array[i].order_date+"</td>"+
							"<td><button type='button' class='btn btn-success payment'>"+ array[i].payment+"</button></td>"+
							"<td><button type='button' class='btn btn-success Shipment'>"+ array[i].ship_status+"</button></td>"+
							"<td><button type='button' class='btn btn-success status'>"+ array[i].order_status+"</button></td>"+
							"<td><a href='${contextRoot}/order/showDetail?id="+array[i].id+"'><button type='button' class='btn btn-outline-success'><i class='fa-solid fa-file' style='width: 20px;'></i></button></a></td>"+
							"<td><a href='${contextRoot}/order/showModify?id="+array[i].id+"' style='text-decoration: none;'><button type='button' class='btn btn-outline-primary'><i class='fa-solid fa-file-pen' style='width: 20px;'></i></button></a>"+
							"<button type='button' class='btn btn-outline-danger' onclick='callRemove("+array[i].id+")'><i class='fa-solid fa-trash-can' style='width: 20px;'></i></td></tr>";
				let trNode = $.parseHTML(trText);
				$("table.table > tbody").append(trNode);

				var str = $('.Shipment')[i].innerText;
				console.log(str);
				if(str == "未出貨"){
					$('.Shipment')[i].style.backgroundColor="red";
					$('.Shipment')[i].style.borderColor="red";
				}else if(str == "運送中"){
					$('.Shipment')[i].style.backgroundColor="gold";
					$('.Shipment')[i].style.borderColor="gold";
				}

				var str = $('.payment')[i].innerText;
				if(str == "未付款"){
					$('.payment')[i].style.backgroundColor="red";
					$('.payment')[i].style.borderColor="red";
					}
				var str = $('.status')[i].innerText;
				if(str == "訂單取消"){
					$('.status')[i].style.backgroundColor="red";
					$('.status')[i].style.borderColor="red";
				}else if(str == "正在處理"){
					$('.status')[i].style.backgroundColor="gold";
					$('.status')[i].style.borderColor="gold";
				}

			}

		}
		
		console.log($('.Shipment')[0]);
		console.log($('.Shipment').length);


	}).catch(function(error) {
		console.log("error", error);	
	}).finally(function() {

	});


	});







	function callRemove(id) {
		console.log("id = "+id);
		axios.get("http://localhost:8080/tofu/order/cancel/"+id).then(function(response) {
			console.log("response",response);
			let index = id-1;
			$('.status')[index].innerText = "訂單取消";

			$('.status')[index].style.backgroundColor="red";
			$('.status')[index].style.borderColor="red";


		}).catch(function(){

		}).finally(function(){
			
		});
	};



	function callCreate() {

		axios.get("http://localhost:8080/tofu/order/findAllOrders?p=3").then(function(response) {
			
			console.log("response", response);
	
			// count = response.data.count;
			// pages = Math.ceil(count/rows);
			// lastRows = count % rows;
			// makePaginationNumbers(pages, current);
			// setButtonStatus(pages, current);
	
	
			let array = response.data;
			console.log(array.length);
			if(array!=null && array.length!=0) {
				for(let i=0; i<array.length; i++) {
					let trText = "<tr><td>"+"ORD0000"+array[i].id+"</td>"+
								"<td>"+array[i].order_date+"</td>"+
								"<td><button type='button' class='btn btn-success payment'>"+ array[i].payment+"</button></td>"+
								"<td><button type='button' class='btn btn-success Shipment'>"+ array[i].ship_status+"</button></td>"+
								"<td><button type='button' class='btn btn-success status'>"+ array[i].order_status+"</button></td>"+
								"<td><a href='${contextRoot}/order/showDetail?id="+array[i].id+"'><button type='button' class='btn btn-outline-success'><i class='fa-solid fa-file' style='width: 20px;'></i></button></a></td>"+
								"<td><a href='${contextRoot}/order/showModify?id="+array[i].id+"' style='text-decoration: none;'><button type='button' class='btn btn-outline-primary'><i class='fa-solid fa-file-pen' style='width: 20px;'></i></button></a>"+
								"<button type='button' class='btn btn-outline-danger' onclick='callRemove("+array[i].id+")'><i class='fa-solid fa-trash-can' style='width: 20px;'></i></td></tr>";
					let trNode = $.parseHTML(trText);
					$("table.table > tbody").append(trNode);
	
					var str = $('.Shipment')[i].innerText;
					console.log(str);
					if(str == "未出貨"){
						$('.Shipment')[i].style.backgroundColor="red";
						$('.Shipment')[i].style.borderColor="red";
					}else if(str == "運送中"){
						$('.Shipment')[i].style.backgroundColor="gold";
						$('.Shipment')[i].style.borderColor="gold";
					}
	
					var str = $('.payment')[i].innerText;
					if(str == "未付款"){
						$('.payment')[i].style.backgroundColor="red";
						$('.payment')[i].style.borderColor="red";
						}
					var str = $('.status')[i].innerText;
					if(str == "訂單取消"){
						$('.status')[i].style.backgroundColor="red";
						$('.status')[i].style.borderColor="red";
					}else if(str == "正在處理"){
						$('.status')[i].style.backgroundColor="gold";
						$('.status')[i].style.borderColor="gold";
					}
	
				}
	
			}
			
			console.log($('.Shipment')[0]);
			console.log($('.Shipment').length);
	
	
		}).catch(function(error) {
			console.log("error", error);	
		}).finally(function() {
	
		});

	};






	</script>
	
			
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>