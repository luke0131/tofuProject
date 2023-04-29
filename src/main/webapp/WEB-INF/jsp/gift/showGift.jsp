<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.w{
  width: 1000px;
  margin: auto;
}
img{
  height: 250px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="../layout/navbar.jsp" />
	
	
	
	<h1>Hi Gift Page</h1>
	
	
	
	<div class="row row-cols-1 row-cols-md-3 g-4 w">

		<c:forEach items="${page.content}" var="gList">

			<div class="col">
				<div class="card" style="width: 18rem;">
				  <a href="${contextRoot}/">
				    <img src="${contextRoot}/tofu/showGift/${gList.id}" class="card-img-top" alt="...">
				  </a>
				  <div class="card-body">
				    <h5 class="card-title">${gList.name}</h5>
				    <p class="card-text">${gList.price}</p>
				
				    <div>
				      <input type="button" value="ADD" onclick="addToCart(${gList.id})" class="btn btn-primary">
				    </div>
				
				  </div>
				</div>
			</div>



		</c:forEach>
	</div>


<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

  	<c:choose>
    	<c:when test="${page.number !=  pageNumber-1}">
        <a href="${contextRoot}/tofu/showGift?p=${pageNumber}">${pageNumber}</a>
    	</c:when>
  		<c:otherwise>${pageNumber}</c:otherwise>
	</c:choose>

</c:forEach>







	<jsp:include page="../layout/footer.jsp" />
</body>
</html>