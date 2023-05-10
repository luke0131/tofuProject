<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link
  href="${contextRoot}/img/indexPicture/favicon.ico"
  rel="icon"
  type="image/x-icon"
/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Comment論壇留言</title>
    <link
      rel="stylesheet"
      href="${contextRoot}/css/postAndComment/comment.css"
    />
  </head>
  <body>
    <span id="comment_id" style="display: none">${allComment.comment_id}</span>
    <jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
    <jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

    <div id="BH-master" style="position: relative">
      <section class="c-section" id="post_14873">
        <div class="c-section__main c-post">
          <div class="c-post__header">
            <h1 class="c-post__header__title">${allPost.title}</h1>
            <div class="tag-category">
              <a href="#">
                <div class="tag-category_item">豆腐討論區</div>
              </a>
            </div>
            <div class="c-post__header__author">
              <a
                href="#"
                class="floor tippy-gpbp"
                data-floor="1"
                data-tippy-content="只看此樓"
                >樓主</a
              >
              <a href="#" class="username" target="_blank"
                >${allComment.authorName}</a
              >
              <div class="postcount">
                <span class="postgp"
                  ><fmt:formatDate
                    value="${allPost.added}"
                    pattern="yyyy-MM-dd HH:mm EEEE"
                /></span>
              </div>
            </div>
          </div>

          <div class="c-post__body">
            <article class="c-article FM-P2" id="cf14873">
              <div class="c-article_content">
                ${allComment.text}
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
              </div>
            </article>
            <div class="c-post__body__buttonbar">
              <div>
                <div class="gp">
                  <button
                    id="gp_14873"
                    class="ef-btn ef-firework tippy-gpbp"
                    type="button"
                  ></button>
                  <div class="ef-btn__effect">
                    <i class="icon material-icons"></i>
                    <div class="effect-group">
                      <span class="effect"></span>
                      <span class="effect"></span>
                      <span class="effect"></span>
                      <span class="effect"></span>
                      <span class="effect"></span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div>
            <div class="c-post__footer c-reply">
              <div class="c-reply__head nocontent">顯示留言</div>

              <div class="c-reply__item">
                <!-- <c:forEach items="${allDetail}" var="allDetail" > -->

                <div class="c-reply-content" id="comments">
                  <!--                             <a href="#" class="reply-content__user" target="_blank">Customer</a> -->
                  <article class="reply-content__article c-article">
                    <span class="comment_content"
                      >${allDetail.comment_detail}</span
                    >
                  </article>
                  <div class="reply-content__footer">
                    <div class="edittime" style="font-size: 6px">
                      留言時間：<span style="text-decoration: none" ><fmt:formatDate value="${allDetail.commentDate}"
                      pattern="yyyy-MM-dd HH:mm EEEE"/></span>
                    </div>
                  </div>
                </div>

                <!-- </c:forEach> -->
              </div>

              <!-- 					<form> -->
              <div class="c-reply__editor">
                <a href="#" class="reply-avatar user--sm">
                  <img src="https://avatar2.bahamut.com.tw/noface_s.png" />
                </a>

                <div class="reply-input">
                  <input
                    id="myComment"
                    class="content-edit"
                    placeholder="留言..."
                  />

                  <button id="submitBtn">送出</button>
                </div>
              </div>
              <!-- 					</form> -->
            </div>
            <jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
            <jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
          </div>
        </div>
      </section>
    </div>

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
      const commentsDiv = document.getElementById("comments");
      const submitBtn = document.getElementById("submitBtn");

      submitBtn.addEventListener("click", async function (event) {
        //event.preventDefault();
        let myComment = document.getElementById("myComment").value;
        let json = {
          comment: myComment,
        };

        await axios
          .post("${contextRoot}/comment/${comment_id}", json)
          .then(function (response) {
            console.log(response);
            // 成功提交留言后的逻辑
            alert("留言成功！");
            const commentsDiv = document.getElementById("comments");

            // 建立一個新的 <div> 元素來放置新留言的內容
            var newCommentDiv = document.createElement("div");
            newCommentDiv.classList.add("c-reply-content");

            // 新留言的內容
            const newCommentArticle = document.createElement("article");
            newCommentArticle.classList.add(
              "reply-content__article",
              "c-article"
            );
            const newCommentContent = document.createTextNode(myComment);
            newCommentArticle.appendChild(newCommentContent);
            newCommentDiv.appendChild(newCommentArticle);

            // 新留言的時間
            const newCommentTime = document.createElement("div");
            newCommentTime.classList.add("edittime");
            newCommentTime.style.fontSize = "6px";
			
			var day_list = ['日', '一', '二', '三', '四', '五', '六'];
            var currentTime = new Date();
			var month = currentTime.getMonth() +1;
			var day =currentTime.getDay(); 

            var commentDate = currentTime.getFullYear() + "-0"+ month +"-" + currentTime.getDate() + " " + 
            currentTime.getHours() + ":" + currentTime.getMinutes() + " " + "星期" + day_list[day];
            var newCommentTimeContent = document.createTextNode(
              "留言時間：" + commentDate
            );
			var p = document.createElement('div');
			p.appendChild(newCommentTimeContent);
            newCommentTime.appendChild(p);
            newCommentDiv.appendChild(newCommentTime);

            // 把新的留言放到留言區的最上面
            commentsDiv.insertBefore(newCommentDiv, commentsDiv.firstChild);

            // 清空輸入框
            document.getElementById("myComment").value = "";
          })
          .catch(function (error) {
            console.log(error);
            // 处理错误的逻辑
            alert("留言失败！");
          });
      });
    </script>
  </body>
</html>
