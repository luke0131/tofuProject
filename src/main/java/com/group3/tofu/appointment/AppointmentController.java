package com.group3.tofu.appointment;

import java.util.UUID;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group3.tofu.customer.service.MailService;

@Controller
public class AppointmentController {
	@Autowired
	private AppointmentService aService;
	@Autowired
	private MailService mailService;
	 
//	@ResponseBody
//	@GetMapping("/test/gg")
//	public Appointment add() {
//		Appointment app= new Appointment();
//		app.setCarmodel("no");
//		app.setContactperson("no");
//		app.setContacttime("no");
//		app.setCustomeremail("no");
//		app.setCustomermobile("no");
//		app.setCustomername("no");
//		app.setGender("no");
//		app.setInstalladdress("no");
//		app.setParkingtype("no");
//		app.setPrivacy("no");
//		app.setTerms("no");
//		app.setKeycode("no");
//		
//		Appointment amt = aService.saveAppointment(app);
//		return amt;
		
		@GetMapping("/app/inst")
	public ModelAndView installPage(ModelAndView mav) {
		Appointment appointment = new Appointment();
		mav.addObject("appointmentForm", appointment);
		mav.setViewName("appointment/install");
		return mav;
	}
		 @RequestMapping("/privacy")
		    public String privacy() {
		        return "appointment/privacy";
		    }
		 private String generateKeyCode() {
		        // 訂單號
		        return  UUID.randomUUID().toString().substring(0, 8);
		    }

		 @PostMapping("/install")
		 public String postAppointment(@ModelAttribute(name="appointmentForm")Appointment appointment,Model model) throws MessagingException {
			appointment.setKeycode(generateKeyCode());
			 aService.saveAppointment(appointment);
			 model.addAttribute("keycode",appointment.getKeycode());
			 
			
			 String to = appointment.getCustomeremail();
		        String subject = "預約確認";
		        String content = "<h2>您已成功預約！請查看以下訊息是否正確</h2><br/>"
		        +"<h4>您的訂單編號:</h4>"+appointment.getKeycode()+"<br/>"		
		        +"<h4>聯絡人:</h4>"+appointment.getContactperson()+"\n"
		        +"<h4>聯絡人電話:</h4>"+appointment.getContactmobile()+"\n"
		        +"<h4>安裝評估地址:</h4>"+appointment.getInstalladdress()+"\n"
		        +"<h5>我們將指派 TOFU 充電策略合作夥伴飛鴻電能 專業人員與您聯繫。</h5>\n"
		        +"<h5>若有任何問題，歡迎電洽飛鴻電能免付費客服專線 : 0800-888-168</h5>";
			 mailService.sendEmail(to, subject, content);
			 return "appointment/finish";
			
			  
			    
			    
			  
		 }
}
