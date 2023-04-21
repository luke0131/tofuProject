<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tofucars Company</title>
</head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<body>
    <nav
      class="navbar navbar-expand-md navbar-dark bg-dark"
      aria-label="Fourth navbar example"
    >
      <div class="container-fluid">
        <a href="${contextRoot}/"
          ><img src="${contextRoot}/img/indexPicture/TofuLogo.jpg" style="width: 120px"
        /></a>
        <!-- <a class="navbar-brand" href="#">Expand at md</a> -->
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarsExample04"
          aria-controls="navbarsExample04"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample04">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item dropdown">
              <a
                class="nav-link active"
                href="#"
                data-bs-toggle="dropdown"
                aria-current="page"
                >關於我們</a
              >
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${contextRoot}/company">公司簡介</a></li>
                <li><a class="dropdown-item" href="${contextRoot}/about">成員介紹</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a
                class="nav-link active"
                href="${contextRoot}/product/product"
                >商品展示</a
              >
              
            </li>

            <li class="nav-item dropdown">
              <a
                class="nav-link active"
                href="#"
                data-bs-toggle="dropdown"
                aria-current="page"
                >豆腐論壇</a
              >
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="">1</a></li>
                <li><a class="dropdown-item" href="#">2</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a
                class="nav-link active"
                href="#"
                data-bs-toggle="dropdown"
                aria-current="page"
                >客戶服務</a
              >
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${contextRoot}/introduce">維修保養</a></li>
                <li><a class="dropdown-item" href="#">2</a></li>
              </ul>
            </li>

            <!-- <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                >Dropdown</a
              >
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
              </ul>
            </li> -->
          </ul>
          <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <input
              type="search"
              class="form-control form-control-dark text-bg-dark"
              placeholder="Search..."
              aria-label="Search"
            />
          </form>
          <div class="text-end">
            <button type="button" class="btn btn-success me-2">
              	<a class="loginhover" href="${contextRoot}/customer/login">登入</a>
            </button>
            <button type="button" class="btn btn-warning">
            	<a class="loginhover" href="${contextRoot}/customer/xxxx">註冊</a>
            </button>
          </div>
        </div>
      </div>
    </nav>
    
    <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>