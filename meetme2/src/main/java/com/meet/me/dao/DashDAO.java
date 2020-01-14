package com.meet.me.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Dash;
@Repository
public class DashDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Dash dashInter(int category_num) {
		return sqlSession.selectOne("User_interests.dashInter",category_num);
	}

	public void allcatNum() {
		// TODO Auto-generated method stub
		
	}
	
	
}
