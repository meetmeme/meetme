package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.User;

public interface UserService {
	public int isId(String user_id, String user_pass);
	public int insert(User u);
	public int isId(String user_id);
}
 