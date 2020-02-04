package com.meet.me.domain;

import java.sql.Date;

public class Message {
	private int SENDER_NUM;
	private int RECEIVER_NUM;
	private String CONTENT;
	private Date SENT_DATE;
	private int MSG_CHECK;
	
	// -----DB에 없는거
	private String sender_name;
	private String receiver_name;
	
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public int getSENDER_NUM() {
		return SENDER_NUM;
	}
	public void setSENDER_NUM(int sENDER_NUM) {
		SENDER_NUM = sENDER_NUM;
	}
	public int getRECEIVER_NUM() {
		return RECEIVER_NUM;
	}
	public void setRECEIVER_NUM(int rECEIVER_NUM) {
		RECEIVER_NUM = rECEIVER_NUM;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public Date getSENT_DATE() {
		return SENT_DATE;
	}
	public void setSENT_DATE(Date sENT_DATE) {
		SENT_DATE = sENT_DATE;
	}
	public int getMSG_CHECK() {
		return MSG_CHECK;
	}
	public void setMSG_CHECK(int mSG_CHECK) {
		MSG_CHECK = mSG_CHECK;
	}
	
	
}
