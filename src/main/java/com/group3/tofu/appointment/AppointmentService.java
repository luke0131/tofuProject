package com.group3.tofu.appointment;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AppointmentService {
	@Autowired
	private AppointmentDao aDao;
	
	public Appointment saveAppointment(Appointment apt) {
		return aDao.save(apt);
	}
	
}
