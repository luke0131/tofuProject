<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="../layout/navbar.jsp" />
	
	<h1>Hello Order</h1>
	
	
	<div style="height: 750px;">
	
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
						<p class="fw-bold mb-1">ORD0000${orders.id }</p>
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
						<button type="button" class="btn btn-success">${orders.id }</button>
					</td>
					<td>
						<a href="${contextRoot}/tofu/order/showDetail?id=${orders.id}">
							<button type="button" class="btn btn-outline-success"><i class="fa-solid fa-file" style="width: 20px;"></i></button>
						</a>
					</td>
					<td>
						<a href="${contextRoot}/tofu/order/showModify?id=${orders.id}" style="text-decoration: none;">
							<button type="button" class="btn btn-outline-primary"><i class="fa-solid fa-file-pen" style="width: 20px;"></i></button>
						</a>
					
						<a href="${contextRoot}/tofu/order/removeOrder?id=${orders.id}" style="text-decoration: none;">
							<button type="button" class="btn btn-outline-danger"><i class="fa-solid fa-trash-can" style="width: 20px;"></i></button>
						</a>
						
					</td>
				</tr>
			</c:forEach>
		</tbody>
	  </table>
	<div style="text-align: center; padding-top: 50px;">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

			<c:choose>
				<c:when test="${page.number !=  pageNumber-1}">
				<a href="${contextRoot}/tofu/order/findAll?p=${pageNumber}" style="text-decoration: none;" class="linker"><span style="color: black;">${pageNumber}</span></a>
				</c:when>
				<c:otherwise><span style="background-color: black; color: aliceblue;" class="linker">${pageNumber}</span></c:otherwise>
			</c:choose>

		</c:forEach>
	</div>
</div>
	
	<script>
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


	</script>
	
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>