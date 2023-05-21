package com.group3.tofu.employee.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmployeeDao extends JpaRepository<Employee, Integer>, JpaSpecificationExecutor<Employee> {
	
	@Query("From Employee where account=:account")
	Employee findByAccount(@Param("account") String account);
	
	@Query(value = "select department from Employee group by department", nativeQuery = true)
	List<String> findAllDepartment();
	
	@Query(value = "select position from Employee group by position", nativeQuery = true)
	List<String> findAllPosition();
	
	
}
