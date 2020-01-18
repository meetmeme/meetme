package com.meet.me.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Follows;
@Repository
public class DashDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<String> getCategory(Map<String, Object> map) {
		return sqlSession.selectList("Category.getCat");
	}

	public int interCount(int category_num) {
		return sqlSession.selectOne("User_interests.interCount", category_num);
	}

	public int boardCount(String month) {
		return sqlSession.selectOne("Myhomes.AllboardCount", month);
	}

	public int dayCount(String day) {
		return sqlSession.selectOne("Myhomes.AlldayCount", day);
	}

	public List<Follows> follows() {
		return sqlSession.selectList("Follows.followCount");
	}
	
	

}
