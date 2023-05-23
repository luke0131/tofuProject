<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<meta charset="UTF-8" />
<title>豆腐車業管理平台-會員管理</title>
<style>
.search-input {
  width: 200px; /* 設定文字框的寬度 */
  height: 37px; /* 設定文字框的高度 */
  padding: 5px; /* 設定文字框內容的內距 */
  border: 1px solid #ccc; /* 設定文字框的邊框 */
  border-radius: 5px; /* 設定文字框的邊框圓角 */
  background-color: #fff; /* 設定文字框的背景顏色 */
  color: #000; /* 設定文字框的文字顏色 */
  /* 可根據需要添加其他樣式屬性 */
}
</style>
<script type="text/javascript"
	src="${contextRoot}/js/pages/dashboard.js"></script>
<script type="text/javascript" src="${contextRoot}/css/dashboard.css"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/mgmDependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/mgmHeader.jsp" />
	
	
	<div class="container-fluid" style="margin-bottom:170px">
		<div class="row">
			<jsp:include page="/WEB-INF/jsp/layout/mgmNavbar.jsp" />
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<h2>維修保養管理</h2>
			<table class="table">
			<div class="search-form">
			<form  action="${contextRoot}/maintenance/search" method="get">
    <input  type="text"  name="keycode" placeholder="請輸入訂單編號" class="search-input"/>
    <input type="submit" class="btn btn-outline-dark"  value="查詢" />
</form>
</div>
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
      <td>
      <fmt:formatDate value="${main.appointment}" pattern="yyyy-MM-dd" var="formattedDate" />
      ${formattedDate}</td>
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
      <form action="${contextRoot}/maintenance/delete" method="post" onsubmit="return confirmDelete()">
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
	
	<script>
    function confirmDelete() {
        // 使用 confirm 函式顯示確認對話框
        var confirmed = confirm("確定要刪除嗎？");

        // 如果使用者確定刪除，返回 true，執行刪除相關程式碼
        if (confirmed) {
            return true;
        }
        
        // 如果使用者取消刪除，返回 false，取消提交表單
        return false;
    }
</script>
	
	
	<jsp:include page="/WEB-INF/jsp/layout/mgmfooter.jsp" />
	
	<!--  -->
</body>
</html>