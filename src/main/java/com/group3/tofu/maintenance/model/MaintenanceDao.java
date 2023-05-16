package com.group3.tofu.maintenance.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group3.tofu.product.model.Product;

public interface MaintenanceDao extends JpaRepository<Maintenance, Integer> {
	
	

}
