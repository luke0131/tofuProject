/**
 * 寫JavaScript Register相關語法
 */

const account = document.querySelector("#account");
const email = document.querySelector("#email");
const password = document.querySelector("#password");
const confirmPassword = document.querySelector("#confirm-password");
const registerForm = document.querySelector("#register-form");
const registerButton = document.querySelector("#register-button");
const termsAgreement = document.querySelector("#terms-agreement");

const inputs = [account, email, password, confirmPassword];

// function checkAccount(accountValue) {
//     if (accountValue === "") {
//       console.log("請輸入帳號名稱");
//       account.classList.add("is-invalid");
//       document.querySelector("#register-form div[id=account-error]").innerText =
//         "請輸入帳號名稱";
//       return "失敗";
//     } else {
//       console.log("check account exist");
//       axios
//         .get(contextRoot + "/account/find/" + account.value)
//         .then(function (response) {
//           if (response.status == 200) {
//             console.log(response.data);
//             if (response.data) {
//               console.log("帳號已經被註冊");
//               account.classList.add("is-invalid");
//               document.querySelector(
//                 "#register-form div[id=account-error]"
//               ).innerText = "帳號已經被註冊";
//               return "成功";
//             }
//             return "失敗";
//           }
//           return "失敗";
//         })
//         .catch(function (error) {
//           console.log(error);
//           return "失敗";
//         });
//     }
//   }

document.querySelector("body").addEventListener(
  "click",
  function (e) {
    console.log("test");
    document.querySelector("#register-error").classList.add("d-none");
  },
  true
);

account.addEventListener("blur", function (e) {
  console.log("account success");
  if (!account.value) {
    account.classList.add("is-invalid");
    document.querySelector("#register-form div[id=account-error]").innerText =
      "請輸入帳號名稱";
  }

  if (account.value) {
    console.log("check account exist");
    axios
      .get(contextRoot + "/account/find/" + account.value)
      .then(function (response) {
        if (response.status == 200) {
          console.log(response.data);
          if (response.data) {
            account.classList.add("is-invalid");
            document.querySelector(
              "#register-form div[id=account-error]"
            ).innerText = "帳號已經被註冊";
          }
        }
      })
      .catch(function (error) {
        console.log(error);
      });
  }
});

email.addEventListener("blur", function (e) {
  console.log("email success");
  if (!email.value.includes("@")) {
    email.classList.add("is-invalid");
    document.querySelector("#register-form div[id=email-error]").innerText =
      "請輸入有效的Email，例如：tofu@example.com";
  }
});

password.addEventListener("blur", function (e) {
  console.log("password success");
  if (!password.value) {
    password.classList.add("is-invalid");
    document.querySelector("#register-form div[id=password-error]").innerText =
      "請輸入密碼";
  }
});

confirmPassword.addEventListener("blur", function (e) {
  console.log("confirmPassword success");
  if (!confirmPassword.value) {
    confirmPassword.classList.add("is-invalid");
    document.querySelector(
      "#register-form div[id=confirm-password-error]"
    ).innerText = "請確認密碼";
  }

  if (password.value !== confirmPassword.value) {
    confirmPassword.classList.add("is-invalid");
    document.querySelector(
      "#register-form div[id=confirm-password-error]"
    ).innerText = "密碼檢測不符合，請重新輸入!";
  }
});

inputs.forEach(function (input) {
  input.addEventListener("input", function (e) {
    if (input.classList.contains("is-invalid")) {
      input.classList.remove("is-invalid");
    }
  });
});

termsAgreement.addEventListener("click", function (e) {
  if (termsAgreement.classList.contains("is-invalid")) {
    termsAgreement.classList.remove("is-invalid");
  }
});

registerButton.addEventListener("click", function (e) {
  e.preventDefault();

  if (!account.value) {
    account.classList.add("is-invalid");
    document.querySelector("#register-form div[id=account-error]").innerText =
      "請輸入帳號名稱";
  }

  if (!email.value.includes("@")) {
    email.classList.add("is-invalid");
    document.querySelector("#register-form div[id=email-error]").innerText =
      "請輸入有效的Email，例如：tofu@example.com";
  }

  if (!password.value) {
    password.classList.add("is-invalid");
    document.querySelector("#register-form div[id=password-error]").innerText =
      "請輸入密碼";
  }

  if (!confirmPassword.value) {
    confirmPassword.classList.add("is-invalid");
    document.querySelector(
      "#register-form div[id=confirm-password-error]"
    ).innerText = "請確認密碼";
  }

  if (password.value !== confirmPassword.value) {
    confirmPassword.classList.add("is-invalid");
    document.querySelector(
      "#register-form div[id=confirm-password-error]"
    ).innerText = "密碼檢測不符合，請重新輸入!";
  }

  if (!termsAgreement.checked) {
    termsAgreement.classList.add("is-invalid");
    document.querySelector(
      "#register-form div[id=terms-agreement-error]"
    ).innerText = "請勾選「我同意客戶服務條款」！";
  }

  console.log(account.value == "");
  console.log(email.value.includes("@") == false);
  console.log(password.value == "");
  console.log(confirmPassword.value == "");
  console.log(password.value !== confirmPassword.value);
  console.log(termsAgreement.checked == "");

  //   let cA = checkAccount(account.value);
  //   console.log(account.value);
  //   console.log(cA=="失敗");
  if (
    account.value == "" ||
    email.value.includes("@") == false ||
    password.value == "" ||
    confirmPassword.value == "" ||
    password.value !== confirmPassword.value ||
    termsAgreement.checked == ""
  ) {
    console.log("沒輸入欄位");
    document
      .querySelector("#register-form div[id=register-error]")
      .classList.remove("d-none");

    document.querySelector(
      "#register-form div[id=register-error-message]"
    ).innerText = "註冊資料有誤，請重新輸入正確的資料！";
  } else {
    axios
      .get(contextRoot + "/account/find/" + account.value)
      .then(function (response) {
        if (response.status == 200) {
          console.log(response.data);
          if (response.data) {
            console.log("二次判斷帳號已經被註冊");
            account.classList.add("is-invalid");
            document.querySelector(
              "#register-form div[id=account-error]"
            ).innerText = "帳號已經被註冊";
            console.log("測試1");

            document
              .querySelector("#register-form div[id=register-error]")
              .classList.remove("d-none");

            document.querySelector(
              "#register-form div[id=register-error-message]"
            ).innerText = "此帳號已被註冊，請重新輸入正確的資料！";

            // return;
          } else {
            console.log("submit成功");
            registerForm.submit();
          }
        }
      })
      .catch(function (error) {
        console.log(error);
      });

    // let cA = checkAccount(account.value);
    // if (cA=="失敗") {
    //     console.log("資料已存在，註冊失敗");
    // }else{
    // registerForm.submit();
    // console.log("布林判斷"  ,  cA == "成功");
    // }
  }
});
// email.value.includes("@") &&
// password.value &&
// confirmPassword.value &&
// password.value == confirmPassword.value &&
// termsAgreement.checked
