package com.blank.app.event.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blank.app.event.service.EventService;
import com.blank.app.member.vo.MemberVo;

@RequestMapping("/attendance")
@Controller
public class EventController {
	
	@Autowired
	private EventService es;
	
	// 출석부 화면 도출
	@GetMapping
	public String attendance() {
		
		return "event/attendance";
		
	}
	
	@PostMapping
	public String attendanceOn(HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		int result = es.attendance(loginMember);
		
		return "redirect:event/attendance";
		
	}

}
