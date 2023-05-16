<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯頁面</title>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-10 col-md-6">
				<h1 class="text-center mt-3 mb-4">編輯文章</h1>
				<div class="card">
					<div class="card-header text-center">修改標題</div>
					<div class="card-body" style="margin:auto">
					
					
						<form action="${contextRoot}/searchPost/newEdit" method="post">
							<input type="hidden" name="post_id" value="${post.post_id}" /> 
							<input type="text" name="newPost" value="${post.title}"
								style="width: 500px; height: 100px; border-radius: 10px; text-align: center " />
							<!-- 其他表单字段 -->
							<input type="hidden" name="added" value="" />
						
							
							<br />
							
							<div style="margin-left:220px"><button type="submit" class="btn btn-outline-success mt-3" >送出</button></div>
						</form>




					</div>
				</div>


			</div>
		</div>
	</div>

</body>
</html>