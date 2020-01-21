package com.meet.me.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Message;
import com.meet.me.domain.Notice;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int sendMsg(Message msg) {
		return sqlSession.insert("Community.sendMsg", msg);
	}

	public List<Notice> getNotification(int id) {
		return sqlSession.selectList("Community.getNotification", id+"");
	}

	public int checkNotice(String notice_num) {
		return sqlSession.update("Community.checkNotice", notice_num);
	}

	public void addNotification(int user_num, String title, String content) {
		Map<String, String> notice = new HashMap<String, String>();
		notice.put("user_num", user_num+"");
		notice.put("title", title);
		notice.put("content", content);
		
		sqlSession.insert("Community.addNotification", notice); 
	}

}
