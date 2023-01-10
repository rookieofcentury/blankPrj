package com.blank.app.chat.service;

import java.util.List;
import java.util.Map;

import com.blank.app.chat.vo.ChatVo;
import com.blank.app.chatMessage.vo.ChatMessageVo;

public interface ChatService {

	int chatRoom(String sendNo);

	int msgSend(Map<String, String> map);

	List<ChatMessageVo> chatList(String receNo);

	List<ChatMessageVo> selectList();


}
