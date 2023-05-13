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
				 <form id="orderForm" action="${contextRoot}/orderBy" >
				<select id="orderBySelect" name="orderBy" onchange="document.getElementById('orderForm').submit()">
          <!-- <option value="">請選擇排序方式</option>  -->
					<option value="0" ${sessionScope.orderBy == 0 ? 'selected' : ''}>時間近<span>&#x2192</span>遠</option>
    				<option value="1" ${sessionScope.orderBy == 1 ? 'selected' : ''}>時間遠<span>&#x2192</span>近</option>
    				<option value="2" ${sessionScope.orderBy == 2 ? 'selected' : ''}>人氣高<span>&#x2192</span>低</option>
    				<option value="3" ${sessionScope.orderBy == 3 ? 'selected' : ''}>人氣低<span>&#x2192</span>高</option>
				</select>
        <!--  <button>送出</button> -->
				</form>
            </div>
				<form id="searchForm" action="${contextRoot}/showPost" method="GET">
  					<input type="text" id="keywordInput" name="keyword" value="${keyword}" placeholder="輸入關鍵字">
  					<button type="submit" >搜索</button>
				</form>


					<div class="content">
						<dl class="thread-list">
							<dt>
								<ul class="field-list">
									<li class="title">標題</li>
									<li class="hot" id="dataList">人氣
									<li class="author">作者
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
                      <span class="num" style="color: red;">${post.hot}</span>
                  </li> 
                  <li class="author">
                    <a href="#" title="account" target="_blank" style="text-decoration: none;">${loggedInCustomer.account}</a>
                  </li>
                  <li class="added">
                   <span style="text-decoration: none;" ><fmt:formatDate value="${post.added}"
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function submitSearchForm() {
  // 獲取表單元素和關鍵字輸入框元素
  var form = document.getElementById("searchForm");
  var keywordInput = document.getElementById("keywordInput");

  // 獲取查詢關鍵字
  var keyword = keywordInput.value.trim();

  // 如果查詢關鍵字為空，直接返回
  if (keyword === "") {
    return;
  }

  // 更新表單的 action 屬性，將查詢關鍵字作為 URL 參數傳遞
  var action = form.getAttribute("action");
  var url = action + "?q=" + encodeURIComponent(keyword);
  form.setAttribute("action", url);

  // 提交表單
  form.submit();
}

// 定义全局变量sortOrder，默认值为desc
// var sortOrder = 'desc';

// // 当向上箭头被点击时
// $('.up-arrow').click(function() {
//   // 将排序顺序设置为asc
//   sortOrder = 'asc';
//   // 发送ajax请求
//   $.ajax({
//     url: 'showPost?sort=' + sortOrder,
//     success: function(data) {
//     	console.log(data);
//       // 用新帖子列表替换旧帖子列表
//       $('.hot .num').html(data);
//     }
//   });
// });

// // 当向下箭头被点击时
// $('.down-arrow').click(function() {
//   // 将排序顺序设置为desc
//   sortOrder = 'desc';
//   // 发送ajax请求
//   $.ajax({
//     url: 'showPost?sort=' + sortOrder,
//     success: function(data) {
//       // 用新帖子列表替换旧帖子列表
//       $('.hot .num').html(data);
//     }
//   });
// });



</script> 
    
</body>

</html>
<!--<span><fmt:formatDate value="${post.added}" pattern="yyyy-MM-dd a HH:mm:ss EEEE" /></span>-->
