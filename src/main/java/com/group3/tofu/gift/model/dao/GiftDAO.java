package com.group3.tofu.gift.model.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group3.tofu.gift.model.bean.Gift;

public interface GiftDAO extends JpaRepository<Gift, Integer> {
	
	@Query(value = "select g from Gift g where g.isEnabled = ?1")
	Page<Gift> findByEnable(Boolean isEnable,Pageable pageable);

}
