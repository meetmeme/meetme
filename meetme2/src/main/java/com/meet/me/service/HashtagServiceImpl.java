package com.meet.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.EventDAO;

@Service
public class HashtagServiceImpl implements HashtagService{
	@Autowired
	private EventDAO dao;

	@Override
	public List<String> getHashtag() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
