<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預約成功</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
}

.container {
	width: 50%;
	margin: auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h1 {
	color: #4CAF50;
	margin-top: 0;
}

p {
	font-size: 18px;
	margin: 20px 0;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

                <div class="container">
                    <h1>您已成功完成 TOFU 家用充電座安裝評估預約</h1>
                    <h2>您的訂單編號為：<%= request.getAttribute("keycode") %></h2>
                    <p>
                        您的安裝評估預約已成立，<br class="mobile">請至您填寫的 <span class="blue">E-Mail</span> 收取預約確認信。<br class="">
                        我們將指派 TOFU 充電策略合作夥伴  <br class="mobile">飛鴻電能 專業人員與您聯繫。<br class="">
                        若有任何問題，歡迎電洽飛鴻電能<br class="mobile">免付費客服專線 : 0800-888-168
                        <span class="remind">*如您尚未收到確認信，<br class="mobile">建議請至垃圾郵件資料匣檢查。</span>
                    </p>
                </div>
          
        
</body>
</html>