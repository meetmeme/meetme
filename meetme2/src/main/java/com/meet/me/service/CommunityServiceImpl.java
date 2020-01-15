package com.meet.me.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.CommunityDAO;
import com.meet.me.domain.Message;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityDAO dao;

	@Override
	public int sendMsg(Message msg) {
		return dao.sendMsg(msg);
	}
	
}
