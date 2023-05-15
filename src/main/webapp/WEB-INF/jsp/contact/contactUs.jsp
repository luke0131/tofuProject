<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<title>Tofucars Company</title>
<style type="text/css">
h1 {
	font-size: 24px;
	line-height: 24px;
}

html, body {
	font-family: Arial, Helvetica, sans-serif;
}

div {
	display: block;
}

.contactAll {
	width: 750px;
	margin: 0px auto;
	margin-top: 30px;
}

table {
	display: table;
	border-collapse: separate;
	box-sizing: border-box;
	text-indent: initial;
	white-space: normal;
	line-height: normal;
	font-weight: normal;
	font-size: medium;
	font-style: normal;
	color: -internal-quirk-inherit;
	text-align: start;
	border-spacing: 2px;
	border-color: gray;
	font-variant: normal
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

td {
	display: table-cell;
	vertical-align: inherit;
}

#ctArea {
	width: 680px;
	margin: 15px 52px 20px 0px;
	font-size: 14px;
	line-height: 20px;
	color: #4a4d4a;
	text-align: left;
}

#ctArea form {
	margin: 0;
	padding: 0;
}

form {
	display: block;
	margin-block-end: 1em;
}

#ctArea .ctTitle {
	margin: 5px 0px;
}

input {
	writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: fieldtext;
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
	background-color: field;
	margin: 0em;
	padding: 1px 2px;
	border-width: 2px;
	border-style: inset;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
}

.ctTitle input {
	height: 27px;
}

input[type="text" i] {
	padding: 1px 2px;
}

input[type="radio" i] {
	background-color: initial;
	cursor: default;
	appearance: auto;
	margin: 3px 3px 0px 5px;
	padding: initial;
	border: initial;
}

#ctArea .sFont {
	font-size: 14px;
	color: #4a4d4a;
}

select {
	writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: fieldtext;
	letter-spacing: normal;
	word-spacing: normal;
	line-height: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	text-align: start;
	white-space: pre;
	-webkit-rtl-ordering: logical;
	cursor: default;
}

option {
	font-weight: normal;
	display: block;
	white-space: nowrap;
	min-height: 1.2em;
	padding: 0px 2px 1px;
}

label {
	cursor: default;
}

.clearfix {
	overflow: auto;
	zoom: 1;
}

#ctArea a.btn {
	display: block;
	width: 320px;
	padding: 11px 0;
	background-color: #1c69d4;
	text-align: center;
	color: #fff;
	font-weight: bold;
	font-size: 16px;
	text-decoration: none;
	float: right;
	margin-top: 10px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />
	<div class="contactAll">
		<h1>聯絡我們</h1>
		<!--Content begin-->
		<div id="page_content">
			<table>
				<tbody>
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td height="25" class="copy">
											<div id="ctArea">
												<form action="${contextRoot}/sucessContact" id="form" name="fromcontact" method="post"
													novalidate="novalidate">
													<div>
														"親愛的會員及網友您好，若您有任何意見或疑問，我們誠摯地邀請您直接寄到我們專人服務的電子郵件信箱，或撥打免付費豆腐車主售後服務專線：
														08xx-xxx-xxx 要求提供協助。我們將盡力為您解答！" <br>
														"為了加速來信處理時間，請在主旨欄位選擇正確的分類選項。感謝您的配合！" <br> <br>
													</div>
													<div class="ctTitle" style="margin-bottom: 20px;">
														<label for="userName" style="font-weight: 700; margin-right: 5px;">您的大名</label>
														<input type="text" id="userName" name="name"
															style="width: 150px" size="20" />
														<div id="userName-error" class="invalid-feedback"></div>
													</div>
													<div class="ctTitle" style="margin-bottom: 20px;">
														<span style="font-weight: 700; margin-right: 5px;">您的稱謂</span>
														<select id="salutation" name="salutation" class="sFont"
															style="height: 24px;">
															<option value="">請選擇</option>
															<option value="Mr">先生</option>
															<option value="Ms">女士</option>
														</select>
													</div>
													<div class="ctTitle" style="margin-bottom: 20px;">
														<span style="font-weight: 700; margin-right: 5px;">是否為豆腐車主</span>
														<input id="istofu1" name="istofuowner" type="radio"
															style="width: 16px; height: 16px; border: 0px solid;"
															value="1" checked> <label for="istofu1">是，您愛車的車身號碼或車牌號碼<input
															type="text" name="carno" class="input1"
															style="width: 150px" size="20"></label> <input
															id="istofu2" name="istofuowner" type="radio"
															style="width: 16px; height: 16px; border: 0px solid;"
															value="0" checked> <label for="istofu2">否</label>
														<br> <span
															style="font-size: 12px; margin-left: 120px;">（為了能及時處理您的問題，我們需要知道您愛車的車身號碼去研究您反應的事項，您</span>
														<br> <span
															style="font-size: 12px; margin-left: 120px;">可以從行照或引擎附近的小金屬板上找到車身號碼。）</span>
													</div>
													<div class="ctTitle" style="margin-bottom: 20px;">
														<label for="email"
															style="font-weight: 700; margin-right: 5px;">您的E-mail</label>
														<c:choose>
															<c:when test="${loggedInCustomer == null}">
																<input id="email" name="email" type="text"
																	style="width: 250px" size="40" />
															</c:when>
															<c:otherwise>
																<input id="email" value="${loggedInCustomer.email}"
																	disabled="true" name="email" type="text"
																	style="width: 250px" size="40" />
															</c:otherwise>
														</c:choose>


														<div id="email-error" class="invalid-feedback"></div>
													</div>

													
													<div class="ctTitle" style="margin-bottom: 20px;">
														<label for="phoneNumber" style="font-weight: 700; margin-right: 5px;">您的聯絡電話</label>
														<input id="phoneNumber" name="phoneNumber" type="text" 
															style="width: 250px" size="20">
															<div id="phoneNumber-error" class="invalid-feedback"></div>
													</div>

													<div class="ctTitle" style="margin-bottom: 20px;">
														<label id="subject" style="font-weight: 700; margin-right: 5px;">信件主旨</label>
														<select id="mailtype" name="mailtype" class="sFont"
															style="height: 24px;">
															<option value="">請選擇類別</option>
															<option value="aaa">如何維修保養</option>
															<option value="bbb">如何賞車及購車</option>
															<option value="ccc">想了解車子的性能</option>
															<option value="ddd">贈品介紹</option>
															<option value="eee">如何進行會員註冊登入</option>
														</select> 
														<input id="subject" name="subject" type="text"
															 style="width: 250px" size="40"> <br>
														<span style="margin-left: 70px;">(請先選擇來信主旨類別，再填上您來信的主旨)</span>
													</div>
														
													<div class="ctTitle" style="margin-bottom: 20px;">
														<label for="contents" style="position: relative; top: -50px; font-weight: 700; margin-right: 5px;">信件內容</label>
															<textarea id="contents" name="contents"  placeholder="請輸入信件內容"
															rows="4" cols="62"></textarea>
													</div>
													<!--<div id="check-login" class="text-danger">請輸入內容!</div> -->
													<div>
														<input type="checkbox" id="privacyPolicy" name="privacyPolicy" required>
															<label for="privacyPolicy">我同意
																<span>
																	<a href="https://customer.bmwgroup.com/pm2/pm-document-service/api/v1link/documents/policyName/BMW_CONNECTED_DRIVE_DPP/TW/PDF?language=zh&KeyId=04e8c043-ad07-48d0-8ed6-94fee52f18ec" >隱私權政策	</a>
																</span>
															</label>
													</div>	
														<button class="ctTitle clearfix" style="margin-bottom: 20px;" type="button" id="sendButton">確認送出</button>
													
												</form>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	

	<script type="text/javascript"
		src="${contextRoot}/js/pages/contactUs.js"></script>

	<!-- 製作回到頂端的TOP-->
	<a href="#top" class="top">Top</a>

	<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
</body>


</html>
