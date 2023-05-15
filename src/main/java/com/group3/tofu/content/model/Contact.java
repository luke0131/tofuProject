package com.group3.tofu.content.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ContactUs")
public class Contact {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "contentUs_id")
	private Integer contentUs_id;

	@Column(name = "name")
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "gender")
	private String gender;

	@Column(name = "isCarHoner")
	private String isCarHoner;

	@Column(name = "phone")
	private String phone;

	@Column(name = "email")
	private String email;

	@Column(name = "email_topic")
	private String email_topic;
	
	@Column(name = "email_subject")
	private String email_subject;

	@Column(name = "email_content")
	private String email_content;

	public Integer getContentUs_id() {
		return contentUs_id;
	}

	public void setContentUs_id(Integer contentUs_id) {
		this.contentUs_id = contentUs_id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getIsCarHoner() {
		return isCarHoner;
	}

	public void setIsCarHoner(String isCarHoner) {
		this.isCarHoner = isCarHoner;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail_topic() {
		return email_topic;
	}

	public void setEmail_topic(String email_topic) {
		this.email_topic = email_topic;
	}

	public String getEmail_subject() {
		return email_subject;
	}

	public void setEmail_subject(String email_subject) {
		this.email_subject = email_subject;
	}

	public String getEmail_content() {
		return email_content;
	}

	public void setEmail_content(String email_content) {
		this.email_content = email_content;
	}

	
}
