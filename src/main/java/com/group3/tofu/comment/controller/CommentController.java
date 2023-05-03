package com.group3.tofu.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.group3.tofu.comment.model.Comment;
import com.group3.tofu.comment.service.CommentService;
import com.group3.tofu.post.service.PostService;

@Controller

public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	
//	 	@GetMapping("/comment")
//	 	public String showComment() {
//	 		return "comment/comment";
//	 	}
		
		//跳轉到討論區文章內容頁面
	 	@GetMapping("/comment/{comment_id}")
		public ModelAndView showCommentById(@PathVariable("comment_id") Integer comment_id , ModelAndView model) {
			
			Comment fComment = commentService.findByCommentId(comment_id);
			
			model.addObject("fComment", fComment);
			model.setViewName("/comment/comment");
			
			return model;
		}
	 	
		
	
		
		
}
