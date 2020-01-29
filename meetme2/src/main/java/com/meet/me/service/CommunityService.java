package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.Message;
import com.meet.me.domain.Notice;

public interface CommunityService {
	public int sendMsg(Message msg);

	public List<Notice> getNotification(int id);

	public int readNotice(String notice_num);

	public void addNotification(int user_num, String title, String content);

	public int checkNotification(String user_num);

}
 