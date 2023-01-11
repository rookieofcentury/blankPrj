package com.blank.app.chatbot.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blank.app.chatMessage.vo.ChatMessageVo;
import com.blank.app.chatbot.dao.ChatbotDao;
import com.blank.app.chatbot.vo.ChatbotVo;

@Service
public class ChatbotServiceImpl implements ChatbotService{

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ChatbotDao chatbotDao;
	
	@Override
	public List<ChatbotVo> selectList() {
		return chatbotDao.selectList(sst);
	}
	
	@Override
	public String selectAnswer(ChatbotVo chatbotVo) {
		return chatbotDao.selectAnswer(sst, chatbotVo);
	}

	@Override
	public List<ChatMessageVo> selectMsgList(Map<String, String> map) {
		return chatbotDao.selectMsgList(sst, map);
	}

}
