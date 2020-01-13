package com.meet.me.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.meet.me.dao.DashDAO;

public class DashServiceImpl implements DashService{

	@Autowired
	private DashDAO dao;
	
	@Override
	public void getInterests() {
		dao.getInterests();
	}

}
