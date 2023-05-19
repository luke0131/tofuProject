package com.group3.tofu.employee.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LeaveDao extends JpaRepository<Leave, Integer>, JpaSpecificationExecutor<Leave> {

	@Query(value = "select top(1) * from Leave where tenure_in_months <= :tenure and leave_category = '特別休假' ORDER BY leave_id DESC", nativeQuery = true)
	Leave findAnnualLeaveDaysAvailable(@Param("tenure") Integer tenure);
	
	@Query(value = "select top(1) tenure_in_months from Leave where tenure_in_months > :tenure and leave_category = '特別休假'", nativeQuery = true)
	Integer findWhenAnnualLeaveAvailable(@Param("tenure") Integer tenure);

	@Query(value = "select * from Leave where leave_category <> '特別休假' and tenure_in_months <= :tenure or tenure_in_months is null", nativeQuery = true)
	List<Leave> findLeaveAvailable(@Param("tenure") Integer tenure);
}
