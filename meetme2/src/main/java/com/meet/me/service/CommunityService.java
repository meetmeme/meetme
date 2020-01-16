package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.Message;
import com.meet.me.domain.Notice;

public interface CommunityService {
	public int sendMsg(Message msg);

	public List<Notice> getNotification(int id);

	public int checkNotice(String notice_num);

}
 