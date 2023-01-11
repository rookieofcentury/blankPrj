package com.blank.app.chatbot.service;

import java.util.List;
import java.util.Map;

import com.blank.app.chatMessage.vo.ChatMessageVo;
import com.blank.app.chatbot.vo.ChatbotVo;

public interface ChatbotService {

	String selectAnswer(ChatbotVo chatbotVo);

	List<ChatbotVo> selectList();

	List<ChatMessageVo> selectMsgList(Map<String, String> map);

}
