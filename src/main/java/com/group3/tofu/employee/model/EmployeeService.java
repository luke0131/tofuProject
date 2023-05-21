package com.group3.tofu.employee.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group3.tofu.book.model.Book;
import com.group3.tofu.book.model.BookDao;
import com.group3.tofu.maintenance.model.Maintenance;
import com.group3.tofu.maintenance.model.MaintenanceDao;
import com.group3.tofu.order.model.dao.OrderDAO;

@Service
@Transactional(rollbackFor = { Exception.class })
public class EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private BookDao bookDao;

	@Autowired
	private MaintenanceDao maintenanceDao;
	
	@Autowired
	private OrderDAO orderDao;

	public long countBookTask() {
		return bookDao.count();
	}

	public long countMtnTask() {
		return maintenanceDao.count();
	}

	public List<Book> findAllBooks() {
		return bookDao.findAll();
	}
	
	public List<Maintenance> findAllMtns() {
		return maintenanceDao.findAll();
	}

	public void addAnNewEmployee(Employee emp) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // 密碼加密
		emp.setPassword("{bcrypt}" + passwordEncoder.encode(emp.getPassword())); // 以加密後的密碼覆蓋原輸入的密碼
		employeeDao.save(emp);
	}

	public Employee findEmployeeById(Integer id) {
		Optional<Employee> op = employeeDao.findById(id);

		if (op.isPresent()) {
			return op.get();
		}

		return null;
	}

	public void deleteEmployeeById(Integer id) {
		employeeDao.deleteById(id);
	}

	public List<Employee> findAll() {
		return employeeDao.findAll();
	}

	public boolean exists(Integer id) {
		return employeeDao.findById(id) != null;
	}

	public Employee updateEmployeeById(Integer id, Employee emp) {

		Optional<Employee> option = employeeDao.findById(id);
		if (option.isPresent()) {
			Employee employee = option.get();
			
			if (emp.getPassword().equals(employee.getPassword())) {
				employee.setPassword(emp.getPassword());
			} else {
				PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // 密碼加密
				employee.setPassword("{bcrypt}" + passwordEncoder.encode(emp.getPassword())); // 以加密後的密碼覆蓋原輸入的密碼
			}
			
			employee.setEid(emp.getEid());
			employee.setFirstName(emp.getFirstName());
			employee.setLastName(emp.getLastName());
			employee.setAccount(emp.getAccount());
			employee.setGender(emp.getGender());
			employee.setBirthday(emp.getBirthday());
			employee.setEmail(emp.getEmail());
			employee.setPhone(emp.getPhone());
			employee.setDepartment(emp.getDepartment());
			employee.setPosition(emp.getPosition());
			employee.setHireDate(emp.getHireDate());
			employee.setSalary(emp.getSalary());
			employee.setEnabled(emp.getEnabled());
			employee.setAuthority(emp.getAuthority());
			employee.setPhoto(emp.getPhoto());

			employeeDao.save(employee);
			return employee;
		}

		return null;

	}

	public Page<Employee> searchEmployee(Integer pageNumber, int size, EmployeeSearchVO searchEmp) throws Exception {

		Pageable pageable = PageRequest.of(pageNumber - 1, size, Sort.by(Direction.ASC, "eid"));

		Specification<Employee> specification = new Specification<Employee>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Employee> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder cb) {

				List<Predicate> list = new ArrayList<>();

				if (StringUtils.isNotBlank(searchEmp.getName())) {
					list.add(cb.or(cb.like(root.get("firstName").as(String.class), "%" + searchEmp.getName() + "%"), cb.like(root.get("lastName").as(String.class), "%" + searchEmp.getName() + "%")));
				}

				if (searchEmp.getHireDateStart() != null && !"".equals(searchEmp.getHireDateStart().toString())) {

					list.add(cb.greaterThanOrEqualTo(root.get("hireDate").as(LocalDate.class),
							searchEmp.getHireDateStart()));
				}
				if (searchEmp.getHireDateEnd() != null && !"".equals(searchEmp.getHireDateEnd().toString())) {

					list.add(
							cb.lessThanOrEqualTo(root.get("hireDate").as(LocalDate.class), searchEmp.getHireDateEnd()));
				}

				if (StringUtils.isNotBlank(searchEmp.getPosition())) {
					list.add(cb.equal(root.get("position").as(String.class), searchEmp.getPosition()));
				}

				if (StringUtils.isNotBlank(searchEmp.getDepartment())) {
					list.add(cb.equal(root.get("department").as(String.class), searchEmp.getDepartment()));
				}

				if (searchEmp.getSalaryMin() != null && !"".equals(searchEmp.getSalaryMin().toString())) {
					list.add(cb.greaterThanOrEqualTo(root.get("salary").as(Integer.class), searchEmp.getSalaryMin()));
				}
				if (searchEmp.getSalaryMax() != null && !"".equals(searchEmp.getSalaryMax().toString())) {
					list.add(cb.lessThanOrEqualTo(root.get("salary").as(Integer.class), searchEmp.getSalaryMax()));
				}

				return criteriaQuery.where(list.toArray(new Predicate[list.size()])).getRestriction();
			}
		};

		Page<Employee> resultPage = employeeDao.findAll(specification, pageable);
		return resultPage;

	}
	
	public List<Employee> searchEmployeeWithoutPage(EmployeeSearchVO searchEmp) throws Exception {

		Specification<Employee> specification = new Specification<Employee>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Employee> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder cb) {

				List<Predicate> list = new ArrayList<>();

				if (StringUtils.isNotBlank(searchEmp.getName())) {
						list.add(cb.or(cb.like(root.get("firstName").as(String.class), "%" + searchEmp.getName() + "%"), cb.like(root.get("lastName").as(String.class), "%" + searchEmp.getName() + "%")));
					}

				if (searchEmp.getHireDateStart() != null && !"".equals(searchEmp.getHireDateStart().toString())) {

					list.add(cb.greaterThanOrEqualTo(root.get("hireDate").as(LocalDate.class),
							searchEmp.getHireDateStart()));
				}
				if (searchEmp.getHireDateEnd() != null && !"".equals(searchEmp.getHireDateEnd().toString())) {

					list.add(
							cb.lessThanOrEqualTo(root.get("hireDate").as(LocalDate.class), searchEmp.getHireDateEnd()));
				}

				if (StringUtils.isNotBlank(searchEmp.getPosition())) {
					list.add(cb.equal(root.get("position").as(String.class), searchEmp.getPosition()));
				}

				if (StringUtils.isNotBlank(searchEmp.getDepartment())) {
					list.add(cb.equal(root.get("department").as(String.class), searchEmp.getDepartment()));
				}

				if (searchEmp.getSalaryMin() != null && !"".equals(searchEmp.getSalaryMin().toString())) {
					list.add(cb.greaterThanOrEqualTo(root.get("salary").as(Integer.class), searchEmp.getSalaryMin()));
				}
				if (searchEmp.getSalaryMax() != null && !"".equals(searchEmp.getSalaryMax().toString())) {
					list.add(cb.lessThanOrEqualTo(root.get("salary").as(Integer.class), searchEmp.getSalaryMax()));
				}

				return criteriaQuery.where(list.toArray(new Predicate[list.size()])).getRestriction();
			}
		};

		List<Employee> resultPage = employeeDao.findAll(specification);
		return resultPage;

	}

	public Integer findIdByName(String account) {
		Employee emp = employeeDao.findByAccount(account);

		if (emp != null) {
			return emp.getEid();
		}

		return null;
	}
	
	public Map<String, List<String>> getDepAndPos() {
		
		List<String> depList = employeeDao.findAllDepartment();
		List<String> posList = employeeDao.findAllPosition();
		
		Map<String, List<String>> depAndPos = new HashMap<>();
		depAndPos.put("departmentList", depList);
		depAndPos.put("positionList", posList);

		return depAndPos;
	}
	
	
	public List<Integer> getSalesOfEmp() {
		List<Integer> salesList = orderDao.getSalesOfEmp();

		return salesList;
	}
	
	
	

}
