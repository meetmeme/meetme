package com.meet.me.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> getCategory() {
		return sqlSession.selectList("Events.getCategory");
	}

}
