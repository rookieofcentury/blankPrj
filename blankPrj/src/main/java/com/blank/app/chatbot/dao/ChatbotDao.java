package com.blank.app.chatbot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.chatMessage.vo.ChatMessageVo;
import com.blank.app.chatbot.vo.ChatbotVo;

public interface ChatbotDao {

	String selectAnswer(SqlSessionTemplate sst, ChatbotVo chatbotVo);

	List<ChatbotVo> selectList(SqlSessionTemplate sst);

	List<ChatMessageVo> selectMsgList(SqlSessionTemplate sst, Map<String, String> map);

}
