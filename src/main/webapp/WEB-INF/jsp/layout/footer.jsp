<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tofucars Company</title>
</head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<body>
<div class="bg-dark" style="margin-top:20px">
<div class="container">
  <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-6 py-3 my-0 border-top">
    <div class="col mb-3">
      <p class="text-white py-4">&copy; 2023 Tofucars</p>
    </div>
   

    <div class="col mb-3">
      <h5 class="text-white fw-bold py-4">關於我們</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="${contextRoot}/company" class="nav-link p-0 text-white">公司簡介</a></li>
        <li class="nav-item mb-2"><a href="${contextRoot}/about" class="nav-link p-0 text-white">成員介紹</a></li>
      </ul>
    </div>

    <div class="col mb-3">
      <h5 class="text-white fw-bold py-4">商品展示</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="${contextRoot}/product/all" class="nav-link p-0 text-white">所有商品</a></li>
      </ul>
    </div>

    <div class="col mb-3">
      <h5 class="text-white fw-bold py-4">豆腐論壇</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="${contextRoot}/post" class="nav-link p-0 text-white">豆腐討論區</a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">聯絡我們</a></li>

      </ul>
    </div>
    <div class="col mb-3">
      <h5 class="text-white fw-bold py-4">客戶服務</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">維修保養</a></li>
      </ul>
       
    </div>
    	<div class="col mb-3">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.0046035395753!2d121.54083797602232!3d25.033917838293597!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd379a5ec97%3A0xedc006d25a9e35df!2z6LOH5bGV5ZyL6Zqb6IKh5Lu95pyJ6ZmQ5YWs5Y-4!5e0!3m2!1szh-TW!2stw!4v1681716331015!5m2!1szh-TW!2stw" 
		width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div> 
  </footer>
</div>
</div>
</body>
</html>