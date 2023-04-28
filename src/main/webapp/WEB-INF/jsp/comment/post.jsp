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
<title>Tofucars Company</title>
<style>
	
html, body {
	font-family: Arial, Helvetica, sans-serif;
	}
.align-center {
    text-align: center;
}

div {
    display: block;
}

div.body-content > div.content {
    width: -moz-calc(100% - 205px);
    width: -webkit-calc(100% - 205px);
    width: -o-calc(100% - 205px);
    width: calc(100% - 205px);
    box-sizing: border-box;
    float: left;
}

a {
    text-decoration: none;
    color: #333;
}

a {
    background-color: transparent;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.clear {
    width: 0px !important;
    height: 0px !important;
    overflow: hidden !important;
    clear: both !important;
}
.navi-side .pagelink {
    float: right;
    margin: 3px 2px;
}
div.pagelink a, div.pagelink span {
    display: inline-block;
    zoom: 1;
    display: inline;
    margin: auto 2px;
    font-size: 16px;
    padding: 0px 8px;
    line-height: 28px;
    vertical-align: middle;
    text-align: center;
    border: 1px solid #dfdfdf;
    font-weight: bold;
    color: #585858;
}	
div.pagelink span {
    color: #f60;
}
dl {
    width: 100%;
    box-sizing: border-box;
    float: left;
    margin: 0px;
    padding: 0px;
    border: 1px solid black;
}
dl {
    margin-top: 0;
    margin-bottom: 20px;
}

dt {
    display: block;
    float: left;
    margin: 0px;
    padding: 0px;
    background-color: #fff;
    width: 100%;
    font-weight: 700;
}
dt, dd {
    line-height: 1.42857143;
}
dt ul.field-list {
    color: black;
    font-weight: bold;
    font-size: 15px;
    border-bottom: 1px solid black;
}
ul.field-list {
    float: left;
    margin: 0px;
    padding: 0px;
    width: 100%;
}
ul, li {
    list-style: none;
}
ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
dt ul.field-list li.title {
    text-align: center;
    line-height: 30px;
    position: relative;
}
ul.field-list li.title {
    width: -moz-calc(100% - 405px);
    width: -webkit-calc(100% - 405px);
    width: -o-calc(100% - 405px);
    width: calc(100% - 405px);
    display: table;
    table-layout: fixed;
    vertical-align: middle;
    line-height: 41px;
    margin-left: 15px;
}
dt ul.field-list li {
    min-height: inherit;
    line-height: 30px;
}
ul.field-list li {
    float: left;
    margin: 0px;
    padding: 5px;
    vertical-align: middle;
    position: relative;
    min-height: 41px;
}
ul, li {
    list-style: none;
    padding: 0px;
    margin: 0px;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ul.field-list li.hot {
    width: 110px;
    text-align: center;
}
ul.field-list li.author {
    width: 130px;
    text-align: center;
}
ul.field-list li.added {
    width: 130px;
    text-align: center;
}
ul.field-list {
    float: left;
    margin: 0px;
    padding: 0px;
    width: 100%;
}
dd ul.field-list li.title .vam {
    vertical-align: middle;
    display: table-cell;
    height: 41px;
}
ul.field-list li * {
    color: #333;
}
dd ul.field-list li.title h3 a.title {
    max-width: 100%;
    display: block;


    float: left;
}
.text-wrap {
    text-overflow: ellipsis;
    white-space: nowrap;
    zoom: 1;
    overflow: hidden;
    letter-spacing: normal;
    word-spacing: normal;
}
ul.field-list li.title div.icon {
    margin: auto 0px auto 4px;
    padding: 0px;
    float: left;
}
ul.field-list li.title div.icon span {
    display: block;
    background: url(//img.eprice.com.tw/img/tw/talk.gif) no-repeat;
    position: relative;
    margin: 0px 6px 0px 0px;
}
ul.field-list li.hot span.count {
    margin: 4px auto 0px auto;
    font-size: 11px;
    color: #afafaf;
}
ul.field-list li.hot span {
    display: block;
}
div.pagelink a, div.pagelink span {
    display: inline-block;
    zoom: 1;
    display: inline;
    margin: auto 2px;
    font-size: 16px;
    padding: 0px 8px;
    line-height: 28px;
    vertical-align: middle;
    text-align: center;
    border: 1px solid #dfdfdf;
    font-weight: bold;
    color: #585858;
}	
div.pagelink span {
    color: #f60;
}

</style>	
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<div class="align-center">
		<div class="content">
			
				<h1>歡樂豆腐討論區</h1>
				
					

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
                      <a href="#" class="title text-wrap" title="標題1" data-title="標題1">${post.title}</a>
                    </h3>
                    </div>
                  </li>
                  <li class="hot">
                      <span class="num">${post.hot}</span>
                  </li> 
                  <li class="author">
                    <a href="#" title="authorName" target="_blank">${post.authorName}</a>
                  </li>
                  <li class="added">
                    <a href="#" title="added" >${post.added}</a>
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
							    <a href="${contextRoot}/post?p=${pageNumber}">${pageNumber}</a>
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
