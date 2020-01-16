package com.meet.me.dao;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int userCount() {
		return sqlSession.selectOne("Report.userCount");
	}

	public int eventCount() {
		return sqlSession.selectOne("Report.eventCount");
	}

	public List<String> userReport() {
		return sqlSession.selectList("Report.userReport");
	}

	public List<String> eventReport() {
		return sqlSession.selectList("Report.eventReport");
	}



}
