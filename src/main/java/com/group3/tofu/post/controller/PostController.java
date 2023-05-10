package com.group3.tofu.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.comment.model.Comment;
import com.group3.tofu.comment.service.CommentDetailService;
import com.group3.tofu.comment.service.CommentService;
import com.group3.tofu.post.model.Post;
import com.group3.tofu.post.service.PostService;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private CommentService commentService;
	
	
	// 跳轉到新增的畫面
	@GetMapping("/showPost/add")
	public String addPost() {
		return "comment/addNewPost";
	}	

	// 新增文章標題，並轉到標題
	//@ModelAttribute(name = "comment") Comment comment,
	@PostMapping("/showPost")
	public String createNewPost(@ModelAttribute(name = "post") Post post, 
			@ModelAttribute(name = "comment") Comment comment,
			Model model) {

		postService.createPost(post);
		commentService.createComment(comment);
		
		
		Post newPost = new Post();
		model.addAttribute("post", newPost);
		
		Comment newComment = new Comment();
		model.addAttribute("comment", newComment);

		Post findLastest = postService.findLastest();
		model.addAttribute("findLastest", findLastest);

		return "redirect:/showPost";

	}
	

	


	// 分頁
	@GetMapping("/showPost")
	public String showPost(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Post> page = postService.findByPage(pageNumber);

		model.addAttribute("page", page);

		return "comment/post";
	}
	
	

}
