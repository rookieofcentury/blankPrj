package com.blank.app.chatbot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.chatMessage.vo.ChatMessageVo;
import com.blank.app.chatbot.service.ChatbotService;
import com.blank.app.chatbot.vo.ChatbotVo;
import com.blank.app.member.vo.MemberVo;
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
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginMember.getNo());
		
		if(no != null) {
			map.put("no", no);
		}
		
		//받는 사람, 보내는 사람 조회해야 함 (이전 채팅)
		//보내는 사람 메세지 조회
		List<ChatMessageVo> msgList = chatbotService.selectMsgList(map);
		
		
		session.setAttribute("voList", voList);
		model.addAttribute("voList", voList);
		model.addAttribute("no", no);
		model.addAttribute("msgList", msgList);
		
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
