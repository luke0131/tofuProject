package com.group3.tofu.employee.model;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CheckDao extends JpaRepository<Checks, Integer>, JpaSpecificationExecutor<Checks> {
	
	@Query(value = "select * from Checks where f_employee_id=:eid and CAST(checkin_time as DATE)=:checkintime", nativeQuery = true)
	Checks findTodaysCheck(@Param("eid") Integer eid, @Param("checkintime") LocalDate checkintime);
	
	
	
}
