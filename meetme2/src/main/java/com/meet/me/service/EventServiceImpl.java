package com.meet.me.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.EventDAO;
import com.meet.me.domain.Event;
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

}
