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
			
			
			
			
			
			
	
	
	<h1 style="text-align: center; margin-top: 50px;">新增商品</h1>
	
	<div style="margin: auto; width: 800px;margin-top: 50px;" class="borders">
        <h5 style="text-align: center;"></h5>
		<div style="text-align: center;width: 500px;height: 300px;margin: auto;">
			<img src="http://localhost:8080/tofu/showGift/26" alt="" style="width: 100%;height: 100%;object-fit: cover;" id="imgShow">
		</div>

		<form action="http://localhost:8080/tofu/gift/upload" method="post" enctype="multipart/form-data">
			<div class="group">
				<label for="file">商品圖片： </label>
				<input type="file" id="imgFile" name="file">
			</div>
			<div class="group">
				<label for="">商品名稱： </label>
				<input type="text" name="name" value="" style="width: 350px;" required="required">
			</div>

			<div class="group">
				<label for="">商品描述：</label>
				<input type="text" name="desc" value="" style="width: 350px;">
			</div>

			<div class="group">
				<label for="">商品價錢：</label>
				<input type="text" name="price" value="" style="width: 350px;" required="required">
			</div>
			
			<div class="group">
				<label for="">商品分類：</label>
				<select name="type">
					<!-- <option value="">商品狀態</option> -->
					<option value="" selected></option>
					<option value="food">food</option>
					<option value="elec">elec</option>
					<option value="other">other</option>
				</select>
			</div>
				<input type="text" name="id" value="${gift.id}" hidden>

			<div style="text-align: center;padding-bottom: 10px;">
				<button type="submit" class="btn btn-outline-primary">確認新增</button>
			</div>
		</form>
    </div>


	
	
	
	<div style="margin-top: 50px;"></div>
	
	<script>

				imgFile.onchange = evt => {
				const [file] = imgFile.files
				if (file) {
					imgShow.src = URL.createObjectURL(file)
				}
				}





	</script>
	
	
	
		</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>