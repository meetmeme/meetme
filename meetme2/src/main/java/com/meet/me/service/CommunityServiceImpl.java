package com.meet.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.CommunityDAO;
import com.meet.me.domain.Message;
import com.meet.me.domain.Notice;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityDAO dao;

	@Override
	public int sendMsg(Message msg) {
		return dao.sendMsg(msg);
	}

	@Override
	public List<Notice> getNotification(int id) {
		return dao.getNotification(id);
	}

	@Override
	public int checkNotice(String notice_num) {
		return dao.checkNotice(notice_num);
	}

	@Override
	public void addNotification(int user_num, String title, String content) {
		dao.addNotification(user_num, title, content);
	}
	
}
