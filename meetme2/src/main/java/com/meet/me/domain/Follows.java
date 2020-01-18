package com.meet.me.domain;

public class Follows {
	private int user_num;
	private int following_num;
	private String user_id;
	private int follower_ck;
	private int c;
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getFollowing_num() {
		return following_num;
	}
	public void setFollowing_num(int following_num) {
		this.following_num = following_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getFollower_ck() {
		return follower_ck;
	}
	public void setFollower_ck(int follower_ck) {
		this.follower_ck = follower_ck;
	}
	public int getC() {
		return c;
	}
	public void setC(int count) {
		this.c = count;
	}
	
}
