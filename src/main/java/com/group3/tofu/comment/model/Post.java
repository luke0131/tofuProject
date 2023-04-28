package com.group3.tofu.comment.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Post")
public class Post {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "post_id")
	private Integer post_id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "hot")
	private Integer hot;
	
	@Column(name = "authorName")
	private String authorName;
	
//	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
//	@Temporal(TemporalType.TIMESTAMP)
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "added", columnDefinition = "DATE") 
	private LocalDate added;
	
	
	public Post() {

	}
	
//	@PrePersist // 當物件要轉換成 Persistent 狀態時，發動該方法
//	public void onCreate() {
//		if (added == null) {
//			added = new Date();
//		}
//	}

	public Integer getPost_id() {
		return post_id;
	}

	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getHot() {
		return hot;
	}

	public void setHot(Integer hot) {
		this.hot = hot;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public LocalDate getAdded() {
		return added;
	}

	public void setAdded(LocalDate added) {
		this.added = added;
	}

	
	
	
}
