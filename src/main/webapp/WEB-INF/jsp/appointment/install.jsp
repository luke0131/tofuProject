<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>安裝評估服務</title>
<style>
.yellow {
	color: red;
}

 .check-label button {
 
  
  margin-left: -13px;
  height: 55px;

}

</style>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />


	<div class="container">

		<div class="step step-1" style="">



			<h2>
				安裝評估服務說明
				<div class="text-success">
			</h2>
		</div>
		<hr class="border border-primary border-3 opacity-75">
		<div style="display: flex;">
			<div class="left-text" style="width: 50%;">
				<span> <img src="./img/mPicture/images1.png">
				</span>

				<h4>安裝評估費用</h4>
				<p>
					評估前需支付飛鴻電能新台幣 2,000元(含稅，離島城市另提供報價)</br>，如後續確定安裝，該筆費用可折抵後續安裝費
				</p>
			</div>

			<div class="right-text" style="width: 50%;">
				<span> <img src="./img/mPicture/images6.png">
				</span>



				<h4>額外協調服務</h4>
				<p>如需額外派員出席管委會或區權會說明協商，每次出席費用為新台幣 2,000 元 (含稅，東部與離島城市另提供報價)</p>
			</div>
		</div>
	</div>
	<div class="container">
		<form:form method="post" action="" modelAttribute="appointmentForm">
			<div class="form-group border border-primary p-2">
				<p class="check-row">
					<input type="checkbox" name="terms" required id="terms" value="yes">
					<label for="terms" class="checkbox"></label> <span
						class="check-label">我已詳閱並同意以上事項</span>
				</p>
				<p class="check-row">
					<input type="checkbox" name="privacy" required id="privacy"
						value="yes"> <label for="privacy" class="checkbox"></label>
					<span class="check-label">我已同意<button class="btn btn-link" onclick="showDialog()">隱私權聲明</button></span>
				</p>
			</div>
	</div>

	<div class="container">
		<div class="block block-2">
			<h2>請選擇停車位類型</h2>
			<div class="row">
				<h4>社區大樓</h4>

				<div style="font-size: 18px; line-height: 2;"
					class="container overflow-hidden text-center">
					<div class="row gx-5">
						<div class="col">
							<div class="p-3 border bg-white border-primary">
								<input type="radio" name="parkingtype" required
									id="parkingType2" value="2"> <label for="parkingType2"
									class="radiobox radio-parking"></label> <label
									for="parkingType2" class="parking-type-text">室內停車場</label>
							</div>
						</div>
						<div class="col">
							<div class="p-3 border bg-white border-primary">
								<input type="radio" name="parkingtype" required
									id="parkingType3" value="3"> <label for="parkingType3"
									class="radiobox radio-parking"></label> <label
									for="parkingType3" class="parking-type-text">戶外停車場</label>
							</div>
						</div>
					</div>
				</div>

				<!-- row -->
				<div class="row">
					<h4>獨棟住宅</h4>
					<div style="font-size: 18px; line-height: 2;"
						class="container overflow-hidden text-center">
						<div class="row gx-5">
							<div class="col">
								<div class="p-3 border bg-white border-primary">
									<input type="radio" name="parkingtype" required
										id="parkingType4" value="4"> <label for="parkingType4"
										class="radiobox radio-parking"></label> <label
										for="parkingType4" class="parking-type-text">室內停車場</label>
								</div>
							</div>
							<div class="col">
								<div class="p-3 border bg-white border-primary">
									<input type="radio" name="parkingtype" required
										id="parkingType5" value="5"> <label for="parkingType5"
										class="radiobox radio-parking"></label> <label
										for="parkingType5" class="parking-type-text">戶外停車場</label>
								</div>
							</div>
						</div>
					</div>
				</div>



				<!-- row -->
				<div class="row">
					<h4>其他</h4>
					<div style="font-size: 18px; line-height: 2;"
						class="container overflow-hidden text-center">
						<div class="row gx-5">
							<div class="col">
								<div class="p-3 border bg-white border-primary">
									<input type="radio" name="parkingtype" required
										id="parkingType1" value="1"> <label for="parkingType1"
										class="radiobox radio-parking"></label> <label
										for="parkingType1" class="parking-type-text">機械式停車場</label><span
										class="yellow"> *(不建議安裝)</span>
								</div>
							</div>
							<div class="col">
								<div class="p-3  bg-white"></div>
							</div>
						</div>
					</div>



				</div>

			</div>
			<!-- row -->
		</div>
	</div>



	<br>


	<div style="font-size: 18px; line-height: 2;" class="container">

<div class="d-flex flex-row ">
<img src="./img/mPicture/th.jpg" width="650" height="550"
				class="rounded float-end" alt="...">
<div>
		<h2>顧客基本資料與安裝評估聯絡資訊</h2>
		<p class="desc">
			填妥資料後，將由專人與您聯繫安排評估時間。 
		</p>
		
			
		
		
		<p>
			<label class="form-label">*購車人姓名:</label> <input type="text"
				style="border: 1px solid blue; border-radius: 5px; width: 300px;"
				name="customername" required id="customerName" class="input-field"
				maxlength="10" placeholder="請填寫正確的中文姓名">
		</p>

		<p>
			<span class="form-label">*電動車品牌</span> <select name="carmodel"
				style="border: 1px solid blue; border-radius: 5px; width: 250px"
				required>
				<option value="">請點擊選擇品牌</option>
				<option value="BMW">BMW</option>
				<option value="BENZ">TOYOTA</option>
				<option value="AUDI">BENZ</option>
			</select>

		</p>

		<p>
			<span class="form-label">*稱謂</span> <span class="btn-radio-gender">
				<input type="radio" name="gender" required id="male" value="男">
				<label for="male" class="radiobox radio-gender"></label> <label
				for="male" class="gender-text" data-id="M"> 先生</label>
			</span> <span class="btn-radio-gender"> <input type="radio"
				name="gender" required id="female" value="女"> <label
				for="female" class="radiobox radio-gender" data-id="2"></label> <label
				for="female" class="gender-text" data-id="F"> 女士</label>
			</span>
		</p>

		<p>
			<span class="form-label">*手機號碼</span> <input type="tel"
				style="border: 1px solid blue; border-radius: 5px; width: 300px"
				name="customermobile" required id="customerMobile"
				class="input-field" maxlength="10" placeholder="例：0912345678">
		</p>

		<p>
			<span class="form-label">*電子郵件</span> <input type="email"
				style="border: 1px solid blue; border-radius: 5px; width: 350px"
				name="customeremail" required id="customerEmail" class="input-field"
				maxlength="50">
		</p>



		<p>
			<span class="form-label">*安裝評估地址</span> <input type="text"
				style="border: 1px solid blue; border-radius: 5px; width: 400px"
				name="installaddress" required id="installAddress"
				class="input-field" maxlength="100">
		</p>


		<p>
			<span class="form-label">*安裝評估當日聯絡人</span> <input type="text"
				style="border: 1px solid blue; border-radius: 5px; width: 300px"
				name="contactperson" required id="contactName" class="input-field"
				maxlength="20">
		</p>

		<p>
			<span class="form-label">*安裝評估聯絡人電話</span> <input type="tel"
				style="border: 1px solid blue; border-radius: 5px; width: 300px"
				name="contactmobile" required id="contactmobile" class="input-field"
				maxlength="10" placeholder="例：0912345678">
		</p>
		<p>
			<span class="form-label">*方便聯絡時間</span> <span class="select-style">
				<select name="contacttime"
				style="border: 1px solid blue; border-radius: 5px; width: 300px"
				required id="contactTime">
					<option value="">請點擊選擇時間</option>
					<option value="平日 9:00~12:00">平日 9:00~12:00</option>
					<option value="平日 13:00~17:00">平日 13:00~17:00</option>
			</select>
			</span>
		</p>


		<button type="submit" class="btn btn-primary btn-lg">完成送出</button>
</div>
</div>
		</form:form>
	</div>
	






<script>
function showDialog() {
  bootbox.dialog({
    title: "隱私權聲明",
    message: `
      <div class="row">
        
        <h4>隱私權條款</h4>
        <div class margin-auto>
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
		</div>
        </div>
        
     
    `,
    size: "large",
    buttons: {
      confirm: {
        label: "OK",
        className: "btn-primary",
        callback: function() {
          
        }
      }
    }
  });
}
</script>




	

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>
</html>