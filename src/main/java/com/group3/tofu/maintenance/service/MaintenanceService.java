package com.group3.tofu.maintenance.service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.group3.tofu.maintenance.model.Maintenance;
import com.group3.tofu.maintenance.model.MaintenanceDao;

@Service
public class MaintenanceService {

	@Autowired
	private MaintenanceDao mDAO;

	public Maintenance insertMaintenance(Maintenance mtn) {

		return mDAO.save(mtn);
	}

	public Maintenance findById(Integer mid) {
		Optional<Maintenance> op = mDAO.findById(mid);

		if (op.isPresent()) {
			return op.get();

		}
		return null;
	}

	public List<Maintenance> findAllMaintenance() {
		return mDAO.findAll();
	}

	public void deleteById(Integer mid) {
		mDAO.deleteById(mid);
	}

	@Transactional
	public Maintenance updateMaintenance(Integer mid, Maintenance maintenance) {
		String mcategory = maintenance.getMcategory();
        String inspection = maintenance.getInspection();
        String electric = maintenance.getElectric();
        String notes = maintenance.getNotes();
        Date appointment = maintenance.getAppointment();
        String appointmentTime = maintenance.getAppointmenttime();
		Optional<Maintenance> existingMaintenance = mDAO.findById(mid);
		
		if (existingMaintenance != null) {
			Maintenance mtn=existingMaintenance.get();
			mtn.setAppointment(appointment);
			mtn.setAppointmenttime(appointmentTime);
			mtn.setElectric(electric);
			mtn.setNotes(notes);
			mtn.setInspection(inspection);
			mtn.setMcategory(mcategory);
			return mtn;

		}
		return null;
	}

	public Page<Maintenance> findByPage(Integer pageNumber) {
		Pageable pge = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "mid");
		Page<Maintenance> page = mDAO.findAll(pge);
		return page;
	}

}
