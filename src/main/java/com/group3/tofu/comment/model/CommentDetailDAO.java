package com.group3.tofu.comment.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface CommentDetailDAO extends JpaRepository<CommentDetail, Integer>{

	@Query(value = "from CommentDetail where f_comment_id = ?1")
	List<CommentDetail> findByCommentId(Integer comment_Id);
	
	
}
