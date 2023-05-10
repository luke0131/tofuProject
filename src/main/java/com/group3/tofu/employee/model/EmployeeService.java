package com.group3.tofu.employee.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
		PasswordEncoder passwordEncoder= new BCryptPasswordEncoder();
		emp.setPassword("{bcrypt}" + passwordEncoder.encode(emp.getPassword()));
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
		
		PasswordEncoder passwordEncoder= new BCryptPasswordEncoder(); 
		emp.setPassword("{bcrypt}" + passwordEncoder.encode(emp.getPassword()));
		
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
			employee.setEnabled(emp.getEnabled());
			employee.setAuthority(emp.getAuthority());
			employee.setPhoto(emp.getPhoto());

			employeeDao.save(employee);
			return employee;
		}

		return null;

	}

	public Integer findIdByName(String account) {
		Employee emp = employeeDao.findByAccount(account);
		if (emp != null) {
			return emp.getEid();
		}
		return null;
	}
	

}
	

