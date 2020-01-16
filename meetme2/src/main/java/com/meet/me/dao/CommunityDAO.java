package com.meet.me.dao;

import java.util.List;

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

}
