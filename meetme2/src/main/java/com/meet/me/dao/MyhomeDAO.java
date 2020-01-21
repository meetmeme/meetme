package com.meet.me.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.MyHome;
import com.meet.me.domain.User;

@Repository
public class MyhomeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MyHome getinfo(String user_id) {
		return sqlSession.selectOne("Myhomes.info", user_id);
	}

	public List<User> search(Map<String, String> keywords) {
		return sqlSession.selectList("Myhomes.search", keywords);
	}

	public List<User> searchHash(String hashtag) {
		return sqlSession.selectList("Myhomes.searchHash", hashtag);
	}

	public void update(MyHome myhome) {
		sqlSession.update("Myhomes.update", myhome);
	}

	
}
