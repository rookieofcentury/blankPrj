package com.blank.app.chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.blank.app.chat.vo.ChatVo;
import com.blank.app.chatMessage.vo.ChatMessageVo;

public interface ChatDao {

	int chatRoom(SqlSessionTemplate sst, String sendNo);
	
	int msgSend(SqlSessionTemplate sst, Map<String, String> map);

	List<ChatMessageVo> selectList(SqlSessionTemplate sst);


}
