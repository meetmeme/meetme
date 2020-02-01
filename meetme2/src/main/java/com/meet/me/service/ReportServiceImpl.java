package com.meet.me.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.ReportDAO;
import com.meet.me.domain.Report;



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
	public List<Report> userReport() {
		return dao.userReport();
	}

	@Override
	public List<Report> eventReport() {
		return dao.eventReport();
	}

	@Override
	public void u_alert(int user_num) {
		dao.u_alert(user_num);
	}
	
	@Override
	public void e_alert(int event_num) {
		dao.e_alert(event_num);
	}

	@Override
	public void addCheck(int report_num) {
		dao.addCheck(report_num);
	}

	@Override
	public void delUser(int user_num) {
		dao.delUser(user_num);
	}

	@Override
	public void delEvent(int event_num) {
		dao.delEvent(event_num);
	}

	@Override
	public List<Report> userAlertCount() {
		return dao.userAlertCount();
	}

	@Override
	public List<Report> eventAlertCount() {
		return dao.eventAlertCount();
	}

	@Override
	public String getId(int user_num) {
		return dao.getId(user_num);
	}
 
	@Override
	public String getEvent(int event_num) {
		return dao.getEvent(event_num);
	}

	@Override
	public int myhomeReport(Report report) {
		return dao.myhomeReport(report);
	}




	
}
