package com.group3.tofu.employee.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.employee.model.CheckDto;
import com.group3.tofu.employee.model.CheckSearchVO;
import com.group3.tofu.employee.model.CheckService;
import com.group3.tofu.employee.model.Checks;
import com.group3.tofu.employee.model.Employee;
import com.group3.tofu.employee.model.EmployeeSearchVO;
import com.group3.tofu.employee.model.EmployeeService;


@Controller
@RequestMapping(path = { "/employee" })
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private CheckService checkService;

	@GetMapping("/")
	public String toEmployeePage() {
		return "employee/mainpage";
	}

	@GetMapping("/edit_my_profile")
	public String toEditPage() {
		return "employee/edit_profile";
	}

	@GetMapping("/check")
	public String toCheckInPage() {
		return "employee/checkin";
	}

	@GetMapping("/allcheckin")
	public String toCheckRecordPage() {
		return "employee/check_record";
	}


	@ResponseBody
	@GetMapping("/allJson")
	public List<Employee> listAllJson(Model model) {

		List<Employee> employeeList = employeeService.findAll();
		model.addAttribute("employeeList", employeeList);

		return employeeList;
	}

	@GetMapping("/getEmployeePhoto/{eid}")
	public ResponseEntity<byte[]> getEmployeePhotoByEID(@PathVariable Integer eid) {

		Employee employee = employeeService.findEmployeeById(eid);
		byte[] empPhoto = employee.getPhoto();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(empPhoto, headers, HttpStatus.OK);

	}

	@GetMapping("/edit/{id}")
	public String toEmployeeEditPage(@PathVariable(name = "id") Integer id, Model model) {
		Employee employee = employeeService.findEmployeeById(id);
		model.addAttribute("employee", employee);
		return "employee/employee_update";
	}

	@ResponseBody
	@GetMapping("/findemp/{id}")
	public Employee findById(@PathVariable(name = "id") Integer id, Model model) {
		Employee employee = employeeService.findEmployeeById(id);
		model.addAttribute("employee", employee);
		return employee;
	}

	@ResponseBody
	@PutMapping("/edit/{id}")
	public ResponseEntity<Employee> putEditEmployee(@PathVariable("id") Integer id, @RequestBody Employee emp) {


		employeeService.updateEmployeeById(id, emp);

		return ResponseEntity.ok(emp);
	}

	@ResponseBody
	@DeleteMapping("/delete/{id}")
	public String remove(@PathVariable(name = "id") Integer id) {

		if (employeeService.exists(id)) {
			employeeService.deleteEmployeeById(id);
		}
		System.out.println("有呼叫到刪除功能唷");
		return "delete function called";
	}

	@GetMapping("/all")
	public String listAllEmployee() {
		return "employee/employees";
	}


	@GetMapping("/create")
	public String toEmployeeCreatePage() {
		return "employee/employee_create";
	}

	@PostMapping("/create")
	public String createEmployee(@RequestBody Employee emp, Model model) {

		employeeService.addAnNewEmployee(emp);

		Employee employee = new Employee();

		List<Employee> employeeList = employeeService.findAll();
		model.addAttribute("employeeList", employeeList);

		return "redirect:/employee/all";
	}

	@ResponseBody
	@GetMapping("/search")
	public List<Employee> searchEmp(@RequestParam(value = "firstName", required = false) String firstName,
			@RequestParam(value = "lastName", required = false) String lastName,
			@RequestParam(value = "hireDateStart", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate hireDateStart,
			@RequestParam(value = "hireDateEnd", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate hireDateEnd,
			@RequestParam(value = "department", required = false) String department,
			@RequestParam(value = "position", required = false) String position,
			@RequestParam(value = "salaryMin", required = false) Integer salaryMin,
			@RequestParam(value = "salaryMax", required = false) Integer salaryMax,
			@RequestParam(defaultValue = "1", value = "pageNumber") Integer pageNumber,
			@RequestParam(defaultValue = "5", value = "pageSize") Integer pageSize) throws Exception {

		EmployeeSearchVO searchEmp = new EmployeeSearchVO(firstName, lastName, hireDateStart, hireDateEnd, department,
				position, salaryMin, salaryMax);
		Page<Employee> resultPage = employeeService.searchEmployee(pageNumber, pageSize, searchEmp);
		List<Employee> resultEmpList = resultPage.getContent();

		return resultEmpList;
	}

	@ResponseBody
	@GetMapping("/todayscheck")
	public ResponseEntity<Checks> ifCheckedToday(Authentication authentication) {

		Integer eid = employeeService.findIdByName(authentication.getName());
		Checks todaysCheck = checkService.findTodaysCheck(eid);

		return ResponseEntity.status(HttpStatus.OK).body(todaysCheck);
	}

	@ResponseBody
	@GetMapping("/checks")
	public ResponseEntity<List<Checks>> getChecksByEmpId(Authentication authentication) {
		Integer eid = employeeService.findIdByName(authentication.getName());
		Employee employee = employeeService.findEmployeeById(eid);
		List<Checks> checks = employee.getChecks();
		return ResponseEntity.status(HttpStatus.OK).body(checks);
	}


	@ResponseBody
	@GetMapping("/checkrecord")
	public ResponseEntity<List<CheckDto>> getCheckRecord() {
		List<Employee> emplist = employeeService.findAll();
		List<CheckDto> checkDtoList = new ArrayList<>();

		for (Employee emp : emplist) {

			for (Checks check : emp.getChecks()) {

				CheckDto checkDto = new CheckDto(check.getCid(), emp.getEid(), emp.getFirstName(), emp.getLastName(),
						check);
				checkDtoList.add(checkDto);
			}

		}


		return ResponseEntity.status(HttpStatus.OK).body(checkDtoList);
	}

	@ResponseBody
	@PostMapping("/check")
	public ResponseEntity<List<Checks>> addAnCheckIn(@RequestBody Checks checks, Authentication authentication) {

		Integer eid = employeeService.findIdByName(authentication.getName());
		Employee employee = employeeService.findEmployeeById(eid);
		checkService.addAnNewCheck(eid, checks.getCheckInTime());
		List<Checks> allChecks = employee.getChecks();

		return ResponseEntity.status(HttpStatus.OK).body(allChecks);
	}

	@ResponseBody
	@PutMapping("/check")
	public ResponseEntity<List<Checks>> addAnCheckOut(@RequestBody Checks checks, Authentication authentication) {

		Integer eid = employeeService.findIdByName(authentication.getName());
		checkService.updateCheckOutTime(eid, checks.getCheckOutTime());
		Employee employee = employeeService.findEmployeeById(eid);
		List<Checks> allChecks = employee.getChecks();

		return ResponseEntity.status(HttpStatus.OK).body(allChecks);
	}

	@ResponseBody
	@GetMapping("/search_check")
	public List<Checks> searchChecks(@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "checkDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate checkDate,
			@RequestParam(value = "checkInTime", required = false) @DateTimeFormat(pattern = "HH:mm:ss") LocalTime checkInTime,
			@RequestParam(value = "checkOutTime", required = false) @DateTimeFormat(pattern = "HH:mm:ss") LocalTime checkOutTime,
			@RequestParam(defaultValue = "1", value = "pageNumber") Integer pageNumber,
			@RequestParam(defaultValue = "20", value = "pageSize") Integer pageSize) throws Exception {

		CheckSearchVO searchCheck = new CheckSearchVO(name, checkDate, checkInTime, checkOutTime);
		Page<Checks> resultPage = checkService.searchChecks(pageNumber, pageSize, searchCheck);
		List<Checks> resultEmpList = resultPage.getContent();

		return resultEmpList;
	}
	
	@ResponseBody
	@GetMapping("/sales")
	public ResponseEntity<Map<String, List<?>>> getSalesData() {
		
		List<Employee> empList = employeeService.findAll();
		Map<String, List<?>> salesData = new HashMap<>();
		
		List<Integer> eidList = new ArrayList<>();
		List<String> nameList = new ArrayList<>();
		List<Integer> salesList = employeeService.getSalesOfEmp();
		
		for (Employee emp :empList) {
			eidList.add(emp.getEid());
			nameList.add(emp.getFirstName() + " " + emp.getLastName());
		}
		
		
		salesData.put("eid", eidList);
		salesData.put("name", nameList);
		salesData.put("sales", salesList);
		return ResponseEntity.status(HttpStatus.OK).body(salesData);
	}
	
	
}
