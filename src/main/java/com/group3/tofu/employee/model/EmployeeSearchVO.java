package com.group3.tofu.employee.model;

import java.time.LocalDate;

import javax.persistence.Column;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EmployeeSearchVO {
	
	private String firstName;

	private String lastName;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@Column(name= "hire_date")
	private LocalDate hireDateStart;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@Column(name= "hire_date")
	private LocalDate hireDateEnd;
	
	private String department;
	
	private String position;
	
	private Integer salaryMin;
	
	private Integer salaryMax;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getHireDateStart() {
		return hireDateStart;
	}

	public void setHireDateStart(LocalDate hireDateStart) {
		this.hireDateStart = hireDateStart;
	}

	public LocalDate getHireDateEnd() {
		return hireDateEnd;
	}

	public void setHireDateEnd(LocalDate hireDateEnd) {
		this.hireDateEnd = hireDateEnd;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	

	public Integer getSalaryMin() {
		return salaryMin;
	}

	public void setSalaryMin(Integer salaryMin) {
		this.salaryMin = salaryMin;
	}

	public Integer getSalaryMax() {
		return salaryMax;
	}

	public void setSalaryMax(Integer salaryMax) {
		this.salaryMax = salaryMax;
	}

	

	public EmployeeSearchVO(String firstName, String lastName, LocalDate hireDateStart, LocalDate hireDateEnd,
			String department, String position, Integer salaryMin, Integer salaryMax) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.hireDateStart = hireDateStart;
		this.hireDateEnd = hireDateEnd;
		this.department = department;
		this.position = position;
		this.salaryMin = salaryMin;
		this.salaryMax = salaryMax;
	}

	@Override
	public String toString() {
		return "EmployeeSearchVO [firstName=" + firstName + ", lastName=" + lastName + ", hireDateStart="
				+ hireDateStart + ", hireDateEnd=" + hireDateEnd + ", department=" + department + ", position="
				+ position + ", salaryMin=" + salaryMin + ", salaryMax=" + salaryMax + "]";
	}

	

	
	
	
	
	
}
