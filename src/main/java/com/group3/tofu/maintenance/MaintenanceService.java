package com.group3.tofu.maintenance;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
	
	public List<Maintenance> findAllMaintenance(){
		return mDAO.findAll();
	}
	public void deleteById(Integer id) {
		mDAO.deleteById(id);
	}
	@Transactional
	public Maintenance updateMaintenance(Maintenance maintenance) {
		return mDAO.save(maintenance);
	}
	public Page<Maintenance>findByPage(Integer pageNumber){
		Pageable pge= PageRequest.of(pageNumber-1,5,Sort.Direction.DESC,"mid");
		Page<Maintenance> page=mDAO.findAll(pge);
		return page;
	}
}
