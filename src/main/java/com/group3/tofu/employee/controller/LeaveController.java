package com.group3.tofu.employee.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.employee.model.Employee;
import com.group3.tofu.employee.model.EmployeeService;
import com.group3.tofu.employee.model.Leave;
import com.group3.tofu.employee.model.LeaveApplication;
import com.group3.tofu.employee.model.LeaveApplicationService;

@Controller
@RequestMapping(path = { "/employee/leave" })
public class LeaveController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private LeaveApplicationService leaveApplicationService;

	@GetMapping("/application")
	public String toLeaveFormPage() {
		return "employee/leave_form";
	}

	@GetMapping("/approval")
	public String toApprovalPage() {
		return "employee/leave_approval";
	}

	@ResponseBody
	@GetMapping("/my_info")
	public ResponseEntity<Employee> getMyInfo(Authentication authentication) {
		Integer eid = employeeService.findIdByName(authentication.getName());
		Employee currentEmp = employeeService.findEmployeeById(eid);
		return ResponseEntity.status(HttpStatus.OK).body(currentEmp);
	}

	@ResponseBody
	@PostMapping("/application")
	public ResponseEntity<Map<String, String>> submitLeaveForm(@RequestBody LeaveApplication leaveapplication, Authentication authentication) {

		Map<String, String> messages = new HashMap<>();

		Integer eid = employeeService.findIdByName(authentication.getName());
		Employee currentEmp = employeeService.findEmployeeById(eid);
		
		if (leaveapplication.getLeave().getLid() != null && leaveapplication.getBeginDate() != null && leaveapplication.getEndDate() != null) {
			
			Leave leaveCat = leaveApplicationService.findLeaveById(leaveapplication.getLeave().getLid());
			
			LocalDate localDateBegin = leaveapplication.getBeginDate();
			LocalDate localDateEnd = leaveapplication.getEndDate();
			
			
			LeaveApplication lapp = new LeaveApplication();
			long dayslong = localDateBegin.until(localDateEnd.plusDays(1), ChronoUnit.DAYS);
			Integer days = Integer.parseInt(String.valueOf(dayslong));

			boolean ifAvailable = leaveApplicationService.checkIfThereAreLeftAnnualDays(currentEmp, days);
			boolean ifTaken = leaveApplicationService.ifDateIsAlreadyTaken(localDateBegin, eid);
				
			
			if (ifTaken == false) {
				
				if (localDateBegin != null && localDateEnd != null && localDateBegin.isAfter(localDateEnd) != true) {
					
					if (leaveCat.getLeaveCategory() != null && leaveCat.getLeaveCategory().equals("特別休假")) {
						
						if (ifAvailable == true) {
							lapp.setEmployee(currentEmp);
							lapp.setLeave(leaveCat);
							lapp.setBeginDate(localDateBegin);
							lapp.setEndDate(localDateEnd);
							lapp.setLeaveDays(days);
							if (leaveapplication.getLeaveReason() != "" && leaveapplication.getLeaveReason() != null) {
								lapp.setLeaveReason(leaveapplication.getLeaveReason());
							}
							
							if (leaveapplication.getFileAttached() != null) {

								try {
									lapp.setFileAttached(leaveapplication.getFileAttached());
								} catch (Exception e) {
									System.out.println("Error");
								}

							} else {
								lapp.setFileAttached(null);
							}

							leaveApplicationService.newLeaveApp(lapp);
							messages.put("submitResult", "您已成功提交請假申請。");
							return ResponseEntity.status(HttpStatus.OK).body(messages);
						} else { 
							String failMessage = "剩餘特休天數不足。";
							messages.put("submitResult", failMessage);
							return ResponseEntity.status(HttpStatus.OK).body(messages);
						}
						
					} else { 
						
						lapp.setEmployee(currentEmp);
						lapp.setLeave(leaveCat);
						lapp.setBeginDate(localDateBegin);
						lapp.setEndDate(localDateEnd);
						lapp.setLeaveDays(days);
						if (leaveapplication.getLeaveReason() != "" && leaveapplication.getLeaveReason() != null) {
							lapp.setLeaveReason(leaveapplication.getLeaveReason());
						}
						
						if (leaveapplication.getFileAttached() != null) {

							try {
								lapp.setFileAttached(leaveapplication.getFileAttached());
							} catch (Exception e) {
								System.out.println("Error");
							}

						} else {
							lapp.setFileAttached(null);
						}

						leaveApplicationService.newLeaveApp(lapp);
						messages.put("submitResult", "您已成功提交請假申請。");
						return ResponseEntity.status(HttpStatus.OK).body(messages);
					}
				
				} else {  
					String failMessage = "請確認您的請假天數大於 0 日。";
					messages.put("submitResult", failMessage);
					return ResponseEntity.status(HttpStatus.OK).body(messages);
				}
				
			} else {
				String failMessage = "此日期期間已提出過請假申請。";
				messages.put("submitResult", failMessage);
				return ResponseEntity.status(HttpStatus.OK).body(messages);
			}
			
		} else {
			String failMessage = "請檢查是否有漏填欄位。";
			messages.put("submitResult", failMessage);
			return ResponseEntity.status(HttpStatus.OK).body(messages);
		}


	}

	@ResponseBody
	@GetMapping("/leaveCat")
	public ResponseEntity<List<Leave>> getLeaveAvailable(Authentication authentication) {

		Integer eid = employeeService.findIdByName(authentication.getName());
		Employee currentEmp = employeeService.findEmployeeById(eid);
		List<Leave> leavelist = leaveApplicationService.getAvailableLeaveCat(currentEmp);

		return ResponseEntity.status(HttpStatus.OK).body(leavelist);
	}

	@ResponseBody
	@GetMapping("/waitinglist")
	public ResponseEntity<List<LeaveApplication>> getWaitingList() {
		List<LeaveApplication> waitingApprovalList = leaveApplicationService.findWaitingApprovalList();
		return ResponseEntity.status(HttpStatus.OK).body(waitingApprovalList);
	}

	@ResponseBody
	@GetMapping("/processedlist")
	public ResponseEntity<List<LeaveApplication>> getProcessedList() {
		List<LeaveApplication> processedList = leaveApplicationService.findApprovedOrRejectedList();
		return ResponseEntity.status(HttpStatus.OK).body(processedList);
	}

	@ResponseBody
	@GetMapping("/my_leave_application")
	public ResponseEntity<List<LeaveApplication>> getmyLeaveApplication(Authentication authentication) {
		Integer eid = employeeService.findIdByName(authentication.getName());
		List<LeaveApplication> myAppList = leaveApplicationService.findLeaveAppByEid(eid);
		return ResponseEntity.status(HttpStatus.OK).body(myAppList);
	}

	@ResponseBody
	@PutMapping("/approve/{appid}")
	public ResponseEntity<LeaveApplication> approve(@PathVariable(name = "appid") Integer appid) {

		LeaveApplication leaveApp = null;
		if (leaveApplicationService.exists(appid)) {
			leaveApp = leaveApplicationService.approveLeaveApplication(appid);
			return ResponseEntity.status(HttpStatus.OK).body(leaveApp);
		}
		return null;
	}

	@ResponseBody
	@PutMapping("/reject/{appid}")
	public ResponseEntity<LeaveApplication> reject(@PathVariable(name = "appid") Integer appid) {

		LeaveApplication leaveApp = null;
		if (leaveApplicationService.exists(appid)) {
			leaveApp = leaveApplicationService.rejectLeaveApplication(appid);
			return ResponseEntity.status(HttpStatus.OK).body(leaveApp);
		}
		return null;
	}


}
