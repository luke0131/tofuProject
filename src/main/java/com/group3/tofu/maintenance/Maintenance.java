package com.group3.tofu.maintenance;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="maintenance")
public class Maintenance {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="mid")
private Integer mid;
@Column(name="cid")
private Integer cid;
@Column(name="eid")
private Integer eid;
@Column(name="pid")
private Integer pid;
@Column(name="mcategory")
private String mcategory;
@Column(name="note")
private String note;
@Temporal(TemporalType.TIMESTAMP)
@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
@Column(name="appointment")
private Date appointment;

public Maintenance() {
	
}

public Integer getMid() {
	return mid;
}

public void setMid(Integer mid) {
	this.mid = mid;
}

public Integer getCid() {
	return cid;
}

public void setCid(Integer cid) {
	this.cid = cid;
}

public Integer getEid() {
	return eid;
}

public void setEid(Integer eid) {
	this.eid = eid;
}

public Integer getPid() {
	return pid;
}

public void setPid(Integer pid) {
	this.pid = pid;
}

public String getMcategory() {
	return mcategory;
}

public void setMcategory(String mcategory) {
	this.mcategory = mcategory;
}

public String getNote() {
	return note;
}

public void setNote(String note) {
	this.note = note;
}

public Date getAppointment() {
	return appointment;
}

public void setAppointment(Date appointment) {
	this.appointment = appointment;
}

}
