package com.meet.me.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Message;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int sendMsg(Message msg) {
		return sqlSession.insert("Community.sendMsg", msg);
	}

}
