package com.group3.tofu.maintenance;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MaintenanceController {
	@Autowired
	private MaintenanceService mService;
//	@ResponseBody
//	@GetMapping("/test/tt")
//	public Maintenance add() {
//		Maintenance ms = new Maintenance();
//		ms.setCid(1);
//		ms.setEid(1);
//		ms.setMcategory("幹");
//		ms.setNote("e04");
//		ms.setPid(1);
//		Maintenance mst=mService.insertMaintenance(ms);
//		
//		return mst;
//	}
	@GetMapping("/main/add")
	public ModelAndView showPage(ModelAndView mav) {
		Maintenance maintenance = new Maintenance();
		mav.addObject("maintenanceForm",maintenance);
		mav.setViewName("maintenance/add");
		return mav;
		
	}
	
	@PostMapping("/main")
	public String postMaintenance(@ModelAttribute(name="maintenanceForm")Maintenance maintenance,Model model ) {
		mService.insertMaintenance(maintenance);
		
		LocalDateTime appointmentDateTime = LocalDateTime.ofInstant(maintenance.getAppointment().toInstant(), ZoneId.systemDefault());
		String formattedDate = appointmentDateTime.format(DateTimeFormatter.ofPattern("yyyy/MM/dd a hh:mm"));
		

		model.addAttribute("formattedDate",formattedDate);
	    
	    return "maintenance/success";
	}
	
}
