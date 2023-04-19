<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon" type="image/x-icon" />
<meta charset="UTF-8">
<title>Tofucars Company</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 

<jsp:include page="layout/navbar.jsp"/>

	  <div class="d-flex flex-row align-items-center">
      		<img style="margin-top:20px" src="${contextRoot}/img/indexPicture/company.jpg"/>

		<ul>
			<h1 style="margin-top:20px; font-weight:bold" >公司簡介</h1>
			<li style="margin-top:20px; font-size:20px">本公司成立於2023年，為藤原拓海轉投資的唯一經銷代理商。</li>
			<li style="margin-top:20px; font-size:20px">完善的會員系統，讓您能夠即時查詢專屬服務。</li>
			<li style="margin-top:20px; font-size:20px">專門販售各地區最熱銷的車款，希望能吸引不同車友來購買。</li>
			<li style="margin-top:20px; font-size:20px">員工管理部分則擁有任務系統、打卡系統以及請假系統，除了能讓員工業績強強滾之外，也讓管理者提高效率，事半功倍。</li>
			<li style="margin-top:20px; font-size:20px">處理顧客問題及傾聽顧客聲音是我們應該做的，設立客服系統，24小時服務不打烊。</li>
		</ul>
       </div>     
    <!-- 製作回到頂端的TOP-->
      <a href="#top" class="top">Top</a> 

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 

<jsp:include page="layout/footer.jsp"/>
</body>
</html>