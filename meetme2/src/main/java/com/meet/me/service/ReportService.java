package com.meet.me.service;

import java.util.List;

public interface ReportService {


	int userCount();

	int eventCount();

	List<String> userReport();

	List<String> eventReport();


}
