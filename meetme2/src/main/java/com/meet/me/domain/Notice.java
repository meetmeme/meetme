package com.meet.me.domain;

import java.util.Date;

public class Notice {
	private int NOTICE_NUM;
	private int USER_NUM;
	private String NOTICE_TITLE;
	private String NOTICE_CONTENT;
	private Date NOTICE_DATE;
	private String NOTICE_CK;
	
	
	public int getNOTICE_NUM() {
		return NOTICE_NUM;
	}
	public void setNOTICE_NUM(int nOTICE_NUM) {
		NOTICE_NUM = nOTICE_NUM;
	}
	public int getUSER_NUM() {
		return USER_NUM;
	}
	public void setUSER_NUM(int uSER_NUM) {
		USER_NUM = uSER_NUM;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public Date getNOTICE_DATE() {
		return NOTICE_DATE;
	}
	public void setNOTICE_DATE(Date nOTICE_DATE) {
		NOTICE_DATE = nOTICE_DATE;
	}
	public String getNOTICE_CK() {
		return NOTICE_CK;
	}
	public void setNOTICE_CK(String nOTICE_CK) {
		NOTICE_CK = nOTICE_CK;
	}

	
}
