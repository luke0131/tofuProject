<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/img/indexPicture/favicon.ico" rel="icon" type="image/x-icon" />
<meta charset="UTF-8">
<title>Tofucars Company</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 

<jsp:include page="layout/navbar.jsp"/>


	
    <!-- 個人卡片 -->
    <div class="card-group" style="margin-top: 10px;">
      <div class="card">
        <img src="${contextRoot}/img/indexPicture/profoliocard.jpg" class="card-img-top" />
        <div class="card-body">
          <h2 class="card-title fw-bold">CEO-王芃琳 PoniWang</h2>
          <h5 class="fw-bold text-primary"><會員系統></h5>
          <p class="card-text">
            <ul>
                <li>
                    註冊、登入、登出
                </li>
                <li>
                    修改會員資料、查看訂單資料
                </li>
                <li>
                    小組網頁視覺設計
                </li>
            </ul>
          </p>
        </div>
        <div class="card-footer">

        </div>
      </div>
      <div class="card">
        <img src="${contextRoot}/img/indexPicture/profoliocard.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <h2 class="card-title fw-bold">行銷總監-陳博軒 Jackie Chen</h2>
          <h5 class="fw-bold text-primary"><商品系統></h5>
            <p class="card-text">
              <ul>
                  <li>
                      商品展示
                  </li>
                  <li>
                      商品下單
                  </li>
                  <li>
                      預約賞車表單
                  </li>
              </ul>
            </p>
        </div>
        <div class="card-footer">

        </div>
      </div>
      <div class="card">
        <img src="${contextRoot}/img/indexPicture/profoliocard.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <h2 class="card-title fw-bold">財務總監-賴昱廷 Luke Lai</h2>
          <h5 class="fw-bold text-primary"><購買系統></h5>
            <p class="card-text">
              <ul>
                  <li>
                      物流功能
                  </li>
                  <li>
                      金流功能
                  </li>
                  <li>
                      商品下單系統
                  </li>
              </ul>
            </p>
        </div>
        <div class="card-footer">

        </div>
      </div>
    </div>
    <div class="card-group">
      <div class="card">
        <img src="${contextRoot}/img/indexPicture/profoliocard.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <h2 class="card-title fw-bold">獨立董事-蔡明學 xxxxxx</h2>
          <h5 class="fw-bold text-primary"><會員系統></h5>
            <p class="card-text">
              <ul>
                  <li>
                       維修保養及表單設計
                  </li>
              </ul>
            </p>
        </div>
        <div class="card-footer">

        </div>
      </div>
      <div class="card">
        <img src="${contextRoot}/img/indexPicture/profoliocard.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <h2 class="card-title fw-bold">業務總監-溫佩樺 PeiHua Wen</h2>
          <h5 class="fw-bold text-primary"><員工系統></h5>
            <p class="card-text">
              <ul>
                  <li>
                       登入、登出
                  </li>
                  <li>
                      修改員工資本資料
                  </li>
                  <li>
                       任務功能、打卡功能、請假功能
                  </li>
              </ul>
            </p>
        </div>
        <div class="card-footer">

        </div>
      </div>
      <div class="card">
        <img src="${contextRoot}/img/indexPicture/profoliocard.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <h2 class="card-title fw-bold">策略顧問-劉書佑 Daniel Liu</h2>
          <h5 class="fw-bold text-primary"><客服系統></h5>
            <p class="card-text">
              <ul>
                  <li>
                      聯絡我們
                  </li>
                  <li>
                      豆腐論壇功能
                  </li>
                  <li>
                      即時客服線上諮詢
                  </li>
              </ul>
            </p>
        </div>
        <div class="card-footer">

        </div>
      </div>
    </div>


    <!-- 製作回到頂端的TOP-->
      <a href="#top" class="top">Top</a> 

<jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" /> 
<jsp:include page="layout/footer.jsp"/>
</body>
</html>