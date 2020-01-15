package com.meet.me.service;

import java.util.List;

import com.meet.me.domain.Event;

public interface EventService {
	public List<String> getCategory();
	public List<Event> getIntrestingEvent(String id);

}
 