/**
 * 寫JavaScript Login相關語法
 */
const email = document.querySelector("#email");
const password = document.querySelector("#password");
const loginForm = document.querySelector("#login-form");
const loginButton = document.querySelector("#login-button"); 

const inputs = [email , password];


// 增加email的游標事件
email.addEventListener("blur" , function(e){
    if( ! email.value.includes("@")){ //如果不是email的話
        email.classList.add("is-invalid");
        document.querySelector("#login-form div[id=email-error]").innerText = "請輸入有效的Email，例如：tofu@example.com"
    }
});

//增加password的游標事件
password.addEventListener("blur" , function(e){
    if( ! password.value ){ //如果password為空值
        password.classList.add("is-invalid");
        document.querySelector("#login-form div[id=password-error]").innerText = "請輸入密碼"
    }
});

//依序檢查有沒有將input欄位輸入，將原來的特性做改變
inputs.forEach(function (input){
    input.addEventListener("input" , function(e){ 
        if(input.classList.contains("is-invalid")){
            input.classList.remove("is-invalid");
        }
    })
});

//當我按下去登入的那一瞬間，會同時觸發點擊事件
//檢查我每一個欄位是否都有輸入到東西!

loginButton.addEventListener("click" , function(e){
    e.preventDefault();

    if( ! email.value.includes("@")){ //如果不是email的話
        email.classList.add("is-invalid");
        document.querySelector("#login-form div[id=email-error]").innerText = "請輸入有效的Email，例如：tofu@example.com"
    }

    if( ! password.value ){ //如果password為空值
        password.classList.add("is-invalid");
        document.querySelector("#login-form div[id=password-error]").innerText = "請輸入密碼"
    }

    //如果全部空格都有填滿，就可以按submit
    if(email.value.includes("@") && password.value){
        loginForm.submit();
    }

});

document.querySelector("body").addEventListener("click" , function(e){
    console.log("test");
    document.querySelector("#check-login").classList.add("d-none");
    document.querySelector("#check-enabled").classList.add("d-none");
});