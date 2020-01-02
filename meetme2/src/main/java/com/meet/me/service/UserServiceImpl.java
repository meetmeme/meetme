package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.UserDAO;
import com.meet.me.domain.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO dao;
	
	@Override
	public int insert(User u) {
		return dao.insert(u);
	} 
	
	@Override
	public int isId(String user_id, String user_pass) {
		User u = dao.isId(user_id);
		int result = -1; //아이디가 존재하지 않는 경우- u가 null인 경우
		if(u != null) { //아이디가 존재하는 경우
			if(u.getUser_pass().equals(user_pass)) {
				result = 1; //아이디와 비밀번호가 일치하는 경우
			}else {
				result = 0; //아이디는 존재하지만 비밀번호가 일치하지 않는 경우
			}
		}
		return result;
	}


	@Override
	public int isId(String user_id) {
		User u = dao.isId(user_id);
		return (u == null) ? -1 : 1; //-1은 아이디가 존재하지 않는 경우
											//1은 아이디가 존재하는 경우
	}


	
}
