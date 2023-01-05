package com.blank.app.event.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blank.app.event.service.EventService;
import com.blank.app.member.vo.MemberVo;

@RequestMapping("/attendance")
@Controller
public class EventController {
	
	@Autowired
	private EventService es;
	
	// 출석부 화면 도출
	@GetMapping
	public String attendance(HttpSession session) {
		
		MemberVo vo = (MemberVo) session.getAttribute("loginMember");
		
		boolean isCheck = es.selectTodayAtt(vo.getNo());
		List<String> list = es.selectAttList(vo.getNo());
		
		session.setAttribute("isCheck", isCheck);
		session.setAttribute("attList", list);
		
		return "event/attendance";
		
	}
	
	@PostMapping
	@ResponseBody
	public String attendanceOn(String no, HttpSession session) {
		
		int result = es.attendance(no);
		if(result == 0) {
			return "fail";
		}
		
		return "success";
		
	}

}
