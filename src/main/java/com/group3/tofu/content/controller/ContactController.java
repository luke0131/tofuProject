package com.group3.tofu.content.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.group3.tofu.content.model.Contact;
import com.group3.tofu.content.service.ContactService;

@Controller
public class ContactController {
	
	@Autowired
	private ContactService contactService;

	@GetMapping("/listAllContact")
	public String getAllContact(Model model) {
		List<Contact> allContact = contactService.findAllContact();
		model.addAttribute("contactList", allContact);
		
		return "contact/contactUs"; 
	}
}
