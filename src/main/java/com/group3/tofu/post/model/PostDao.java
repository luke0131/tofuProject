package com.group3.tofu.post.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface PostDao extends JpaRepository<Post, Integer>{
	
	Post findFirstByOrderByAddedDesc();
	
	@Query(value = "from Post where f_customer_id=:f_customer_id")
	Post findByFkCustomerId(@Param("f_customer_id") Integer f_customer_id);
	
	//用人氣排序高到低123()
	
	//用人氣排序低到高321()
}
