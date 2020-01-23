package com.meet.me.service;

import java.util.List;

public interface ReportService {


	int userCount();

	int eventCount();

	List<String> userReport();

	List<String> eventReport();

	void alert(int user_num);

	void addCheck(int report_num);

	void delUser(int user_num);

	void delEvent(int event_num);


}
