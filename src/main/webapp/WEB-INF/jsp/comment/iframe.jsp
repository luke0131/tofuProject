<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>





<html style="display: block;">
<head style="display: none;">
<meta charset="UTF-8">
<link style="display: none;" type="text/css" rel="stylesheet"
	href="https://i2.bahamut.com.tw/css/editor/baharte_editor.css?_=2">
<link style="display: none;" type="text/css" rel="stylesheet"
	href="https://i2.bahamut.com.tw/css/editor/forum_editor.css?_=4">
	<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<title>新增文章內容及標題</title>
</head>
<body class="editstyle">
	<textarea name="source" id="source" class="form-control main-editor" style="display: none;"></textarea>
</body>
</html>