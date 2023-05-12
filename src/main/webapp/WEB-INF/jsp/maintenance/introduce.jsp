<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8" />
<title>專業保養</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
	<div class="card text-bg-dark">
		<img src="./img/mPicture/img2.jpg" class="card-img" alt="..." />
		<div class="card-img-overlay">
			<h5 class="card-title">豆腐專業保養</h5>
			<p class="card-text">不只在乎車，更在乎您</p>
			<p class="card-text">
				<small>你最佳的選擇</small>
			</p>
		</div>
	</div>
	<br />

	<div class="container">
		<div class="card-body">
			<h2 class="card-title">Tofu車業檢查與保養</h2>
			<br />
			<p class="card-text">
				對於要裝配在您愛車上的每一個零件，都經過我們的縝密考量。 我們原廠零件均採用高品質的原料， 所以不僅更加耐用，還具備極佳的可靠度，<br />
				每項零件均提供您一年不限里程的保固，絕對是最有價值的選擇。 指定原廠的零件或配件，並經由合格的原廠技師正確安裝，
				最能確保您愛車的性能表現和完善品質。<br />而且持續使用豆腐車業原廠零件，更能夠讓您的愛車長期保值。
			</p>
			<br /> <br />

			<h4 class="nm-module-headline-combined audi-headline-order-3"
				data-module="headline-combined">Tofu 定期保養</h4>

			<div class="nm-content-list" data-module="content-list">
				<ul class="audi-unordered-list-m">
					<li class="audi-unordered-list-m__item"><span
						class="audi-unordered-list-m__item-text">Tofu
							原廠規範在正常操作狀況下之車輛，必須於「每 12 個月」或「每 10,000 公里 (註1) / 每 15,000 公里
							(註2)」進行保養換油壹次。</span></li>
					<li class="audi-unordered-list-m__item"><span
						class="audi-unordered-list-m__item-text">在此提醒各位車主，為確保愛車隨時處於最佳使用狀況，請您務必每
							12 個月回到 Tofu 授權服務廠進行定期保養及檢查，若 12 個月內行駛超過 10,000 公里 (註1) / 15,000
							公里 (註2)，則建議您「每 10,000 公里 (註1) / 每 15,000 公里 (註2)」返回 Tofu
							授權服務廠，由專業人員為您的愛車進行定期保養及檢查。</span></li>
					<li class="audi-unordered-list-m__item"><span
						class="audi-unordered-list-m__item-text">若您的 Tofu
							愛車經常性的處於高含塵量地區、高比例塞車狀況的典型市區交通、或經常性短程行駛…等嚴苛狀況之下操作，則建議您必須視情況縮短保養的間隔，或是提前執行部份保養工作。</span>
					</li>
				</ul>
			</div>

			<a href="${contextRoot}/main/add" class="btn btn-dark" id="reserve">預約保養</a>
		</div>
	</div>
	<br />
	<br />


	<script type="text/javascript">
		//document.querySelector("#reserve").addEventListener("click",
				//function() {
			 
				//	window.alert("請先進行登入!");
				//});
	</script>


	<!--  <script type="text/javascript">
		document.querySelector("#reserve").addEventListener("click",
				function(event) {
					event.preventDefault();
					Swal.fire('請先進行登入!')

				});
	</script>	-->

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>
