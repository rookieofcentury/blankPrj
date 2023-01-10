package com.blank.app.chatbot.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.chatbot.service.ChatbotService;
import com.blank.app.chatbot.vo.ChatbotVo;
import com.blank.app.quit.vo.QuitVo;
import com.blank.app.report.vo.ReportVo;

@Controller
@RequestMapping("chatbot")
public class ChatbotController {

	@Autowired
	private ChatbotService chatbotService;
	
	@GetMapping("main")
	public String main(Model model, HttpSession session, String no) {
		
		List<ChatbotVo> voList = chatbotService.selectList();
		
		session.setAttribute("voList", voList);
		model.addAttribute("voList", voList);
		model.addAttribute("no", no);
		
		return "chatbot/main";
	}
	
	// 선택한 질문에 따른 답변 조회
	@GetMapping("answer")
	@ResponseBody
	public String answer(ChatbotVo chatbotVo) {
		
		String selectAnswer = chatbotService.selectAnswer(chatbotVo);
		
		if (selectAnswer == null) {
			return "error";
		}

		return selectAnswer;
		
	}
	
}
