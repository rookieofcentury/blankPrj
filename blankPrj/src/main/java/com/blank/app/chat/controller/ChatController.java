package com.blank.app.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.chat.service.ChatService;
import com.blank.app.chat.vo.ChatVo;
import com.blank.app.chatMessage.vo.ChatMessageVo;

@Controller
@RequestMapping("chat")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("list")
	public String chatList(HttpServletRequest req, HttpSession session) {
		
		List<ChatMessageVo> voList = chatService.selectList();
		
		session.setAttribute("voList", voList);
		System.out.println(voList);
		return "chat/chatList";
	}
	
	@PostMapping("chatRoom")
	@ResponseBody
	public String chatRoom(String sendNo) {
		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("sendNo", sendNo);
//		map.put("receNo", receNo);
		
		int result = chatService.chatRoom(sendNo);
		
		return "실시간 상담이 연결되었습니다. 무엇을 도와드릴까요?";
	}
	
	
	@PostMapping("send")
	@ResponseBody
	public int msgSend(String sendNo, String receNo, String message) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sendNo", sendNo);
		map.put("receNo", receNo);
		map.put("message", message);
		
		int result = chatService.msgSend(map);
		
		System.out.println(map);
		
		return result;
	}
	
}
