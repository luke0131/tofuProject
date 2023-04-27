<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tofucars Company</title>
	<style>
		body {
			background-color: #F2F2F2;
			font-family: Arial, sans-serif;
			font-size: 16px;
			line-height: 1.5;
			color: #333333;
			padding: 20px;
		}
		div {
    display: block;
    text-align: center;
}
		h1 {
			font-size: 32px;
			font-weight: bold;
			margin-bottom: 30px;
			text-align: center;
			color: #003366;
		}
		p {
			margin-bottom: 10px;
			text-indent: 2em;
		}
		.back {
			display: block;
			width: 120px;
			height: 40px;
			line-height: 40px;
			margin: 20px auto;
			background-color: #003366;
			color: #FFFFFF;
			text-align: center;
			text-decoration: none;
			border-radius: 5px;
			font-size: 16px;
			font-weight: bold;
			cursor: pointer;
		}
		.back:hover {
			background-color: #0059B3;
			color: #FFFFFF;
		}
	</style>
</head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<body>
	<h1>感謝您的來信</h1>

<div>
	<p>親愛的會員您好：</p>
	<p>非常感謝您的來信，我們很高興收到您的回應。</p>
	<p>如果您有任何問題或疑慮，請隨時聯繫我們。</p>
	<p>再次感謝您的寶貴時間和回覆。</p>
	<p>豆腐車業會繼續為您提供優質服務！</p>
</div>	
	<div class="back">~即將跳回首頁~</div>

<script type="text/javascript">
    window.onload = function() {
        // 3秒後跳轉回首頁
        setTimeout(function(){
            window.location.href = "${contextRoot}/";
        }, 3000);
    }
</script>

</body>
</html>