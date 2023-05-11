<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <link
      href="${contextRoot}/img/indexPicture/favicon.ico"
      rel="icon"
      type="image/x-icon"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <meta charset="UTF-8" />
    <title>Tofucars Company</title>
  </head>
  <body class="registerbody">
    <jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
    <jsp:include page="/WEB-INF/jsp/layout/navbar.jsp" />

    <!-- 製作註冊畫面 -->
    <div
      class="modal modal-signin position-static d-block loginbodycontent"
      tabindex="-1"
      role="dialog"
      id="modalSignin"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
            <h1 class="fw-bold mb-0 fs-2" style="margin: auto">會員註冊</h1>
          </div>

          <div class="modal-body p-5 pt-0">
            <form
              action="${contextRoot}/customer/createMember"
              method="post"
              id="register-form"
            >
              <!--<form id="register-form">-->

              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control rounded-3"
                  placeholder="Account"
                  name="account"
                  id="account"
                />
                <label for="account">Account</label>
                <div id="account-error" class="invalid-feedback"></div>
              </div>

              <div class="form-floating mb-3">
                <input
                  type="email"
                  class="form-control rounded-3"
                  placeholder="Email"
                  name="email"
                  id="email"
                />
                <label for="email">Email</label>
                <div id="email-error" class="invalid-feedback"></div>
              </div>

              <div class="form-floating mb-3">
                <input
                  type="password"
                  class="form-control rounded-3"
                  placeholder="Password"
                  name="password"
                  id="password"
                />
                <label for="password">Password</label>
                <div id="password-error" class="invalid-feedback"></div>
              </div>

              <div class="form-floating mb-3">
                <input
                  type="password"
                  class="form-control rounded-3"
                  placeholder="Password"
                  name="confirm-password"
                  id="confirm-password"
                />
                <label for="confirmPassword">密碼確認</label>
                <div id="confirm-password-error" class="invalid-feedback"></div>
              </div>

              <div class="form-check my-4">
                <input
                  class="form-check-input me-2"
                  type="checkbox"
                  id="terms-agreement"
                />
                <label class="form-check-label" for="terms-agreement">
                  我同意成為小豆腐!
                  <a href="#" onclick="showDialog()">客戶服務條款</a>
                </label>
                <div id="terms-agreement-error" class="invalid-feedback"></div>
              </div>

              <div
                class="d-none alert alert-warning alert-dismissible d-flex justify-content-between fade show text-danger"
                role="alert"
                id="register-error"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  fill="currentColor"
                  class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2"
                  viewBox="0 0 16 16"
                  role="img"
                  aria-label="Warning:"
                >
                  <path
                    d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
                  />
                </svg>
                <div id="register-error-message"></div>
                <button
                  type="button"
                  class="btn-close"
                  id="alert-button-close"
                  aria-label="Close"
                ></button>
              </div>

              <button
                class="w-100 mt-3 mb-2 btn btn-lg rounded-3 btn-dark"
                type="button"
                id="register-button"
              >
                註冊
              </button>
              <div class="d-flex justify-content-center mt-3">
                <div class="text-dark">已經有豆腐車業的帳號了嗎？</div>
                <a
                  href="${contextRoot}/customer/login"
                  class="text-dark fw-bold"
                  >立即登入</a
                >
              </div>

              <hr class="my-4" />
              <button type="button" class="btn btn-primary" id="newMember">
                新會員
              </button>
              <!--<div class="d-flex justify-content-between mt-3">
							<button type="button" class="btn btn-primary" id="tofu">Tofu</button>
							 <button type="button" class="btn btn-success" id="memberLoginBTN">使用者</button>
						<button type="button" class="btn btn-warning" id="adminLoginBTN">管理員</button>
						</div>
						 -->
            </form>

            <div class="modal" id="modal-loading" data-bs-backdrop="static">
              <div class="modal-dialog modal-dialog-centered modal">
                <div class="modal-content">
                  <div class="modal-body text-center">
                    <div class="loading-spinner mb-2"></div>
                    <div>寄送驗證信中，請稍後</div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 
					<section class="d-none col-md-10 mx-auto mt-4 col-lg-6"
						id="email-verify-box">
						<div class="p-4 p-md-5 border rounded-5 bg-form">
							<h2 class="text-center" id="verify-email-title">信箱認證信已寄至</h2>
							<p class="text-center fs-3" id="verify-email"></p>
							<p>請在收到認證信的 24 小時內，點擊信中連結，以繼續完成註冊手續。</p>
							<ul class="text-body-secondary">
								<li><small>信件寄達時間依郵件伺服器而不同。</small></li>
								<li><small>若您一直未收到認證信，可能是系統擋信或被丟至垃圾信匣，請參考<a href="#"> Email 常見問題</a>。</small></li>
							</ul>
						</div>
					</section>
					 -->
          </div>
        </div>
      </div>
    </div>
    <!--  
	<script>
		document.querySelector('#tofu').addEventListener('click', function() {
			document.querySelector('#email').value = 'a1234@gmail.com';
			document.querySelector('#password').value = '1234';
		});
	</script>
	-->
    <script>
      const contextRoot = "${contextRoot}";
      document
        .querySelector("#newMember")
        .addEventListener("click", function () {
          document.querySelector("#account").value = "tofu測試";
          document.querySelector("#email").value = "tofucars@gmail.com";
          document.querySelector("#password").value = "fgdh844546";
          document.querySelector("#confirm-password").value = "fgdh844546";
        });

      function showDialog() {
        bootbox.dialog({
          title: "客戶服務及權利義務條款",
          message: `
		      <div class="row">
					<p>一、會員服務條款</p>
					<div style="margin:auto">
					<ol>
						<li>本會員服務條款所稱之「會員」，為依照本站所定之加入會員程序加入完成並通過認證者。</li>
						<li>當您使用本站服務時，即表示您同意及遵守本服務條款的規定事項及相關法律之規定。</li>
						<li>本站保留有審核加入會員資格之權利，另外已加入會員者，本站亦保留有解除其會員資格之權利。</li>
						<li>本會員服務條款之修訂，適用於所有會員，當本站修訂本服務條款時，將於本站上公告。</li>
					</ol>
					</div>
					<p>二、隱私權保護</p>
					<div style="margin:auto">
					<ol>
						<li>關於您註冊或使用本服務時所提供之個人資料，本公司將依「客戶隱私權政策 」為利用與保護。</li>
					</ol>
			        </div>
					<p>三、會員</p>
					<div style="margin:auto">
						<ol>
						<li>使用本站所提供之會員服務時，於加入會員時所登錄之帳號及密碼使用之。</li>
						<li>會員須善盡帳號及密碼的使用與管理之責任。對於使用該會員之帳號及密碼(無關於會員本身或其他人)利用本站服務所造成或衍生之所有行為及結果，會員須自行負擔全部責任。</li>
						<li>會員之帳號及密碼遺失，或發現無故遭第三者盜用時，應立即通知本站連絡掛失，因未即時通知，導致本站無法有效防止及修改時，所造成的所有損失，會員應自負全責。</li>
						<li>每次結束使用本服務，執行會員之登出並關閉視窗，以確保您的會員權益。</li>
						<li>盜用第三者會員之帳號及密碼，導致第三者或本公司遭其他第三人或行政機關之調查或追訴時，第三者會員或本公司有權向您請求損害賠償，包括但不限於訴訟費用、律師費及商譽損失等。</li>
					</ol>
			        </div>
					<p>四、會員登錄資料</p>
					<div style="margin:auto">
						<ol>
						<li>會員登錄資料須提供您本人正確、最新及完整的資料。</li>
						<li>會員登錄資料不得有偽造、不實等之情事(ex如個人資料及信用卡資料)，一經發現本公司可拒絕其加入會員資格之權利。並得以暫停或終止其會員資格，若違反中華民國相關法律，亦將依法追究。</li>
						<li>會員基本資料(ex:住址，電話及其他登錄資料)有變更時，請不定期更新相關個人資料，確保其正確及完整性。若您提供的資料有錯誤或不符等現象，本網站有權暫停或終止您的帳號，並拒絕您繼續使用本服務。</li>
						<li>未經會員本人同意，本公司原則上不會將涉及個人隱私之資料開示給第三者，唯資料共用原則...等不在此限(請參閱本站「隱私權保護聲明」相關規定)。</li>
						<li>會員應妥善保管密碼，不可將密碼洩露或提供給他人知道或使用；以同一個會員身分證字號和密碼使用本服務所進行的所有行為，都將被認為是該會員本人和密碼持有人的行為。</li>
						<li>會員如果發現或懷疑有第三人使用其會員身分證字號或密碼，應該立即通知本公司，採取必要的必要的防範措施。但上述通知不得解釋為本公司對會員負有任何形式之賠償或補償之責任或義務。</li>
					</ol>
			        </div>
					<p>五、終止授權</p>
					<div style="margin:auto">
						<ol>
						<li>您使用本服務之行為若有任何違反法令或本使用條款或危害本網站或第三者權益之虞時，本公司有權不經告知您，立即暫時或永久終止您使用本服務之授權。</li>
					</ol>
			        </div>
					<p>六、會員身份終止與本公司通知之義務</p>
					<div style="margin:auto">
						<ol>
						<li>本公司具有更改各項服務內容或終止任一會員帳戶服務之權利。</li>
						<li>若會員決定終止本公司會員資格，可直接以電子郵件的方式通知本公司或是由本公司所提供之機制進行取消，本公司將儘快註銷您的會員資料。</li>
						<li>會員有通知取消本公司會員資格之義務，並自停止本公司會員身份之日起（以本公司電子郵件發出日期為準），喪失所有本服務所提供之優惠及權益。</li>
						<li>為避免惡意情事發生致使會員應享權益損失，當會員通知本公司停止會員身份時，本公司將再次以電子郵件確認無誤後，再進行註銷會員資格。</li>
					</ol>
			        </div>
   						 `,
          size: "large",
          buttons: {
            confirm: {
              label: "OK",
              className: "btn-primary",
              callback: function () {},
            },
          },
        });
      }
    </script>
    <script
      type="text/javascript"
      src="${contextRoot}/js/pages/register.js"
    ></script>

    <!-- 製作回到頂端的TOP-->
    <a href="#top" class="top">Top</a>

    <jsp:include page="/WEB-INF/jsp/layout/common_dependencies.jsp" />
    <jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
  </body>
</html>
