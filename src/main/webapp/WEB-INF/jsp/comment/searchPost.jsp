<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon"
	type="image/x-icon" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>發文頁面管理</title>
<link rel="stylesheet" href="${contextRoot}/css/postAndComment/post.css">

<style>
/* 製作top */
.top {
	position: fixed;
	right: 10px;
	bottom: 10px;
	width: 50px;
	height: 50px;
	text-align: center;
	background-color: black;
	border: 2px solid white;
	line-height: 46px;
	border-radius: 50%;
	/* border: 3px solid red; */
	text-decoration: none;
	color: white;
	/* font-weight: bold; */
	font-size: 18px;
}

.top:hover {
	color: Tomato;
}
/* 卷軸移動效果 */
* {
	scroll-behavior: smooth;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="align-center">
		<div class="content">
			<h1>歡樂豆腐討論區</h1>
			<h2 class="title" style="margin: auto">您已發布的文章</h2>
			<div class="content">
				<!-- 				<dl class="thread-list"> -->
				<!-- 					<dt> -->
				<!-- 						<ul class="field-list" > -->
				<!-- 							<li class="title" style="margin:auto">您已發布的文章</li> -->

				<!-- 																<li class="respond">發佈時間</li> -->
				<!-- 						</ul> -->
				<!-- 					</dt> -->

				<c:forEach var="post" items="${page.content}">

					<div class="d-flex justify-content-center">
						<ul class="field-list normal" style="margin:auto">
							<li class="title" id="myTitle">
								<div class="vam">
									<h3>
										<a href="${contextRoot}/comment/${post.post_id}"
											class="title text-wrap" title="標題" data-title="標題"
											style="text-decoration: none;">${post.title}</a>
									</h3>
								</div>
<!-- 								<div class="edit-place" style="display: flex"> -->
								<div class="edit-place">
									<form action="${contextRoot}/searchPost/edit">
										<input type="hidden" name="post_id" value="${post.post_id}" />

										<input type="submit" class="btn btn-outline-success btn-sm"
											value="編輯" />
									</form>

									<form action="${contextRoot}/searchPost/delete" method="post">
										<input type="hidden" name="post_id" value="${post.post_id}" />
										<input type="hidden" name="_method" value="delete" /> <input
											type="submit" class="btn btn-outline-danger btn-sm"
											value="刪除" />
									</form>

								</div>
							</li>

							<!--                   <li class="added"> -->
							<%--                    <span style="text-decoration: none;" ><fmt:formatDate value="${post.added}" --%>
							<%-- 								pattern="yyyy-MM-dd HH:mm EEEE" /></span> --%>
							<!--                 </li>  -->
						</ul>
					</div>

				</c:forEach>
				<!-- 				</dl> -->
			</div>




			<div class="pagelink">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<c:choose>
						<c:when test="${page.number !=  pageNumber-1}">
							<a href="${contextRoot}/searchPost?p=${pageNumber}"
								style="text-decoration: none;">${pageNumber}</a>
						</c:when>
						<c:otherwise>
							<span>${pageNumber}</span>
						</c:otherwise>
					</c:choose>
				</c:forEach>

			</div>

		</div>
	</div>

	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>
</html>