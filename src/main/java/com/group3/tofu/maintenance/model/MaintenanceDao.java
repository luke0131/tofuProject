package com.group3.tofu.maintenance.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MaintenanceDao extends JpaRepository<Maintenance, Integer> {
	
	@Query(value = "select * from Maintenance where keycode like %:keycode%", nativeQuery = true)
	Page<Maintenance> findByMaintenanceKeycodeLike(@Param("keycode") String keyword, Pageable pageble);
	
	@Query(value = "select count(*) from Maintenance where status='waiting'", nativeQuery = true)
	Integer countMtnBookWaiting();

	@Query(value = "select count(*) from Maintenance where f_employee_id=:eid and status='assigned'", nativeQuery = true)
	Integer countMtnAssigned(@Param("eid") Integer eid);

	@Query(value = "select * from Maintenance where f_employee_id=:eid and status='assigned'", nativeQuery = true)
	List<Maintenance> mtnAssigned(@Param("eid") Integer eid);


}
