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
<style>
.title {
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
}
table {
	border: 1px solid black;
	border-collapse:collapse;
	margin: auto;
	text-align: center;
	width: 1500px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
}

table, td, th{
   	border: 1px solid black;
} 
.customerpic {
	width: 80px;
	height: 80px;
}
</style>
<body>

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 
<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>

<h1 class="title">修改會員資料</h1>
<table>
	<thead>
		<tr>
			<th>customer_id</th>
			<th>photo</th>
			<th>name</th>
			<th>account</th>
			<th>email</th>
			<th>phone</th>
			<th>address</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${customerList}" var="cList">
		<tr>
				<td>${cList.customer_id}</td>
				<td>
					<img src="${contextRoot}/downloadPhoto/${cList.customer_id}" class="customerpic" />
				</td>
				<td>${cList.name}</td>
				<td>${cList.account}</td>
				<td>${cList.email}</td>
				<td>${cList.phone}</td>
				<td>${cList.address}</td>
				<td>
					<button type="submit" value=update>修改</button>
				</td>
		</tr>
	</c:forEach>
	</tbody>
</table>


<!-- 製作回到頂端的TOP-->
    <a href="#top" class="top">Top</a> 

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
</body>
</html>