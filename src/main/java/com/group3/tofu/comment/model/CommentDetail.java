package com.group3.tofu.comment.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.group3.tofu.customer.model.Customer;

@Entity
@Table(name="Comment_detail")
public class CommentDetail {
	
	public CommentDetail() {
		
	}
	
	public CommentDetail(String comment_detail, LocalDate comment_date , Customer customer , Comment comment) {
		this.comment_detail = comment_detail;
		this.comment_date = comment_date;
		this.customer = customer;
		this.comment = comment;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer comment_detail_id;
	
	@Column(name="comment_detail")
	private String comment_detail;
	
	@Column(name = "comment_date" , columnDefinition = "DATE")
	private LocalDate comment_date;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="f_comment_id" ,referencedColumnName = "comment_id")
	private Comment comment;
	
	@ManyToOne
	@JoinColumn(name="f_customer_id" ,referencedColumnName = "customer_id")
	private Customer customer;
	
	
	
	
	public Integer getComment_detail_id() {
		return comment_detail_id;
	}




	public void setComment_detail_id(Integer comment_detail_id) {
		this.comment_detail_id = comment_detail_id;
	}




	public String getComment_detail() {
		return comment_detail;
	}




	public void setComment_detail(String comment_detail) {
		this.comment_detail = comment_detail;
	}




	public LocalDate getComment_date() {
		return comment_date;
	}




	public void setComment_date(LocalDate comment_date) {
		this.comment_date = comment_date;
	}




	public Comment getComment() {
		return comment;
	}




	public void setComment(Comment comment) {
		this.comment = comment;
	}




	public Customer getCustomer() {
		return customer;
	}




	public void setCustomer(Customer customer) {
		this.customer = customer;
	}




	@Override
	public String toString() {
		return "CommentDetail [comment_detail_id=" + comment_detail_id + ", comment_detail=" + comment_detail
				+ ", comment_date=" + comment_date + ", comment=" + comment + ", customer=" + customer + "]";
	}




	


}
