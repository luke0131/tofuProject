package com.group3.tofu.content.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ContactDTO {

	@JsonProperty
	private String email;
	
	@JsonProperty
	private String subject;
	
	@JsonProperty
	private String content;
	
	public ContactDTO(){
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
