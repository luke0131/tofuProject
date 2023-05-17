package com.group3.tofu.maintenance.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.group3.tofu.customer.model.Customer;
import com.group3.tofu.product.model.Product;

public interface MaintenanceDao extends JpaRepository<Maintenance, Integer> {
	
	@Query(value = "select * from Maintenance where keycode like %:keycode%", nativeQuery = true)
	Page<Maintenance> findByMaintenanceKeycodeLike(@Param("keycode") String keyword, Pageable pageble);

}
