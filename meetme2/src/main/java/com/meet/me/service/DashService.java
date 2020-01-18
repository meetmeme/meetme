package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.Follows;

public interface DashService {


	List<String> getCategory();

	int interCount(int category_num);

	int boardCount(String month);

	int dayCount(String day);

	List<Follows> follows();

}
