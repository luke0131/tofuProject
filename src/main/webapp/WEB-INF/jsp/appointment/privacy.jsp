<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>隱私權聲明</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	

	
	<div class="lightbox-privacy">
		<div class="lightbox-container">
			<div class="btn-close-lightbox">
				<span></span>
			</div>
			<div class="content">
				<h4>隱私權條款</h4>
				<p>本公司非常重視您的隱私權，為維護您個人資料之安全性，謹遵循「個人資料保護法」（下稱個資法）規範，告知您相關權益，俾取得您同意本公司蒐集、處理及利用您所提供之個人資料。</p>
				<p>客戶同意汎德股份有限公司（下稱汎德公司）為保護客戶之個人資料，依據個人資料保護法規定，於下列目的範圍內，直接或間接蒐集、處理及利用客戶個人資料：</p>
				<ol>
					<li>蒐集目的：基於行銷、及提供客戶服務及管理（包括以客戶所提供之個人資料確認客戶的身分、與客戶進行聯絡、提供tofu公司及關係企業或合作伙伴相關之服務及資訊、電話訪問、統計分析等），於必要範圍內蒐集、處理、利用及國際傳遞。</li>
					<li>個人資料類別：提供之個人資料，包括姓名、身分證號碼、聯絡方式、車籍資料或其他得以直接或間接識別客戶個人之資料。</li>
					<li>使用期間、地區、對象：<br>(1) 期間：tofu公司存續期間或依法令之資料保存期間。<br>(2)
						地區：tofu公司營運地區及海外地區、tofu國外原廠。<br>(3)
						對象：總代理豆腐（股）公司、豆腐（股）公司授權之經銷商（包含授權經銷商委託銷售tofu車輛之關係企業）、服務廠、關係企業、豆腐（股）公司擁有一定比例以上股份之其他公司及其他與豆腐（股）公司有業務往來合作機構，如家用充電座安裝之合作廠商飛鴻電能科技股份有限公司。
					</li>
					<li>客戶對於豆腐公司保有之個人資料，日後仍可為適當說明後，向豆腐公司查詢、請求閱覽、製給複製本、補充或更正、請求停止蒐集、處理或利用，以及刪除客戶之個人資料（請致電客戶服務電話：0800-291-101），查詢、請求閱覽及製給複製本，豆腐公司得酌收必要成本費用，惟如因客戶請求上述作為所造成之權益受損，豆腐公司不需負損害賠償責任。</li>
				</ol>
				<a href="${contextRoot}/install" class="btn btn-primary">確認</a>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="${contextRoot}/js/js/jquery-3.6.4.min.js"></script>

</body>
</html>