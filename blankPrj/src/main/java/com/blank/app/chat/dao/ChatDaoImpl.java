package com.blank.app.chat.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDaoImpl implements ChatDao{

	@Override
	public int chatRoom(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.insert("chatMapper.chatRoom", map);
	}
	
	@Override
	public int msgSend(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.insert("chatMapper.msgSend", map);
	}


}
