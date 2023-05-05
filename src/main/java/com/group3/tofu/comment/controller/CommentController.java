package com.group3.tofu.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.group3.tofu.comment.model.Comment;
import com.group3.tofu.comment.model.CommentDetail;
import com.group3.tofu.comment.service.CommentDetailService;
import com.group3.tofu.comment.service.CommentService;
import com.group3.tofu.post.model.Post;
import com.group3.tofu.post.service.PostService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentDetailService detailService;

	 	
	 	//跳轉到討論區文章內容頁面
	 	@GetMapping("/comment/{comment_id}")
		public String showCommentById(@PathVariable("comment_id") Integer comment_id , Model model) {
			
	 		Post allPost = postService.findByPostId(comment_id);
			Comment allComment = commentService.findByCommentId(comment_id);
			CommentDetail allDetail = detailService.findByDetailId(comment_id);
			
			model.addAttribute("allPost", allPost);
			model.addAttribute("allComment", allComment);
			model.addAttribute("allDetail", allDetail);
						
			return "/comment/comment";
		}
	 	
	 	

	
		
		
}
