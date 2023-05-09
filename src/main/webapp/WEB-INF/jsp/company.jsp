<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8">
<title>關於我們-公司簡介</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />

	<jsp:include page="layout/navbar.jsp" />

	<p style="margin-top: 20px; font-weight: bold ; margin-left:10px ; background-color:black ; color:white ; width:180px ; text-align:center" class="fs-1">歷史沿革</p>
	<ul style="margin-left:10px">
		<li style="margin-top: 20px; font-size: 20px" class="fw-bold" >豆腐車業成立於2023年，為藤原拓海轉投資的唯一經銷代理商。</li>
		<li style="margin-top: 20px; font-size: 20px" class="fw-bold" >完善的會員系統，即時查詢各項服務，立即修改個人資料，成為您最給力的豆腐小幫手。</li>
		<li style="margin-top: 20px; font-size: 20px" class="fw-bold" >即時預約維修保養，讓您擁有各項專屬貼心服務。</li>
		<li style="margin-top: 20px; font-size: 20px" class="fw-bold" >專門販售各地區最熱銷的車款商品，希望能吸引不同車友來購買。</li>
		<li style="margin-top: 20px; font-size: 20px" class="fw-bold" >員工管理部分則擁有任務系統、打卡系統以及請假系統，除了能讓員工業績強強滾之外，也讓管理者提高效率，事半功倍。</li>
		<li style="margin-top: 20px; font-size: 20px" class="fw-bold" >處理顧客問題及傾聽顧客聲音是我們應該做的，專門設立論壇及留言功能，擁有最完善的售後服務。</li>
	</ul>
	<hr class="my-4">
	<p style="margin-top: 20px; font-weight: bold ; margin-left:10px ; background-color:black ; color:white ; width:180px ; text-align:center" class="fs-1">專利技術</p>
	<img src="${contextRoot}/img/lesson/mssql.jpg" style="width:200px ; height:200px ; margin-left:35px" />
	<img src="${contextRoot}/img/lesson/Java.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/github.jpg" style="width:350px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/jdbc.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/htmlcssjs.jpg" style="width:350px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/jquery.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/servletjsp.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/hibernate.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/spring.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/springmvc.jpg" style="width:350px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/springboot.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/restful.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/ajax.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/javamlweka.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/azure.jpg" style="width:300px ; height:250px"/>
	<img src="${contextRoot}/img/lesson/chatgpt.jpg" style="width:300px ; height:250px"/>
	

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />

	<jsp:include page="layout/footer.jsp" />
</body>
</html>