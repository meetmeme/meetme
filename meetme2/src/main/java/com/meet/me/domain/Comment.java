package com.meet.me.domain;


public class Comment {
	private int COMMENT_NUM;
	private int USER_NUM;
	private int BOARD_USER_NUM;
	private String COMMENT_CONTENT;
	private String COMMENT_DATE;
	private int BOARD_NUM;
	public int getCOMMENT_NUM() {
		return COMMENT_NUM;
	}
	public void setCOMMENT_NUM(int cOMMENT_NUM) {
		COMMENT_NUM = cOMMENT_NUM;
	}
	public int getUSER_NUM() {
		return USER_NUM;
	}
	public void setUSER_NUM(int uSER_NUM) {
		USER_NUM = uSER_NUM;
	}
	public int getBOARD_USER_NUM() {
		return BOARD_USER_NUM;
	}
	public void setBOARD_USER_NUM(int bOARD_USER_NUM) {
		BOARD_USER_NUM = bOARD_USER_NUM;
	}
	public String getCOMMENT_CONTENT() {
		return COMMENT_CONTENT;
	}
	public void setCOMMENT_CONTENT(String cOMMENT_CONTENT) {
		COMMENT_CONTENT = cOMMENT_CONTENT;
	}
	public String getCOMMENT_DATE() {
		return COMMENT_DATE;
	}
	public void setCOMMENT_DATE(String cOMMENT_DATE) {
		COMMENT_DATE = cOMMENT_DATE;
	}
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	@Override
	public String toString() {
		return "Comment [COMMENT_NUM=" + COMMENT_NUM + ", USER_NUM=" + USER_NUM + ", BOARD_USER_NUM=" + BOARD_USER_NUM
				+ ", COMMENT_CONTENT=" + COMMENT_CONTENT + ", COMMENT_DATE=" + COMMENT_DATE + ", BOARD_NUM=" + BOARD_NUM
				+ "]";
	}
	
}