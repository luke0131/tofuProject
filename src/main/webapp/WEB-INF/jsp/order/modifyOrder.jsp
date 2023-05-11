<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  .borders{
	border: black dashed 2px;
  }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="../layout/navbar.jsp" />
	
	
	<h1 style="text-align: center;">詳細訂單資料</h1>
	
	<div style="margin: auto; width: 800px;" class="borders">
        <h5>訂單資訊</h5>
        <div class="group">
            <label for="">訂單編號：</label>
            <span>ORD0000${order.id}</span>
        </div>
        <div class="group">
            <label for="">訂單日期： </label>
            <span>${order.order_date}</span>
        </div>
		<form action="http://localhost:8080/tofu/order/updateOrder" method="get">
			<div class="group">
				<label for="">付款狀態：</label>
				<select name="payment">
					<option value="">付款狀態</option>
					<option value="${order.payment}" selected>${order.payment}</option>
					<option value="已付款">已付款</option>
					<option value="未付款">未付款</option>
				</select>
			</div>
			<div class="group">
				<label for="">出貨狀態：</label>
				<select name="shipment">
					<option value="">出貨狀態</option>
					<option value="${order.ship_status}" selected>${order.ship_status}</option>
					<option value="運送中">運送中</option>
					<option value="已送達">已送達</option>
					<option value="未出貨">未出貨</option>
				</select>
			</div>
			<div class="group">
				<label for="">出貨地址：</label>
				<input type="text" name="address" value="${order.ship_address}" style="width: 350px;">
			</div>

				<input type="text" name="id" value="${order.id}" hidden>

			<div style="margin:auto;">
				<button type="submit" class="btn btn-outline-primary">確認修改</button>
			</div>
		</form>
    </div>

    <div style="margin: auto; width: 800px;margin-top: 50px;" class="borders" >
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
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>