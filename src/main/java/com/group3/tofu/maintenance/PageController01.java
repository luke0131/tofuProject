package com.group3.tofu.maintenance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController01 {
	//跳轉保養介紹頁面
	@GetMapping("/introduce")
	public String introduce() {
		return "maintenance/introduce";
	}
    //跳轉預約保養頁面	
//	@GetMapping("/main")
//	public String showNextPage() {
//		return "maintenance/add";
//	}
	//跳轉安裝介紹頁面
	@GetMapping("/show")
	public String install() {
		return "appointment/show";
	}
	//跳轉預約安裝評估頁面
	@GetMapping("/install")
	public String assess() {
		return "appointment/install";
	}

}
