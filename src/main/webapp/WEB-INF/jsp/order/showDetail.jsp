<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.group {
	clear: left;
	width: 650px;
	border-bottom: 2px dashed gray;
	padding-bottom: 10px;
	margin: 10px;
  }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="../layout/navbar.jsp" />
	
	<div style="margin: auto; width: 800px;border: black dashed 2px;">
        <h5>訂單資訊</h5>
        <div class="group">
            <label for="">訂單編號：</label>
            <span>ORD0000${order.id}</span>
        </div>
        <div class="group">
            <label for="">訂單日期： </label>
            <span>${order.order_date}</span>
        </div>
        <div class="group">
            <label for="">付款狀態：</label>
            <span>${order.payment}</span>
        </div>
        <div class="group">
            <label for="">出貨狀態：</label>
            <span>${order.ship_status}</span>
        </div>
        <div class="group">
            <label for="">出貨地址：</label>
            <span>${order.ship_address}</span>
        </div>
    </div>

    <div style="margin: auto; width: 800px;border: black dashed 2px;margin-top: 50px;">
        <h5>訂購人資料</h5>
        <div class="group">
            <label for="">姓名：</label>
            <span>${customer.name}</span>
        </div>
        <div class="group">
            <label for="">電話： </label>
            <span>${customer.phone}</span>
        </div>
        <div class="group">
            <label for="">信箱：</label>
            <span>${customer.email}</span>
        </div>
        <div class="group">
            <label for="">地址：</label>
            <span>${customer.address}</span>
        </div>

        
    </div>

	
	
    
    <table class="table table-striped" style="width: 800px;margin: auto;margin-top: 50px;border: black dashed 2px;">
        <thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">商品</th>
				<th scope="col">數量</th>
				<th scope="col">價錢</th>
			</tr>
        </thead>
        <tbody>
			<c:forEach items="${orderDetails}" var="details">
				<tr>
					<th scope="row">1</th>
					<td>${details.name}</td>
					<td class="qty">${details.qty}</td>
					<td class="price">${details.price}</td>
				</tr>
			</c:forEach>
			<tr>
				<th scope="row">總共:</th>
				<td> </td>
				<td></td>
				<td class="total">123</td>
			</tr>
        </tbody>
      </table>
	
	<script>
	let total = 0;
	$('.price').each(function(){
		let p = $(this).closest("tr").find('.price').text();
		let q = $(this).closest("tr").find('.qty').text();
		let sum = p*q;
		$(this).text(sum);

		total += Number($(this).text());
    });
	console.log(total);
	$('.total').text(total);



	</script>
	
	
	
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>