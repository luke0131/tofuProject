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
<title>Tofucars Company</title>
<style>
body {
    line-height: 100%;
}
body {
    height: 100%;
    background: url(https://i2.bahamut.com.tw/html_bg.gif) center top #F9F9F9;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 15px;
    color: #464646;
}
html, body {
    text-size-adjust: none;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
    margin: 0;
    padding: 0;
}

body {
    display: block;
}
#BH-master {
    width: 938px;
 	float:inline-start;
}
.c-section {
    position: relative;
    margin-bottom: 12px;
    text-align: right;
}

section {
    display: block;
}
.c-section__side + .c-section__main {
    display: inline-block;
    vertical-align: top;
    float: none;
}
.c-post {
    background: #FFF;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.33);
}
.c-section__main {
    
    width: 1800px;
    margin: auto;
    text-align: left;
    box-sizing: border-box;
}
.c-post__header {
    padding: 36px;
    padding-top: 24px;
    padding-bottom: 0;
    margin-bottom: 18px;
	
}
.c-post__header__title {
    margin-bottom: 0px;
    border-bottom: none;
    padding-top: 4px;
    padding-bottom: 0px;
    text-indent: -10px;
    line-height: 1.3em;
    font-size: 22px;
    font-weight: bold;
    color: hsl(0deg, 0%, 20%);
    table-layout: fixed;
    word-wrap: break-word;

}
.tag-category {
    display: inline-block;
    padding-bottom: 12px;
    border-bottom: 1px solid #e5e5e5;
    width: 100%;
    margin-bottom: 16px;
}
.tag-category .tag-category_item {
    display: inline-block;
    margin-top: 8px;
    margin-right: 2px;
    padding: 2px 12px;
    border-radius: 99em;
    line-height: 24px;
    background-color: #F6F6F6;
    color: rgba(26, 26, 26, 0.5);
    font-size: 12px;
}
.c-post__header__author {
    margin-bottom: 8px;
}
.c-post__header__author .floor {
    display: inline-block;
    vertical-align: middle;
    border: 1px solid hsl(0deg, 0%, 85%);
    border-radius: 4px;
    padding: 6px 8px;
    line-height: 1;
    font-size: 12px;
    color: hsl(0deg, 0%, 65%);
    margin-right: 5px;
}
button, a, input[type=button], input[type=submit] {
    cursor: pointer;
}
a {
    color: #464646;
    text-decoration: none;
}
.c-post__header__author .username {
    display: inline-block;
    vertical-align: baseline;
    font-size: 15px;
    font-weight: bold;
    color: hsl(0deg, 0%, 35%);
}
.c-post__header__info {
    clear: both;
	float: right;
}
.c-post__header__author .postcount {
    float: right;
}
.c-post__header__author .postcount .postgp{
    display: inline-block;
    margin-left: 8px;
    height: 20px;
    border-radius: 4px;
	color: #FF8B2C;
    font-size: 12px;
    line-height: 20px;
    vertical-align: top;
}
.c-post__body {
    padding: 0 36px;
    margin-bottom: 8px;
}
.c-post__body .c-article {
    min-height: 100px;
}
.c-article {
    word-wrap: break-word;
    line-height: 1.7;
    color: hsl(0deg, 0%, 20%);
}
.FM-P2 {
    font-size: 15px;
    line-height: 19pt;
}

article {
    display: block;
}
.c-post__body__buttonbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 0 12px;
    width: 100%;
}
.c-post__body__buttonbar .gp {
    float: left;
    margin-right: 24px;
}
.c-post__body__buttonbar .gp button {
    margin-right: 4px;
    border: 2px solid #FF8B2C;
    transition: all 0.15s ease;
}
.ef-btn {
    border-radius: 50%;
    width: 40px;
    height: 40px;
    background: transparent;
    cursor: pointer;
}
.ef-btn .ef-btn__effect {
    display: block;
    position: relative;
}
.c-post__body__buttonbar .gp button .ef-btn__effect .icon {
    font-size: 16px;
    color: #FF8B2C;
}
.ef-btn .ef-btn__effect .icon {
    display: block;
}
.material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
}
.ef-firework .ef-btn__effect .effect-group {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
.ef-firework .ef-btn__effect .effect-group .effect {
    display: block;
    position: absolute;
    top: 48%;
    left: 50%;
    width: 16px;
    transform-origin: 0px 2px;
}
.c-post__body__buttonbar .gp button .ef-btn__effect .effect-group .effect:before, .c-post__body__buttonbar .gp button .ef-btn__effect .effect-group .effect:after {
    background: #FFF;
}
.ef-firework .ef-btn__effect .effect-group .effect:before {
    content: "";
    display: block;
    position: absolute;
    right: 0;
    border-radius: 2px;
    height: 3px;
}
.c-post__body__buttonbar .gp button .ef-btn__effect .effect-group .effect:before, .c-post__body__buttonbar .gp button .ef-btn__effect .effect-group .effect:after {
    background: #FFF;
}
.ef-firework .ef-btn__effect .effect-group .effect:after {
    content: "";
    display: block;
    position: absolute;
    top: 10px;
    right: 10%;
    border-radius: 50%;
    width: 3px;
    height: 3px;
    transform: scale(0, 0);
}
.c-post__body__buttonbar .article-footer_right {
    display: flex;
}
.c-post__body__buttonbar .article-footer_right .article-footer_right-btn img {
    width: 26px;
    height: 26px;
    margin-right: 2px;
}
fieldset, img {
    border: 0;
}
img {
    overflow-clip-margin: content-box;
    overflow: clip;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.c-post__body__buttonbar .article-footer_right .article-footer_right-btn:hover {
    color: #117e96;
    text-decoration: none;
    cursor: pointer;
}
.c-post__body__buttonbar .article-footer_right .article-footer_right-btn {
    display: flex;
    position: relative;
    justify-content: center;
    align-items: center;
    margin-left: 24px;
    flex-flow: row;
    font-size: 13px;
}

button, a, input[type=button], input[type=submit] {
    cursor: pointer;
}
a {
    color: #464646;
    text-decoration: none;
}
.c-post__footer {
    padding-top: 12px;
    padding-bottom: 24px;
}
.c-reply {
    background: #F3F4F4;
}
.c-reply__head {
    padding: 0 36px;
    min-height: 24px;
}
.c-reply__item {
    position: relative;
    padding: 8px 36px;
}
.c-reply__editor {
    clear: both;
    position: relative;
    padding: 4px 36px;
}
.user--sm {
    float: left;
    border-radius: 50%;
    margin-right: 6px;
    width: 40px;
    height: 40px;
    overflow: hidden;
}
.c-reply__editor .reply-input {
    position: relative;
    margin-top: 4px;
    border: 1px solid #d9d9d9;
    border-radius: 4px;
    padding: 8px 104px 8px 8px;
    background: #FFF;
    overflow: hidden;
}
.c-reply__editor .reply-input .content-edit {
    resize: none;
    border: none 0;
    width: 100%;
    height: 20px;
    font-size: 13px;
    color: #333333;
    overflow: hidden;
    max-height: 95px;
}
textarea {
    writing-mode: horizontal-tb !important;
    text-rendering: auto;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    background-color: field;
    column-count: initial !important;
}
.c-reply__editor .reply-input .comment_icon {
    display: inline-block;
    position: absolute;
    right: 5px;
    top: 6px;
}
.c-reply__editor .reply-input .comment_icon a {
    display: inline-block;
    width: 24px;
    height: 24px;
    vertical-align: middle;
    margin-right: 5px;
}
.c-reply__item .reply-content {
    padding-right: 24px;
    overflow: hidden;
}
.c-reply__item .reply-content .reply-content__article {
    display: inline;
    vertical-align: baseline;
    font-size: 14px;
    line-height: 1.5;
    color: #333;
}
.c-article {
    word-wrap: break-word;
}
.c-reply__item .reply-content .reply-content__user {
    display: inline;
    vertical-align: baseline;
    font-size: 14px;
    color: #0089ac;
}
.c-reply__item .reply-content .reply-content__footer {
    margin-top: 4px;
    overflow: hidden;
}
.c-reply__item .reply-content .reply-content__footer .edittime {
    float: left;
    font-size: 12px;
    line-height: 14px;
    color: hsl(0deg, 0%, 65%);
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
<!--
	<h1>駕駛疲勞是什麼，如何避免？</h1>	
<p>${fComment.text}<span>${fComment.authorName}</span></p>
-->

<div id="BH-master" style="position: relative;">
	<section class="c-section" id="post_14873">
		<div class="c-section__main c-post" >
			<div class="c-post__header">
				<h1 class="c-post__header__title">${allPost.title}</h1>
					<div class="tag-category">
						<a href="#">
							<div class="tag-category_item">豆腐討論區</div>
						</a>
					</div>
					<div class="c-post__header__author">
						<a href="#" class="floor tippy-gpbp" data-floor="1" data-tippy-content="只看此樓">樓主</a>
						<a href="#" class="username" target="_blank">${allComment.authorName}</a>
						<div class="postcount">
							<span class="postgp">${allComment.create_date}</span>
						</div>
					</div>
			</div>

			<div class="c-post__body">
					<article class="c-article FM-P2" id="cf14873">
						<div class="c-article_content">
							${allComment.text}
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
						</div>							
					</article>
					<div class="c-post__body__buttonbar" style>
						<div>
							<div class="gp" style>
								<button id="gp_14873" class="ef-btn ef-firework tippy-gpbp" type="button"></button>
									<div class="ef-btn__effect">
										<i class="icon material-icons"></i>
										<div class="effect-group">
											<span class="effect"></span>
											<span class="effect"></span>
											<span class="effect"></span>
											<span class="effect"></span>
											<span class="effect"></span>
										</div>	
									</div>
							</div>
						</div>	
						<div>
							<div class="article-footer_right">
								<a  href="#" class="article-footer_right-btn">
									<img src="https://i2.bahamut.com.tw/icon/msg_regular.png" data-src="https://i2.bahamut.com.tw/icon/msg_regular.png"
									data-hover-src="https://i2.bahamut.com.tw/icon/msg_regular_active.png">
									<p>回覆</p>
								</a>
							</div>
						</div>
					</div>
			</div>

			<div class="c-post__footer c-reply">
				<div class="c-reply__head nocontent">
					顯示留言
				</div>
				<div id="CommendList_14873">
					<div class="c-reply__item">
                        
                        <div class="c-repiy-content">
                            <a href="#" class="reply-content__user" target="_blank">customerName</a>
                            <article class="reply-content__article c-article">
                                <span class="comment_content">${allDetail.comment_detail}</span>
                            </article>
                            <div class="reply-content__footer">
                                <div class="edittime" data-tippy-content="留言時間" style="font-size: 6px;">
                                    留言時間：${allDetail.comment_date}
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
				<div class="c-reply__editor">
					<a href="https://user.gamer.com.tw/login.php" class="reply-avatar user--sm">
						<img src="https://avatar2.bahamut.com.tw/noface_s.png">	
					</a>
					<div class="reply-input" data-tippy-content="超過80個字囉">
						<textarea data-bsn="72822" data-snb="14873" class="content-edit" placeholder="留言..."></textarea>
					<div class="comment_icon">
						<a title="插入圖片" href="javascript:;">
							<img src="https://i2.bahamut.com.tw/forum/icons/comment_image.svg">
						</a>
					</div>	
					</div>
				</div>
			</div>
            <jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
		</div>
		
	</section>


	
</div>



	
	
	
	


</body>
</html>	

