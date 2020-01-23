package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.Report;

public interface ReportService {


	int userCount();

	int eventCount();

	List<Report> userReport();

	List<Report> eventReport();

	void u_alert(int user_num);
	
	void e_alert(int event_num);

	void addCheck(int report_num);

	void delUser(int user_num);

	void delEvent(int event_num);

	List<Report> userAlertCount();

	List<Report> eventAlertCount();

	String getId(int user_num);

	String getEvent(int event_num);

	


}
