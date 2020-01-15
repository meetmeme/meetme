package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.DashDAO;


@Service
public class DashServiceImpl implements DashService{

	@Autowired
	private DashDAO dao;
	
	@Override
	public List<String> getCategory() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		return dao.getCategory(map);
	}

	@Override
	public int interCount(int category_num) {
		return dao.interCount(category_num);
	}

	
}
