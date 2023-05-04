package com.group3.tofu.appointment;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppointmentController {
	@Autowired
	private AppointmentService aService;
	
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
		 public String postAppointment(@ModelAttribute(name="appointmentForm")Appointment appointment,Model model) {
			appointment.setKeycode(generateKeyCode());
			 aService.saveAppointment(appointment);
			 model.addAttribute("keycode",appointment.getKeycode());
			 return "appointment/finish";
			
			  
			    
			    
			  
		 }
}
