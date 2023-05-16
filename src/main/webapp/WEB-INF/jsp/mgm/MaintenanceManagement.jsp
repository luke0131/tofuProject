<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8" />
<title>豆腐車業管理平台-會員管理</title>
<script type="text/javascript"
	src="${contextRoot}/js/pages/dashboard.js"></script>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/mgmHeader.jsp" />
	
	
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/layout/mgmNavbar.jsp" />
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<h2>維修保養管理</h2>
			<table class="table">
  <thead>
    <tr>
      <th scope="col">Serial number</th>
      <th scope="col">維修保養種類</th>
      <th scope="col">備註</th>
      <th scope="col">日期</th>
      <th scope="col">時段</th>
      <th scope="col">訂單編號</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${page.content}" var="main">
    <tr>
      <td>${main.mid}</td>
      <td>${main.mcategory}&nbsp;${main.inspection}&nbsp;${main.electric}</td>
      <td>${main.notes}</td>
      <td>${main.appointment}</td>
      <td>${main.appointmenttime}</td>
      <td>${main.keycode}</td>
      <td>
      <div class="edit=place" >
      <form action="${contextRoot}/maintenance/update" >
      <input type="hidden" name="mid"value="${main.mid}"/>
      <input type="submit" class="btn btn-outline-info" value="修改"/>
      </form>
      </div>
      </td>
      <td>
      <form action="${contextRoot}/maintenance/delete" method="post">
      <input type="hidden" name="mid" value="${main.mid}"/>
      <input type="hidden" name="_method" value="delete"/>
      <input type="submit" class="btn btn-outline-danger" value="刪除"/>
      </form>
      </td>
    </tr>
   
    </c:forEach>
    
  </tbody>
  
</table>

 
<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
<c:choose>
<c:when test="${page.number!= pageNumber-1}">
 <a href="${contextRoot}/mgm/MaintenanceManagement?m=${pageNumber}" >${pageNumber}</a>
</c:when>
<c:otherwise>
${pageNumber}
</c:otherwise>
</c:choose>
   
    </c:forEach>
				
				
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
</body>
</html>