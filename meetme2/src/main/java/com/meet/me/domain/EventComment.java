package com.meet.me.domain;

import java.sql.Date;

public class EventComment {
	
	private int event_comm_num;
	private int event_num;
	private int user_num;
	private String event_comm_content;
	private Date event_comm_date;
	
	
	public int getEvent_comm_num() {
		return event_comm_num;
	}
	public void setEvent_comm_num(int event_comm_num) {
		this.event_comm_num = event_comm_num;
	}
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getEvent_comm_content() {
		return event_comm_content;
	}
	public void setEvent_comm_content(String event_comm_content) {
		this.event_comm_content = event_comm_content;
	}
	public Date getEvent_comm_date() {
		return event_comm_date;
	}
	public void setEvent_comm_date(Date event_comm_date) {
		this.event_comm_date = event_comm_date;
	}
	
	

}
