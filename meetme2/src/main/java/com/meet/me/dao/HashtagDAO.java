package com.meet.me.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HashtagDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> getHashtagAll() {
		return null;
	}

	public List<String> gethashtag(String title) {
		title = "%"+title+"%";
		return sqlSession.selectList("Hashtags.getHashtag", title);
	}

}
