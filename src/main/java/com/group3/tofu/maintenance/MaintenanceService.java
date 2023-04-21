package com.group3.tofu.maintenance;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MaintenanceService {

	@Autowired  
	private  MaintenanceDao mDAO;
	
	public Maintenance insertMaintenance(Maintenance mtn) {
	return mDAO.save(mtn);
	}
	
	
	public Maintenance findById(Integer id) {
		 Optional<Maintenance> op = mDAO.findById(id);
		 
		 if(op.isPresent()) {
			 return op.get();
					 
		 }
		 return null;
	}
}
