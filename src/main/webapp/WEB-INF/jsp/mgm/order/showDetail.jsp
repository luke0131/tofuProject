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

	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/mgmHeader.jsp" />
	
	
	<div class="container-fluid">
	<div class="row">
		<jsp:include page="/WEB-INF/jsp/layout/mgmNavbar.jsp" />
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			


	<h1 style="text-align: center; margin-top: 50px;">詳細訂單資料</h1>
	
	
	
	<div style="margin: auto; width: 800px;border: black dashed 2px; margin-top: 50px;">
        <h5 style="text-align: center;">訂單資訊</h5>
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
            <label for="">訂單狀態：</label>
            <span>${order.order_status}</span>
        </div>
        <div class="group">
            <label for="">出貨地址：</label>
            <span>${order.ship_address}</span>
        </div>
    </div>

    <div style="margin: auto; width: 800px;border: black dashed 2px;margin-top: 50px;">
        <h5 style="text-align: center;">訂購人資料</h5>
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



            <!-- this column for product car only begin-->
            <tr>
                <th scope="row">1</th>
                <td>${product.productModel}</td>
                <td class="qty">1</td>
                <td class="price">${product.productPrice}</td>
            </tr>
            <!-- this column for product car only end-->


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
	
	
	
	
		</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>