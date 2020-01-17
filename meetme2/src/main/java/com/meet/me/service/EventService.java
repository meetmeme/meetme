package com.meet.me.service;

import java.util.List;
import java.util.Map;

import com.meet.me.domain.Event;
public interface EventService {
	public List<String> getCategory();
	public List<Event> getIntrestingEvent(String id);
	public Event getDetail(int event);
	public List<Event> search(Map<String, String> keywords);
	public List<Event> searchHash(Map<String, String> keywords);
	public List<Event> searchDate(Map<String, String> keywords);
}
 