package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.DashDAO;
import com.meet.me.domain.Follows;


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

	@Override
	public int boardCount(String month) {
		month = "20/"+month+"%";
		return dao.boardCount(month);
	}

	@Override
	public int dayCount(String day) {
		day = "20/01/"+day;
		
		
		return dao.dayCount(day);
	}

	@Override
	public List<Follows> follows() {
		return dao.follows();
	}

	
}
