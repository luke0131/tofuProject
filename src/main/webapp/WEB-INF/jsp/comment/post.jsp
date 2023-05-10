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
<meta charset="UTF-8" />
<title>Post論壇文章</title>
<link rel="stylesheet" href="${contextRoot}/css/postAndComment/post.css">	
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="align-center">
		<div class="content">			
			<h1 >歡樂豆腐討論區</h1>
			
            <div class="addArticle">
                <a href="${contextRoot}/showPost/add"><input type="button" value="發表文章"></a>
            </div>
					

					<div class="content">
						<dl class="thread-list">
							<dt>
								<ul class="field-list">
									<li class="title">標題</li>
									<li class="hot">人氣</li>
									<li class="author">作者</li>
									<li class="respond">發佈時間</li>
							  	</ul>
							</dt>
              <c:forEach var="post" items="${page.content}">
							<dd>
								<ul class="field-list normal">
								  <li class="title">
							      <div class="vam">
								      <h3>
                      <a href="${contextRoot}/comment/${post.post_id}" class="title text-wrap"  title="標題" data-title="標題" style="text-decoration: none;">${post.title}</a>
                    </h3>
                    </div>
                  </li>
                  <li class="hot">
                      <span class="num">${post.hot}</span>
                  </li> 
                  <li class="author">
                    <a href="#" title="authorName" target="_blank" style="text-decoration: none;">${post.authorName}</a>
                  </li>
                  <li class="added">
                   <span style="text-decoration: none" ><fmt:formatDate value="${post.added}"
								pattern="yyyy-MM-dd HH:mm EEEE" /></span>
                </li> 
                </ul> 
              </dd>    
                </c:forEach>  
						</dl>							
					</div>


					

          <div class="pagelink">  
					  <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					    <c:choose>
						    <c:when test="${page.number !=  pageNumber-1}">
							    <a href="${contextRoot}/showPost?p=${pageNumber}" style="text-decoration: none;">${pageNumber}</a>
						    </c:when>
						  <c:otherwise>
                <span>${pageNumber}</span>
              </c:otherwise>
					  </c:choose>
          </c:forEach>  
					
          </div>
			
		</div>
	</div>
<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
 

    
</body>

</html>
<!--<span><fmt:formatDate value="${post.added}" pattern="yyyy-MM-dd a HH:mm:ss EEEE" /></span>-->
