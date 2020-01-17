package com.meet.me.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Hashtag;

@Repository
public class HashtagDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> getHashtagAll() {
		return null;
	}

	public List<Hashtag> gethashtag(String title) {
		title = "%" + title + "%";
		return sqlSession.selectList("Hashtags.getHashtag", title);
	}

	public int searchHashtag(String hashtag) {
		if (sqlSession.selectOne("Hashtags.searchHashtag", hashtag) != null)
			return Integer.parseInt(sqlSession.selectOne("Hashtags.searchHashtag", hashtag));
		return -1;
	}

}
