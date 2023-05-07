<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon" type="image/x-icon" />
<meta charset="UTF-8">
<title>豆腐車業股份有限公司</title>

</head>
<body>

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 
<jsp:include page="layout/navbar.jsp"/>

    <!-- 製作廣告牆 -->
    <div class="cargallery">
      <img src="${contextRoot}/img/indexPicture/car1.jpg" class="image" />
      <img src="${contextRoot}/img/indexPicture/car2.jpg" class="image" />
      <img src="${contextRoot}/img/indexPicture/car3.jpg" class="image" />
      <img src="${contextRoot}/img/indexPicture/car4.jpg" class="image" />
      <img src="${contextRoot}/img/indexPicture/car5.jpg" class="image" />
    </div>
    <h1 class="text-secondary" style="text-align:center ; margin-top:35px; margin-bottom:30px; font-weight:bold;  letter-spacing: 10px;"  >疾如風快如電</h1>
    
    <!-- 嵌入影片 -->
    <iframe
      class="iframe"
      width="560"
      height="315"
      src="https://www.youtube.com/embed/2ye1R5k-lGU"
      title="YouTube video player"
      frameborder="0"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
      allowfullscreen
    ></iframe>
    
    <!-- 製作首頁商品展示部分 -->
    <h1 class="text-secondary" style="text-align:center ; margin-top:50px; margin-bottom:30px; font-weight:bold;  letter-spacing: 10px;"  >平凡成就不平凡</h1>
	<div class="row row-cols-1 row-cols-md-2 g-4" style="margin:0px">
	  <div class="col">
	    <div class="card">
	     <img src="${contextRoot}/img/indexPicture/bmw.jpg" />
	      <div class="card-body">
	        <h3 class="card-title text-center fw-bold">無與倫比的美麗</h3>
	        <p class="card-text text-center fs-5">品質卓越、精工細作，您值得擁有!</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card">
	      <img src="${contextRoot}/img/indexPicture/audi.jpg" />
	      <div class="card-body">
	        <h3 class="card-title text-center fw-bold">精益求精的技術</h3>
	        <p class="card-text text-center fs-5">科技領先、智能驅動，引領時尚!</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card">
	      <img src="${contextRoot}/img/indexPicture/benz.jpg" />
	      <div class="card-body">
	        <h3 class="card-title text-center fw-bold">精工細作的觸感</h3>
	        <p class="card-text text-center fs-5">品質卓越、細節入微，為您量身打造!</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card">
	      <img src="${contextRoot}/img/indexPicture/carroad.jpg" />
	      <div class="card-body">
	        <h3 class="card-title text-center fw-bold">壯麗雄偉的風景</h3>
	        <p class="card-text text-center fs-5">全球化視野，經典傳承，歷久彌新!</p>
	      </div>
	    </div>
	  </div>
	</div>
    
   

    <!-- 製作回到頂端的TOP-->
    <a href="#top" class="top">Top</a> 

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 
<jsp:include page="layout/footer.jsp"/>
</body>
</html>