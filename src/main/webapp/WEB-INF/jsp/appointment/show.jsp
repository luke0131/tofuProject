<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tofu家用充電座安裝與評估</title>
<style>
.steps {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.steps li {
	display: inline-block;
	width: 15%;
	text-align: center;
}

.steps li img {
	max-width: 100%;
}

}
.background-img {
	background-image: url("./img/mPicture/images123.jpg");
	background-size: cover;
	background-position: right center;
	height: 100vh;
}
.underline {
  text-decoration: underline;
  text-decoration-color: blue;
  text-underline-offset: 5px;
}
</style>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
<body style="">
	<div class="wrap">
		<div class="section section-1 show">

			<div class="kv-image-m">
				<img src="./img/mPicture/123.jpg"
					style="width: 100%; display: block;" alt="BMW iX">
			</div>



			<span class="remind">本網站提供之照片僅供參考，以tofu展示中心提供的實際銷售車款之實際配備、充電設備為準。</span>

			<div class="bar">
				<span></span><span></span>
			</div>
		</div>
		<div class="main-top-right">
			<span></span><span></span>
		</div>
		<div class="main-btm-right">
			<span class="cube"></span> <span class="box"></span>
		</div>
	</div>
	<br>
	<div class="row justify-content-center">
		<div class="col-4">
			<h2 class="underline">服務流程</h2>
		</div>
	</div>
	<div class="container text-center">
	 <div class="col">
			<h4>輕鬆預約家用充電座安裝，啟動 tofu 引領世代的電能科技</h4>
		</div>
		</div>
	<br>
	<br>
	<ol class="steps">
		<li><img src="./img/mPicture/icon_index_s1.png" alt="1"> <span
			class="number"><span>(1)</span></span> <span class="text">預約安裝評估</span>
		</li>
		<li><img src="./img/mPicture/images3.png" alt="2"> <span
			class="number"><span>(2)</span></span> <span class="text">專人聯繫</span>
		</li>
		<li><img src="./img/mPicture/images4.png" alt="3"> <span
			class="number"><span>(3)</span></span> <span class="text">安裝評估費付款完成</span>
		</li>
		<li><img src="./img/mPicture/images (2).png" alt="4"> <span
			class="number"><span>(4)</span></span> <span class="text">安裝評估</span>
		</li>
		<li><img src="./img/mPicture/images5.png" alt="5"> <span
			class="number"><span>(5)</span></span> <span class="text">安裝費付款完成</span>
		</li>
		<li><img src="./img/mPicture/images (7).png" alt="6"> <span
			class="number"><span>(6)</span></span> <span class="text">專業施工</span>
		</li>

	</ol>
	<br>
	<br>

	<div class="background-img">
		<div class="container">
			<div class="title">

				<h2>
					<span class="cube"></span> <span class="underline">tofu 家用充電座安裝服務說明</span>
				</h2>
			</div>
			<div class="info-block">
				<img src="./img/mPicture/images123.jpg" width="650" height="700"
					class="rounded float-end" alt="...">
				<div class="block-title">
					<div class="icon">
						<img src="./img/mPicture/images8.png">
					</div>

					<h4>場域安裝條件</h4>
				</div>
				<ul>
					<li>停車場入口如為升降梯，可乘載重量須大於電動車車重</li>
					<li>如停車位屬於機械式，基於安全考量不建議安裝</li>
					<li>如安裝地點為戶外場域，建議加裝雨遮，以保護充電座設備及使用安全</li>
				</ul>
			</div>
			<div class="info-block">
				<div class="block-title">
					<div class="icon">
						<img src="./img/mPicture/images9.png">
					</div>

					<h4>安裝合作夥伴 - 飛鴻電能</h4>
				</div>
				<ul>
					<li>透過本平台進行線上預約安裝評估，將由專人至指定地點進行場勘</li>
					<li>安裝評估完畢將提供施工報價單、安裝規畫書</li>
					<li>確認安裝後，由專人預約時間安裝充電座</li>
					<li>如後續機器發生故障，飛鴻電能將協助診斷故障原因並處理機器更換事宜</li>
				</ul>
			</div>
			<div class="info-block">
				<div class="block-title">
					<div class="icon">
						<img src="./img/mPicture/images10.png">
					</div>
					<h4>安裝費用</h4>
				</div>
				<ul>
					<li>安裝評估費用 : 全台單一定點收取新台幣
						2,000元(含稅，離島城市另提供報價)，如後續確定安裝，該筆費用可折抵後續安裝費</li>
					<li>安裝費用 : 依各場域情況而有所不同</li>
					<li>額外費用 : 如需額外派員出席管委會或區權會說明協商，每次出席費用為新台幣 2,000 元
						(含稅，東部與離島城市另提供報價)</li>
					<li>所有安裝服務相關費用由 TOFU 充電策略合作夥伴 - 飛鴻電能收取</li>
				</ul>
			</div>

			<a href="${contextRoot}/install" class="btn btn-primary">前往預約</a>
		</div>
	</div>
	<br>
	<br>
	<script type="text/javascript"
		src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${contextRoot}/js/js/jquery-3.6.4.min.js"></script>
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</body>
</html>