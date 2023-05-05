/**
 * 
 */
const userName = document.querySelector("#userName");
const email = document.querySelector("#email");
const phoneNumber = document.querySelector("#phoneNumber");

const sendButton = document.querySelector("#sendButton");
const inputs = [userName , email ,phoneNumber ];


// 增加userName的游標事件
userName.addEventListener("blur" , function(e){
  if( ! userName.value){ //如果不是姓名的話
    userName.classList.add("is-invalid");
      document.querySelector("#form div[id=userName-error").innerText = "請輸入您的大名"
  }
});

// 增加email的游標事件
email.addEventListener("blur" , function(e){
  if( ! email.value.includes("@")){ //如果不是email的話
      email.classList.add("is-invalid");
      document.querySelector("#form div[id=email-error]").innerText = "請輸入有效的Email，例如：tofu@example.com"
  }
});

// 增加phoneNumber的游標事件
phoneNumber.addEventListener("blur" , function(e){
  if( ! phoneNumber.value.includes("-")){ //如果不是phoneNumber的話
    phoneNumber.classList.add("is-invalid");
      document.querySelector("#form div[id=phoneNumber-error]").innerText = "請輸入有效的電話號碼，例如：0912-345-678"
  }
});




//依序檢查有沒有將input欄位輸入
inputs.forEach(function (input){
  input.addEventListener("input" , function(e){ 
      if(input.classList.contains("is-invalid")){
          input.classList.remove("is-invalid");
      }
  })
});







//當我按下去登入的那一瞬間，會同時觸發點擊事件
//檢查我每一個欄位是否都有輸入到東西!

sendButton.addEventListener("click" , function(e){
  e.preventDefault();

  if( ! userName.value){ //如果不是姓名的話
    userName.classList.add("is-invalid");
      document.querySelector("#form div[id=userName-error]").innerText = "請輸入您的大名"
  }

  if( ! email.value.includes("@")){ //如果不是email的話
    email.classList.add("is-invalid");
    document.querySelector("#form div[id=email-error]").innerText = "請輸入有效的Email，例如：tofu@example.com"
}


if( ! phoneNumber.value.includes("-")){ //如果不是phoneNumber的話
  phoneNumber.classList.add("is-invalid");
    document.querySelector("#form div[id=phoneNumber-error]").innerText = "請輸入有效的電話號碼，例如：0912-345-678"
}
  
  //如果全部空格都有填滿，就可以按submit
  if(userName.value && email.value.includes("@") && phoneNumber.value.includes("-")){
    form.submit();
  }
});

document.querySelector("body").addEventListener("click" , function(e){
  console.log("test");
  document.querySelector("#check-login").classList.add("d-none");
});