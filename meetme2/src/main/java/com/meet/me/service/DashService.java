package com.meet.me.service;

import java.util.List;

public interface DashService {


	List<String> getCategory();

	int interCount(int category_num);

	int boardCount(String month);

}
