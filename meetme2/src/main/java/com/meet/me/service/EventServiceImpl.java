package com.meet.me.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.EventDAO;
import com.meet.me.domain.Event;
import com.meet.me.domain.Hashtag;
import com.meet.me.domain.User;
@Service
public class EventServiceImpl implements EventService{
	@Autowired
	private EventDAO dao;

	@Override
	public List<String> getCategory() {
		return dao.getCategory();
	}

	@Override
	public List<Event> getIntrestingEvent(String id) {
		return dao.getIntrestingEvent(id);
	}
	
	@Override
	public Event getDetail(int event_num) {		
		return dao.getDetail(event_num);
	}

	@Override
	public List<Event> search(Map<String, String> keywords) {
		return dao.search(keywords);
	}

	@Override
	public List<Event> searchDate(Map<String, String> keywords) {
		return  dao.searchDate(keywords);
	}

	@Override
	public List<Event> searchHash(String hashtag) {
		return dao.searchHash(hashtag);
	}

	@Override
	public int getAttend(int event) {
		return dao.attend(event);
	}

	@Override
	public List<User> getUser(int event) {
		return dao.getUser(event);
	}

	@Override
	public List<Event> searchCat(String category) {
		return dao.searchCat(category);
	}
	
	@Override
	public int insertEvent(Event event) throws Exception {		
		return dao.insertEvent(event);	
	}

	@Override
	public int has(String tag) {
		Hashtag hashtag = dao.has(tag);
		int result = 0;
		if(hashtag != null) 
			result = hashtag.getHASHTAG_NUM();
		System.out.println("태그 결과"+result);
		return result;
	}

	@Override
	public void insertTagUse(int tag_num) {
		dao.insertTagUse(tag_num);
		System.out.println("MM_HASHTAG_USE 추가함");
	}

	@Override
	public void insertHashtag(String title) {
		dao.insertHashtag(title);
		System.out.println("MM_HASHTAG 만듬");
	}

	@Override
	public int getUser_num(String id) {
		return dao.getnum(id);
	}

}
