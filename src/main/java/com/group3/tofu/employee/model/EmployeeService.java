package com.group3.tofu.employee.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = { Exception.class })
public class EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;

	public long count() {
		return employeeDao.count();
	}

	public void addAnNewEmployee(Employee emp) {
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

	// 修改資料
	public Employee updateEmployeeById(Integer id, Employee emp) {

		Optional<Employee> option = employeeDao.findById(id);
		if (option.isPresent()) {
			Employee employee = option.get();

			employee.setEid(emp.getEid());
			employee.setFirstName(emp.getFirstName());
			employee.setLastName(emp.getLastName());
			employee.setAccount(emp.getAccount());
			employee.setPassword(emp.getPassword());
			employee.setGender(emp.getGender());
			employee.setBirthday(emp.getBirthday());
			employee.setEmail(emp.getEmail());
			employee.setPhone(emp.getPhone());
			employee.setDepartment(emp.getDepartment());
			employee.setPosition(emp.getPosition());
			employee.setHireDate(emp.getHireDate());
			employee.setSalary(emp.getSalary());
			employee.setLevel(emp.getLevel());
			employee.setPhoto(emp.getPhoto());

			employeeDao.save(employee);
			return employee;
		}

		return null;
	}

}
	

