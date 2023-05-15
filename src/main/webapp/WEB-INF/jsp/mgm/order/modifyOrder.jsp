<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  .borders{
	border: black dashed 2px;
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
			
			
			
			
			
			
	
	
	<h1 style="text-align: center; margin-top: 50px;">訂單資料修改</h1>
	
	<div style="margin: auto; width: 800px;margin-top: 50px;" class="borders">
        <h5 style="text-align: center;">訂單資訊</h5>
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
				<label for="">訂單狀態：</label>
				<select name="status">
					<option value="">訂單狀態</option>
					<option value="${order.order_status}" selected>${order.order_status}</option>
					<option value="訂單完成">訂單完成</option>
					<option value="訂單取消">訂單取消</option>
					<option value="正在處理">正在處理</option>
				</select>
			</div>
			<div class="group">
				<label for="">出貨地址：</label>
				<input type="text" name="address" value="${order.ship_address}" style="width: 350px;">
			</div>

				<input type="text" name="id" value="${order.id}" hidden>

			<div style="text-align: center;">
				<button type="submit" class="btn btn-outline-primary">確認修改</button>
			</div>
		</form>
    </div>

    <div style="margin: auto; width: 800px;margin-top: 50px;" class="borders" >
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
	
	
	
	
	
	
	
	
	
		</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>