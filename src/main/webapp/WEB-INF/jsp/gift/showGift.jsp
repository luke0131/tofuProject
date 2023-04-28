<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 
<jsp:include page="../layout/navbar.jsp"/>






<h1>Hi Gift Page</h1>

<div>${gift.gift_id}</div>
<div>${gift.name}</div>
<div>${gift.price}</div>









<jsp:include page="../layout/footer.jsp"/>
</body>
</html>