package com.blank.app.chat.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface ChatDao {

	int chatRoom(SqlSessionTemplate sst, Map<String, String> map);
	
	int msgSend(SqlSessionTemplate sst, Map<String, String> map);


}
