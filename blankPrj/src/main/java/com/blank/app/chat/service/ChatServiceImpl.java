package com.blank.app.chat.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.chat.dao.ChatDao;
import com.blank.app.chat.vo.ChatVo;
import com.blank.app.chatMessage.vo.ChatMessageVo;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public int chatRoom(String sendNo) {
		return chatDao.chatRoom(sst, sendNo);
	}
	
	@Override
	public int msgSend(Map<String, String> map) {
		return chatDao.msgSend(sst, map);
	}

	@Override
	public List<ChatMessageVo> chatList(String receNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//채팅 목록 조회
	@Override
	public List<ChatMessageVo> selectList() {
		return chatDao.selectList(sst);
	}


}
