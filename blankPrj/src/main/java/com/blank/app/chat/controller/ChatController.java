package com.blank.app.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.chat.service.ChatService;

@Controller
@RequestMapping("chat")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("main")
	public String main() {
		return "chat/main";
	}
	
	@PostMapping("chatRoom")
	@ResponseBody
	public String chatRoom(String sendNo, String receNo) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sendNo", sendNo);
		map.put("receNo", receNo);
		
		int result = chatService.chatRoom(map);
		
		return "실시간 상담이 연결되었습니다. 무엇을 도와드릴까요?";
	}
	
	
	@PostMapping("send")
	@ResponseBody
	public String msgSend(String sendNo, String receNo, String message) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sendNo", sendNo);
		map.put("receNo", receNo);
		map.put("message", message);
		
		int result = chatService.msgSend(map);
		
		return "뭔가 이상한데";
	}
	
}
