package com.group3.tofu.post.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface PostDao extends JpaRepository<Post, Integer>{
	
	Post findFirstByOrderByAddedDesc();
	
	@Query(value = "select * from Post where title like %:title%", nativeQuery = true)
	Page<Post> findByPostTitleLike(@Param("title") String keyword,Pageable pageble);
	
	
   
	@Query(value = "from Post where f_customer_id=:f_customer_id")
	Post findByFkCustomerId(@Param("f_customer_id") Integer f_customer_id);
	
	//用人氣排序高到低123()
	
	//用人氣排序低到高321()
	
//	@Query(value = "select * from Post where title like %:title%",nativeQuery = true)
//	List<Post> findLike(@Param("title") String keyword);
	
	
}
