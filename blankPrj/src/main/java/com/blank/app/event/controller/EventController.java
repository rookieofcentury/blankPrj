package com.blank.app.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {
	
	// 출석부 화면 도출
	@GetMapping("/attendance")
	public String attendance() {
		return "event/attendance";
	}

}
