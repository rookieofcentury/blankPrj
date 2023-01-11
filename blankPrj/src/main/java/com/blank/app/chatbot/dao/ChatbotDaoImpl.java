package com.blank.app.chatbot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.chatMessage.vo.ChatMessageVo;
import com.blank.app.chatbot.vo.ChatbotVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ChatbotDaoImpl implements ChatbotDao{
	
	@Override
	public List<ChatbotVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("chatbotMapper.selectList");
	}
	
	@Override
	public String selectAnswer(SqlSessionTemplate sst, ChatbotVo chatbotVo) {
		return sst.selectOne("chatbotMapper.selectAnswer", chatbotVo);
	}

	@Override
	public List<ChatMessageVo> selectMsgList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("chatbotMapper.selectMsgList", map);
	}

}
