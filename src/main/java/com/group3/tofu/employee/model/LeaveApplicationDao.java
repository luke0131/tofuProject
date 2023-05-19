package com.group3.tofu.employee.model;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LeaveApplicationDao
		extends JpaRepository<LeaveApplication, Integer>, JpaSpecificationExecutor<LeaveApplication> {

	@Query(value = "select f_employee_id from LeaveApplication where manager_approved = 1 and begin_date <=:reservedDate and end_date >=:reservedDate", nativeQuery = true)
	List<Integer> findNotAvailableOnRD(@Param("reservedDate") LocalDate reseverdDate);

	@Query(value = "select sum(leave_days) as totalUsedDays from LeaveApplication where f_employee_id = :empid and f_leave_id = :leaveid", nativeQuery = true)
	Integer findUsedAnnualLeave(@Param("empid") Integer empid, @Param("leaveid") Integer leaveid);

	@Query(value = "select count(*) from LeaveApplication where begin_date <= :applyBD and end_date >= :applyBD and f_employee_id = :empid", nativeQuery = true)
	Integer checkLeaveDateAlreadyTaken(@Param("applyBD") LocalDate applyBD, @Param("empid") Integer empid);

	@Query(value = "select * from LeaveApplication where manager_approved is null", nativeQuery = true)
	List<LeaveApplication> findWaitingApprovalList();

	@Query(value = "select * from LeaveApplication where manager_approved is not null", nativeQuery = true)
	List<LeaveApplication> findApprovedOrRejectedList();

	@Query(value = "select * from LeaveApplication where f_employee_id = :eid", nativeQuery = true)
	List<LeaveApplication> findMyApplicationList(@Param("eid") Integer eid);

}
