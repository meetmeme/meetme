package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.Category;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;

public interface UserService {
	public int isId(String user_id, String user_pass);
	public int insert(User user);
	public int isId(String user_id);
	public User user_info(String user_id);
	public int delete(String user_id);
	public int update(User user);
	public List<User> getSearchList(int index, String search_word, int page, int limit);
	public int getSearchListCount(int index, String search_word);
	public User getNum(String user_id);
	public void category(User_interests user_inter);
}
 