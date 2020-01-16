package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;

public interface UserService {
	public int isId(String user_id, String user_pass);
	public int isId(String user_id);
	public User user_info(String user_id);
	public User getNum(String user_id);
	public void category(User_interests user_inter);
	void insert(User user) throws Exception;
	void userAuth(String user_email) throws Exception;
	public void setMyhome(int user_num);
	public List<User> getSearchList(int index, String search_word, int page, int limit);
	public int getSearchListCount(int index, String search_word);
	public int delete(String user_id);
	public List<User> getFriends(String title, String userId);
	public int isEmail(String user_email);
	public List<User> getRandomUser();
	public List<User_interests> getInterestsNums(int num);
	
}
 