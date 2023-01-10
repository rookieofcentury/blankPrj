package com.blank.app.chat.service;

import java.util.Map;

public interface ChatService {

	int chatRoom(Map<String, String> map);

	int msgSend(Map<String, String> map);


}
