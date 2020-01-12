package com.meet.me.service;

import java.util.List;

import javax.mail.MessagingException;

import com.meet.me.domain.Category;
import com.meet.me.domain.User;
import com.meet.me.domain.User_interests;

public interface UserService {
	public int isId(String user_id, String user_pass);
	public int isId(String user_id);
	public User user_info(String user_id);
	public User getNum(String user_id);
	public void category(User_interests user_inter);
	void insert(User user) throws Exception;
	void userAuth(String userEmail) throws Exception;
}
 