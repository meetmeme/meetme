package com.meet.me.domain;

import java.sql.Date;
import java.util.List;

public class Event {
	private int EVENT_NUM;
	private int USER_NUM;
	private int CATEGORY_NUM;
	private String EVENT_TITLE;
	private String EVENT_CONTENT;
	private Date EVENT_DATE;
	private String EVENT_TIME;
	private String EVENT_LOCATION;
	private int EVENT_MAX;
	private int EVENT_PRICE;
	private String EVENT_SAVE;
	private String EVENT_ORIGINAL;
//	private String EVENT_SAVE = "https://source.unsplash.com/random/130x130";
//	private String EVENT_ORIGINAL = "https://source.unsplash.com/random/130x130";

	// ------DB에 없는 것
	private List<String> categorys;

	
	
	@Override
	public String toString() {
		return "Event [EVENT_NUM=" + EVENT_NUM + ", EVENT_TITLE=" + EVENT_TITLE + ", EVENT_DATE=" + EVENT_DATE + "]";
	}

	public int getEVENT_NUM() {
		return EVENT_NUM;
	}

	public void setEVENT_NUM(int eVENT_NUM) {
		EVENT_NUM = eVENT_NUM;
	}

	public int getCATEGORY_NUM() {
		return CATEGORY_NUM;
	}

	public void setCATEGORY_NUM(int cATEGORY_NUM) {
		CATEGORY_NUM = cATEGORY_NUM;
	}

	public String getEVENT_TITLE() {
		return EVENT_TITLE;
	}

	public void setEVENT_TITLE(String eVENT_TITLE) {
		EVENT_TITLE = eVENT_TITLE;
	}

	public String getEVENT_CONTENT() {
		return EVENT_CONTENT;
	}

	public void setEVENT_CONTENT(String eVENT_CONTENT) {
		EVENT_CONTENT = eVENT_CONTENT;
	}

	public Date getEVENT_DATE() {
		return EVENT_DATE;
	}

	public void setEVENT_DATE(Date eVENT_DATE) {
		EVENT_DATE = eVENT_DATE;
	}

	public String getEVENT_TIME() {
		return EVENT_TIME;
	}

	public void setEVENT_TIME(String eVENT_TIME) {
		EVENT_TIME = eVENT_TIME;
	}

	public String getEVENT_LOCATION() {
		return EVENT_LOCATION;
	}

	public void setEVENT_LOCATION(String eVENT_LOCATION) {
		EVENT_LOCATION = eVENT_LOCATION;
	}

	public int getEVENT_MAX() {
		return EVENT_MAX;
	}

	public void setEVENT_MAX(int eVENT_MAX) {
		EVENT_MAX = eVENT_MAX;
	}

	public int getEVENT_PRICE() {
		return EVENT_PRICE;
	}

	public void setEVENT_PRICE(int eVENT_PRICE) {
		EVENT_PRICE = eVENT_PRICE;
	}

	public List<String> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<String> categorys) {
		this.categorys = categorys;
	}

	public String getEVENT_SAVE() {
		return EVENT_SAVE;
	}

	public void setEVENT_SAVE(String eVENT_SAVE) {
		EVENT_SAVE = eVENT_SAVE;
	}

	public String getEVENT_ORIGINAL() {
		return EVENT_ORIGINAL;
	}

	public void setEVENT_ORIGINAL(String eVENT_ORIGINAL) {
		EVENT_ORIGINAL = eVENT_ORIGINAL;
	}

	public int getUSER_NUM() {
		return USER_NUM;
	}

	public void setUSER_NUM(int uSER_NUM) {
		USER_NUM = uSER_NUM;
	}
}
