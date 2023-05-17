<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=edge,requiresActiveX=true">
<title>打造我的專屬愛車</title>
<meta property="og:title" content="NISSAN ::: 打造我的專屬 NISSAN" />
<meta property="og:description" content="技術日產  智行未來" />
<meta property="og:url" content="https://new.nissan.com.tw/nissan/build" />
<meta property="og:image"
	content="https://new.nissan.com.tw/upload/misc/logo-for-fb.png" />

<meta name="keywords" content="" />
<meta name="description" content="技術日產  智行未來">


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="cleartype" content="on">

<!-- 全站 CSS assets -->
<link rel="stylesheet" href="https://new.nissan.com.tw/nissan/css/ui/common-v2.css?v=0413">
<link rel="stylesheet" href="https://new.nissan.com.tw/nissan/css/ui/common.css?v=0413">

<!-- 各頁 CSS assets -->

<link rel="stylesheet" href="https://new.nissan.com.tw/nissan/css/module/bmn.css?v=0413">


<link rel="stylesheet" href="https://new.nissan.com.tw/nissan/css/addendum.css?v=0422">

<!-- 全站JS assets -->
<script src="https://new.nissan.com.tw/nissan/Scripts/modernizr-2.8.3.js"></script>

<script src="https://new.nissan.com.tw/nissan/js/lib/jquery.js"></script>
<script src="https://new.nissan.com.tw/nissan/js/ui/common.js"></script>
<script src="https://new.nissan.com.tw/nissan/js/cdl/webcount.js"></script>
<script src="https://new.nissan.com.tw/nissan/js/cdl/gdpr-client.js"></script>


<!-- 各頁 JS assets -->

<script src="https://new.nissan.com.tw/nissan/js/lib/TweenMax.js"></script>
<script src="https://new.nissan.com.tw/nissan/js/cdl/bmn.js"></script>

<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-WT473T');
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-WT473T"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>

	<div class="mastbody">
		<div class="mastbody-inner grid-centre pd-bottom">
			<div class="headingbar">
				<div class="headingbar-main">

					<h1 class="title">打造我的專屬</h1>

				</div>
			</div>

			<div id="bmnApp" class="bmnapp shadow-great">

				<span
					style="display: none; background: rgba(255, 255, 255, .9); border: 1px solid #eee; margin: 1px; font-family: monospace; position: fixed; right: 10px; top: 0; z-index: 99; overflow-x: hidden; overflow-y: auto; width: 500px; font-size: 11px; line-height: 1; padding: 1em; max-height: 140px;">prog={{main.prog}}<br>
					<form action="https://new.nissan.com.tw/nissan/build/choose" id="bmn_form" method="post">
						<input type="text" name="operation" id="operation" value="" style="width: 40px;" /> 
						<input type="text" name="val" id="val" value="" style="width: 90px;" /> 
						<input type="text" name="currentStep" id="currentStep" value="-1" style="width: 40px;" /> 
						<input type="text" name="bmnId" id="bmnId" /> 
						<input type="text" name="modelId" id="modelId" />
						<input type="text" name="varSno" id="varSno" value="0" /> 
						<input type="text" name="colorSno" id="colorSno" value="0" /> 
						<input type="text" name="partIds" id="partIds" />
					</form> carId=<br> totalPrice={{main.totalPrice}}<br>
					selectedVersion=0<br> selectedColor=0<br>
					selectedAccessory= <!--carData={{main.carData | json}},<br>-->
				</span>

				<nav class="bmnapp-stepnav stepnav">
					<ul class="stepnav-inner">
						<li class="stepnav-item first   "><span class="stepnav-btn"><span
								class="txt">選擇愛車</span></span> <i class="step nav-arrow"></i></li>
						<li class="stepnav-item   "><span class="stepnav-btn"><span
								class="txt">愛車顏色</span></span> <i class="step nav-arrow"></i></li>
						<li class="stepnav-item   "><span class="stepnav-btn"><span
								class="txt">加購選配件</span></span> <i class="step nav-arrow"></i></li>
						<li class="stepnav-item last   "><span class="stepnav-btn"><span
								class="txt">我的愛車</span></span> <i class="step nav-arrow"></i></li>
					</ul>
				</nav>
				<!--/.bmnapp-stepnav.stepnav-->
				<script>
					(function($, global) {
						$(document).ready(initNavInteraction);
						function initNavInteraction() {
							$("#bmnApp .stepnav-inner a.btn-jump").click(
									jumpBtn_click);
						}
						function jumpBtn_click(evt) {
							var order = $(this).data("order");
							var $form = $("#bmn_form");
							$form.find("[name=operation]").val("jump");
							$form.find("[name=currentStep]").val(order);
							global.sendBmnOperation("https://new.nissan.com.tw/nissan/build/choose",
									$form.serialize());
						}
					})(jQuery, getGlobal());
				</script>

				<div class="bmnapp-splash">
					<div class="img">
						<img src="https://new.nissan.com.tw/nissan/img/misc/bmn-splash.jpg">
					</div>
					<div class="heading">
						<h2 class="title">一台理想的車，搭載理想的配備</h2>
						<p class="descr">購車諮詢、購車試算、配件選購。貼心服務一次搞定！</p>
						<div clas="start">
							<div class="btn-plain-loud bold btn-start">
								<span class="txt">開始</span>
							</div>
						</div>
					</div>
				</div>
				<script>
					(function($, global) {
						$(document).ready(initInteraction);

						function initInteraction() {
							$(".btn-start").click(proceedToNext);
						}

						function proceedToNext() {
							var $form = $("#bmn_form");
							$form.find("[name=operation]").val("next");
							global.sendBmnOperation("https://new.nissan.com.tw/nissan/build/choose",
									$form.serialize());
						}
					})(jQuery, getGlobal());
				</script>

			</div>

		</div>
	</div>
	<!--/.mastbody-->

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />

</body>

</html>