package com.group3.tofu.employee.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group3.tofu.book.model.Book;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.employee.model.Employee;
import com.group3.tofu.employee.model.EmployeeService;
import com.group3.tofu.employee.model.TaskService;
import com.group3.tofu.maintenance.model.Maintenance;
import com.group3.tofu.product.model.Product;

@Controller
@RequestMapping(path = { "/employee/task" })
public class TaskController {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private TaskService taskService;


	@GetMapping("/management_mtn")
	public String toMtnTaskManagementPage() {
		return "employee/task_mtn_assign";
	}

	@GetMapping("/management_book")
	public String toBookTaskManagementPage() {
		return "employee/task_book_assign";
	}

	@GetMapping("/todo_mtn")
	public String toMtnTaskListPage() {
		return "employee/task_mtn_todo";
	}

	@GetMapping("/todo_book")
	public String toBookTaskListPage() {
		return "employee/task_book_todo";
	}

	@ResponseBody
	@GetMapping("/waiting_assign")
	public ResponseEntity<Map<String, Integer>> getWaitingAssignCount() {
		Map<String, Integer> waitingCount = taskService.countWaitingAssignTasks();
		return ResponseEntity.status(HttpStatus.OK).body(waitingCount);
	}

	@ResponseBody
	@GetMapping("/waiting_todo")
	public ResponseEntity<Map<String, Integer>> getWaitingTodoCount(Authentication authentication) {
		Integer eid = employeeService.findIdByName(authentication.getName());
		Map<String, Integer> waitingCount = taskService.countWaitingTodoTasks(eid);
		return ResponseEntity.status(HttpStatus.OK).body(waitingCount);
	}

	@ResponseBody
	@GetMapping("/mtnlist")
	public ResponseEntity<List<Maintenance>> getMtnRecord() {
		List<Maintenance> mtnRecord = taskService.findAllMtns();
		return ResponseEntity.status(HttpStatus.OK).body(mtnRecord);
	}

	@ResponseBody
	@GetMapping("/mtn_todolist")
	public ResponseEntity<List<Maintenance>> getMtnTodos(Authentication authentication) {
		Integer eid = employeeService.findIdByName(authentication.getName());
		List<Maintenance> mtnTodos = taskService.findMyMtnTodos(eid);
		return ResponseEntity.status(HttpStatus.OK).body(mtnTodos);
	}

	@ResponseBody
	@GetMapping("/booklist")
	public ResponseEntity<List<Book>> getBookRecord() {
		List<Book> bookRecord = taskService.findAllBooks();
		return ResponseEntity.status(HttpStatus.OK).body(bookRecord);
	}

	@ResponseBody
	@GetMapping("/book_todolist")
	public ResponseEntity<List<Book>> getBookTodos(Authentication authentication) {
		Integer eid = employeeService.findIdByName(authentication.getName());
		List<Book> bookTodos = taskService.findMyBookTodos(eid);
		return ResponseEntity.status(HttpStatus.OK).body(bookTodos);
	}

	@ResponseBody
	@GetMapping("/available_emplist/mtn/{mid}")
	public ResponseEntity<List<Employee>> getMtnAvailableEmpList(@PathVariable(name = "mid") Integer mid) {

		Maintenance mtn = taskService.findMtnById(mid);
		List<Employee> emplist = taskService.getAvailableEmp(mtn.getAppointment());
		return ResponseEntity.status(HttpStatus.OK).body(emplist);
	}

	@ResponseBody
	@GetMapping("/available_emplist/book/{bid}")
	public ResponseEntity<List<Employee>> getBookAvailableEmpList(@PathVariable(name = "bid") Integer bid) {

		Book book = taskService.findBookById(bid);
		System.out.println(book.getBook_date());
		List<Employee> emplist = taskService.getAvailableEmp(book.getBook_date());
		return ResponseEntity.status(HttpStatus.OK).body(emplist);
	}

	@ResponseBody
	@PutMapping("/management_mtn/{mid}")
	public ResponseEntity<List<Maintenance>> assignEmployeeToMtn(@PathVariable(name = "mid") Integer mid,
			@RequestBody Maintenance maintenance) {

		if (taskService.ifMtnExists(mid)) {
			taskService.setEmployeeToMtnTask(mid, maintenance.getEid());
		}

		List<Maintenance> mtnlist = taskService.findAllMtns();

		return ResponseEntity.status(HttpStatus.OK).body(mtnlist);
	}

	@ResponseBody
	@PutMapping("/management_book/{bid}")
	public ResponseEntity<List<Book>> assignEmployeeToBook(@PathVariable(name = "bid") Integer bid,
			@RequestBody Book book) {

		if (taskService.ifBookExists(bid)) {
			taskService.setEmployeeToBookTask(bid, book.getF_employee_id());
		}

		List<Book> booklist = taskService.findAllBooks();

		return ResponseEntity.status(HttpStatus.OK).body(booklist);
	}
	
	@ResponseBody
	@PutMapping("/management_mtn/finished/{mid}")
	public ResponseEntity<List<Maintenance>> setClosedToMtn(@PathVariable(name = "mid") Integer mid, Authentication authentication) {
		
		if (taskService.ifMtnExists(mid)) {
			taskService.setClosedToMtnTask(mid);
		}
		
		Integer eid = employeeService.findIdByName(authentication.getName());
		List<Maintenance> mtnTodos = taskService.findMyMtnTodos(eid);

		return ResponseEntity.status(HttpStatus.OK).body(mtnTodos);
	}
	
	@ResponseBody
	@PutMapping("/management_book/finished/{bid}")
	public ResponseEntity<List<Book>> setClosedToBook(@PathVariable(name = "bid") Integer bid, Authentication authentication) {
		
		if (taskService.ifBookExists(bid)) {
			taskService.setClosedToBookTask(bid);
		}
		
		Integer eid = employeeService.findIdByName(authentication.getName());
		List<Book> bookTodos = taskService.findMyBookTodos(eid);

		return ResponseEntity.status(HttpStatus.OK).body(bookTodos);
	}

	@ResponseBody
	@GetMapping("/customerlist")
	public ResponseEntity<List<Customer>> getCustomerList() {
		List<Customer> cuslist = taskService.findAllCustomers();
		return ResponseEntity.status(HttpStatus.OK).body(cuslist);
	}

	@ResponseBody
	@GetMapping("/productlist")
	public ResponseEntity<List<Product>> getProductList() {
		List<Product> productlist = taskService.findAllProducts();
		return ResponseEntity.status(HttpStatus.OK).body(productlist);
	}


}
