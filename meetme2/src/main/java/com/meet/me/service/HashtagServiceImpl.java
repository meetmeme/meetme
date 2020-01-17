package com.meet.me.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meet.me.dao.HashtagDAO;
import com.meet.me.domain.Hashtag;

@Service
public class HashtagServiceImpl implements HashtagService{
	@Autowired
	private HashtagDAO dao;

	@Override
	public List<Hashtag> getHashtag(String title) {
		return dao.gethashtag(title);
	}

	@Override
	public int searchHashtag(String hashtag) {
		return dao.searchHashtag(hashtag);
	}
	
}
