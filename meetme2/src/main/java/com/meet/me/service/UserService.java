package com.meet.me.service;

import java.util.List;
import java.util.Map;

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
	public List<User> getFriends(String title, int userNum);
	public int isEmail(String user_email);
	public List<User> getRandomUser(int num);
	public List<User_interests> getInterestsNums(int num);
	public int update(User user);
	public int delete_interests(String user_id);
	public int follow(Map<String, String> userKey);
	public int followCheck(Map<String, String> userKey);
	public void setPW(User user) throws Exception;
	public User user_info_email(String email);
	public int setPassword(User u);
	public User isId2(String user_id);
	public int leave(String user_id);
}
 