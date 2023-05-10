package com.group3.tofu.comment.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommentDAO extends JpaRepository<Comment, Integer> {

	@Query(value = "from Comment where f_post_id =:f_post_id")
	Comment findByFkPostId(@Param("f_post_id") Integer f_post_id);
	
	
	@Query(value = "from Comment where comment_id=:comment_id")
	Comment findByCommentId(@Param("comment_id") Integer comment_id);
	
	
	
}
