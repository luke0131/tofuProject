package com.group3.tofu.employee.model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = { Exception.class })
public class LeaveApplicationService {

	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private LeaveDao leaveDao;

	@Autowired
	private LeaveApplicationDao leaveApplicationDao;

	public void newLeaveApp(LeaveApplication lapp) {
		leaveApplicationDao.save(lapp);
	}

	public Leave findLeaveById(Integer id) {
		
		if (id != null) {
			Optional<Leave> op = leaveDao.findById(id);

			if (op.isPresent()) {
				return op.get();
			}

			return null;
		} 
		return null;
		
		
	}

	public List<Leave> getAvailableLeaveCat(Employee emp) {

		LocalDate todaysDate = LocalDate.now();
		long longMonth = ChronoUnit.MONTHS.between(emp.getHireDate(), todaysDate);
		Integer monthTenure = Integer.parseInt(String.valueOf(longMonth));

		Leave annualLeave = leaveDao.findAnnualLeaveDaysAvailable(monthTenure);
		List<Leave> leaveAvailable = leaveDao.findLeaveAvailable(monthTenure);
		leaveAvailable.add(annualLeave);

		return leaveAvailable;
	}

	public boolean checkIfThereAreLeftAnnualDays(Employee emp, Integer leaveDays) {

		LocalDate todaysDate = LocalDate.now();
		long longMonth = ChronoUnit.MONTHS.between(emp.getHireDate(), todaysDate);
		Integer monthTenure = Integer.parseInt(String.valueOf(longMonth));

		Leave annualLeave = leaveDao.findAnnualLeaveDaysAvailable(monthTenure);
		Integer annualMaxDays = 0;
		if (annualLeave != null) {
			annualMaxDays = annualLeave.getMaxLeaveDays();
		} else {
			return false;
		}
		
		Integer leaveId = annualLeave.getLid();
		Integer annualUsedDays = leaveApplicationDao.findUsedAnnualLeave(emp.getEid(), leaveId);
		Integer annualLeftDays = annualMaxDays - annualUsedDays;

		if (annualLeftDays > 0) {

			if (leaveDays <= annualLeftDays) {
				System.out.println("現階段特休天數上限：" + annualMaxDays);
				System.out.println("之前請過幾天特休：" + annualUsedDays);
				System.out.println("剩餘的特休天數：" + annualLeftDays);
				System.out.println("目前提出申請的特休天數：" + leaveDays);
				return true;
			} else {
				System.out.println("請假的天數大於剩餘特休天數，剩餘特休天數不足");
				return false;
			}
		} else {
			System.out.println("請假的天數大於剩餘特休天數，剩餘特休天數不足");
			return false;
		}

	}

	public boolean ifDateIsAlreadyTaken(LocalDate beginDate, Integer eid) {
		Integer applyFound = leaveApplicationDao.checkLeaveDateAlreadyTaken(beginDate, eid);
		System.out.println(applyFound);
		if (applyFound > 0) {
			return true;
		} else {
			return false;
		}
	}

	public List<LeaveApplication> findAll() {
		return leaveApplicationDao.findAll();
	}

	public List<LeaveApplication> findWaitingApprovalList() {
		return leaveApplicationDao.findWaitingApprovalList();
	}

	public List<LeaveApplication> findApprovedOrRejectedList() {
		return leaveApplicationDao.findApprovedOrRejectedList();
	}

	public List<LeaveApplication> findLeaveAppByEid(Integer eid) {

		List<LeaveApplication> myAppList = leaveApplicationDao.findMyApplicationList(eid);
		if (myAppList != null) {
			return myAppList;
		}
		return null;
	}

	public boolean exists(Integer id) {
		return leaveApplicationDao.findById(id) != null;
	}

	public LeaveApplication rejectLeaveApplication(Integer lid) {
		Optional<LeaveApplication> op = leaveApplicationDao.findById(lid);
		if (op.isPresent()) {
			LeaveApplication lapp = op.get();
			lapp.setManagerApproved(0);
			return lapp;
		}
		return null;
	}

	public LeaveApplication approveLeaveApplication(Integer lid) {
		Optional<LeaveApplication> op = leaveApplicationDao.findById(lid);
		if (op.isPresent()) {
			LeaveApplication lapp = op.get();
			lapp.setManagerApproved(1);
			return lapp;
		}
		return null;
	}

}
