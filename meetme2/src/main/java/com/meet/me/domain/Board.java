package com.meet.me.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int MYHOME_NUM;
	private int BOARD_NUM;
	private String BOARD_ID;
	private String BOARD_PASS;
	private String BOARD_TITLE;
	private String BOARD_CONTENT;
	private MultipartFile uploadfile;
	private String BOARD_PHOTO;
	private String BOARD_ORIGINAL;
	private Date BOARD_DATE;
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getMYHOME_NUM() {
		return MYHOME_NUM;
	}
	public void setMYHOME_NUM(int mYHOME_NUM) {
		MYHOME_NUM = mYHOME_NUM;
	}
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public String getBOARD_ID() {
		return BOARD_ID;
	}
	public void setBOARD_ID(String bOARD_ID) {
		BOARD_ID = bOARD_ID;
	}
	public String getBOARD_PASS() {
		return BOARD_PASS;
	}
	public void setBOARD_PASS(String bOARD_PASS) {
		BOARD_PASS = bOARD_PASS;
	}
	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public String getBOARD_PHOTO() {
		return BOARD_PHOTO;
	}
	public void setBOARD_PHOTO(String bOARD_PHOTO) {
		BOARD_PHOTO = bOARD_PHOTO;
	}
	public String getBOARD_ORIGINAL() {
		return BOARD_ORIGINAL;
	}
	public void setBOARD_ORIGINAL(String bOARD_ORIGINAL) {
		BOARD_ORIGINAL = bOARD_ORIGINAL;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	
}
