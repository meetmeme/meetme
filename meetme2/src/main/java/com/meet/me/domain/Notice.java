package com.meet.me.domain;

import java.sql.Date;

public class Notice {
	private int user_num;
	private String title;
	private String content;
	private Date time;
	private String noticeCk;

	
	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getNoticeCk() {
		return noticeCk;
	}

	public void setNoticeCk(String noticeCk) {
		this.noticeCk = noticeCk;
	}

}
