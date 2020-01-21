package com.meet.me.service;

import java.util.List;
import java.util.Map;

import com.meet.me.domain.Board;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;


public interface MyHomeService {

	public MyHome getinfo(String user_id);
	public List<User> search(Map<String, String> keywords);
	public List<User> searchHash(String hashtag);
	public void update(MyHome myhome);
	public int board_insert(Board board);	
}
