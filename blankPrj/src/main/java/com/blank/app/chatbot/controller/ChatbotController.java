package com.blank.app.chatbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("chatbot")
public class ChatbotController {

	@GetMapping("main")
	public String main() {
		return "chatbot/main";
	}
	
}
