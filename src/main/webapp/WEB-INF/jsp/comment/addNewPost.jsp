<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>新增文章內容及標題</title>
<link rel="stylesheet" href="${contextRoot}/css/postAndComment/addNewPost.css">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body aria-expanded="false">
    <jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
    <jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

    <div id="BH-background">
        <div id="BH-wrapper">
            <div id="BH-master" class="editor-is-selected">
                <form action="${contextRoot}/showPost" name="form1" id="form1" method="post">
                    <section class="c-section post-section">
                        <div class="c-section__main">
                            <div class="c-post main_editor_section box-shadow__fromabove">
                                <div class="c-post__header">
                                    <h3>發表新文章</h3>
                                    
                                 </div> 
                               
                                <div class="c-post__body">
                                    <input type="hidden" class="form-control" name="name" value="${post.authorName}">  
                                    <input type="text" class="form-control" name="title" value="" placeholder="請輸入文章標題>>>">
                                    <input type="hidden" class="form-control" name="added" value="${post.added}">
                                    <textarea class="form-control main-editor is-focused" name="text" id="editor" style="height: 462px;"
                                     placeholder="請輸入文章內容"></textarea>
                               
                                <div class="postset_sign">
                                    <button class="dropdown-group" type="submit" id="#submitBtn">確認送出</button>
                                    <button class="dropdown-group" type="reset" style="color: red;">清除資料</button>
                                </div>   
                                </div>
                            </div>
                        </div>
                    </section>
                </form>
            </div>
        </div>
    </div>
 
 <script type="text/javascript">
 
//選擇textarea元素
 var textarea = document.querySelector('#editor');

 document.getElementById('form1').addEventListener('submit', function(event) {
	  // 如果textarea的值為空
	  if (textarea.value.trim() === '') {
	    // 添加error CSS類
	    textarea.classList.add('error');
	    // 設置placeholder文本
	    textarea.placeholder = '文章內容必填！！！！！！！';
	    // 取消表單提交
	    event.preventDefault();
	  }
	});

	// 監聽textarea的輸入事件
	textarea.addEventListener('input', function() {
	  // 如果textarea的值不為空
	  if (textarea.value.trim() !== '') {
	    // 移除error CSS類
	    textarea.classList.remove('error');
	    // 移除placeholder文本
	    textarea.placeholder = '';
	  }
	});
 </script>
 
</body>
</html>
