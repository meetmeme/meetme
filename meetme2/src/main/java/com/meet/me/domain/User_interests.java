package com.meet.me.domain;

import java.util.List;

public class User_interests {
	private int user_num;
	private int category_num;
	private List<Integer> cat_list;
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public List<Integer> getCat_list() {
		return cat_list;
	}
	public void setCat_list(List<Integer> cat_list) {
		this.cat_list = cat_list;
	}
	@Override
	public String toString() {
		return "User_interests [user_num=" + user_num + ", category_num=" + category_num + ", cat_list=" + cat_list
				+ "]";
	}
	
	
}
