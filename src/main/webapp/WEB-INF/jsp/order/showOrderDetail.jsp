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
					<hr class="mt-1" />
				</div>
	  

	  
					<div class="row mt-3 mx-4">
						<div class="col-12">
							<label class="order-form-label">ORD0000</label>
						</div>
						<div class="col-12">
							<div class="form-outline">
								<input type="text" id="form3" class="form-control order-form-input" value="China" readonly="readonly"/>
							</div>
						</div>
					</div>
	  
					<div class="row mt-3 mx-4">
						<div class="col-12">
							<label class="order-form-label">Another type of thing you want to order</label>
						</div>
						<div class="col-12">
							<div class="form-outline">
								<input type="text" id="form4" class="form-control order-form-input" />
							</div>
						</div>
					</div>
	  

	  
					<div class="row mt-3 mx-4">
						<div class="col-12">
							<label class="order-form-label">Adress</label>
						</div>
						<div class="col-12">
							<div class="form-outline">
								<input type="text" id="form5" class="form-control order-form-input" />
								<label class="form-label" for="form5">Street Address</label>
							</div>
						</div>
						<div class="col-12 mt-2">
							<div class="form-outline">
								<input type="text" id="form6" class="form-control order-form-input" />
								<label class="form-label" for="form6">Street Address Line 2</label>
							</div>
						</div>
						<div class="col-sm-6 mt-2 pe-sm-2">
							<div class="form-outline">
								<input type="text" id="form7" class="form-control order-form-input" />
								<label class="form-label" for="form7">City</label>
							</div>
						</div>
						<div class="col-sm-6 mt-2 ps-sm-0">
							<div class="form-outline">
								<input type="text" id="form8" class="form-control order-form-input" />
								<label class="form-label" for="form8">Region</label>
							</div>
						</div>
						

	  
					<div class="row mt-3 mx-4">
						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
								<label class="form-check-label" for="flexCheckDefault">I know what I need to know</label>
							</div>
						</div>
					</div>
	  
					<div class="row mt-3">
						<div class="col-12">
							<button type="button" id="btnSubmit" class="btn btn-primary d-block mx-auto btn-submit">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	  </section>
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>