package com.meet.me.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.meet.me.dao.DashDAO;
import com.meet.me.domain.Dash;

public class DashServiceImpl implements DashService{

	@Autowired
	private DashDAO dao;

	@Override
	public Dash dashInter(int category_num) {
		return dao.dashInter(category_num);
	}

	@Override
	public void allcatNum() {
		dao.allcatNum();
	}

}
