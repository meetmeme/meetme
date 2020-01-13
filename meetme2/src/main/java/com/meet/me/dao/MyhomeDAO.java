package com.meet.me.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.MyHome;

@Repository
public class MyhomeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public MyHome getinfo(String user_id) {
		return sqlSession.selectOne("Myhomes.info", user_id);
	}

	
}
