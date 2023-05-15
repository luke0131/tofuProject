package com.group3.tofu.content.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.group3.tofu.content.model.Contact;
import com.group3.tofu.content.service.ContactService;
import com.group3.tofu.customer.service.MailService;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactService;
	
	@Autowired
	private MailService mailService;

	//跳轉到聯絡我們頁面
	@GetMapping("")
	public String getAllContact(Model model) {
		List<Contact> allContact = contactService.findAllContact();
		model.addAttribute("contactList", allContact);
		
		return "contact/contactUs"; 
	}
	
	//跳轉到成功來信頁面
	@GetMapping("/sucessContact")
	  public String showSucessPage() {
	    return "contact/sucessContact";
	  }
	
	//跳轉到聯絡我們頁面
	@GetMapping("/contactUs")
	public String contactUs() {
		return "contact/contactUs";
	}
	
	
//	@PostMapping("/sucessContact")
//	public String insert(@RequestBody ContactDTO contactDTO) {
//		
//		String newEmail = contactDTO.getEmail();
//		String newSubject = contactDTO.getSubject();
//		String newContent = contactDTO.getContent();
//		
//		Contact newContact = new Contact();
//		newContact.setEmail(newEmail);
//		newContact.setEmail_subject(newSubject);
//		newContact.setEmail_content(newContent);
//		
//		contactService.sendContactEmail(newContact);
//		
//		return "contact/sucessContact";
//	}
	
	@PostMapping("/sucessContact")
	public String sucessContact(@ModelAttribute(name = "fromcontact") Contact contact,
			Model model) {
		
		
		
		String to = contact.getEmail();
		String subject = "謝謝您的來信";
		String content = "<h3>感謝您的來信</h3><br/>";
		
		
		contactService.saveContact(contact);
		
		mailService.sendEmail(to, subject, content);
		
		return "contact/sucessContact";
		
	}
	
	
	
}
