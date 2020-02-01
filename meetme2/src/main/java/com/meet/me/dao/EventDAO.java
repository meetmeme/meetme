package com.meet.me.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meet.me.domain.Attendee;
import com.meet.me.domain.Event;
import com.meet.me.domain.EventComment;
import com.meet.me.domain.Gallery;
import com.meet.me.domain.Hashtag;
import com.meet.me.domain.User;
@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> getCategory() {
		return sqlSession.selectList("Events.getCategory");
	}

	public List<Event> getIntrestingEvent(List<String> InterestingCats) {
		Map<String, Object> userInfo = new HashMap<String, Object>();
		userInfo.put("InterestingCats", InterestingCats);
		return sqlSession.selectList("Events.getIntrestingEvent", userInfo);
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

	public int insertEvent(Event event) {
		return sqlSession.insert("Events.insertEvent", event);
	}

	public Hashtag has(String tag) {
		return sqlSession.selectOne("Events.has", tag);
	}	

	public int insertTagUse(int tag_num, int event_num) {
		Map<String, Integer> num = new HashMap<String, Integer>();
		num.put("tag_num", tag_num);
		num.put("event_num", event_num);
		return sqlSession.insert("Events.insertTagUse",num);
	}

	public void insertHashtag(String title) {
		sqlSession.insert("Events.insertHashtag", title);
	}

	public int getnum(String id) {
		return sqlSession.selectOne("Events.num", id);
	}

	public int getEventnum() {
		return sqlSession.selectOne("Events.Eventnum");
	}

	public void insertGallery(Gallery gall) {
		sqlSession.insert("Events.Gallery", gall);
	}

	public List<Gallery> getGall(int event) {
		return sqlSession.selectList("Events.getGall", event);
	}

	public List<Hashtag> getHashtag(int event) {
		return sqlSession.selectList("Events.getHashtag",event);
	}

	public List<Event> alleventinfo(int u_num) {
		return sqlSession.selectList("Events.alleventinfo",u_num);
	}

	public List<Event> expectedeventinfo(int u_num) {
		return sqlSession.selectList("Events.expecteventinfo",u_num);
	}

	public List<Event> pasteventinfo(int u_num) {
		return sqlSession.selectList("Events.pasteventinfo",u_num);
	}
	public int getRemain(int event) {
		return sqlSession.selectOne("Events.getRemain", event);
	}

	public int isAttend(Attendee att) {
		return sqlSession.selectOne("Events.isAttend", att);
	}

	public int insertAttend(Attendee att) {
		return sqlSession.insert("Events.insertAttend", att);
	}

	public int cancelAttend(Attendee att) {
		return sqlSession.delete("Events.cancelAttend", att);
	}

	public int writeComment(EventComment co) {
		return sqlSession.insert("Events.writeComment", co);
	}

	public List<EventComment> getComment(int event) {
		return sqlSession.selectList("Events.getComment", event);
	}

}
