<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="../layout/navbar.jsp" />
	
	
	
	
	<section class="order-form m-4">
		<div class="container pt-4">
			<div class="row">
				<div class="col-12 px-4">
					<h1>You can see my Order Form</h1>
					<span>with some explanation below</span>
					<hr class="mt-1" />
				</div>
	  
				<div class="col-8">
					<div class="row mx-4">
						<div class="col-8">
							<label class="form-label" for="form1">Order Number</label>
							<input type="text" id="form1" class="form-control order-form-input" />
						</div>
						<div class="col-8">
							<label class="form-label" for="form1">Order Number</label>
							<input type="text" id="form1" class="form-control order-form-input" />
						</div>
						<div class="col-8">
							<label class="form-label" for="form1">Order Number</label>
							<input type="text" id="form1" class="form-control order-form-input" />
						</div>
						<div class="col-8">
							<label class="form-label" for="form1">Order Number</label>
							<input type="text" id="form1" class="form-control order-form-input" />
						</div>
						<div class="col-8">
							<label class="form-label" for="form1">xxxxxxxxxxx Number</label>
							<input type="text" id="form1" class="form-control order-form-input" />
						</div>
						<div class="col-sm-8  mt-2">
							<select class="form-select" aria-label="Default select example">
								<option value="1">已付款</option>
								<option value="2">已付款</option>
							  </select>	  
						</div>
						<div>Payment</div>
						<div class="col-sm-8 mt-2">
							<select class="form-select" >
								<option value="1">未出貨</option>
								<option value="2">運送中</option>
								<option value="3">已送達</option>
							  </select>
							  
						</div>
						<div class="col-sm-8 mt-2">
							<select class="form-select" >
								<option value="1">未出貨</option>
								<option value="2">運送中</option>
								<option value="3">已送達</option>
							</select>
							  
						</div>
					</div>
					

					<form action="">
						<select class="form-select" >
							<option value="1">未出貨</option>
							<option value="2">運送中</option>
							<option value="3">已送達</option>
						</select>

						<select class="form-select" >
							<option value="1">待出貨</option>
							<option value="2">已出貨</option>
							<option value="3">已送達</option>
						</select>
					</form>
	  
					
				</div>
			</div>
		</div>
	  </section>
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>