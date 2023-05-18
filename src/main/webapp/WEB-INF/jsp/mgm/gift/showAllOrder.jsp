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
				<h1 style="text-align: center; margin-top: 50px;">禮物管理頁面</h1>






	
	
					<div class="container h-100 py-5" style="width: 1000px;">
					  <div class="row d-flex justify-content-center align-items-center h-100">
						<div class="col">
				  
						  <div class="table-responsive">
							<table class="table">
							  <thead>
								<tr>
								  <th scope="col" class="h5">ID</th>
								  <th scope="col">圖片</th>
								  <th scope="col">產品名稱</th>
								  <th scope="col">價錢</th>
								  <!-- <th scope="col">商品修改</th> -->
								  <th scope="col">商品上架</th>
								</tr>
							  </thead>
							  <tbody>
							  
								<c:forEach items="${page.content}" var="gList">
								<tr>
									<td class="align-middle">
										<p class="mb-0" style="font-weight: 500;">${gList.id}</p>
									</td>
									<td scope="row">
										<div class="d-flex align-items-center">
											<img src="http://localhost:8080/tofu/showGift/${gList.id}" class="img-fluid rounded-3"
											style="width: 120px; height: 100px;" alt="Book">
											
										</div>
										<td class="align-middle">
											  <p class="mb-0" style="font-weight: 500;">${gList.name}</p>
										</td>
									</td>

								  <td class="align-middle">
										<p class="mb-0 price" style="font-weight: 500;">${gList.price}</p>
								  </td>
	
								   <!-- <td class="align-middle">
										<p class="mb-0" style="font-weight: 500;">
										<a href="http://localhost:8080/tofu/remove?id=${gList.id}">
										<button class="btn btn-warning">修改</button>
										</a>
									</p>
								  </td> -->
								  <td class="align-middle">
										<a href="http://localhost:8080/tofu/gift/isEnable?id=${gList.id}">
										<button class="btn btn-primary isEnable">${gList.enabled}</button>
										</a>
										<!-- <button class="btn btn-dark isEnable" onclick="isEnable(${gList.id})">上架</button> -->
							  		</td>
								</tr>
							 </c:forEach>   
							 
				  
				  
				  
				  
				  
				  
				  
							  </tbody>
							</table>
							

							<div style="text-align: center; padding-top: 50px;">
								<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
								
									  <c:choose>
										<c:when test="${page.number !=  pageNumber-1}">
										<a href="${contextRoot}/gift/findGifts?p=${pageNumber}" style="text-decoration: none;"  class="linker"><span style="color: black;">${pageNumber}</span></a>
										</c:when>
										  <c:otherwise><span style="background-color: black; color: aliceblue;" class="linker">${pageNumber}</span></c:otherwise>
									</c:choose>
								
								</c:forEach>
								</div>

								<div style="margin-top: 50px;"></div>











							
						  </div>
				  
						</div>
					  </div>
					</div>
				  
				  
					
	
	<script>


	




	// function isEnable(id) {
	// 	console.log("id = "+id);
	// 	axios.get("http://localhost:8080/tofu/gift/isEnable?p="+id).then(function(response) {
	// 		// console.log("response",response);
	// 		console.log("response",response);
	// 		let id = response.data.id;
	// 		let isTrue = response.data.enabled;
	// 		let index = id-1;
	// 		console.log(id);
	// 		console.log(isTrue);
	// 		console.log($('.${id}'));
			

	// 		if(isTrue!=true){
	// 			$('.isEnable')[index].classList.remove("btn-dark");		
	// 			$('.isEnable')[index].classList.add("btn-outline-dark");				
	// 		}else{
	// 			$('.isEnable')[index].classList.remove("btn-outline-dark");		
	// 			$('.isEnable')[index].classList.add("btn-dark");		
	// 			// $('.isEnable')[index].style.backgroundColor="blue";
	// 			// $('.isEnable')[index].style.borderColor="blue";
	// 		}
		



	// 	}).catch(function(){

	// 	}).finally(function(){
			
	// 	});
	// };


	console.log($('.isEnable').length);




		for (let i = 0; i < $('.isEnable').length; i++) {
			var str = $('.isEnable')[i].innerText;
			console.log(str);

			if(str == "false"){
			$('.isEnable')[i].style.backgroundColor="white";
			$('.isEnable')[i].style.color="black";
			$('.isEnable')[i].innerText="下架";
			}else{
				$('.isEnable')[i].innerText="上架";
			}
		}



	</script>
	
			
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>