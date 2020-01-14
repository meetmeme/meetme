package com.meet.me.service;

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
}
