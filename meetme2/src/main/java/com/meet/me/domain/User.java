package com.meet.me.domain;

import org.springframework.web.multipart.MultipartFile;

public class User {
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_email;
	private String user_gender;
	private int user_age;
	private String user_city;
	private int user_num;
	private MultipartFile uploadfile;
	private String user_save="/image/default.png";
	private String user_original="/image/default.png";
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getUser_id() {
		return user_id;
	} 
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public String getUser_city() {
		return user_city;
	}
	public void setUser_city(String user_city) {
		this.user_city = user_city;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_save() {
		return user_save;
	}
	public void setUser_save(String user_save) {
		this.user_save = user_save;
	}
	public String getUser_original() {
		return user_original;
	}
	public void setUser_original(String user_original) {
		this.user_original = user_original;
	}
}
