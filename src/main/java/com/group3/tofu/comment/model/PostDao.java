package com.group3.tofu.comment.model;

import org.springframework.data.jpa.repository.JpaRepository;


public interface PostDao extends JpaRepository<Post, Integer>{
	
	Post findFirstByOrderByAddedDesc();
}
