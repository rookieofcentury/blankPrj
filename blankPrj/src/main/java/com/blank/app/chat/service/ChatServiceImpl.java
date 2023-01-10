package com.blank.app.chat.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.chat.dao.ChatDao;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int chatRoom(Map<String, String> map) {
		return chatDao.chatRoom(sst, map);
	}
	
	@Override
	public int msgSend(Map<String, String> map) {
		return chatDao.msgSend(sst, map);
	}


}
