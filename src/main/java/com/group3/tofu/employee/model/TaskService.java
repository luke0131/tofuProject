package com.group3.tofu.employee.model;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group3.tofu.book.model.Book;
import com.group3.tofu.book.model.BookDao;
import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.customer.model.CustomerDao;
import com.group3.tofu.maintenance.model.Maintenance;
import com.group3.tofu.maintenance.model.MaintenanceDao;
import com.group3.tofu.photo.model.Photo;
import com.group3.tofu.photo.model.PhotoDao;
import com.group3.tofu.product.model.Product;
import com.group3.tofu.product.model.ProductDao;

@Service
@Transactional(rollbackFor = { Exception.class })
public class TaskService {

	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private MaintenanceDao maintenanceDao;

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private PhotoDao photoDao;

	@Autowired
	private LeaveApplicationDao leaveApplicationDao;

	public Map<String, Integer> countWaitingAssignTasks() {

		Map<String, Integer> waitingCount = new HashMap<>();
		waitingCount.put("waitingBooks", bookDao.countBookWaiting());
		waitingCount.put("waitingMtns", maintenanceDao.countMtnBookWaiting());
		waitingCount.put("waitingTotal", bookDao.countBookWaiting() + maintenanceDao.countMtnBookWaiting());

		return waitingCount;
	}

	public Map<String, Integer> countWaitingTodoTasks(Integer eid) {

		Map<String, Integer> waitingTodoCount = new HashMap<>();
		waitingTodoCount.put("waitingBooks", bookDao.countBookAssigned(eid));
		waitingTodoCount.put("waitingMtns", maintenanceDao.countMtnAssigned(eid));
		waitingTodoCount.put("waitingTotal", bookDao.countBookAssigned(eid) + maintenanceDao.countMtnAssigned(eid));

		return waitingTodoCount;
	}

	public List<Book> findAllBooks() {
		return bookDao.findAll();
	}

	public List<Maintenance> findAllMtns() {
		return maintenanceDao.findAll();
	}

	public List<Maintenance> findMyMtnTodos(Integer eid) {
		return maintenanceDao.mtnAssigned(eid);
	}

	public List<Book> findMyBookTodos(Integer eid) {
		return bookDao.bookAssigned(eid);
	}

	public List<Customer> findAllCustomers() {
		return customerDao.findAll();
	}

	public List<Product> findAllProducts() {
		return productDao.findAll();
	}

	public boolean ifMtnExists(Integer mid) {
		return maintenanceDao.findById(mid) != null;
	}

	public boolean ifBookExists(Integer bid) {
		return bookDao.findById(bid) != null;
	}

	public Maintenance setEmployeeToMtnTask(Integer mid, Integer eid) {
		Optional<Maintenance> op = maintenanceDao.findById(mid);
		if (op.isPresent()) {
			Maintenance maintenance = op.get();

			if (eid != null) { 
				maintenance.setEid(eid);
				maintenance.setStatus("assigned");
				return maintenance;
			}
			return null;

		}
		return null;
	}

	public Book setEmployeeToBookTask(Integer bid, Integer eid) {
		Optional<Book> op = bookDao.findById(bid);
		if (op.isPresent()) {
			Book book = op.get();

			if (eid != null) {
				book.setF_employee_id(eid);
				book.setStatus("assigned");
				return book;
			}
			return null;

		}
		return null;
	}

	public Maintenance setClosedToMtnTask(Integer mid) {
		Optional<Maintenance> op = maintenanceDao.findById(mid);
		if (op.isPresent()) {
			Maintenance maintenance = op.get();
			maintenance.setStatus("closed");
			return maintenance;
		}
		return null;
	}

	public Book setClosedToBookTask(Integer bid) {
		Optional<Book> op = bookDao.findById(bid);
		if (op.isPresent()) {
			Book book = op.get();
			book.setStatus("closed");
			return book;
		}
		return null;
	}

	public Maintenance setDateToMtnTask(Integer mid, Date newDate) {
		Optional<Maintenance> op = maintenanceDao.findById(mid);
		if (op.isPresent()) {
			Maintenance maintenance = op.get();

			if (newDate != null) { 
				maintenance.setAppointment(newDate);
				return maintenance;
			}
			return null;

		}
		return null;
	}
	
	public Book setDateToBookTask(Integer bid, Date newDate) {
		Optional<Book> op = bookDao.findById(bid);
		if (op.isPresent()) {
			Book book = op.get();

			if (newDate != null) { 
				book.setBook_date(newDate);
				return book;
			}
			return null;

		}
		return null;
	}

	public List<Employee> getAvailableEmp(Date reseverdDate) {
		LocalDate reseverdLocalDate = convertToLocalDateViaInstant(reseverdDate);
		System.out.println(reseverdLocalDate);
		List<Employee> emplist = employeeDao.findAll();
		List<Employee> availableEmplist = new ArrayList<>();
		List<Integer> notAvailableIdList = leaveApplicationDao.findNotAvailableOnRD(reseverdLocalDate);
		List<Integer> allIdList = new ArrayList<>();
		System.out.println(notAvailableIdList);

		for (Employee emp : emplist) {
			allIdList.add(emp.getEid());
		}

		allIdList.removeAll(notAvailableIdList);

		for (Integer availableId : allIdList) {
			availableEmplist.add(employeeDao.findById(availableId).get());
		}
		return availableEmplist;
	}

	public LocalDate convertToLocalDateViaInstant(java.util.Date dateToConvert) {
		return dateToConvert == null ? null
				: LocalDate.ofInstant(Instant.ofEpochMilli(dateToConvert.getTime()), ZoneId.systemDefault());
	}

	public Maintenance findMtnById(Integer mid) {
		Optional<Maintenance> op = maintenanceDao.findById(mid);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}

	public Book findBookById(Integer bid) {
		Optional<Book> op = bookDao.findById(bid);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}

	public byte[] findPhotoByProductId(Integer pid) {

		List<Photo> allPhoto = photoDao.findAll();

		Integer photoId = null;
		for (Photo photo : allPhoto) {
			if (photo.getProduct().getProductId().equals(pid)) {
				photoId = photo.getPhotoId();
				return allPhoto.get(photoId).getPhoto();
			}
		}
		return null;
	}

}
