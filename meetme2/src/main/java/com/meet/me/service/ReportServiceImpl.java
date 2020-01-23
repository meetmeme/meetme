package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.ReportDAO;



@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO dao;


	@Override
	public int userCount() {
		return dao.userCount();
	}

	@Override
	public int eventCount() {
		return dao.eventCount();
	}

	@Override
	public List<String> userReport() {
		return dao.userReport();
	}

	@Override
	public List<String> eventReport() {
		return dao.eventReport();
	}

	@Override
	public void alert(int user_num) {
		dao.alert(user_num);
	}

	@Override
	public void addCheck(int report_num) {
		dao.addCheck(report_num);
	}

	@Override
	public void delUser(int user_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delEvent(int event_num) {
		// TODO Auto-generated method stub
		
	}


	
}
