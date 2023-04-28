package com.group3.tofu.comment.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group3.tofu.comment.model.Post;
import com.group3.tofu.comment.model.PostDao;


@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	//insert資料
	public void insertPost(Post post) {
		postDao.save(post);
	}
	
	//找全部
	public List<Post> getAllPost(){
		return postDao.findAll();
	}
	
	//用post_id找資料
	public Post findByPostId(Integer post_id) {
		
		Optional<Post> op = postDao.findById(post_id);
		
		if(!op.isEmpty()) {
			return op.get();
		}
		
		return null;
	}
	
	//找最新的
	public Post findLastest() {
		return postDao.findFirstByOrderByAddedDesc();
	}
	
	//用post_id刪除資料
	public void deleteByPostId(Integer post_id) {
		postDao.deleteById(post_id);
	}
	
	
	//更新資料
	@Transactional
	public Post updatePostById(Integer post_id , String newPost) {
		Optional<Post> option = postDao.findById(post_id);
		
		if(!option.isEmpty()) {
			Post post = option.get();
			post.setTitle(newPost);
			return post;
		}
		
		return null;
	}
	
	//分頁
	public Page<Post> findByPage(Integer pageNumber) {
		PageRequest pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "added");

		Page<Post> page = postDao.findAll(pgb);

		return page;
	}
}
