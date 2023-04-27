package com.group3.tofu.content.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.group3.tofu.content.model.Contact;
import com.group3.tofu.content.service.ContactService;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactService;

	//跳轉到聯絡我們頁面
	@GetMapping("")
	public String getAllContact(Model model) {
		List<Contact> allContact = contactService.findAllContact();
		model.addAttribute("contactList", allContact);
		
		return "contact/contactUs"; 
	}
	
	//跳轉到成功來信頁面
	@PostMapping("/sucessContact")
	  public String showSucessPage() {
	    return "contact/sucessContact";
	  }
	
	//跳轉到聯絡我們頁面
	@GetMapping("/contactUs")
	public String contactUs() {
		return "contact/contactUs";
	}
	
	//跳轉到留言板頁面(還要思考)
	@GetMapping("/comment")
	public String findAllComment() {
		return "comment/comment";
	}
	
	
}
