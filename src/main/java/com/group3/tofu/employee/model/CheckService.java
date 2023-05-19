package com.group3.tofu.employee.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
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
public class CheckService {

	@Autowired
	private CheckDao checkDao;

	@Autowired
	private EmployeeDao employeeDao;

	public long count() {
		return checkDao.count();
	}

	public void addAnNewCheck(Integer eid, Date checkInTime) {

		Employee emp = employeeDao.findById(eid).get();

		LocalDate todaysDate = LocalDate.now();
		Checks todaysCheck = checkDao.findTodaysCheck(eid, todaysDate);

		if (todaysCheck == null) {
			Checks newCheck = new Checks(emp, checkInTime);
			checkDao.save(newCheck);
		}

	}


	public Checks findTodaysCheck(Integer eid) {
		LocalDate todaysDate = LocalDate.now();
		Checks todaysCheck = checkDao.findTodaysCheck(eid, todaysDate);
		if (todaysCheck != null) {
			return todaysCheck;
		}
		return null;
	}

	public Checks updateCheckOutTime(Integer eid, Date checkOutTime) {

		LocalDate todaysDate = LocalDate.now();
		Checks todaysCheck = checkDao.findTodaysCheck(eid, todaysDate);
		Employee emp = employeeDao.findById(eid).get();
		List<Checks> checks = emp.getChecks();
		if (todaysCheck != null) {
			todaysCheck.setCheckOutTime(checkOutTime);
			checks.get(checks.size() - 1).setCheckOutTime(checkOutTime);
			todaysCheck.setEmployee(emp);
			return todaysCheck;
		}
		return null;

	}

	public List<Checks> findAll() {
		return checkDao.findAll();
	}

	public Page<Checks> searchChecks(Integer pageNumber, int size, CheckSearchVO searchCheck) throws Exception {

		Pageable pageable = PageRequest.of(pageNumber - 1, size, Sort.by(Direction.ASC, "cid"));
		
		Specification<Checks> specification = new Specification<Checks>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Checks> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder cb) {

				Join<Checks, Employee> joinEmpRoot = root.join("employee");

				List<Predicate> list = new ArrayList<>();

				if (StringUtils.isNotBlank(searchCheck.getName())) {
					list.add(cb.or(cb.like(joinEmpRoot.get("firstName").as(String.class), "%" + searchCheck.getName() + "%"), cb.like(joinEmpRoot.get("lastName").as(String.class), "%" + searchCheck.getName() + "%")));
				}

				if (searchCheck.getCheckDate() != null && !"".equals(searchCheck.getCheckDate().toString())) {
					list.add(cb.and(cb.greaterThanOrEqualTo(root.get("checkInTime").as(LocalDate.class), searchCheck.getCheckDate()), cb.lessThanOrEqualTo(root.get("checkInTime").as(LocalDate.class), searchCheck.getCheckDate().plusDays(1))));
				}
				
				return criteriaQuery.where(list.toArray(new Predicate[list.size()])).getRestriction();
			}
		};

		Page<Checks> resultPage = checkDao.findAll(specification, pageable);
		return resultPage;

	}



}
