package com.meet.me.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Event;
import com.meet.me.domain.User;
@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> getCategory() {
		return sqlSession.selectList("Events.getCategory");
	}

	public List<Event> getIntrestingEvent(String id) {
		return sqlSession.selectList("Events.getIntrestingEvent", id);
	}
	
	public Event getDetail(int event_num) {
		return sqlSession.selectOne("Events.getDetail", event_num);
	}

	public List<Event> search(Map<String, String> keywords) {
		return sqlSession.selectList("Events.search", keywords);
	}

	public List<Event> searchDate(Map<String, String> keywords) {
		return sqlSession.selectList("Events.searchDate", keywords);
	}

	public List<Event> searchHash(String hashtag) {
		return sqlSession.selectList("Events.searchHash", hashtag);
	}
	
	public int attend(int event) {
		return sqlSession.selectOne("Events.attend", event);
	}

	public List<User> getUser(int event) {
		return sqlSession.selectList("Events.getUser", event);
	}

	public List<Event> searchCat(String category) {
		return sqlSession.selectList("Events.searchCat", category);

	}

}
