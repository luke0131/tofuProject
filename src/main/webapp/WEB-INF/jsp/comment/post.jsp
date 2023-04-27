<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.navi-side {
    width: 100%;
    box-sizing: border-box;
    float: right;
    background-color: #fff;
    border: 1px solid #ebedf1;
    position: relative;
    padding: 10px 10px;
}
.navi-side a.post {
    width: 106px;
    height: 36px;
    display: block;
    float: left;
    margin: 0px;
    background: url(//img.eprice.com.tw/img/tw/talk.gif) -473px -147px;
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
ul.field-list li.respond {
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
ul.field-list li.author span, ul.field-list li.respond span {
    display: block;
    text-align: center;
    font-size: 11px;
    margin: 4px auto 0px auto;
    padding: 0px;
    color: #afafaf;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

<div class="align-center">
	
		<div class="content">
			<div class="navi-side">
				<div class="clear"></div>
			        <a href="#" rel="nofollow" class="login-first post" title="發表文章"></a>
                <div class="pagelink">
                    <a href="#" data-name="page" data-value="10" data-lib="life">上一頁</a>
                    <a href="#" data-name="page" data-value="1" data-lib="life">1</a>
                    <a href="#" data-name="page" data-value="2" data-lib="life">2</a>
                    <a href="#" data-name="page" data-value="3" data-lib="life">3</a>
                    <a href="#" data-name="page" data-value="12" data-lib="life">下一頁</a>
                </div>
                <div class="content">
                    <dl class="thread-list">
                        <dt>
                            <ul class="field-list">
                                <li class="title">標題</li>
                                <li class="hot">人氣</li>
                                <li class="author">作者</li>
                                <li class="respond">最新回覆</li>
                            </ul>
                        </dt>
                        <dd>
                            <ul class="field-list normal">
                                <li class="title">
                                    <div class="vam">
                                        <h3>
                                            <a href="#" class="title text-wrap" title="標題1" data-title="標題1">標題1</a>
                                            <div class="icon">
                                                <span class="clear"></span>
                                            </div>
                                            <div class="clear"></div>
                                        </h3>
                                    </div>
                                </li>
                                <li class="hot">
                                    <span class="num">3</span>
                                    <span class="count">1730</span>
                                </li>
                                <li class="author">
                                    <a href="#" title="authorName" target="_blank">authorName1</a>
                                    <span>2023-03-22 20:58</span>
                                </li>
                                <li class="respond">
                                    <a href="#" title="respondName" target="_blank">respondName1</a>
                                    <span>2023-03-25 20:58</span>
                                </li>
                            </ul>
                        </dd>
                        <dd>
                            <ul class="field-list normal">
                                <li class="title">
                                    <div class="vam">
                                        <h3>
                                            <a href="#" class="title text-wrap" title="標題2" data-title="標題2">標題2</a>
                                            <div class="icon">
                                                <span class="clear"></span>
                                            </div>
                                            <div class="clear"></div>
                                        </h3>
                                    </div>
                                </li>
                                <li class="hot">
                                    <span class="num">4</span>
                                    <span class="count">150</span>
                                </li>
                                <li class="author">
                                    <a href="#" title="authorName" target="_blank">authorName2</a>
                                    <span>2023-02-19 19:54</span>
                                </li>
                                <li class="respond">
                                    <a href="#" title="respondName" target="_blank">respondName2</a>
                                    <span>2023-03-25 14:53</span>
                                </li>
                            </ul>
                        </dd>
                        <dd>
                            <ul class="field-list normal">
                                <li class="title">
                                    <div class="vam">
                                        <h3>
                                            <a href="#" class="title text-wrap" title="標題3" data-title="標題3">標題3</a>
                                            <div class="icon">
                                                <span class="clear"></span>
                                            </div>
                                            <div class="clear"></div>
                                        </h3>
                                    </div>
                                </li>
                                <li class="hot">
                                    <span class="num">3</span>
                                    <span class="count">1730</span>
                                </li>
                                <li class="author">
                                    <a href="#" title="authorName" target="_blank">authorName3</a>
                                    <span>2023-02-08 15:49</span>
                                </li>
                                <li class="respond">
                                    <a href="#" title="respondName" target="_blank">respondName3</a>
                                    <span>2023-03-23 20:09</span>
                                </li>
                            </ul>
                        </dd>
                        <dd>
                            <ul class="field-list normal">
                                <li class="title">
                                    <div class="vam">
                                        <h3>
                                            <a href="#" class="title text-wrap" title="標題4" data-title="標題4">標題4</a>
                                            <div class="icon">
                                                <span class="clear"></span>
                                            </div>
                                            <div class="clear"></div>
                                        </h3>
                                    </div>
                                </li>
                                <li class="hot">
                                    <span class="num">17</span>
                                    <span class="count">1730</span>
                                </li>
                                <li class="author">
                                    <a href="#" title="authorName" target="_blank">authorName4</a>
                                    <span>2023-02-13 13:41</span>
                                </li>
                                <li class="respond">
                                    <a href="#" title="respondName" target="_blank">respondName4</a>
                                    <span>2023-03-05 14:08</span>
                                </li>
                            </ul>
                        </dd>
                        <dd>
                            <ul class="field-list normal">
                                <li class="title">
                                    <div class="vam">
                                        <h3>
                                            <a href="#" class="title text-wrap" title="標題5" data-title="標題5">標題5</a>
                                            <div class="icon">
                                                <span class="clear"></span>
                                            </div>
                                            <div class="clear"></div>
                                        </h3>
                                    </div>
                                </li>
                                <li class="hot">
                                    <span class="num">20</span>
                                    <span class="count">1730</span>
                                </li>
                                <li class="author">
                                    <a href="#" title="authorName" target="_blank">authorName5</a>
                                    <span>2023-02-15 14:06</span>
                                </li>
                                <li class="respond">
                                    <a href="#" title="respondName" target="_blank">respondName5</a>
                                    <span>2023-02-20 20:19</span>
                                </li>
                            </ul>
                        </dd>
                        <dd class="last-low">
                            <div class="pagelink">
                                <a href="#" data-name="page" data-value="10" data-lib="life">上一頁</a>
                                <a href="#" data-name="page" data-value="1" data-lib="life">1</a>
                                <a href="#" data-name="page" data-value="2" data-lib="life">2</a>
                                <a href="#" data-name="page" data-value="3" data-lib="life">3</a>
                                <a href="#" data-name="page" data-value="12" data-lib="life">下一頁</a>
                            </div> 
                        </dd>
                    </dl>
                    <div class="clear"></div> 
                </div>
		    </div>
            <div class="clearfix"></div>
		</div>
	
</div>


<!-- 製作回到頂端的TOP-->
<a href="#top" class="top">Top</a>

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />	



</body>
</html>





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
