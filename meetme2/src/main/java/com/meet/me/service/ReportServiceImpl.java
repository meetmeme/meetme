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

	
}
