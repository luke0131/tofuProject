package com.group3.tofu.employee.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

import com.group3.tofu.employee.model.Employee;
import com.group3.tofu.employee.model.EmployeeService;

@Controller
@RequestMapping(path = { "/employee" })
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@GetMapping("/")
	public String toEmployeePage() {
		return "employee/employee";
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

		if(employeeService.exists(id)) {
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

}
