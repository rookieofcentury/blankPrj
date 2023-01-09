package com.blank.app.chatbot.service;

import java.util.List;

import com.blank.app.chatbot.vo.ChatbotVo;

public interface ChatbotService {

	String selectAnswer(ChatbotVo chatbotVo);

	List<ChatbotVo> selectList();

}
