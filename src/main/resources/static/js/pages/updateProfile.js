/**
 *  製作按出送出後會有跳出成功的視窗
 */
 
		const updateButton= document.querySelector("#updateButton")
		
		console.log("submitfunction");
		
		updateButton.addEventListener("submit" , function(){
			
			document
      			.querySelector("#updateForm div[id=updateSuccess]")
      			.classList.remove("d-none");

    		document.querySelector("#updateForm div[id=updateSuccessMessage]"
    		).innerText = "修改成功!";
			

		});
		
		console.log("測試有進來嗎");
		
		document.querySelector("body").addEventListener("click",function (e) {
			console.log("test");
			document.querySelector("#updateSuccess").classList.add("d-none");
  		},
  			//true
		);