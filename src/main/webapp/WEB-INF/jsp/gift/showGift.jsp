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
.w{
  width: 1000px;
  margin: auto;
}
/* img{ */
/*   height: 250px; */
/* } */
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
	
	
	
	<h1>Hi Gift Page</h1>
	<a href="http://localhost:8080/tofu/showCart">
        <button class="btn btn-danger"><i class="fa-solid fa-cart-shopping" style="font-size:24px;"></i> cart</button>
    </a>
	

	<div class="row row-cols-1 row-cols-md-3 g-4 w" style="margin: auto;">

		<c:forEach items="${page.content}" var="gList">

			<div class="col">
				<div class="card" style="width: 18rem;">
				  <a href="${contextRoot}/">
				    <img src="${contextRoot}/tofu/showGift/${gList.id}" class="card-img-top" style="height: 250px;">
				  </a>
				  <div class="card-body">
				    <h5 class="card-title">${gList.name}</h5>
				    <p class="card-text"><span>$</span>${gList.price}</p>
				
				    <div>
				      <input type="button" value="ADD" onclick="addToCart(${gList.id})" class="btn btn-primary">
				    </div>
				
				  </div>
				</div>
			</div>



		</c:forEach>
	</div>

<div style="text-align: center; padding-top: 50px;">
<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

  	<c:choose>
    	<c:when test="${page.number !=  pageNumber-1}">
        <a href="${contextRoot}/tofu/showGift?p=${pageNumber}" style="text-decoration: none;"  class="linker"><span style="color: black;">${pageNumber}</span></a>
    	</c:when>
  		<c:otherwise><span style="background-color: black; color: aliceblue;" class="linker">${pageNumber}</span></c:otherwise>
	</c:choose>

</c:forEach>
</div>


<script>
	function addToCart(id){
		console.log("id = " + id);

		let requestBody = {
			"giftid":id,
			"qty":"1",
			"name":"MARY!!!!!!!!!"
		}
		axios.post("http://localhost:8080/tofu/add",requestBody).then(function(response){
			console.log("response",response);
			
		}).catch(function(error){
			console.log("error",error);
		}).finally();
	}

</script>



	<jsp:include page="../layout/footer.jsp" />
</body>
</html>