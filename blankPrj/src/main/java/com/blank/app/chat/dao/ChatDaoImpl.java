package com.blank.app.chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.blank.app.chat.vo.ChatVo;
import com.blank.app.chatMessage.vo.ChatMessageVo;

@Repository
public class ChatDaoImpl implements ChatDao{

	@Override
	public int chatRoom(SqlSessionTemplate sst, String sendNo) {
		return sst.insert("chatMapper.chatRoom", sendNo);
	}
	
	@Override
	public int msgSend(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.insert("chatMapper.msgSend", map);
	}

	@Override
	public List<ChatMessageVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("chatMapper.selectList");
	}


}
