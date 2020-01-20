package com.meet.me.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.MyhomeDAO;
import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;

@Service
public class MyHomeServiceImpl  implements MyHomeService{
	
	@Autowired
	MyhomeDAO mdao;
	public MyHome getinfo(String user_id) {
		return mdao.getinfo(user_id);
	}
	@Override
	public List<User> search(Map<String, String> keywords) {
		return mdao.search(keywords);
	}
	@Override
	public List<User> searchHash(String hashtag) {
		return mdao.searchHash(hashtag);
	}
}
