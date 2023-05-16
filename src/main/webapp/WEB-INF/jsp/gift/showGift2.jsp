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
  width: 1200px;
  margin: auto;
}
.query{
	margin-top: 15px;
	margin-left: 20px;
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
	
	<a href="http://localhost:8080/tofu/showCart">
        <button class="btn btn-danger"><i class="fa-solid fa-cart-shopping" style="font-size:24px;"></i> cart</button>
    </a>
	
	<h1 style="text-align: center;">豆腐商城</h1>
	
	<form action="http://localhost:8080/tofu/showGift/findBySearch" method="get">
		<div class="input-group" style="width: 600px;margin: auto;">
			<input type="search" class="form-control rounded" name="search" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
			<button type="submit" class="btn btn-outline-primary">search</button>
		</div>
	</form>

	<form action="http://localhost:8080/tofu/showGift/findByOption" method="get" style="width: 600px; margin: auto; border: 2px black dashed; margin-top: 25px;">
		<div class="query">
			<span class="t1">分類：</span>
			<label><input type="checkbox" name="tool" value="tool" style="margin-left: 20px;">工具</label>
			<label><input type="checkbox" name="food" value="food" style="margin-left: 20px;">食物</label>
			<label><input type="checkbox" name="elec" value="elec" style="margin-left: 20px;">電子產品</label>
			<label><input type="checkbox" name="drink" value="drink" style="margin-left: 20px;">飲料</label>
			<label><input type="checkbox" name="outdoor" value="outdoor" style="margin-left: 20px;">戶外用具</label>
		</div>
		<div class="query">
			<label for="name">最小：</label>
			<input type="number" id="" name="min" value="" placeholder="請輸入金額" style="margin-left: 20px;">
			<label for="name" style="margin-left: 20px;">最大：</label>
			<input type="number" id="" name="max" value="" placeholder="請輸入金額" style="margin-left: 20px;">
		</div>
		<div class="query" style="text-align: center;padding-bottom: 20px;">
			<input type="submit" value="查詢" class="btn btn-dark"/>
			<input type="reset" value="清除" class="btn btn-dark"/>
		</div>




	</form>



	<div class="row row-cols-1 row-cols-md-3 g-4 w" style="margin: auto;">

		<c:forEach items="${gifts}" var="gList">

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

	<div style="margin-top: 100px;"></div>



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