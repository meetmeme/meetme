package com.meet.me.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class DashDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void getInterests() {
		sqlSession.selectList("User_interests.getInter");
	}
	
	
}
