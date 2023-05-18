<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/album/">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>
<title>Tofucars All Product</title>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<article class="py-5 text-center container">
		<div class="row">
			<div class="col-lg-8 col-md-5 mx-auto">
				
				<h2 class="cmp-modelfilter__title">所有車款</h2><br/>
				<h4 class="fw-light">篩選條件</h4>
				
				<hr>
				
				<form id="productSelect">
					<div class="lead text-muted">
						
						<h5>廠牌</h5>
						
						<input class="form-check-input" type="radio" name="brand" value="Toyota" id="Toyota"> 
						<label class="form-check-label" for="Toyota"> Toyota </label> 
							
						<input class="form-check-input" type="radio" name="brand" value="Honda" id="Honda"> 
						<label class="form-check-label" for="Honda"> Honda </label>
							 
						<input class="form-check-input" type="radio" name="brand" value="Nissan" id="Nissan"> 
						<label class="form-check-label" for="Nissan"> Nissan </label>
							 
						<input class="form-check-input" type="radio" name="brand" value="Mercedes-Benz" id="Mercedes-Benz"> 
						<label class="form-check-label" for="Mercedes-Benz"> Mercedes-Benz </label>
						
						<br/>
							 
						<input class="form-check-input" type="radio" name="brand" value="BMW" id="BMW">
						<label class="form-check-label" for="BMW"> BMW </label>	
																 
						<input class="form-check-input" type="radio" name="brand" value="Mitsubishi" id="Mitsubishi">
						<label class="form-check-label" for="Mitsubishi"> Mitsubishi </label>
							 
						<input class="form-check-input" type="radio" name="brand" value="Mazda" id="Mazda"> 
						<label class="form-check-label" for="Mazda"> Mazda </label>
							 
						<input class="form-check-input" type="radio" name="brand" value="Lexus" id="Lexus"> 
						<label class="form-check-label" for="Lexus"> Lexus </label>
						
						<br/>	 
						
						<input class="form-check-input" type="radio" name="brand" value="Audi" id="Audi">
						<label class="form-check-label" for="Audi"> Audi </label>
							 
						<input class="form-check-input" type="radio" name="brand" value="Porsche" id="Porsche">
						<label class="form-check-label" for="Porsche"> Porsche </label>
							 
						<input class="form-check-input" type="radio" name="brand" value="Ferrari" id="Ferrari">
						<label class="form-check-label" for="Ferrari"> Ferrari </label>
							 
						<input class="form-check-input" type="radio" name="brand" value="Volvo" id="Volvo">
						<label class="form-check-label" for="Volvo"> Volvo </label>
							
						<input class="form-check-input" type="radio" name="brand" value="Mini" id="Mini">
						<label class="form-check-label" for="Mini"> Mini </label>
						
					</div>
					
					<hr>
					
					<div class="lead text-muted">
					
						<h5>類型</h5>
						<input class="form-check-input" type="radio" name="category" value="sedan" id="轎車">
						<label class="form-check-label" for="轎車"> 轎車 </label> 
							
						<input class="form-check-input" type="radio" name="category" value="suv" id="休旅車">
						<label class="form-check-label" for="休旅車"> 休旅車 </label> 
							
						<input class="form-check-input" type="radio" name="category" value="pickup" id="卡車">
						<label class="form-check-label" for="卡車"> 皮卡車 </label> 
							
						<input class="form-check-input" type="radio" name="category" value="sports" id="跑車">
						<label class="form-check-label" for="跑車"> 跑車 </label>						
					
					</div>
					
					<hr>
					
					<div class="lead text-muted">
					
						<h5>動力方式</h5>
						
						<input class="form-check-input" type="radio" name="engineType" value="Petrol" id="汽油">
						<label class="form-check-label" for="汽油"> 汽油 </label> 
							
						<input class="form-check-input" type="radio" name="engineType" value="Diesel" id="柴油">
						<label class="form-check-label" for="柴油"> 柴油 </label> 
							
						<input class="form-check-input" type="radio" name="engineType" value="Hybrid" id="油電混和">
						<label class="form-check-label" for="油電混和"> 油電混和 </label> 					
					</div>
					
					<hr>					
					
					<div>

						<button id="searchButton" type="button" class="btn btn-primary my-2">篩選</button> 
						<a href="${contextRoot}/product/all" class="btn btn-secondary my-2">清除篩選</a>
						
					</div>
				</form>
				
			</div>
		</div>
	</article>
	
	
	<div class="album py-5 bg-light">
		<div class="container">
			
			<div id="removeCars">
			<div class="lead text-muted"><h3>Toyota</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="0" end="6">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/toyotaDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Honda</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="7" end="13">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Nissan</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="14" end="19">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Mercedes-Benz</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="20" end="26">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>BMW</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="27" end="34">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/bmwDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Mitsubishi</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="35" end="37">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Mazda</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="38" end="43">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Lexus</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="44" end="49">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Audi</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="50" end="57">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Porsche</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="58" end="61">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Ferrari</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="62" end="64">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Volvo</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="65" end="67">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			<div class="lead text-muted"><h3>Mini</h3></div><br/>
			<div class="row row-cols-5 g-4">
				
				<c:forEach items="${productList}" var="pList" begin="68" end="69">
					<div class="col">
						<div class="card shadow-sm h-100">
							<div class="bd-placeholder-img card-img-top">
								<img src="../img/product/${pList.productModel}.jpg"
									class="card-img-top" alt="..." width="100%" height="180">
								<div class="card-body">
									<h5 class="card-title">${pList.productModel}</h5>
									<a href="${contextRoot}/product/productDetail" class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>			
					</div>
				</c:forEach>
				
			</div>
			
			<br/><hr><br/>
			
			</div>
			
			<div class="lead text-muted"><h3 id="resultTitle"></h3></div><br/>
			<div class="row row-cols-5 g-4" id="resultBody">			

				
				
			</div>
			
		</div>		
	</div>
	
	<script>
		$(document).ready(function () {
			// 查詢按鈕點擊事件
			$("#searchButton").click(function () {
				// 取得所有勾選的 checkbox 的值
				var select = $('#productSelect').serialize();

				let map = new Map()

				$('#productSelect').serialize().split("&").forEach(item => {

					let itemArray = item.split("=")

					if (map.has(itemArray[0])) {
						map.get(itemArray[0]).push(itemArray[1])
					} else {
						map.set(itemArray[0], [itemArray[1]])
					}
				})
				
				// 呼叫後端 API 進行篩選
				fetch("/tofu/product/all", {
					method: "POST",
					body: JSON.stringify(Object.fromEntries(map)),
					headers: {
						"Content-Type":"application/json"
					}
				}).then(rs => rs.json()).then(data => {
					$("#removeCars").remove();
					$("#resultTitle").empty();
					$("#resultBody").empty();
					$("#resultTitle").append("篩選結果");
					console.log(data);
					console.log(data.datatable);
					console.log(data.datatable.length);
					var dataTotal = data.datatable ;
					
					for(var i = 0 ; i < data.datatable.length ; i++){
						console.log(dataTotal[i].productModel);
						$("#resultBody").append('<div class="col">'+'<div class="card shadow-sm h-100">'+
								'<div class="bd-placeholder-img card-img-top">'+
								'<img src="../img/product/'+dataTotal[i].productModel+'.jpg" class="card-img-top" alt="..." width="100%" height="180">'+
								'<div class="card-body">'+'<h5 class="card-title">'+dataTotal[i].productModel+'</h5>'+
								'<a href="${contextRoot}/product/toyotaDetail" class="btn btn-sm btn-outline-secondary">View</a>'+
								'</div>'+'</div>'+'</div>'+'</div>'					
						)
					}
				})

			});
		});
	</script>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>

</html>