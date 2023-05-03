package com.group3.tofu.employee.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface EmployeeDao extends JpaRepository<Employee, Integer>, JpaSpecificationExecutor<Employee> {

}
