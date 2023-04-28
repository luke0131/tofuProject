package com.group3.tofu.content.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group3.tofu.comment.model.Post;
import com.group3.tofu.comment.service.PostService;


@Controller
public class PostController {

	@Autowired
	private PostService pService;
	
	
//		//跳轉到討論區頁面
//		@GetMapping("/post")
//		public ModelAndView addPostPage(ModelAndView mav) {
//			Post post = new Post();
//			
//			mav.addObject("post" , post);
//			mav.setViewName("comment/post");
//			
//			Post latest = pService.findLastest();
//			
//			mav.addObject("latest" , latest);
//			return mav;
//		}
		
		@GetMapping("/post")
		public String showMessage(@RequestParam(name="p" ,defaultValue = "1") Integer pageNumber , Model model) {
			Page<Post> page = pService.findByPage(pageNumber);
			
			model.addAttribute("page", page);
			
			
			return "comment/post";
		}
		
		
}
