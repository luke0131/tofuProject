package com.group3.tofu.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.post.model.Post;
import com.group3.tofu.post.service.PostService;


@Controller
public class PostController {

	@Autowired
	private PostService pService;

		
		//分頁
		@GetMapping("/post")
		public String showMessage(@RequestParam(name="p" ,defaultValue = "1") Integer pageNumber , Model model) {
			Page<Post> page = pService.findByPage(pageNumber);
			
			model.addAttribute("page", page);
			
			
			return "comment/post";
		}
		

		
		
}
