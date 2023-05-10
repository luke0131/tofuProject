package com.group3.tofu.post.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.group3.tofu.comment.model.Comment;

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
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm EEEE")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm EEEE")
	@Column(name = "added") 
	private Date added;
	
	@JsonIgnore
	@OneToOne(mappedBy = "post", fetch = FetchType.LAZY)
	private Comment comment;

	
	public Post() {

	}
	
	@PrePersist // 當物件要轉換成 Persistent 狀態時，發動該方法
	public void onCreate() {
		if (added == null) {
			added = new Date();
		}
	}
	
	
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

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}
	
	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Post [post_id=" + post_id + ", title=" + title + ", hot=" + hot + ", authorName=" + authorName
				+ ", added=" + added + ", comment=" + comment + "]";
	}

	
	
	
}
